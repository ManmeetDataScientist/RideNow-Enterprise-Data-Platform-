09_Interview_FAQ.md

1. HR & Behavioral Questions (30)

2. Resume & Project Questions (30)

3. Data Engineering Fundamentals (40)

4. Snowflake (60)

5. SQL (50)

6. Python (40)

7. Data Modeling (40)

8. ETL / ELT (30)

9. Power BI (20)

10. Git & GitHub (20)

11. Architecture & Design (20)

12. Scenario-Based Questions (20)

Total = 400 Questions

## Q127. What is a Snowflake Virtual Warehouse?

### Answer

A Virtual Warehouse is an independent compute cluster that executes SQL queries and data processing in Snowflake. Compute resources can be started, stopped, resized, and scaled independently of storage.

### RideNow Example

RideNow uses separate warehouses:
- WH_ETL for data ingestion and transformation
- WH_ANALYTICS for reporting
- WH_DATA_SCIENCE for future ML workloads

### Interview Tip

Mention that separating warehouses prevents ETL jobs from competing with reporting queries, improving both performance and cost control.

### Follow-up Questions

- Can warehouses auto-scale?
- What is auto-suspend?
- What is multi-cluster?
- How do you reduce warehouse costs?
- 

## Q145. Why did you choose Snowflake?

### Interview Answer

Snowflake was selected because it provides independent compute and storage scaling, cloud-native architecture, automatic optimization, and enterprise security features. These capabilities make it well suited for building scalable analytics platforms.

### RideNow Example

In RideNow, separate virtual warehouses are used for ETL and reporting workloads. Data is ingested through Bronze, transformed in Silver, and exposed to Power BI from the Gold layer.

### Follow-up Questions

- Why not Databricks?
- Why not SQL Server?
- Why separate warehouses?
- How do you optimize costs?
