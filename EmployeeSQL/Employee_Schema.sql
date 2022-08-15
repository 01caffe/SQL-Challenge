--create table TITLES
Drop table if exists Titles;

CREATE TABLE Titles (
     title_id VARCHAR PRIMARY KEY,
    title VARCHAR(50) NOT NULL
);

select * from Titles;

--create table EMPLOYEES
Drop table if exists Employees;

CREATE TABLE Employees(
	emp_no INT PRIMARY KEY,
	emp_title_ID VARCHAR(30) NOT NULL,
	birth_date DATE NOT NULL,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	sex VARCHAR NOT NULL,
	hire_date DATE NOT NULL,
	FOREIGN KEY (emp_title_ID) REFERENCES Titles(title_id)
);

select * from Employees;

--create table Departments
Drop table if exists Departments;

CREATE TABLE Departments(
	dept_no VARCHAR PRIMARY KEY,
	dept_name VARCHAR(50) NOT NULL
);

select * from Departments;

--create table Dept_Manager
Drop table if exists Dept_Managers;

-- The dept_manager table is many-many relationship, so two primary keys are needed
Create TABLE Dept_Managers (
	dept_no VARCHAR NOT NULL,
	emp_no INT NOT NULL,
	PRIMARY KEY (dept_no, emp_no),
	FOREIGN KEY (dept_no) REFERENCES Departments(dept_no),
	FOREIGN KEY (emp_no) REFERENCES Employees(emp_no)
);

select * from Dept_Managers;

Drop table if exists Dept_Employees;
-- The dept_emp table is many-many relationship, so two primary keys are needed
Create TABLE Dept_Employees(
	emp_no INT NOT NULL,
	dept_no VARCHAR NOT NULL,
	PRIMARY KEY (emp_no, dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

select * from Dept_Employees;

Drop table if exists Salaries;
--create Table SALARIES
CREATE TABLE Salaries(
	emp_no INT PRIMARY KEY,
	salary INT NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

select * from Salaries;