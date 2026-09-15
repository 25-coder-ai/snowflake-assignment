# Snowflake Tutorial Assignment

This repository contains the practical work completed as part of the Snowflake Tutorial Assignment.

The assignment covers working with **SnowSQL, Snowflake objects, data loading, Time Travel, and data recovery**.

---

## Practical Work

### 01 — SnowSQL Login and Connection

Connected to the Snowflake account using **SnowSQL** and verified the active:

* User
* Role
* Warehouse
* Database
* Schema

**Evidence:**
[View Q1 Screenshot](screenshots/q1_connection.png)

---

### 02 — Creating Snowflake Objects

Created and worked with the following Snowflake objects:

* **Database:** `SNOWFLAKE_ASSIGNMENT`
* **Schema:** `TUTORIAL`
* **Warehouse:** `ASSIGNMENT_WH`
* **Table:** `STUDENT_DATA`
* **Stage:** `STUDENT_STAGE`

Basic SQL operations were also performed on the student table:

**INSERT → UPDATE → DELETE → SELECT**

**Evidence:**

* [Object Creation](screenshots/q2_objects.png)
* [CRUD Operations](screenshots/q2_crud.png)

---

### 03 — Loading Data Using SnowSQL

A sample student dataset was created in CSV format and uploaded to the Snowflake stage using the **PUT** command.

The data was then loaded into the `STUDENT_LOAD` table using **COPY INTO** and verified using a `SELECT` query.

**Data File:**
[data.csv](data.csv)

**Evidence:**
[View Q3 Screenshot](screenshots/q3_loading.png)

---

### 04 — Snowflake Time Travel

Time Travel was used to view the earlier state of a table after performing data modifications.

The practical involved:

1. Creating a table with sample student records.
2. Updating a student's marks.
3. Deleting a record.
4. Using **statement-based Time Travel** to view the table before the update.

This demonstrated how Snowflake can access an earlier version of table data.

**Evidence:**
[View Q4 Screenshot](screenshots/q4_time_travel.png)

---

### 05 — Data Recovery Using Time Travel

Time Travel was also used for data recovery.

Two records were intentionally deleted to simulate an accidental deletion. The earlier table state was then accessed using Time Travel, the deleted records were identified, and they were inserted back into the table.

The final verification showed that **all five records were successfully restored**.

**Evidence:**
[View Q5 Screenshot](screenshots/q5_recovery.png)

---

## Key Concepts Practiced

Through this assignment, the following Snowflake concepts were practiced:

* **SnowSQL** connection and commands
* **Databases and Schemas**
* **Virtual Warehouses**
* **Tables and Stages**
* **CRUD operations**
* **PUT and COPY INTO**
* **CSV data loading**
* **Snowflake Time Travel**
* **Statement-based Time Travel**
* **Data recovery**

---

## Repository Contents

| File / Folder   | Description                                   |
| --------------- | --------------------------------------------- |
| `solutions.sql` | SQL commands used for the assignment          |
| `data.csv`      | Sample dataset used for data loading          |
| `screenshots/`  | Screenshots showing the execution and results |
| `README.md`     | Assignment overview and documentation         |

---

## Conclusion

This assignment provided hands-on practice with Snowflake and SnowSQL, from creating and managing database objects to loading data and using **Time Travel for data recovery**.
