// FOR CREATING TABLE //

CREATE DATABASE hospital_demo;
USE hospital_demo;

CREATE TABLE department (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50) UNIQUE NOT NULL
);

CREATE TABLE doctor (
    doctor_id INT PRIMARY KEY,
    doctor_name VARCHAR(50) NOT NULL,
    email VARCHAR(50) UNIQUE,
    phone_no VARCHAR(15) UNIQUE,
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES department(dept_id)
);

CREATE TABLE patient (
    patient_id INT PRIMARY KEY,
    patient_name VARCHAR(50) NOT NULL,
    age INT,
    gender CHAR(1),
    phone_no VARCHAR(15) UNIQUE
);

CREATE TABLE appointment (
    appointment_id INT PRIMARY KEY,
    patient_id INT,
    doctor_id INT,
    appointment_date DATE,
    status VARCHAR(20),
    FOREIGN KEY (patient_id) REFERENCES patient(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES doctor(doctor_id)
);

CREATE TABLE bill (
    bill_id INT PRIMARY KEY,
    appointment_id INT,
    amount DECIMAL(10,2),
    payment_status VARCHAR(20),
    FOREIGN KEY (appointment_id) REFERENCES appointment(appointment_id)
);

// FOR ADDING ELEMENTS INTO THE TABLE //

INSERT INTO department VALUES
(1, 'Cardiology'),
(2, 'Orthopedic'),
(3, 'General Medicine');

INSERT INTO doctor VALUES
(301, 'Dr. Kapoor', 'kapoor@hospital.com', '9123456780', 1),
(302, 'Dr. Verma', 'verma@hospital.com', '9123456781', 2),
(303, 'Dr. Iyer', 'iyer@hospital.com', '9123456782', 3);

INSERT INTO patient VALUES
(401, 'Ankit Singh', 32, 'M', '9988776655'),
(402, 'Priya Nair', 28, 'F', '9988776656');

INSERT INTO appointment VALUES
(501, 401, 301, '2026-08-15', 'Completed'),
(502, 402, 302, '2026-08-18', 'Scheduled');

INSERT INTO bill VALUES
(601, 501, 1500.00, 'Paid'),
(602, 502, 2000.00, 'Pending');

// FOR SHOWING THE CREATED TABLE OUTPUTS //

SHOW TABLES;
SELECT * FROM department;
SELECT * FROM doctor;
SELECT * FROM patient;
SELECT * FROM appointment;
SELECT * FROM bill;
