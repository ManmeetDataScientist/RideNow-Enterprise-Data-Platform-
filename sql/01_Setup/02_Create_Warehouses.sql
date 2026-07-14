/***************************************************************************************************
File Name      : 02_Create_Warehouses.sql

Project        : RideNow Enterprise Data Platform

Author         : Manmeet Singh

Created Date   : July 2026

Description    : Creates Snowflake Virtual Warehouses for the RideNow Enterprise Data Platform.

****************************************************************************************************

Modification History

Version     Date          Author             Description
-------     ----------    ----------------   ------------------------------------
1.0         Jul-2026      Manmeet Singh      Initial Version

***************************************************************************************************/

--==================================================================================
-- Use Role
--==================================================================================

USE ROLE ACCOUNTADMIN;

--==================================================================================
-- Create ETL Warehouse
--==================================================================================

CREATE WAREHOUSE IF NOT EXISTS WH_ETL
WITH
    WAREHOUSE_SIZE = 'XSMALL'
    WAREHOUSE_TYPE = 'STANDARD'
    AUTO_SUSPEND = 60
    AUTO_RESUME = TRUE
    INITIALLY_SUSPENDED = TRUE
    COMMENT = 'Warehouse used for ETL and ELT data loading processes.';

--==================================================================================
-- Create Analytics Warehouse
--==================================================================================

CREATE WAREHOUSE IF NOT EXISTS WH_ANALYTICS
WITH
    WAREHOUSE_SIZE = 'SMALL'
    WAREHOUSE_TYPE = 'STANDARD'
    AUTO_SUSPEND = 60
    AUTO_RESUME = TRUE
    INITIALLY_SUSPENDED = TRUE
    COMMENT = 'Warehouse used for Power BI, Tableau, and analytical reporting.';

--==================================================================================
-- Create Data Science Warehouse
--==================================================================================

CREATE WAREHOUSE IF NOT EXISTS WH_DATA_SCIENCE
WITH
    WAREHOUSE_SIZE = 'SMALL'
    WAREHOUSE_TYPE = 'STANDARD'
    AUTO_SUSPEND = 300
    AUTO_RESUME = TRUE
    INITIALLY_SUSPENDED = TRUE
    COMMENT = 'Warehouse used for Machine Learning, Python, and Data Science workloads.';

--==================================================================================
-- Verify Warehouses
--==================================================================================

SHOW WAREHOUSES;

--==================================================================================
-- Display Warehouse Details
--==================================================================================

DESC WAREHOUSE WH_ETL;

DESC WAREHOUSE WH_ANALYTICS;

DESC WAREHOUSE WH_DATA_SCIENCE;
