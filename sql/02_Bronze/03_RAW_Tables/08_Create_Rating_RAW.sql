/******************************************************************************
Project         : RideNow Enterprise Data Platform
Module          : Bronze Layer
Object          : RATING_RAW
Object Type     : Table
Schema          : BRONZE
Script          : 08_Create_Rating_RAW.sql
Author          : Manmeet Singh
Version         : 1.0
Environment     : DEV
Created Date    : 15-Jul-2026

Description:
Creates the RATING_RAW table in the BRONZE schema.
Stores customer and driver rating data exactly as received from the source
system.

------------------------------------------------------------------------------
Load Pattern
------------------------------------------------------------------------------
Source File     : rating.csv
Load Type       : Full Load
Refresh         : Daily
Target Layer    : Bronze
Source Format   : CSV

------------------------------------------------------------------------------
Dependencies
------------------------------------------------------------------------------
Input File      : rating.csv
Target Table    : BRONZE.RATING_RAW
Downstream      : SILVER.FACT_RATING
******************************************************************************/

--==============================================================================
-- Step 1 : Set Context
--==============================================================================

USE ROLE ROLE_ADMIN;

USE WAREHOUSE WH_ETL;

USE DATABASE RIDENOW_DB;

USE SCHEMA BRONZE;

--==============================================================================
-- Step 2 : Create RATING_RAW Table
--==============================================================================

CREATE OR REPLACE TRANSIENT TABLE RATING_RAW
(
    ----------------------------------------------------------------------------
    -- Business Columns
    ----------------------------------------------------------------------------

    RATING_ID              VARCHAR(20),
    TRIP_ID                VARCHAR(20),
    CUSTOMER_ID            VARCHAR(20),
    DRIVER_ID              VARCHAR(20),

    DRIVER_RATING          NUMBER(2,1),
    CUSTOMER_RATING        NUMBER(2,1),

    CUSTOMER_COMMENT       VARCHAR(500),
    DRIVER_COMMENT         VARCHAR(500),

    RATING_DATE            DATE,

    ----------------------------------------------------------------------------
    -- Metadata Columns
    ----------------------------------------------------------------------------

    LOAD_TIMESTAMP         TIMESTAMP_NTZ DEFAULT CURRENT_TIMESTAMP(),
    SOURCE_FILE_NAME       VARCHAR(255),
    SOURCE_SYSTEM          VARCHAR(50),
    BATCH_ID               NUMBER(38,0),
    ROW_NUMBER             NUMBER(38,0)

);

--==============================================================================
-- Step 3 : Table Comment
--==============================================================================

COMMENT ON TABLE RATING_RAW IS
'Stores raw trip rating data exactly as received from the source system.';

--==============================================================================
-- Step 4 : Column Comments
--==============================================================================

COMMENT ON COLUMN RATING_RAW.RATING_ID
IS 'Business identifier received from the source system.';

COMMENT ON COLUMN RATING_RAW.TRIP_ID
IS 'Trip identifier associated with the rating.';

COMMENT ON COLUMN RATING_RAW.CUSTOMER_ID
IS 'Customer who participated in the trip.';

COMMENT ON COLUMN RATING_RAW.DRIVER_ID
IS 'Driver who completed the trip.';

COMMENT ON COLUMN RATING_RAW.DRIVER_RATING
IS 'Rating given by the customer to the driver.';

COMMENT ON COLUMN RATING_RAW.CUSTOMER_RATING
IS 'Rating given by the driver to the customer.';

COMMENT ON COLUMN RATING_RAW.CUSTOMER_COMMENT
IS 'Feedback provided by the customer.';

COMMENT ON COLUMN RATING_RAW.DRIVER_COMMENT
IS 'Feedback provided by the driver.';

COMMENT ON COLUMN RATING_RAW.RATING_DATE
IS 'Date when the rating was submitted.';

COMMENT ON COLUMN RATING_RAW.LOAD_TIMESTAMP
IS 'Timestamp when the record was loaded into the Bronze layer.';

COMMENT ON COLUMN RATING_RAW.SOURCE_FILE_NAME
IS 'Source CSV file name.';

COMMENT ON COLUMN RATING_RAW.SOURCE_SYSTEM
IS 'Originating source application.';

COMMENT ON COLUMN RATING_RAW.BATCH_ID
IS 'ETL Batch Identifier.';

COMMENT ON COLUMN RATING_RAW.ROW_NUMBER
IS 'Row number from the source file.';

--==============================================================================
-- Step 5 : Verification
--==============================================================================

DESC TABLE RATING_RAW;

SHOW TABLES LIKE 'RATING_RAW';

--==============================================================================
-- End of Script
--==============================================================================
