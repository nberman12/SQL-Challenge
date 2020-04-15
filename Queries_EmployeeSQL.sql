--List details of all employees: ID, first & last name, gender & salary--
SELECT employees.emp_no,
	employees.first_name,
	employees.last_name,
	employees.gender,
	salaries.salary 
from employees 
INNER JOIN salaries
ON employees.emp_no =salaries.emp_no;

--List all employees hired in 1986--
SELECT emp_no,
	first_name,
	last_name,
	hire_date,
	EXTRACT (YEAR from hire_date) as YEAR
FROM employees
WHERE hire_date < '1/1/1987' and hire_date >'12/31/1985';

--List the manager of each department with the following information: department number, department name, 
--the manager's employee number, last name, first name, and start and end employment dates
SELECT dept_mgr.dept_no,
	departments.dept_name,
	dept_mgr.emp_no,
	employees.last_name,
	employees.first_name,
	dept_mgr.from_date,
	dept_mgr.to_date
from dept_mgr
INNER JOIN departments
ON departments.dept_no = dept_mgr.dept_no
INNER JOIN employees
ON employees.emp_no = dept_mgr.emp_no;

--List the department of each employee with the following information: 
--employee number, last name, first name, and department name.

SELECT employees.emp_no,
	employees.first_name,
	employees.last_name,
	departments.dept_name
from employees
INNER JOIN dept_emp
ON employees.emp_no =dept_emp.emp_no
INNER JOIN departments
ON departments.dept_no = dept_emp.dept_no;

--List all employees whose first name is "Hercules" and last names begin with "B."--
SELECT employees.first_name,
	employees.last_name
FROM employees 
WHERE first_name='Hercules'
AND last_name LIKE 'B%';

--List all employees in the Sales department, 
--including their employee number, last name, first name, and department name.
SELECT employees.emp_no,
	employees.first_name,
	employees.last_name,
	departments.dept_name
FROM employees
INNER JOIN dept_emp
ON employees.emp_no = dept_emp.emp_no
INNER JOIN departments
ON departments.dept_no=dept_emp.dept_no
WHERE departments.dept_name='Sales';

--List all employees in the Sales and Development departments, 
--including their employee number, last name, first name, and department name.
SELECT employees.emp_no, 
	employees.first_name,
	employees.last_name,
	departments.dept_name	
FROM employees
INNER JOIN dept_emp
ON employees.emp_no = dept_emp.emp_no
INNER JOIN departments
ON departments.dept_no=dept_emp.dept_no
WHERE departments.dept_name='Sales'
OR departments.dept_name='Development';

--In descending order, list the frequency count of employee last names, 
--i.e., how many employees share each last name.
select last_name, count (last_name) as name_cnt
from employees
group by last_name
order by name_cnt desc;
