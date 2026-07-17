/******************************************************************************
Project      : RideNow Enterprise Data Platform
Module       : Bronze Layer
Script       : 01_Create_City_RAW.sql
Author       : Manmeet Singh
Version      : 1.0
Created Date : 15-Jul-2026

Description:
Creates the CITY_RAW table in the BRONZE schema.
This table stores city master data exactly as received from the source system.
No business rules, constraints, or transformations are applied in the Bronze layer.

Execution Order:
    01_Create_City_RAW.sql
******************************************************************************/

--==============================================================================
-- Step 1 : Set Context
--==============================================================================

USE ROLE ROLE_ADMIN;

USE WAREHOUSE WH_ETL;

USE DATABASE RIDENOW_DB;

USE SCHEMA BRONZE;

--==============================================================================
-- Step 2 : Create CITY_RAW Table
--==============================================================================

CREATE OR REPLACE TABLE CITY_RAW
(
    ----------------------------------------------------------------------------
    -- Business Columns
    ----------------------------------------------------------------------------

    CITY_ID                 VARCHAR(20),
    CITY_NAME               VARCHAR(100),
    STATE_NAME              VARCHAR(100),
    COUNTRY_NAME            VARCHAR(100),
    REGION                  VARCHAR(50),
    TIME_ZONE               VARCHAR(50),
    PIN_CODE                VARCHAR(10),
    CITY_STATUS             VARCHAR(20),

    ----------------------------------------------------------------------------
    -- Metadata Columns
    ----------------------------------------------------------------------------

    LOAD_TIMESTAMP          TIMESTAMP_NTZ DEFAULT CURRENT_TIMESTAMP(),
    SOURCE_FILE_NAME        VARCHAR(255),
    SOURCE_SYSTEM           VARCHAR(50),
    BATCH_ID                NUMBER(38,0),
    ROW_NUMBER              NUMBER(38,0)

);

--==============================================================================
-- Step 3 : Table Comment
--==============================================================================

COMMENT ON TABLE CITY_RAW IS
'Stores raw city master data exactly as received from the source system.';

--==============================================================================
-- Step 4 : Column Comments
--==============================================================================

COMMENT ON COLUMN CITY_RAW.CITY_ID
IS 'Business identifier received from the source system.';

COMMENT ON COLUMN CITY_RAW.CITY_NAME
IS 'Name of the city.';

COMMENT ON COLUMN CITY_RAW.STATE_NAME
IS 'State or province name.';

COMMENT ON COLUMN CITY_RAW.COUNTRY_NAME
IS 'Country name.';

COMMENT ON COLUMN CITY_RAW.REGION
IS 'Geographical region.';

COMMENT ON COLUMN CITY_RAW.TIME_ZONE
IS 'Time zone of the city.';

COMMENT ON COLUMN CITY_RAW.PIN_CODE
IS 'Postal or ZIP code.';

COMMENT ON COLUMN CITY_RAW.CITY_STATUS
IS 'Current status of the city record.';

COMMENT ON COLUMN CITY_RAW.LOAD_TIMESTAMP
IS 'Timestamp when the record was loaded into the Bronze layer.';

COMMENT ON COLUMN CITY_RAW.SOURCE_FILE_NAME
IS 'Source CSV file name.';

COMMENT ON COLUMN CITY_RAW.SOURCE_SYSTEM
IS 'Originating source application.';

COMMENT ON COLUMN CITY_RAW.BATCH_ID
IS 'ETL Batch Identifier.';

COMMENT ON COLUMN CITY_RAW.ROW_NUMBER
IS 'Row number from the source file.';

--==============================================================================
-- Step 5 : Verification
--==============================================================================

DESC TABLE CITY_RAW;

SHOW TABLES LIKE 'CITY_RAW';

--==============================================================================
-- End of Script
--==============================================================================
