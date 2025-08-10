-- 1. View all customers
SELECT * FROM customers;

-- 2. Orders in July 2024
SELECT * FROM orders
WHERE order_date BETWEEN '2024-07-01' AND '2024-07-31'
ORDER BY order_date;

-- 3. Total revenue
SELECT SUM(total_amount) AS total_revenue FROM orders;

-- 4. Revenue by customer
SELECT customer_id, COUNT(*) AS orders_count, SUM(total_amount) AS total_spent
FROM orders
GROUP BY customer_id
ORDER BY total_spent DESC;

-- 5. Average order value
SELECT AVG(total_amount) AS avg_order_value FROM orders;

-- 6. Average revenue per user (ARPU)
SELECT AVG(total_spent) AS arpu
FROM (
    SELECT customer_id, SUM(total_amount) AS total_spent
    FROM orders
    GROUP BY customer_id
);

-- 7. Inner join: orders with customer names
SELECT o.order_id, o.order_date, c.name, o.total_amount
FROM orders o
INNER JOIN customers c ON o.customer_id = c.customer_id;

-- 8. Product-level sales
SELECT p.name AS product_name, SUM(oi.quantity) AS qty_sold, SUM(oi.quantity * oi.price) AS revenue
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
GROUP BY p.product_id, p.name
ORDER BY revenue DESC;

-- 9. Customers who never ordered
SELECT c.customer_id, c.name
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;

-- 10. Customers spending above average
SELECT customer_id, total_spent FROM (
    SELECT customer_id, SUM(total_amount) AS total_spent
    FROM orders
    GROUP BY customer_id
) t
WHERE total_spent > (SELECT AVG(total_spent) FROM (
    SELECT customer_id, SUM(total_amount) AS total_spent
    FROM orders
    GROUP BY customer_id
));

-- 11. Last order date per customer
SELECT c.name,
       (SELECT MAX(order_date) FROM orders o WHERE o.customer_id = c.customer_id) AS last_order
FROM customers c;

-- 12. Create view: Customer lifetime value
DROP VIEW IF EXISTS customer_ltv;
CREATE VIEW customer_ltv AS
SELECT customer_id, COUNT(*) AS orders_count, SUM(total_amount) AS lifetime_value
FROM orders
GROUP BY customer_id;

-- 13. Use the view
SELECT * FROM customer_ltv ORDER BY lifetime_value DESC;
