# RideNow Enterprise Data Platform

# 06. Security Design

---

# Document Information

| Property | Value |
|----------|-------|
| Project | RideNow Enterprise Data Platform |
| Document | Security Design |
| Version | 1.0 |
| Author | Manmeet Singh |
| Last Updated | 13-Jul-2026 |
| Status | Approved |

---

# Revision History

| Version | Date | Author | Description |
|----------|------|--------|-------------|
| 1.0 | 13-Jul-2026 | Manmeet Singh | Initial Security Design |

---

# Table of Contents

1. Purpose
2. Security Objectives
3. Security Principles
4. Snowflake Security Architecture
5. Authentication
6. Authorization
7. Role-Based Access Control (RBAC)
8. Role Hierarchy
9. User Management
10. Database Security
11. Schema Security
12. Warehouse Security
13. Object-Level Security
14. Data Protection
15. Network Security
16. Encryption
17. Data Masking
18. Row Access Policies
19. Secure Views
20. Audit & Monitoring
21. Logging
22. Backup & Recovery
23. Security Best Practices
24. Security Checklist
25. Future Enhancements

---

# 1. Purpose

This document defines the security architecture for the RideNow Enterprise Data Platform.

The objective is to ensure that data is protected through authentication, authorization, encryption, auditing, and Role-Based Access Control (RBAC), while supporting secure data engineering and analytics workflows.

---

# 2. Security Objectives

The security design aims to:

- Protect sensitive business data
- Enforce least-privilege access
- Prevent unauthorized access
- Secure ETL processes
- Support auditing and compliance
- Protect analytical datasets
- Enable secure collaboration

---

# 3. Security Principles

The platform follows these core security principles:

- Least Privilege
- Role-Based Access Control (RBAC)
- Separation of Duties
- Defense in Depth
- Secure by Default
- Data Confidentiality
- Data Integrity
- Availability
- Auditability

---

# 4. Snowflake Security Architecture

```text
                    Users
                       │
                       ▼
                Authentication
                       │
                       ▼
                Assigned Roles
                       │
                       ▼
          Database / Schema / Warehouse
                       │
                       ▼
              Tables / Views / Stages
                       │
                       ▼
                 Business Data
```

---

# 5. Authentication

Users authenticate using Snowflake credentials.

Supported methods include:

- Username and Password
- Multi-Factor Authentication (MFA)
- Key Pair Authentication
- Single Sign-On (SSO) *(Future Enhancement)*

---

# 6. Authorization

Authorization is managed through RBAC.

Permissions are granted to **roles**, and users inherit permissions through assigned roles.

No object privileges are granted directly to individual users.

---

# 7. Role-Based Access Control (RBAC)

## Administrative Roles

| Role | Responsibility |
|------|----------------|
| ACCOUNTADMIN | Account administration |
| SYSADMIN | Object management |
| SECURITYADMIN | User and role management |

---

## Project Roles

| Role | Responsibility |
|------|----------------|
| ROLE_ADMIN | Project administration |
| ROLE_ETL | Data ingestion and transformation |
| ROLE_ANALYST | Reporting and analytics |
| ROLE_READONLY | Read-only access |

---

# 8. Role Hierarchy

```text
ACCOUNTADMIN
     │
SYSADMIN
     │
ROLE_ADMIN
     │
├── ROLE_ETL
└── ROLE_ANALYST
        │
   ROLE_READONLY
```

---

# 9. User Management

Example users:

| User | Assigned Role |
|------|---------------|
| ADMIN_USER | ROLE_ADMIN |
| ETL_USER | ROLE_ETL |
| ANALYST_USER | ROLE_ANALYST |
| REPORT_USER | ROLE_READONLY |

Guidelines:

- One user per individual.
- No shared accounts.
- Password policies enforced.
- Disable inactive users.

---

# 10. Database Security

Database:

```text
RIDENOW_DB
```

Only ROLE_ADMIN has ownership.

Other roles receive access through explicit grants.

---

# 11. Schema Security

Schemas:

```text
BRONZE
SILVER
GOLD
STAGE
```

Access policy:

| Schema | ETL | Analyst |
|----------|-----|----------|
| BRONZE | Read/Write | No Access |
| SILVER | Read/Write | Read |
| GOLD | Read | Read |
| STAGE | Read/Write | No Access |

