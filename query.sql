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

-- 3. List the manager of each department with the 
-- following information: department number, 
-- department name, the manager's employee number, 
-- last name, first name.

SELECT dm.dept_id, d.dept_name, dm.emp_id as manager_emp_id, e.first_name as manager_first_name, e.last_name as manager_last_name
FROM department_manager as dm
INNER JOIN employees as e
ON e.emp_ID = dm.emp_id
INNER JOIN departments as d
ON dm.dept_id = d.dept_id
;

-- 4. List the department of each employee with 
-- the following information: employee number, 
-- last name, first name, and department name.

SELECT e.emp_id, e.first_name, e.last_name, d.dept_name
FROM employees as e
INNER JOIN department_employees as de
ON de.emp_id = e.emp_id
INNER JOIN departments as d
ON d.dept_id = de.dept_id;

-- 5. List first name, last name, and sex for 
-- employees whose first name is "Hercules" and 
-- last names begin with "B."

SELECT first_name, last_name, sex 
FROM employees
WHERE first_name = 'Hercules' and last_name like 'B%';

-- 6. List all employees in the Sales department, 
-- including their employee number, last name, 
-- first name, and department name.

Select e.emp_id, e.first_name, e.last_name, d.dept_name
FROM employees as e
INNER JOIN department_employees as de
ON de.emp_id=e.emp_id
INNER JOIN departments as d
ON d.dept_id = de.dept_id
WHERE d.dept_name = 'Sales';