
# Project Title


# 🛒 NovaCart Customer Retention & Business Intelligence Analytics

### Transforming Raw E-commerce Data into Actionable Business Intelligence

An end-to-end Business Intelligence Analytics solution built using **SQL Server, Python, and Power BI** to help business stakeholders understand customer behavior, improve retention, optimize product performance, and support strategic decision-making.



![SQL Server](https://img.shields.io/badge/SQL%20Server-CC2927?style=for-the-badge&logo=microsoftsqlserver&logoColor=white)
![Python](https://img.shields.io/badge/Python-3776AB?style=for-the-badge&logo=python&logoColor=white)
![Power BI](https://img.shields.io/badge/Power%20BI-F2C811?style=for-the-badge&logo=powerbi&logoColor=black)
![Pandas](https://img.shields.io/badge/Pandas-150458?style=for-the-badge&logo=pandas&logoColor=white)
![NumPy](https://img.shields.io/badge/NumPy-013243?style=for-the-badge&logo=numpy&logoColor=white)
![DAX](https://img.shields.io/badge/DAX-0F6CBD?style=for-the-badge)
![GitHub](https://img.shields.io/badge/GitHub-181717?style=for-the-badge&logo=github)


---


# 📖 Table of Contents

- Project Overview
- Business Problem
- Business Objectives
- Business Requirements
- Project Workflow
- Technology Stack
- Dataset Overview
- Data Engineering
- Feature Engineering
- Exploratory Data Analysis
- Data Modeling
- Power BI Dashboard
- Business Insights
- Business Recommendations
- Repository Structure
- Future Enhancements
- About the Developer

---

# 🚀 Project Overview

Customer retention is one of the most important success factors in modern e-commerce. While attracting new customers increases sales, retaining existing customers significantly improves profitability by reducing acquisition costs and increasing Customer Lifetime Value (CLV).

This project presents a complete **Business Intelligence Analytics Solution** developed for **NovaCart**, a fictional Brazilian e-commerce marketplace inspired by the Olist public dataset.

Rather than creating dashboards directly from raw data, the project follows an industry-standard analytics workflow that begins with understanding business requirements and ends with interactive dashboards that support executive decision-making.

The complete solution was developed using:

- Microsoft SQL Server
- Python
- Power BI
- DAX

Following the complete Business Intelligence lifecycle:

Business Requirements → Data Cleaning → Feature Engineering → Star Schema Modeling → Exploratory Data Analysis → Dashboard Development → Business Insights → Business Recommendations

---

# 💼 Business Problem

NovaCart has experienced significant growth in customer acquisition and order volume over the last two years. Despite this growth, the leadership team observed several operational and strategic challenges.

### Major Challenges

- 📉 Declining repeat purchase rate
- 💰 Increasing customer acquisition costs
- ❌ No standardized churn definition
- 📦 Limited visibility into product performance
- 👥 Difficulty identifying high-value customers
- 📍 Inconsistent business reporting
- 📊 Lack of executive-level analytics

These challenges limited the organization's ability to make informed, data-driven business decisions.

---

# 🎯 Business Objectives

The Business Intelligence solution was developed to answer the following strategic objectives:

- Analyze customer purchasing behavior
- Improve customer retention
- Identify customers at risk of churn
- Discover high-value customers
- Measure Customer Lifetime Value (CLV)
- Analyze seller performance
- Evaluate product performance
- Monitor customer satisfaction
- Support executive decision-making using interactive dashboards

---

# 👥 Stakeholders

| Stakeholder | Business Goal |
|-------------|---------------|
| CEO | Monitor overall business performance |
| Marketing Team | Improve customer retention |
| CRM Team | Reduce customer churn |
| Product Team | Evaluate product performance |
| Customer Experience Team | Improve customer satisfaction |
| Finance Team | Monitor revenue and payment trends |

---

# ❓ Key Business Questions

### Executive Management

- What is the total revenue generated?
- How many customers have placed orders?
- What is the Average Order Value?
- What is the Customer Retention Rate?
- How much revenue is currently at risk?
- Which states generate the highest revenue?
- How has revenue changed over time?

### Marketing & CRM

- Who are our highest-value customers?
- Which customers are at risk of churn?
- Which customer segments generate the highest revenue?
- Which payment methods are preferred by loyal customers?

### Product & Operations

- Which product categories generate the highest revenue?
- Which sellers generate the highest sales?
- Which products receive poor customer ratings?
- Does delivery delay influence customer satisfaction?

---

# 🏗️ Project Workflow

```text
                     BUSINESS REQUIREMENTS
                              │
                              ▼
                     SQL DATA CLEANING
                              │
                              ▼
                    FEATURE ENGINEERING
                              │
                              ▼
                   STAR SCHEMA MODELING
                              │
                              ▼
              PYTHON EXPLORATORY DATA ANALYSIS
                              │
                              ▼
              POWER BI DASHBOARD DEVELOPMENT
                              │
                              ▼
                BUSINESS INSIGHTS & REPORTING
                              │
                              ▼
               STRATEGIC BUSINESS RECOMMENDATIONS
```

This workflow reflects the complete Business Intelligence lifecycle followed throughout the project rather than focusing only on dashboard development.

---

# 🛠️ Technology Stack

| Category | Technologies |
|-----------|--------------|
| Database | Microsoft SQL Server |
| Programming | Python |
| Libraries | Pandas, NumPy, Matplotlib |
| Business Intelligence | Microsoft Power BI |
| Language | DAX |
| Version Control | Git & GitHub |
| Documentation | Markdown |

---

# 📊 Dataset Overview

This project is built using the **Brazilian E-Commerce Public Dataset by Olist**, one of the most widely used datasets for Business Intelligence and Data Analytics projects.

The dataset contains real-world transactional data collected from a Brazilian e-commerce marketplace between **2016 and 2018**, covering the complete customer purchasing lifecycle—from order placement to delivery and customer reviews.

Rather than analyzing isolated tables, the project integrates multiple datasets into a centralized analytical model capable of supporting executive reporting and business decision-making.

---

# 📈 Dataset Statistics

| Metric | Value |
|---------|------:|
| 🌎 Country | Brazil |
| 📅 Time Period | 2016 – 2018 |
| 📦 Orders | ~99,000 |
| 👥 Customers | ~96,000 |
| 🏪 Sellers | ~3,000 |
| 📦 Products | ~33,000 |
| ⭐ Reviews | ~100,000 |
| 💳 Payment Records | ~100,000 |

> **Business Scenario:** Throughout this project, the Olist dataset is presented as **NovaCart**, a fictional e-commerce company created to simulate a real-world Business Intelligence engagement.

---

# 🗂️ Source Tables

The analytical solution integrates multiple relational tables to create a complete view of the business.

| Table | Purpose |
|--------|---------|
| Customers | Customer profile and location |
| Orders | Order lifecycle and status |
| Order Items | Product-level sales transactions |
| Products | Product details and categories |
| Sellers | Seller information |
| Payments | Payment methods and revenue |
| Reviews | Customer satisfaction |
| Geolocation | State and city mapping |

---

# 🏗️ Data Modeling

Instead of connecting raw transactional tables directly to Power BI, a **Star Schema** was designed to improve performance, simplify reporting, and follow industry-standard Business Intelligence practices.

## Fact Table

| Table | Description |
|--------|-------------|
| **FactSales** | Stores transactional sales records and serves as the central analytical table. |

## Dimension Tables

| Table | Description |
|--------|-------------|
| **DimCustomer** | Customer demographics and engineered customer metrics |
| **DimProduct** | Product information and product performance metrics |
| **DimSeller** | Seller information and seller performance metrics |
| **DimDate** | Calendar hierarchy for time-based analysis |

---

# ⭐ Star Schema


<img src="PowerBI/Data%20Model.png" width="900">


The Star Schema enables efficient filtering, simplified DAX calculations, and scalable dashboard development by separating transactional data from descriptive business attributes.

---

# 📖 Data Dictionary

A comprehensive **Data Dictionary** was created to document every analytical table and business attribute.

The documentation includes:

- Column Name
- Data Type
- Business Description
- Calculation Logic
- Relationships
- Primary & Foreign Keys

This ensures consistency between SQL Server, Python, and Power BI while improving maintainability and documentation quality.

---

# ⚙️ SQL Data Engineering

The project began with a complete SQL-based data preparation process before any analysis or visualization was performed.

## 🧹 Data Cleaning

The raw data was cleaned and standardized to improve quality and analytical accuracy.

### Cleaning Activities

- ✔ Removed duplicate records
- ✔ Standardized text values
- ✔ Corrected inconsistent category names
- ✔ Validated Primary & Foreign Keys
- ✔ Corrected data types
- ✔ Handled missing values
- ✔ Verified payment records
- ✔ Standardized date formats
- ✔ Performed data validation checks

---

## 🔧 Feature Engineering

Business-ready features were engineered to support executive reporting and advanced analytics.

### 👥 Customer Features

- Customer Lifetime Value (CLV)
- Customer Tier (Basic, Bronze, Silver, Gold, Platinum)
- Customer Status (Active, Inactive, Churn)
- Purchase Frequency
- Customer Tenure
- Days Since Last Purchase
- Average Order Value
- Revenue at Risk

---

### 📦 Product Features

- Quantity Sold
- Total Revenue
- Average Rating
- Revenue Rank
- Sales Rank
- Total Orders

---

### 🏪 Seller Features

- Total Revenue
- Total Orders
- Average Rating
- Average Delivery Days
- Total Customers
- Revenue Rank

---

### 🚚 Order Features

- Delivery Days
- Processing Time
- Shipping Time
- Delivery Delay
- Payment Value
- Installments

---

# 📊 Exploratory Data Analysis (Python)

After SQL-based transformation, Python was used to perform Exploratory Data Analysis (EDA) to identify trends, validate business assumptions, and uncover insights before dashboard development.

### Libraries Used

- Pandas
- NumPy
- Matplotlib

---

# 📈 Business Analysis Performed

The EDA phase focused on answering business-driven questions rather than generating charts without context.

## 💰 Sales Analysis

- Monthly Revenue Trend
- Monthly Orders Trend
- Revenue by State
- Revenue by Product Category
- Revenue by Payment Method

---

## 👥 Customer Analysis

- Customer Tier Distribution
- Customer Growth Trend
- Purchase Frequency Analysis
- Customer Status Distribution
- Customer Lifetime Value Analysis

---

## 📦 Product Analysis

- Revenue vs Quantity Sold
- Top Product Categories
- Product Rating Distribution
- Product Performance Ranking

---

## 🏪 Seller Analysis

- Top Performing Sellers
- Revenue Distribution
- Average Delivery Performance
- Seller Rating Analysis

---

## ⭐ Customer Experience Analysis

- Review Score Distribution
- Delivery Delay vs Review Score
- Revenue at Risk
- Customer Churn Indicators

---

# 💡 Key Outcome

The SQL and Python phases transformed raw transactional data into a business-ready analytical model capable of supporting executive dashboards, customer analytics, retention analysis, and product performance reporting.

The engineered features and exploratory insights directly influenced the Power BI dashboard design and the final business recommendations presented in this project.

---

# 📊 Interactive Power BI Dashboard

The final Business Intelligence solution was developed in **Microsoft Power BI** to provide executives and business stakeholders with an interactive, self-service analytics platform.

Instead of static reports, the dashboard enables users to explore customer behavior, sales performance, product insights, seller performance, and retention metrics through dynamic filtering, drill-through analysis, and interactive visualizations.

Every dashboard was designed directly from the Business Requirements Document (BRD), ensuring that each KPI and visualization answers a specific business question.

---

# 🎯 Dashboard Features

The solution includes several advanced Business Intelligence capabilities.

| Feature | Description |
|----------|-------------|
| 📈 KPI Cards | Executive-level performance indicators |
| 📅 Time Intelligence | Monthly & yearly trend analysis |
| 📍 Geographic Analysis | Revenue by Brazilian states |
| 🎛 Interactive Filters | Dynamic slicers across all reports |
| 🔄 Cross Filtering | Visual interaction between charts |
| 📌 Drill-through Pages | Customer, Seller & Product deep-dive analysis |
| 🎨 Custom Theme | Consistent business-oriented dashboard design |
| 📱 Responsive Layout | Optimized report navigation |

---

# 📂 Dashboard Showcase

## 📈 Executive Overview

### Purpose

Provides executives with a high-level overview of business performance.

### Key KPIs

- Total Revenue
- Total Orders
- Total Customers
- Average Order Value
- Customer Retention Rate
- Revenue at Risk

### Business Questions Answered

- How is the business performing?
- Which states generate the highest revenue?
- Which product categories drive revenue?
- How has revenue changed over time?

<img src="Dashboard_Screenshots/Executive Overview.png" width="900">

---

## 👥 Customer Intelligence

### Purpose

Analyze customer purchasing behavior and customer value.

### Key KPIs

- Customer Lifetime Value
- Repeat Customers
- New Customers
- Average Orders per Customer

### Business Questions Answered

- Who are the highest-value customers?
- Which customer tiers generate the most revenue?
- How frequently do customers purchase?
- How has the customer base grown?

<img src="Dashboard_Screenshots/Customer Intelligence.png" width="900">

---

## 🔄 Retention & Customer Experience

### Purpose

Identify customers likely to churn and evaluate customer satisfaction.

### Key KPIs

- Active Customers
- Inactive Customers
- Churn Customers
- Revenue at Risk

### Business Questions Answered

- Which customers require retention efforts?
- Does delivery performance influence customer ratings?
- Which payment methods are preferred?
- Which customers have become inactive?

<img src="Dashboard_Screenshots/Retention & Customer Experience.png" width="900">

---

## 📦 Product & Sales Performance

### Purpose

Evaluate product, category, and seller performance.

### Key KPIs

- Total Products
- Total Categories
- Average Product Rating
- Total Sellers

### Business Questions Answered

- Which categories generate the highest revenue?
- Which products perform best?
- Which sellers contribute the highest sales?
- How does quantity sold affect revenue?

<img src="Dashboard_Screenshots/Product & Sales Performance.png" width="900">

---

# 🔍 Drill-through Analysis

To support detailed investigation, three dedicated drill-through pages were created.

These pages allow business users to move seamlessly from high-level summaries to detailed entity-level analysis without leaving the report.

---

## 📦 Product Details

Provides category-level performance analysis including:

- Revenue
- Orders
- Quantity Sold
- Average Rating
- Monthly Revenue Trend
- Top Sellers
- Top States
- Rating Distribution

---

## 🏪 Seller Details

Provides detailed seller performance analysis.

Includes:

- Revenue
- Orders
- Average Rating
- Delivery Performance
- Monthly Revenue Trend
- Product Category Performance

---

## 👤 Customer Details

Provides a complete customer profile.

Includes:

- Customer Revenue
- Total Orders
- Average Order Value
- Purchase Timeline
- Preferred Categories
- Payment Behavior
- Order History

---

# 💡 Key Business Insights

The analysis revealed several important business findings.

## 👥 Customer Insights

- A large percentage of customers placed only one order, indicating low customer retention.
- Platinum and Gold customers contribute a disproportionately high share of total revenue.
- Revenue at Risk highlights the financial impact of inactive and churned customers.

---

## 💰 Sales Insights

- Revenue is concentrated within a limited number of states.
- Credit Card is the most frequently used payment method.
- Monthly revenue trends reveal clear seasonality.

---

## 📦 Product Insights

- A small number of categories generate a significant share of total revenue.
- Higher-rated products generally achieve stronger sales performance.
- Product demand varies considerably across categories.

---

## 🚚 Customer Experience Insights

- Longer delivery times are associated with lower customer ratings.
- Seller performance varies significantly across the marketplace.
- Customer satisfaction strongly influences repeat purchasing behavior.

---

# 🚀 Business Recommendations

Based on the findings, the following strategic recommendations are proposed.

### Customer Retention

- Develop personalized retention campaigns targeting inactive customers.
- Reward Platinum and Gold customers through loyalty programs.
- Encourage repeat purchases with personalized offers.

---

### Revenue Growth

- Increase investment in high-performing product categories.
- Expand marketing efforts within top-performing states.
- Promote highly rated products to improve conversion rates.

---

### Product Strategy

- Review underperforming categories.
- Optimize inventory allocation using regional demand patterns.
- Monitor category performance continuously.

---

### Customer Experience

- Improve delivery performance to increase review scores.
- Monitor low-performing sellers.
- Use customer reviews to identify operational improvement opportunities.

---

# 📂 Repository Structure

```text
NovaCart-Customer-Retention-Analytics/
│
├── README.md
├── LICENSE
│
├── 01_Business_Requirements/
│   └── Business Requirements Document.pdf
│
├── 02_Dataset/
│   ├── Data Dictionary.pdf
│   └── Dataset Files
│
├── 03_SQL/
│   ├── Data Cleaning.sql
│   ├── Feature Engineering.sql
│   ├── Create Dimensions.sql
│   ├── Create Fact Table.sql
│   └── Business Queries.sql
│
├── 04_Python_EDA/
│   ├── NovaCart_EDA.ipynb
│   └── NovaCart_EDA.pdf
│
├── 05_PowerBI/
│   ├── NovaCart Dashboard.pbix
│   ├── Dashboard.pdf
│   └── Data Model.png
│
└── 06_Dashboard_Screenshots/
    ├── Executive Overview.png
    ├── Customer Intelligence.png
    ├── Retention & Customer Experience.png
    ├── Product & Sales Performance.png
    ├── Product Details.png
    ├── Seller Details.png
    └── Customer Details.png
```

---

# ⚙️ Getting Started

1. Clone or download this repository.
2. Restore the SQL Server database.
3. Execute the SQL scripts in sequence.
4. Open the Jupyter Notebook for Exploratory Data Analysis.
5. Open the Power BI (.pbix) file.
6. Refresh the data model if required.
7. Explore the dashboards using slicers and drill-through pages.

---

# 🚀 Future Enhancements

- Customer Churn Prediction using Machine Learning
- RFM Customer Segmentation
- Sales Forecasting
- Automated Data Refresh
- Azure SQL Integration
- Power BI Service Deployment
- Row-Level Security (RLS)
- Real-time Dashboard Monitoring

---

# 🏆 Project Highlights

- ✅ End-to-End Business Intelligence Solution
- ✅ Business Requirements Analysis (BRD)
- ✅ SQL Data Cleaning & Validation
- ✅ SQL Feature Engineering
- ✅ Star Schema Data Modeling
- ✅ Python Exploratory Data Analysis
- ✅ Interactive Power BI Dashboards
- ✅ Advanced DAX Measures
- ✅ Drill-through Pages
- ✅ Business Insights & Strategic Recommendations

---

# 👨‍💻 About the Developer

## Aman Jaglal Jaiswal

**Aspiring Data Analyst | SQL | Python | Power BI | Business Intelligence**

I enjoy transforming raw data into meaningful business insights through data engineering, analytics, and interactive reporting. My focus is on building end-to-end analytics solutions that solve real business problems and support data-driven decision-making.

If you enjoyed this project or have suggestions for improvement, feel free to connect with me.

---

## 📬 Connect With Me

- 💼 LinkedIn: https://www.linkedin.com/in/aman-jaiswal-27048b335/
- 📧 Email: amanjaswal1004@gmail.com

---


### ⭐ If you found this project useful, consider giving it a Star!

Thank you for visiting this repository. Happy Exploring! 🚀
