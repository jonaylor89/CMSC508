
SELECT first_name || ' ' || last_name, department_name, city
FROM EMPLOYEES NATURAL JOIN DEPARTMENTS NATURAL JOIN LOCATIONS NATURAL JOIN JOBS
WHERE job_title NOT LIKE '%Sales%'
    AND job_title LIKE '%Manager%';
