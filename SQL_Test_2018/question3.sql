
CREATE OR REPLACE FUNCTION avg_dept_salary (dept_id in DEPARTMENTS.department_id%TYPE) 
    RETURN NUMBER
IS
    avg_salary NUMBER(7);
BEGIN
    SELECT AVG(e.salary) INTO avg_salary
    FROM EMPLOYEES e
    WHERE e.department_id = dept_id;
    
    RETURN avg_salary;
END;

CREATE OR REPLACE FUNCTION count_dept_employees (dept_id in DEPARTMENTS.department_id%TYPE)
    RETURN NUMBER
IS
    employee_count NUMBER(7);
BEGIN
    SELECT COUNT(*) INTO employee_count
    FROM EMPLOYEES e
    WHERE e.department_id = dept_id;
    
    RETURN employee_count;
    
END;

CREATE OR REPLACE FUNCTION min_dept_salary (dept_id in DEPARTMENTS.department_id%TYPE)
    RETURN NUMBER
IS
    employee_count NUMBER(7);
BEGIN
    SELECT MIN(e.salary) INTO employee_count
    FROM EMPLOYEES e
    WHERE e.department_id = dept_id;
    
    RETURN employee_count;
    
END;

CREATE OR REPLACE FUNCTION max_dept_salary (dept_id in DEPARTMENTS.department_id%TYPE)
    RETURN NUMBER
IS
    employee_count NUMBER(7);
BEGIN
    SELECT MAX(e.salary) INTO employee_count
    FROM EMPLOYEES e
    WHERE e.department_id = dept_id;
    
    RETURN employee_count;
    
END;

CREATE OR REPLACE VIEW department_statistics AS
SELECT d.department_name AS Name, 
    SUBSTR(m.first_name, 1, 1) || '. ' || m.last_name AS Manager,
    count_dept_employees(d.department_id) AS Employees,
    min_dept_salary(d.department_id) AS Max,
    max_dept_salary(d.department_id) AS Min,
    avg_dept_salary(d.department_id) As Average
FROM DEPARTMENTS d, EMPLOYEES m
WHERE m.employee_id = d.manager_id;

