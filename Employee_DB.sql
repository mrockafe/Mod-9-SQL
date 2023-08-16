-- Create Tables Pt. 1 Data Engineering

--Create table 1 Depatments
CREATE TABLE departments (
    dept_no VARCHAR(4) PRIMARY KEY,
    dept_name VARCHAR(255) NOT NULL
);

--Create table 2 Employee Departments
CREATE TABLE employee_departments (
    emp_no INT PRIMARY KEY,
    dept_no VARCHAR(4) REFERENCES departments(dept_no)
);

--Create table 3 Employees
CREATE TABLE employees (
    emp_no INT PRIMARY KEY,
    emp_title_id VARCHAR(6),
    birth_date DATE,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    sex CHAR(1),
    hire_date DATE
);

--Create Table 4 depatment managers
CREATE TABLE department_managers (
    dept_no VARCHAR(4),
    emp_no INT,
    PRIMARY KEY (dept_no, emp_no),
    FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

--Create table 5 Salaries
CREATE TABLE salaries (
    emp_no INT PRIMARY KEY,
    salary INT
);

--Create table 6 Titles
CREATE TABLE titles (
    title_id VARCHAR(6) PRIMARY KEY,
    title VARCHAR(255)
);

--Import csv data into tables

COPY departments FROM 'data/departments.csv' WITH CSV HEADER;
COPY employee_departments FROM 'data/dept_emp.csv' WITH CSV HEADER;
COPY employees FROM 'data/employees.csv' WITH CSV HEADER;
COPY department_managers FROM 'data/dept_manager.csv' WITH CSV HEADER;
COPY salaries FROM 'data/salaries.csv' WITH CSV HEADER;
COPY titles FROM 'data/titles.csv' WITH CSV HEADER;


--Check Tables
select * from department_managers
select * from employee_departments
select * from departments
select * from employees
select * from salaries
select * from titles

--Data Analysis 1

SELECT
    e.emp_no,
    e.last_name,
    e.first_name,
    e.sex,
    s.salary
FROM
    employees AS e
JOIN
    salaries AS s ON e.emp_no = s.emp_no;
	
--Data Analysis 2	
	
SELECT
    first_name,
    last_name,
    hire_date
FROM
    employees
WHERE
    EXTRACT(YEAR FROM hire_date) = 1986;
	
--Data Analysis 3	
	
SELECT
    dm.dept_no,
    d.dept_name,
    dm.emp_no AS manager_emp_no,
    e.last_name AS manager_last_name,
    e.first_name AS manager_first_name
FROM
    department_managers AS dm
JOIN
    departments AS d ON dm.dept_no = d.dept_no
JOIN
    employees AS e ON dm.emp_no = e.emp_no;
	
--Data Analysis	4
	
SELECT
    ed.dept_no,
    e.emp_no,
    e.last_name,
    e.first_name,
    d.dept_name
FROM
    employee_departments AS ed
JOIN
    employees AS e ON ed.emp_no = e.emp_no
JOIN
    departments AS d ON ed.dept_no = d.dept_no;
	
--Data Analysis 5

SELECT
    first_name,
    last_name,
    sex
FROM
    employees
WHERE
    first_name = 'Hercules'
    AND last_name LIKE 'B%';
	
--Data Analysis 6

SELECT
    e.emp_no,
    e.last_name,
    e.first_name
FROM
    employees AS e
JOIN
    employee_departments AS ed ON e.emp_no = ed.emp_no
JOIN
    departments AS d ON ed.dept_no = d.dept_no
WHERE
    d.dept_name = 'Sales';
	
--Data Analysis 7

SELECT
    e.emp_no,
    e.last_name,
    e.first_name,
    d.dept_name
FROM
    employees AS e
JOIN
    employee_departments AS ed ON e.emp_no = ed.emp_no
JOIN
    departments AS d ON ed.dept_no = d.dept_no
WHERE
    d.dept_name IN ('Sales', 'Development');
	
--Data Analysis 8

SELECT
    last_name,
    COUNT(*) AS name_count
FROM
    employees
GROUP BY
    last_name
ORDER BY
    name_count DESC;