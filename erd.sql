Departments as d 
-
dept_id Varchar(4) PK  
dept_name Varchar(30)

Department_Employees
-
emp_id int fk >- e.emp_id
dept_id Varchar fk >- d.dept_id

Department_Manager
-
dept_id Varchar fk >- d.dept_id
emp_id int fk 0- e.emp_id

Employees as e 
-
emp_id int PK 
emp_title_id varchar FK >- jt.emp_title_id
birthdate date 
first_name varchar(25)
last_name varchar(25)
sex Char(2) 
hire_date date 

Salary
- 
emp_id int fk - e.emp_id
salary Int

Job_title as jt
-
emp_title_id Varchar PK
title Varchar(20)