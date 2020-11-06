--List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT employees.empt_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
FROM employees
JOIN salaries
ON employees.empt_no = salaries.emp_no;

--List first name, last name, and hire date for employees who were hired in 1986
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

--In descending order, list the frequency count of employee last names, i.e., how many 
--employees share each last name.
SELECT last_name,
COUNT(last_name) AS "frequency"
FROM employees
GROUP BY last_name
ORDER BY
COUNT(last_name) DESC;
