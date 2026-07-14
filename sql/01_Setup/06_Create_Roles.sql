/***************************************************************************************************
File Name      : 06_Create_Roles.sql

Project        : RideNow Enterprise Data Platform

Author         : Manmeet Singh

Created Date   : July 2026

Description    : Creates Roles for the RideNow Enterprise Data Platform.

****************************************************************************************************
Modification History

Version     Date          Author             Description
-------     ----------    ----------------   ------------------------------------
1.0         Jul-2026      Manmeet Singh      Initial Version

***************************************************************************************************/

USE ROLE SECURITYADMIN;

--==================================================================================
-- Create Roles
--==================================================================================

CREATE ROLE IF NOT EXISTS ROLE_ADMIN
COMMENT='RideNow Platform Administrator';

CREATE ROLE IF NOT EXISTS ROLE_ETL
COMMENT='ETL Developer Role';

CREATE ROLE IF NOT EXISTS ROLE_ANALYST
COMMENT='Business Analyst Role';

CREATE ROLE IF NOT EXISTS ROLE_DATA_SCIENTIST
COMMENT='Data Scientist Role';

CREATE ROLE IF NOT EXISTS ROLE_READ_ONLY
COMMENT='Read Only Role';

--==================================================================================
-- Verify
--==================================================================================

SHOW ROLES LIKE 'ROLE_%';
