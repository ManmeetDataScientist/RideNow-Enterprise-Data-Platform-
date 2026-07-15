# RideNow Enterprise Data Platform

# 06. GitHub Standards

---

# Document Information

| Property | Value |
|----------|-------|
| Project | RideNow Enterprise Data Platform |
| Document | GitHub Standards |
| Version | 1.0 |
| Author | Manmeet Singh |
| Last Updated | 13-Jul-2026 |
| Status | Approved |

---

# Revision History

| Version | Date | Author | Description |
|---------|------|--------|-------------|
| 1.0 | 13-Jul-2026 | Manmeet Singh | Initial GitHub Standards |

---

# Table of Contents

1. Purpose
2. Scope
3. Repository Structure
4. Repository Naming Standards
5. Branch Strategy
6. Branch Naming Standards
7. Commit Message Standards
8. Pull Request Standards
9. Code Review Standards
10. Folder Standards
11. File Naming Standards
12. Markdown Standards
13. SQL Script Standards
14. Python Standards
15. Documentation Standards
16. Release & Versioning
17. Git Ignore Standards
18. Repository Security
19. GitHub Issues
20. GitHub Projects
21. Labels
22. Milestones
23. Repository Maintenance
24. Best Practices

---

# 1. Purpose

This document defines the GitHub standards for the RideNow Enterprise Data Platform.

Objectives:

- Maintain a clean repository
- Improve collaboration
- Simplify code reviews
- Standardize development
- Improve traceability
- Enable enterprise version control

---

# 2. Scope

These standards apply to:

- SQL Scripts
- Python Code
- Documentation
- Power BI Files
- Snowflake Objects
- Configuration Files

---

# 3. Repository Structure

```text
RideNow/

│
├── docs/
├── snowflake/
├── python/
├── data/
├── powerbi/
├── tests/
├── .github/
├── README.md
├── LICENSE
└── .gitignore
```

Each folder must have a clear purpose.

---

# 4. Repository Naming Standards

Repository names should be:

- Lowercase
- Hyphen separated
- Meaningful

Good

```text
ridenow-data-platform
```

Avoid

```text
RideNowProject
MyRepo
Project1
```

---

# 5. Branch Strategy

Protected branches

```text
main
develop
```

Feature branches

```text
feature/customer-generator

feature/snowflake-etl

feature/powerbi-dashboard
```

Bug fixes

```text
bugfix/customer-duplicate

bugfix/payment-error
```

Hotfixes

```text
hotfix/load-failure
```

---

# 6. Branch Naming Standards

Pattern

```text
feature/<feature-name>

bugfix/<issue-name>

hotfix/<issue-name>

release/<version>
```

Examples

```text
feature/snowflake-setup

feature/trip-fact

feature/customer-dimension

release/v1.0
```

---

# 7. Commit Message Standards

Pattern

```text
<type>: <description>
```

Types

```text
feat

fix

docs

refactor

style

test

perf

build

chore
```

Examples

```text
feat: Add customer generator

feat: Create trip fact table

fix: Resolve duplicate customer records

docs: Update LLD

refactor: Simplify ETL logic

perf: Optimize MERGE statement
```

Avoid

```text
Update

Changes

Done

Final

Test
```

---

# 8. Pull Request Standards

Every Pull Request should include:

- Purpose
- Summary
- Files Changed
- Testing Completed
- Reviewer
- Related Issue

Checklist

- SQL validated
- Python tested
- Documentation updated
- Naming standards followed

---

# 9. Code Review Standards

Review checklist

- Naming standards
- Readability
- Performance
- Security
- Documentation
- Error handling
- SQL formatting
- Python formatting
- Tests completed

---

# 10. Folder Standards

Every folder should contain:

```text
README.md
```

Example

```text
python/

README.md

generators/

validation/

utilities/
```

---

# 11. File Naming Standards

Markdown

