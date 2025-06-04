-- Find the date of the first and last order
-- How many sales are available?
SELECT
    MIN(order_date) AS first_order_date,
    MAX(order_date) AS last_order_date,
    DATEDIFF(MONTH, MIN(order_date), MAX(order_date)) AS years_of_sales
FROM gold.fact_sales;

-- Find the youngest and oldest customers
SELECT
    MIN(birth_date) AS oldest_customer,
    DATEDIFF(YEAR, MIN(birth_date), GETDATE()) AS years_since_oldest_customer,
    MAX(birth_date) AS youngest_customer,
    DATEDIFF(YEAR, MAX(birth_date), GETDATE()) AS years_since_youngest_customer
FROM gold.dim_customers;