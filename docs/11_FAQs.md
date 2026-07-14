# Frequently Asked Questions (FAQ)

## RideNow Enterprise Data Platform

---

# Document Information

| Property | Value |
|----------|-------|
| Project | RideNow Enterprise Data Platform |
| Document | FAQ |
| Version | 1.0 |
| Author | Manmeet Singh |
| Last Updated | July 2026 |

---

# Table of Contents

1. General Questions
2. Architecture
3. Snowflake
4. Data Modeling
5. ETL & ELT
6. Data Quality
7. Security
8. Performance
9. Reporting
10. GitHub Project
11. Future Enhancements

---

# 1. General Questions

## What is RideNow?

RideNow is a fictional ride-hailing company created to demonstrate an enterprise-grade Snowflake Data Engineering project using modern cloud data warehouse architecture.

---

## Why was this project created?

The project showcases practical implementation of:

- Snowflake
- SQL
- Python
- Data Warehousing
- ETL/ELT
- Data Modeling
- GitHub Documentation
- Enterprise Standards

---

## Is this a real production project?

No.

It is a portfolio project designed using enterprise best practices and realistic business scenarios.

---

# 2. Architecture

## Which architecture does the project follow?

The project follows the **Medallion Architecture**:

- Bronze
- Silver
- Gold

---

## Why Medallion Architecture?

It provides:

- Better scalability
- Easier maintenance
- Clear separation of responsibilities
- Improved data quality
- Simplified reporting

---

## Why only one database?

The project uses a single database (`RIDENOW_DB`) with multiple schemas.

This keeps the project simple while following enterprise design principles.

---

# 3. Snowflake

## Why Snowflake?

Snowflake provides:

- Separation of compute and storage
- Automatic scaling
- Time Travel
- Zero-Copy Cloning
- Secure Data Sharing
- Excellent SQL performance

---

## Why multiple warehouses?

Different workloads require different compute resources.

| Warehouse | Purpose |
|------------|---------|
| WH_ETL | ETL Processing |
| WH_ANALYTICS | BI Reporting |
| WH_DATA_SCIENCE | Machine Learning |

---

## Why separate schemas?

Schemas improve organization.

Examples:

- BRONZE
- SILVER
- GOLD
- AUDIT
- METADATA
- SECURITY

---

# 4. Data Modeling

## Why use Surrogate Keys?

Surrogate Keys improve:

- Performance
- Join efficiency
- Historical tracking
- SCD implementation

---

## Why use Business Keys?

Business Keys uniquely identify records in source systems.

Examples:

- CUSTOMER_ID
- DRIVER_ID
- TRIP_ID

---

## Which SCD types are implemented?

- Type 0
- Type 1
- Type 2

---

# 5. ETL & ELT

## Which approach is used?

The project primarily follows **ELT**, leveraging Snowflake for transformations after loading raw data.

---

## How is data loaded?

1. Python generates data.
2. Files are uploaded to AWS S3.
3. Snowflake Stage reads the files.
4. COPY INTO loads data into Bronze.
5. SQL transforms data into Silver.
6. Gold provides reporting-ready datasets.

---

## Is incremental loading supported?

Yes.

The project is designed to support incremental loading using:

- MERGE
- Streams
- Tasks

---

# 6. Data Quality

## How is data quality maintained?

Data quality checks include:

- Mandatory fields
- Duplicate detection
- Referential integrity
- Data type validation
- Range validation
- Business rule validation

---

## Where are rejected records stored?

Rejected records are logged in the **AUDIT** schema.

---

# 7. Security

## How is security implemented?

Security features include:

- Role-Based Access Control (RBAC)
- Least privilege access
- Separate administrative roles
- Future support for masking policies and row access policies

---

## Why not use ACCOUNTADMIN for everything?

Enterprise environments follow the principle of least privilege.

Different administrative tasks are performed using roles such as:

- ACCOUNTADMIN
- SYSADMIN
- SECURITYADMIN
- USERADMIN

---

# 8. Performance

## How is performance optimized?

The project includes:

- Dedicated warehouses
- Appropriate clustering (future enhancement)
- Partition-friendly data design
- Optimized SQL
- Materialized Views (future enhancement)

---

## Why separate ETL and Analytics warehouses?

Separating workloads prevents reporting queries from impacting data loading processes.

---

# 9. Reporting

## Which BI tools are supported?

The project is designed for:

- Power BI
- Tableau

---

## Which layer connects to dashboards?

Power BI and Tableau connect to the **Gold** layer.

---

# 10. GitHub Project

## Why is documentation so detailed?

Enterprise projects require comprehensive documentation for:

- Knowledge sharing
- Onboarding
- Governance
- Maintenance
- Audit readiness

---

## Can this project be deployed to AWS?

Yes.

The architecture supports deployment using:

- Snowflake
- AWS S3
- Python
- GitHub

---

## Is this project suitable for interview preparation?

Yes.

The repository demonstrates:

- Data Engineering
- Snowflake
- SQL
- Data Modeling
- ETL Design
- Documentation
- Enterprise Architecture

---

# 11. Future Enhancements

Future versions may include:

- Snowflake Streams
- Dynamic Tables
- Snowpark
- CI/CD Pipelines
- dbt Integration
- Apache Airflow
- Kafka Streaming
- Machine Learning
- Data Observability
- Data Catalog

---

# Contact

For questions, suggestions, or feedback, please open a GitHub Issue or submit a Pull Request.

---

**Document Status:** Approved

**Version:** 1.0

**Maintained By:** Manmeet Singh
