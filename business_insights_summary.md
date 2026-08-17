# E-Commerce Sales & Customer Retention Analysis
## Business Insights Summary

**Dataset:** Online Retail II (UCI Machine Learning Repository) — UK-based online gift wholesaler, transactions from Dec 2009 to Dec 2011
**Tools:** PostgreSQL, Python (pandas), Power BI

---

## 1. Data Overview

- **779,425** cleaned transaction line items (from an original ~1.07M rows)
- **23.1%** of raw rows were dropped due to missing Customer ID (guest/unlinked transactions) — these were excluded because the analysis centers on identifiable customer behavior
- **5,878** unique customers, **36,969** unique orders, **41** countries
- Average of **~21 line items per order**, consistent with a wholesale/bulk gift business rather than typical single-item retail

---

## 2. Revenue & Seasonality

- Revenue shows a **strong, consistent seasonal pattern**: growth spikes in **March, September, and October–November** each year, with **January–February** as the consistent low point
- The Nov 2010 peak (~£1.17M) and Nov 2011 peak (~£1.16M) were nearly identical — suggesting **flat year-over-year growth at peak demand**, despite similar order volumes and active customer counts in both periods
- December figures are artificially low in the dataset because both years' data cuts off on **Dec 9** — this is a partial month, not a real decline, and was explicitly excluded from month-over-month growth interpretation

**Business implication:** the business isn't shrinking, but it also isn't growing significantly at its most important demand periods — worth investigating whether this is a market ceiling, increased competition, or an execution gap (e.g., stockouts during peak season).

---

## 3. Customer Segmentation (RFM Analysis)

Using Recency, Frequency, and Monetary scoring, all 5,878 customers were segmented into six groups:

| Segment | Customers | % of Customers | Revenue | % of Revenue | Avg Revenue/Customer |
|---|---|---|---|---|---|
| Champions | 1,482 | 25.2% | £12,024,330 | 69.2% | £8,114 |
| Loyal Customers | 1,221 | 20.8% | £2,510,046 | 14.4% | £2,056 |
| At Risk | 353 | 6.0% | £1,090,694 | 6.3% | £3,090 |
| Needs Attention | 856 | 14.6% | £703,040 | 4.0% | £821 |
| Lost | 1,523 | 25.9% | £654,427 | 3.8% | £430 |
| New Customers | 443 | 7.5% | £392,267 | 2.3% | £885 |

**Key finding:** Revenue is heavily concentrated — **Champions (25% of customers) drive 69% of total revenue.** This is a significant business risk: the loss of even a modest share of this group would have an outsized impact on total revenue.

**Actionable finding:** The **At Risk segment** (353 customers) represents **£1.09M in historical revenue**, with the **highest average spend per customer of any non-Champion segment** (£3,090, higher than Loyal Customers). These are high-value customers who have gone quiet — a strong candidate list for a targeted win-back campaign.

**Lower priority:** The **Lost segment**, while the largest by customer count (25.9%), represents only 3.8% of revenue — low historical value, not worth heavy retention investment.

---

## 4. Cohort Retention

- Every cohort shows the expected pattern: **100% active in month 0** (their first purchase), followed by a **sharp drop-off** in month 1
- Retention doesn't decline in a straight line — it **fluctuates seasonally**, with visible upticks in customer activity recurring around the same calendar months across nearly every cohort (echoing the Sept–Nov demand spike seen in the overall revenue trend)
- This suggests retention is being **driven by calendar-based purchase triggers** (e.g., holiday gift buying) more than by loyalty-driven repeat behavior

**Business implication:** marketing and retention efforts may be more effective if timed around these known seasonal windows rather than applied uniformly year-round.

---

## 5. Product Performance

- Revenue leaders (e.g., Regency Cakestand, White Hanging Heart T-Light Holder) are decorative/gift items consistent with the business's wholesale gift positioning
- **Volume and revenue leaders don't fully overlap** — e.g., "World War 2 Gliders" was the top product by units sold but didn't appear in the revenue top 10, indicating a high-volume, low-price item
- With ~4,000 unique SKUs, a "bottom performers by revenue" analysis was not included, as the long tail is dominated by single-unit sales rather than meaningful underperformance signals

---

## 6. Recommendations

1. **Launch a targeted win-back campaign** for the 353 "At Risk" customers, prioritizing by historical spend — this is a bounded, high-value list rather than a mass campaign
2. **Protect the Champions segment** with a loyalty or account-management program — given they generate over two-thirds of revenue, retaining this group should be the top business priority
3. **Align seasonal inventory and marketing spend** with the confirmed Sept–Nov demand window rather than distributing budget evenly across the year
4. **Investigate the flat year-over-year peak revenue** (Nov 2010 vs Nov 2011) — determine whether this reflects a market ceiling, increased competition, or an internal execution issue (e.g., stock availability during peak demand)
5. Deprioritize broad retention spend on the "Lost" segment given its low historical value; consider a lightweight, low-cost re-engagement email rather than a resource-intensive campaign

---

*Analysis conducted using PostgreSQL (data querying, cohort analysis, window functions), Python/pandas (data cleaning, RFM scoring), and Power BI (dashboard, DAX measures, visualization).*
