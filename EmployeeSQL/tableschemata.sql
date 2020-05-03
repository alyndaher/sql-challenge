Departments
-
dept_no VARCHAR PK
dept_name VARCHAR

Employees
-
emp_no int PK
emp_title_id VARCHAR FK - Titles.title_id
birth_date date
first_name VARCHAR
last_name VARCHAR
sex VARCHAR
hire_date date

Salaries
-
emp_no int FK - Employees.emp_no
salary int

Dept_Manager
-
dept_no VARCHAR FK >- Departments.dept_no
emp_no int PK

Titles
-
title_id VARCHAR PK 
title VARCHAR  

Dept_Employee
-
emp_no int FK >-< Employees.emp_no
dept_no VARCHAR FK >- Departments.dept_no