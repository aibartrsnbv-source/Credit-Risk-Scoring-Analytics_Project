-- Задача 1: Общий обзор портфеля
SELECT 
    SUM(loan_amount) AS total_loan_amount
    , AVG(interest_rate) AS avg_interest_rate
    , COUNT(DISTINCT customer_id) AS total_clients
FROM fact_loans;

--Задача 2: Риск-профиль по типу жилья
SELECT 
    dc.housing_status
    , COUNT(fl.loan_id) AS loans_number
    , AVG(fl.days_past_due) AS avg_delinquency
    , AVG(dc.credit_score) AS avg_credit_score
FROM dim_customers AS dc
INNER JOIN fact_loans AS fl ON dc.customer_id = fl.customer_id
GROUP BY dc.housing_status
ORDER BY avg_delinquency DESC;

--Задача 3: Сегментация клиентов по надежности
WITH client_categories AS (
    SELECT 
    customer_id
    , CASE
        WHEN credit_score > 700 THEN 'High'
        WHEN credit_score BETWEEN 600 AND 700 THEN 'Medium'
        ELSE 'Low'
      END AS cat
FROM dim_customers
)
SELECT 
    SUM(fl.days_past_due) AS total_delinquency
    , COUNT(fl.loan_id) AS loans_number
    , cc.cat AS client_category
FROM fact_loans AS fl
JOIN client_categories AS cc ON fl.customer_id = cc.customer_id
GROUP BY cc.cat;


-- Задача 4: Топ самых опасных целей кредитования
SELECT 
    loan_purpose
    , AVG(loan_amount) AS loan_per_purp
FROM fact_loans
WHERE loan_status = 'Default' OR days_past_due > 90
GROUP BY loan_purpose
HAVING AVG(loan_amount) > (SELECT AVG(loan_amount) FROM fact_loans);
