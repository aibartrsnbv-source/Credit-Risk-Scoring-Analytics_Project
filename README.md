# Credit Risk & Borrower Scoring Analytics

An end-to-end data analytics project simulating a banking risk-management environment. It covers data validation in PostgreSQL, Star Schema modeling, and interactive visualization in Power BI.

## 🛠️ Tech Stack
* **Database:** PostgreSQL (CTEs, CASE WHEN, Joins, Filters)
* **BI & Data Modeling:** Power BI Desktop (Star Schema, DAX measures)
* **Design:** Financial Dark-Mode Dashboard Optimization

## 📊 Dashboard Preview
![Credit Risk Dashboard](PowerBIfiles/dashboard_preview.png)

## 💡 Key Insights Discovered
* **The Risk Paradox:** The **Low Credit Score** segment represents the lowest volume of issued loans, yet it exhibits an exponential surge in `Average Delinquency Days`.
* **Collateral Risk:** Borrowers who **Rent** or have an active **Mortgage** demonstrate lower payment discipline than outright property owners.
* **Toxic Capital Outflow:** Loans allocated for **Education** and **Personal** reasons carry the highest concentration of defaulted, toxic capital.

## 💻 SQL Analysis & Data Verification
To ensure data integrity, metrics were extracted and verified using PostgreSQL. Below are the analytical queries and their corresponding database outputs:

<details>
<summary><b>1. Credit Scoring & Risk Segmentation (Click to expand)</b></summary>

```sql
SELECT 
    CASE 
        WHEN dc.credit_score > 700 THEN '1. High'
        WHEN dc.credit_score >= 600 THEN '2. Medium'
        ELSE '3. Low'
    END AS credit_category,
    COUNT(fl.loan_id) AS number_of_loans,
    SUM(fl.days_past_due) AS total_delinquency_days
FROM fact_loans fl
JOIN dim_customers dc ON fl.customer_id = dc.customer_id
GROUP BY 1
ORDER BY 1;

## 📂 Quick Structure
* `/SQL_files` — queries for data audit and segmentation.
* `/PowerBIfiles` — interactive `.pbix` dashboard file with image.
