# Naming Standards

| Property | Value |
|----------|--------|
| Document | Naming Standards |
| Project | RideNow Enterprise Data Platform |
| Version | 1.0 |
| Status | Approved |
| Author | Manmeet Singh |
| Last Updated | 13-Jul-2026 |

---

# Purpose

This document defines the enterprise naming standards used throughout the RideNow Enterprise Data Platform.

The objective is to establish consistent naming conventions for all Snowflake objects, SQL scripts, Python programs, documentation, images, GitHub folders, and other project artifacts.

Following these standards improves:

- Readability
- Maintainability
- Collaboration
- Deployment consistency
- Operational support

---

# Naming Principles

The following principles apply throughout the project:

- Use UPPER_CASE for all Snowflake database objects.
- Use underscores (_) to separate words.
- Avoid spaces and special characters.
- Use meaningful business-oriented names.
- Follow consistent naming across Development, Test, and Production environments.
- Use standard prefixes and suffixes to indicate object type.
- Keep names concise, descriptive, and easy to understand.

---

# Database Naming Standard

| Environment | Database |
|------------|----------|
| Development | RN_DEV_DB |
| Test | RN_TEST_DB |
| Production | RN_PROD_DB |

---

# Warehouse Naming Standard

| Purpose | Warehouse |
|----------|-----------|
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

## Bronze

CUSTOMER_RAW

DRIVER_RAW

VEHICLE_RAW

TRIP_RAW

PAYMENT_RAW

---

## Silver

CUSTOMER_DIM

DRIVER_DIM

VEHICLE_DIM

CITY_DIM

DATE_DIM

TIME_DIM

PAYMENT_METHOD_DIM

PROMOTION_DIM

---

## Fact Tables

TRIP_FACT

PAYMENT_FACT

RATING_FACT

SURGE_FACT

DRIVER_EARNING_FACT

---

# View Naming

VW_CUSTOMER

VW_DRIVER

VW_REVENUE

---

# Procedure Naming

SP_LOAD_CUSTOMER

SP_LOAD_DRIVER

SP_LOAD_TRIP

---

# Task Naming

TASK_LOAD_CUSTOMER

TASK_LOAD_DRIVER

TASK_LOAD_TRIP

---

# Stream Naming

STR_CUSTOMER

STR_DRIVER

STR_TRIP

---

# Stage Naming

INT_STAGE_CUSTOMER

EXT_STAGE_AWS

---

# Pipe Naming

PIPE_CUSTOMER

PIPE_DRIVER

---

# File Format Naming

FF_CSV

FF_JSON

FF_PARQUET

FF_AVRO

---

# Column Naming Standard

Examples

CUSTOMER_ID

FIRST_NAME

LAST_NAME

EMAIL_ADDRESS

PAYMENT_AMOUNT

CREATED_TIMESTAMP

---

# File Naming Standard

## SQL

01_Create_Database.sql

02_Create_Warehouses.sql

---

## Python

01_Generate_Customers.py

02_Generate_Drivers.py

---

## Documentation

01_Project_Charter.md

05_Data_Model.md

---

## Images

01_ER_Diagram.png

02_Star_Schema.png

---

# Design Decision

The RideNow project adopts standardized naming conventions to ensure consistency across Snowflake objects, documentation, SQL scripts, Python programs, dashboards, and GitHub repositories. These conventions simplify development, improve readability, reduce maintenance effort, and align with enterprise data engineering best practices.
