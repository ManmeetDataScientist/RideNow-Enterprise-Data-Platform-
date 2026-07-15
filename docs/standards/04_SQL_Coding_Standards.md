# RideNow Enterprise Data Platform

# 04. SQL Coding Standards

---

# Document Information

| Property | Value |
|----------|-------|
| Project | RideNow Enterprise Data Platform |
| Document | SQL Coding Standards |
| Version | 1.0 |
| Author | Manmeet Singh |
| Last Updated | 13-Jul-2026 |
| Status | Approved |

---

# Revision History

| Version | Date | Author | Description |
|----------|------|--------|-------------|
| 1.0 | 13-Jul-2026 | Manmeet Singh | Initial SQL Coding Standards |

---

# Table of Contents

1. Purpose
2. Scope
3. General Principles
4. Naming Standards
5. SQL Formatting
6. Keyword Standards
7. Table Alias Standards
8. JOIN Standards
9. WHERE Clause Standards
10. CTE Standards
11. DDL Standards
12. DML Standards
13. MERGE Standards
14. Stored Procedure Standards
15. Commenting Standards
16. Error Handling
17. Performance Guidelines
18. Security Guidelines
19. Code Review Checklist
20. Best Practices

---

# 1. Purpose

This document defines the SQL coding standards used throughout the RideNow Enterprise Data Platform.

The objectives are to:

- Improve readability
- Maintain consistency
- Simplify maintenance
- Improve performance
- Support code reviews
- Follow enterprise development standards

These standards apply to all Snowflake SQL scripts within the project.

---

# 2. Scope

The standards apply to:

- DDL Scripts
- DML Scripts
- Views
- Stored Procedures
- Tasks
- Streams
- MERGE Statements
- ETL SQL
- Reporting Queries

---

# 3. General Principles

- Write readable SQL.
- Prefer clarity over cleverness.
- Keep scripts modular.
- Avoid duplicate logic.
- Use uppercase SQL keywords.
- Use meaningful object names.
- Indent consistently.
- Document complex logic.

---

# 4. Naming Standards

## Tables

```text
CUSTOMER_DIM
TRIP_FACT
PAYMENT_RAW
```

---

## Views

```text
VW_CUSTOMER_SUMMARY
VW_DRIVER_PERFORMANCE
```

---

## Procedures

```text
SP_LOAD_CUSTOMER
SP_MERGE_DRIVER
SP_BUILD_FACT_TRIP
```

---

## Stages

```text
CUSTOMER_STAGE
TRIP_STAGE
```

---

## File Formats

```text
CSV_FILE_FORMAT
```

---

## Variables

```text
V_BATCH_ID
V_ROW_COUNT
V_START_TIME
```

---

# 5. SQL Formatting

Use one column per line.

Good

```sql
SELECT
    CUSTOMER_ID,
    FIRST_NAME,
    LAST_NAME,
    EMAIL
FROM CUSTOMER_DIM;
```

Bad

```sql
SELECT CUSTOMER_ID,FIRST_NAME,LAST_NAME,EMAIL FROM CUSTOMER_DIM;
```

---

# 6. Keyword Standards

SQL keywords must always be uppercase.

Good

```sql
SELECT
FROM
WHERE
GROUP BY
ORDER BY
MERGE
INSERT
UPDATE
DELETE
```

Bad

```sql
select
from
where
```

---

# 7. Table Alias Standards

Use short, meaningful aliases.

Good

```sql
SELECT
    C.CUSTOMER_NAME,
    T.TRIP_DATE
FROM CUSTOMER_DIM C
INNER JOIN TRIP_FACT T
    ON C.CUSTOMER_SK = T.CUSTOMER_SK;
```

Avoid

```sql
FROM CUSTOMER_DIM A
JOIN TRIP_FACT B
```

---

# 8. JOIN Standards

Always specify the JOIN type.

Good

```sql
INNER JOIN
LEFT JOIN
RIGHT JOIN
FULL OUTER JOIN
```

Avoid

```sql
JOIN
```

Always place join conditions on separate lines.

---

# 9. WHERE Clause Standards

Each condition should be on a new line.

```sql
WHERE
    CITY = 'Bangalore'
    AND TRIP_DATE >= CURRENT_DATE - 30
    AND TRIP_STATUS = 'COMPLETED';
```

---

# 10. CTE Standards

Use CTEs for complex logic.

