create database NovaCartDB

use NovaCartDB


--Understanding data of each table

select top 10 * from customers

select top 10 * from products

select top 10 * from sellers

select top 10 * from orders

select top 10 * from order_items

select top 10 * from order_payments

select top 10 * from order_reviews

select * from product_category_name_translation

--product_category_name_translation contain header in a second row so we will create a view in which we 
--will rank the table using cte and then manually change the name of the columns and then take values from
--the seconf row (Not a good approach)

select * from INFORMATION_SCHEMA.COLUMNS where TABLE_NAME = 'product_category_name_translation'


create view correct_header_category_tanslation as
with ranked_cte as(
	select *, ROW_NUMBER() over(order by (select null)) as rnk
	from product_category_name_translation
) 
select 
	column1 as product_category_name,
	column2 as product_category_name_english
from ranked_cte
where rnk > 1


select * into category_name_translation from correct_header_category_tanslation

select * from category_name_translation

drop table product_category_name_translation


--Data profilling






--customer table

select * from customers

--Count of rows

select count(*) as row_count from customers     --99441

--Checking thatis there any duplicate customer id's
select count(distinct customer_id) as row_count from customers     --All Rows are unique

--Checking null values
select
SUM(case when customer_zip_code_prefix is null then 1 else 0 end) as NullZipCode,   --zip code contains 994 null values
SUM(CASE when customer_city is null then 1 else 0 end) as NullCity,
SUM(case when customer_state is null then 1 else 0 end) as NullState
FROM Customers;

--Checking typing mistake exists or not

select 
	count(distinct customer_city) as distict_city,
	count(distinct UPPER(ltrim(rtrim(customer_city)))) as clean_city
from customers


select 
	count(distinct customer_state) as distict_city,
	count(distinct UPPER(ltrim(rtrim(customer_state)))) as clean_city
from customers

select distinct customer_city from customers
where customer_city like 's%'
order by customer_city



--orders
select * from orders

select count(*) from orders   --99461

select count(distinct order_id) from orders   -- 20 order ids are duplicte

select distinct order_status from orders  -- contains same value twice Cancelled & canceled

select 
	SUM(case when order_id is null then 1 else 0 end) as order_id,
	SUM(case when customer_id is null then 1 else 0 end) as cus_id,
	SUM(case when order_status is null then 1 else 0 end) order_status,
	SUM(case when order_purchase_timestamp is null then 1 else 0 end) o_p_D,
	SUM(case when order_approved_at is null then 1 else 0 end) o_A_D,         -- null values rows are 160
	SUM(case when order_delivered_carrier_date is null then 1 else 0 end) ODCarD,    -- null values are 1783
	SUM(case when order_delivered_customer_date is null then 1 else 0 end) ODCusD,    -- null values are 3928
	SUM(case when order_estimated_delivery_date is null then 1 else 0 end) OEDD
from orders

--we will check for dates because order can not be delivered before purchase 

select *  from orders
where order_purchase_timestamp > order_delivered_customer_date



---Payments

select * from order_payments

select count(*) from order_payments  -- 103886

select count(distinct order_id) from order_payments  -- 4446  duplicate records exists

select distinct payment_sequential from order_payments
order by payment_sequential

select * from order_payments

select distinct payment_type from order_payments -- credit card exists three time and debit crad 2 times in upper or lower case

select distinct payment_installments from order_payments
order by payment_installments           -- The minimun value is -1 that is impossible & maximum is 24

select distinct payment_value from order_payments
order by payment_value

select 
	SUM(case when order_id is null then 1 else 0 end) as order_id,
	SUM(case when payment_sequential is null then 1 else 0 end) as payment_sequential,
	SUM(case when payment_type is null then 1 else 0 end) payment_type, ---1038 missing values
	SUM(case when payment_installments is null then 1 else 0 end) payment_installments,
	SUM(case when payment_value is null then 1 else 0 end) payment_value
from order_payments

select * from order_payments





--Product

select * from products

select count(*) from products   --32951

select count(distinct product_id) from products 

SELECT * FROM Products
WHERE product_weight_g < 0;   --Multiple negative values exists

