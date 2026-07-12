/******************************************************************************************
 Project Name : RideNow Enterprise Data Platform
 Module       : Environment Setup
 Script Name  : 01_Create_Database.sql

 Author       : Manmeet Singh
 Version      : 1.0
 Created Date : 13-Jul-2026

 Description:
 ------------------------------------------------------------------------------
 Creates the Development Database for the RideNow Enterprise Data Platform.

 This database will host all schemas required for:
     - RAW Data
     - CURATED Data
     - ANALYTICS
     - SECURITY
     - ADMINISTRATION

 Environment:
     DEV

 Execution Order:
     1. Create Database
     2. Create Warehouses
     3. Create Schemas
     4. Create Roles

******************************************************************************************/

-- ============================================================================
-- Use SYSADMIN Role
-- ============================================================================

USE ROLE SYSADMIN;

-- ============================================================================
-- Create Development Database
-- ============================================================================

CREATE DATABASE IF NOT EXISTS RN_DEV_DB
COMMENT = 'RideNow Enterprise Data Platform - Development Database';

-- ============================================================================
-- Verify Database Creation
-- ============================================================================

SHOW DATABASES LIKE 'RN_DEV_DB';

-- ============================================================================
-- Use Database
-- ============================================================================

USE DATABASE RN_DEV_DB;

-- ============================================================================
-- Display Current Database
-- ============================================================================

SELECT CURRENT_DATABASE() AS ACTIVE_DATABASE;
