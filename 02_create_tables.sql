-- ============================================================
-- Blood Bank Database Management System
-- File 02: DDL - Create Tables
-- ============================================================


-- ------------------------------------------------------------
-- SECTION 1: Parent Tables (No Foreign Key Dependencies)
-- ------------------------------------------------------------


-- Table 1: DONOR
-- Stores all donor personal information and blood group
-- ------------------------------------------------------------
CREATE TABLE Donor (
    Donor_id      VARCHAR2(20),
    Name          VARCHAR2(50)  NOT NULL,
    ID            VARCHAR2(20)  NOT NULL,
    Birth_date    DATE          NOT NULL,
    Sex           VARCHAR2(10),
    Blood_Group   VARCHAR2(5)   NOT NULL,
    Phone_number  VARCHAR2(15),
    Email         VARCHAR2(50),
    Address       VARCHAR2(150),

    CONSTRAINT donor_pk          PRIMARY KEY (Donor_id),
    CONSTRAINT donor_id_uk       UNIQUE (ID),
    CONSTRAINT donor_phone_uk    UNIQUE (Phone_number),
    CONSTRAINT donor_email_uk    UNIQUE (Email),
    CONSTRAINT chk_donor_sex     CHECK (UPPER(Sex) IN ('MALE', 'FEMALE')),
    CONSTRAINT chk_donor_blood   CHECK (Blood_Group IN ('A+','A-','B+','B-','AB+','AB-','O+','O-'))
);

DESC Donor;


-- Table 2: HOSPITAL
-- Stores hospital contact information and main employee
-- ------------------------------------------------------------
CREATE TABLE Hospital (
    Hosp_id         VARCHAR2(20),
    Name            VARCHAR2(50)  NOT NULL,
    Address         VARCHAR2(150) NOT NULL,
    Phone_number    VARCHAR2(15),
    Email           VARCHAR2(100),
    Main_Emp_Name   VARCHAR2(40),

    CONSTRAINT hosp_pk        PRIMARY KEY (Hosp_id),
    CONSTRAINT hosp_phone_uk  UNIQUE (Phone_number),
    CONSTRAINT hosp_email_uk  UNIQUE (Email)
);

DESC Hospital;


-- ------------------------------------------------------------
-- SECTION 2: Linked Tables (With Foreign Key Dependencies)
-- ------------------------------------------------------------


-- Table 3: TRAVEL_RECORDS
-- Tracks donor travel history (used for donation eligibility)
-- ------------------------------------------------------------
CREATE TABLE Travel_records (
    T_ID          VARCHAR2(20),
    Travel_place  VARCHAR2(100) NOT NULL,
    Return_Date   DATE,
    Donor_id      VARCHAR2(20),

    CONSTRAINT travel_pk       PRIMARY KEY (T_ID),
    CONSTRAINT travel_donor_fk FOREIGN KEY (Donor_id) REFERENCES Donor (Donor_id)
);

DESC Travel_records;


-- Table 4: DISEASES_RECORDS
-- Tracks donor chronic diseases and other health conditions
-- ------------------------------------------------------------
CREATE TABLE Diseases_Records (
    D_ID              VARCHAR2(20),
    Chronic_Diseases  VARCHAR2(200),
    Others            VARCHAR2(200),
    Donor_id          VARCHAR2(20),

    CONSTRAINT dis_pk       PRIMARY KEY (D_ID),
    CONSTRAINT dis_donor_fk FOREIGN KEY (Donor_id) REFERENCES Donor (Donor_id)
);

DESC Diseases_Records;


-- Table 5: DONATION_RECORDS
-- Logs each donation event per donor
-- ------------------------------------------------------------
CREATE TABLE Donation_records (
    Do_id           VARCHAR2(20),
    Date_donation   DATE         NOT NULL,
    Place_Donation  VARCHAR2(100),
    Donor_id        VARCHAR2(20),

    CONSTRAINT don_pk       PRIMARY KEY (Do_id),
    CONSTRAINT don_donor_fk FOREIGN KEY (Donor_id) REFERENCES Donor (Donor_id)
);

DESC Donation_records;


