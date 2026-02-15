/* 
================================================================================
PROJECT: E-COMMERCE SALES ANALYSIS
AUTHOR: Y. Rithvesh
DATE: 05-02-2026
PLATFORM: SQLite (DB Browser for SQLite)
OBJECTIVE: Analyze the sales funnel, customer value, product revenue, and 
           traffic timing to optimize business strategy.
================================================================================
*/

-- -----------------------------------------------------------------------------
-- SECTION 1: THE SALES FUNNEL (Conversion Analysis)
-- Note: Funnel is calculated using DISTINCT users to avoid double-counting
-- -----------------------------------------------------------------------------
WITH 
views AS (
	SELECT COUNT(DISTINCT user_id) AS viewers 
	FROM events 
	WHERE event_type = 'view'
),
carts AS (
	SELECT COUNT(DISTINCT user_id) AS add_to_carts 
	FROM events 
	WHERE event_type = 'cart'
),
purchases AS (
	SELECT COUNT(DISTINCT user_id) AS buyers 
	FROM events 
	WHERE event_type = 'purchase'
)
SELECT
	viewers,
	add_to_carts,
	buyers,
	ROUND(add_to_carts * 100.0 / viewers, 2) AS view_to_cart_percent,
	ROUND(buyers * 100.0 / add_to_carts, 2) AS cart_to_purchase_percent,
	ROUND(buyers * 100.0 / viewers, 2) AS total_conversion_percent
FROM views, carts, purchases;


-- -----------------------------------------------------------------------------
-- SECTION 2: CUSTOMER ANALYSIS (VIP Detection)
-- -----------------------------------------------------------------------------
WITH top_vips AS (
	SELECT 
		user_id,
		COUNT(*) AS purchase_count
	FROM events
	WHERE event_type = 'purchase'
	GROUP BY user_id
	ORDER BY purchase_count DESC
	LIMIT 10
),
vip_spending AS (
	SELECT 
		e.user_id,
		SUM(e.price) AS total_spent
	FROM events e
	JOIN top_vips t ON e.user_id = t.user_id
	WHERE e.event_type = 'purchase'
	GROUP BY e.user_id
)
SELECT 
	v.user_id,
	v.purchase_count AS total_buys,
	s.total_spent AS total_revenue,
	ROUND(s.total_spent / v.purchase_count, 2) AS avg_order_value
FROM top_vips v
JOIN vip_spending s ON v.user_id = s.user_id
ORDER BY v.purchase_count DESC;


-- -----------------------------------------------------------------------------
-- SECTION 3: PRODUCT PERFORMANCE (Revenue vs. Volume)
-- -----------------------------------------------------------------------------
SELECT 
	category_id,
	COUNT(*) AS sales_volume,
	ROUND(SUM(price), 2) AS total_revenue,
	ROUND(AVG(price), 2) AS avg_item_price
FROM events
WHERE event_type = 'purchase'
GROUP BY category_id
ORDER BY total_revenue DESC
LIMIT 5;


-- -----------------------------------------------------------------------------
-- SECTION 4: CATEGORY CONVERSION RATES
-- -----------------------------------------------------------------------------
SELECT
	category_id,
	SUM(CASE WHEN event_type = 'view' THEN 1 ELSE 0 END) AS viewers,
	SUM(CASE WHEN event_type = 'purchase' THEN 1 ELSE 0 END) AS buyers,
	ROUND(
		100.0 *
		SUM(CASE WHEN event_type = 'purchase' THEN 1 ELSE 0 END) /
		NULLIF(SUM(CASE WHEN event_type = 'view' THEN 1 ELSE 0 END), 0),
		2
	) AS conversion_rate_pct
FROM events
WHERE category_id IS NOT NULL
GROUP BY category_id
HAVING SUM(CASE WHEN event_type = 'view' THEN 1 ELSE 0 END) > 1000
ORDER BY buyers DESC;


-- -----------------------------------------------------------------------------
-- SECTION 5: TRAFFIC ANALYSIS (Timing)
-- -----------------------------------------------------------------------------
SELECT 
	SUBSTR(event_time, 12, 2) AS hour_of_day, 
	COUNT(*) AS purchases
FROM events
WHERE event_type = 'purchase'
GROUP BY hour_of_day
ORDER BY hour_of_day;


-- -----------------------------------------------------------------------------
-- SECTION 6: DAILY PEAK
-- -----------------------------------------------------------------------------
SELECT
	SUBSTR(event_time, 1, 10) AS sale_date,
	COUNT(DISTINCT user_id) AS daily_buyers
FROM events
WHERE event_type = 'purchase'
GROUP BY sale_date
ORDER BY daily_buyers DESC
LIMIT 1;
