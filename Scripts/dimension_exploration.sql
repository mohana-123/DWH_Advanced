-- Explore all countries our customers come from
SELECT DISTINCT country
FROM gold.dim_customers;

-- Explore all the product categories "The Major and Minor Divisions"
SELECT DISTINCT category,
    subcategory,
    product_name
from gold.dim_products
ORDER BY category, subcategory, product_name;