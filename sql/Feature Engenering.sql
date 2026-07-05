use NovaCartDB


---DimCustomer

create view DimCustomer as
with CustomerMatrix as
(
select 
	customer_unique_id,
	customer_city,
	customer_state,
	MIN(order_purchase_timestamp) as FirstPurchaseDate,
	MAX(order_purchase_timestamp) as LastPurchaseDate,
	COUNT(distinct o.order_id) as TotalOrders,
	SUM(payment_value) as TotalRevenue,
	(SUM(payment_value) / COUNT(distinct o.order_id)) as AverageOrderValue,
	DATEDIFF(day, MIN(order_purchase_timestamp), MAX(order_purchase_timestamp)) as CustomerTenure,
	DATEDIFF(day, MAX(order_purchase_timestamp), (select MAX(order_purchase_timestamp) from orders)) as DaysFromLastPurchase,
	case 
	 when DATEDIFF(day, MIN(order_purchase_timestamp), MAX(order_purchase_timestamp)) = 0 then 0
	 else
		(COUNT(distinct o.order_id) / DATEDIFF(day, MIN(order_purchase_timestamp), MAX(order_purchase_timestamp)))
	end as PurchaseFrquency,
	case
		when DATEDIFF(day, MAX(order_purchase_timestamp), (select MAX(order_purchase_timestamp) from orders)) < 90 then 'Active'
		when DATEDIFF(day, MAX(order_purchase_timestamp), (select MAX(order_purchase_timestamp) from orders)) < 180 then 'Inactive'
		else 'Churn'
	end as CustomerStatus
from customers as c
join orders as o
on c.customer_id = o.customer_id
join order_payments as op
on op.order_id = o.order_id
group by customer_unique_id, customer_city, customer_state
), CustomerRank as
(
select *, 
	NTILE(5) over(order by TotalRevenue desc) as RevenueGroup
from CustomerMatrix
)
select *,
	case	
		when RevenueGroup = 1 then 'Platinum'
		when RevenueGroup = 2 then 'Gold'
		when RevenueGroup = 3 then 'Silver'
		when RevenueGroup = 4 then 'Bronze'
		Else 'Basic'
	end as CustomerTier
from CustomerRank

select * from DimCustomer




--DimProduct
select * from order_items

create view DimProduct as
select 
	p.product_id,
	product_category_name,
	product_weight_g,
	product_length_cm,
	product_height_cm,
	product_width_cm,
	COUNT(order_item_id) as QuanitytSold,
	SUM(price) as TotalRevenue,
	((SUM(price) / (select sum(price) from order_items)) * 100) as [RevenueContribution%],
	sum(freight_value) as freight_value,
	sum(price + freight_value) as Gross_Sales,
	(sum(price) / COUNT(Distinct oi.order_id)) as AveragePrice,
	COUNT(Distinct oi.order_id) as TotalOrders,
	AVG(review_score) as AverageRating,
	COUNT(distinct review_id) as ReviewCount,
	DENSE_RANK() over(order by SUM(price) desc) as RevenueRank,
	DENSE_RANK() over(order by sum(price + freight_value) desc) As GrossSalesRank
from products as p
join order_items as oi
on p.product_id = oi.product_id
join order_reviews as orr
on orr.order_id = oi.order_id
group by p.product_id, product_category_name, product_weight_g, product_length_cm, product_height_cm, product_width_cm

select * from DimProduct


--DImSeller
select * from sellers
select * from order_items
select * from orders
select * from order_payments

create view DimSeller as
select 
	s.seller_id,
	seller_city,
	seller_state,
	COUNT(distinct o.order_id) as TotalOrders,
	SUM(price) as TotalRevenue,
	COUNT(order_item_id) as TotalProductSold,
	COUNT(distinct customer_unique_id) as TotalCustomers,
	AVG(DATEDIFF(day, order_purchase_timestamp, order_delivered_customer_date)) as AverageDeliveryDays,
	AVG(review_score) as AverageRating,
	DENSE_RANK() over(order by SUM(price) desc) as RevenueRank
from sellers as s
join order_items as oi
on s.seller_id = oi.seller_id
join orders as o
on o.order_id = oi.order_id
join customers as c
on c.customer_id = o.customer_id
join order_reviews as orr
on orr.order_id = oi.order_id
group by s.seller_id, seller_city, seller_state

select * from DimSeller



--DimDate

select * from orders

create view DimDate as
select 
	order_purchase_timestamp as OrederDate,
	DAY(order_purchase_timestamp) as OrderDay,
	MONTH(order_purchase_timestamp) as OrderMonth,
	YEAR(order_purchase_timestamp) as OrderYear,
	DATEPART(QUARTER, order_purchase_timestamp) as QuarterOfOrderDate,
	DATEPART(WEEK, order_purchase_timestamp) as WeekOfOrder,
	DATENAME(weekday, order_purchase_timestamp) AS WeekdayName,
	DATENAME(month, order_purchase_timestamp) AS MonthName,
	CASE 
        WHEN DATENAME(weekday, order_purchase_timestamp) IN ('Saturday', 'Sunday') THEN 'yes'
        ELSE 'no'
    END AS is_weekend
from orders



--FactSales

create view FactSales as
select 
	o.order_id, order_item_id, customer_unique_id, oi.product_id, oi.seller_id,
	order_purchase_timestamp, order_approved_at, order_delivered_carrier_date, order_delivered_customer_date,
	order_estimated_delivery_date,
	DATEDIFF(day, order_purchase_timestamp, order_delivered_customer_date) as DeliveryDays,
	DATEDIFF(day, order_purchase_timestamp, order_approved_at) as ProcessingDays,
	DATEDIFF(day, order_approved_at, order_delivered_customer_date) as ShippingDays,
	case 
		when DATEDIFF(day, order_estimated_delivery_date, order_delivered_customer_date) < 0 then 0
		else DATEDIFF(day, order_estimated_delivery_date, order_delivered_customer_date)
	end as DeliveryDelay,
	order_status,
	price,
	freight_value,
	payment_value,
	payment_type,
	payment_installments,
	review_score
from orders as o
join
order_items as oi
on o.order_id = oi.order_id
join 
customers as c
on o.customer_id = c.customer_id
join
order_payments as op
on op.order_id = o.order_id
join
order_reviews  as orr
on orr.order_id = oi.order_id


select * from FactSales                 --117329
select * from DimSeller                 --3090
select * from DimCustomer				--96218
select * from DimProduct				--32789
select * from DimDate					--99441
