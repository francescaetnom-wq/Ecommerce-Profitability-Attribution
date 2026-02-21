-- OBJECTIVE: Break down Profit and Revenue by Traffic Source.
-- BUSINESS VALUE: Moves the focus from vanity metrics (Revenue) to actual Gross Profit.

WITH marketing_data AS (
  SELECT 
    u.traffic_source,
    oi.sale_price,
    p.cost,
    oi.user_id
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
  ROUND(SUM(sale_price), 2) AS revenue,
  ROUND(SUM(sale_price - cost), 2) AS gross_profit,
  -- Calculate Profit Margin Percentage
  ROUND((SUM(sale_price - cost) / SUM(sale_price)) * 100, 2) AS profit_margin_pct
FROM 
  marketing_data
GROUP BY 1
ORDER BY gross_profit DESC;