---

# 12. Warehouse Security

Warehouses are isolated by workload.

| Warehouse | Access |
|------------|--------|
| WH_ETL | ROLE_ETL |
| WH_ANALYTICS | ROLE_ANALYST |
| WH_DATA_SCIENCE | Future Use |

Benefits:

- Resource isolation
- Cost control
- Performance optimization

---

# 13. Object-Level Security

Privileges include:

- SELECT
- INSERT
- UPDATE
- DELETE
- CREATE
- MODIFY
- USAGE

Privileges are granted through roles.

---

# 14. Data Protection

Sensitive information includes:

- Customer email
- Phone number
- Payment details

Protection methods:

- Encryption
- Masking
- Secure Views
- RBAC

---

# 15. Network Security

Recommended controls:

- IP Allow Lists
- VPN Access
- Private Connectivity (Future)
- TLS Encryption

---

# 16. Encryption

Snowflake automatically encrypts:

- Data at Rest
- Data in Transit

Encryption uses industry-standard AES-256 encryption.

No additional application-level encryption is required for this project.

---

# 17. Data Masking

Sensitive columns should be masked for non-privileged users.

Example:

| Original | Masked |
|-----------|--------|
| john@email.com | j***@email.com |
| 9876543210 | 98******10 |

Future implementation may use Snowflake Dynamic Data Masking Policies.

---

# 18. Row Access Policies

Future enhancement:

Restrict data visibility based on business rules.

Example:

```text
Regional Manager

↓

Can View

↓

Only Assigned City Data
```

---

# 19. Secure Views

Power BI should connect through Secure Views instead of base tables.

Example:

```text
FACT_TRIP

↓

SECURE VIEW

↓

Power BI
```

Benefits:

- Hide sensitive columns
- Simplify reporting
- Centralize security

---

# 20. Audit & Monitoring

Audit events include:

- User logins
- Query history
- Failed logins
- Object creation
- Role changes
- Data loading
- ETL execution

Snowflake Account Usage views can be used for monitoring.

---

# 21. Logging

ETL logs capture:

- Execution Start Time
- Execution End Time
- Records Read
- Records Loaded
- Records Rejected
- Status
- Error Message

---

# 22. Backup & Recovery

Snowflake features:

- Time Travel
- Fail-safe
- Zero Copy Clone

These capabilities enable:

- Data recovery
- Object recovery
- Environment cloning
- Testing without duplication

---

# 23. Security Best Practices

- Use dedicated service accounts.
- Enable MFA.
- Grant least privilege.
- Rotate credentials regularly.
- Audit access periodically.
- Separate ETL and reporting workloads.
- Avoid using ACCOUNTADMIN for daily operations.
- Use Secure Views for reporting.
- Protect sensitive data with masking policies.
- Document all security changes.

---

# 24. Security Checklist

| Item | Status |
|------|--------|
| RBAC Implemented | ✔ |
| Least Privilege | ✔ |
| MFA Enabled | Planned |
| Encryption at Rest | ✔ |
| Encryption in Transit | ✔ |
| Secure Views | Planned |
| Dynamic Masking | Planned |
| Row Access Policies | Planned |
| Audit Logging | ✔ |
| Backup & Recovery | ✔ |

---

# 25. Future Enhancements

The following security capabilities may be added in future releases:

- Single Sign-On (SSO)
- SCIM User Provisioning
- Dynamic Data Masking Policies
- Row Access Policies
- Object Tagging
- Classification Policies
- External Token Authentication
- PrivateLink Connectivity
- Snowflake Horizon Catalog
- Data Sharing with Secure Shares

---

# Conclusion

The RideNow Enterprise Data Platform follows enterprise security principles by implementing Role-Based Access Control, least-privilege access, encryption, auditing, and workload isolation.

The architecture is designed to protect sensitive business data while supporting scalable ETL pipelines, analytics, and reporting. Future enhancements will further strengthen governance through advanced Snowflake security features such as Dynamic Data Masking, Row Access Policies, and Secure Data Sharing.

---

**Document Status:** Approved

**Version:** 1.0

**Maintained By:** Manmeet Singh

**Project:** RideNow Enterprise Data Platform
