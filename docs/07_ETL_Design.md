# RideNow Enterprise Data Platform

# 07. ETL Design

---

# Document Information

| Property | Value |
|----------|-------|
| Project | RideNow Enterprise Data Platform |
| Document | ETL Design |
| Version | 1.0 |
| Author | Manmeet Singh |
| Last Updated | 13-Jul-2026 |
| Status | Approved |

---

# Revision History

| Version | Date | Author | Description |
|----------|------|--------|-------------|
| 1.0 | 13-Jul-2026 | Manmeet Singh | Initial ETL Design |

---

# Table of Contents

1. Purpose
2. ETL Architecture
3. ETL Objectives
4. Source Systems
5. Data Sources
6. ETL Workflow
7. Landing Layer
8. Bronze Layer Design
9. Silver Layer Design
10. Gold Layer Design
11. Source-to-Target Mapping
12. Transformation Rules
13. Incremental Load Strategy
14. Merge Strategy
15. Data Quality Checks
16. Error Handling
17. Logging & Auditing
18. ETL Scheduling
19. Performance Optimization
20. Recovery Strategy
21. Future Enhancements

---

# 1. Purpose

This document describes the Extract, Transform, and Load (ETL) processes used in the RideNow Enterprise Data Platform.

The ETL framework is designed to ingest raw operational data, apply business transformations, enforce data quality rules, and produce trusted analytical datasets for reporting.

---

# 2. ETL Architecture

```text
                 Source Systems
                        │
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
               Snowflake External Stage
                        │
                        ▼
              Bronze (Raw Ingestion Layer)
                        │
                        ▼
          Silver (Business Transformation Layer)
                        │
                        ▼
            Gold (Analytics & Reporting Layer)
                        │
                        ▼
               Power BI / Tableau
```

---

# 3. ETL Objectives

The ETL solution is designed to:

- Automate data ingestion
- Preserve raw source data
- Standardize business entities
- Remove duplicate records
- Validate incoming data
- Generate analytical datasets
- Maintain historical records
- Support scalable reporting

---

# 4. Source Systems

| Source System | Description |
|--------------|-------------|
| Customer Mobile App | Customer registration and booking |
| Driver Mobile App | Driver profile and ride updates |
| GPS Service | Distance and route tracking |
| Payment Gateway | Payment transactions |
| Promotion Engine | Coupon and discount information |
| Rating Service | Customer ratings and reviews |

---

# 5. Data Sources

| File | Target Bronze Table |
|------|---------------------|
| customer.csv | CUSTOMER_RAW |
| driver.csv | DRIVER_RAW |
| vehicle.csv | VEHICLE_RAW |
| city.csv | CITY_RAW |
| promotion.csv | PROMOTION_RAW |
| trip.csv | TRIP_RAW |
| payment.csv | PAYMENT_RAW |
| rating.csv | RATING_RAW |

---

# 6. ETL Workflow

```text
Source Files
      │
      ▼
Snowflake Stage
      │
      ▼
COPY INTO Bronze Tables
      │
      ▼
Validation
      │
      ▼
Transform & Standardize
      │
      ▼
MERGE into Silver Tables
      │
      ▼
Aggregate & Build Gold Tables
      │
      ▼
Power BI Dashboards
```

---

# 7. Landing Layer

Purpose:

- Receive source files
- Preserve original file format
- Maintain file history

Characteristics:

- CSV files
- UTF-8 encoding
- Daily data generation
- Immutable source files

---

# 8. Bronze Layer Design

Purpose:

- Raw data ingestion
- No business transformations
- Historical preservation
- Source system auditing

Activities:

- COPY INTO operations
- Metadata capture
- Load timestamp
- File name tracking

Tables:

- CUSTOMER_RAW
- DRIVER_RAW
- VEHICLE_RAW
- CITY_RAW
- PROMOTION_RAW
- TRIP_RAW
- PAYMENT_RAW
- RATING_RAW

---

# 9. Silver Layer Design

Purpose:

- Clean and standardize data
- Remove duplicates
- Validate business rules
- Build conformed dimensions
- Create analytical facts

Activities:

- Data cleansing
- Standardization
- Lookup validation
- Business rule enforcement
- MERGE operations

Tables:

Dimensions

- CUSTOMER_DIM
- DRIVER_DIM
- VEHICLE_DIM
- CITY_DIM
- PROMOTION_DIM
- DATE_DIM
- TIME_DIM

Facts

- TRIP_FACT
- PAYMENT_FACT
- RATING_FACT

---

# 10. Gold Layer Design

Purpose:

- Business reporting
- KPI calculation
- Dashboard optimization
- Executive analytics

Examples:

