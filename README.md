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

## 📂 Quick Structure
* `/SQL_files` — queries for data audit and segmentation.
* `/PowerBIfiles` — interactive `.pbix` dashboard file with image.
