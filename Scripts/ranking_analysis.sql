-- which 5 products generate the highest revenue?
select TOP 5
    p.product_name,
    p.category,
    p.subcategory,
    sum(f.sales_amount) as total_revenue
from gold.fact_sales as f
    left join gold.dim_products as p
    on f.product_key = p.product_key
group by p.product_name, p.category, p.subcategory
order by total_revenue desc


-- what are the 5 products that are worst-performing in terms of sales?
select TOP 5
    p.product_name,
    p.category,
    p.subcategory,
    sum(f.sales_amount) as total_revenue
from gold.fact_sales as f
    left join gold.dim_products as p
    on f.product_key = p.product_key
group by p.product_name, p.category, p.subcategory
order by total_revenue asc;


-- Find the top 10 customers who are generated highest revenue
select top 10
    c.customer_key,
    c.first_name,
    c.last_name,
    SUM(f.sales_amount) AS total_revenue
from gold.fact_sales as f
    left join gold.dim_customers as c
    on f.customer_key = c.customer_key
group by c.customer_key, c.first_name, c.last_name
order by total_revenue desc;

-- Find the 3 customers with the fewest orders placed
select top 3
    c.customer_key,
    c.first_name,
    c.last_name,
    count(DISTINCT order_number) AS total_orders
from gold.fact_sales as f
    left join gold.dim_customers as c
    on f.customer_key = c.customer_key
group by c.customer_key, c.first_name, c.last_name
order by total_orders;

