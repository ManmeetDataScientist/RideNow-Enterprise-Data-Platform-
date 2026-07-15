# RideNow Enterprise Data Platform

# 03. High Level Design (HLD)

---

# Document Information

| Property | Value |
|----------|-------|
| Project | RideNow Enterprise Data Platform |
| Document | High Level Design (HLD) |
| Version | 1.0 |
| Author | Manmeet Singh |
| Last Updated | 13-Jul-2026 |
| Status | Approved |

---

# Revision History

| Version | Date | Author | Description |
|----------|------|--------|-------------|
| 1.0 | 13-Jul-2026 | Manmeet Singh | Initial High Level Design |

---

# Table of Contents

1. Purpose
2. Solution Overview
3. Business Architecture
4. System Architecture
5. Technology Stack
6. High-Level Data Flow
7. Medallion Architecture
8. Major Components
9. Snowflake Architecture
10. Security Architecture
11. Data Model Overview
12. Reporting Architecture
13. Non-Functional Design
14. Deployment Overview
15. Assumptions
16. Risks
17. Future Enhancements

---

# 1. Purpose

This document provides the High Level Design (HLD) for the RideNow Enterprise Data Platform.

It describes the overall solution architecture, major system components, data movement, technology stack, security model, and reporting architecture. The HLD provides a blueprint for developers, architects, testers, and stakeholders before detailed implementation begins.

---

# 2. Solution Overview

RideNow is a fictional ride-hailing company that generates operational data from multiple business applications.

The solution centralizes this data into Snowflake using a Medallion Architecture to support analytics, reporting, and business intelligence.

Primary objectives include:

- Centralized analytics
- Enterprise data warehouse
- Automated ETL/ELT pipelines
- Trusted KPIs
- Executive dashboards
- Scalable cloud architecture

---

# 3. Business Architecture

The RideNow business consists of the following domains:

- Customer Management
- Driver Management
- Vehicle Management
- Trip Management
- Payment Management
- Promotion Management
- Rating Management
- Business Intelligence

Each domain contributes operational data that is transformed into analytical datasets.

---

# 4. System Architecture

```text
                +----------------------+
                | Customer Mobile App  |
                +----------------------+
                           |
                +----------------------+
                | Driver Mobile App    |
                +----------------------+
                           |
                +----------------------+
                | GPS Service          |
                +----------------------+
                           |
                +----------------------+
                | Payment Gateway      |
                +----------------------+
                           |
                +----------------------+
                | Promotion Engine     |
                +----------------------+
                           |
                +----------------------+
                | Rating Service       |
                +----------------------+
                           |
                           ▼
                Python Data Generator
                           │
                           ▼
                     CSV Source Files
                           │
                           ▼
                        AWS S3 Bucket
                           │
                           ▼
                    Snowflake Stage
                           │
                           ▼
        ┌────────────────────────────────┐
        │        Snowflake               │
        │                                │
        │  Bronze → Silver → Gold        │
        └────────────────────────────────┘
                           │
                           ▼
                 Power BI Dashboards
```

---

# 5. Technology Stack

| Layer | Technology |
|--------|------------|
| Programming | Python |
| Data Warehouse | Snowflake |
| Storage | AWS S3 |
| Database Language | SQL |
| Reporting | Power BI |
| Version Control | Git & GitHub |
| Documentation | Markdown |

---

# 6. High-Level Data Flow

```text
Operational Systems
        │
        ▼
Python Data Generator
        │
        ▼
CSV Files
        │
        ▼
AWS S3
        │
        ▼
Snowflake External Stage
        │
        ▼
Bronze Layer
        │
        ▼
Silver Layer
        │
        ▼
Gold Layer
        │
        ▼
Power BI Reports
```

---

# 7. Medallion Architecture

## Bronze Layer

Purpose:

- Raw data ingestion
- Historical preservation
- Source system audit
- Minimal transformations

Examples:

- CUSTOMER_RAW
- DRIVER_RAW
- TRIP_RAW

---

## Silver Layer

Purpose:

- Data cleansing
- Standardization
- Business rule implementation
- Deduplication
- Conformed dimensions

Examples:

- CUSTOMER_DIM
- DRIVER_DIM
- TRIP_FACT
- PAYMENT_FACT

---

## Gold Layer

Purpose:

