/******************************************************************************
Project      : RideNow Enterprise Data Platform
Module       : Bronze Layer
Script       : 01_Create_CUSTOMER_RAW.sql
Author       : Manmeet Singh
Version      : 1.0
Created Date : 15-Jul-2026

Description:
Creates the CUSTOMER_RAW table in the BRONZE schema.
This table stores customer data exactly as received from the source system.
No business rules, constraints, or transformations are applied in the Bronze layer.

******************************************************************************/

--==============================================================================
-- Step 1 : Set Context
--==============================================================================

USE ROLE ROLE_ADMIN;

USE WAREHOUSE WH_ETL;

USE DATABASE RIDENOW_DB;

USE SCHEMA BRONZE;

--==============================================================================
-- Step 2 : Create CUSTOMER_RAW Table
--==============================================================================

CREATE OR REPLACE TABLE CUSTOMER_RAW
(
    ---------------------------------------------------------------------------
    -- Business Columns (Raw Data)
    ---------------------------------------------------------------------------

    CUSTOMER_ID             VARCHAR(20),
    FIRST_NAME              VARCHAR(100),
    LAST_NAME               VARCHAR(100),
    GENDER                  VARCHAR(10),
    DATE_OF_BIRTH           DATE,
    EMAIL                   VARCHAR(255),
    PHONE_NUMBER            VARCHAR(20),
    CITY_ID                 VARCHAR(20),
    REGISTRATION_DATE       DATE,
    CUSTOMER_STATUS         VARCHAR(20),

    ---------------------------------------------------------------------------
    -- Metadata Columns
    ---------------------------------------------------------------------------

    LOAD_TIMESTAMP          TIMESTAMP_NTZ DEFAULT CURRENT_TIMESTAMP(),
    SOURCE_FILE_NAME        VARCHAR(255),
    SOURCE_SYSTEM           VARCHAR(50),
    BATCH_ID                NUMBER,
    ROW_NUMBER              NUMBER

);

--==============================================================================
-- Step 3 : Table Comment
--==============================================================================

COMMENT ON TABLE CUSTOMER_RAW IS
'Stores raw customer records exactly as received from the source system.';

--==============================================================================
-- Step 4 : Column Comments
--==============================================================================

COMMENT ON COLUMN CUSTOMER_RAW.CUSTOMER_ID
IS 'Business identifier received from source system.';

COMMENT ON COLUMN CUSTOMER_RAW.FIRST_NAME
IS 'Customer first name.';

COMMENT ON COLUMN CUSTOMER_RAW.LAST_NAME
IS 'Customer last name.';

COMMENT ON COLUMN CUSTOMER_RAW.GENDER
IS 'Customer gender.';

COMMENT ON COLUMN CUSTOMER_RAW.DATE_OF_BIRTH
IS 'Customer date of birth.';

COMMENT ON COLUMN CUSTOMER_RAW.EMAIL
IS 'Customer email address.';

COMMENT ON COLUMN CUSTOMER_RAW.PHONE_NUMBER
IS 'Customer mobile number.';

COMMENT ON COLUMN CUSTOMER_RAW.CITY_ID
IS 'Source city identifier.';

COMMENT ON COLUMN CUSTOMER_RAW.REGISTRATION_DATE
IS 'Customer registration date.';

COMMENT ON COLUMN CUSTOMER_RAW.CUSTOMER_STATUS
IS 'Current customer status received from source.';

COMMENT ON COLUMN CUSTOMER_RAW.LOAD_TIMESTAMP
IS 'Timestamp when record was loaded into Bronze layer.';

COMMENT ON COLUMN CUSTOMER_RAW.SOURCE_FILE_NAME
IS 'Source CSV file name.';

COMMENT ON COLUMN CUSTOMER_RAW.SOURCE_SYSTEM
IS 'Originating source application.';

COMMENT ON COLUMN CUSTOMER_RAW.BATCH_ID
IS 'ETL Batch Identifier.';

COMMENT ON COLUMN CUSTOMER_RAW.ROW_NUMBER
IS 'Row number from source file.';

--==============================================================================
-- Step 5 : Verification
--==============================================================================

DESC TABLE CUSTOMER_RAW;

SHOW TABLES LIKE 'CUSTOMER_RAW';

--==============================================================================
-- End of Script
--==============================================================================
