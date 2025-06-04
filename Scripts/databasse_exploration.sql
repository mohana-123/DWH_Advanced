-- Explore all data objects in the database
SELECT *
FROM information_schema.tables

-- Explore all columns in the database
SELECT *
FROM information_schema.columns
WHERE TABLE_NAME = 'dim_customers';

SELECT *
FROM information_schema.columns
WHERE TABLE_NAME = 'fact_sales';