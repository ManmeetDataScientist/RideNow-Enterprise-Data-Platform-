# Naming Standards

| Property | Value |
|----------|--------|
| Document | Naming Standards |
| Project | RideNow Enterprise Data Platform |
| Version | 1.0 |
| Status | Approved |
| Author | Manmeet Singh |
| Reviewer | Self Review |
| Last Updated | 13-Jul-2026 |

---

# Revision History

| Version | Date | Author | Description |
|----------|------|--------|-------------|
| 1.0 | 13-Jul-2026 | Manmeet Singh | Initial Enterprise Naming Standards |

---

# Table of Contents

- [Purpose](#purpose)
- [Naming Principles](#naming-principles)
- [Environment Naming Standard](#environment-naming-standard)
- [Database Naming Standard](#database-naming-standard)
- [Warehouse Naming Standard](#warehouse-naming-standard)
- [Schema Naming Standard](#schema-naming-standard)
- [Table Naming Standard](#table-naming-standard)
- [Column Naming Standard](#column-naming-standard)
- [Primary Key Naming Standard](#primary-key-naming-standard)
- [Foreign Key Naming Standard](#foreign-key-naming-standard)
- [Business Key Naming Standard](#business-key-naming-standard)
- [Surrogate Key Naming Standard](#surrogate-key-naming-standard)
- [View Naming Standard](#view-naming-standard)
- [Secure View Naming Standard](#secure-view-naming-standard)
- [Materialized View Naming Standard](#materialized-view-naming-standard)
- [Stage Naming Standard](#stage-naming-standard)
- [File Format Naming Standard](#file-format-naming-standard)
- [Pipe Naming Standard](#pipe-naming-standard)
- [Stream Naming Standard](#stream-naming-standard)
- [Task Naming Standard](#task-naming-standard)
- [Stored Procedure Naming Standard](#stored-procedure-naming-standard)
- [Function Naming Standard](#function-naming-standard)
- [Sequence Naming Standard](#sequence-naming-standard)
- [Role Naming Standard](#role-naming-standard)
- [User Naming Standard](#user-naming-standard)
- [Resource Monitor Naming Standard](#resource-monitor-naming-standard)
- [File Naming Standard](#file-naming-standard)
- [Folder Naming Standard](#folder-naming-standard)
- [Image Naming Standard](#image-naming-standard)
- [Git Branch Naming Standard](#git-branch-naming-standard)
- [Audit Column Naming Standard](#audit-column-naming-standard)
- [Naming Convention Summary](#naming-convention-summary)
- [Design Decisions](#design-decisions)

---

# Purpose

This document defines the enterprise naming standards used throughout the RideNow Enterprise Data Platform.

Following consistent naming conventions improves:

- Readability
- Maintainability
- Collaboration
- Code Quality
- Deployment Consistency
- Production Support

---

# Naming Principles

The following principles apply throughout the project.

- Use UPPER_CASE for all Snowflake objects.
- Use snake_case for Python files when appropriate.
- Separate words using underscores (_).
- Avoid spaces.
- Avoid special characters.
- Use meaningful business names.
- Keep names concise.
- Follow consistent prefixes and suffixes.
- Follow the same naming convention across Development, Test and Production.

---

# Environment Naming Standard

| Environment | Standard |
|-------------|----------|
| Development | DEV |
| Test | TEST |
| User Acceptance | UAT |
| Production | PROD |

---

# Database Naming Standard

| Object | Example |
|----------|---------|
| Development Database | RN_DEV_DB |
| Test Database | RN_TEST_DB |
| Production Database | RN_PROD_DB |

---

# Warehouse Naming Standard

| Purpose | Example |
|----------|---------|
| ETL | RN_ETL_WH |
| Analytics | RN_ANALYTICS_WH |
| Administration | RN_ADMIN_WH |
| Data Science | RN_DS_WH |

---

# Schema Naming Standard

| Layer | Schema |
|--------|--------|
| Landing | RAW |
| Bronze | BRONZE |
| Silver | SILVER |
| Gold | GOLD |
| Stage | STAGE |
| Security | SECURITY |
| Utility | UTIL |

---

# Table Naming Standard

## Bronze Layer

CUSTOMER_RAW

DRIVER_RAW

VEHICLE_RAW

TRIP_RAW

PAYMENT_RAW

RATING_RAW

CITY_RAW

PROMOTION_RAW

---

## Silver Layer

CUSTOMER_DIM

DRIVER_DIM

VEHICLE_DIM

CITY_DIM

DATE_DIM

TIME_DIM

PAYMENT_METHOD_DIM

PROMOTION_DIM

---

## Gold Layer

TRIP_FACT

PAYMENT_FACT

RATING_FACT

SURGE_FACT

DRIVER_EARNING_FACT

---

# Column Naming Standard

Examples

CUSTOMER_ID

FIRST_NAME

LAST_NAME

EMAIL_ADDRESS

PHONE_NUMBER

CITY_ID

TRIP_DISTANCE_KM

PAYMENT_AMOUNT

CREATED_TIMESTAMP

UPDATED_TIMESTAMP

---

# Primary Key Naming Standard

Examples

CUSTOMER_ID

DRIVER_ID

VEHICLE_ID

CITY_ID

TRIP_ID

PAYMENT_ID

PROMOTION_ID

---

# Foreign Key Naming Standard

Foreign Keys must use exactly the same name as the referenced Primary Key.

Examples

CUSTOMER_ID

DRIVER_ID

CITY_ID

VEHICLE_ID

PROMOTION_ID

---

# Business Key Naming Standard

Examples

CUSTOMER_NUMBER

DRIVER_LICENSE_NUMBER

VEHICLE_REGISTRATION_NUMBER

PROMOTION_CODE

---

# Surrogate Key Naming Standard

Examples

CUSTOMER_SK

DRIVER_SK

VEHICLE_SK

CITY_SK

DATE_SK

TIME_SK

---

# View Naming Standard

Examples

VW_CUSTOMER

VW_TRIP_SUMMARY

VW_REVENUE

VW_DRIVER_PERFORMANCE

---

# Secure View Naming Standard

Examples

SV_CUSTOMER

SV_PAYMENT

SV_DRIVER

---

# Materialized View Naming Standard

Examples

MV_DAILY_REVENUE

MV_MONTHLY_REVENUE

---

# Stage Naming Standard

## Internal Stage

INT_STAGE_CUSTOMER

INT_STAGE_DRIVER

INT_STAGE_TRIP

## External Stage

EXT_STAGE_AWS

EXT_STAGE_AZURE

---

# File Format Naming Standard

FF_CSV

FF_JSON

FF_PARQUET

FF_AVRO

---

# Pipe Naming Standard

PIPE_CUSTOMER

PIPE_DRIVER

PIPE_TRIP

PIPE_PAYMENT

---

# Stream Naming Standard

STR_CUSTOMER

STR_DRIVER

STR_TRIP

STR_PAYMENT

STR_RATING

---

# Task Naming Standard

TASK_LOAD_CUSTOMER

TASK_LOAD_DRIVER

TASK_LOAD_TRIP

TASK_LOAD_PAYMENT

TASK_ETL_DAILY

---

# Stored Procedure Naming Standard

SP_LOAD_CUSTOMER

SP_LOAD_DRIVER

SP_LOAD_TRIP

SP_ERROR_HANDLER

SP_ETL_AUDIT

---

# Function Naming Standard

FN_CALCULATE_DISTANCE

FN_GENERATE_SURGE

FN_GET_TRIP_DURATION

---

# Sequence Naming Standard

SEQ_CUSTOMER

SEQ_DRIVER

SEQ_VEHICLE

SEQ_TRIP

SEQ_PAYMENT

---

# Role Naming Standard

RN_SYSADMIN

RN_SECURITYADMIN

RN_ETL_ROLE

RN_ANALYST_ROLE

RN_DEVELOPER_ROLE

RN_READONLY_ROLE

---

# User Naming Standard

RN_ETL_USER

RN_ANALYST_USER

RN_ADMIN_USER

RN_SERVICE_ACCOUNT

---

# Resource Monitor Naming Standard

RM_ETL

RM_ANALYTICS

RM_DEVELOPMENT

---

# File Naming Standard

## SQL

01_Create_Database.sql

02_Create_Warehouses.sql

03_Create_Schemas.sql

---

## Python

01_Generate_Customers.py

02_Generate_Drivers.py

03_Generate_Trips.py

---

## Documentation

01_Project_Charter.md

05_Data_Model.md

06_Security_Design.md

---

# Folder Naming Standard

Examples

docs/

images/

sql/

python/

data/

deployment/

dashboards/

tests/

---

# Image Naming Standard

01_High_Level_Architecture.png

02_Low_Level_Architecture.png

03_Data_Flow.png

04_Medallion_Architecture.png

05_ER_Diagram.png

06_Star_Schema.png

---

# Git Branch Naming Standard

| Purpose | Example |
|----------|---------|
| Feature | feature/customer-dimension |
| Bug Fix | bugfix/trip-load |
| Documentation | docs/update-readme |
| Release | release/v1.0 |

---

# Audit Column Naming Standard

Every table should include:

SOURCE_SYSTEM

LOAD_DATE

BATCH_ID

CREATED_TIMESTAMP

UPDATED_TIMESTAMP

---

# Naming Convention Summary

| Object | Prefix / Suffix | Example |
|----------|----------------|---------|
| Database | RN_*_DB | RN_DEV_DB |
| Warehouse | RN_*_WH | RN_ETL_WH |
| Raw Table | _RAW | CUSTOMER_RAW |
| Dimension | _DIM | CUSTOMER_DIM |
| Fact | _FACT | TRIP_FACT |
| View | VW_ | VW_CUSTOMER |
| Secure View | SV_ | SV_CUSTOMER |
| Materialized View | MV_ | MV_MONTHLY_REVENUE |
| Internal Stage | INT_STAGE_ | INT_STAGE_CUSTOMER |
| External Stage | EXT_STAGE_ | EXT_STAGE_AWS |
| File Format | FF_ | FF_CSV |
| Pipe | PIPE_ | PIPE_TRIP |
| Stream | STR_ | STR_TRIP |
| Task | TASK_ | TASK_LOAD_TRIP |
| Procedure | SP_ | SP_LOAD_TRIP |
| Function | FN_ | FN_CALCULATE_DISTANCE |
| Sequence | SEQ_ | SEQ_TRIP |
| Role | RN_*_ROLE | RN_ETL_ROLE |
| Resource Monitor | RM_ | RM_ETL |

---

# Design Decisions

The RideNow Enterprise Data Platform follows standardized naming conventions to ensure consistency across Snowflake objects, SQL scripts, Python programs, documentation, GitHub repositories, dashboards, and deployment artifacts.

The standards defined in this document improve readability, reduce maintenance effort, simplify onboarding of new developers, support automation, and align the project with enterprise data engineering best practices.

All future development should comply with these standards unless an approved exception is documented.
