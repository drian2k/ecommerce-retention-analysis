-- Customer-level aggregates: Recency, Frequency, Monetary base metrics
SELECT 
    customer_id,
    MAX(invoice_date) AS last_purchase_date,
    COUNT(DISTINCT invoice) AS frequency,
    ROUND(SUM(quantity * price)::numeric, 2) AS monetary,
    MIN(invoice_date) AS first_purchase_date
FROM sales
GROUP BY customer_id
ORDER BY monetary DESC
LIMIT 20;