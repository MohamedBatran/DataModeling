-- . When is the peak season of our ecommerce?
SELECT EXTRACT(MONTH FROM order_date::DATE) AS month,
SUM(payment_value) AS total_sales
FROM "FactOrders"
GROUP BY month
ORDER BY total_sales DESC
LIMIT 1;

-- What time users are most likely to make an order or using the ecommerce app?
SELECT EXTRACT(HOUR FROM order_date::TIMESTAMP) AS order_hour,
COUNT(*) AS order_count
FROM "FactOrders"
GROUP BY order_hour
ORDER BY order_count DESC
LIMIT 1;

-- What is the preferred way to pay in the ecommerce?
SELECT payment_type,
COUNT(*) AS payment_count
FROM "FactOrders"
GROUP BY payment_type
ORDER BY payment_count DESC
LIMIT 1;

-- How many installments are usually done when paying in the ecommerce?
SELECT AVG(payment_installments) AS average_installments
FROM "FactOrders";

-- What is the average spending time for a user on our ecommerce?
SELECT "FactOrders".user_name,
AVG("FactOrders".delivered_date::DATE - "FactOrders".order_date::DATE) AS average_spending_time
FROM "FactOrders"
GROUP BY "FactOrders".user_name
ORDER BY average_spending_time DESC
LIMIT 1;

--What is the frequency of purchase on each state?
SELECT u.customer_state,
COUNT(o.order_id) AS purchase_frequency
FROM "FactOrders" o
JOIN "DimUser" u ON o.user_name = u.user_name
GROUP BY u.customer_state
ORDER BY purchase_frequency DESC;

--Which logistic route has heavy traffic in our ecommerce?
--??

--How many late delivered orders are there in our ecommerce? Are late orders affecting customer satisfaction?
SELECT COUNT(*) AS late_orders
FROM "FactOrders"
WHERE delivered_date::DATE > estimated_time_delivery::DATE;

--  Are late order affecting the customer satisfaction?
SELECT COUNT(*) AS late_orders,
AVG(feedback_score) AS average_feedback_score
FROM "FactOrders"
WHERE delivered_date::DATE > estimated_time_delivery::DATE;

-- How long are the delay for delivery / shipping process in each state?
SELECT u.customer_state,
AVG(o.delivered_date::DATE - o.estimated_time_delivery::DATE) AS average_delivery_delay
FROM "FactOrders" o
JOIN "DimUser" u ON o.user_name = u.user_name
WHERE o.delivered_date::DATE > o.estimated_time_delivery::DATE
GROUP BY u.customer_state
ORDER BY average_delivery_delay DESC;

-- How long are the difference between estimated delivery time and actual delivery time in each state?
SELECT u.customer_state,
AVG(o.delivered_date::DATE - o.estimated_time_delivery::DATE) AS average_delivery_difference
FROM "FactOrders" o
JOIN "DimUser" u ON o.user_name = u.user_name
GROUP BY u.customer_state
ORDER BY average_delivery_difference DESC;
