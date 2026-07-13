# Data Type Standards

| Property | Value |
|----------|--------|
| Document | Data Type Standards |
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
| 1.0 | 13-Jul-2026 | Manmeet Singh | Initial Enterprise Data Type Standards |

---

# Table of Contents

- [Purpose](#purpose)
- [Objectives](#objectives)
- [General Guidelines](#general-guidelines)
- [Snowflake Data Type Categories](#snowflake-data-type-categories)
- [String Data Types](#string-data-types)
- [Numeric Data Types](#numeric-data-types)
- [Date and Time Data Types](#date-and-time-data-types)
- [Boolean Data Types](#boolean-data-types)
- [Semi-Structured Data Types](#semi-structured-data-types)
- [Geospatial Data Types](#geospatial-data-types)
- [Enterprise Data Type Standards](#enterprise-data-type-standards)
- [Business Data Mapping](#business-data-mapping)
- [Data Type Selection Guidelines](#data-type-selection-guidelines)
- [Naming and Data Type Standards](#naming-and-data-type-standards)
- [Common Mistakes to Avoid](#common-mistakes-to-avoid)
- [Best Practices](#best-practices)
- [Design Decisions](#design-decisions)
- [Summary](#summary)

---

# Purpose

This document defines the standard data types used throughout the RideNow Enterprise Data Platform.

The objective is to ensure consistency across all Snowflake databases, schemas, tables, views, stored procedures, ETL processes, dashboards, and reporting layers.

---

# Objectives

- Standardize data types across all tables.
- Improve data quality and consistency.
- Optimize Snowflake storage.
- Improve query performance.
- Simplify ETL development.
- Reduce implementation errors.
- Support enterprise scalability.

---

# General Guidelines

- Use the smallest appropriate data type.
- Store business identifiers as VARCHAR.
- Store monetary values as NUMBER(precision, scale).
- Use DATE when time is not required.
- Use TIMESTAMP_NTZ for audit timestamps.
- Use BOOLEAN for Yes/No values.
- Avoid unnecessary large VARCHAR sizes.
- Use consistent precision throughout the project.

---

# Snowflake Data Type Categories

| Category | Examples |
|-----------|----------|
| String | VARCHAR |
| Numeric | NUMBER, INTEGER, FLOAT |
| Date & Time | DATE, TIME, TIMESTAMP_NTZ |
| Boolean | BOOLEAN |
| Semi-Structured | VARIANT, OBJECT, ARRAY |
| Geospatial | GEOGRAPHY |

---

# String Data Types

| Data Type | Usage |
|-----------|-------|
| VARCHAR(20) | IDs |
| VARCHAR(50) | Codes |
| VARCHAR(100) | Names |
| VARCHAR(255) | Email |
| VARCHAR(500) | Address |
| VARCHAR(1000) | Comments |

---

# Numeric Data Types

| Data Type | Usage |
|-----------|-------|
| NUMBER(10,0) | Integer Values |
| NUMBER(10,2) | Amount |
| NUMBER(18,2) | Revenue |
| NUMBER(5,2) | Distance |
| NUMBER(3,2) | Ratings |
| INTEGER | Counts |
| FLOAT | GPS Coordinates |

---

# Date and Time Data Types

| Data Type | Usage |
|-----------|-------|
| DATE | Business Date |
| TIME | Business Time |
| TIMESTAMP_NTZ | Audit Timestamp |
| TIMESTAMP_LTZ | Local Time Zone |
| TIMESTAMP_TZ | Global Applications |

**RideNow Standard:** Use **TIMESTAMP_NTZ** unless a business requirement explicitly needs time zone support.

---

# Boolean Data Types

| Data Type | Usage |
|-----------|-------|
| BOOLEAN | TRUE / FALSE |

Examples:

- IS_ACTIVE
- IS_CANCELLED
- IS_VERIFIED

---

# Semi-Structured Data Types

| Data Type | Usage |
|-----------|-------|
| VARIANT | JSON Data |
| OBJECT | Key-Value Pairs |
| ARRAY | Collections |

---

# Geospatial Data Types

| Data Type | Usage |
|-----------|-------|
| GEOGRAPHY | Pickup and Drop Coordinates |

---

# Enterprise Data Type Standards

| Business Attribute | Snowflake Data Type |
|--------------------|--------------------|
| Customer ID | VARCHAR(20) |
| Driver ID | VARCHAR(20) |
| Vehicle ID | VARCHAR(20) |
| Trip ID | VARCHAR(20) |
| Payment ID | VARCHAR(20) |
| Promotion ID | VARCHAR(20) |
| First Name | VARCHAR(100) |
| Last Name | VARCHAR(100) |
| Email Address | VARCHAR(255) |
| Mobile Number | VARCHAR(20) |
| Vehicle Number | VARCHAR(30) |
| License Number | VARCHAR(50) |
| City Name | VARCHAR(100) |
| Currency | VARCHAR(10) |
| Fare Amount | NUMBER(10,2) |
| Driver Earnings | NUMBER(10,2) |
| Discount Amount | NUMBER(10,2) |
| Tax Amount | NUMBER(10,2) |
| Distance (KM) | NUMBER(6,2) |
| Duration (Minutes) | NUMBER(6,2) |
| Rating | NUMBER(2,1) |
| Trip Count | INTEGER |
| Created Date | DATE |
| Created Timestamp | TIMESTAMP_NTZ |
| Updated Timestamp | TIMESTAMP_NTZ |
| Load Date | DATE |
| Batch ID | VARCHAR(50) |
| Source System | VARCHAR(50) |
| Active Flag | BOOLEAN |

---

# Business Data Mapping

| Business Data | Example |
|---------------|---------|
| Customer Name | VARCHAR(100) |
| Email | VARCHAR(255) |
| Mobile | VARCHAR(20) |
| Fare | NUMBER(10,2) |
| Discount | NUMBER(10,2) |
| Tax | NUMBER(10,2) |
| Rating | NUMBER(2,1) |
| Trip Date | DATE |
| Trip Timestamp | TIMESTAMP_NTZ |
| Active Flag | BOOLEAN |

---

# Data Type Selection Guidelines

| Scenario | Recommended Data Type |
|-----------|----------------------|
| Business Identifier | VARCHAR |
| Monetary Value | NUMBER(10,2) |
| Percentage | NUMBER(5,2) |
| Count | INTEGER |
| Date | DATE |
| Timestamp | TIMESTAMP_NTZ |
| Boolean | BOOLEAN |
| JSON | VARIANT |

---

# Naming and Data Type Standards

| Column Suffix | Data Type |
|---------------|-----------|
| _ID | VARCHAR(20) |
| _NAME | VARCHAR(100) |
| _CODE | VARCHAR(50) |
| _AMOUNT | NUMBER(10,2) |
| _COUNT | INTEGER |
| _DATE | DATE |
| _TIMESTAMP | TIMESTAMP_NTZ |
| _FLAG | BOOLEAN |
| _RATING | NUMBER(2,1) |

---

# Common Mistakes to Avoid

- Using VARCHAR for numeric values.
- Storing dates as text.
- Using FLOAT for financial amounts.
- Using oversized VARCHAR columns without justification.
- Mixing timestamp types in the same project.
- Using inconsistent precision for monetary values.

---

# Best Practices

- Keep data types consistent across all layers.
- Validate source data before loading.
- Define precision for all numeric columns.
- Use DATE whenever time is unnecessary.
- Use TIMESTAMP_NTZ for ETL and audit columns.
- Document every exception to these standards.

---

# Design Decisions

The RideNow Enterprise Data Platform adopts standardized Snowflake data types to improve data quality, reduce storage costs, optimize query performance, and simplify ETL development. Standardized data types also ensure consistent implementation across Bronze, Silver, and Gold layers while supporting scalability and maintainability.

---

# Summary

This document serves as the enterprise reference for selecting Snowflake data types across the RideNow project. All SQL scripts, ETL workflows, Python data generators, dashboards, and future enhancements should follow these standards unless an approved exception is documented.
