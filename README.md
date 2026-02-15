# 📊 E-Commerce Sales Analytics | SQL + Excel | Business Intelligence Project

## 🚀 Executive Summary

This end-to-end analytics project evaluates user behavior, conversion efficiency, revenue concentration, and customer value within an e-commerce dataset using SQL (SQLite) and Excel.

The objective was to simulate how a data analyst supports product, marketing, and revenue teams by identifying funnel drop-offs, revenue-driving categories, high-value customers, and peak demand patterns.

Complete workflow:
Raw Data → SQLite Database → SQL Analysis → Business Insights → Executive Dashboard

---

## 🧠 Business Questions Answered

• Where are users dropping off in the conversion funnel?  
• What is the overall conversion rate?  
• Who are the highest value (VIP) customers?  
• Which product categories generate the most revenue?  
• How efficient are category-level conversions?  
• What are the peak purchasing hours and top sales days?  

---

## 🛠 Tech Stack

- SQL (SQLite)
- DB Browser for SQLite
- Microsoft Excel (Dashboard & Visualization)
- CTE (WITH clauses)
- Aggregations (COUNT, SUM, AVG)
- CASE WHEN conditional logic
- NULLIF for division-by-zero handling

---

## 📂 Repository Structure

```
Ecommerce-Sales-Analysis/
│
├── sql/
│   └── sales_analysis.sql       
│
├── dashboard/
│   └── ecommerce_dashboard.xlsx   
│
├── images/
│   └── dashboard_preview.png     
│
└── README.md

```


## 🔍 Analytical Framework

### 1️⃣ Conversion Funnel Analysis
- DISTINCT user-level aggregation to prevent double-counting
- View → Cart → Purchase tracking
- Drop-off rate calculation
- Overall conversion percentage measurement

### 2️⃣ VIP Customer Segmentation
- Top 10 users ranked by purchase frequency
- Revenue contribution analysis
- Average Order Value (AOV) calculation

### 3️⃣ Product Revenue Performance
- Revenue vs Sales Volume comparison
- Category-level aggregation
- Top 5 revenue-generating categories identified

### 4️⃣ Category Conversion Optimization
- CASE WHEN conditional aggregation
- NULLIF used to prevent division-by-zero errors
- HAVING filter applied to high-traffic categories

### 5️⃣ Traffic & Demand Analysis
- Hour-of-day purchase trend detection
- Peak daily buyer identification
- Sales timing pattern evaluation

---

## 📈 Key Results

- Total Buyers: 25,762  
- Overall Conversion Rate: 6.63%  
- Revenue concentrated in top-performing categories  
- VIP customers contribute disproportionate revenue  
- Peak purchase hours identified  

---

## 📊 Dashboard Preview

![Dashboard](images/dashboard_preview.png)

---

## 💡 Business Impact

✔ Identified conversion bottlenecks  
✔ Highlighted high-value customer segments  
✔ Detected revenue-driving product categories  
✔ Provided time-based sales optimization insights  
✔ Delivered executive-ready dashboard for decision-makers  

---

## 📌 Skills Demonstrated

- Data Structuring & Cleaning
- SQL Query Optimization using CTEs
- Funnel Optimization Analysis
- Revenue & Customer Segmentation
- Business KPI Modeling
- Data Storytelling through Dashboard

---

## 📦 Data Availability

The original raw dataset and SQLite database file are not included in this repository due to GitHub’s 25MB file size limitation.

The SQL scripts and dashboard can be executed using any structured e-commerce dataset with a similar schema.

---

## 👤 Author

Y. Rithvesh  
SQL | Data Analytics | Business Intelligence  
Date: 05-02-2026