- Business KPIs
- Aggregated metrics
- Dashboard datasets
- Executive reporting

Examples:

- Revenue Dashboard
- Driver Performance
- Customer Analytics
- Promotion Effectiveness

---

# 8. Major Components

| Component | Responsibility |
|------------|----------------|
| Python Generator | Generate realistic source data |
| AWS S3 | Landing area for CSV files |
| Snowflake Stage | Secure data ingestion |
| Bronze Schema | Raw storage |
| Silver Schema | Business transformations |
| Gold Schema | Analytical datasets |
| Power BI | Visualization and reporting |
| GitHub | Source control and documentation |

---

# 9. Snowflake Architecture

Database:

```text
RIDENOW_DB
```

Schemas:

```text
BRONZE
SILVER
GOLD
STAGE
```

Warehouses:

```text
WH_ETL
WH_ANALYTICS
WH_DATA_SCIENCE
```

Roles:

```text
ROLE_ETL
ROLE_ANALYST
ROLE_ADMIN
```

---

# 10. Security Architecture

The solution follows Role-Based Access Control (RBAC).

### Administrative Roles

- ACCOUNTADMIN
- SYSADMIN
- SECURITYADMIN

### Project Roles

- ROLE_ADMIN
- ROLE_ETL
- ROLE_ANALYST

Security principles:

- Least privilege
- Schema-level access
- Warehouse isolation
- Secure object ownership

---

# 11. Data Model Overview

The logical model consists of:

### Master Entities

- Customer
- Driver
- Vehicle
- City
- Promotion

### Transaction Entities

- Trip
- Payment
- Rating

### Analytical Model

Dimensions:

- CUSTOMER_DIM
- DRIVER_DIM
- VEHICLE_DIM
- CITY_DIM
- DATE_DIM
- TIME_DIM

Facts:

- FACT_TRIP
- FACT_PAYMENT
- FACT_DRIVER_EARNING
- FACT_SURGE

---

# 12. Reporting Architecture

Power BI connects exclusively to the Gold layer.

Business dashboards include:

- Executive Dashboard
- Revenue Dashboard
- Driver Performance
- Customer Analytics
- Operations Dashboard
- Finance Dashboard

Benefits:

- Trusted KPIs
- Fast query performance
- Standardized metrics
- Self-service reporting

---

# 13. Non-Functional Design

| Category | Design Goal |
|----------|-------------|
| Performance | Fast analytical queries |
| Scalability | Independent compute scaling |
| Security | RBAC |
| Reliability | Modular ETL |
| Availability | Cloud-native architecture |
| Maintainability | Enterprise documentation |
| Auditability | Data lineage and history |

---

# 14. Deployment Overview

Deployment sequence:

1. Create Warehouses
2. Create Database
3. Create Schemas
4. Create File Formats
5. Create Stages
6. Create Roles
7. Create Users
8. Deploy Tables
9. Deploy ETL
10. Load Bronze
11. Build Silver
12. Build Gold
13. Publish Power BI Dashboards

---

# 15. Assumptions

- Snowflake account is available.
- AWS S3 bucket is configured.
- Python environment is installed.
- Power BI Desktop is available.
- Synthetic data will be generated.

---

# 16. Risks

| Risk | Mitigation |
|------|------------|
| Increasing data volume | Elastic Snowflake warehouses |
| Schema evolution | Version-controlled SQL scripts |
| Performance degradation | Warehouse sizing and query optimization |
| Documentation drift | Documentation-first development |

---

# 17. Future Enhancements

Future versions may include:

- Snowpipe for automated ingestion
- Dynamic Tables
- Snowpark
- Apache Airflow orchestration
- Kafka streaming
- CI/CD pipelines
- dbt transformations
- Machine Learning integration
- Data Observability
- Real-time dashboards

---

# Conclusion

The High Level Design defines the overall architecture of the RideNow Enterprise Data Platform. It provides a scalable, secure, and maintainable blueprint that aligns business objectives with technical implementation.

The solution leverages Snowflake, AWS S3, Python, SQL, and Power BI to create a modern cloud-native analytics platform following enterprise architecture principles and the Medallion Architecture.

---

**Document Status:** Approved

**Version:** 1.0

**Maintained By:** Manmeet Singh

**Project:** RideNow Enterprise Data Platform
