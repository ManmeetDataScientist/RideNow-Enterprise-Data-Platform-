# RideNow Enterprise Data Platform

# 02. Snowflake FAQ

---

# Document Information

| Property | Value |
|----------|-------|
| Project | RideNow Enterprise Data Platform |
| Document | Snowflake FAQ |
| Version | 1.0 |
| Author | Manmeet Singh |
| Last Updated | July 2026 |

---

# Table of Contents

1. Snowflake Basics
2. Snowflake Architecture
3. Databases and Schemas
4. Virtual Warehouses
5. Stages
6. File Formats
7. Data Loading
8. Security
9. Performance Optimization
10. Time Travel & Fail-safe
11. Streams & Tasks
12. Best Practices
13. RideNow Implementation

---

# 1. Snowflake Basics

## Q1. What is Snowflake?

Snowflake is a fully managed cloud-native data platform that provides scalable data warehousing, data engineering, data sharing, and analytics capabilities.

---

## Q2. What makes Snowflake different from traditional databases?

Unlike traditional databases, Snowflake separates storage and compute, allowing each to scale independently.

Benefits include:

- Elastic scalability
- Pay-as-you-go pricing
- Automatic optimization
- Minimal administration

---

## Q3. Which cloud platforms does Snowflake support?

Snowflake runs on:

- Amazon Web Services (AWS)
- Microsoft Azure
- Google Cloud Platform (GCP)

---

# 2. Snowflake Architecture

## Q4. What are the main layers of Snowflake?

- Database Storage
- Compute (Virtual Warehouses)
- Cloud Services Layer

---

## Q5. What is a Virtual Warehouse?

A Virtual Warehouse is an independent compute cluster used to execute SQL queries and data processing.

Warehouses can be started, stopped, resized, and scaled independently.

---

## Q6. Why does Snowflake separate compute and storage?

Benefits include:

- Independent scaling
- Better cost optimization
- No resource contention
- Concurrent workload support

---

# 3. Databases and Schemas

## Q7. What is a Database?

A database is the top-level container for schemas and data objects.

Example:

RIDENOW_DB

---

## Q8. What is a Schema?

A schema organizes database objects such as:

- Tables
- Views
- Stages
- File Formats
- Functions
- Procedures

---

## Q9. Which schemas are used in RideNow?

- BRONZE
- SILVER
- GOLD
- STAGE
- FILE_FORMAT
- METADATA
- AUDIT
- SECURITY

---

# 4. Virtual Warehouses

## Q10. Why are multiple warehouses used?

Different workloads require separate compute resources.

| Warehouse | Purpose |
|------------|----------|
| WH_ETL | ETL & ELT |
| WH_ANALYTICS | Reporting |
| WH_DATA_SCIENCE | ML & Ad-hoc Analysis |

---

## Q11. What is AUTO_SUSPEND?

Automatically stops a warehouse after a specified period of inactivity to reduce costs.

---

## Q12. What is AUTO_RESUME?

Automatically starts a warehouse when a query is submitted.

---

# 5. Stages

## Q13. What is a Stage?

A Stage is a Snowflake object used to store or reference files before loading them into tables.

---

## Q14. What types of stages exist?

- Internal Stage
- External Stage
- Table Stage
- User Stage

---

## Q15. Which stages are used in RideNow?

Examples:

- INTERNAL_STAGE
- LANDING_STAGE
- AWS_STAGE

---

# 6. File Formats

## Q16. Why use File Formats?

File Formats define how Snowflake reads external files.

Examples:

- CSV
- JSON
- PARQUET

---

## Q17. Why store File Formats as reusable objects?

Benefits include:

- Reusability
- Consistency
- Simplified maintenance

---

# 7. Data Loading

## Q18. Which command loads data?

COPY INTO

---

## Q19. What is COPY INTO?

COPY INTO loads data from a Stage into Snowflake tables.

---

## Q20. Difference between COPY INTO and INSERT?

COPY INTO is optimized for bulk file loading.

INSERT is used for row-level operations.

---

# 8. Security

## Q21. How does Snowflake implement security?

Through Role-Based Access Control (RBAC).

---

## Q22. Why avoid ACCOUNTADMIN for daily work?

ACCOUNTADMIN has unrestricted privileges.

Enterprise environments use:

- SYSADMIN
- SECURITYADMIN
- USERADMIN

based on responsibility.

---

## Q23. What are Masking Policies?

Masking Policies dynamically hide sensitive information.

Example:

- Email
- Phone Number
- PAN
- Aadhaar

---

## Q24. What are Row Access Policies?

They restrict which rows a user can view.

---

# 9. Performance Optimization

## Q25. How can query performance be improved?

- Proper warehouse sizing
- Clustering
- Search Optimization
- Materialized Views
- Efficient SQL

---

## Q26. Does Snowflake require indexes?

No.

Snowflake automatically manages storage structures.

---

# 10. Time Travel & Fail-safe

## Q27. What is Time Travel?

Allows querying historical versions of data.

---

## Q28. What is Fail-safe?

Provides an additional recovery period after Time Travel expires.

---

# 11. Streams & Tasks

## Q29. What is a Stream?

A Stream tracks data changes (CDC) in a table.

---

## Q30. What is a Task?

A Task schedules SQL execution.

Examples:

- Hourly ETL
- Daily Reporting
- Incremental Loads

---

# 12. Best Practices

## Q31. Should every workload share one warehouse?

No.

Separate ETL, reporting, and data science workloads.

---

## Q32. Should schemas be separated?

Yes.

Schemas improve organization, governance, and security.

---

## Q33. Why follow naming standards?

Consistent naming improves:

- Readability
- Maintenance
- Team collaboration

---

# 13. RideNow Implementation

## Q34. Which architecture does RideNow follow?

Medallion Architecture:

- Bronze
- Silver
- Gold

---

## Q35. Why is the logical data model separated from physical implementation?

Business entities remain stable, while physical implementation can evolve without changing the logical model.

---

## Q36. How many schemas are used?

Eight:

- BRONZE
- SILVER
- GOLD
- STAGE
- FILE_FORMAT
- METADATA
- AUDIT
- SECURITY

---

## Q37. How is data loaded into RideNow?

Python → CSV → AWS S3 → Snowflake Stage → Bronze → Silver → Gold → Power BI

---

## Q38. What is the execution order of setup scripts?

1. Create Database
2. Create Warehouses
3. Create Schemas
4. Create File Formats
5. Create Stages
6. Create Roles
7. Create Users
8. Grant Privileges

---

## Q39. What is the biggest Snowflake advantage demonstrated in RideNow?

The project demonstrates enterprise architecture using:

- RBAC
- Medallion Architecture
- Multiple Warehouses
- Reusable File Formats
- Standardized Documentation
- Modular SQL Deployment

---

## Q40. Is this project production-ready?

The project is designed as a portfolio implementation following enterprise best practices. It demonstrates architecture, coding standards, documentation, and deployment patterns that closely resemble production environments, while remaining simple enough for learning and interviews.

---

# References

- Snowflake Documentation
- RideNow Project Documentation
- Snowflake Best Practices

---

**Document Status:** Approved

**Version:** 1.0

**Maintained By:** Manmeet Singh
