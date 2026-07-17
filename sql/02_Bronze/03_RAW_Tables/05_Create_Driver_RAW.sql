/******************************************************************************
Project         : RideNow Enterprise Data Platform
Module          : Bronze Layer
Object          : DRIVER_RAW
Object Type     : Table
Schema          : BRONZE
Script          : 05_Create_Driver_RAW.sql
Author          : Manmeet Singh
Version         : 1.0
Environment     : DEV
Created Date    : 15-Jul-2026

Description:
Creates the DRIVER_RAW table in the BRONZE schema.
Stores driver master data exactly as received from the source system.

------------------------------------------------------------------------------
Load Pattern
------------------------------------------------------------------------------
Source File     : driver.csv
Load Type       : Full Load
Refresh         : Daily
Target Layer    : Bronze
Source Format   : CSV

------------------------------------------------------------------------------
Dependencies
------------------------------------------------------------------------------
Input File      : driver.csv
Target Table    : BRONZE.DRIVER_RAW
Downstream      : SILVER.DRIVER_DIM
******************************************************************************/

--==============================================================================
-- Step 1 : Set Context
--==============================================================================

USE ROLE ROLE_ADMIN;

USE WAREHOUSE WH_ETL;

USE DATABASE RIDENOW_DB;

USE SCHEMA BRONZE;

--==============================================================================
-- Step 2 : Create DRIVER_RAW Table
--==============================================================================

CREATE OR REPLACE TRANSIENT TABLE DRIVER_RAW
(
    ----------------------------------------------------------------------------
    -- Business Columns
    ----------------------------------------------------------------------------

    DRIVER_ID                  VARCHAR(20),
    FIRST_NAME                 VARCHAR(100),
    LAST_NAME                  VARCHAR(100),
    GENDER                     VARCHAR(10),
    DATE_OF_BIRTH              DATE,
    EMAIL                      VARCHAR(255),
    PHONE_NUMBER               VARCHAR(20),
    LICENSE_NUMBER             VARCHAR(30),
    LICENSE_EXPIRY_DATE        DATE,
    VEHICLE_ID                 VARCHAR(20),
    CITY_ID                    VARCHAR(20),
    JOIN_DATE                  DATE,
    DRIVER_STATUS              VARCHAR(20),
    DRIVER_RATING              NUMBER(2,1),

    ----------------------------------------------------------------------------
    -- Metadata Columns
    ----------------------------------------------------------------------------

    LOAD_TIMESTAMP             TIMESTAMP_NTZ DEFAULT CURRENT_TIMESTAMP(),
    SOURCE_FILE_NAME           VARCHAR(255),
    SOURCE_SYSTEM              VARCHAR(50),
    BATCH_ID                   NUMBER(38,0),
    ROW_NUMBER                 NUMBER(38,0)

);

--==============================================================================
-- Step 3 : Table Comment
--==============================================================================

COMMENT ON TABLE DRIVER_RAW IS
'Stores raw driver master data exactly as received from the source system.';

--==============================================================================
-- Step 4 : Column Comments
--==============================================================================

COMMENT ON COLUMN DRIVER_RAW.DRIVER_ID
IS 'Business identifier received from the source system.';

COMMENT ON COLUMN DRIVER_RAW.FIRST_NAME
IS 'Driver first name.';

COMMENT ON COLUMN DRIVER_RAW.LAST_NAME
IS 'Driver last name.';

COMMENT ON COLUMN DRIVER_RAW.GENDER
IS 'Driver gender.';

COMMENT ON COLUMN DRIVER_RAW.DATE_OF_BIRTH
IS 'Driver date of birth.';

COMMENT ON COLUMN DRIVER_RAW.EMAIL
IS 'Driver email address.';

COMMENT ON COLUMN DRIVER_RAW.PHONE_NUMBER
IS 'Driver mobile number.';

COMMENT ON COLUMN DRIVER_RAW.LICENSE_NUMBER
IS 'Government-issued driving license number.';

COMMENT ON COLUMN DRIVER_RAW.LICENSE_EXPIRY_DATE
IS 'Driving license expiry date.';

COMMENT ON COLUMN DRIVER_RAW.VEHICLE_ID
IS 'Vehicle assigned to the driver.';

COMMENT ON COLUMN DRIVER_RAW.CITY_ID
IS 'City identifier received from the source system.';

COMMENT ON COLUMN DRIVER_RAW.JOIN_DATE
IS 'Driver joining date.';

COMMENT ON COLUMN DRIVER_RAW.DRIVER_STATUS
IS 'Current employment status of the driver.';

COMMENT ON COLUMN DRIVER_RAW.DRIVER_RATING
IS 'Current average driver rating received from the source system.';

COMMENT ON COLUMN DRIVER_RAW.LOAD_TIMESTAMP
IS 'Timestamp when the record was loaded into the Bronze layer.';

COMMENT ON COLUMN DRIVER_RAW.SOURCE_FILE_NAME
IS 'Source CSV file name.';

COMMENT ON COLUMN DRIVER_RAW.SOURCE_SYSTEM
IS 'Originating source application.';

COMMENT ON COLUMN DRIVER_RAW.BATCH_ID
IS 'ETL Batch Identifier.';

COMMENT ON COLUMN DRIVER_RAW.ROW_NUMBER
IS 'Row number from the source file.';

--==============================================================================
-- Step 5 : Verification
--==============================================================================

DESC TABLE DRIVER_RAW;

SHOW TABLES LIKE 'DRIVER_RAW';

--==============================================================================
-- End of Script
--==============================================================================
