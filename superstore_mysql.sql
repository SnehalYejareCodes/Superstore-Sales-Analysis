use superstore_db;

CREATE DATABASE SUPERSTORE_DB;
																
ALTER TABLE superstore_sales DROP COLUMN `Row ID`;
ALTER TABLE superstore_sales ADD COLUMN row_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY FIRST;

-- TOTAL ORDERS
SELECT COUNT(*) AS TOTAL_ORDERS FROM superstore_sales;

-- TOTAL SALES
SELECT ROUND(SUM(SALES)) AS total_sales FROM superstore_sales;

-- TOTAL NUMBER OF CUSTOMER
SELECT COUNT(distinct Customer_Name)AS TOTAL_CUSTOMER FROM superstore_sales;

-- Monthly Sales Trend
SELECT DATE_FORMAT(Order_Date, '%Y-%m') AS month,
SUM(Sales) AS monthly_sales
FROM superstore_sales
GROUP BY month
ORDER BY month;

-- Sales by Category
SELECT category, ROUND(SUM(sales))AS totalˍsales
FROM  superstore_sales
GROUP BY CATEGORY;

-- Top 10 Products by Sales
SELECT Product_Name, round(SUM(SALES)) AS TOTAL
FROM superstore_sales
GROUP BY Product_Name ORDER BY TOTAL DESC 
LIMIT 10;

-- Sales by customer segment
SELECT Segment,SUM(Sales) AS segment_sales
FROM superstore_sales
GROUP BY Segment;

-- Shipping mode usage
SELECT ship_mode,COUNT(*) AS total_orders,
AVG(DATEDIFF(ship_mode, Order_Date)) AS avg_delivery_days
FROM superstore_sales
GROUP BY ship_mode;

-- find customer who placed more than five orders
select customer_id, count(*) as order_count
from superstore_sales
group by customer_id
having count(*)>5;

-- rank products by sales amount
select product_id,
sum(sales)as total_sales,
rank() over(order by sum(sales)desc)as sales_rank
from superstore_sales
group by product_id;

-- find second highest sales in superstore sales data
select customer_name, sales from(
select customer_name,sales, dense_rank() over(order by sales desc)as srno from superstore_sales 
order by sales)as srn
where srno=2;

-- select customer_name ,sales from superstore_sales order by sales desc limit 1 offset 1;

-- select max(sales) from superstore_sales 
-- where sales <(select max(sales) from superstore_sales);

-- find the most frequent customer city
select city, count(*) as order_count
from superstore_sales
group by city
order by city desc limit 1;

-- Calculate variance and standard deviation of salary
select
round(variance(sales),2) as salary_variance,
round(stddev(sales),2) as salary_stanard_deviation
from superstore_sales;