-- Table 6: REQUEST
-- Records hospital requests for blood units
-- ------------------------------------------------------------
CREATE TABLE Request (
    Req_id          VARCHAR2(20),
    Hosp_id         VARCHAR2(20),
    Emp_number      VARCHAR2(20)  NOT NULL,
    Req_Blood_Group VARCHAR2(5)   NOT NULL,
    Req_component   VARCHAR2(50)  NOT NULL,
    Num_of_Packs    NUMBER        NOT NULL,
    Req_date        DATE          NOT NULL,
    Req_status      VARCHAR2(20)  NOT NULL,

    CONSTRAINT req_pk              PRIMARY KEY (Req_id),
    CONSTRAINT req_hosp_fk         FOREIGN KEY (Hosp_id) REFERENCES Hospital (Hosp_id),
    CONSTRAINT chk_req_blood       CHECK (Req_Blood_Group IN ('A+','A-','B+','B-','AB+','AB-','O+','O-')),
    CONSTRAINT chk_req_component   CHECK (UPPER(Req_component) IN ('WHOLE BLOOD','PACKED RBCS','PLATELETS','FRESH FROZEN PLASMA','CRYOPRECIPITATE')),
    CONSTRAINT chk_req_status      CHECK (UPPER(Req_status) IN ('COMPLETED','CANCELLED','PENDING')),
    CONSTRAINT chk_req_num_packs   CHECK (Num_of_Packs > 0)
);

DESC Request;


-- Table 7: BLOOD_UNIT
-- Tracks each individual blood unit from donation to delivery
-- ------------------------------------------------------------
CREATE TABLE Blood_Unit (
    Blood_Unit_id  VARCHAR2(20),
    Blood_group    VARCHAR2(5)   NOT NULL,
    Component      VARCHAR2(50)  NOT NULL,
    Status         VARCHAR2(20)  NOT NULL,
    Expire_Date    DATE          NOT NULL,
    Volume         NUMBER,
    Donor_id       VARCHAR2(20),
    Req_id         VARCHAR2(20),

    CONSTRAINT unit_pk            PRIMARY KEY (Blood_Unit_id),
    CONSTRAINT unit_donor_fk      FOREIGN KEY (Donor_id) REFERENCES Donor (Donor_id),
    CONSTRAINT unit_req_fk        FOREIGN KEY (Req_id) REFERENCES Request (Req_id),
    CONSTRAINT chk_unit_component CHECK (UPPER(Component) IN ('WHOLE BLOOD','PACKED RBCS','PLATELETS','FRESH FROZEN PLASMA','CRYOPRECIPITATE')),
    CONSTRAINT chk_unit_status    CHECK (UPPER(Status) IN ('AVAILABLE','RESERVED','EXPIRED','REJECTED')),
    CONSTRAINT chk_unit_blood     CHECK (Blood_group IN ('A+','A-','B+','B-','AB+','AB-','O+','O-')),
    CONSTRAINT chk_unit_volume    CHECK (Volume > 0)
);

DESC Blood_Unit;


-- Table 8: LABORATORY_TESTS
-- Stores disease screening results for each blood unit
-- ------------------------------------------------------------
CREATE TABLE Laboratory_Tests (
    Test_id         VARCHAR2(20),
    Unit_id         VARCHAR2(20),
    HIV             VARCHAR2(10)  NOT NULL,
    Hepatitis_B     VARCHAR2(10)  NOT NULL,
    Hepatitis_C     VARCHAR2(10)  NOT NULL,
    Syphilis        VARCHAR2(10)  NOT NULL,
    Malaria         VARCHAR2(10)  NOT NULL,
    West_Nile_Virus VARCHAR2(10)  NOT NULL,
    HTLV            VARCHAR2(10)  NOT NULL,
    Sample_Status   VARCHAR2(20)  NOT NULL,

    CONSTRAINT test_pk            PRIMARY KEY (Test_id),
    CONSTRAINT test_unit_fk       FOREIGN KEY (Unit_id) REFERENCES Blood_Unit (Blood_Unit_id),
    CONSTRAINT chk_sample_status  CHECK (UPPER(Sample_Status) IN ('APPROVED','REJECTED','PENDING'))
);

DESC Laboratory_Tests;


-- ------------------------------------------------------------
-- SECTION 3: ALTER Examples (Modify & Rollback)
-- ------------------------------------------------------------

-- Add a temporary column to Hospital
ALTER TABLE Hospital ADD (Extra_info VARCHAR2(100));
DESC Hospital;

-- Remove the temporary column
ALTER TABLE Hospital DROP COLUMN Extra_info;
DESC Hospital;


-- ============================================================
-- All tables created successfully. Proceed to 03_insert_data.sql
-- ============================================================
