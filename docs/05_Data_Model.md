# Data Model

---

# Document Information

| Property | Value |
|----------|--------|
| Project | RideNow Enterprise Data Platform |
| Document | Data Model |
| File Name | 05_Data_Model.md |
| Version | 2.0 |
| Status | In Progress |
| Owner | Manmeet Singh |
| Repository | RideNow Enterprise Data Platform |
| Last Updated | 14-Jul-2026 |

---

# Revision History

| Version | Date | Author | Description |
|----------|------|--------|-------------|
| 1.0 | 13-Jul-2026 | Manmeet Singh | Initial version |
| 2.0 | 14-Jul-2026 | Manmeet Singh | Enterprise structure finalized |

---

# Table of Contents

- [References](#references)
- [1. Introduction](#1-introduction)
- [2. Business Overview](#2-business-overview)
- [3. Business Process](#3-business-process)
- [4. Naming Standards](#4-naming-standards)
- [5. Data Type Standards](#5-data-type-standards)
- [6. Audit Column Standards](#6-audit-column-standards)
- [7. Entity Catalog](#7-entity-catalog)
- [8. Master Data](#8-master-data)
  - [8.1 CUSTOMER](#81-customer)
  - [8.2 DRIVER](#82-driver)
  - [8.3 VEHICLE](#83-vehicle)
  - [8.4 CITY](#84-city)
  - [8.5 PROMOTION](#85-promotion)
- [9. Transaction Data](#9-transaction-data)
  - [9.1 TRIP](#91-trip)
  - [9.2 PAYMENT](#92-payment)
  - [9.3 RATING](#93-rating)
- [10. Dimension Tables](#10-dimension-tables)
  - [10.1 DATE_DIM](#101-date_dim)
  - [10.2 TIME_DIM](#102-time_dim)
- [11. Fact Tables](#11-fact-tables)
  - [11.1 FACT_TRIP](#111-fact_trip)
  - [11.2 FACT_PAYMENT](#112-fact_payment)
  - [11.3 FACT_DRIVER_EARNING](#113-fact_driver_earning)
  - [11.4 FACT_SURGE](#114-fact_surge)
- [12. Primary Keys](#12-primary-keys)
- [13. Foreign Keys](#13-foreign-keys)
- [14. Business Keys](#14-business-keys)
- [15. Surrogate Keys](#15-surrogate-keys)
- [16. Relationships](#16-relationships)
- [17. Cardinality](#17-cardinality)
- [18. ER Diagram](#18-er-diagram)
- [19. Star Schema](#19-star-schema)
- [20. Physical Implementation Mapping](#20-physical-implementation-mapping)
- [21. Business Rules](#21-business-rules)
- [22. Data Validation Rules](#22-data-validation-rules)
- [23. Data Generation Rules](#23-data-generation-rules)
- [24. Sample Data](#24-sample-data)
- [25. Estimated Data Volume](#25-estimated-data-volume)
- [26. Slowly Changing Dimensions (SCD)](#26-slowly-changing-dimensions-scd)
- [27. Future Enhancements](#27-future-enhancements)

---

# References

This document follows the enterprise standards defined in the Standards Library.

| Standard | Reference |
|----------|-----------|
| Naming Standards | docs/standards/01_Naming_Standards.md |
| Data Type Standards | docs/standards/02_Data_Type_Standards.md |
| Audit Column Standards | docs/standards/03_Audit_Column_Standards.md |
| SQL Coding Standards | docs/standards/04_SQL_Coding_Standards.md |
| Documentation Standards | docs/standards/07_Documentation_Standards.md |


## 1. Introduction

## Purpose

The RideNow Enterprise Data Platform is a comprehensive end-to-end data engineering project designed to demonstrate enterprise-level implementation of a modern cloud data warehouse using Snowflake.

The project simulates the data platform of a ride-hailing company similar to Uber or Ola, where data is generated continuously from multiple operational systems including customer applications, driver applications, payment gateways, and promotional services.

The primary objective is to design and implement a scalable, secure, and high-performance analytics platform following industry best practices and the Medallion Architecture (Bronze, Silver, Gold).

This repository is intended to showcase real-world data engineering concepts including:

- Enterprise Data Modeling
- Data Warehouse Design
- Snowflake Architecture
- ETL/ELT Pipeline Development
- Python-based Data Generation
- Incremental Data Loading
- Data Quality Validation
- Security and Governance
- Performance Optimization
- Business Intelligence Reporting

The project follows enterprise documentation standards to provide complete traceability from business requirements through implementation and reporting.

---

## Project Objectives

The objectives of this project are:

- Design an enterprise-grade data platform using Snowflake.
- Simulate realistic business data using Python.
- Implement Medallion Architecture (Bronze, Silver, Gold).
- Develop scalable ETL/ELT pipelines.
- Create dimensional models for analytics.
- Build executive dashboards and KPI reports.
- Demonstrate enterprise security and governance.
- Apply performance tuning and cost optimization techniques.
- Follow software engineering best practices using GitHub.

---

## Target Audience

This project is intended for:

- Data Engineers
- Snowflake Developers
- Data Architects
- Business Intelligence Developers
- Technical Interviewers
- Hiring Managers
- Students learning modern data engineering

## 2.  Business Overview

## Company Overview

RideNow Technologies Pvt. Ltd. is a fictional ride-hailing company that provides transportation services across multiple metropolitan cities in India.

The company connects passengers with registered drivers through a mobile application, enabling customers to book rides, make digital payments, rate drivers, and receive promotional discounts.

RideNow operates 24x7 and processes thousands of ride requests every day.

---

## Business Challenges

As RideNow expanded into multiple cities, data started growing rapidly across different operational systems.

The organization faced several business challenges:

- Data scattered across multiple systems
- Manual reporting processes
- Lack of centralized analytics
- Slow dashboard performance
- Limited historical data analysis
- Inconsistent business metrics
- Difficulty monitoring driver performance
- Increasing infrastructure costs

These challenges impacted operational efficiency and delayed business decision-making.

---

## Business Goals

RideNow aims to build a centralized enterprise data platform to:

- Consolidate operational data into a single source of truth.
- Provide near real-time reporting.
- Improve business decision-making.
- Monitor customer growth and retention.
- Analyze driver performance.
- Optimize pricing and surge strategies.
- Measure promotion effectiveness.
- Reduce operational costs.
- Support future AI and Machine Learning initiatives.

---

## Success Criteria

The project will be considered successful when it can:

- Process large volumes of ride data efficiently.
- Deliver trusted business KPIs.
- Support scalable analytics.
- Maintain high data quality.
- Provide secure access to sensitive data.
- Enable executive dashboards with fast query performance.

## 3. Business Process

The RideNow platform follows a standard ride lifecycle from customer registration to trip completion and payment settlement.

## End-to-End Business Flow

1. Customer registers using the RideNow mobile application.
2. Driver registers and completes verification.
3. Vehicle details are mapped to the driver.
4. Customer books a ride.
5. The system assigns the nearest available driver.
6. Driver accepts the ride request.
7. Customer is picked up.
8. Trip begins.
9. Trip ends at the destination.
10. Fare is calculated based on business rules.
11. Customer completes payment.
12. Driver earnings are calculated.
13. Customer provides a rating and feedback.
14. Business dashboards are updated for reporting and analytics.

---

## Data Sources

The platform receives data from multiple operational systems:

| Source System | Data Generated |
|--------------|----------------|
| Customer Mobile App | Customer registration, bookings |
| Driver Mobile App | Driver availability, trip updates |
| GPS Service | Route and distance information |
| Payment Gateway | Payment transactions |
| Promotion Engine | Coupon and discount usage |
| Rating Service | Customer feedback |
| Notification Service | Ride alerts and notifications |

---

## High-Level Data Flow

Customer App
        │
Driver App
        │
Payment Gateway
        │
Promotion Engine
        │
GPS Service
        │
        ▼
Python Data Generator
        ▼
CSV Files
        ▼
AWS S3
        ▼
Snowflake Stage
        ▼
Bronze Layer
        ▼
Silver Layer
        ▼
Gold Layer
        ▼
Power BI / Tableau Dashboards

## 4. Naming Standards

The RideNow Enterprise Data Platform follows standardized naming conventions for all databases, schemas, tables, views, SQL scripts, Python programs, documentation, and GitHub artifacts.

These standards ensure consistency, readability, maintainability, and simplify collaboration across development, testing, and production environments.

For complete naming conventions, refer to:

**docs/standards/01_Naming_Standards.md**

# 5. Data Type Standards

All data types defined in this document comply with the enterprise standards.

For details, refer to:

**docs/standards/02_Data_Type_Standards.md**

---

# 6. Audit Column Standards

All tables include standardized audit columns for lineage, traceability, and ETL monitoring.

For complete standards, refer to:

**docs/standards/03_Audit_Column_Standards.md**

---

# 7. Entity Catalog

> *Business entity inventory will be documented here.*

---

# 8. Master Data

## 8.1 CUSTOMER

> *Content to be added.*

---

## 8.2 DRIVER

> *Content to be added.*

---

## 8.3 VEHICLE

> *Content to be added.*

---

## 8.4 CITY

> *Content to be added.*

---

## 8.5 PROMOTION

> *Content to be added.*

---

# 9. Transaction Data

## 9.1 TRIP

> *Content to be added.*

---

## 9.2 PAYMENT

> *Content to be added.*

---

## 9.3 RATING

> *Content to be added.*

---

# 10. Dimension Tables

## 10.1 DATE_DIM

> *Content to be added.*

---

## 10.2 TIME_DIM

> *Content to be added.*

---

# 11. Fact Tables

## 11.1 FACT_TRIP

> *Content to be added.*

---

## 11.2 FACT_PAYMENT

> *Content to be added.*

---

## 11.3 FACT_DRIVER_EARNING

> *Content to be added.*

---

## 11.4 FACT_SURGE

> *Content to be added.*

---

# 12. Primary Keys

> *Content to be added.*

---

# 13. Foreign Keys

> *Content to be added.*

---

# 14. Business Keys

> *Content to be added.*

---

# 15. Surrogate Keys

> *Content to be added.*

---

# 16. Relationships

> *Content to be added.*

---

# 17. Cardinality

> *Content to be added.*

---

# 18. ER Diagram

> *ER Diagram image will be added.*

---

# 19. Star Schema

> *Star Schema image will be added.*

---

# 20. Physical Implementation Mapping

## Purpose

The RideNow Enterprise Data Platform follows a **Medallion Architecture** (Bronze, Silver, and Gold) for data processing and analytics.

The logical data model is designed around business entities, while the physical implementation uses Snowflake schemas organized into Bronze, Silver, and Gold layers.

This separation keeps the business model independent of the implementation while enabling scalable ETL pipelines.

---

## Medallion Architecture Overview

| Layer | Purpose | Data Characteristics |
|--------|----------|---------------------|
| Bronze | Raw data ingestion | Source data loaded with minimal transformation |
| Silver | Cleansed and integrated data | Standardized, validated, and conformed business data |
| Gold | Business-ready data | Analytics, KPIs, reporting, and dashboards |

---

## Logical-to-Physical Mapping

| Business Entity | Bronze Layer | Silver Layer | Gold Layer |
|-----------------|--------------|--------------|------------|
| Customer | CUSTOMER_RAW | CUSTOMER_DIM | Customer KPIs |
| Driver | DRIVER_RAW | DRIVER_DIM | Driver Performance |
| Vehicle | VEHICLE_RAW | VEHICLE_DIM | Fleet Analytics |
| City | CITY_RAW | CITY_DIM | Regional Analytics |
| Promotion | PROMOTION_RAW | PROMOTION_DIM | Promotion Effectiveness |
| Trip | TRIP_RAW | TRIP_FACT | Revenue & Operations Dashboard |
| Payment | PAYMENT_RAW | PAYMENT_FACT | Finance Dashboard |
| Rating | RATING_RAW | RATING_FACT | Customer Satisfaction Dashboard |

---

## Data Flow

```text
Operational Source Systems
        │
        ▼
Python Data Generator
        │
        ▼
CSV Files
        │
        ▼
Snowflake Internal Stage
        │
        ▼
Bronze Layer (Raw)
        │
        ▼
Silver Layer (Business)
        │
        ▼
Gold Layer (Analytics)
        │
        ▼
Power BI Dashboards
```

---

## Layer Responsibilities

### Bronze

- Store source data without business transformations.
- Preserve original source records.
- Support data lineage and auditing.
- Enable data recovery and replay.

### Silver

- Cleanse and standardize source data.
- Remove duplicates.
- Apply business transformations.
- Build conformed Dimension and Fact tables.
- Enforce referential integrity.

### Gold

- Deliver business-ready datasets.
- Calculate KPIs and business metrics.
- Optimize analytical queries.
- Support executive dashboards and reporting.

---

## Design Principles

The physical implementation follows these core principles:

- Business entities remain independent of storage implementation.
- Raw data is preserved in the Bronze layer.
- Business transformations occur only in the Silver layer.
- Analytics and reporting are served from the Gold layer.
- All transformations are traceable and auditable.
- The architecture supports future scalability and incremental data loading.

---

# 21. Business Rules

> *Content to be added.*

---

# 22. Data Validation Rules

> *Content to be added.*

---

# 23. Data Generation Rules

> *Content to be added.*

---

# 24. Sample Data

> *Sample records will be added.*

---

# 25. Estimated Data Volume

> *Expected data volumes for each entity will be documented.*

---

# 26. Slowly Changing Dimensions (SCD)

> *SCD implementation strategy will be documented.*

---

# 27. Future Enhancements

Future enhancements may include:

- Near real-time streaming
- Snowpipe Auto-Ingest
- Dynamic Tables
- Cortex AI integration
- Machine Learning models
- Data Marketplace integration
- Data sharing with external partners
- CI/CD pipeline automation


