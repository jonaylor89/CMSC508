
INSERT INTO EMPLOYEES (employee_id, last_name, email, hire_date, job_id)
VALUES (1234, 'Naylor', 'naylorjo@vcu.edu', GETDATE(), 'IT_PROG');

UPDATE EMPLOYEES
SET salary = 80000
WHERE employee_id = 1234;

DELETE FROM EMPLOYEES
WHERE employee_id = 1234;
