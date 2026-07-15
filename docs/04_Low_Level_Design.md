# RideNow Enterprise Data Platform

# 04. Low Level Design (LLD)

---

# Document Information

| Property | Value |
|----------|-------|
| Project | RideNow Enterprise Data Platform |
| Document | Low Level Design (LLD) |
| Version | 1.0 |
| Author | Manmeet Singh |
| Last Updated | 13-Jul-2026 |
| Status | Approved |

---

# Revision History

| Version | Date | Author | Description |
|----------|------|--------|-------------|
| 1.0 | 13-Jul-2026 | Manmeet Singh | Initial Low Level Design |

---

# Table of Contents

1. Purpose
2. Deployment Sequence
3. Snowflake Object Design
4. Database Design
5. Schema Design
6. Warehouse Design
7. Role Design
8. User Design
9. File Format Design
10. Stage Design
11. Table Design
12. ETL Design
13. Data Flow
14. Incremental Load Strategy
15. Error Handling
16. Logging & Auditing
17. Performance Optimization
18. Security Design
19. Naming Standards
20. Source Code Structure

---

# 1. Purpose

This document describes the detailed implementation of the RideNow Enterprise Data Platform.

It explains how every Snowflake object is created, how data flows through the platform, and how ETL processes are implemented.

---

# 2. Deployment Sequence

Objects are deployed in the following order.

```text
01_Create_Warehouses.sql
02_Create_Database.sql
03_Create_Schemas.sql
04_Create_File_Formats.sql
05_Create_Stages.sql
06_Create_Roles.sql
07_Create_Users.sql
08_Create_Tables.sql
09_Load_Bronze.sql
10_Load_Silver.sql
11_Load_Gold.sql
12_Create_Views.sql
13_Create_Tasks.sql
14_Create_Procedures.sql
15_Create_Stream.sql
```

---

# 3. Snowflake Object Design

The project creates the following Snowflake objects.

| Object | Purpose |
|---------|----------|
| Database | Enterprise data repository |
| Schema | Logical data organization |
| Warehouse | Compute resources |
| Stage | External file loading |
| File Format | CSV parsing |
| Table | Data storage |
| View | Reporting abstraction |
| Stream | Change tracking |
| Task | Job scheduling |
| Procedure | ETL logic |
| Role | Security |
| User | Authentication |

---

# 4. Database Design

Database Name

```text
RIDENOW_DB
```

Purpose

Stores all project data.

---

# 5. Schema Design

```text
RIDENOW_DB

│
├── BRONZE
├── SILVER
├── GOLD
└── STAGE
```

## BRONZE

Raw source data.

Examples

- CUSTOMER_RAW
- DRIVER_RAW
- TRIP_RAW

---

## SILVER

Business entities.

Examples

- CUSTOMER_DIM
- DRIVER_DIM
- PAYMENT_FACT

---

## GOLD

Reporting objects.

Examples

- FACT_TRIP
- FACT_PAYMENT
- FACT_DRIVER_EARNING

---

## STAGE

External stages used for data ingestion.

---

# 6. Warehouse Design

| Warehouse | Size | Purpose |
|------------|------|----------|
| WH_ETL | XSMALL | ETL |
| WH_ANALYTICS | SMALL | Dashboard Queries |
| WH_DATA_SCIENCE | MEDIUM | Future Analytics |

Auto Suspend

```text
60 Seconds
```

Auto Resume

```text
Enabled
```

---

# 7. Role Design

| Role | Responsibility |
|------|----------------|
| ROLE_ADMIN | Administration |
| ROLE_ETL | Data Loading |
| ROLE_ANALYST | Reporting |

Administrative Roles

- ACCOUNTADMIN
- SYSADMIN
- SECURITYADMIN

---

# 8. User Design

Example

```text
ETL_USER

ANALYST_USER

ADMIN_USER
```

Users receive permissions only through roles.

---

# 9. File Format Design

CSV File Format

```sql
TYPE = CSV

FIELD_DELIMITER=','

SKIP_HEADER=1

FIELD_OPTIONALLY_ENCLOSED_BY='"'
```

Purpose

Standardized ingestion of source files.

---

# 10. Stage Design

External Stage

