# RideNow Enterprise Data Platform

# 05. Python Coding Standards

---

# Document Information

| Property | Value |
|----------|-------|
| Project | RideNow Enterprise Data Platform |
| Document | Python Coding Standards |
| Version | 1.0 |
| Author | Manmeet Singh |
| Last Updated | 13-Jul-2026 |
| Status | Approved |

---

# Revision History

| Version | Date | Author | Description |
|----------|------|--------|-------------|
| 1.0 | 13-Jul-2026 | Manmeet Singh | Initial Python Coding Standards |

---

# Table of Contents

1. Purpose
2. Scope
3. Python Version
4. Project Structure
5. Naming Standards
6. File Organization
7. Import Standards
8. Variable Standards
9. Function Standards
10. Class Standards
11. Exception Handling
12. Logging Standards
13. Configuration Management
14. File Handling
15. Data Generation Standards
16. Pandas Standards
17. Snowflake Standards
18. Performance Guidelines
19. Security Guidelines
20. Testing Standards
21. Documentation Standards
22. Code Review Checklist
23. Best Practices

---

# 1. Purpose

This document defines the Python development standards for the RideNow Enterprise Data Platform.

The objectives are to:

- Improve readability
- Maintain consistency
- Simplify maintenance
- Improve performance
- Reduce defects
- Support enterprise-scale development

---

# 2. Scope

These standards apply to all Python code within the project, including:

- Data generators
- ETL scripts
- Utility scripts
- Automation scripts
- Snowflake integration
- Data validation
- Test scripts

---

# 3. Python Version

The project standard is:

```text
Python 3.11+
```

All developers should use the same Python version to avoid compatibility issues.

---

# 4. Project Structure

```text
python/

├── config/
├── generators/
├── loaders/
├── validation/
├── utilities/
├── logs/
├── output/
├── tests/
├── requirements.txt
└── README.md
```

---

# 5. Naming Standards

## Files

```text
generate_customer.py
generate_driver.py
load_bronze.py
validate_data.py
```

Use lowercase with underscores.

---

## Variables

```python
customer_id
trip_count
total_fare
batch_id
```

---

## Constants

```python
MAX_RECORDS

DEFAULT_BATCH_SIZE

CSV_DELIMITER
```

---

## Functions

```python
generate_customer()

load_trip_data()

validate_driver()

create_payment()
```

Function names should start with a verb.

---

## Classes

```python
CustomerGenerator

TripGenerator

CSVWriter
```

Use PascalCase.

---

# 6. File Organization

One responsibility per file.

Good

```text
generate_customer.py
```

Avoid

```text
generate_everything.py
```

---

# 7. Import Standards

Standard library

Third-party libraries

Project modules

Example

```python
import os
import random
from datetime import datetime

import pandas as pd
from faker import Faker

from config.settings import OUTPUT_PATH
```

Avoid wildcard imports.

```python
from module import *
```

---

# 8. Variable Standards

Use meaningful names.

Good

```python
customer_name
trip_distance
payment_amount
```

Avoid

```python
x
a
temp
```

---

# 9. Function Standards

Each function should perform one task.

Example

```python
def generate_customer():
    """Generate one customer record."""
```

Guidelines:

- Maximum 40 lines where practical
- Return values instead of printing
- Keep functions focused

---

# 10. Class Standards

Example

```python
class CustomerGenerator:

    def generate(self):
        pass
```

Guidelines:

- One responsibility
- Constructor only initializes state
- Avoid global variables

---

# 11. Exception Handling

Always catch specific exceptions.

Good

```python
try:
    file.read()
except FileNotFoundError:
    logger.error("File not found")
```

Avoid

```python
except:
    pass
```

---

# 12. Logging Standards

Use the logging module.

```python
import logging

logger = logging.getLogger(__name__)
```

Example

```python
logger.info("Customer file generated")
logger.warning("Duplicate customer detected")
logger.error("CSV generation failed")
```

Do not use print() for production logging.

---

# 13. Configuration Management

Store configurable values in one location.

Example

```python
config/settings.py
```

```python
OUTPUT_FOLDER

BATCH_SIZE

CSV_SEPARATOR
```

Never hardcode configuration values throughout the project.

---

# 14. File Handling

Always use context managers.

Good

```python
with open(file_path, "w", encoding="utf-8") as file:
    file.write(data)
```

Avoid leaving files open.

---

# 15. Data Generation Standards

- Use Faker for realistic data.
- Generate reproducible data using random seeds when required.
- Ensure business key uniqueness.
- Validate foreign key relationships.
- Generate configurable record counts.
- Write UTF-8 encoded CSV files.

---

# 16. Pandas Standards

Preferred operations:

- Vectorized transformations
- Explicit column names
- Proper data types

Avoid:

- Chained indexing
- Unnecessary loops over DataFrames

Example

```python
df["fare"] = df["distance"] * RATE_PER_KM
```

---

# 17. Snowflake Standards

- Use parameterized SQL.
- Avoid hardcoded credentials.
- Store connection details in configuration.
- Close database connections.
- Handle transaction failures.
- Log load statistics.

---

# 18. Performance Guidelines

- Reuse objects where possible.
- Avoid unnecessary nested loops.
- Read large files in chunks.
- Release unused resources.
- Minimize repeated computations.

---

# 19. Security Guidelines

- Never commit passwords.
- Never hardcode secrets.
- Validate input data.
- Sanitize file names.
- Use environment variables for credentials.

---

# 20. Testing Standards

Every module should have corresponding unit tests.

```text
tests/

test_customer_generator.py

test_trip_generator.py

test_validation.py
```

Test:

- Positive scenarios
- Negative scenarios
- Boundary conditions
- Invalid inputs

---

# 21. Documentation Standards

Every module should include:

- Purpose
- Author
- Version

Every public function should have a docstring.

Example

```python
def generate_driver():
    """
    Generate a single driver record.

    Returns:
        dict: Driver information.
    """
```

---

# 22. Code Review Checklist

| Item | Status |
|------|--------|
| Naming standards followed | □ |
| Imports organized | □ |
| Functions documented | □ |
| Logging implemented | □ |
| Exceptions handled | □ |
| Configuration externalized | □ |
| Secrets excluded | □ |
| Unit tests written | □ |
| Performance reviewed | □ |
| Code formatted | □ |

---

# 23. Best Practices

- Follow PEP 8 formatting.
- Keep modules focused.
- Use meaningful names.
- Prefer composition over duplication.
- Validate input data.
- Log important events.
- Use type hints where practical.
- Write reusable functions.
- Review code before committing.
- Store code in GitHub with version control.

---

# Conclusion

Following these Python Coding Standards ensures that all automation, ETL, and data generation scripts within the RideNow Enterprise Data Platform are readable, maintainable, secure, and consistent. These standards help teams collaborate effectively while supporting enterprise-scale data engineering practices.

---

**Document Status:** Approved

**Version:** 1.0

**Maintained By:** Manmeet Singh

**Project:** RideNow Enterprise Data Platform
