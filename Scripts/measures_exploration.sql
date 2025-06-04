/*
-- Find the total sales
SELECT
    SUM(sales_amount) AS total_sales
FROM gold.fact_sales;

-- Find how many items were sold
SELECT
    SUM(quantity) AS total_quantity
FROM gold.fact_sales;

-- Find avg selling price
SELECT
    AVG(price) AS avg_selling_price
FROM gold.fact_sales;

-- Find the total number of orders
SELECT
    COUNT(DISTINCT order_number) AS total_orders
FROM gold.fact_sales;

SELECT
    COUNT(order_number) AS total_orders
FROM gold.fact_sales;

-- Find the total number of products
SELECT
    COUNT(product_key) AS total_products
FROM gold.dim_products;

SELECT
    COUNT(DISTINCT product_key) AS total_products
FROM gold.dim_products;

-- Find the total number of customers
SELECT
    COUNT(DISTINCT customer_key) AS total_customers
FROM gold.dim_customers;

-- Find the total number of customers who made a purchase
SELECT
    COUNT(DISTINCT customer_key) AS total_customers_with_purchase
FROM gold.fact_sales;
*/


-- Generate a report that shows all the key metrics of the business
-- Find the total sales
    SELECT 'Total Sales' AS measure_name, SUM(sales_amount) AS measure_value
    FROM gold.fact_sales
UNION ALL

    -- Find how many items were sold
    SELECT 'Total Quantity', SUM(quantity)
    FROM gold.fact_sales
UNION ALL

    -- Find avg selling price
    SELECT 'Average price', AVG(price)
    FROM gold.fact_sales
UNION ALL

    -- Find the total number of orders
    SELECT 'Total no.of orders', COUNT(DISTINCT order_number)
    FROM gold.fact_sales
UNION ALL

    -- Find the total number of products
    SELECT 'Total no.of Products', COUNT(DISTINCT product_name)
    FROM gold.dim_products
UNION ALL

    -- Find the total number of customers
    SELECT 'Total no.of customers', COUNT(DISTINCT customer_key)
    FROM gold.dim_customers;