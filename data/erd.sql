-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/UfPMu9
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "Departments" (
    "dept_id" Varchar(4)   NOT NULL,
    "dept_name" Varchar(30)   NOT NULL,
    CONSTRAINT "pk_Departments" PRIMARY KEY (
        "dept_id"
     )
);

CREATE TABLE "Department_Employees" (
    "emp_id" int   NOT NULL,
    "dept_id" Varchar   NOT NULL
);

CREATE TABLE "Department_Manager" (
    "dept_id" Varchar   NOT NULL,
    "emp_id" int   NOT NULL
);

CREATE TABLE "Employees" (
    "emp_id" int   NOT NULL,
    "emp_title_id" varchar   NOT NULL,
    "birthdate" date   NOT NULL,
    "first_name" varchar(25)   NOT NULL,
    "last_name" varchar(25)   NOT NULL,
    "sex" Char(2)   NOT NULL,
    "hire_date" date   NOT NULL,
    CONSTRAINT "pk_Employees" PRIMARY KEY (
        "emp_id"
     )
);

CREATE TABLE "Salary" (
    "emp_id" int   NOT NULL,
    "salary" Int   NOT NULL
);

CREATE TABLE "Job_title" (
    "emp_title_id" Varchar   NOT NULL,
    "title" Varchar(20)   NOT NULL,
    CONSTRAINT "pk_Job_title" PRIMARY KEY (
        "emp_title_id"
     )
);

ALTER TABLE "Department_Employees" ADD CONSTRAINT "fk_Department_Employees_emp_id" FOREIGN KEY("emp_id")
REFERENCES "Employees" ("emp_id");

ALTER TABLE "Department_Employees" ADD CONSTRAINT "fk_Department_Employees_dept_id" FOREIGN KEY("dept_id")
REFERENCES "Departments" ("dept_id");

ALTER TABLE "Department_Manager" ADD CONSTRAINT "fk_Department_Manager_dept_id" FOREIGN KEY("dept_id")
REFERENCES "Departments" ("dept_id");

ALTER TABLE "Department_Manager" ADD CONSTRAINT "fk_Department_Manager_emp_id" FOREIGN KEY("emp_id")
REFERENCES "Employees" ("emp_id");

ALTER TABLE "Employees" ADD CONSTRAINT "fk_Employees_emp_title_id" FOREIGN KEY("emp_title_id")
REFERENCES "Job_title" ("emp_title_id");

ALTER TABLE "Salary" ADD CONSTRAINT "fk_Salary_emp_id" FOREIGN KEY("emp_id")
REFERENCES "Employees" ("emp_id");

