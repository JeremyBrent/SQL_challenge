-- CREATING TABLES

CREATE TABLE Job_title (
    emp_title_id Varchar NOT NULL,
    title Varchar(20) NOT NULL,
    PRIMARY KEY (emp_title_id)
);

CREATE TABLE Employees (
    emp_id int NOT NULL,
    emp_title_id varchar NOT NULL,
    birthdate VARCHAR NOT NULL,
    first_name varchar(25) NOT NULL,
    last_name varchar(25) NOT NULL,
    sex Char(2) NOT NULL,
    hire_date VARCHAR NOT NULL,
    PRIMARY KEY (emp_id),
	FOREIGN KEY(emp_title_id) REFERENCES Job_title (emp_title_id)
);

CREATE TABLE Departments (
    dept_id Varchar(4) NOT NULL,
    dept_name Varchar(30) NOT NULL,
    PRIMARY KEY (dept_id)
);

CREATE TABLE Department_Employees (
    emp_id int NOT NULL,
    dept_id Varchar NOT NULL,
	FOREIGN KEY(emp_id) REFERENCES Employees(emp_id),
	FOREIGN KEY(dept_id) REFERENCES Departments (dept_id)
);

CREATE TABLE Department_Manager (
    dept_id Varchar NOT NULL,
    emp_id int NOT NULL,
	FOREIGN KEY(dept_id) REFERENCES Departments (dept_id),
	FOREIGN KEY(emp_id) REFERENCES Employees (emp_id)
);

CREATE TABLE Salary (
    emp_id int NOT NULL,
    salary Int NOT NULL,
	FOREIGN KEY(emp_id) REFERENCES Employees (emp_id)
);

-- 1. List the following details of each employee: 
-- employee number, last name, first name, sex, and salary.

SELECT e.emp_id, last_name, first_name, sex, s.salary 
FROM employees as e
INNER JOIN salary as s ON
e.emp_id = s.emp_id;

-- 2. List first name, last name, and hire date 
-- for employees who were hired in 1986.

SELECT first_name, last_name, hire_date
FROM employees 
WHERE hire_date like '%86';
