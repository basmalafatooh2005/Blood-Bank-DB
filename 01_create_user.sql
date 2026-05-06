-- ============================================================
-- Blood Bank Database Management System
-- File 01: Database User Setup
-- ============================================================

-- Step 1: Connect as system admin
-- Run this command in your terminal or SQL client:
-- sqlplus / as sysdba

-- Step 2: Create the project user
CREATE USER Blood_Bank_DB IDENTIFIED BY 123;

-- Step 3: Grant necessary permissions
GRANT CONNECT, RESOURCE, DBA TO Blood_Bank_DB;

-- Step 4: Allocate storage space
ALTER USER Blood_Bank_DB QUOTA 50M ON SYSTEM;

-- Step 5: Connect with the new user to start working
-- CONNECT Blood_Bank_DB / 123;

-- ============================================================
-- User setup complete. Proceed to 02_create_tables.sql
-- ============================================================
