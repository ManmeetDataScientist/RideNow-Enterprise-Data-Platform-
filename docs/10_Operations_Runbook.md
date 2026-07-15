# RideNow Enterprise Data Platform

# 10. Operations Runbook

---

# Document Information

| Property | Value |
|----------|-------|
| Project | RideNow Enterprise Data Platform |
| Document | Operations Runbook |
| Version | 1.0 |
| Author | Manmeet Singh |
| Last Updated | 13-Jul-2026 |
| Status | Approved |

---

# Revision History

| Version | Date | Author | Description |
|----------|------|--------|-------------|
| 1.0 | 13-Jul-2026 | Manmeet Singh | Initial Operations Runbook |

---

# Table of Contents

1. Purpose
2. Scope
3. Operational Architecture
4. Daily Operations
5. ETL Monitoring
6. Data Load Verification
7. Snowflake Health Checks
8. Warehouse Operations
9. Stage Management
10. User & Role Administration
11. Incident Management
12. Troubleshooting Guide
13. Recovery Procedures
14. Backup & Restore
15. Monitoring Checklist
16. Operational KPIs
17. Maintenance Activities
18. Production Support
19. Escalation Matrix
20. Appendix

---

# 1. Purpose

This Operations Runbook provides operational procedures for maintaining the RideNow Enterprise Data Platform in a stable, secure, and reliable state.

It serves as a reference for Data Engineers, Snowflake Administrators, Production Support teams, and Operations Engineers responsible for day-to-day platform management.

---

# 2. Scope

The runbook covers:

- Snowflake administration
- ETL monitoring
- Data loading
- Incident response
- Backup and recovery
- Performance monitoring
- User administration
- Operational maintenance

---

# 3. Operational Architecture

```text
                 Source Systems
                        │
                        ▼
                  Python Generator
                        │
                        ▼
                    CSV Files
                        │
                        ▼
                  Snowflake Stage
                        │
                        ▼
                     Bronze Layer
                        │
                        ▼
                     Silver Layer
                        │
                        ▼
                      Gold Layer
                        │
                        ▼
               Power BI / Tableau
```

---

# 4. Daily Operations

Daily operational tasks include:

- Verify warehouse status
- Verify ETL execution
- Validate row counts
- Review failed loads
- Monitor warehouse credits
- Check query performance
- Validate dashboard refresh
- Review Snowflake usage history

---

# 5. ETL Monitoring

Monitor each ETL execution for:

| Check | Expected Result |
|---------|----------------|
| Job Started | Yes |
| Job Completed | Yes |
| Execution Time | Within SLA |
| Rows Loaded | Greater than zero |
| Errors | None |
| Duplicate Records | None |
| Reject Records | Within threshold |

---

# 6. Data Load Verification

Verify Bronze Layer:

```sql
SELECT COUNT(*) FROM BRONZE.CUSTOMER_RAW;
```

Verify Silver Layer:

```sql
SELECT COUNT(*) FROM SILVER.CUSTOMER_DIM;
```

Verify Gold Layer:

```sql
SELECT COUNT(*) FROM GOLD.FACT_TRIP;
```

Compare source file record counts with Snowflake tables to ensure completeness.

---

# 7. Snowflake Health Checks

Daily health checks:

- Warehouse running
- Auto Suspend enabled
- Auto Resume enabled
- Stage accessible
- Database available
- Schemas available
- Query history normal
- Credit consumption acceptable

Useful SQL:

```sql
SHOW WAREHOUSES;
SHOW DATABASES;
SHOW SCHEMAS;
```

---

# 8. Warehouse Operations

Warehouses:

| Warehouse | Purpose |
|------------|----------|
| WH_ETL | ETL Processing |
| WH_ANALYTICS | Reporting |
| WH_DATA_SCIENCE | Future ML |

Daily verification:

- Running status
- Warehouse size
- Credit usage
- Suspend status

---

# 9. Stage Management

Verify stages:

```sql
SHOW STAGES;
```

List staged files:

```sql
LIST @CUSTOMER_STAGE;
```

Check:

- File availability
- File size
- File naming convention
- Upload timestamp

---

# 10. User & Role Administration

Daily review:

- New users
- Disabled users
- Role assignments
- Privilege changes

Useful SQL:

```sql
SHOW USERS;

SHOW ROLES;

SHOW GRANTS;
```

Security guidelines:

- Do not grant privileges directly to users.
- Assign access through roles.
- Remove inactive users promptly.

---

# 11. Incident Management

Incident priorities:

