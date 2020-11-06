-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/1ufr9d
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- Generating tables for sql-challenge homework

CREATE TABLE "departments" (
    "dept_no" VARCHAR   NOT NULL,
    "dept_name" VARCHAR   NOT NULL,
    CONSTRAINT "pk_departments" PRIMARY KEY (
        "dept_no"
     )
);

CREATE TABLE "employees" (
    "empt_no" INT   NOT NULL,
    "title_id" VARCHAR   NOT NULL,
    "birth_date" VARCHAR   NOT NULL,
    "first_name" VARCHAR   NOT NULL,
    "last_name" VARCHAR   NOT NULL,
    "sex" VARCHAR   NOT NULL,
    "hire_date" VARCHAR   NOT NULL,
    CONSTRAINT "pk_employees" PRIMARY KEY (
        "empt_no"
     )
);

CREATE TABLE "dept_emp" (
    "empt_no" INT   NOT NULL,
    "dept_no" VARCHAR   NOT NULL,
    CONSTRAINT "pk_dept_emp" PRIMARY KEY (
        "empt_no","dept_no"
     )
);

CREATE TABLE "dept_manager" (
    "dept_no" VARCHAR   NOT NULL,
    "empt_no" INT   NOT NULL,
    CONSTRAINT "pk_dept_manager" PRIMARY KEY (
        "empt_no"
     )
);

CREATE TABLE "salaries" (
    "emp_no" INT   NOT NULL,
    "salary" INT   NOT NULL,
    CONSTRAINT "pk_salaries" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "titles" (
    "title_id" VARCHAR   NOT NULL,
    "title" VARCHAR   NOT NULL,
    CONSTRAINT "pk_titles" PRIMARY KEY (
        "title_id"
     )
);

ALTER TABLE "employees" ADD CONSTRAINT "fk_employees_title_id" FOREIGN KEY("title_id")
REFERENCES "titles" ("title_id");

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_empt_no" FOREIGN KEY("empt_no")
REFERENCES "employees" ("empt_no");

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_empt_no" FOREIGN KEY("empt_no")
REFERENCES "employees" ("empt_no");

ALTER TABLE "salaries" ADD CONSTRAINT "fk_salaries_emp_no" FOREIGN KEY("emp_no")
REFERENCES -- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/1ufr9d
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- Generating tables for sql-challenge homework

CREATE TABLE "departments" (
    "dept_no" VARCHAR   NOT NULL,
    "dept_name" VARCHAR   NOT NULL,
    CONSTRAINT "pk_departments" PRIMARY KEY (
        "dept_no"
     )
);

CREATE TABLE "employees" (
    "empt_no" INT   NOT NULL,
    "title_id" VARCHAR   NOT NULL,
    "birth_date" VARCHAR   NOT NULL,
    "first_name" VARCHAR   NOT NULL,
    "last_name" VARCHAR   NOT NULL,
    "sex" VARCHAR   NOT NULL,
    "hire_date" VARCHAR   NOT NULL,
    CONSTRAINT "pk_employees" PRIMARY KEY (
        "empt_no"
     )
);

CREATE TABLE "dept_emp" (
    "empt_no" INT   NOT NULL,
    "dept_no" VARCHAR   NOT NULL,
    CONSTRAINT "pk_dept_emp" PRIMARY KEY (
        "empt_no","dept_no"
     )
);

CREATE TABLE "dept_manager" (
    "dept_no" VARCHAR   NOT NULL,
    "empt_no" INT   NOT NULL,
    CONSTRAINT "pk_dept_manager" PRIMARY KEY (
        "empt_no"
     )
);

CREATE TABLE "salaries" (
    "emp_no" INT   NOT NULL,
    "salary" INT   NOT NULL,
    CONSTRAINT "pk_salaries" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "titles" (
    "title_id" VARCHAR   NOT NULL,
    "title" VARCHAR   NOT NULL,
    CONSTRAINT "pk_titles" PRIMARY KEY (
        "title_id"
     )
);

ALTER TABLE "employees" ADD CONSTRAINT "fk_employees_title_id" FOREIGN KEY("title_id")
REFERENCES "titles" ("title_id");

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_empt_no" FOREIGN KEY("empt_no")
REFERENCES "employees" ("empt_no");

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_empt_no" FOREIGN KEY("empt_no")
REFERENCES "employees" ("empt_no");

ALTER TABLE "salaries" ADD CONSTRAINT "fk_salaries_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("empt_no");

SELECT * FROM titles;
SELECT * FROM departments;

DELETE FROM titles
WHERE title = 'title';

DELETE FROM departments
WHERE dept_no = 'dept_no';

SELECT * FROM salaries;
SELECT * FROM employees;

--List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT employees.empt_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
FROM employees
JOIN salaries
ON employees.empt_no = salaries.emp_no;

--List first name, last name, and hire date for employees who were hired in 1986.

ALTER TABLE employees ALTER COLUMN hire_date TYPE DATE 
using to_date(hire_date, 'MM-DD-YYYY');

SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date BETWEEN '1986-1-1' AND '1986-12-31';

--List the manager of each department with the following information: department number, 
--department name, the manager's employee number, last name, first name.
SELECT employees.first_name, employees.last_name, employees.empt_no, dept_manager.dept_no,departments.dept_name
FROM employees
JOIN dept_manager
ON dept_manager.empt_no = employees.empt_no
JOIN departments
ON departments.dept_no = dept_manager.dept_no;

--List the department of each employee with the following information: employee number, 
--last name, first name, and department name.
SELECT employees.empt_no, employees.first_name, employees.last_name, departments.dept_name
FROM employees
JOIN dept_emp
ON dept_emp.empt_no = employees.empt_no
JOIN departments
ON departments.dept_no = dept_emp.dept_no

--List first name, last name, and sex for employees whose first name is "Hercules" 
--and last names begin with "B."
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

--List all employees in the Sales department, including their employee number, 
--last name, first name, and department name.
SELECT employees.first_name, employees.last_name, dept_emp.empt_no, departments.dept_name
FROM employees
JOIN dept_emp
ON dept_emp.empt_no = employees.empt_no
JOIN departments
ON departments.dept_no = dept_emp.dept_no
WHERE departments.dept_name = 'Sales';

--List all employees in the Sales and Development departments, including their 
--employee number, last name, first name, and department name.
SELECT employees.first_name, employees.last_name, dept_emp.empt_no, departments.dept_name
FROM employees
JOIN dept_emp
ON dept_emp.empt_no = employees.empt_no
JOIN departments
ON departments.dept_no = dept_emp.dept_no
WHERE departments.dept_name = 'Sales' OR departments.dept_name = 'Development';

