-- List the employee number, last name, first name, sex, and salary of each employee.
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees e
join salaries s 
ON e.emp_no = s.emp_no
Order By e.emp_no ASC


--List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT first_name, last_name, hire_date
FROM employees e
WHERE e.hire_date < '1-1-1987' AND e.hire_date > '12-31-1985'
ORDER BY hire_date ASC

--List the manager of each department along with their department number, department name, employee number, last name, and first name.
SELECT dm.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name
FROM dept_manager dm
INNER JOIN employees e
ON dm.emp_no = e.emp_no
INNER JOIN departments d
ON dm.dept_no = d.dept_no

--List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
SELECT de.dept_no, e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees e
INNER JOIN dept_emp de
ON de.emp_no = e.emp_no
INNER JOIN departments d
ON de.dept_no = d.dept_no
ORDER BY e.emp_no ASC

--List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
SELECT first_name, last_name, sex 
FROM employees
WHERE first_name like 'Hercules' AND last_name like 'B%'

--List each employee in the Sales department, including their employee number, last name, and first name.

--USING A JOIN
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees e
INNER JOIN dept_emp de
ON e.emp_no = de.emp_no
INNER JOIN departments d
ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales'
ORDER BY d.dept_name ASC

--USING SUBQUERIES
-- SELECT emp_no, last_name, first_name
-- FROM employees
-- WHERE emp_no
-- IN (
-- 	SELECT emp_no 
-- 	FROM dept_emp
-- 	WHERE dept_no
-- 	IN (
-- 		SELECT dept_no
-- 		FROM departments
-- 		WHERE dept_name = 'Sales'
-- 		)
-- 	)
-- ORDER BY emp_no ASC

--List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees e
INNER JOIN dept_emp de
ON e.emp_no = de.emp_no
INNER JOIN departments d
ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales' OR d.dept_name LIKE 'Development'
ORDER BY d.dept_name ASC

--List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
SELECT last_name, count(*)
FROM employees
group by last_name
ORDER BY count desc