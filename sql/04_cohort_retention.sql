-- Cohort retention analysis with percentage
WITH customer_cohort AS (
    SELECT 
        customer_id,
        DATE_TRUNC('month', MIN(invoice_date)) AS cohort_month
    FROM sales
    GROUP BY customer_id
),

customer_activity AS (
    SELECT 
        s.customer_id,
        c.cohort_month,
        DATE_TRUNC('month', s.invoice_date) AS activity_month,
        (DATE_PART('year', s.invoice_date) - DATE_PART('year', c.cohort_month)) * 12 +
        (DATE_PART('month', s.invoice_date) - DATE_PART('month', c.cohort_month)) AS month_number
    FROM sales s
    JOIN customer_cohort c ON s.customer_id = c.customer_id
),

cohort_size AS (
    SELECT 
        cohort_month,
        COUNT(DISTINCT customer_id) AS total_customers
    FROM customer_cohort
    GROUP BY cohort_month
),

cohort_counts AS (
    SELECT 
        cohort_month,
        month_number,
        COUNT(DISTINCT customer_id) AS active_customers
    FROM customer_activity
    GROUP BY cohort_month, month_number
)

SELECT 
    cc.cohort_month,
    cc.month_number,
    cc.active_customers,
    cs.total_customers AS cohort_size,
    ROUND(cc.active_customers::numeric / cs.total_customers * 100, 1) AS retention_pct
FROM cohort_counts cc
JOIN cohort_size cs ON cc.cohort_month = cs.cohort_month
ORDER BY cc.cohort_month, cc.month_number;