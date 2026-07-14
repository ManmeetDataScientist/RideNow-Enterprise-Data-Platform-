/***************************************************************************************************
File Name      : 04_Create_File_Formats.sql

Project        : RideNow Enterprise Data Platform

Author         : Manmeet Singh

Created Date   : July 2026

Description    : Creates Snowflake Stages.

****************************************************************************************************
Modification History

Version     Date          Author             Description
-------     ----------    ----------------   ------------------------------------
1.0         Jul-2026      Manmeet Singh      Initial Version

***************************************************************************************************/

USE ROLE ACCOUNTADMIN;

USE DATABASE RIDENOW_DB;

USE SCHEMA STAGE;

--==================================================================================
-- Internal Stage
--==================================================================================

CREATE OR REPLACE STAGE INTERNAL_STAGE
COMMENT='Internal Stage for development and testing';

--==================================================================================
-- AWS S3 External Stage (Placeholder)
-- Replace bucket name while deployment
--==================================================================================

CREATE OR REPLACE STAGE AWS_STAGE
URL='s3://your-bucket-name/ridenow/'
FILE_FORMAT = RIDENOW_DB.FILE_FORMAT.CSV_FORMAT
COMMENT='AWS S3 External Stage';

--==================================================================================
-- Landing Stage
--==================================================================================

CREATE OR REPLACE STAGE LANDING_STAGE
COMMENT='Landing Stage for incoming source files';

--==================================================================================
-- Verify
--==================================================================================

SHOW STAGES;
