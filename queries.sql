-- 1. List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT 
		e.emp_no as "Employee No",e.last_name as "Last Name",
		e.first_name as "First Name",e.gender as "Gender",s.salary as "Salary" 
FROM 
		"Employee" e, "Salary" s
WHERE 
		e.emp_no=s.emp_no
ORDER BY 
		"Employee No" ASC;

-- 2. List first name, last name, and hire date for employees who were hired in 1986.
SELECT 
		first_name as "First Name",last_name as "Last Name",hire_date as "Hire Date"
FROM 
		"Employee" 
WHERE 
		EXTRACT(YEAR FROM DATE (to_date(hire_date, 'YYYY-MM-DD'))) =1986
ORDER BY 
		emp_no ASC;

-- 3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
SELECT 
		m.dept_no as "Department No",d.dept_name as "Department Name",m.emp_no as "Employee No (Manager)",
		e.last_name as "Last Name",e.first_name as "First Name"
FROM 
		"DeptManager" as m, "Departments" as d, "Employee" as e
WHERE 
		m.dept_no=d.dept_no AND
		m.emp_no = e.emp_no;

-- 4. List the department of each employee with the following information: employee number, last name, first name, and department name.
--Note: Result shows one employee has more than one department
SELECT 
		e.emp_no as "Employee No",e.last_name as "Last Name",e.first_name as "First Name",
		d.dept_name as "Department Name"
FROM
		"DeptEmployee" as t, "Departments" as d, "Employee" as e
WHERE
		t.dept_no=d.dept_no AND
		t.emp_no = e.emp_no;
	
-- 5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT 
		first_name as "First Name",last_name as "Last Name",gender as "Gender" from "Employee"
WHERE 
		first_name = 'Hercules' AND 
		last_name LIKE 'B%';

-- 6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT
		e.emp_no as "Employee No",e.last_name as "Last Name",
		e.first_name as "First Name",d.dept_name as "Department Name" 
FROM
		"Departments" d,"DeptEmployee" t, "Employee" e
WHERE
		d.dept_name = 'Sales' AND
		d.dept_no=t.dept_no AND
		t.emp_no = e.emp_no;

-- 7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT 
		e.emp_no as "Employee No",e.last_name as "Last Name",
		e.first_name as "First Name",d.dept_name as "Department Name" 
FROM 
		"Departments" d,"DeptEmployee" t, "Employee" e
WHERE 
		d.dept_name in ('Sales','Development') AND
		d.dept_no=t.dept_no AND
		t.emp_no = e.emp_no;

-- 8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT 
	last_name as "Last Name", count(*) as "Count" 
FROM 
	"Employee"
GROUP by 
	last_name;

