-- Grants SYSADMIN privileges on FILE_FORMAT schema before creating file formats
-- Co-authored with CoCo
/***************************************************************************************************
File Name      : 04_Create_File_Formats.sql

Project        : RideNow Enterprise Data Platform

Author         : Manmeet Singh

Created Date   : July 2026

Description    : Creates reusable Snowflake File Formats.

****************************************************************************************************
Modification History

Version     Date          Author             Description
-------     ----------    ----------------   ------------------------------------
1.0         Jul-2026      Manmeet Singh      Initial Version

***************************************************************************************************/

--==================================================================================
-- Grant privileges to SYSADMIN (schema is owned by ACCOUNTADMIN)
--==================================================================================

USE ROLE ACCOUNTADMIN;

GRANT USAGE ON SCHEMA RIDENOW_DB.FILE_FORMAT TO ROLE SYSADMIN;
GRANT CREATE FILE FORMAT ON SCHEMA RIDENOW_DB.FILE_FORMAT TO ROLE SYSADMIN;

--==================================================================================
-- Use Role
--==================================================================================

USE ROLE SYSADMIN;

--==================================================================================
-- Use Database
--==================================================================================

USE DATABASE RIDENOW_DB;

USE SCHEMA FILE_FORMAT;

--==================================================================================
-- CSV File Format
--==================================================================================

CREATE OR REPLACE FILE FORMAT CSV_FORMAT
TYPE = CSV
FIELD_DELIMITER = ','
SKIP_HEADER = 1
FIELD_OPTIONALLY_ENCLOSED_BY = '"'
TRIM_SPACE = TRUE
EMPTY_FIELD_AS_NULL = TRUE
NULL_IF = ('NULL','','null')
COMPRESSION = AUTO
COMMENT = 'Standard CSV File Format';

--==================================================================================
-- JSON File Format
--==================================================================================

CREATE OR REPLACE FILE FORMAT JSON_FORMAT
TYPE = JSON
COMPRESSION = AUTO
COMMENT = 'Standard JSON File Format';

--==================================================================================
-- PARQUET File Format
--==================================================================================

CREATE OR REPLACE FILE FORMAT PARQUET_FORMAT
TYPE = PARQUET
COMPRESSION = AUTO
COMMENT = 'Standard Parquet File Format';

--==================================================================================
-- Verify
--==================================================================================

SHOW FILE FORMATS;
