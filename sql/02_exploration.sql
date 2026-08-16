-- Row count and date range
SELECT 
    COUNT(*) AS total_rows,
    MIN(invoice_date) AS earliest_date,
    MAX(invoice_date) AS latest_date,
    COUNT(DISTINCT customer_id) AS unique_customers,
    COUNT(DISTINCT invoice) AS unique_invoices,
    COUNT(DISTINCT country) AS unique_countries
FROM sales;

-- Monthly revenue trend
SELECT 
    DATE_TRUNC('month', invoice_date) AS month,
    ROUND(SUM(quantity * price)::numeric, 2) AS monthly_revenue,
    COUNT(DISTINCT invoice) AS order_count,
    COUNT(DISTINCT customer_id) AS active_customers
FROM sales
GROUP BY DATE_TRUNC('month', invoice_date)
ORDER BY month;

-- Monthly revenue with month-over-month growth %
WITH monthly_revenue AS (
    SELECT 
        DATE_TRUNC('month', invoice_date) AS month,
        ROUND(SUM(quantity * price)::numeric, 2) AS revenue
    FROM sales
    GROUP BY DATE_TRUNC('month', invoice_date)
)
SELECT 
    month,
    revenue,
    LAG(revenue) OVER (ORDER BY month) AS prev_month_revenue,
    ROUND(
        ((revenue - LAG(revenue) OVER (ORDER BY month)) 
        / LAG(revenue) OVER (ORDER BY month)) * 100, 
    2) AS mom_growth_pct
FROM monthly_revenue
ORDER BY month;