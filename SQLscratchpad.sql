
/*************************************************************
* Lecture 1
**************************************************************/

-- 1.)
CREATE TABLE DEPT (
  ID NUMBER(7) NOT NULL,
  NAME VARCHAR2(25),
  CONTRAINT DEPT_ID PRIMARY KEY (ID)
);

-- 2.)
INSERT INTO DEPT
SELECT DEPARTMENT_ID, NAME
FROM DEPARTMENTS

-- 3.)
CREATE TABLE EMP (
  ID NUMBER(7),
  LAST_NAME VARCHAR2(25),
  FIRST_NAME VARCHAR2(25),
  FOREIGN KEY (DEPT_ID) REFERENCES DEPT(ID)
);

-- 4.)
CREATE TABLE EMPLOYEES2 (
  ID NUMBER(7),
  LAST_NAME VARCHAR(25),
  FIRST_NAME VARCHAR(25),
  SALARY NUMBER(),
  FOREIGN KEY (DEPT_ID) REFERENCES DEPT(ID),
  CONSTRAINT EMPLOYEES2_PK PRIMARY KEY (ID)
);

-- 5.)
ALTER TABLE EMPLOYEES2 READ ONLY

-- 6.)
INSERT INTO EMPLOYEES2 (ID, LAST_NAME, FIRST_NAME, SALARY, DEPT_ID)
VALUES (34, 'Marcie', 'Grant', 5678, 10)

-- 7.)
ALTER TABLE EMPLOYEES2 READ WRITE

-- 8.)
DROP TABLE EMPLOYEES2

/****************************/

-- 1.)
CREATE TABLE my_employee (
  id NUMBER(4) CONSTRAINT my_employee_id_nn NOT NULL,
  last_name VARCHAR2(25),
  first_name VARCHAR2(25),
  userid VARCHAR2(8),
  salary NUMBER(9,2)
);

-- 2.)
-- 3.)
INSERT INTO my_employee
VALUES (1, 'Patel', 'Ralph', 'rpatel', 895)

-- 4.)
INSERT INTO my_employee (id, last_name, first_name, userid, salary)
VALUES (2, 'Dancs', 'Betty', 'bdancs', 860)

-- 5.)
-- 6.)
INSERT INTO my_employee (id, last_name, first_name, userid, salary)
VALUES (3, 'Biri', 'Ben', 'bbiri', 1100),
      (4, 'Newman', 'Char', 'cnewman', 750)

-- 7.)
-- 8.)
-- 9.)
COMMIT WORK

-- 10.)
UPDATE my_employee
SET last_name = 'Dextler'
WHERE id = 3

-- 11.)
UPDATE my_employee
SET salary = 1000
WHERE salary < 900

-- 12.)
-- 13.)
DELETE FROM my_employee WHERE id = 2

-- 14.)
-- 15.)
COMMIT WORK

-- 16.)
INSERT INTO my_employee (id, last_name, first_name, userid, salary)
VALUES (5, 'Ropeburn', 'Audrey', 'aropebur', 1550)

-- 17.)
-- 18.)
SAVEPOINT s

-- 19.)
DELETE FROM my_employee

-- 20.)
-- 21.)
ROLLBACK TO s

-- 22.)
-- 23.)
COMMIT WORK

-- 24.)
-- 25.)
-- 26.)

/*************************************************************
* Lecture 2
**************************************************************/

-- 1.)
True

-- 2.)

-- 3.)
-- 4.)
-- 5.)
SELECT employee_id as ID, last_name as NAME, job_id as JOB_ID, hire_date as STARTDATE
FROM EMPLOYEES

-- 6.)
-- 7.)
SELECT UNIQUE job_id
FROM EMPLOYEES

-- 8.)
-- 9.)
-- 10.)

/************************/

-- 1.)
SELECT last_name, salary
FROM EMPLOYEES
WHERE salary > 12000

-- 2.)
SELECT LAST_NAME, DEPARTMENT_ID
FROM EMPLOYEES
WHERE EMPLOYEE_NUMBER = 176

-- 3.)
SELECT LAST_NAME, DEPARTMENT_ID
FROM EMPLOYEES
WHERE salary > 12000 or salary < 5000

-- 4.)
SELECT LAST_NAME, JOB_ID, HIRE_DATE
FROM EMPLOYEES
WHERE LAST_NAME = 'Matos' or LAST_NAME = 'Taylor'
ORDER BY HIRE_DATE

-- 5.)
SELECT LAST_NAME, DEPARTMENT_ID
FROM EMPLOYEES
WHERE DEPARTMENT_ID IN (20, 50)
ORDER BY LAT_NAME

-- 6.)


-- 7.)
-- 8.)
-- 9.)
-- 10.)
-- 11.)
-- 12.)
-- 13.)
-- 14.)
-- 15.)

/************************/

-- 1.)

/*************************************************************
* Lecture 3
**************************************************************/

/**************************************************************
* Lecture 4
**************************************************************/

/*************************************************************
* Lecture 5
**************************************************************/

/*************************************************************
* Advanced Excerises
**************************************************************/
