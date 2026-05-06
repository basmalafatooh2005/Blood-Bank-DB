-- ============================================================
-- Blood Bank Database Management System
-- File 03: DML - Insert, Update & Delete
-- ============================================================


-- ------------------------------------------------------------
-- SECTION 1: INSERT Data
-- ------------------------------------------------------------


-- Insert into DONOR
-- ------------------------------------------------------------
INSERT INTO Donor (Donor_id, Name, ID, Birth_date, Sex, Blood_Group, Phone_number, Email, Address)
VALUES ('D101', 'Salah Fatooh',  '401234567', TO_DATE('24-10-2001', 'DD-MM-YYYY'), 'Male',   'O+', '0599714735', 'salahfatooh@gmail.com',    'Gaza-Al-Zaytoun');

INSERT INTO Donor (Donor_id, Name, ID, Birth_date, Sex, Blood_Group, Phone_number, Email, Address)
VALUES ('D102', 'Ahmed Dallol',  '401299567', TO_DATE('27-03-1990', 'DD-MM-YYYY'), 'Male',   'A-', '0599718200', 'ahmeddalool11@gmail.com',  'Gaza-Al-Shujaiya');

INSERT INTO Donor (Donor_id, Name, ID, Birth_date, Sex, Blood_Group, Phone_number, Email, Address)
VALUES ('D103', 'Aseel Lafy',    '403399567', TO_DATE('09-01-2005', 'DD-MM-YYYY'), 'Female', 'B+', '0599711200', 'aseellafy22@gmail.com',    'Gaza-Al-Zaytoun');

COMMIT;
SELECT * FROM Donor;


-- Insert into HOSPITAL
-- ------------------------------------------------------------
INSERT INTO Hospital (Hosp_id, Name, Address, Phone_number, Email, Main_Emp_Name)
VALUES ('H101', 'Al-Shifa Hospital',       'Gaza - Al-Rimal District', '0597678543', 'shifa@moh.ps',  'Dr. Mohammed Fatooh');

INSERT INTO Hospital (Hosp_id, Name, Address, Phone_number, Email, Main_Emp_Name)
VALUES ('H102', 'Nasser Complex',          'Khan Younis',              '0598878543', 'nasser@moh.ps', 'Dr. Yousef Dallol');

INSERT INTO Hospital (Hosp_id, Name, Address, Phone_number, Email, Main_Emp_Name)
VALUES ('H103', 'Al-Ahli Al-Arabi Hospital','Gaza - Al-Saha',          '0598800543', 'ahli@mail.ps',  'Dr. Majed Momdoh');

COMMIT;
SELECT * FROM Hospital;


-- Insert into TRAVEL_RECORDS
-- ------------------------------------------------------------
INSERT INTO Travel_records (T_ID, Travel_place, Return_date, Donor_id)
VALUES ('T501', 'Egypt - Cairo',      TO_DATE('10-01-2024', 'DD-MM-YYYY'), 'D101');

INSERT INTO Travel_records (T_ID, Travel_place, Return_date, Donor_id)
VALUES ('T502', 'Jordan - Amman',     TO_DATE('15-02-2024', 'DD-MM-YYYY'), 'D102');

INSERT INTO Travel_records (T_ID, Travel_place, Return_date, Donor_id)
VALUES ('T503', 'Turkey - Istanbul',  TO_DATE('20-03-2023', 'DD-MM-YYYY'), 'D103');

COMMIT;
SELECT * FROM Travel_records;


-- Insert into DISEASES_RECORDS
-- ------------------------------------------------------------
INSERT INTO Diseases_Records (D_ID, Chronic_Diseases, Others, Donor_id)
VALUES ('DS1', 'None',     'Healthy',    'D101');

INSERT INTO Diseases_Records (D_ID, Chronic_Diseases, Others, Donor_id)
VALUES ('DS2', 'Diabetes', 'Controlled', 'D102');

INSERT INTO Diseases_Records (D_ID, Chronic_Diseases, Others, Donor_id)
VALUES ('DS3', 'None',     'None',       'D103');

COMMIT;
SELECT * FROM Diseases_Records;


-- Insert into DONATION_RECORDS
-- ------------------------------------------------------------
INSERT INTO Donation_records (Do_id, Date_donation, Place_Donation, Donor_id)
VALUES ('DON01', TO_DATE('01-02-2024', 'DD-MM-YYYY'), 'Gaza Blood Bank', 'D102');

INSERT INTO Donation_records (Do_id, Date_donation, Place_Donation, Donor_id)
VALUES ('DON02', TO_DATE('02-11-2022', 'DD-MM-YYYY'), 'Nasser Hospital', 'D101');

INSERT INTO Donation_records (Do_id, Date_donation, Place_Donation, Donor_id)
VALUES ('DON03', TO_DATE('23-10-2023', 'DD-MM-YYYY'), 'Yafa Hospital',   'D103');

