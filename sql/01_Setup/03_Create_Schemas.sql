/***************************************************************************************************
File Name      : 03_Create_Schemas.sql

Project        : RideNow Enterprise Data Platform

Author         : Manmeet Singh

Created Date   : July 2026

Description    : Creates all schemas required for the RideNow Enterprise Data Platform.

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
-- Use Database
--==================================================================================

USE DATABASE RIDENOW_DB;

--==================================================================================
-- Create BRONZE Schema
--==================================================================================

CREATE SCHEMA IF NOT EXISTS BRONZE
COMMENT = 'Raw data ingestion layer. Stores source data with minimal transformation.';

--==================================================================================
-- Create SILVER Schema
--==================================================================================

CREATE SCHEMA IF NOT EXISTS SILVER
COMMENT = 'Business transformation layer containing cleansed and standardized data.';

--==================================================================================
-- Create GOLD Schema
--==================================================================================

CREATE SCHEMA IF NOT EXISTS GOLD
COMMENT = 'Business-ready analytical layer used for reporting and dashboards.';

--==================================================================================
-- Create STAGE Schema
--==================================================================================

CREATE SCHEMA IF NOT EXISTS STAGE
COMMENT = 'Snowflake internal and external stages for data ingestion.';

--==================================================================================
-- Create FILE_FORMAT Schema
--==================================================================================

CREATE SCHEMA IF NOT EXISTS FILE_FORMAT
COMMENT = 'Stores reusable file format objects for CSV, JSON, and Parquet files.';

--==================================================================================
-- Create METADATA Schema
--==================================================================================

CREATE SCHEMA IF NOT EXISTS METADATA
COMMENT = 'Stores ETL metadata, pipeline configuration, and load history.';

--==================================================================================
-- Create AUDIT Schema
--==================================================================================

CREATE SCHEMA IF NOT EXISTS AUDIT
COMMENT = 'Stores audit logs, error logs, rejected records, and data quality results.';

--==================================================================================
-- Create SECURITY Schema
--==================================================================================

CREATE SCHEMA IF NOT EXISTS SECURITY
COMMENT = 'Stores security-related objects such as masking policies and row access policies.';

--==================================================================================
-- Verify Schemas
--==================================================================================

SHOW SCHEMAS;

--==================================================================================
-- Display Schema Details
--==================================================================================

DESC SCHEMA BRONZE;

DESC SCHEMA SILVER;

DESC SCHEMA GOLD;

DESC SCHEMA STAGE;

DESC SCHEMA FILE_FORMAT;

DESC SCHEMA METADATA;

DESC SCHEMA AUDIT;

DESC SCHEMA SECURITY;
