CREATE DATABASE ecommerce_db;
USE ecommerce_db;

SELECT * FROM customers;
SELECT * FROM orders;
SELECT * FROM products;
SELECT * FROM payments;



-- Write an SQL query to check if all Orders have a valid customer_id present in the Customers table.
SELECT customer_id 
FROM orders
WHERE customer_id NOT IN (SELECT customer_id FROM customers);


-- Write an SQL query to find unpaid orders (i.e., orders where no successful payment exists).
SELECT * , p.payment_status
FROM orders AS o
JOIN payments AS p ON o.order_id = p.order_id
WHERE p.payment_status != "Completed";

-- How can you verify that each Payment record correctly references an existing order_id?
SELECT order_id 
FROM payments 
WHERE payment_id NOT IN (SELECT order_id FROM orders);


-- Retrieve all customer details.
SELECT * FROM customers;

-- List all orders with their total amount and status.
SELECT * FROM orders;

-- Find all products that belong to the ‘Electronics’ category.
SELECT product_name FROM products WHERE category = "Electronics";


-- Find the total number of orders placed by each customer (customer_id and count).
SELECT c.customer_id, COUNT(o.customer_id) 
FROM customers as c
JOIN orders as o ON c.customer_id = o.customer_id
GROUP BY c.customer_id;


-- Retrieve a list of all orders, including customer names and order status.
SELECT o.order_id, o.customer_id, c.first_name, c.last_name , o.status
FROM customers as c
JOIN orders as o ON c.customer_id = o.customer_id;


-- Find the total revenue (sum of all orders) generated.
SELECT SUM(total_amount) as total_revenue 
FROM orders;


-- Identify customers who have placed more than 3 orders.
SELECT c.customer_id, c.first_name, c.last_name, COUNT(o.customer_id) as total_orders
FROM customers as c
JOIN orders as o ON c.customer_id = o.customer_id
GROUP BY c.customer_id,c.first_name, c.last_name
HAVING total_orders > 3;


-- Retrieve all completed payments and include the associated order details.
SELECT *, o.order_date,o.total_amount
FROM payments AS p
JOIN orders AS o ON p.order_id = o.order_id
WHERE p.payment_status = "Completed";


-- Find the top 5 customers who have spent the most on orders.
SELECT c.customer_id, c.first_name, c.last_name, c.email, SUM(o.total_amount) total_spent
FROM customers AS c
JOIN orders AS o ON c.customer_id = o.customer_id
GROUP BY c.customer_id,c.first_name, c.last_name, c.email
ORDER BY total_spent DESC
LIMIT 5;



-- List all orders where the payment was either ‘Pending’ or ‘Failed’.
SELECT o.order_id , p.payment_id, p.payment_status
FROM orders AS o
JOIN payments AS p ON p.order_id = o.order_id
WHERE p.payment_status = "Pending" OR p.payment_status = "Failed";



-- Find the most popular product category based on the number of orders.
SELECT p.category, COUNT(o.order_id) AS total_order_count
FROM products AS p
JOIN orders AS o ON p.product_id = o.product_id
GROUP BY p.category
ORDER BY  total_order_count DESC
LIMIT 1;


-- Identify orders that were placed but have no successful payment recorded.
SELECT o.order_id, o.customer_id, o.total_amount, o.status, p.payment_status
FROM orders AS o
JOIN payments AS p ON p.order_id = o.order_id
WHERE p.payment_status != "Completed";



-- Calculate the average order value (AOV) per customer.
SELECT c.customer_id, c.first_name, c.last_name, c.email,AVG(o.total_amount) AS average_orders
FROM customers AS c
JOIN orders AS o ON c.customer_id = o.customer_id
GROUP BY c.customer_id,c.first_name, c.last_name, c.email;



-- Identify which payment method is most commonly used.
SELECT payment_method, COUNT(payment_method) AS count
FROM payments
GROUP BY payment_method
ORDER BY count DESC
LIMIT 1;



-- Determine the percentage of orders that were canceled.
SELECT (SUM(CASE WHEN status = 'Cancelled' THEN 1 ELSE 0 END) * 100 / COUNT(*)) AS percentage
FROM orders;



-- Find out the month in which the most orders were placed.
SELECT MONTH(order_date) AS month, COUNT(*)
FROM orders 
GROUP BY MONTH(order_date)
LIMIT 1;

