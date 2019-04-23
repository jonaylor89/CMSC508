
/****************************************/

-- 1.)

CREATE OR REPLACE SEQUENCE seq_pk_employees
MINVALUE 1
MAXVALUE 100000000
START WITH 1
INCREMENT BY 1
NOCYCLE;

-- 2.)

CREATE OR REPLACE FUNCTION ( employee_id )
RETURN VARCHAR2(40)
BEGIN

END;

/**************************************/

CREATE OR REPLACE TRIGGER total_salary
AFTER DELETE OR INSERT OR UPDATE department_id, salary, ON employees
  FOR EACH ROW
  BEGIN
    IF DELETING OR (UPDATING AND :old.department_id != :new.department_id)

    END IF;
    IF INSERTING OR (UPDATING AND)

    END IF;
    IF (UPDATING AND)

    END IF;
  END
END;

CREATE OR REPLACE TRIGGER new_employee_bonus
BEFORE INSERT ON employees
FOR EACH ROW
BEGIN
    UPDATE EMPLOYEES
    SET salary = salary * 1.05
    WHERE department_id = :new.department_id
END;


CREATE TABLE 




/************************************/
