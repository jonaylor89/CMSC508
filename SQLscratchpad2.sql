
/*****************************************/

-- Advanced SQL

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
MAXVALUE 1000;

-- 8.)
-- 9.)

CREATE INDEX NAME_IDX
ON DEPT.NAME;

-- 10.)

CREATE SYNONYM EMP
FOR EMPLOYEES;

/****************************************/

-- Functions and Procedures

-- 1.)

CREATE SEQUENCE employee_pk_seq
AS NUMBER(7)
START WITH 1
INCREMENT BY 1;

-- 2.)

CREATE OR REPLACE FUNCTION getName (employee_pk NUMBER(7))
  RETURN VARCHAR(25)
IS
  full_name VARCHAR(25);
BEGIN
  SELECT e.first_name || " " || e.last_name INTO full_name
  FROM EMPLOYEES e
  WHERE e.employee_id = employee_pk;

  RETURN full_name;
END;

-- 3.)

CREATE OR REPLACE FUNCTION format_phone (phone_number NUMBER(7))
  RETURN VARCHAR(15)
IS
BEGIN

END;

-- 4.)

CREATE OR REPLACE FUNCTION dept_avg (dept_id NUMBER(7))
  RETURN NUMBER(7)
IS
BEGIN

END;

-- 5.)

CREATE OR REPLACE PROCEDURE increase_mgr ()
IS
BEGIN

END;

-- 6.)

CREATE OR REPLACE PROCEDURE create_table ()
IS
BEGIN

END;

/***************************************/

-- Triggers

-- 1.)

CREATE OR REPLACE TRIGGER smaller_than_pres
ON EMPLOYEES
BEFORE INSERT
AS
BEGIN
  -- If the new salary is for the president and lower
  --  then make sure that everyone else's isn't higher
  -- Else if new salary is greater than president
  --  Then don't INSERT
  --
END;

-- 2.)

CREATE OR REPLACE TRIGGER smaller_than_manager
ON EMPLOYEES
BEFORE INSERT
AS
BEGIN
  -- If the new salary is greater than the old one and greater
  --  then check if the employee has a manager
  --    If they do then make sure the new salary isn't greater than the manager
  --      If it is then do nothing
END;

-- 3.)

CREATE TABLE SUBCOUNT (
  PRIMARY KEY employee_id NUMBER(7) REFERENCES EMPLOYEES
  sub_count NUMBER(7)
);

CREATE OR REPLACE TRIGGER update_subcount
ON EMPLOYEES
AFTER INSERT OR UPDATE
AS
BEGIN

END;

CREATE OR REPLACE TRIGGER remove_employee
ON EMPLOYEES
AFTER DELETE
AS
BEGIN

END;

-- 4.)

CREATE OR REPLACE TRIGGER sub_raise
ON EMPLOYEES
AFTER INSERT
AS
BEGIN
  -- Check if new employee has a manager
  -- if they do then find the manager and increase their salary by 5%
END;

-- 5.)

CREATE TABLE log (
  PRIMARY KEY log_event_id NUMBER(7),
  date DATE,
  description VARCHAR(100)
);

CREATE OR REPLACE TRIGGER employee_log_update
ON EMPLOYEES
AFTER INSERT DELETE
AS
BEGIN

END;

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
  END;
END;


/************************************/
