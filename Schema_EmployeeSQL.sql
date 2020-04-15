--DROP ANY PRE-EXISTING TABLES--
DROP TABLE departments;
DROP TABLE dept_emp;
DROP TABLE dept_mgr;
DROP TABLE employees;
DROP TABLE salaries;
DROP TABLE titles;

--CREATE TABLES FOR DB--
CREATE TABLE employees (
	emp_no INT,
	birth_date DATE NOT NULL,
	first_name VARCHAR(250) NOT NULL,
	last_name VARCHAR(250) NOT NULL,
	gender VARCHAR(250) NOT NULL,
	hire_date DATE NOT NULL,
	PRIMARY KEY (emp_no));
	
CREATE TABLE departments(
	dept_no VARCHAR(250) NOT NULL,
	dept_name VARCHAR(250) NOT NULL,
	PRIMARY KEY(dept_no));

CREATE TABLE dept_emp (
	emp_no INT NOT NULL,
	dept_no VARCHAR(250) NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no) );

CREATE TABLE dept_mgr (
	dept_no VARCHAR(250) NOT NULL,
	emp_no INT NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no));
	
CREATE TABLE salaries (
	emp_no INT NOT NULL,
	salary INT NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no));

CREATE TABLE titles (
	emp_no INT NOT NULL,
	title VARCHAR(250) NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no));
	
	
--IMPORT DATA--
COPY departments FROM 'C:\temp-data\employeesql\departments.csv' DELIMITER ',' CSV HEADER;
COPY employees FROM 'C:\temp-data\employeesql\employees.csv' DELIMITER ',' CSV HEADER;
COPY dept_mgr FROM 'C:\temp-data\employeesql\dept_manager.csv' DELIMITER ',' CSV HEADER;
COPY dept_emp FROM 'C:\temp-data\employeesql\dept_emp.csv' DELIMITER ',' CSV HEADER;
COPY salaries FROM 'C:\temp-data\employeesql\salaries.csv' DELIMITER ',' CSV HEADER;
COPY titles FROM 'C:\temp-data\employeesql\titles.csv' DELIMITER ',' CSV HEADER;
