/******************************************************************************
Project      : RideNow Enterprise Data Platform
Module       : Grant Privileges
Script       : 08_Grant_Privileges.sql
Author       : Manmeet Singh
Version      : 1.0
Created Date : 15-Jul-2026

Description:
Grant database, schema, warehouse, stage and object privileges
to RideNow project roles.

Execution Order:
    01_Create_Warehouses.sql
    02_Create_Database.sql
    03_Create_Schemas.sql
    04_Create_File_Formats.sql
    05_Create_Stages.sql
    06_Create_Roles.sql
    07_Create_Users.sql
    08_Grant_Privileges.sql

******************************************************************************/

--===========================================================================
-- STEP 1 : Use SECURITYADMIN
--===========================================================================

USE ROLE SECURITYADMIN;

--===========================================================================
-- STEP 2 : Warehouse Privileges
--===========================================================================

GRANT USAGE
ON WAREHOUSE WH_ETL
TO ROLE ROLE_ADMIN;

GRANT USAGE
ON WAREHOUSE WH_ETL
TO ROLE ROLE_ETL;

GRANT USAGE
ON WAREHOUSE WH_ANALYTICS
TO ROLE ROLE_ANALYST;

--===========================================================================
-- STEP 3 : Database Privileges
--===========================================================================

GRANT USAGE
ON DATABASE RIDENOW_DB
TO ROLE ROLE_ADMIN;

GRANT USAGE
ON DATABASE RIDENOW_DB
TO ROLE ROLE_ETL;

GRANT USAGE
ON DATABASE RIDENOW_DB
TO ROLE ROLE_ANALYST;

--===========================================================================
-- STEP 4 : Schema Privileges
--===========================================================================

-- BRONZE

GRANT USAGE
ON SCHEMA RIDENOW_DB.BRONZE
TO ROLE ROLE_ADMIN;

GRANT USAGE
ON SCHEMA RIDENOW_DB.BRONZE
TO ROLE ROLE_ETL;

-- SILVER

GRANT USAGE
ON SCHEMA RIDENOW_DB.SILVER
TO ROLE ROLE_ADMIN;

GRANT USAGE
ON SCHEMA RIDENOW_DB.SILVER
TO ROLE ROLE_ETL;

-- GOLD

GRANT USAGE
ON SCHEMA RIDENOW_DB.GOLD
TO ROLE ROLE_ADMIN;

GRANT USAGE
ON SCHEMA RIDENOW_DB.GOLD
TO ROLE ROLE_ETL;

GRANT USAGE
ON SCHEMA RIDENOW_DB.GOLD
TO ROLE ROLE_ANALYST;

-- STAGE

GRANT USAGE
ON SCHEMA RIDENOW_DB.STAGE
TO ROLE ROLE_ADMIN;

GRANT USAGE
ON SCHEMA RIDENOW_DB.STAGE
TO ROLE ROLE_ETL;

--===========================================================================
-- STEP 5 : Future Table Privileges
--===========================================================================

-- ROLE_ADMIN

GRANT ALL PRIVILEGES
ON FUTURE TABLES
IN SCHEMA RIDENOW_DB.BRONZE
TO ROLE ROLE_ADMIN;

GRANT ALL PRIVILEGES
ON FUTURE TABLES
IN SCHEMA RIDENOW_DB.SILVER
TO ROLE ROLE_ADMIN;

GRANT ALL PRIVILEGES
ON FUTURE TABLES
IN SCHEMA RIDENOW_DB.GOLD
TO ROLE ROLE_ADMIN;

-- ROLE_ETL

GRANT SELECT, INSERT, UPDATE, DELETE
ON FUTURE TABLES
IN SCHEMA RIDENOW_DB.BRONZE
TO ROLE ROLE_ETL;

GRANT SELECT, INSERT, UPDATE, DELETE
ON FUTURE TABLES
IN SCHEMA RIDENOW_DB.SILVER
TO ROLE ROLE_ETL;

GRANT SELECT, INSERT, UPDATE, DELETE
ON FUTURE TABLES
IN SCHEMA RIDENOW_DB.GOLD
TO ROLE ROLE_ETL;

-- ROLE_ANALYST

GRANT SELECT
ON FUTURE TABLES
IN SCHEMA RIDENOW_DB.GOLD
TO ROLE ROLE_ANALYST;

--===========================================================================
-- STEP 6 : Future Views
--===========================================================================

GRANT SELECT
ON FUTURE VIEWS
IN SCHEMA RIDENOW_DB.GOLD
TO ROLE ROLE_ANALYST;

GRANT ALL PRIVILEGES
ON FUTURE VIEWS
IN SCHEMA RIDENOW_DB.GOLD
TO ROLE ROLE_ADMIN;

--===========================================================================
-- STEP 7 : Stage Privileges
--===========================================================================

GRANT USAGE
ON ALL STAGES
IN SCHEMA RIDENOW_DB.STAGE
TO ROLE ROLE_ADMIN;

GRANT USAGE
ON ALL STAGES
IN SCHEMA RIDENOW_DB.STAGE
TO ROLE ROLE_ETL;

GRANT READ, WRITE
ON ALL STAGES
IN SCHEMA RIDENOW_DB.STAGE
TO ROLE ROLE_ETL;

--===========================================================================
-- STEP 8 : File Format Privileges
--===========================================================================

GRANT USAGE
ON ALL FILE FORMATS
IN SCHEMA RIDENOW_DB.STAGE
TO ROLE ROLE_ADMIN;

GRANT USAGE
ON ALL FILE FORMATS
IN SCHEMA RIDENOW_DB.STAGE
TO ROLE ROLE_ETL;

--===========================================================================
-- STEP 9 : Verification
--===========================================================================

SHOW GRANTS TO ROLE ROLE_ADMIN;

SHOW GRANTS TO ROLE ROLE_ETL;

SHOW GRANTS TO ROLE ROLE_ANALYST;

--===========================================================================
-- End of Script
--===========================================================================
