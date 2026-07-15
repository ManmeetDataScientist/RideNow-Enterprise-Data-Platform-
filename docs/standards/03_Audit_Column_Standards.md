# RideNow Enterprise Data Platform

# 03. Audit Column Standards

---

# Document Information

| Property | Value |
|----------|-------|
| Project | RideNow Enterprise Data Platform |
| Document | Audit Column Standards |
| Version | 1.0 |
| Author | Manmeet Singh |
| Last Updated | 13-Jul-2026 |
| Status | Approved |

---

# Revision History

| Version | Date | Author | Description |
|----------|------|--------|-------------|
| 1.0 | 13-Jul-2026 | Manmeet Singh | Initial Audit Column Standards |

---

# Table of Contents

1. Purpose
2. Audit Column Overview
3. Standard Audit Columns
4. Audit Column Definitions
5. Default Values
6. Usage by Layer
7. Naming Standards
8. Sample Table Design
9. ETL Guidelines
10. Best Practices
11. Audit Checklist

---

# 1. Purpose

Audit columns provide metadata about how and when data is created, modified, and loaded into the RideNow Enterprise Data Platform.

They support:

- Data lineage
- Data quality
- Troubleshooting
- ETL monitoring
- Regulatory compliance
- Historical tracking
- Operational reporting

Every Dimension and Fact table must include the standard audit columns defined in this document.

---

# 2. Audit Column Overview

Audit columns capture information about:

- Record creation
- Record modification
- ETL execution
- Source system
- Data freshness
- User activity

These columns are maintained automatically by the ETL process and should never be updated manually.

---

# 3. Standard Audit Columns

| Column Name | Data Type | Mandatory | Description |
|-------------|-----------|-----------|-------------|
| CREATED_DATE | TIMESTAMP_NTZ | Yes | Record creation timestamp |
| CREATED_BY | VARCHAR(100) | Yes | User or process that created the record |
| UPDATED_DATE | TIMESTAMP_NTZ | Yes | Last update timestamp |
| UPDATED_BY | VARCHAR(100) | Yes | User or process that updated the record |
| LOAD_TIMESTAMP | TIMESTAMP_NTZ | Yes | ETL load timestamp |
| SOURCE_SYSTEM | VARCHAR(50) | Yes | Source application |
| BATCH_ID | NUMBER | Yes | ETL batch identifier |
| RECORD_STATUS | VARCHAR(20) | Yes | Record lifecycle status |

---

# 4. Audit Column Definitions

## CREATED_DATE

### Purpose

Stores the timestamp when the record is first inserted.

### Example

```text
2026-07-13 08:15:42
```

### Rules

- Set only during INSERT
- Never updated afterwards
- Mandatory

---

## CREATED_BY

### Purpose

Identifies the ETL process or user that created the record.

### Example

```text
SP_LOAD_CUSTOMER
```

Possible values

- ETL_PROCESS
- SP_LOAD_CUSTOMER
- SP_LOAD_DRIVER
- MANUAL_LOAD

---

## UPDATED_DATE

### Purpose

Stores the timestamp of the latest modification.

### Example

```text
2026-07-15 14:32:08
```

### Rules

- Updated during MERGE or UPDATE
- Mandatory

---

## UPDATED_BY

### Purpose

Identifies the process responsible for the latest update.

### Example

```text
SP_MERGE_CUSTOMER
```

---

## LOAD_TIMESTAMP

### Purpose

Records the timestamp when the ETL batch loaded the record into Snowflake.

### Example

```text
2026-07-15 02:00:00
```

Unlike CREATED_DATE, LOAD_TIMESTAMP changes with every successful ETL load.

---

## SOURCE_SYSTEM

### Purpose

Identifies the origin of the data.

### Example

```text
CUSTOMER_APP

DRIVER_APP

PAYMENT_GATEWAY

GPS_SERVICE
```

---

## BATCH_ID

### Purpose

Identifies the ETL batch responsible for loading the record.

### Example

```text
20260715001
```

Benefits

- Batch tracking
- Error recovery
- ETL auditing

---

## RECORD_STATUS

### Purpose

Indicates the current lifecycle status of the record.

Allowed values

| Value | Meaning |
|--------|---------|
| ACTIVE | Current valid record |
| INACTIVE | No longer active |
| DELETED | Logically deleted |
| PENDING | Awaiting processing |