```text
01_Project_Charter.md

02_Business_Requirements.md
```

SQL

```text
01_Create_Database.sql

02_Create_Warehouses.sql
```

Python

```text
generate_customer.py

load_trip.py
```

CSV

```text
customer.csv

driver.csv
```

---

# 12. Markdown Standards

Every document should include:

- Title
- Version
- Revision History
- Table of Contents
- Conclusion

Use numbered headings.

Use Markdown tables where appropriate.

---

# 13. SQL Script Standards

Each SQL file should contain:

Purpose

Author

Version

Execution Order

Example

```sql
--------------------------------------------------
Project : RideNow
Module  : Warehouse Creation
Version : 1.0
Author  : Manmeet Singh
--------------------------------------------------
```

---

# 14. Python Standards

Every Python module should include:

- Module description
- Logging
- Error handling
- Docstrings
- Configuration
- Type hints (recommended)

---

# 15. Documentation Standards

Documentation must be:

- Version controlled
- Numbered
- Reviewed
- Updated with every release

Never leave placeholder text in production documentation.

---

# 16. Release & Versioning

Follow Semantic Versioning.

```text
v1.0.0

v1.1.0

v2.0.0
```

Meaning

Major

Minor

Patch

---

# 17. Git Ignore Standards

Ignore

```text
__pycache__/

*.pyc

.env

.vscode/

.idea/

*.log

*.csv

*.xlsx

*.pbix

target/

dist/
```

Never commit:

- Secrets
- Passwords
- Tokens
- Private Keys

---

# 18. Repository Security

Enable

- Branch Protection
- Required Reviews
- Secret Scanning
- Dependabot
- Code Scanning

Never commit credentials.

---

# 19. GitHub Issues

Issue template

Title

Description

Priority

Steps

Expected Result

Actual Result

Owner

Status

---

# 20. GitHub Projects

Suggested boards

Backlog

To Do

In Progress

Testing

Completed

---

# 21. Labels

Recommended labels

```text
bug

enhancement

documentation

snowflake

python

sql

etl

powerbi

good-first-issue

help-wanted
```

---

# 22. Milestones

Suggested milestones

```text
Version 1.0

Snowflake Setup

Python Generator

ETL Complete

Dashboard Complete

Documentation Complete

Portfolio Release
```

---

# 23. Repository Maintenance

Monthly

- Review open issues
- Remove stale branches
- Update dependencies
- Review documentation
- Archive completed releases

---

# 24. Best Practices

- Commit small, logical changes.
- Write meaningful commit messages.
- Keep the main branch deployable.
- Review code before merging.
- Tag production releases.
- Use pull requests for all changes.
- Keep documentation synchronized with code.
- Never commit generated files unless required.
- Protect sensitive information.
- Maintain a consistent repository structure.

---

# Appendix A – Recommended .gitignore

```gitignore
# Python
__pycache__/
*.pyc

# Virtual Environment
.venv/
venv/

# IDE
.vscode/
.idea/

# Environment Variables
.env

# Logs
*.log

# Data Files
*.csv
*.xlsx

# Power BI
*.pbix

# Build
dist/
build/

# OS
.DS_Store
Thumbs.db
```

---

# Appendix B – Standard Branch Workflow

```text
main
 │
 ├── develop
 │
 ├── feature/customer-generator
 │
 ├── feature/trip-generator
 │
 ├── feature/powerbi-dashboard
 │
 ├── bugfix/payment-validation
 │
 └── release/v1.0
```

---

# Conclusion

Following these GitHub Standards ensures that the RideNow Enterprise Data Platform repository remains organized, secure, maintainable, and collaboration-friendly. Consistent repository management improves development efficiency, simplifies onboarding, and supports enterprise-grade software delivery practices.

---

**Document Status:** Approved

**Version:** 1.0

**Maintained By:** Manmeet Singh

**Project:** RideNow Enterprise Data Platform
