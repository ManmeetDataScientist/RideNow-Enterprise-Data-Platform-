# RideNow Enterprise Data Platform

# 06. Power BI FAQ

---

# Document Information

| Property | Value |
|----------|-------|
| Project | RideNow Enterprise Data Platform |
| Document | Power BI FAQ |
| Version | 1.0 |
| Author | Manmeet Singh |
| Last Updated | July 2026 |

---

# Table of Contents

1. Power BI Fundamentals
2. Data Connectivity
3. Data Modeling
4. DAX
5. Power Query
6. Visualization
7. Performance Optimization
8. Security
9. Deployment
10. RideNow Implementation
11. Best Practices

---

# 1. Power BI Fundamentals

## Q1. What is Power BI?

**Answer**

Power BI is Microsoft's Business Intelligence platform used to create interactive reports, dashboards, and analytical visualizations.

**RideNow Example**

RideNow uses Power BI to visualize:

- Revenue
- Trips
- Driver Performance
- Customer Growth
- Surge Pricing
- Promotions

**Interview Tip**

Know the difference between Power BI Desktop, Service, and Report Server.

---

## Q2. What are the main Power BI components?

- Power BI Desktop
- Power BI Service
- Power BI Mobile
- Power BI Gateway
- Power BI Report Server

---

## Q3. Why is Power BI popular?

- Easy visualization
- Self-service BI
- Rich DAX language
- Excellent Microsoft integration
- Strong enterprise adoption

---

## Q4. What is a Dashboard?

A dashboard is a single-page collection of visualizations created in the Power BI Service.

---

## Q5. What is a Report?

A report is a multi-page interactive analytical document created in Power BI Desktop.

---

# 2. Data Connectivity

## Q6. Which data sources can Power BI connect to?

- Snowflake
- SQL Server
- Oracle
- Excel
- CSV
- Azure
- AWS
- SharePoint

---

## Q7. How does RideNow connect Power BI?

Snowflake Gold Layer → Power BI

---

## Q8. What is Import Mode?

Data is copied into Power BI for analysis.

---

## Q9. What is DirectQuery?

Queries execute directly against the source database.

---

## Q10. Which mode is preferred?

Depends on business requirements.

- Import → Faster reports
- DirectQuery → Real-time data

---

# 3. Data Modeling

## Q11. Why is data modeling important?

A good model improves:

- Performance
- Simplicity
- DAX calculations
- Maintainability

---

## Q12. Which schema is recommended?

Star Schema

---

## Q13. Why Star Schema?

- Fewer joins
- Better performance
- Easier reporting

---

## Q14. What are Dimension Tables?

Store descriptive business information.

Examples:

- Customer
- Driver
- City
- Date

---

## Q15. What are Fact Tables?

Store measurable business events.

Examples:

- Trip
- Payment
- Driver Earnings

---

# 4. DAX

## Q16. What is DAX?

Data Analysis Expressions (DAX) is the formula language used in Power BI.

---

## Q17. Difference between Measure and Calculated Column?

Calculated Column

- Stored in the model
- Calculated during refresh

Measure

- Calculated dynamically
- Better performance

---

## Q18. What is CALCULATE()?

The most powerful DAX function used to modify filter context.

---

## Q19. Common DAX functions?

- SUM
- COUNT
- DISTINCTCOUNT
- CALCULATE
- FILTER
- IF
- SWITCH
- RANKX
- ALL
- RELATED

---

## Q20. What is Filter Context?

The set of filters applied to a calculation.

---

# 5. Power Query

## Q21. What is Power Query?

Power Query is the ETL engine used inside Power BI.

---

## Q22. What language does Power Query use?

M Language

---

## Q23. Why use Power Query?

- Clean data
- Merge datasets
- Transform columns
- Remove duplicates

---

## Q24. Should heavy transformations happen in Power BI?

No.

Enterprise projects should perform most transformations inside Snowflake.

---

## Q25. What transformations are acceptable?

- Rename columns
- Change data types
- Minor formatting

---

# 6. Visualization

## Q26. Which visuals are commonly used?

- Card
- KPI
- Table
- Matrix
- Bar Chart
- Line Chart
- Pie Chart
- Map
- Slicer

---

## Q27. What is a KPI visual?

Displays current performance against a target.

---

## Q28. What is a Slicer?

Allows users to filter report data interactively.

---

## Q29. Why avoid too many visuals?

Too many visuals reduce report performance.

---

## Q30. What is Drill Through?

Allows users to navigate to detailed reports.

---

# 7. Performance Optimization

## Q31. How can Power BI reports be optimized?

- Use Star Schema
- Reduce visual count
- Optimize DAX
- Remove unused columns
- Aggregate data

---

## Q32. Why avoid many calculated columns?

They increase model size.

---

## Q33. Why prefer Measures?

Measures are calculated dynamically and consume less storage.

---

## Q34. What is Query Folding?

Power Query pushes transformations back to the source database.

---

## Q35. Why is Snowflake important here?

Snowflake handles heavy transformations more efficiently than Power BI.

---

# 8. Security

## Q36. What is Row-Level Security (RLS)?

Restricts data visibility based on the logged-in user.

---

## Q37. Why use RLS?

Different users should see only their own data.

---

## Q38. What is Object-Level Security (OLS)?

Restricts access to specific tables or columns.

---

## Q39. Can Power BI integrate with Azure AD?

Yes.

Authentication integrates with Microsoft Entra ID (Azure AD).

---

## Q40. Should sensitive data be masked?

Yes.

Sensitive information should be protected using Snowflake policies and Power BI security.

---

# 9. Deployment

## Q41. What is Power BI Service?

Cloud platform used for publishing reports.

---

## Q42. What is a Workspace?

A collaborative environment for reports and dashboards.

---

## Q43. What is a Gateway?

Allows Power BI Service to access on-premises data.

---

## Q44. How are reports refreshed?

- Scheduled Refresh
- Manual Refresh
- DirectQuery

---

## Q45. Can Power BI integrate with CI/CD?

Yes.

Using Azure DevOps or GitHub Actions.

---

# 10. RideNow Implementation

## Q46. Which KPIs are built?

- Daily Trips
- Monthly Revenue
- Driver Earnings
- Customer Growth
- Cancellation Rate
- Average Rating
- Promotion Usage

---

## Q47. Which Snowflake layer feeds Power BI?

Gold Layer

---

## Q48. Why not connect to Bronze?

Bronze contains raw operational data.

---

## Q49. Why not connect directly to Silver?

Silver contains standardized business data but not reporting-ready KPIs.

---

## Q50. Why use Gold?

Gold contains optimized analytical datasets.

---

# 11. Best Practices

## Q51. What are Power BI best practices?

- Follow Star Schema
- Keep visuals simple
- Optimize DAX
- Use measures
- Minimize calculated columns
- Use meaningful names
- Create reusable themes

---

## Q52. Should Power BI perform ETL?

No.

ETL belongs in Snowflake.

Power BI should primarily focus on visualization.

---

## Q53. How should reports be designed?

- Business-focused
- Consistent colors
- Responsive layout
- Clear KPIs
- Minimal clutter

---

## Q54. What makes a good dashboard?

- Fast
- Interactive
- Easy to understand
- Business-driven

---

## Q55. What is the biggest Power BI lesson from RideNow?

Power BI should consume trusted, business-ready data from the Snowflake Gold Layer instead of performing heavy data transformation.

---

# References

- Microsoft Power BI Documentation
- Microsoft Learn
- DAX Guide
- RideNow Power BI Design Standards

---

**Document Status:** Approved

**Version:** 1.0

**Maintained By:** Manmeet Singh