---

# 5. Default Values

| Column | Default Value |
|---------|---------------|
| CREATED_DATE | CURRENT_TIMESTAMP() |
| UPDATED_DATE | CURRENT_TIMESTAMP() |
| LOAD_TIMESTAMP | CURRENT_TIMESTAMP() |
| CREATED_BY | CURRENT_USER() or ETL Process |
| UPDATED_BY | CURRENT_USER() or ETL Process |
| SOURCE_SYSTEM | ETL Configuration |
| RECORD_STATUS | ACTIVE |

---

# 6. Usage by Layer

| Layer | Audit Columns Required |
|--------|------------------------|
| Bronze | Yes |
| Silver | Yes |
| Gold | Yes |

### Bronze

- File metadata
- Load timestamp
- Source system
- Batch ID

### Silver

- Standard audit columns
- Data quality tracking
- Business transformations

### Gold

- Reporting metadata
- KPI refresh tracking
- Aggregation timestamp

---

# 7. Naming Standards

Audit column names must be:

- Uppercase
- Singular
- Underscore separated
- Consistent across all tables

Correct

```text
CREATED_DATE
UPDATED_DATE
CREATED_BY
UPDATED_BY
LOAD_TIMESTAMP
```

Incorrect

```text
CreatedDate
created_date
Create_Date
creation_time
```

---

# 8. Sample Table Design

```sql
CREATE TABLE CUSTOMER_DIM (

    CUSTOMER_SK NUMBER,

    CUSTOMER_ID VARCHAR(20),

    FIRST_NAME VARCHAR(100),

    LAST_NAME VARCHAR(100),

    EMAIL VARCHAR(200),

    PHONE_NUMBER VARCHAR(20),

    CREATED_DATE TIMESTAMP_NTZ,

    CREATED_BY VARCHAR(100),

    UPDATED_DATE TIMESTAMP_NTZ,

    UPDATED_BY VARCHAR(100),

    LOAD_TIMESTAMP TIMESTAMP_NTZ,

    SOURCE_SYSTEM VARCHAR(50),

    BATCH_ID NUMBER,

    RECORD_STATUS VARCHAR(20)

);
```

---

# 9. ETL Guidelines

## INSERT

Populate:

- CREATED_DATE
- CREATED_BY
- LOAD_TIMESTAMP
- SOURCE_SYSTEM
- BATCH_ID
- RECORD_STATUS

---

## UPDATE

Update:

- UPDATED_DATE
- UPDATED_BY
- LOAD_TIMESTAMP
- BATCH_ID

Do not modify:

- CREATED_DATE
- CREATED_BY

---

## DELETE

Prefer logical deletion.

Example

```text
RECORD_STATUS = 'DELETED'
```

Avoid physical deletion unless approved by business owners.

---

# 10. Best Practices

- Maintain identical audit columns across all Dimension and Fact tables.
- Populate audit columns automatically.
- Never allow manual updates to audit metadata.
- Use UTC or a consistent enterprise time zone.
- Capture the ETL batch identifier for every load.
- Preserve CREATED_DATE throughout the record lifecycle.
- Use logical deletes where possible.
- Review audit data regularly for troubleshooting.

---

# 11. Audit Checklist

| Item | Status |
|------|--------|
| CREATED_DATE implemented | ✔ |
| CREATED_BY implemented | ✔ |
| UPDATED_DATE implemented | ✔ |
| UPDATED_BY implemented | ✔ |
| LOAD_TIMESTAMP implemented | ✔ |
| SOURCE_SYSTEM implemented | ✔ |
| BATCH_ID implemented | ✔ |
| RECORD_STATUS implemented | ✔ |
| Automatic ETL population | ✔ |
| Logical delete supported | ✔ |

---

# Conclusion

Audit columns provide consistent metadata across the RideNow Enterprise Data Platform, enabling reliable data lineage, ETL monitoring, operational support, and compliance. By applying these standards uniformly across Bronze, Silver, and Gold layers, the platform ensures traceability, simplifies troubleshooting, and supports enterprise-grade governance.

---

**Document Status:** Approved

**Version:** 1.0

**Maintained By:** Manmeet Singh

**Project:** RideNow Enterprise Data Platform
