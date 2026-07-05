use NovaCartDB

--customers

select * from customers

--Checking no null values exists or zip code customer_cit and customer_state

select * from customers
where customer_zip_code_prefix is null or customer_city is null or customer_state is null   ---No value is null

--Checking no similar values exists in upper or lower form in city and state

select 
	count(distinct customer_city) as city,
	count(distinct upper(ltrim(rtrim(customer_city)))) as clean_city,
	count(distinct customer_state) as states,
	count(distinct upper(ltrim(rtrim(customer_state)))) as clean_state
from customers            --the count of city and clear_city are same and also state so no similar values exists



--payment

select * from order_payments

--checking no null values exists for payment_sequential ,payment_type ,payment_installments ,payment_value

select * from order_payments
where payment_sequential is null or payment_type is null or payment_installments is null or payment_value is null -- no null values

--Checking that payment_sequential  payment_installments, payment_value does not contain null values

select * from order_payments
where payment_sequential < 0 or payment_installments < 0 or payment_value is null --No negative values

--Checking that payment_type values does not exists in lower or capital form

select 
	count(distinct payment_type) as payment_type,
	count(distinct upper(ltrim(rtrim(payment_type)))) as payment_type
from order_payments                -- values are similar


--orders

select * from orders

--Cheking that no column contains null values leaving approved date, deliveres at carrier data and deliverded customer date

select * from orders
where order_id is null or customer_id is null or order_status is null or order_purchase_timestamp is null or 
order_estimated_delivery_date is null              --no null values exists

--checking that order_status does not contain similar values in upper or lower letters

select 
	count(distinct order_status) as order_status,
	count(distinct lower(rtrim(ltrim(order_status)))) as clean_order_status
from orders              --we get no values

--But letter found that cancel exists two time as 'Cancelled' and 'canceled' There was double l that why we did not get the value

--so we will replcae it

update orders
set order_status = 'cancelled'
where order_status in ('Cancelled','canceled')

select distinct order_status from orders        --Now it is correct


--oeder_items

select * from order_items


--Cheking that column contains null values

select * from order_items
where order_id is null or order_item_id is null or product_id is null or seller_id is null or shipping_limit_date is null
	or price is null or freight_value is null          --no value is null


--Cheking no negative value exists for price and freight value

select * from order_items
where price < 0 or freight_value < 0           --no value is negative




----order_reviews

select * from order_reviews

--cheking that no column contain null value instead od title and message because they are not that
--important and review score can be null necause we will keep median there while doing FE

select * from order_reviews
where review_id is null or order_id is null or review_creation_date is null
	or review_answer_timestamp is null


--Cheking that review_score does not contain value less than 1 or more than 5

select * from order_reviews
where review_score  < 1 or review_score > 5         --No value exists

--cheking that review creation date should be less than answer date

select * from order_reviews
where review_creation_date > review_answer_timestamp           --No value exists



--products

select * from products

--checking that product-id and category should not be null

select * from products
where product_id is null or product_category_name is null            --no value exists

--cheking that weight height length width dhould not be negative

select * from products
where product_weight_g < 0 or product_length_cm < 0 or product_height_cm < 0 or product_width_cm < 0    --no value exsists


--selelrs

select * from sellers

--cheking that no value contain null values

select * from sellers
where seller_id is null or seller_zip_code_prefix is null  or seller_city is null or seller_state is null   -- no column have null values

--cheking that seller city and seller stata does not contain similar values in upper or lower casse 

select 
	count(distinct seller_city) as city,
	count(distinct upper(ltrim(rtrim(seller_city)))) as clean_city,
	count(distinct seller_state) as states,
	count(distinct upper(ltrim(rtrim(seller_state)))) as clean_state
from sellers                   --No value exists
