/******************************************************************************
Project         : RideNow Enterprise Data Platform
Module          : Bronze Layer
Object          : TRIP_RAW
Object Type     : Table
Schema          : BRONZE
Script          : 06_Create_Trip_RAW.sql
Author          : Manmeet Singh
Version         : 1.0
Environment     : DEV
Created Date    : 15-Jul-2026

Description:
Creates the TRIP_RAW table in the BRONZE schema.
Stores trip transaction data exactly as received from the source system.

------------------------------------------------------------------------------
Load Pattern
------------------------------------------------------------------------------
Source File     : trip.csv
Load Type       : Full Load
Refresh         : Daily
Target Layer    : Bronze
Source Format   : CSV

------------------------------------------------------------------------------
Dependencies
------------------------------------------------------------------------------
Input File      : trip.csv
Target Table    : BRONZE.TRIP_RAW
Downstream      : SILVER.FACT_TRIP
******************************************************************************/

--==============================================================================
-- Step 1 : Set Context
--==============================================================================

USE ROLE ROLE_ADMIN;

USE WAREHOUSE WH_ETL;

USE DATABASE RIDENOW_DB;

USE SCHEMA BRONZE;

--==============================================================================
-- Step 2 : Create TRIP_RAW Table
--==============================================================================

CREATE OR REPLACE TRANSIENT TABLE TRIP_RAW
(
    ----------------------------------------------------------------------------
    -- Business Columns
    ----------------------------------------------------------------------------

    TRIP_ID                         VARCHAR(20),
    CUSTOMER_ID                     VARCHAR(20),
    DRIVER_ID                       VARCHAR(20),
    VEHICLE_ID                      VARCHAR(20),
    PROMOTION_ID                    VARCHAR(20),

    PICKUP_CITY_ID                  VARCHAR(20),
    DROPOFF_CITY_ID                 VARCHAR(20),

    BOOKING_TIMESTAMP               TIMESTAMP_NTZ,
    PICKUP_TIMESTAMP                TIMESTAMP_NTZ,
    DROPOFF_TIMESTAMP               TIMESTAMP_NTZ,

    TRIP_DISTANCE_KM                NUMBER(8,2),
    TRIP_DURATION_MINUTES           NUMBER(6,0),

    BASE_FARE                       NUMBER(10,2),
    SURGE_MULTIPLIER                NUMBER(4,2),
    SURGE_AMOUNT                    NUMBER(10,2),
    PROMOTION_DISCOUNT_AMOUNT       NUMBER(10,2),
    TOTAL_FARE                      NUMBER(10,2),

    PAYMENT_STATUS                  VARCHAR(20),
    TRIP_STATUS                     VARCHAR(20),

    ----------------------------------------------------------------------------
    -- Metadata Columns
    ----------------------------------------------------------------------------

    LOAD_TIMESTAMP                  TIMESTAMP_NTZ DEFAULT CURRENT_TIMESTAMP(),
    SOURCE_FILE_NAME                VARCHAR(255),
    SOURCE_SYSTEM                   VARCHAR(50),
    BATCH_ID                        NUMBER(38,0),
    ROW_NUMBER                      NUMBER(38,0)

);

--==============================================================================
-- Step 3 : Table Comment
--==============================================================================

COMMENT ON TABLE TRIP_RAW IS
'Stores raw trip transaction data exactly as received from the source system.';

--==============================================================================
-- Step 4 : Column Comments
--==============================================================================

COMMENT ON COLUMN TRIP_RAW.TRIP_ID
IS 'Business identifier received from the source system.';

COMMENT ON COLUMN TRIP_RAW.CUSTOMER_ID
IS 'Customer identifier associated with the trip.';

COMMENT ON COLUMN TRIP_RAW.DRIVER_ID
IS 'Driver identifier associated with the trip.';

COMMENT ON COLUMN TRIP_RAW.VEHICLE_ID
IS 'Vehicle identifier used for the trip.';

COMMENT ON COLUMN TRIP_RAW.PROMOTION_ID
IS 'Promotion identifier applied to the trip, if any.';

COMMENT ON COLUMN TRIP_RAW.PICKUP_CITY_ID
IS 'Pickup city identifier.';

COMMENT ON COLUMN TRIP_RAW.DROPOFF_CITY_ID
IS 'Drop-off city identifier.';

COMMENT ON COLUMN TRIP_RAW.BOOKING_TIMESTAMP
IS 'Timestamp when the trip was booked.';

COMMENT ON COLUMN TRIP_RAW.PICKUP_TIMESTAMP
IS 'Timestamp when the customer was picked up.';

COMMENT ON COLUMN TRIP_RAW.DROPOFF_TIMESTAMP
IS 'Timestamp when the trip was completed.';

COMMENT ON COLUMN TRIP_RAW.TRIP_DISTANCE_KM
IS 'Total trip distance in kilometers.';

COMMENT ON COLUMN TRIP_RAW.TRIP_DURATION_MINUTES
IS 'Total trip duration in minutes.';

COMMENT ON COLUMN TRIP_RAW.BASE_FARE
IS 'Base fare before surge pricing and discounts.';

COMMENT ON COLUMN TRIP_RAW.SURGE_MULTIPLIER
IS 'Surge pricing multiplier applied to the trip.';

COMMENT ON COLUMN TRIP_RAW.SURGE_AMOUNT
IS 'Additional amount charged due to surge pricing.';

COMMENT ON COLUMN TRIP_RAW.PROMOTION_DISCOUNT_AMOUNT
IS 'Discount applied from the promotion.';

COMMENT ON COLUMN TRIP_RAW.TOTAL_FARE
IS 'Final fare charged for the trip.';

COMMENT ON COLUMN TRIP_RAW.PAYMENT_STATUS
IS 'Payment status received from the source system.';

COMMENT ON COLUMN TRIP_RAW.TRIP_STATUS
IS 'Current trip status.';

COMMENT ON COLUMN TRIP_RAW.LOAD_TIMESTAMP
IS 'Timestamp when the record was loaded into the Bronze layer.';

COMMENT ON COLUMN TRIP_RAW.SOURCE_FILE_NAME
IS 'Source CSV file name.';

COMMENT ON COLUMN TRIP_RAW.SOURCE_SYSTEM
IS 'Originating source application.';

COMMENT ON COLUMN TRIP_RAW.BATCH_ID
IS 'ETL Batch Identifier.';

COMMENT ON COLUMN TRIP_RAW.ROW_NUMBER
IS 'Row number from the source file.';

--==============================================================================
-- Step 5 : Verification
--==============================================================================

DESC TABLE TRIP_RAW;

SHOW TABLES LIKE 'TRIP_RAW';

--==============================================================================
-- End of Script
--==============================================================================