| Priority | Description | Target Response |
|-----------|-------------|----------------|
| P1 | Platform unavailable | 15 Minutes |
| P2 | ETL failure | 30 Minutes |
| P3 | Dashboard issue | 4 Hours |
| P4 | Minor enhancement | Next Release |

---

# 12. Troubleshooting Guide

## Issue: Warehouse Suspended

Symptoms:

- Queries fail
- ETL delayed

Resolution:

```sql
ALTER WAREHOUSE WH_ETL RESUME;
```

---

## Issue: Stage Empty

Check:

```sql
LIST @CUSTOMER_STAGE;
```

Upload missing files.

---

## Issue: COPY INTO Failure

Possible causes:

- Invalid file format
- Incorrect stage path
- Corrupt source file

Resolution:

- Validate file
- Re-upload
- Retry COPY INTO

---

## Issue: Duplicate Records

Verify MERGE conditions.

Validate Business Keys.

---

## Issue: Dashboard Missing Data

Verify:

- Gold tables populated
- Dashboard refresh completed
- Warehouse active

---

# 13. Recovery Procedures

Recovery steps:

1. Identify failed component.
2. Review error logs.
3. Correct source issue.
4. Reload Bronze.
5. Re-run Silver.
6. Refresh Gold.
7. Validate row counts.
8. Notify stakeholders.

---

# 14. Backup & Restore

Snowflake capabilities:

- Time Travel
- Fail-safe
- Zero-Copy Clone

Recovery options:

- Restore dropped table
- Recover historical data
- Clone production for testing
- Rollback accidental changes

---

# 15. Monitoring Checklist

Daily checklist:

| Activity | Status |
|-----------|--------|
| Warehouses running | □ |
| ETL successful | □ |
| Source files received | □ |
| Bronze loaded | □ |
| Silver transformed | □ |
| Gold refreshed | □ |
| Dashboard updated | □ |
| Credit usage reviewed | □ |
| Failed queries reviewed | □ |
| Security reviewed | □ |

---

# 16. Operational KPIs

Track:

- ETL Success Rate
- Average ETL Duration
- Warehouse Utilization
- Daily Credit Consumption
- Failed Loads
- Dashboard Refresh Time
- Data Freshness
- Query Performance
- Data Quality Score

---

# 17. Maintenance Activities

Daily:

- Verify ETL
- Review logs
- Check warehouse usage

Weekly:

- Review user access
- Analyze slow queries
- Archive logs

Monthly:

- Warehouse optimization
- Cost review
- Security audit
- Documentation update

Quarterly:

- Disaster Recovery testing
- Capacity planning
- Performance tuning review

---

# 18. Production Support

Support responsibilities:

Level 1

- Basic monitoring
- Restart failed jobs
- Verify dashboards

Level 2

- Resolve ETL failures
- Data validation
- User access issues

Level 3

- Snowflake administration
- Performance tuning
- Security changes
- Platform enhancements

---

# 19. Escalation Matrix

| Issue | Owner |
|---------|-------|
| Warehouse Failure | Snowflake Administrator |
| ETL Failure | Data Engineer |
| Dashboard Failure | BI Developer |
| Security Issue | Security Administrator |
| Performance Issue | Snowflake Administrator |
| Data Quality Issue | Data Engineering Team |

---

# 20. Appendix

## Useful Snowflake Commands

Check Warehouses

```sql
SHOW WAREHOUSES;
```

Check Databases

```sql
SHOW DATABASES;
```

Check Schemas

```sql
SHOW SCHEMAS;
```

Check Users

```sql
SHOW USERS;
```

Check Roles

```sql
SHOW ROLES;
```

Check Query History

```sql
SELECT *
FROM SNOWFLAKE.ACCOUNT_USAGE.QUERY_HISTORY
ORDER BY START_TIME DESC;
```

Check Warehouse Metering

```sql
SELECT *
FROM SNOWFLAKE.ACCOUNT_USAGE.WAREHOUSE_METERING_HISTORY;
```

---

# Best Practices

- Monitor ETL daily.
- Use dedicated warehouses for ETL and reporting.
- Keep Auto Suspend enabled.
- Validate row counts after every load.
- Use MERGE for incremental processing.
- Audit user access regularly.
- Monitor Snowflake credit consumption.
- Document operational changes.
- Review query performance weekly.
- Test recovery procedures quarterly.

---

# Conclusion

The Operations Runbook provides standardized operational procedures for managing the RideNow Enterprise Data Platform. By following these guidelines, operations teams can maintain high availability, ensure data quality, minimize downtime, and support reliable analytics across the Snowflake environment.

---

**Document Status:** Approved

**Version:** 1.0

**Maintained By:** Manmeet Singh

**Project:** RideNow Enterprise Data Platform
