--1. List the following details of each employee: 
--employee number, last name, first name, sex, and salary.
--select * from Employees;
--select * from Salaries;

SELECT employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
FROM employees
JOIN salaries ON employees.emp_no = salaries.emp_no;

--2. List first name, last name,
--and hire date for employees who were hired in 1986.
select first_name, last_name, hire_date
from employees
where hire_date >= '1986-01-01';

--3. List the manager of each department with the following information: 
--department number, department name, the manager's employee number, last name, first name.
--select * from Departments;
--select * from Dept_managers;

SELECT Dept_Managers.dept_no, Departments.dept_name, Dept_managers.emp_no, 
        Employees.last_name, Employees.first_name
FROM Dept_managers
JOIN Departments 
ON Dept_managers.dept_no = Departments.dept_no
JOIN Employees 
ON Dept_managers.emp_no = Employees.emp_no;

--4). List the department of each employee with the following information: 
--employee number, last name, first name, and department name.

SELECT E.emp_no, E.last_name, E.first_name, D.dept_name
FROM Employees AS E
	JOIN Dept_Employees AS DE
	ON (E.emp_no = DE.emp_no)
		JOIN Departments as D
		ON (DE.dept_no = D.dept_no);
        
--5). List first name, last name, and sex 
--for employees whose first name is "Hercules" and 
--last names begin with "B."

SELECT first_name, last_name, sex
FROM Employees
WHERE first_name = 'Hercules' and last_name like 'B%';

--6). List all employees in the Sales department, 
--including their employee number, last name, first name, 
--and department name.

SELECT E.emp_no, E.last_name, E.first_name, D.dept_name
FROM Employees AS E
	JOIN Dept_employees AS DE
	ON (E.emp_no = DE.emp_no)
		JOIN departments as D
		ON (DE.dept_no = D.dept_no)
		WHERE D.dept_name = 'Sales';

--7). List all employees in the Sales and Development departments, 
--including their employee number, last name, first name, 
--and department name.

SELECT E.emp_no, E.last_name, E.first_name, D.dept_name
FROM Employees AS E
	JOIN Dept_employees AS DE
	ON (E.emp_no = DE.emp_no)
		JOIN departments AS D
		ON (DE.dept_no = D.dept_no)
		WHERE D.dept_name = 'Sales' OR D.dept_name = 'Development';

--8). List the frequency count of employee last names
--(i.e., how many employees share each last name) 
--in descending order.

SELECT last_name, COUNT(last_name) AS "Frequency count"
FROM Employees
GROUP BY last_name
ORDER BY "Frequency count" DESC;







