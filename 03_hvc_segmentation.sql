-- OBJECTIVE: Identify High-Value Customers (HVC) based on "Hero Category" purchases.
-- BUSINESS VALUE: Creates a high-ROI audience for targeted retention and lookalike campaigns.

WITH user_profitability AS (
  SELECT 
    u.id AS user_id,
    u.email,
    u.traffic_source,
    p.category,
    oi.sale_price - p.cost AS net_profit,
    oi.status
  FROM 
    `bigquery-public-data.thelook_ecommerce.order_items` AS oi
  JOIN 
    `bigquery-public-data.thelook_ecommerce.users` AS u ON oi.user_id = u.id
  JOIN 
    `bigquery-public-data.thelook_ecommerce.products` AS p ON oi.product_id = p.id
  WHERE 
    oi.status = 'Complete' 
)
SELECT 
  user_id,
  traffic_source,
  COUNT(category) AS high_margin_items_bought,
  ROUND(SUM(net_profit), 2) AS total_user_profit
FROM 
  user_profitability
WHERE 
  category IN ('Blazers & Jackets', 'Accessories', 'Suits & Sport Coats', 'Outerwear & Coats')
GROUP BY 1, 2
HAVING total_user_profit > 150 
ORDER BY total_user_profit DESC
LIMIT 10;