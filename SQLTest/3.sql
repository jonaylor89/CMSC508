
SELECT last_name, COUNT(last_name)
FROM EMPLOYEES
GROUP BY last_name
ORDER BY COUNT(last_name) DESC, last_name;