# E-Commerce Sales & Customer Retention Analysis

An end-to-end data analysis project investigating why revenue growth had stalled for a UK-based online gift wholesaler, using SQL, Python, and Power BI to uncover customer retention patterns, segment the customer base, and surface actionable business recommendations.


---

## Business Problem

The business wanted to understand why revenue had plateaued despite steady order volume — was it a retention problem, a product-mix problem, or a seasonal effect? This project answers that question using two years of real transaction data.

## Dataset

- **Source:** [Online Retail II](https://archive.ics.uci.edu/dataset/502/online+retail+ii), UCI Machine Learning Repository
- **Size:** ~1.07M raw transactions → 779,425 after cleaning
- **Period:** December 2009 – December 2011
- **Note:** Raw data files are not included in this repo due to size. Download from the link above and place in a `/data` folder to reproduce this analysis.

## Tools & Skills Demonstrated

| Tool | Applied For |
|---|---|
| **Python (pandas)** | Data cleaning, null/duplicate handling, RFM segmentation scoring |
| **PostgreSQL** | Data warehousing, window functions (LAG, RANK), CTEs, cohort retention calculation |
| **Power BI** | Data modeling, DAX measures, interactive 4-page dashboard |

## Project Structure

```
├── data/                       # (not included — see Dataset section above)
├── notebooks/
│   ├── 01_data_cleaning.ipynb  # Cleaning, deduplication, type fixes
│   └── 02_rfm_analysis.ipynb   # RFM scoring and customer segmentation
├── sql/
│   ├── 01_table_setup.sql
│   ├── 02_exploration.sql      # Monthly revenue trend, MoM growth (window functions)
│   ├── 03_customer_aggregates.sql  # Customer-level RFM base metrics
│   └── 04_cohort_retention.sql # Cohort retention % using CTEs
├── powerbi/
│   └── ecommerce_retention_dashboard.pbix
├── business_insights_summary.md
└── README.md
```

## Key Findings

- **Revenue is heavily concentrated:** the top 25% of customers ("Champions") generate 69% of total revenue — a significant concentration risk
- **A clear, actionable at-risk segment exists:** 353 high-value customers represent £1.09M in historical revenue and are strong win-back campaign candidates
- **Retention is seasonal, not purely loyalty-driven:** cohort analysis shows recurring activity spikes tied to specific calendar months across nearly every customer cohort
- **Year-over-year peak revenue was flat** (Nov 2010 vs Nov 2011), despite similar order volumes — worth further investigation

Full findings and business recommendations: [business_insights_summary.md](./business_insights_summary.md)

## Dashboard Overview

The Power BI dashboard includes four pages:

1. **Executive Overview** — revenue trend, AOV, order count, top countries
2. **Customer Segmentation** — RFM-based segment breakdown, revenue concentration, recency/frequency scatter plot
3. **Product Performance** — top products by revenue and by volume sold
4. **Cohort Retention** — month-by-month retention heatmap across all customer cohorts

## How to Reproduce

1. Download the dataset from the [UCI link above](https://archive.ics.uci.edu/dataset/502/online+retail+ii) and place `online_retail_II.xlsx` in a `/data` folder
2. Run `notebooks/01_data_cleaning.ipynb` to produce `cleaned_sales.csv`
3. Load `cleaned_sales.csv` into a PostgreSQL database using the schema in `sql/01_table_setup.sql`
4. Run the queries in `sql/02_exploration.sql`, `sql/03_customer_aggregates.sql`, and `sql/04_cohort_retention.sql`, exporting results as needed
5. Run `notebooks/02_rfm_analysis.ipynb` to generate `rfm_segmented.csv`
6. Open `powerbi/ecommerce_retention_dashboard.pbix` in Power BI Desktop and refresh the data connections

## Data Notes & Limitations

- Rows with missing Customer ID (~23% of raw data) were excluded, as the analysis focuses on identifiable customer behavior
- December figures in both years reflect partial months (data cuts off Dec 9), so month-over-month growth involving December should be interpreted with that in mind
- No product category field exists in the source data, so product analysis is based on individual SKU performance rather than category-level trends

---

*This project was built as a portfolio piece to demonstrate SQL, Python, and Power BI skills for data analyst roles.*
