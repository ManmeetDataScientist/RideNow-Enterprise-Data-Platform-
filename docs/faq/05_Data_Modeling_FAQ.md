# RideNow Enterprise Data Platform

# 05. Data Modeling FAQ

---

# Document Information

| Property | Value |
|----------|-------|
| Project | RideNow Enterprise Data Platform |
| Document | Data Modeling FAQ |
| Version | 1.0 |
| Author | Manmeet Singh |
| Last Updated | July 2026 |

---

# Table of Contents

1. Data Modeling Fundamentals
2. OLTP vs OLAP
3. Normalization
4. Dimensional Modeling
5. Fact Tables
6. Dimension Tables
7. Keys
8. Slowly Changing Dimensions (SCD)
9. Star & Snowflake Schema
10. Data Warehouse Design
11. RideNow Implementation
12. Best Practices

---

# 1. Data Modeling Fundamentals

## Q1. What is Data Modeling?

**Answer**

Data Modeling is the process of defining how business data is organized, stored, and related within a database or data warehouse.

It provides a blueprint for database design and ensures consistency, scalability, and maintainability.

**RideNow Example**

RideNow models business entities such as Customer, Driver, Vehicle, Trip, Payment, Rating, and Promotion before implementing them in Snowflake.

**Interview Tip**

Expect follow-up questions about conceptual, logical, and physical data models.

---

## Q2. Why is Data Modeling important?

**Answer**

A good data model:

- Improves data quality
- Reduces redundancy
- Simplifies reporting
- Supports scalability
- Enables efficient analytics

**RideNow Example**

The logical data model remains independent of the physical Medallion implementation (Bronze, Silver, Gold).

---

## Q3. What are the three levels of Data Modeling?

**Answer**

- Conceptual Data Model
- Logical Data Model
- Physical Data Model

---

## Q4. What is a Conceptual Data Model?

A high-level representation of business entities and relationships without implementation details.

---

## Q5. What is a Logical Data Model?

Defines entities, attributes, relationships, and business rules independent of any database technology.

---

## Q6. What is a Physical Data Model?

Defines actual tables, columns, data types, indexes (where applicable), and storage structures.

---

## Q7. Which data model is documented in RideNow?

RideNow primarily documents the **Logical Data Model**, while mapping it to the physical Snowflake implementation.

---

## Q8. What is an Entity?

An entity represents a business object.

Examples:

- Customer
- Driver
- Vehicle
- Trip

---

## Q9. What is an Attribute?

Attributes describe an entity.

Example:

Customer

- Customer Name
- Email
- Phone Number

---

## Q10. What is a Relationship?

A relationship defines how two entities interact.

Example:

One Customer can book many Trips.

---

# 2. OLTP vs OLAP

## Q11. What is OLTP?

Online Transaction Processing focuses on day-to-day business transactions.

Examples:

- Booking rides
- Payments
- Customer registration

---

## Q12. What is OLAP?

Online Analytical Processing focuses on reporting and business analytics.

Examples:

- Monthly revenue
- Driver performance
- Customer retention

---

## Q13. Which one does RideNow implement?

RideNow demonstrates an OLAP data warehouse built from OLTP source systems.

---

## Q14. Why separate OLTP and OLAP?

Reasons:

- Better performance
- Historical analysis
- Business reporting
- Reduced operational impact

---

## Q15. What is a Data Warehouse?

A centralized repository designed for analytical processing and reporting.

---

# 3. Normalization

## Q16. What is Normalization?

Normalization organizes data to reduce redundancy and improve integrity.

---

## Q17. What is First Normal Form (1NF)?

Each column contains atomic values with no repeating groups.

---

## Q18. What is Second Normal Form (2NF)?

Every non-key attribute depends on the entire primary key.

---

## Q19. What is Third Normal Form (3NF)?

Removes transitive dependencies.

---

## Q20. Why is OLTP highly normalized?

To minimize redundancy and maintain data integrity.

---

# 4. Dimensional Modeling

## Q21. What is Dimensional Modeling?

A technique used in data warehouses to simplify reporting.

---

## Q22. What is a Dimension?

A dimension provides descriptive information.

Examples:

Customer

Driver

City

Date

---

## Q23. What is a Fact?

A fact stores measurable business events.

Examples:

Trip Fare

Distance

Payment Amount

---

## Q24. Why use Dimensional Modeling?

Benefits:

- Faster queries
- Easier reporting
- Business-friendly design

---

## Q25. Which methodology inspired modern dimensional modeling?

Ralph Kimball's dimensional modeling approach.

---

# 5. Fact Tables

## Q26. What is a Fact Table?

Stores measurable business transactions.

---

## Q27. Which Fact Tables exist in RideNow?

