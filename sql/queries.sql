
-- =====================================================
-- QUERY 1: MONTHLY REVENUE ANALYSIS
-- =====================================================

SELECT
    strftime('%Y-%m', o.order_purchase_timestamp) AS order_month,
    COUNT(DISTINCT o.order_id) AS total_orders,
    ROUND(SUM(oi.price), 2) AS monthly_revenue

FROM orders AS o

JOIN order_items AS oi
    ON o.order_id = oi.order_id

WHERE o.order_purchase_timestamp IS NOT NULL

GROUP BY order_month

ORDER BY order_month;
# ============================================================
# 16. STATE-WISE CUSTOMER AND REVENUE ANALYSIS
# ============================================================

state_analysis_query = """
SELECT
    c.customer_state AS state,

    COUNT(DISTINCT c.customer_unique_id) AS total_customers,

    COUNT(DISTINCT o.order_id) AS total_orders,

    ROUND(SUM(oi.price), 2) AS total_revenue

FROM customers AS c

JOIN orders AS o
    ON c.customer_id = o.customer_id

JOIN order_items AS oi
    ON o.order_id = oi.order_id

GROUP BY c.customer_state

ORDER BY total_revenue DESC

LIMIT 10;
"""

state_analysis = pd.read_sql_query(
    state_analysis_query,
    conn
)

display(state_analysis)


-- ============================================================
-- QUERY 2: TOP 10 REVENUE-GENERATING CATEGORIES
-- ============================================================

SELECT
    COALESCE(
        t.product_category_name_english,
        p.product_category_name,
        'Unknown'
    ) AS category,
    ROUND(SUM(oi.price), 2) AS total_revenue,
    COUNT(DISTINCT oi.order_id) AS total_orders
FROM order_items AS oi
JOIN products AS p
    ON oi.product_id = p.product_id
LEFT JOIN category_translation AS t
    ON p.product_category_name = t.product_category_name
GROUP BY category
ORDER BY total_revenue DESC
LIMIT 10;


-- ============================================================
-- QUERY 3: STATE-WISE CUSTOMER AND REVENUE ANALYSIS
-- ============================================================

SELECT
    c.customer_state AS state,
    COUNT(DISTINCT c.customer_unique_id) AS total_customers,
    COUNT(DISTINCT o.order_id) AS total_orders,
    ROUND(SUM(oi.price), 2) AS total_revenue
FROM customers AS c
JOIN orders AS o
    ON c.customer_id = o.customer_id
JOIN order_items AS oi
    ON o.order_id = oi.order_id
GROUP BY c.customer_state
ORDER BY total_revenue DESC
LIMIT 10;


-- ============================================================
-- QUERY 4: AVERAGE DELIVERY TIME BY STATE
-- ============================================================

WITH delivery_data AS (
    SELECT
        o.order_id,
        c.customer_state AS state,
        julianday(o.order_delivered_customer_date)
        - julianday(o.order_purchase_timestamp) AS delivery_days
    FROM orders AS o
    JOIN customers AS c
        ON o.customer_id = c.customer_id
    WHERE o.order_status = 'delivered'
      AND o.order_delivered_customer_date IS NOT NULL
      AND o.order_purchase_timestamp IS NOT NULL
)
SELECT
    state,
    COUNT(DISTINCT order_id) AS delivered_orders,
    ROUND(AVG(delivery_days), 2) AS avg_delivery_days
FROM delivery_data
GROUP BY state
ORDER BY avg_delivery_days DESC;


-- ============================================================
-- QUERY 5: LATE DELIVERY VS CUSTOMER REVIEWS
-- ============================================================

SELECT
    CASE
        WHEN o.order_delivered_customer_date >
             o.order_estimated_delivery_date
        THEN 'Late Delivery'
        ELSE 'On-Time Delivery'
    END AS delivery_status,
    COUNT(DISTINCT o.order_id) AS total_orders,
    ROUND(AVG(r.review_score), 2) AS average_review_score
FROM orders AS o
JOIN order_reviews AS r
    ON o.order_id = r.order_id
WHERE o.order_status = 'delivered'
  AND o.order_delivered_customer_date IS NOT NULL
  AND o.order_estimated_delivery_date IS NOT NULL
  AND r.review_score IS NOT NULL
GROUP BY delivery_status
ORDER BY average_review_score DESC;


-- ============================================================
-- QUERY 6: PAYMENT METHODS AND INSTALLMENT ANALYSIS
-- ============================================================

SELECT
    payment_type,
    payment_installments,
    COUNT(DISTINCT order_id) AS total_orders,
    ROUND(SUM(payment_value), 2) AS total_payment_value,
    ROUND(AVG(payment_value), 2) AS average_payment_value
FROM order_payments
GROUP BY
    payment_type,
    payment_installments
ORDER BY total_orders DESC;


-- ============================================================
-- QUERY 7: CUSTOMER ORDERING PATTERNS
-- ============================================================

SELECT
    CASE strftime('%w', order_purchase_timestamp)
        WHEN '0' THEN 'Sunday'
        WHEN '1' THEN 'Monday'
        WHEN '2' THEN 'Tuesday'
        WHEN '3' THEN 'Wednesday'
        WHEN '4' THEN 'Thursday'
        WHEN '5' THEN 'Friday'
        WHEN '6' THEN 'Saturday'
    END AS order_weekday,
    CAST(strftime('%w', order_purchase_timestamp) AS INTEGER)
        AS weekday_number,
    CAST(strftime('%H', order_purchase_timestamp) AS INTEGER)
        AS order_hour,
    COUNT(DISTINCT order_id) AS total_orders
FROM orders
WHERE order_purchase_timestamp IS NOT NULL
GROUP BY weekday_number, order_hour
ORDER BY weekday_number, order_hour;


-- ============================================================
-- QUERY 8: AVERAGE REVIEW SCORE BY PRODUCT CATEGORY
-- ============================================================

WITH review_per_order AS (
    SELECT
        order_id,
        AVG(review_score) AS average_review_score
    FROM order_reviews
    WHERE review_score IS NOT NULL
    GROUP BY order_id
),
order_category AS (
    SELECT DISTINCT
        oi.order_id,
        COALESCE(
            t.product_category_name_english,
            p.product_category_name,
            'Unknown'
        ) AS category
    FROM order_items AS oi
    JOIN products AS p
        ON oi.product_id = p.product_id
    LEFT JOIN category_translation AS t
        ON p.product_category_name = t.product_category_name
)
SELECT
    oc.category,
    COUNT(DISTINCT oc.order_id) AS total_orders,
    ROUND(AVG(r.average_review_score), 2) AS average_review_score
FROM order_category AS oc
JOIN review_per_order AS r
    ON oc.order_id = r.order_id
GROUP BY oc.category
ORDER BY average_review_score DESC;

-- ============================================================
-- QUERY 9: TOP 10 SELLERS BY REVENUE
-- ============================================================

SELECT
    s.seller_id,
    s.seller_state,
    COUNT(DISTINCT oi.order_id) AS total_orders,
    COUNT(oi.order_item_id) AS total_items_sold,
    ROUND(SUM(oi.price), 2) AS total_revenue
FROM sellers AS s
JOIN order_items AS oi
    ON s.seller_id = oi.seller_id
GROUP BY
    s.seller_id,
    s.seller_state
HAVING COUNT(DISTINCT oi.order_id) >= 100
ORDER BY total_revenue DESC
LIMIT 10;