COMMIT;
SELECT * FROM Donation_records;


-- Insert into REQUEST
-- ------------------------------------------------------------
INSERT INTO Request (Req_id, Hosp_id, Emp_number, Req_Blood_Group, Req_component, Num_of_Packs, Req_date, Req_status)
VALUES ('REQ101', 'H101', '100', 'O+', 'Packed RBCs',  5, TO_DATE('12-02-2024', 'DD-MM-YYYY'), 'Pending');

INSERT INTO Request (Req_id, Hosp_id, Emp_number, Req_Blood_Group, Req_component, Num_of_Packs, Req_date, Req_status)
VALUES ('REQ102', 'H102', '100', 'A-', 'Platelets',    2, TO_DATE('13-05-2023', 'DD-MM-YYYY'), 'Completed');

INSERT INTO Request (Req_id, Hosp_id, Emp_number, Req_Blood_Group, Req_component, Num_of_Packs, Req_date, Req_status)
VALUES ('REQ103', 'H103', '101', 'B+', 'Whole Blood',  3, TO_DATE('13-05-2023', 'DD-MM-YYYY'), 'Pending');

COMMIT;
SELECT * FROM Request;


-- Insert into BLOOD_UNIT
-- ------------------------------------------------------------
INSERT INTO Blood_Unit (Blood_Unit_id, Blood_group, Component, Status, Expire_Date, Volume, Donor_id, Req_id)
VALUES ('BU001', 'O+', 'Packed RBCs', 'Reserved',  TO_DATE('02-01-2023', 'DD-MM-YYYY'), 450, 'D101', 'REQ101');

INSERT INTO Blood_Unit (Blood_Unit_id, Blood_group, Component, Status, Expire_Date, Volume, Donor_id, Req_id)
VALUES ('BU002', 'A-', 'Platelets',   'Available', TO_DATE('24-11-2023', 'DD-MM-YYYY'), 450, 'D102', 'REQ102');

INSERT INTO Blood_Unit (Blood_Unit_id, Blood_group, Component, Status, Expire_Date, Volume, Donor_id, Req_id)
VALUES ('BU003', 'B+', 'Whole Blood', 'Reserved',  TO_DATE('02-11-2024', 'DD-MM-YYYY'), 450, 'D103', 'REQ103');

COMMIT;
SELECT * FROM Blood_Unit;


-- Insert into LABORATORY_TESTS
-- ------------------------------------------------------------
INSERT INTO Laboratory_Tests (Test_id, Unit_id, HIV, Hepatitis_B, Hepatitis_C, Syphilis, Malaria, West_Nile_Virus, HTLV, Sample_Status)
VALUES ('TEST01', 'BU001', 'Negative', 'Negative', 'Negative', 'Negative', 'Negative', 'Negative', 'Negative', 'Approved');

INSERT INTO Laboratory_Tests (Test_id, Unit_id, HIV, Hepatitis_B, Hepatitis_C, Syphilis, Malaria, West_Nile_Virus, HTLV, Sample_Status)
VALUES ('TEST02', 'BU002', 'Negative', 'Negative', 'Negative', 'Negative', 'Negative', 'Negative', 'Negative', 'Approved');

INSERT INTO Laboratory_Tests (Test_id, Unit_id, HIV, Hepatitis_B, Hepatitis_C, Syphilis, Malaria, West_Nile_Virus, HTLV, Sample_Status)
VALUES ('TEST03', 'BU003', 'Negative', 'Positive', 'Negative', 'Negative', 'Negative', 'Negative', 'Negative', 'Rejected');

COMMIT;
SELECT * FROM Laboratory_Tests;


-- ------------------------------------------------------------
-- SECTION 2: UPDATE Data
-- ------------------------------------------------------------

-- Scenario A: Update Blood Unit Status
-- BU002 passed all safety tests -> mark as Available
UPDATE Blood_Unit
SET    Status = 'Available'
WHERE  Blood_Unit_id = 'BU002';
COMMIT;

-- Scenario B: Update Donor Address
-- Salah Fatooh moved to a new location
UPDATE Donor
SET    Address = 'Gaza - Al-Rimal'
WHERE  Donor_id = 'D101';
COMMIT;

-- Scenario C: Update Request Pack Count
-- H101 increased their request REQ101 to 10 packs
UPDATE Request
SET    Num_of_Packs = 10
WHERE  Req_id = 'REQ101';
COMMIT;


-- ------------------------------------------------------------
-- SECTION 3: DELETE Data
-- ------------------------------------------------------------

-- Scenario: Remove lab test TEST03 due to a data entry error
DELETE FROM Laboratory_Tests
WHERE Test_id = 'TEST03';
COMMIT;


-- ============================================================
-- Data operations complete. Proceed to 04_queries.sql
-- ============================================================