- FACT_TRIP
- FACT_PAYMENT
- FACT_DRIVER_EARNING
- FACT_SURGE

KPIs:

- Daily Revenue
- Total Trips
- Driver Earnings
- Customer Growth
- Promotion Usage
- Customer Satisfaction

---

# 11. Source-to-Target Mapping

| Source | Bronze | Silver | Gold |
|--------|---------|---------|------|
| customer.csv | CUSTOMER_RAW | CUSTOMER_DIM | Customer KPIs |
| driver.csv | DRIVER_RAW | DRIVER_DIM | Driver Performance |
| trip.csv | TRIP_RAW | TRIP_FACT | Revenue Dashboard |
| payment.csv | PAYMENT_RAW | PAYMENT_FACT | Finance Dashboard |
| rating.csv | RATING_RAW | RATING_FACT | Customer Satisfaction |

---

# 12. Transformation Rules

Typical transformations include:

- Trim leading/trailing spaces
- Convert text to uppercase where required
- Standardize date formats
- Validate email addresses
- Validate phone numbers
- Replace NULL values
- Remove duplicate records
- Calculate trip duration
- Calculate driver earnings
- Apply promotion discounts
- Calculate surge pricing
- Generate surrogate keys

---

# 13. Incremental Load Strategy

The project uses incremental loading to reduce processing time.

Workflow:

```text
Source Record
      │
      ▼
Business Key Lookup
      │
      ▼
Exists?
 ├── Yes → Update
 └── No  → Insert
```

Benefits:

- Faster processing
- Reduced warehouse usage
- Historical preservation
- Efficient MERGE operations

---

# 14. Merge Strategy

Silver tables are maintained using Snowflake MERGE statements.

Example logic:

```sql
MERGE INTO CUSTOMER_DIM T
USING CUSTOMER_RAW S
ON T.CUSTOMER_ID = S.CUSTOMER_ID

WHEN MATCHED THEN
    UPDATE SET ...

WHEN NOT MATCHED THEN
    INSERT (...);
```

---

# 15. Data Quality Checks

Validation rules include:

- Mandatory field validation
- Duplicate record detection
- Foreign key validation
- Date validation
- Numeric range validation
- Invalid payment amounts
- Invalid ratings
- Null checks
- Business rule validation

Rejected records should be logged for investigation.

---

# 16. Error Handling

Common ETL errors:

- Missing files
- Corrupted files
- Invalid data types
- Duplicate business keys
- Constraint violations
- Load failures

Recovery strategy:

- Log error details
- Skip invalid records where appropriate
- Continue processing valid records
- Notify administrators
- Retry failed loads

---

# 17. Logging & Auditing

Each ETL execution records:

- Job Name
- Start Time
- End Time
- Source File
- Rows Read
- Rows Inserted
- Rows Updated
- Rows Rejected
- Execution Status
- Error Message

Audit columns include:

- CREATED_DATE
- UPDATED_DATE
- CREATED_BY
- UPDATED_BY
- LOAD_TIMESTAMP

---

# 18. ETL Scheduling

Current implementation:

- Manual execution for development

Future implementation:

- Snowflake Tasks
- Apache Airflow
- CI/CD pipelines
- Event-driven processing

Suggested schedule:

| Process | Frequency |
|----------|-----------|
| Bronze Load | Daily |
| Silver Load | Daily |
| Gold Refresh | Daily |
| KPI Refresh | Daily |

---

# 19. Performance Optimization

Optimization strategies:

- Separate ETL warehouse
- Bulk loading using COPY INTO
- Incremental MERGE operations
- Minimal Bronze transformations
- Push-down processing in Snowflake
- Auto Suspend/Resume warehouses
- Query optimization
- Future clustering keys

---

# 20. Recovery Strategy

Recovery options:

- Reload source files
- Re-execute failed ETL jobs
- Snowflake Time Travel
- Zero-Copy Cloning for testing
- Audit log review
- Data reconciliation

---

# 21. Future Enhancements

Future ETL improvements include:

- Snowpipe for continuous ingestion
- Streams & Tasks
- Dynamic Tables
- Apache Airflow orchestration
- dbt transformation framework
- Data quality framework
- Automated anomaly detection
- Real-time streaming with Kafka
- Data observability dashboards
- CI/CD deployment pipelines

---

# Conclusion

The RideNow ETL framework provides a scalable, reliable, and maintainable data integration process that transforms operational data into trusted analytical datasets.

By leveraging Snowflake's native capabilities, the solution supports efficient data ingestion, standardized transformations, robust validation, and optimized reporting while remaining extensible for future enterprise enhancements.

---

**Document Status:** Approved

**Version:** 1.0

**Maintained By:** Manmeet Singh

**Project:** RideNow Enterprise Data Platform
