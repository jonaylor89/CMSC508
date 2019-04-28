
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

CREATE OR REPLACE FUNCTION format_phone (phone_number VARCHAR(15))
  RETURN VARCHAR(15)
IS
  final_format VARCHAR(15)
BEGIN
  RETURN '(' || SUBSTRING(phone_number, 0, 4) || ')' || SUBSTRING(phone_number, 5, 9) || '-' || SUBSTRING(phone_number, 10, 15);
END;

-- 4.)

CREATE OR REPLACE FUNCTION dept_avg (dept_id NUMBER(7))
  RETURN NUMBER(7)
IS
  dept_avg_salary NUMBER(7)
BEGIN
  SELECT AVG(e.salary) INTO dept_avg_salary
  FROM EMPLOYEES e
  WHERE e.department_id = dept_id;

  RETURN dept_avg_salary;
END;

-- 5.)

CREATE OR REPLACE PROCEDURE increase_mgr (sub_id NUMBER(7), increase_pct NUMBER(7))
IS
BEGIN
  UPDATE EMPLOYEES
  SET salary += salary * increase_pct
  WHERE employee_id = (
    SELECT e.manager_id
    FROM EMPLOYEES e
    WHERE e.employee_id = sub_id
  );
END;

-- 6.)

-- Triggers

-- 1.)

CREATE OR REPLACE TRIGGER smaller_than_pres
BEFORE INSERT OR UPDATE
ON EMPLOYEES
FOR EACH ROW
DECLARE
  pres_salary EMPLOYEES%TYPE;
  pres_id EMPLOYEES%TYPE;
  invalid_salary EXCEPTION;
  PRAGMA EXCPTION_INIT(invalid_salary, -6502);
BEGIN

  SELECT salary, employee_id INTO pres_salary, pres_id
  FROM EMPLOYEES
  WHERE job_id = 'AD_PRES';

  IF UPDATING AND :new.employee_id = pres_id AND :new.salary < pres_salary
  THEN
    IF (SELECT MAX(salary) FROM EMPLOYEES WHERE employee_id <> pres_id) > :new.salary
    THEN
      RAISE invalid_salary;
    END IF;
  ELSE
    IF pres_salary < :new.salary
    THEN
      RAISE invalid_salary;
    END IF;
  END IF;
END;

-- 2.)

CREATE OR REPLACE TRIGGER smaller_than_manager
BEFORE INSERT OR UPDATE
ON EMPLOYEES
DECLARE
  invalid_salary EXCEPTION;
  PRAGMA EXCEPTION_INIT(invalid_salary, -6502);
BEGIN
  IF :new.manager_id IS NOT NULL
    IF (SELECT salary FROM EMPLOYEES WHERE employee_id = :new.manager_id) < :new.salary
    THEN
      RAISE invalid_salary;
    END IF;
  END IF;
END;

-- 3.)

CREATE TABLE SUBCOUNT (
  PRIMARY KEY employee_id NUMBER(7) REFERENCES EMPLOYEES
  sub_count NUMBER(7)
);

CREATE OR REPLACE TRIGGER update_subcount
AFTER INSERT OR UPDATE
ON EMPLOYEES
AS
BEGIN
  IF :new.manager_id IS NOT NULL
  THEN
    IF EXISTS (SELECT * FROM SUBCOUNT WHERE employee_id = :new.manager_id)
    THEN
      UPDATE SUBCOUNT
      SET sub_count = subcount + 1
      WHERE employee_id = :new.manager_id;
    ELSE
      INSERT INTO SUBCOUNT (employee_id, sub_count)
      VALUES (:new.manager_id, 1);
    END IF;
  END IF;
END;

CREATE OR REPLACE TRIGGER remove_employee
AFTER DELETE
ON EMPLOYEES
AS
BEGIN
  IF :old.manager_id IS NOT NULL
  THEN
    UPDATE SUBCOUNT
    SET sub_count = sub_count - 1
    WHERE employee_id = :old.manager_id;
  END IF;
END;

-- 4.)

CREATE OR REPLACE TRIGGER sub_raise
AFTER INSERT
ON EMPLOYEES
AS
BEGIN
  -- Check if new employee has a manager
  -- if they do then find the manager and increase their salary by 5%
END;

-- 5.)

CREATE SEQUENCE log_seq
AS NUMBER(7)
INCREMENT BY 1
START WITH 1

CREATE TABLE log (
  PRIMARY KEY log_event_id NUMBER(7),
  date DATE,
  description VARCHAR(100)
);

CREATE OR REPLACE TRIGGER employee_log_update
AFTER INSERT OR UPDATE OR DELETE
ON EMPLOYEES
AS
BEGIN
  IF INSERTING
  THEN
    INSERT INTO LOG (log_event_id, date, description)
    VALUES (log_seq.NEXTVAL, SYSDATE, "Employee {} inserted")
  ELSE IF UPDATING
  THEN
    INSERT INTO LOG (log_event_id, date, description)
    VALUES (log_seq.NEXTVAL, SYSDATE, "Employee {} updated {} from {} to {}")

  ELSE
    INSERT INTO LOG (log_event_id, date, description)
    VALUES (log_seq.NEXTVAL, SYSDATE, "Employee {} removed")

  END IF;
END;

/***************************************/