SELECT * FROM Products
WHERE product_name_lenght < 0

SELECT * FROM Products
WHERE product_description_lenght < 0

SELECT * FROM Products
WHERE product_height_cm < 0

SELECT * FROM Products
WHERE product_photos_qty < 0

SELECT * FROM Products
WHERE product_height_cm < 0

select * from products

select 
	SUM(case when product_id is null then 1 else 0 end) as product_id,
	SUM(case when product_category_name is null then 1 else 0 end) as product_category_name,   --1259 missing
	SUM(case when product_name_lenght is null then 1 else 0 end) product_name_lenght,   --610 missing
	SUM(case when product_description_lenght is null then 1 else 0 end) product_description_lenght,   --935 missing
	SUM(case when product_photos_qty is null then 1 else 0 end) product_photos_qty,      --610 missing
	SUM(case when product_weight_g is null then 1 else 0 end) product_weight_g,    --2 missing
	SUM(case when product_length_cm is null then 1 else 0 end) product_length_cm,    -- 2 missing
	SUM(case when product_height_cm is null then 1 else 0 end) product_height_cm       --2 missing
from products




-- order_items


select * from order_items

select count(*) from order_items   --112650

select distinct order_item_id from order_items
order by order_item_id

select * from order_items
where price < 0

select * from order_items
where freight_value < 0

select 
	SUM(case when order_id is null then 1 else 0 end) as order_id,
	SUM(case when product_id is null then 1 else 0 end) as product_id,
	SUM(case when order_item_id is null then 1 else 0 end) order_item_id,
	SUM(case when seller_id is null then 1 else 0 end) seller_id ,
	SUM(case when shipping_limit_date is null then 1 else 0 end) shipping_limit_date,       
	SUM(case when price is null then 1 else 0 end) price,    
	SUM(case when freight_value is null then 1 else 0 end) freight_value  
from order_items




--order_reviews

select * from order_reviews

select count(*) from order_reviews   --99224

select count(distinct review_id) from order_reviews -- 98410 duplicate or missing values exists

select * from order_reviews where review_score > 5 or review_score < 0  --review score exists more than 5 invalid

select 
	SUM(case when order_id is null then 1 else 0 end) as order_id,
	SUM(case when review_id is null then 1 else 0 end) as review_id,
	SUM(case when review_score is null then 1 else 0 end) review_score,   --1978 missing values
	SUM(case when review_creation_date is null then 1 else 0 end) review_creation_date ,
	SUM(case when review_answer_timestamp is null then 1 else 0 end) review_answer_timestamp
from order_reviews


--[dbo].[category_name_translation]

select * from category_name_translation

select count(*) from category_name_translation   --71

select 
	SUM(case when product_category_name is null then 1 else 0 end) as product_category_name,
	SUM(case when product_category_name_english is null then 1 else 0 end) as product_category_name_english
from category_name_translation

select 
	count(distinct product_category_name) as PCN,
	count(distinct UPPER(ltrim(rtrim(product_category_name)))) as Clear_PCNE,
	count(distinct product_category_name_english) as PCN,
	count(distinct UPPER(ltrim(rtrim(product_category_name_english)))) as Clear_PCNE
from category_name_translation






---Data Cleaning


--Customer

--customer_zip_code_prefix  -- Since we can not calculate and aso can not delete this because 
--customers are important so we will replace null values with 0

select * from customers
where customer_zip_code_prefix is null   ---before update 994 rows

update customers set customer_zip_code_prefix = 0
where customer_zip_code_prefix is null                       --994 rows affected

select * from customers
where customer_zip_code_prefix = 0            ---994 rows it's mean we have updated records correctly



--orders

--order_id  - first we will confirm that is records are really duplicate

select order_id, count(*) from orders
group by order_id
having count(*) > 1            ---20 records are shown but we have to confirm it by each column are identical or not

select * from orders
group by order_id, customer_id, order_status, order_purchase_timestamp, order_approved_at, order_delivered_carrier_date,
	order_delivered_customer_date, order_estimated_delivery_date
having count(*) > 1         ---By running this query we can say that each values are identical so we can delte those