```text
AWS S3

↓

Snowflake Stage

↓

Bronze Tables
```

Example

```text
CUSTOMER_STAGE

DRIVER_STAGE

TRIP_STAGE
```

---

# 11. Table Design

## Master Tables

- CUSTOMER
- DRIVER
- VEHICLE
- CITY
- PROMOTION

---

## Transaction Tables

- TRIP
- PAYMENT
- RATING

---

## Dimensions

- CUSTOMER_DIM
- DRIVER_DIM
- VEHICLE_DIM
- CITY_DIM
- DATE_DIM
- TIME_DIM

---

## Facts

- FACT_TRIP
- FACT_PAYMENT
- FACT_DRIVER_EARNING
- FACT_SURGE

---

# 12. ETL Design

```text
CSV

↓

Bronze

↓

Validation

↓

Silver

↓

Business Rules

↓

Gold

↓

Power BI
```

---

## Bronze

Responsibilities

- Raw Load
- Metadata
- Audit Columns

---

## Silver

Responsibilities

- Standardization
- Deduplication
- Business Rules
- Lookup Validation

---

## Gold

Responsibilities

- KPIs
- Aggregations
- Dashboard Tables

---

# 13. Data Flow

```text
Customer App
Driver App
GPS
Payments
Promotions
Ratings
        │
        ▼
Python Generator
        │
        ▼
CSV Files
        │
        ▼
AWS S3
        │
        ▼
Snowflake Stage
        │
        ▼
Bronze
        │
        ▼
Silver
        │
        ▼
Gold
        │
        ▼
Power BI
```

---

# 14. Incremental Load Strategy

The project uses incremental loading wherever possible.

Business Key

↓

Check Existing Record

↓

Insert New

↓

Update Existing

↓

Audit

Future enhancements include Streams and Tasks.

---

# 15. Error Handling

Validation checks include:

- NULL validation
- Duplicate detection
- Invalid dates
- Invalid payment amounts
- Missing foreign keys
- Incorrect data types

Invalid records should be redirected to error tables for review.

---

# 16. Logging & Auditing

Each ETL process records:

- Start Time
- End Time
- Rows Read
- Rows Inserted
- Rows Updated
- Rows Rejected
- Execution Status

Audit columns:

- CREATED_DATE
- UPDATED_DATE
- CREATED_BY
- UPDATED_BY

---

# 17. Performance Optimization

Optimization techniques include:

- Separate warehouses
- Auto suspend/resume
- ELT processing in Snowflake
- Dimension and Fact modeling
- Minimal transformations in Bronze
- Reporting only from Gold

Future enhancements:

- Clustering Keys
- Search Optimization
- Materialized Views

---

# 18. Security Design

Security follows RBAC.

Permissions are granted to roles rather than directly to users.

Principles:

- Least Privilege
- Role Separation
- Warehouse Isolation
- Schema-Level Security

---

# 19. Naming Standards

Examples:

Database

```text
RIDENOW_DB
```

Schemas

```text
BRONZE
SILVER
GOLD
STAGE
```

Warehouses

```text
WH_ETL
WH_ANALYTICS
WH_DATA_SCIENCE
```

Roles

```text
ROLE_ETL
ROLE_ANALYST
ROLE_ADMIN
```

Tables

```text
CUSTOMER_DIM
TRIP_FACT
PAYMENT_FACT
```

Scripts

```text
01_Create_Warehouses.sql
02_Create_Database.sql
03_Create_Schemas.sql
```

---

# 20. Source Code Structure

```text
RideNow-Enterprise-Data-Platform
│
├── docs/
├── snowflake/
│   ├── setup/
│   ├── ddl/
│   ├── dml/
│   ├── procedures/
│   ├── tasks/
│   ├── streams/
│   └── security/
│
├── python/
│
├── datasets/
│
├── dashboards/
│
├── tests/
│
└── README.md
```

---

# Conclusion

The Low Level Design provides the implementation blueprint for the RideNow Enterprise Data Platform. It defines the deployment order, Snowflake object design, ETL process, security model, and coding structure required to build a scalable and maintainable enterprise data platform.

---

**Document Status:** Approved

**Version:** 1.0

**Maintained By:** Manmeet Singh

**Project:** RideNow Enterprise Data Platform
