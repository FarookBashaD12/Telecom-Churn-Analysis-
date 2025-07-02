# Telecom Churn Analysis

## Project Objective

The goal of this project is to analyze customer churn behavior in the telecom industry using **SQL** and **Excel**. By examining customer demographics, subscription patterns, and service usage, we aim to identify high-risk customers, understand churn drivers, and provide actionable insights to help reduce customer attrition.

---

## Datasets Used

- <a href="https://github.com/FarookBashaD12/Telecom-Churn-Analysis-/blob/main/Telecom%20Churn%20Analysis.xlsx">Telecom Churn Analysis</a> - Raw customer data containing demographics, contract types, monthly charges, and churn status
- <a href="https://github.com/FarookBashaD12/Telecom-Churn-Analysis-/blob/main/Telecom%20Churn%20Analysis.sql">SQL Script</a> - SQL script used for data cleaning, querying, and insight generation

---

## Key Business Questions (KPIs)

- What is the overall churn rate?
- Which contract types have the highest churn?
- How does churn vary by internet service, tenure, and charges?
- Do senior citizens or paperless billing customers churn more?
- Which payment methods are associated with higher churn?
- Can we identify high-risk customer profiles?

---

## Process Followed

- Cleaned and structured raw data using **Excel**
- Created SQL tables and imported data into a local MySQL database
- Wrote optimized SQL queries to calculate KPIs
- Performed churn segmentation by various attributes (e.g., contract type, senior status)
- Interpreted results to understand customer churn behavior

---

## Key Insights & Observations

- **Total churn rate** is significant and influenced heavily by **month-to-month contracts**
- Customers paying over `$70` per month on **month-to-month contracts**, who are also **senior citizens**, show the **highest churn risk**
- Churn rate is highest among users with **Fiber optic internet**
- **Senior citizens** have a higher churn rate than non-seniors
- Customers with **paperless billing** churn more than those with printed bills
- **Electronic check** payment users have the highest churn among all payment types
- Customers lacking **TechSupport** or using **StreamingTV** services have elevated churn likelihood

---

## Tools & Technologies

- **MySQL** → Data querying and aggregation  
- **Microsoft Excel** → Data preprocessing and formatting  
- **SQL Joins, CASE, CTEs** → For KPI calculations and insights  

---

## Final Conclusion

This telecom churn analysis provides a strong foundation for:

- Building predictive churn models in future projects
- Targeted retention campaigns focused on high-risk segments
- Data-driven decisions regarding contract types, service offerings, and billing practices

---


