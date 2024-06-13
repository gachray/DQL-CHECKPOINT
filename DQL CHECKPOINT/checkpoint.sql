-- Displaying all columns for all customers from the Customer table
SELECT *
FROM Customer;


-- Displaying product_name and category for products within a specific price range
SELECT product_name, category
FROM Product
WHERE price BETWEEN 5000 AND 10000;


-- Displaying all columns for all products, sorted by price in descending order
SELECT *
FROM Product
ORDER BY price DESC;


-- Calculating aggregate values for orders
SELECT 
    COUNT(*) AS total_orders,
    AVG(total_amount) AS average_amount,
    MAX(total_amount) AS highest_total_amount,
    MIN(total_amount) AS lowest_total_amount
FROM Orders;


-- Counting the number of orders for each product_id
SELECT product_id, COUNT(*) AS num_orders
FROM Orders
GROUP BY product_id;


-- Displaying customer_id for customers who have placed more than 2 orders
SELECT customer_id
FROM Orders
GROUP BY customer_id
HAVING COUNT(*) > 2;


-- Counting orders per month for the year 2020
SELECT 
    MONTH(order_date) AS order_month,
    COUNT(*) AS num_orders
FROM Orders
WHERE YEAR(order_date) = 2020
GROUP BY MONTH(order_date);


-- Retrieving product_name, customer_name, and order_date for each order
SELECT p.product_name, c.customer_name, o.order_date
FROM Orders o
JOIN Product p ON o.product_id = p.product_id
JOIN Customer c ON o.customer_id = c.customer_id;


-- Retrieving orders made exactly three months ago
SELECT *
FROM Orders
WHERE order_date >= DATE_SUB(CURDATE(), INTERVAL 3 MONTH)
  AND order_date < CURDATE();


-- Finding customers who have no corresponding orders in the Orders table
SELECT c.customer_id
FROM Customer c
LEFT JOIN Orders o ON c.customer_id = o.customer_id
WHERE o.customer_id IS NULL;
