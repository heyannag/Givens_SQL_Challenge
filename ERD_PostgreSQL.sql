-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/1jXLRj
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "employees" (
    "emp_no" int   NOT NULL,
    "birth_date" varchar(10)   NOT NULL,
    "first_name" txt   NOT NULL,
    "last_name" txt   NOT NULL,
    "gender" varchar(1)   NOT NULL,
    "hire_date" varchar(10)   NOT NULL,
    CONSTRAINT "pk_employees" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "departments" (
    "dept_no" varchar(5)   NOT NULL,
    "dept_name" varchar   NOT NULL
);

CREATE TABLE "titles" (
    "emp_no" int   NOT NULL,
    "title" varchar(30)   NOT NULL,
    "from_date" varchar(10)   NOT NULL,
    "to_date" varchar(10)   NOT NULL,
    CONSTRAINT "pk_titles" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "salaries" (
    "emp_no" int   NOT NULL,
    "salary" varchar(30)   NOT NULL,
    "from_date" varchar(10)   NOT NULL,
    "to_date" varchar(10)   NOT NULL,
    CONSTRAINT "pk_salaries" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "dept_manager" (
    "dept_no" varchar(5)   NOT NULL,
    "emp_no" int   NOT NULL,
    "from_date" varchar(10)   NOT NULL,
    "to_date" varchar(10)   NOT NULL,
    CONSTRAINT "pk_dept_manager" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "dept_emp" (
    "emp_no" int   NOT NULL,
    "dept_no" varchar(5)   NOT NULL,
    "from_date" varchar(10)   NOT NULL,
    "to_date" varchar(10)   NOT NULL,
    CONSTRAINT "pk_dept_emp" PRIMARY KEY (
        "emp_no"
     )
);

ALTER TABLE "employees" ADD CONSTRAINT "fk_employees_emp_no" FOREIGN KEY("emp_no")
REFERENCES "dept_manager" ("emp_no");

ALTER TABLE "departments" ADD CONSTRAINT "fk_departments_dept_no" FOREIGN KEY("dept_no")
REFERENCES "dept_emp" ("dept_no");

