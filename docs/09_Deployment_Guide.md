# RideNow Enterprise Data Platform

# 09. Deployment Guide

---

# Document Information

| Property | Value |
|----------|-------|
| Project | RideNow Enterprise Data Platform |
| Document | Deployment Guide |
| Version | 1.0 |
| Author | Manmeet Singh |
| Last Updated | 13-Jul-2026 |
| Status | Approved |

---

# Revision History

| Version | Date | Author | Description |
|----------|------|--------|-------------|
| 1.0 | 13-Jul-2026 | Manmeet Singh | Initial Deployment Guide |

---

# Table of Contents

1. Purpose
2. Deployment Overview
3. Deployment Architecture
4. Prerequisites
5. Repository Structure
6. Deployment Sequence
7. Environment Setup
8. Snowflake Object Deployment
9. Data Loading
10. ETL Deployment
11. Dashboard Deployment
12. Validation Checklist
13. Rollback Strategy
14. Troubleshooting
15. Best Practices
16. Deployment Checklist
17. Future Enhancements

---

# 1. Purpose

This document provides the step-by-step deployment procedure for the RideNow Enterprise Data Platform.

It describes how to deploy Snowflake infrastructure, configure security, load data, execute ETL pipelines, validate the deployment, and prepare the environment for reporting.

---

# 2. Deployment Overview

Deployment consists of the following phases:

1. Prepare the environment
2. Deploy Snowflake infrastructure
3. Configure security
4. Create database objects
5. Load source data
6. Execute ETL pipelines
7. Validate data
8. Connect reporting tools
9. Perform post-deployment verification

---

# 3. Deployment Architecture

```text
Developer Workstation
        │
        ▼
GitHub Repository
        │
        ▼
Snowflake Environment
        │
        ├── Warehouses
        ├── Database
        ├── Schemas
        ├── Roles
        ├── Stages
        ├── Tables
        ├── Procedures
        └── Tasks
                │
                ▼
         Power BI / Tableau
```

---

# 4. Prerequisites

Before deployment, ensure the following:

## Snowflake

- Snowflake account created
- ACCOUNTADMIN access available
- SYSADMIN access available
- SECURITYADMIN access available

## Development Tools

- Snowflake Snowsight
- VS Code
- Git
- Python 3.x
- Power BI Desktop (optional)
- Tableau Desktop (optional)

## Repository

Clone the repository:

```bash
git clone https://github.com/<username>/RideNow-Enterprise-Data-Platform.git
```

---

# 5. Repository Structure

```text
RideNow-Enterprise-Data-Platform
│
├── datasets/
├── dashboards/
├── docs/
├── python/
├── snowflake/
│   ├── setup/
│   ├── ddl/
│   ├── dml/
│   ├── procedures/
│   ├── tasks/
│   ├── streams/
│   └── security/
│
└── README.md
```

---

# 6. Deployment Sequence

Execute SQL scripts in the following order.

| Step | Script |
|------|--------|
| 1 | 01_Create_Warehouses.sql |
| 2 | 02_Create_Database.sql |
| 3 | 03_Create_Schemas.sql |
| 4 | 04_Create_File_Formats.sql |
| 5 | 05_Create_Stages.sql |
| 6 | 06_Create_Roles.sql |
| 7 | 07_Create_Users.sql |
| 8 | 08_Create_Tables.sql |
| 9 | 09_Load_Bronze.sql |
| 10 | 10_Load_Silver.sql |
| 11 | 11_Load_Gold.sql |
| 12 | 12_Create_Views.sql |
| 13 | 13_Create_Streams.sql *(Future)* |
| 14 | 14_Create_Tasks.sql *(Future)* |
| 15 | 15_Create_Procedures.sql *(Future)* |

---

# 7. Environment Setup

## Step 1

Login to Snowflake.

---

## Step 2

Switch to ACCOUNTADMIN.

```sql
USE ROLE ACCOUNTADMIN;
```

---

## Step 3

Create warehouses.

---

## Step 4

Create the database.

```text
RIDENOW_DB
```

---

## Step 5

Create schemas.

```text
BRONZE
SILVER
GOLD
STAGE
```

---

# 8. Snowflake Object Deployment

