# 🚖 RideNow Enterprise Data Platform

## Enterprise Snowflake Data Engineering Project

![Snowflake](https://img.shields.io/badge/Snowflake-Cloud%20Data%20Warehouse-blue)
![AWS](https://img.shields.io/badge/AWS-S3-orange)
![Python](https://img.shields.io/badge/Python-Data%20Generator-yellow)
![SQL](https://img.shields.io/badge/SQL-ETL-green)
![GitHub](https://img.shields.io/badge/GitHub-Version%20Control-black)

---

# 📌 Project Overview

RideNow Enterprise Data Platform is an end-to-end Data Engineering project that simulates a global ride-hailing company similar to Uber.

The platform is designed using modern cloud architecture and Snowflake best practices to ingest, process, transform, secure, and analyze millions of ride transactions.

This repository demonstrates how enterprise organizations design scalable cloud data platforms using the Bronze–Silver–Gold architecture.

---

# 🎯 Business Problem

RideNow operates in multiple countries and generates millions of ride events every day.

Business users require near real-time analytics to answer questions such as:

- How much revenue was generated today?
- Which city has the highest demand?
- Which drivers completed the most trips?
- What is the cancellation percentage?
- Which payment methods are most popular?
- What are the peak business hours?

Traditional reporting systems are slow, expensive, and difficult to scale.

---

# 🎯 Business Objectives

The primary objectives of this project are:

- Build an enterprise-scale Snowflake Data Platform
- Design a scalable dimensional data model
- Automate batch data ingestion
- Support incremental processing
- Secure sensitive customer information
- Deliver analytics-ready datasets
- Build executive dashboards

---

# 🏗️ High-Level Architecture

```
Driver App
Customer App
Payment Gateway
GPS Tracking
        │
        ▼
      AWS S3
        │
        ▼
 Snowflake Stage
        │
        ▼
   COPY INTO
        │
        ▼
 Bronze (RAW)
        │
        ▼
 Silver (CURATED)
        │
        ▼
 Gold (ANALYTICS)
        │
        ▼
 Tableau / Power BI
```

---

# 🛠 Technology Stack

| Technology | Purpose |
|------------|---------|
| Snowflake | Cloud Data Warehouse |
| AWS S3 | Data Storage |
| Python | Data Generation |
| SQL | ETL & Analytics |
| Git | Version Control |
| GitHub | Source Code Repository |
| Tableau / Power BI | Dashboards |

---

# 📂 Repository Structure

```
RideNow-Enterprise-Data-Platform/

01_Project_Management/
02_Business_Requirement/
03_Architecture/
04_Data_Model/
05_Python_Data_Generator/
06_Sample_Data/
07_Snowflake_SQL/
08_ETL/
09_Testing/
10_Dashboard/
11_Deployment/
12_Interview_Guide/

README.md
```

---

# 🏢 Snowflake Architecture

The project follows a layered architecture.

RAW Layer
- Stores source files
- No transformation

CURATED Layer
- Data cleansing
- Standardization
- Deduplication
- SCD Type 2

ANALYTICS Layer
- Business-ready tables
- KPI reporting
- Dashboard datasets

---

# 📊 Data Domains

The project covers:

- Customer
- Driver
- Vehicle
- Trip
- Payment
- Rating
- Promotion
- Geography
- Operations

---

# 📈 Key Business KPIs

Executive Dashboard

- Daily Revenue
- Monthly Revenue
- Completed Trips
- Cancelled Trips
- Active Drivers
- Active Customers
- Average Trip Distance
- Average Trip Duration
- Average Customer Rating
- Driver Utilization

---

# 🔒 Security

The project implements:

- Role-Based Access Control (RBAC)
- Secure Views
- Dynamic Data Masking
- Row Access Policies
- Principle of Least Privilege

---

# ⚡ Performance Optimization

Techniques demonstrated include:

- Virtual Warehouse sizing
- Auto Suspend / Auto Resume
- Clustering
- Query Optimization
- Result Cache
- Metadata Pruning

---

# 🚀 Future Enhancements

- Snowpark
- Apache Airflow
- dbt
- Terraform
- CI/CD Pipeline
- Real-time Kafka Integration
- Data Quality Framework

---

# 👨‍💻 Author

**Manmeet Singh**

Senior Data Engineering Portfolio Project

Cloud Platform: AWS

Data Warehouse: Snowflake

Project Type: Enterprise Analytics Platform

---


