CREATE TABLE dim_customers (
    customer_id INT PRIMARY KEY
    , age INT
    , annual_income NUMERIC(15, 2)
    , employment_years INT
    , housing_status VARCHAR(50)
    , credit_score INT
);

CREATE TABLE fact_loans (
    loan_id INT PRIMARY KEY
    , customer_id INT REFERENCES dim_customers(customer_id)
    , loan_amount NUMERIC(15, 2)
    , term_months INT
    , interest_rate NUMERIC(5, 2)
    , loan_purpose VARCHAR(100)
    , days_past_due INT
    , loan_status VARCHAR(50)
);
