
SELECT d.department_name, m.first_name || ' ' || m.last_name as Name, AVG(e.salary), COUNT(e.salary) 
FROM (DEPARTMENTS d JOIN EMPLOYEES m ON d.manager_id = m.employee_id) JOIN EMPLOYEES e ON d.department_id = e.department_id
WHERE m.salary > 10000
GROUP BY d.department_name, m.first_name || ' ' || m.last_name;
