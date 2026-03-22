#1. Display all records from the employee table.
SELECT * FROM employees;

#2. Show employees names and salaries only.
SELECT emp_name, salary FROM employees;

#3. List all departments from the department tables.
SELECT dep_name AS Departments FROM department;

#4. Display all employees who belong to the IT department.
SELECT * FROM employees WHERE dep_id IN (SELECT dep_id FROM department WHERE dep_name="IT");

#5. Find employees whoes salary is greater than 50,000.
SELECT * FROM employees WHERE salary>50000;

#6. Display employees who lived in Delhi.
SELECT * FROM employees WHERE city="Delhi";

#7. Show employees name and hire_date.
SELECT emp_name, hire_date FROM employees;

#8. List all projects with their budget.
SELECT proj_id, proj_name, budget FROM project;

#9. Display projects having budget greater than 5,00,000.
SELECT * FROM project WHERE budget>500000;

#10. Show all employees hired after 2020-01-01.
SELECT * FROM employees WHERE hire_date>"2020-01-01";

#11. Display employees name along with their department name.
SELECT e.emp_name, d.dep_name FROM employees e JOIN department d ON e.dep_id=d.dep_id;

#12. List employees name and project they are working on.
SELECT e.emp_name, p.proj_name FROM employees e JOIN project p ON e.dep_id=p.dep_id;

#13. Show department name and project name for all projects.
SELECT d.dep_name, p.proj_name FROM department d JOIN project p ON d.dep_id=p.dep_id;

#14. Display employee names and hours worked ON project.
SELECT e.emp_name, w.hours_worked FROM employees e JOIN works_on w ON e.emp_id=w.emp_id;

#15. List all employees working on the Website Revamp project.
SELECT e.emp_name,emp_id, p.proj_name FROM employees e JOIN project p WHERE proj_name='Website Revamp';

#16. Count total number of employees .
SELECT COUNT(emp_id) AS Total_Employees FROM employees;

#17. Find the highest salary among employees.
SELECT MAX(salary) AS Highest_Salary FROM employees;

#18. Find the average salary of employese.
SELECT AVG(salary) AS Average_Salary FROM employees;

#19. Count how many employees works in each department.
SELECT COUNT(e.emp_id), d.dep_name FROM employees e JOIN department d ON e.dep_id=d.dep_id GROUP BY dep_name;

#20. Show total number of projects in the company.
SELECT COUNT(proj_id) AS Total_Projects FROM project;

#21. Display department name and average salary of employees in each department.
SELECT dep_name, AVG(salary) FROM employees e JOIN department d ON e.dep_id=d.dep_id GROUP BY dep_name;

#22. List employees who are working on more than one project.
SELECT e.emp_id, e.emp_name FROM employees e JOIN works_on w ON e.emp_id=w.emp_id GROUP BY emp_name,emp_id HAVING(COUNT(proj_id)>1); 

#23. Find total hours worked by each employee.
SELECT emp_id,SUM(hours_worked) AS Total_Hours_Worked FROM works_on GROUP BY emp_id; 

#24. Display projects name and total hours worked on each project.
SELECT p.proj_name, SUM(hours_worked) FROM project p JOIN works_on w ON p.proj_id=w.proj_id GROUP BY proj_name;

#25. List employees who are working on project with a budget greater than 6,00,000.
SELECT emp_id, budget FROM project p JOIN works_on w On p.proj_id=w.proj_id WHERE budget>600000;

#26. Find employees whoes salary is greater than the average salary.
SELECT * FROM employees WHERE salary>(SELECT AVG(salary) FROM employees);

#27. Display department names that have more than two employees.
SELECT d.dep_name, COUNT(e.emp_id) AS total_employees FROM employees e JOIN department d 
ON e.dep_id = d.dep_id GROUP BY d.dep_name HAVING COUNT(e.emp_id) > 2;

#28. List employees who are not assigned to any project(if any).
SELECT emp_id, emp_name FROM employees WHERE emp_id NOT IN (SELECT emp_id FROM project);

#29. Find the department which has the maximum number of projects.
SELECT d.dep_name, COUNT(DISTINCT w.proj_id) AS total_projects FROM department d
JOIN employees e ON d.dep_id = e.dep_id JOIN works_on w ON e.emp_id = w.emp_id
GROUP BY d.dep_name ORDER BY total_projects DESC LIMIT 1;

#30. Display employee names who work in the same department as Rohit.
SELECT emp_name FROM employees WHERE dep_id = (SELECT dep_id FROM employees WHERE emp_name = 'Rohit');



