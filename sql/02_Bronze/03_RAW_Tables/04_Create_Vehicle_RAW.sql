/******************************************************************************
Project         : RideNow Enterprise Data Platform
Module          : Bronze Layer
Object          : VEHICLE_RAW
Object Type     : Table
Schema          : BRONZE
Script          : 04_Create_Vehicle_RAW.sql
Author          : Manmeet Singh
Version         : 1.0
Environment     : DEV
Created Date    : 15-Jul-2026

Description:
Creates the VEHICLE_RAW table in the BRONZE schema.
Stores vehicle master data exactly as received from the source system.

------------------------------------------------------------------------------
Load Pattern
------------------------------------------------------------------------------
Source File     : vehicle.csv
Load Type       : Full Load
Refresh         : Daily
Target Layer    : Bronze
Source Format   : CSV

------------------------------------------------------------------------------
Dependencies
------------------------------------------------------------------------------
Input File      : vehicle.csv
Target Table    : BRONZE.VEHICLE_RAW
Downstream      : SILVER.VEHICLE_DIM
******************************************************************************/

--==============================================================================
-- Step 1 : Set Context
--==============================================================================

USE ROLE ROLE_ADMIN;

USE WAREHOUSE WH_ETL;

USE DATABASE RIDENOW_DB;

USE SCHEMA BRONZE;

--==============================================================================
-- Step 2 : Create VEHICLE_RAW Table
--==============================================================================

CREATE OR REPLACE TRANSIENT TABLE VEHICLE_RAW
(
    ----------------------------------------------------------------------------
    -- Business Columns
    ----------------------------------------------------------------------------

    VEHICLE_ID                 VARCHAR(20),
    VEHICLE_NUMBER             VARCHAR(20),
    VEHICLE_TYPE               VARCHAR(30),
    BRAND                      VARCHAR(50),
    MODEL                      VARCHAR(50),
    MANUFACTURING_YEAR         NUMBER(4,0),
    COLOR                      VARCHAR(30),
    FUEL_TYPE                  VARCHAR(20),
    SEATING_CAPACITY           NUMBER(2,0),
    REGISTRATION_DATE          DATE,
    INSURANCE_EXPIRY_DATE      DATE,
    VEHICLE_STATUS             VARCHAR(20),

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

COMMENT ON TABLE VEHICLE_RAW IS
'Stores raw vehicle master data exactly as received from the source system.';

--==============================================================================
-- Step 4 : Column Comments
--==============================================================================

COMMENT ON COLUMN VEHICLE_RAW.VEHICLE_ID
IS 'Business identifier received from the source system.';

COMMENT ON COLUMN VEHICLE_RAW.VEHICLE_NUMBER
IS 'Vehicle registration number.';

COMMENT ON COLUMN VEHICLE_RAW.VEHICLE_TYPE
IS 'Vehicle category such as Sedan, SUV or Hatchback.';

COMMENT ON COLUMN VEHICLE_RAW.BRAND
IS 'Vehicle manufacturer.';

COMMENT ON COLUMN VEHICLE_RAW.MODEL
IS 'Vehicle model name.';

COMMENT ON COLUMN VEHICLE_RAW.MANUFACTURING_YEAR
IS 'Year the vehicle was manufactured.';

COMMENT ON COLUMN VEHICLE_RAW.COLOR
IS 'Vehicle exterior color.';

COMMENT ON COLUMN VEHICLE_RAW.FUEL_TYPE
IS 'Fuel type used by the vehicle.';

COMMENT ON COLUMN VEHICLE_RAW.SEATING_CAPACITY
IS 'Maximum seating capacity of the vehicle.';

COMMENT ON COLUMN VEHICLE_RAW.REGISTRATION_DATE
IS 'Vehicle registration date.';

COMMENT ON COLUMN VEHICLE_RAW.INSURANCE_EXPIRY_DATE
IS 'Insurance policy expiry date.';

COMMENT ON COLUMN VEHICLE_RAW.VEHICLE_STATUS
IS 'Current operational status of the vehicle.';

COMMENT ON COLUMN VEHICLE_RAW.LOAD_TIMESTAMP
IS 'Timestamp when the record was loaded into the Bronze layer.';

COMMENT ON COLUMN VEHICLE_RAW.SOURCE_FILE_NAME
IS 'Source CSV file name.';

COMMENT ON COLUMN VEHICLE_RAW.SOURCE_SYSTEM
IS 'Originating source application.';

COMMENT ON COLUMN VEHICLE_RAW.BATCH_ID
IS 'ETL Batch Identifier.';

COMMENT ON COLUMN VEHICLE_RAW.ROW_NUMBER
IS 'Row number from the source file.';

--==============================================================================
-- Step 5 : Verification
--==============================================================================

DESC TABLE VEHICLE_RAW;

SHOW TABLES LIKE 'VEHICLE_RAW';

--==============================================================================
-- End of Script
--==============================================================================