- FACT_TRIP
- FACT_PAYMENT
- FACT_DRIVER_EARNING
- FACT_SURGE

---

## Q28. What types of Facts exist?

- Transaction Fact
- Snapshot Fact
- Accumulating Snapshot

---

## Q29. What is the Grain of a Fact Table?

Defines the lowest level of detail stored.

Example:

One record per completed trip.

---

## Q30. Why is Grain important?

It determines data consistency and reporting accuracy.

---

# 6. Dimension Tables

## Q31. What is a Dimension Table?

Stores descriptive business attributes.

---

## Q32. Which Dimensions exist in RideNow?

- CUSTOMER_DIM
- DRIVER_DIM
- VEHICLE_DIM
- CITY_DIM
- DATE_DIM
- TIME_DIM

---

## Q33. What is a Conformed Dimension?

A shared dimension used across multiple fact tables.

---

## Q34. Why is DATE_DIM important?

Supports time-based reporting without repeatedly calculating calendar attributes.

---

## Q35. Why use TIME_DIM?

Supports hourly analysis and peak traffic reporting.

---

# 7. Keys

## Q36. What is a Primary Key?

Uniquely identifies each row.

---

## Q37. What is a Foreign Key?

Links two related tables.

---

## Q38. What is a Business Key?

A key originating from the operational system.

---

## Q39. What is a Surrogate Key?

A warehouse-generated unique identifier.

---

## Q40. Why use Surrogate Keys?

- Better joins
- Stable identifiers
- Historical tracking
- SCD support

---

# 8. Slowly Changing Dimensions (SCD)

## Q41. What is SCD?

A technique to manage historical changes in dimension tables.

---

## Q42. What is Type 0?

No changes allowed.

---

## Q43. What is Type 1?

Overwrite existing values.

---

## Q44. What is Type 2?

Maintain complete history using new records.

---

## Q45. Which SCD types are used in RideNow?

Type 0, Type 1, and Type 2.

---

# 9. Star & Snowflake Schema

## Q46. What is a Star Schema?

A central Fact Table connected directly to Dimension Tables.

---

## Q47. What is a Snowflake Schema?

A normalized extension of a Star Schema where dimensions are further split into related tables.

---

## Q48. Why does RideNow use a Star Schema?

Star Schema provides:

- Simpler queries
- Faster reporting
- Better usability for BI tools

---

## Q49. Star Schema vs Snowflake Schema?

| Feature | Star | Snowflake |
|----------|------|-----------|
| Normalization | Low | High |
| Query Simplicity | High | Moderate |
| Join Count | Fewer | More |
| Reporting Performance | Faster | Slightly Slower |
| Ease of Use | High | Moderate |

---

## Q50. Does RideNow use both?

RideNow primarily uses a **Star Schema** for analytics, while the overall platform follows a **Medallion Architecture** for data processing.

---

# 10. Data Warehouse Design

## Q51. What is a Data Mart?

A subject-oriented subset of a data warehouse.

---

## Q52. What is Data Granularity?

The level of detail stored in the warehouse.

---

## Q53. Why document business rules?

To ensure consistent transformations and reporting across the platform.

---

## Q54. What is Data Lineage?

Tracking data from its source through transformations to its final destination.

---

## Q55. Why separate logical and physical models?

The logical model represents business concepts, while the physical model adapts to the chosen technology without changing business definitions.

---

# 11. RideNow Implementation

## Q56. Which business entities are modeled?

- Customer
- Driver
- Vehicle
- City
- Promotion
- Trip
- Payment
- Rating

---

## Q57. Which architecture is used?

Medallion Architecture:

- Bronze
- Silver
- Gold

---

## Q58. Where is the Star Schema implemented?

Primarily in the Gold layer for analytics and reporting.

---

## Q59. Why maintain separate Bronze, Silver, and Gold layers?

To separate raw ingestion, standardized business data, and reporting-ready datasets.

---

## Q60. What is the primary goal of the RideNow data model?

To create a scalable, maintainable, and business-oriented foundation for enterprise analytics.

---

# 12. Best Practices

## Q61. What are common data modeling best practices?

- Define clear grain
- Use surrogate keys
- Maintain conformed dimensions
- Document business rules
- Avoid unnecessary redundancy
- Follow naming standards
- Validate relationships
- Design for scalability

---

## Q62. How does good data modeling benefit analytics?

It improves:

- Query performance
- Data quality
- User understanding
- Long-term maintainability

---

# References

- Ralph Kimball – The Data Warehouse Toolkit
- Bill Inmon – Building the Data Warehouse
- Snowflake Documentation
- RideNow Data Model Documentation

---

**Document Status:** Approved

**Version:** 1.0

**Maintained By:** Manmeet Singh
