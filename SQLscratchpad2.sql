
/*****************************************/

-- 1.)

CREATE VIEW EMPLOYEES_VU AS
SELECT employee_id, last_name as employee, department_id
FROM EMPLOYEES;

-- 2.)
-- 3.)

SELECT last_name, department_id
FROM EMPLOYEES_VU;

-- 4.)

CREATE VIEW DEPT50 AS
SELECT employee_id AS EMPNO, last_name AS EMPLOYEE, department_id AS DEPTNO
FROM EMPLOYEES
WHERE department_id = 50;

-- 5.)
-- 6.)
-- 7.)

CREATE SEQUENCE DEPT_ID_SEQ
AS NUMBER(7)
START WITH 200
INCREMENT BY 10
MAXVALUE 1000

-- 8.)
-- 9.)

CREATE INDEX NAME_IDX
ON DEPT.NAME

-- 10.)

CREATE SYNONYM EMP
FOR EMPLOYEES

/****************************************/

-- 1.)

-- 2.)

-- 3.)

-- 4.)

-- 5.)

-- 6.)

/***************************************/

-- 1.)

CREATE OR REPLACE TRIGGER smaller_than_pres
ON EMPLOYEES
BEFORE INSERT
AS
BEGIN
  -- If new salary is greater than  president
  --  Then don't INSERT
  --
END

-- 2.)

CREATE OR REPLACE TRIGGER smaller_than_manager
ON EMPLOYEES
BEFORE INSERT
AS
BEGIN

END

-- 3.)

CREATE TABLE SUBCOUNT (
  PRIMARY KEY employee_id NUMBER(7) REFERENCES EMPLOYEES
  sub_count NUMBER(7)
)

CREATE OR REPLACE TRIGGER update_subcount
ON EMPLOYEES
AFTER INSERT
AS
BEGIN
  
END

-- 4.)

CREATE OR REPLACE TRIGGER sub_raise
ON EMPLOYEES
AFTER INSERT
AS
BEGIN

END

-- 5.)

CREATE TABLE log (

)

CREATE OR REPLACE TRIGGER employee_log_update
ON EMPLOYEES
AFTER INSERT DELETE
AS
BEGIN

END

/***************************************/


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
