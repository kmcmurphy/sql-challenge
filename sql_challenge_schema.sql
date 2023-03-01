--Create tables and column dependencies

CREATE TABLE titles (
    title_id varchar(5) NOT NULL,
    title varchar(128) NOT NULL,
    PRIMARY KEY (title_id)
);

CREATE TABLE employees (
    emp_no int NOT NULL,
    emp_title_id varchar(5) NOT NULL,
    birth_date date NOT NULL,
    first_name varchar (128) NOT NULL,
    last_name varchar (128) NOT NULL,
    sex char(1) NOT NULL,
    hire_date date NOT NULL,
    PRIMARY KEY (emp_no),
	FOREIGN KEY (emp_title_id) REFERENCES titles(title_id)
);

CREATE TABLE departments (
    dept_no varchar(4) NOT NULL,
    dept_name varchar(128) NOT NULL,
	PRIMARY KEY (dept_no)
);

CREATE TABLE dept_emp (
    emp_no int NOT NULL,
    dept_no varchar(4) NOT NULL,
	PRIMARY KEY(emp_no, dept_no),
	FOREIGN KEY(emp_no) REFERENCES employees (emp_no),
	FOREIGN KEY(dept_no) REFERENCES departments (dept_no)
);

CREATE TABLE dept_manager (
    dept_no varchar(4) NOT NULL,
    emp_no int NOT NULL,
	PRIMARY KEY(dept_no, emp_no),
	FOREIGN KEY(dept_no) REFERENCES departments (dept_no),
	FOREIGN KEY(emp_no) REFERENCES employees (emp_no)
);

CREATE TABLE salaries (
    emp_no int NOT NULL,
    salary int NOT NULL,
	PRIMARY KEY(emp_no),
	FOREIGN KEY(emp_no) REFERENCES employees (emp_no)
);


-- Import the CSVs to tables in the order created above:
-- titles
-- employees
-- departments
-- dept_emp
-- dept_manager
-- salaries

