-- ============================================
-- Q1: SnowSQL Login and Connection
-- ============================================

SELECT
    CURRENT_USER(),
    CURRENT_ROLE(),
    CURRENT_WAREHOUSE(),
    CURRENT_DATABASE(),
    CURRENT_SCHEMA();


-- ============================================
-- Q2: Creation of Snowflake Objects
-- ============================================

-- Create Database
CREATE DATABASE SNOWFLAKE_ASSIGNMENT;

-- Use Database
USE DATABASE SNOWFLAKE_ASSIGNMENT;

-- Create Schema
CREATE SCHEMA TUTORIAL;

-- Use Schema
USE SCHEMA TUTORIAL;

-- Create Warehouse
CREATE WAREHOUSE ASSIGNMENT_WH
WITH
    WAREHOUSE_SIZE = 'X-SMALL'
    AUTO_SUSPEND = 60
    AUTO_RESUME = TRUE;

-- Create Table
CREATE TABLE STUDENT_DATA (
    STUDENT_ID INTEGER,
    NAME VARCHAR(50),
    DEPARTMENT VARCHAR(50),
    MARKS INTEGER
);

-- Insert Sample Records
INSERT INTO STUDENT_DATA VALUES
(101, 'Arun', 'CSE', 85),
(102, 'Priya', 'CSE', 92),
(103, 'Rahul', 'ECE', 78),
(104, 'Divya', 'IT', 88),
(105, 'Karan', 'CSE', 95);

-- Display Records
SELECT * FROM STUDENT_DATA;

-- INSERT operation
INSERT INTO STUDENT_DATA VALUES
(106, 'Meena', 'IT', 90);

-- UPDATE operation
UPDATE STUDENT_DATA
SET MARKS = 94
WHERE STUDENT_ID = 106;

-- DELETE operation
DELETE FROM STUDENT_DATA
WHERE STUDENT_ID = 106;

-- Create Stage
CREATE STAGE STUDENT_STAGE;

-- ============================================
-- Q3: Data Loading Using SnowSQL
-- ============================================

-- Create table for loading CSV data
CREATE TABLE STUDENT_LOAD (
    STUDENT_ID INTEGER,
    NAME VARCHAR(50),
    DEPARTMENT VARCHAR(50),
    MARKS INTEGER
);

-- Upload CSV file to Snowflake Stage
PUT 'file://C:/Users/daksh/Downloads/Snowflake/student_dataset.csv'
@STUDENT_STAGE;

-- Load data from Stage into the table
COPY INTO STUDENT_LOAD
FROM @STUDENT_STAGE
FILE_FORMAT = (
    TYPE = CSV
    FIELD_OPTIONALLY_ENCLOSED_BY = '"'
    SKIP_HEADER = 1
);

-- Verify loaded data
SELECT * FROM STUDENT_LOAD;

-- ============================================
-- Q4: Snowflake Time Travel
-- ============================================

-- Create Time Travel demonstration table
CREATE TABLE TIME_TRAVEL_DEMO (
    ID INTEGER,
    NAME VARCHAR(50),
    MARKS INTEGER
);

-- Insert initial records
INSERT INTO TIME_TRAVEL_DEMO VALUES
(1, 'Asha', 85),
(2, 'Bala', 90),
(3, 'Chitra', 88),
(4, 'Dinesh', 92),
(5, 'Esha', 95);

-- Display original records
SELECT * FROM TIME_TRAVEL_DEMO;

-- Update a record
UPDATE TIME_TRAVEL_DEMO
SET MARKS = 99
WHERE ID = 1;

-- Delete a record
DELETE FROM TIME_TRAVEL_DEMO
WHERE ID = 2;

-- Display current table after UPDATE and DELETE
SELECT * FROM TIME_TRAVEL_DEMO;

-- Use Time Travel to view the table before the UPDATE
SELECT *
FROM TIME_TRAVEL_DEMO
BEFORE (STATEMENT => '01c71601-3203-5f1f-0000-001846cac22d');


-- ============================================
-- Q5: Data Recovery Using Time Travel
-- ============================================

-- Create recovery demonstration table
CREATE TABLE RECOVERY_DEMO (
    ID INTEGER,
    NAME VARCHAR(50),
    DEPARTMENT VARCHAR(50)
);

-- Insert original records
INSERT INTO RECOVERY_DEMO VALUES
(1, 'Arun', 'CSE'),
(2, 'Priya', 'IT'),
(3, 'Rahul', 'ECE'),
(4, 'Divya', 'CSE'),
(5, 'Kiran', 'IT');

-- Display original records
SELECT * FROM RECOVERY_DEMO;

-- Simulate accidental deletion
DELETE FROM RECOVERY_DEMO
WHERE ID IN (2, 3);

-- Identify deleted records using Time Travel
SELECT *
FROM RECOVERY_DEMO
BEFORE (STATEMENT => '01c71607-3203-5f1f-0000-001846cac25d')
WHERE ID IN (2, 3);

-- Recover the deleted records
INSERT INTO RECOVERY_DEMO
SELECT *
FROM RECOVERY_DEMO
BEFORE (STATEMENT => '01c71607-3203-5f1f-0000-001846cac25d')
WHERE ID IN (2, 3);

-- Verify recovered records
SELECT * FROM RECOVERY_DEMO
ORDER BY ID;