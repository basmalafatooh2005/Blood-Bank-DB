# 🩸 Blood Bank Database Management System

> A relational database system designed to manage blood donation, storage, testing, and hospital fulfillment operations — built with Oracle SQL.

---

## 📌 Overview

The **Blood Bank DBMS** is an academic database project that simulates a real-world blood bank management system. It enables efficient tracking of donors, blood units, laboratory tests, and hospital requests — ensuring the right blood reaches the right patient at the right time.

---

## 🎯 Objectives

- Ensure hospitals receive the correct blood packs on time
- Manage complete donor profiles and donation history
- Track blood unit lifecycle from donation to delivery
- Support emergency response through fast data access
- Reduce errors and unnecessary transfusion costs

---

## 🗂️ Database Schema

The system is built around **8 core tables**:

| Table | Description |
|---|---|
| `DONOR` | Stores donor personal info, blood group, and contact details |
| `BLOOD_UNIT` | Tracks each blood unit — component, status, expiry, and volume |
| `HOSPITAL` | Manages hospital records and main contact employees |
| `REQUEST` | Records blood requests made by hospitals with status tracking |
| `LABORATORY_TESTS` | Stores disease screening results for each blood unit |
| `DONATION_RECORDS` | Logs each donor's donation history and location |
| `DISEASES_RECORDS` | Tracks chronic conditions and health notes per donor |
| `TRAVEL_RECORDS` | Records donor travel history (relevant for eligibility checks) |

---

## 🔗 Entity Relationships

```
DONOR ──(1:M)──> BLOOD_UNIT
DONOR ──(1:M)──> DONATION_RECORDS
DONOR ──(1:M)──> DISEASES_RECORDS
DONOR ──(1:M)──> TRAVEL_RECORDS
BLOOD_UNIT ──(1:1)──> LABORATORY_TESTS
HOSPITAL ──(1:M)──> REQUEST
REQUEST ──(1:1)──> BLOOD_UNIT
```

---

## 🛠️ Technologies Used

- **Database:** Oracle SQL (Oracle 19c)
- **Language:** SQL — DDL, DML, DQL
- **Design Tools:** ERD Diagram, Relational Schema

---

## 📁 Project Structure

```
Blood-Bank-DB/
│
├── README.md
├── blood_bank_schema.sql       # Full DDL — table creation with constraints
├── blood_bank_data.sql         # DML — insert, update, delete operations
├── blood_bank_queries.sql      # SELECT queries — reports and analysis
├── ERD.png                     # Entity Relationship Diagram
└── Schema.png                  # Relational Schema Diagram
```

---

## ⚙️ Key Features

### ✅ Data Integrity
- Primary keys, foreign keys, and unique constraints across all tables
- CHECK constraints enforcing valid blood groups, component types, and statuses

### 🔬 Lab Safety Screening
Each blood unit undergoes testing for:
`HIV` · `Hepatitis B` · `Hepatitis C` · `Syphilis` · `Malaria` · `West Nile Virus` · `HTLV`

### 📊 Reporting Queries
- Blood unit inventory with remaining shelf life
- Donor-to-unit traceability report
- Hospital request fulfillment status
- Blood group availability summary

---

## 🚀 How to Run

1. Connect to Oracle SQL as `sysdba`
2. Create and configure the project user:
```sql
CREATE USER Blood_Bank_DB IDENTIFIED BY 123;
GRANT CONNECT, RESOURCE, DBA TO Blood_Bank_DB;
ALTER USER Blood_Bank_DB QUOTA 50M ON SYSTEM;
```
3. Run `blood_bank_schema.sql` to create all tables
4. Run `blood_bank_data.sql` to insert sample data
5. Run `blood_bank_queries.sql` to explore reports

---

## 👩‍💻 Authors

**Basmala Fatooh** · **Donia Algharabli**
Department of Data Science and Artificial Intelligence
University College of Applied Sciences (UCAS) — Gaza

---

## 📚 Course

**Introduction to Databases** — Academic Project

---

*"From donor to recipient — every drop counts."* 🩸
