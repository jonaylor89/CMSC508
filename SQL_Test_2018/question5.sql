
CREATE TABLE salary_updates_log (
    update_id NUMBER(7) NOT NULL,
    employee_id NUMBER(7) NOT NULL,
    previous_salary NUMBER(7),
    new_salary NUMBER(7),
    CONSTRAINT salary_updates_log_pk PRIMARY KEY (update_id, employee_id)
);

CREATE SEQUENCE update_id_seq 
START WITH 100
INCREMENT BY 1;

CREATE OR REPLACE TRIGGER salary_log 
AFTER INSERT OR UPDATE OR DELETE
ON EMPLOYEES
FOR EACH ROW
BEGIN
    IF INSERTING
    THEN
        INSERT INTO salary_updates_log (update_id, 
                            employee_id, 
                            previous_salary, 
                            new_salary) 
        VALUES (update_id_seq.NEXTVAL, :new.employee_id, NULL, :new.salary);
    END IF;
    IF UPDATING
    THEN
    
        INSERT INTO salary_updates_log (update_id, 
                            employee_id, 
                            previous_salary, 
                            new_salary) 
        VALUES (update_id_seq.NEXTVAL, :new.employee_id, :old.salary, :new.salary);
        
    END IF;
    IF DELETING
    THEN
    
        INSERT INTO salary_updates_log (update_id, 
                            employee_id, 
                            previous_salary, 
                            new_salary) 
        VALUES (update_id_seq.NEXTVAL, :new.employee_id, :old.salary, NULL);
        
    END IF;
END;
