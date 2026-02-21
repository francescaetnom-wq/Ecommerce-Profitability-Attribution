-- OBJECTIVE: Analyze profitability at the intersection of channel and category.
-- BUSINESS VALUE: Reveals "Hero Categories" with margins significantly above average.

WITH product_metrics AS (
  SELECT 
    u.traffic_source,
    p.category,
    oi.sale_price,
    p.cost
  FROM 
    `bigquery-public-data.thelook_ecommerce.order_items` AS oi
  JOIN 
    `bigquery-public-data.thelook_ecommerce.users` AS u ON oi.user_id = u.id
  JOIN 
    `bigquery-public-data.thelook_ecommerce.products` AS p ON oi.product_id = p.id
  WHERE 
    oi.status NOT IN ('Cancelled', 'Returned')
)
SELECT 
  traffic_source,
  category,
  COUNT(*) AS units_sold,
  ROUND(SUM(sale_price - cost), 2) AS total_category_profit,
  ROUND((SUM(sale_price - cost) / SUM(sale_price)) * 100, 2) AS margin_pct
FROM 
  product_metrics
GROUP BY 1, 2
ORDER BY total_category_profit DESC
LIMIT 15;