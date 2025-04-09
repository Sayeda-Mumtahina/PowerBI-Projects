CREATE DATABASE SalesDB;
USE SalesDB;
CREATE TABLE sales_data (
    transaction_id VARCHAR(50) PRIMARY KEY,
    date DATE,
    product_category VARCHAR(100),
    product_name VARCHAR(100),
    units_sold INT,
    unit_price DECIMAL(10,2),
    total_revenue DECIMAL(10,2),
    region VARCHAR(50),
    payment_method VARCHAR(50)
);
-- total revenue per product category
SELECT product_category, SUM(total_revenue) AS total_sales
FROM sales_data
GROUP BY product_category
ORDER BY total_sales DESC; 
-- best-selling products
SELECT product_name, SUM(units_sold) AS total_units
FROM sales_data
GROUP BY product_name
ORDER BY total_units DESC
LIMIT 10; 
-- Monthly sales trend
SELECT DATE_FORMAT(date, '%Y-%m') AS month, SUM(total_revenue) AS total_sales
FROM sales_data
GROUP BY month
ORDER BY month; 
-- Region-wise revenue breakdown
SELECT region, SUM(total_revenue) AS total_sales
FROM sales_data
GROUP BY region
ORDER BY total_sales DESC;




