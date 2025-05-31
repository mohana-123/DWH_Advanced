select * from gold.fact_sales;

-- changes over years
select 
	year(order_date) as order_year,
	sum(sales_amount) as total_sales,
	COUNT(distinct customer_key) as total_customers,
	SUM(quantity) as total_quantity
from gold.fact_sales
where order_date is not null
group by year(order_date)
order by year(order_date)


-- changes over months
select 
	YEAR(order_date) as order_year,
	MONTH(order_date) as order_month,
	sum(sales_amount) as total_sales,
	COUNT(distinct customer_key) as total_customers,
	SUM(quantity) as total_quantity
from gold.fact_sales
where order_date is not null
group by YEAR(order_date), MONTH(order_date)
order by YEAR(order_date), MONTH(order_date)