```sql
WITH CUSTOMER_TRIPS AS (

    SELECT
        CUSTOMER_SK,
        COUNT(*) AS TOTAL_TRIPS
    FROM FACT_TRIP
    GROUP BY CUSTOMER_SK

)

SELECT *
FROM CUSTOMER_TRIPS;
```

Avoid deeply nested subqueries where a CTE improves readability.

---

# 11. DDL Standards

Example

```sql
CREATE TABLE CUSTOMER_DIM (

    CUSTOMER_SK NUMBER,

    CUSTOMER_ID VARCHAR(20),

    CUSTOMER_NAME VARCHAR(100),

    EMAIL VARCHAR(200),

    CREATED_DATE TIMESTAMP_NTZ

);
```

Rules

- One column per line.
- Align data types.
- Group audit columns at the end.
- Use uppercase object names.

---

# 12. DML Standards

INSERT

Specify column names explicitly.

Good

```sql
INSERT INTO CUSTOMER_DIM (

    CUSTOMER_ID,
    CUSTOMER_NAME,
    EMAIL

)
VALUES (

    'CUST001',
    'John Smith',
    'john@email.com'

);
```

Never rely on column order.

---

# 13. MERGE Standards

Preferred for incremental loading.

```sql
MERGE INTO CUSTOMER_DIM T

USING CUSTOMER_RAW S

ON T.CUSTOMER_ID = S.CUSTOMER_ID

WHEN MATCHED THEN
    UPDATE SET
        T.EMAIL = S.EMAIL,
        T.UPDATED_DATE = CURRENT_TIMESTAMP()

WHEN NOT MATCHED THEN
    INSERT (
        CUSTOMER_ID,
        EMAIL
    )
    VALUES (
        S.CUSTOMER_ID,
        S.EMAIL
    );
```

---

# 14. Stored Procedure Standards

Procedure naming:

```text
SP_LOAD_CUSTOMER
SP_LOAD_TRIP
SP_BUILD_GOLD
```

Guidelines

- One responsibility per procedure.
- Log execution status.
- Handle exceptions.
- Return execution status.

---

# 15. Commenting Standards

File Header

```sql
-------------------------------------------------------
Project : RideNow
Module  : Customer Load
Author  : Manmeet Singh
Purpose : Load Customer Dimension
-------------------------------------------------------
```

Inline Comments

```sql
-- Remove duplicate customers
```

Avoid obvious comments.

Bad

```sql
-- Select data
SELECT *
```

---

# 16. Error Handling

Stored procedures should:

- Capture SQL errors
- Log failures
- Return meaningful messages
- Record execution time

Example

```sql
EXCEPTION

WHEN OTHER THEN

RETURN 'Load Failed';
```

---

# 17. Performance Guidelines

- Avoid SELECT *
- Filter early
- Use appropriate JOINs
- Minimize DISTINCT
- Prefer MERGE over DELETE + INSERT
- Avoid unnecessary ORDER BY
- Process data in bulk
- Push transformations into Snowflake

---

# 18. Security Guidelines

- Never hardcode passwords.
- Avoid sensitive data in scripts.
- Use roles for permissions.
- Grant least privilege.
- Use Secure Views for reporting.
- Avoid using ACCOUNTADMIN for ETL execution.

---

# 19. Code Review Checklist

| Item | Status |
|------|--------|
| Naming standards followed | □ |
| SQL keywords uppercase | □ |
| Proper indentation | □ |
| No SELECT * | □ |
| Explicit JOIN type | □ |
| Column names specified | □ |
| Audit columns included | □ |
| Comments added | □ |
| Error handling implemented | □ |
| Performance reviewed | □ |

---

# 20. Best Practices

- Keep SQL simple and readable.
- Follow consistent formatting.
- Use meaningful aliases.
- Prefer CTEs for complex queries.
- Separate DDL and DML scripts.
- Use MERGE for incremental processing.
- Validate row counts after loads.
- Include audit columns in all Dimension and Fact tables.
- Review SQL before deployment.
- Store all SQL scripts in GitHub with version control.

---

# Conclusion

Following these SQL Coding Standards ensures that all Snowflake SQL developed for the RideNow Enterprise Data Platform is consistent, maintainable, secure, and optimized for enterprise-scale data engineering. Adhering to these guidelines improves collaboration, simplifies code reviews, and supports long-term maintainability.

---

**Document Status:** Approved

**Version:** 1.0

**Maintained By:** Manmeet Singh

**Project:** RideNow Enterprise Data Platform