Objects are created in the following order.

## Infrastructure

- Warehouses
- Database
- Schemas

---

## Security

- Roles
- Users
- Grants

---

## Data Loading

- File Formats
- Stages

---

## Storage

- Bronze Tables
- Silver Tables
- Gold Tables

---

## Processing

- Views
- Stored Procedures
- Streams
- Tasks

---

# 9. Data Loading

## Upload CSV Files

```text
datasets/

customer.csv
driver.csv
vehicle.csv
city.csv
promotion.csv
trip.csv
payment.csv
rating.csv
```

---

## Load Bronze Layer

```text
CSV

↓

Snowflake Stage

↓

COPY INTO

↓

Bronze Tables
```

---

## Build Silver Layer

Execute MERGE scripts to create cleansed business entities.

---

## Build Gold Layer

Generate reporting-ready fact tables and KPI datasets.

---

# 10. ETL Deployment

ETL execution order:

```text
Bronze Load

↓

Validation

↓

Silver Transformation

↓

Business Rules

↓

Gold Aggregation

↓

Dashboard Refresh
```

---

# 11. Dashboard Deployment

Connect Power BI or Tableau to Snowflake.

Recommended schema:

```text
RIDENOW_DB.GOLD
```

Primary reporting tables:

- FACT_TRIP
- FACT_PAYMENT
- FACT_DRIVER_EARNING
- FACT_SURGE

---

# 12. Validation Checklist

Verify:

- Database created
- Schemas available
- Warehouses online
- Roles created
- Users assigned
- Stages accessible
- File formats configured
- CSV files loaded
- Bronze tables populated
- Silver tables transformed
- Gold tables generated
- Dashboard queries successful

---

# 13. Rollback Strategy

If deployment fails:

1. Stop execution.
2. Review error logs.
3. Correct failed script.
4. Re-run the failed step.
5. Validate object status.

Recovery features:

- Time Travel
- Zero-Copy Clone
- Object recreation
- Source file reload

---

# 14. Troubleshooting

| Issue | Possible Cause | Resolution |
|--------|----------------|------------|
| Warehouse suspended | Auto Suspend | Resume warehouse |
| COPY INTO failed | Incorrect stage | Validate stage path |
| Permission denied | Missing role | Grant required privilege |
| Empty tables | Missing source files | Upload CSV files |
| Duplicate data | Multiple loads | Use MERGE strategy |
| Dashboard failure | Missing Gold data | Rebuild Gold layer |

---

# 15. Best Practices

- Deploy in the recommended order.
- Validate each step before proceeding.
- Use dedicated warehouses.
- Grant permissions through roles.
- Avoid using ACCOUNTADMIN for routine ETL.
- Load data into Bronze before running transformations.
- Maintain version-controlled SQL scripts.
- Review query history after deployment.

---

# 16. Deployment Checklist

| Task | Status |
|------|--------|
| Repository cloned | □ |
| Snowflake account ready | □ |
| Warehouses created | □ |
| Database created | □ |
| Schemas created | □ |
| Roles configured | □ |
| Users created | □ |
| Grants applied | □ |
| File formats created | □ |
| Stages created | □ |
| Tables created | □ |
| Bronze loaded | □ |
| Silver loaded | □ |
| Gold loaded | □ |
| Dashboards validated | □ |

---

# 17. Future Enhancements

Future deployment improvements include:

- GitHub Actions CI/CD
- Azure DevOps Pipelines
- Terraform for Snowflake provisioning
- Automated environment promotion (DEV → TEST → PROD)
- Infrastructure as Code (IaC)
- Automated smoke testing
- Deployment notifications
- Blue-Green deployment strategy
- Automated rollback
- Secrets management using external vaults

---

# Conclusion

The RideNow deployment process follows a structured, repeatable approach that ensures consistent creation of Snowflake infrastructure, secure configuration, reliable ETL execution, and successful dashboard deployment.

By following this deployment guide, developers and administrators can deploy the complete platform in a controlled manner while maintaining governance, traceability, and operational reliability.

---

**Document Status:** Approved

**Version:** 1.0

**Maintained By:** Manmeet Singh

**Project:** RideNow Enterprise Data Platform
