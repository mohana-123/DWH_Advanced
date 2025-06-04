/*
===============================================================================
Cumulative Analysis
===============================================================================
Purpose:
    - To calculate running totals or moving averages for key metrics.
    - To track performance over time cumulatively.
    - Useful for growth analysis or identifying long-term trends.

SQL Functions Used:
    - Window Functions: SUM() OVER(), AVG() OVER()
===============================================================================
*/

-- Calculate the total sales per month 
-- and the running total of sales over time 

select
	order_date,
	total_sales,
	-- window function
	sum(total_sales) over(partition by order_date order by order_date) as running_total
from (
		select
			DATETRUNC(month, order_date) as order_date,
			SUM(sales_amount) as total_sales
		from gold.fact_sales
		where DATETRUNC(month, order_date) is not null
		group by DATETRUNC(month, order_date))t




-- moving avg of price
select
	order_date,
	total_sales,
	-- window function
	sum(total_sales) over(partition by order_date order by order_date) as running_total,
	avg(avg_price) over(partition by order_date order by order_date) as moving_avg_price
from (
		select
			DATETRUNC(year, order_date) as order_date,
			SUM(sales_amount) as total_sales,
			avg(price) as avg_price
		from gold.fact_sales
		where DATETRUNC(year, order_date) is not null
		group by DATETRUNC(year, order_date))t