/******************************************************************************
Project         : RideNow Enterprise Data Platform
Module          : Bronze Layer
Object          : PROMOTION_RAW
Object Type     : Table
Schema          : BRONZE
Script          : 02_Create_Promotion_RAW.sql
Author          : Manmeet Singh
Version         : 1.0
Environment     : DEV
Created Date    : 15-Jul-2026

Description:
Creates the PROMOTION_RAW table in the BRONZE schema.
Stores promotion master data exactly as received from the source system.

Load Pattern
----------------------------------------------------------------------------
Source File     : promotion.csv
Load Type       : Full Load
Refresh         : Daily
Target Layer    : Bronze
Source Format   : CSV
******************************************************************************/

--==============================================================================
-- Step 1 : Set Context
--==============================================================================

USE ROLE ROLE_ADMIN;

USE WAREHOUSE WH_ETL;

USE DATABASE RIDENOW_DB;

USE SCHEMA BRONZE;

--==============================================================================
-- Step 2 : Create PROMOTION_RAW Table
--==============================================================================

CREATE OR REPLACE TRANSIENT TABLE PROMOTION_RAW
(
    ----------------------------------------------------------------------------
    -- Business Columns
    ----------------------------------------------------------------------------

    PROMOTION_ID               VARCHAR(20),
    PROMOTION_CODE             VARCHAR(30),
    PROMOTION_NAME             VARCHAR(100),
    PROMOTION_TYPE             VARCHAR(30),
    DISCOUNT_VALUE             NUMBER(10,2),
    MIN_TRIP_AMOUNT            NUMBER(10,2),
    MAX_DISCOUNT_AMOUNT        NUMBER(10,2),
    START_DATE                 DATE,
    END_DATE                   DATE,
    PROMOTION_STATUS           VARCHAR(20),

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

COMMENT ON TABLE PROMOTION_RAW IS
'Stores raw promotion master data exactly as received from the source system.';

--==============================================================================
-- Step 4 : Column Comments
--==============================================================================

COMMENT ON COLUMN PROMOTION_RAW.PROMOTION_ID
IS 'Business identifier received from the source system.';

COMMENT ON COLUMN PROMOTION_RAW.PROMOTION_CODE
IS 'Promotion code entered by customers during booking.';

COMMENT ON COLUMN PROMOTION_RAW.PROMOTION_NAME
IS 'Promotion or campaign name.';

COMMENT ON COLUMN PROMOTION_RAW.PROMOTION_TYPE
IS 'Promotion type (Percentage or Fixed Amount).';

COMMENT ON COLUMN PROMOTION_RAW.DISCOUNT_VALUE
IS 'Configured discount amount or percentage.';

COMMENT ON COLUMN PROMOTION_RAW.MIN_TRIP_AMOUNT
IS 'Minimum trip amount required to apply the promotion.';

COMMENT ON COLUMN PROMOTION_RAW.MAX_DISCOUNT_AMOUNT
IS 'Maximum discount allowed for percentage-based promotions.';

COMMENT ON COLUMN PROMOTION_RAW.START_DATE
IS 'Promotion effective start date.';

COMMENT ON COLUMN PROMOTION_RAW.END_DATE
IS 'Promotion expiry date.';

COMMENT ON COLUMN PROMOTION_RAW.PROMOTION_STATUS
IS 'Current promotion status.';

COMMENT ON COLUMN PROMOTION_RAW.LOAD_TIMESTAMP
IS 'Timestamp when the record was loaded into the Bronze layer.';

COMMENT ON COLUMN PROMOTION_RAW.SOURCE_FILE_NAME
IS 'Source CSV file name.';

COMMENT ON COLUMN PROMOTION_RAW.SOURCE_SYSTEM
IS 'Originating source application.';

COMMENT ON COLUMN PROMOTION_RAW.BATCH_ID
IS 'ETL Batch Identifier.';

COMMENT ON COLUMN PROMOTION_RAW.ROW_NUMBER
IS 'Row number from the source file.';

--==============================================================================
-- Step 5 : Verification
--==============================================================================

DESC TABLE PROMOTION_RAW;

SHOW TABLES LIKE 'PROMOTION_RAW';

--==============================================================================
-- End of Script
--==============================================================================
