
CREATE OR REPLACE PROCEDURE fire_employee (emp_id IN EMPLOYEES.employee_id%TYPE) AS
BEGIN
    UPDATE EMPLOYEES
    SET manager_id = (
        SELECT employee_id
        FROM EMPLOYEES
        WHERE JOB_ID = 'AD_PRES'
    )
    WHERE manager_id = emp_id;
    
    DELETE FROM EMPLOYEES
    WHERE employee_id = emp_id;
    
END;    
