# Document Information

# Revision History

| Version | Date | Author | Description |
|----------|------|--------|-------------|
| 1.0 | 13-Jul-2026 | Manmeet Singh | Initial version |
| 1.1 | TBD | Manmeet Singh | Added ER Diagram |
| 1.2 | TBD | Manmeet Singh | Added Star Schema |

# Table of Contents

---

## Introduction
...

# Table of Contents

- [Introduction](#introduction)
- [Business Overview](#business-overview)
- [Business Process](#business-process)
- [Naming Standards](#naming-standards)
- [Data Type Standards](#data-type-standards)
- [Audit Column Standards](#audit-column-standards)
- [Entity Catalog](#entity-catalog)
- [Master Data](#master-data)
  - [CUSTOMER](#customer)
  - [DRIVER](#driver)
  - [VEHICLE](#vehicle)
  - [CITY](#city)
  - [PROMOTION](#promotion)
- [Transaction Data](#transaction-data)
  - [TRIP](#trip)
  - [PAYMENT](#payment)
  - [RATING](#rating)
- [Dimension Tables](#dimension-tables)
  - [DATE_DIM](#date_dim)
  - [TIME_DIM](#time_dim)
- [Fact Tables](#fact-tables)
  - [FACT_TRIP](#fact_trip)
  - [FACT_PAYMENT](#fact_payment)
  - [FACT_DRIVER_EARNING](#fact_driver_earning)
  - [FACT_SURGE](#fact_surge)
- [Primary Keys](#primary-keys)
- [Foreign Keys](#foreign-keys)
- [Business Keys](#business-keys)
- [Surrogate Keys](#surrogate-keys)
- [Relationships](#relationships)
- [Cardinality](#cardinality)
- [ER Diagram](#er-diagram)
- [Star Schema](#star-schema)
- [Layer Responsibilities](#Layer-Responsibilities)
- [Business Rules](#business-rules)
- [Data Validation Rules](#data-validation-rules)
- [Data Generation Rules](#data-generation-rules)
- [Sample Data](#sample-data)
- [Estimated Data Volume](#estimated-data-volume)
- [Slowly Changing Dimensions](#slowly-changing-dimensions-scd)
- [Future Enhancements](#future-enhancements)


# Introduction

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

# Business Overview

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

# Business Process

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

## Business Entity Mapping

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
Source Systems
      │
      ▼
Bronze Layer
(Raw Data)
      │
      ▼
Silver Layer
(Business Transformation)
      │
      ▼
Gold Layer
(Business Analytics)
      │
      ▼
Power BI Dashboards
```

---

## Layer Responsibilities

### Bronze

- Store source data exactly as received.
- Preserve historical records.
- Minimal transformations.
- Support data auditing.

### Silver

- Clean and standardize data.
- Remove duplicates.
- Apply business rules.
- Create Dimension and Fact tables.
- Maintain referential integrity.

### Gold

- Aggregate business metrics.
- Calculate KPIs.
- Support Power BI dashboards.
- Optimize analytical queries.

---

## Design Decision

The RideNow project separates the **logical business data model** from the **physical Snowflake implementation**.

Business entities such as Customer, Driver, Trip, and Payment remain consistent regardless of the storage layer, while the Medallion Architecture provides a scalable and maintainable implementation for ETL, reporting, and analytics.
