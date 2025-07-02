
create database churn;

use churn

CREATE TABLE telecom_customers (customerID VARCHAR(20) PRIMARY KEY, 
 gender VARCHAR(10),
  SeniorCitizen INT,
  Partner VARCHAR(5),
  Dependents VARCHAR(5),
  tenure INT,
  PhoneService VARCHAR(5),
  MultipleLines VARCHAR(25),
  InternetService VARCHAR(25),
  OnlineSecurity VARCHAR(25),
  OnlineBackup VARCHAR(25),
  DeviceProtection VARCHAR(25),
  TechSupport VARCHAR(25),
  StreamingTV VARCHAR(25),
  StreamingMovies VARCHAR(25),
  Contract VARCHAR(25),
  PaperlessBilling VARCHAR(5),
  PaymentMethod VARCHAR(50),
  MonthlyCharges DECIMAL(10,2),
  TotalCharges DECIMAL(10,2),
  Churn VARCHAR(5)
);

select *from telecom_customers;
select  *from cleaned_churn

EXEC sp_help 'telecom_customers';
insert into telecom_customers select *from  cleaned_churn;
drop table cleaned_churn

select *from telecom_customers

---insights
--1.What is the total churn rate 

WITH churn_data AS (
  SELECT 
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers
  FROM telecom_customers
)
SELECT 
  ROUND(churned_customers * 100.0 / total_customers, 2) AS churn_rate_percentage
FROM churn_data;

--2.Churn Rate by contract type

 select contract, count(*) as total_customers, 
 sum(case when churn = 'yes' then 1 else 0 end) as churned_customers,
 round(sum(case when churn = 'yes' then 1 else 0 end) * 100.0 / count(*), 2)
 as churn_percentage

 from telecom_customers
 group by contract

 --3. Average Montly Charges by churn group
 
 select churn,round(avg(monthlycharges), 2) as avg_montly_charges
 from telecom_customers
 group by churn

 --4. Average Tenure by churn group

 select churn, round(avg(tenure),2) as avg_tenure
 from telecom_customers
 group by churn;

 --5. churn rate by internet service
 select internetservice,
 count(*) as total_customers,
 sum(case when churn = 'yes' then 1 else 0 end) as churned_customers,
 round(sum(case when churn = 'yes' then 1 else 0 end) * 100.0 / count(*), 2) as churn_percentage
 from telecom_customers
 group by InternetService

-- 6. senior citizen vs churn
  select seniorcitizen,
  count(*) as total_customers,
  sum(case when churn = 'yes' then 1 else 0 end) as churned_customers,
  round(sum(case when churn = 'yes' then 1 else 0 end) * 100.0/ count(*),2)
  as churn_percentage
  from telecom_customers
  group by seniorcitizen;

--7.churn rate by payment method

SELECT 
  PaymentMethod,
  COUNT(*) AS total_customers,
  SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
  ROUND(SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS churn_percentage
FROM telecom_customers
GROUP BY PaymentMethod;

--8. Paperless billing vs churn
SELECT 
  PaperlessBilling,
  COUNT(*) AS total_customers,
  SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
  ROUND(SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS churn_percentage
FROM telecom_customers
GROUP BY PaperlessBilling;

--9. Churn Based on Customers Using Streaming TV anad TechSupport
SELECT 
  StreamingTV,
  TechSupport,
  COUNT(*) AS total_customers,
  SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers
FROM telecom_customers
GROUP BY StreamingTV, TechSupport;

--10. High-Risk Churn profile (momth-to-month + senior + charges > 70)

SELECT 
  COUNT(*) AS total_customers,
  SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
  ROUND(SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS churn_percentage
FROM telecom_customers
WHERE Contract = 'Month-to-month' 
  AND SeniorCitizen = 1 
  AND MonthlyCharges > 70;
