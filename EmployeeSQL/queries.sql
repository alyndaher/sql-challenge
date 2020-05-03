CREATE TABLE Departments (
    dept_no VARCHAR NOT NULL,
    dept_name VARCHAR NOT NULL,
    CONSTRAINT pk_Departments PRIMARY KEY (dept_no)
);

CREATE TABLE Employees (
    emp_no int NOT NULL,
    emp_title_id VARCHAR NOT NULL,
    birth_date date NOT NULL,
    first_name VARCHAR  NOT NULL,
    last_name VARCHAR NOT NULL,
    sex VARCHAR NOT NULL,
    hire_date date NOT NULL,
    CONSTRAINT pk_Employees PRIMARY KEY (emp_no)
);

CREATE TABLE Salaries (
    emp_no int NOT NULL,
    salary int NOT NULL
);

CREATE TABLE Dept_Manager (
    dept_no VARCHAR NOT NULL,
	emp_no int NOT NULL,
    CONSTRAINT pk_Dept_Manager PRIMARY KEY (emp_no)
);

CREATE TABLE Titles (
    title_id VARCHAR NOT NULL,
    title VARCHAR NOT NULL,
	CONSTRAINT pk_Titles PRIMARY KEY (title_id)
);


CREATE TABLE Dept_Employee (
    emp_no int NOT NULL,
    dept_no VARCHAR NOT NULL
);

ALTER TABLE Employees ADD CONSTRAINT fk_Employees_emp_title_id FOREIGN KEY(emp_title_id)
REFERENCES Titles (title_id);

ALTER TABLE Salaries ADD CONSTRAINT fk_Salaries_emp_no FOREIGN KEY(emp_no)
REFERENCES Employees (emp_no);

ALTER TABLE Dept_Manager ADD CONSTRAINT fk_Dept_Manager_dept_no FOREIGN KEY(dept_no)
REFERENCES Departments (dept_no);

ALTER TABLE Dept_Employee ADD CONSTRAINT fk_Dept_Employee_emp_no FOREIGN KEY(emp_no)
REFERENCES Employees (emp_no);

ALTER TABLE Dept_Employee ADD CONSTRAINT fk_Dept_Employee_dept_no FOREIGN KEY(dept_no)
REFERENCES Departments (dept_no);

--List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT Employees.emp_no, 
Employees.last_name, 
Employees.first_name,
Employees.sex,
Salaries.salary
FROM Employees
INNER JOIN Salaries ON
Employees.emp_no = Salaries.emp_no;

--List first name, last name, and hire date for employees who were hired in 1986.
SELECT first_name,
last_name, hire_date
FROM Employees
WHERE hire_date > '1986-01-01'
AND hire_date<'1986-12-01';

--List the manager of each department with the following information: department number, 
-- department name, the manager's employee number, last name, first name.
SELECT d.dept_no,
d.dept_name,
m.emp_no,
e.last_name,
e.first_name
FROM Departments As d
JOIN Dept_Manager As m ON d.dept_no = m.dept_no
JOIN Employees As e ON e.emp_no = m.emp_no

--List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT e.emp_no,
e.last_name,
e.first_name,
d.dept_name
FROM Employees as e
JOIN Dept_Employee as n ON e.emp_no = n.emp_no
JOIN Departments as d ON d.dept_no = n.dept_no

--List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT first_name,
last_name
FROM Employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%'

--List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT d.dept_name,
e.emp_no,
e.last_name,
e.first_name
FROM Departments as d
JOIN Dept_Employee as n on d.dept_no = n.dept_no
JOIN Employees as e on n.emp_no = e.emp_no
WHERE d.dept_name = 'Sales'

--List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT d.dept_name,
e.emp_no,
e.last_name,
e.first_name
FROM Departments as d
JOIN Dept_Employee as n on d.dept_no = n.dept_no
JOIN Employees as e on n.emp_no = e.emp_no
WHERE d.dept_name = 'Sales'
OR d.dept_name = 'Development'

--In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name, COUNT(last_name) as "Frequency count"
FROM Employees
GROUP BY last_name
ORDER BY "Frequency count" DESC;