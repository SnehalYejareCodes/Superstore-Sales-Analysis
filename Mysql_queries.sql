use superstore_db;

CREATE DATABASE SUPERSTORE_DB;
																
ALTER TABLE superstore_sales DROP COLUMN `Row ID`;
ALTER TABLE superstore_sales ADD COLUMN row_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY FIRST;

-- TOTAL ORDERS
SELECT COUNT(*) AS TOTAL_ORDERS FROM superstore_sales;

-- TOTAL SALES
SELECT ROUND(SUM(SALES)) AS total_sales FROM superstore_sales;

-- TOTAL NUMBER OF CUSTOMER
SELECT COUNT(distinct `Customer Name`)AS TOTAL_CUSTOMER FROM superstore_sales;

-- Monthly Sales Trend
SELECT DATE_FORMAT(`Order Date`, '%Y-%m') AS month,SUM(Sales) AS monthly_sales
FROM superstore_sales
GROUP BY month
ORDER BY month;

-- Sales by Category
SELECT category, ROUND(SUM(sales))AS totalˍsales
FROM  superstore_sales
GROUP BY CATEGORY;

-- Top 10 Products by Sales
SELECT `Product Name`, round(SUM(SALES)) AS TOTAL
FROM superstore_sales
GROUP BY `Product Name`ORDER BY TOTAL DESC 
LIMIT 10;

-- Sales by customer segment
SELECT Segment,SUM(Sales) AS segment_sales
FROM superstore_sales
GROUP BY Segment;

-- Shipping mode usage
SELECT `Ship Mode`,COUNT(*) AS total_orders,
AVG(DATEDIFF(`Ship Date`, `Order Date`)) AS avg_delivery_days
FROM superstore_sales
GROUP BY `Ship Mode`;