--We will usee cte for deleting the duplicate records

with cte as(
	select *,
		ROW_NUMBER() over(partition by order_id order by order_id) as rnk
	from orders
)
delete from cte
where rnk > 1              ---20 records are affected meand query is right

---Confirm it once 

select order_id, count(*) from orders
group by order_id
having count(*) > 1              --No records are showing meand we did it right


---order_approved_at, order_delivered_carrier_date, order_delivered_customer_date
--  In this conditions null values posible because might happen that order was cancel, 
--  payment failed or approveal was pending so we can not modify it




--order_payments

--order_id  - First confirm that it's similar or not

select order_id,count(*) from order_payments
group by order_id
having count(*) > 1           --order id's are similar 

select * from order_payments
group by order_id, payment_sequential, payment_type, payment_installments, payment_value
having count(*) > 1            ---but each column does not have the similar values so we can not delete those

--Duplicates are possible because some customers have gift card also so there payment were calculated twice in the list

--payment type

select distinct payment_type from order_payments
where payment_type like 'c%'

update order_payments 
set payment_type = 'credit card'
where payment_type in ('credit_card', 'CreditCard', 'CARD', 'credit card')

select distinct payment_type from order_payments
where payment_type like 'c%'           --Now ony one value exists

select distinct payment_type from order_payments
where payment_type like 'd%'

update order_payments 
set payment_type = 'Debit Card'
where payment_type in ('debit_card')

--We also have some nul values and we also have a value where it is mentioned 
--that not defined so we can replace nulls with not defined

update order_payments
set payment_type = 'not defined'
where payment_type is null

select distinct payment_type from order_payments   ---now we have changed null to not defined

--payment_installments  - it has negative values so we will replace it with 1

update order_payments
set payment_installments = 1
where payment_installments < 0

select * from order_payments where payment_installments < 0  -- now no negative values exists




--products

--product_weight_g  - since we can not derive it so we will keep it null 

update products
set product_weight_g = null
where product_weight_g < 0

select * from products where product_weight_g < 0

--now we will replace null with median

with median_cte as(
	select 
		PERCENTILE_CONT(0.5) within group(order by product_weight_g) over() as median
	from products
	where product_weight_g is not null
)
update products
set product_weight_g  = ( select top 1 median from median_cte)
where product_weight_g is null

select * from products where product_weight_g is null or product_weight_g < 0

alter table products 
drop column product_name_lenght, product_description_lenght, product_photos_qty

with median_cte as(
	select 
		PERCENTILE_CONT(0.5) within group(order by product_length_cm) over() as median
	from products
	where product_weight_g is not null
)
update products
set product_length_cm  = ( select top 1 median from median_cte)
where product_length_cm is null

with median_cte as(
	select 
		PERCENTILE_CONT(0.5) within group(order by product_height_cm) over() as median
	from products
	where product_weight_g is not null
)
update products
set product_height_cm  = ( select top 1 median from median_cte)
where product_height_cm is null

with median_cte as(
	select 
		PERCENTILE_CONT(0.5) within group(order by product_width_cm) over() as median
	from products
	where product_weight_g is not null
)
update products
set product_width_cm  = ( select top 1 median from median_cte)
where product_width_cm is null


--product_category_name - since we can not derive it we will make it unknown

update products
set product_category_name= 'unknown'
where product_category_name is null

--product_name_lenght, product_description_lenght, product_photos_qty
--We will keep this valuees as null because it does not have too much importants

--product_weight_g, product_length_cm, product_height_cm
--we will keep it null later we will convert it with median


--order_items  -- have no issues


--order_reviews  - first we will check that each columns are same or not

select * from order_reviews
group by review_id, order_id, review_score, review_creation_date, review_answer_timestamp, review_comment_message, review_comment_title
having count(*) > 1                --Each columns are not same so we will keep those rows


--review_score - we will replace 6 with 5 which is maximum

update order_reviews
set review_score = 5
where review_score = 6

--We will replace null with mean

update order_reviews
set review_score = (
	select avg(review_score) from order_reviews
	where review_score is not null
)
where review_score is null

