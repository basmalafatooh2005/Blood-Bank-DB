-- ============================================================
-- Blood Bank Database Management System
-- File 04: DQL - SELECT Queries & Reports
-- ============================================================


-- ------------------------------------------------------------
-- SECTION 1: Basic Queries
-- ------------------------------------------------------------

-- Query A: Filter by Blood Group
-- Show all donors with blood group O+
-- ------------------------------------------------------------
SELECT *
FROM   Donor
WHERE  Blood_Group = 'O+';


-- Query B: Select Specific Columns
-- List names and phone numbers of all hospitals
-- ------------------------------------------------------------
SELECT Name, Phone_number
FROM   Hospital;


-- Query C: Column Aliases
-- Hospital contact list with renamed columns
-- ------------------------------------------------------------
SELECT Name  AS "Hospital Name",
       Email AS "Contact Email"
FROM   Hospital;


-- Query D: DISTINCT Values
-- List all unique blood groups in the donor database
-- ------------------------------------------------------------
SELECT DISTINCT Blood_Group
FROM   Donor;


-- Query E: LIKE + Logical Conditions
-- Find donors whose name starts with 'S' and have blood group O+
-- ------------------------------------------------------------
SELECT Donor_id, Name, Blood_Group, Phone_number
FROM   Donor
WHERE  Name        LIKE 'S%'
AND    Blood_Group  =   'O+';


-- Query F: ORDER BY
-- List all blood units sorted by volume (largest to smallest)
-- ------------------------------------------------------------
SELECT Blood_Unit_id, Blood_group, Component, Volume, Status
FROM   Blood_Unit
ORDER  BY Volume DESC;


-- Query G: GROUP BY
-- Total number of blood units per blood group
-- ------------------------------------------------------------
SELECT Blood_Group,
       COUNT(Blood_Unit_id) AS "Total Units"
FROM   Blood_Unit
GROUP  BY Blood_Group;


-- Query H: HAVING
-- Show only blood groups with more than one unit stored
-- ------------------------------------------------------------
SELECT Blood_Group,
       COUNT(Blood_Unit_id) AS "Total Units"
FROM   Blood_Unit
GROUP  BY Blood_Group
HAVING COUNT(Blood_Unit_id) > 1;


-- ------------------------------------------------------------
-- SECTION 2: Advanced Reports
-- ------------------------------------------------------------

-- Report 1: Blood Unit Inventory - Remaining Shelf Life
-- Shows available units and how many days until they expire
-- ------------------------------------------------------------
SELECT Blood_Unit_id              AS "Unit ID",
       UPPER(Blood_group)         AS "Blood Group",
       INITCAP(Component)         AS "Component Type",
       (Expire_Date - SYSDATE)    AS "Days Until Expire"
FROM   Blood_Unit
WHERE  UPPER(Status) = 'AVAILABLE'
AND    (Expire_Date - SYSDATE) > 0
ORDER  BY "Days Until Expire" ASC;


-- Report 2: Donor-to-Unit Traceability
-- List all donors alongside the blood units they donated
-- Includes unit status for full traceability
-- ------------------------------------------------------------
SELECT d.Name             AS "Donor Name",
       bu.Blood_Unit_id   AS "Unit ID",
       bu.Blood_group     AS "Blood Group",
       bu.Status          AS "Unit Status"
FROM   Donor d
JOIN   Blood_Unit bu ON d.Donor_id = bu.Donor_id;


-- Report 3: Hospital Request Fulfillment
-- Shows which blood unit was assigned to each hospital request
-- Includes request status for tracking
-- ------------------------------------------------------------
SELECT h.Name           AS "Hospital Name",
       r.Req_id         AS "Request ID",
       bu.Blood_Unit_id AS "Assigned Unit",
       r.Req_status     AS "Status"
FROM   Hospital h
JOIN   Request    r  ON h.Hosp_id   = r.Hosp_id
JOIN   Blood_Unit bu ON r.Req_id    = bu.Req_id;


-- ============================================================
-- End of Project Queries
-- ============================================================
