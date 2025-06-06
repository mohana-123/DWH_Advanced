-- Find total customers by countries
SELECT
    country,
    COUNT(customer_key) AS total_customers
FROM gold.dim_customers
GROUP BY country
ORDER BY total_customers DESC;


-- Find total customers by gender
-- Find total customers by countries
SELECT
    gender,
    COUNT(customer_key) AS total_customers
FROM gold.dim_customers
GROUP BY gender
ORDER BY total_customers DESC;


-- Find total products by category
SELECT
    category,
    COUNT(product_key) AS total_products
from gold.dim_products
GROUP BY category
ORDER BY total_products DESC;


-- what is the average costs by each category?
SELECT
    category,
    AVG(cost) AS average_cost
FROM gold.dim_products
GROUP BY category
ORDER BY average_cost DESC;

-- what is the total revenue generated for each category?
SELECT
    p.category,
    SUM(f.sales_amount) AS total_revenue
FROM gold.fact_sales AS f
    LEFT JOIN gold.dim_products AS p
    ON p.product_key = f.product_key
GROUP BY p.category
ORDER BY total_revenue DESC;


-- Find total revenue is generated by each customer
select
    c.customer_key,
    c.first_name,
    c.last_name,
    sum(f.sales_amount) AS total_revenue
from gold.fact_sales as f
    left join gold.dim_customers as c
    on c.customer_key = f.customer_key
group by c.customer_key, c.first_name, c.last_name
order by total_revenue desc;


-- what is the distribution of sold items across countries? (like find total quantity by country)

select
    c.country,
    sum(f.quantity) AS total_sold_items
from gold.fact_sales as f
    left join gold.dim_customers as c
    on c.customer_key = f.customer_key
group by c.country
order by total_sold_items desc;