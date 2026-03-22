-- 1. Display all employees along with their department names.
SELECT * FROM employees e WHERE dep_id=(SELECT dep_id FROM department WHERE dep_id=e.dep_id);

-- 2. List employees who work in IT department and have salary>55000. 
SELECT * FROM employees WHERE dep_id=(SELECT dep_id FROM department WHERE dep_name='IT') AND salary>55000;

 -- 3. Show all projects handled by the finance department.
 SELECT * FROM project WHERE dep_id=(SELECT dep_id FROM department WHERE dep_name='Finance'); 
 
 -- 4. Find total salary paid in each department.
 SELECT SUM(salary),dep_id FROM employees e WHERE 
 dep_id=(SELECT dep_id FROM department WHERE dep_id=e.dep_id) GROUP BY dep_id;
  
-- 5. Show employees name and number of projects each employees is working on.
SELECT COUNT(proj_id),emp_name FROM works_on w JOIN employees e ON w.emp_id=e.emp_id GROUP BY e.emp_name; 
 
 -- 6. Find the average salary of employees in each department.
 SELECT AVG(e.salary),dep_id FROM employees e WHERE
  dep_id=(SELECT dep_id FROM department WHERE dep_id=e.dep_id) GROUP BY dep_id;
 
 -- 7. Display department names having average salary>50000.
SELECT dep_name,AVG(e.salary) FROM employees e JOIN department d
 ON e.dep_id=d.dep_id GROUP BY dep_name HAVING AVG(e.salary)>50000;
 
 -- 8. Show employees who joined after year 2020.
 SELECT emp_name,hire_date FROM employees WHERE hire_date>='2021-01-01';
 
 -- 9. List all employees from Delhi working on any project.
 SELECT emp_id,proj_id FROM works_on WHERE emp_id IN (SELECT emp_id FROM employees WHERE city='Delhi');
 
 -- 10. Display employees who are not assigned to any project.
SELECT emp_id, emp_name FROM employees WHERE emp_id NOT IN (SELECT emp_id FROM works_on);
 
-- 11. Find employees who earn more than the average salary of the company.
SELECT emp_name,emp_id FROM employees WHERE salary>(select AVG(salary) FROM employees);

-- 12. Show the highest paid employees in each department.
SELECT emp_name,dep_id,salary FROM employees e WHERE salary=(SELECT MAX(salary) FROM employees WHERE dep_id=e.dep_id );

-- 13. Display employees working on projects with budget>70000.
SELECT proj_id,emp_id FROM works_on WHERE proj_id in (SELECT proj_id FROM project WHERE budget>700000);

-- 14. Show project names where atleast two employees are working.
SELECT proj_name,COUNT(emp_id) FROM works_on w JOIN project p
 ON p.proj_id=w.proj_id GROUP BY proj_name HAVING COUNT(emp_id)>=2;
 
 -- 15. Display employees who has worked the maximum hours overall.
 SELECT emp_id,MAX(hours_worked) FROM works_on WHERE 
 emp_id=(SELECT emp_id FROM employees WHERE emp_id=works_on.emp_id) GROUP BY emp_id;  
 
 -- 16. Show all employees whose salary is greater than Rohit's salary.
 SELECT * FROM employees WHERE salary>(SELECT salary FROM employees WHERE emp_name='Rohit');
 
 -- 17. Find departments that have no projects assigned.
 SELECT * FROM department WHERE dep_id NOT IN (SELECT dep_id FROM employees);
 
 -- 18. Show the second highest salary and name. (Using subquery)
 SELECT emp_name, salary FROM employees WHERE salary < (SELECT MAX(salary) FROM employees) ORDER BY salary DESC LIMIT 1; 
 
 -- 20. List employees who work on both project 202 and 205.
SELECT emp_id,proj_id FROM works_on WHERE proj_id IN (202,205);

-- 21. Find total hours worked by each employees on all projects.
SELECT SUM(hours_worked),emp_id,proj_id FROM works_on GROUP BY proj_id,emp_id;

-- 22. Display project names and total hours spent by employees.
SELECT proj_name,SUM(hours_worked) FROM project JOIN works_on ON
 project.proj_id=works_on.proj_id GROUP BY proj_name;
 
-- 23. Show departments with more than 2 employees.
SELECT COUNT(emp_id),dep_id FROM employees GROUP BY dep_id HAVING COUNT(emp_id)>2;  

-- 24. Show employees who have worked more than 100 hours in total.
SELECT emp_id,SUM(hours_worked) FROM works_on GROUP BY emp_id HAVING SUM(hours_worked)>100;

-- 25. Show department names and total project budget handled by it.
SELECT dep_name,SUM(budget) FROM project RIGHT JOIN department
 ON department.dep_id=project.dep_id GROUP BY dep_name;
 
 -- 27. List employees whose department has budget > 600000 in total.
SELECT emp_name, dep_id FROM employees WHERE dep_id IN (SELECT dep_id FROM project WHERE budget > 600000);

-- 28. Display department name, total salary and total hours worked. (Combine data from all 3 tables).
SELECT d.dep_name, SUM(e.salary), SUM(w.hours_worked) FROM works_on w JOIN employees e ON w.emp_id = e.emp_id 
JOIN department d ON e.dep_id = d.dep_id GROUP BY d.dep_name;

-- 29. Find top 3 highest-paid employees along with their department name.
SELECT e.emp_name, d.dep_name,salary FROM employees e JOIN department d
 ON d.dep_id=e.dep_id  ORDER BY e.salary DESC LIMIT 3;

 -- 30. Display employees group by city, showing average salary per city.
 SELECT COUNT(emp_name),city,AVG(salary) FROM  employees GROUP BY city;
 