# RideNow Enterprise Data Platform

# 03. SQL FAQ

---

# Document Information

| Property | Value |
|----------|-------|
| Project | RideNow Enterprise Data Platform |
| Document | SQL FAQ |
| Version | 1.0 |
| Author | Manmeet Singh |
| Last Updated | July 2026 |

---

# Table of Contents

1. SQL Fundamentals
2. SQL Data Types
3. DDL (Data Definition Language)
4. DML (Data Manipulation Language)
5. Constraints
6. Joins
7. Aggregate Functions
8. Window Functions
9. Common Table Expressions (CTE)
10. Views
11. Stored Procedures
12. ETL & ELT
13. Data Warehouse SQL
14. Performance Optimization
15. SQL Best Practices
16. RideNow Implementation

---

# 1. SQL Fundamentals

## Q1. What is SQL?

SQL (Structured Query Language) is the standard language used to create, manage, query, and manipulate relational databases.

---

## Q2. What are the major categories of SQL commands?

- DDL (CREATE, ALTER, DROP)
- DML (INSERT, UPDATE, DELETE, MERGE)
- DQL (SELECT)
- DCL (GRANT, REVOKE)
- TCL (COMMIT, ROLLBACK)

---

## Q3. What is the difference between SQL and Snowflake SQL?

Snowflake SQL follows ANSI SQL while providing additional cloud-native features such as:

- COPY INTO
- Streams
- Tasks
- Time Travel
- Zero-Copy Cloning

---

# 2. SQL Data Types

## Q4. Which data types are commonly used?

- NUMBER
- VARCHAR
- DATE
- TIME
- TIMESTAMP
- BOOLEAN
- FLOAT
- VARIANT

---

## Q5. When should VARCHAR be used?

VARCHAR stores variable-length character data such as names, email addresses, and cities.

---

## Q6. What is the difference between DATE and TIMESTAMP?

DATE stores only the calendar date.

TIMESTAMP stores both date and time.

---

# 3. DDL (Data Definition Language)

## Q7. What is DDL?

DDL defines database objects.

Examples:

- CREATE
- ALTER
- DROP
- TRUNCATE

---

## Q8. Difference between DELETE, TRUNCATE, and DROP?

| Command | Removes Data | Removes Structure |
|----------|--------------|-------------------|
| DELETE | Yes | No |
| TRUNCATE | Yes | No |
| DROP | Yes | Yes |

---

# 4. DML (Data Manipulation Language)

## Q9. What is DML?

DML modifies data.

Examples:

- INSERT
- UPDATE
- DELETE
- MERGE

---

## Q10. Why is MERGE important in Data Engineering?

MERGE supports incremental loading by combining INSERT and UPDATE logic into a single statement.

---

# 5. Constraints

## Q11. What are constraints?

Constraints enforce data integrity.

Examples:

- PRIMARY KEY
- FOREIGN KEY
- UNIQUE
- NOT NULL

---

## Q12. Does Snowflake enforce Primary Keys?

No.

Snowflake stores constraint metadata but does not enforce most constraints.

---

# 6. Joins

## Q13. What types of joins exist?

- INNER JOIN
- LEFT JOIN
- RIGHT JOIN
- FULL OUTER JOIN
- CROSS JOIN
- SELF JOIN

---

## Q14. Which join is most commonly used in data warehouses?

INNER JOIN and LEFT JOIN.

---

## Q15. What is a CROSS JOIN?

Returns every possible combination of rows from two tables.

---

# 7. Aggregate Functions

## Q16. What are aggregate functions?

Examples:

- COUNT()
- SUM()
- AVG()
- MIN()
- MAX()

---

## Q17. Difference between WHERE and HAVING?

WHERE filters rows before aggregation.

HAVING filters groups after aggregation.

---

# 8. Window Functions

## Q18. What is a Window Function?

A window function performs calculations across a set of rows without collapsing the result set.

---

## Q19. Common window functions?

- ROW_NUMBER()
- RANK()
- DENSE_RANK()
- LAG()
- LEAD()
- FIRST_VALUE()
- LAST_VALUE()

---

## Q20. Why use ROW_NUMBER()?

It assigns a unique sequential number within a partition.

Frequently used for removing duplicates.

---

# 9. Common Table Expressions (CTE)

## Q21. What is a CTE?

A Common Table Expression is a temporary named result set used to simplify complex SQL.

---

## Q22. Why use CTEs?

Benefits:

- Better readability
- Reusability
- Easier debugging

---

# 10. Views

## Q23. What is a View?

A View is a virtual table created using a SQL query.

---

## Q24. Why use Views?

Views simplify reporting and improve security by hiding underlying tables.

---

# 11. Stored Procedures

## Q25. What is a Stored Procedure?

A stored procedure is a reusable program containing SQL logic.

---

## Q26. Why use Stored Procedures?

- Reusable business logic
- Error handling
- ETL automation
- Improved maintainability

---

# 12. ETL & ELT

## Q27. Difference between ETL and ELT?

ETL transforms data before loading.

ELT loads data first and performs transformations inside the warehouse.

RideNow primarily follows the ELT approach.

---

## Q28. Which SQL commands are commonly used in ETL?

- COPY INTO
- INSERT
- UPDATE
- MERGE
- DELETE

---

# 13. Data Warehouse SQL

## Q29. Why use Dimension Tables?

Dimension tables provide descriptive attributes for business analysis.

---

## Q30. Why use Fact Tables?

Fact tables store measurable business events such as trips, payments, and revenue.

---

## Q31. What is a Surrogate Key?

A system-generated key used internally by the data warehouse.

---

## Q32. What is a Business Key?

A key originating from the source system that uniquely identifies a business entity.

---

# 14. Performance Optimization

## Q33. How can SQL performance be improved?

- Select only required columns
- Filter early
- Use appropriate joins
- Avoid SELECT *
- Minimize unnecessary sorting

---

## Q34. Why avoid SELECT *?

It reads unnecessary columns, increases I/O, and reduces readability.

---

## Q35. Why use EXPLAIN plans?

Execution plans help understand how queries are processed and identify performance bottlenecks.

---

# 15. SQL Best Practices

## Q36. Why follow naming standards?

Consistent naming improves readability, maintainability, and collaboration.

---

## Q37. Why use meaningful aliases?

Aliases improve query readability, especially in complex joins.

---

## Q38. Why format SQL consistently?

Consistent formatting makes code reviews and debugging easier.

---

# 16. RideNow Implementation

## Q39. Which SQL objects are created in RideNow?

- Databases
- Schemas
- Tables
- Views
- Stages
- File Formats
- Stored Procedures
- Tasks
- Streams

---

## Q40. Which SQL features are demonstrated?

- Enterprise DDL
- Incremental Loading
- MERGE
- Window Functions
- CTEs
- Views
- Stored Procedures
- Data Warehouse Design
- SQL Coding Standards

---

# References

- ANSI SQL Standard
- Snowflake SQL Documentation
- RideNow SQL Coding Standards
- RideNow Data Model

---

**Document Status:** Approved

**Version:** 1.0

**Maintained By:** Manmeet Singh
