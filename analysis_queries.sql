-- 1. Show all customers
SELECT *
FROM customers;

-- 2. Show all orders with customer names
SELECT 
    o.order_id,
    c.customer_name,
    o.order_date
FROM orders o
INNER JOIN customers c
ON o.customer_id = c.customer_id;

-- 3. Calculate total revenue for each product
SELECT
    p.product_name,
    SUM(p.price * o.quantity) AS total_revenue
FROM orders o
INNER JOIN products p
ON o.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_revenue DESC;

-- 4. Rank customers by total orders
SELECT
    c.customer_name,
    COUNT(o.order_id) AS total_orders,
    DENSE_RANK() OVER (
        ORDER BY COUNT(o.order_id) DESC
    ) AS ranking
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_name;

-- 5. Show average product price
SELECT
    AVG(price) AS average_price
FROM products;

-- 6. Customers with more than 1 order
SELECT
    c.customer_name,
    COUNT(o.order_id) AS order_count
FROM customers c
INNER JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_name
HAVING COUNT(o.order_id) > 1;
