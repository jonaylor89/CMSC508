
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
FROM DEPARTMENTS;

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
ALTER TABLE EMPLOYEES2 READ ONLY;

-- 6.)
INSERT INTO EMPLOYEES2 (ID, LAST_NAME, FIRST_NAME, SALARY, DEPT_ID)
VALUES (34, 'Marcie', 'Grant', 5678, 10);

-- 7.)
ALTER TABLE EMPLOYEES2 READ WRITE;

-- 8.)
DROP TABLE EMPLOYEES2;

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
VALUES (1, 'Patel', 'Ralph', 'rpatel', 895);

-- 4.)
INSERT INTO my_employee (id, last_name, first_name, userid, salary)
VALUES (2, 'Dancs', 'Betty', 'bdancs', 860);

-- 5.)
-- 6.)
INSERT INTO my_employee (id, last_name, first_name, userid, salary)
VALUES (3, 'Biri', 'Ben', 'bbiri', 1100),
      (4, 'Newman', 'Char', 'cnewman', 750);

-- 7.)
-- 8.)
-- 9.)
COMMIT WORK;

-- 10.)
UPDATE my_employee
SET last_name = 'Dextler'
WHERE id = 3;

-- 11.)
UPDATE my_employee
SET salary = 1000
WHERE salary < 900;

-- 12.)
-- 13.)
DELETE FROM my_employee WHERE id = 2;

-- 14.)
-- 15.)
COMMIT WORK;

-- 16.)
INSERT INTO my_employee (id, last_name, first_name, userid, salary)
VALUES (5, 'Ropeburn', 'Audrey', 'aropebur', 1550);

-- 17.)
-- 18.)
SAVEPOINT s;

-- 19.)
DELETE FROM my_employee;

-- 20.)
-- 21.)
ROLLBACK TO s;

-- 22.)
-- 23.)
COMMIT WORK;

-- 24.)
-- 25.)
-- 26.)

/*************************************************************
* Lecture 2
**************************************************************/

-- 1.)

-- True

-- 2.)

-- 3.)
-- 4.)
-- 5.)
SELECT employee_id as ID, last_name as NAME, job_id as JOB_ID, hire_date as STARTDATE
FROM EMPLOYEES;

-- 6.)
-- 7.)
SELECT UNIQUE job_id
FROM EMPLOYEES;

-- 8.)
-- 9.)
-- 10.)

/************************/

-- 1.)
SELECT last_name, salary
FROM EMPLOYEES
WHERE salary > 12000;

-- 2.)
SELECT LAST_NAME, DEPARTMENT_ID
FROM EMPLOYEES
WHERE EMPLOYEE_NUMBER = 176;

-- 3.)
SELECT LAST_NAME, DEPARTMENT_ID
FROM EMPLOYEES
WHERE salary > 12000 or salary < 5000;

-- 4.)
SELECT LAST_NAME, JOB_ID, HIRE_DATE
FROM EMPLOYEES
WHERE LAST_NAME = 'Matos' or LAST_NAME = 'Taylor'
ORDER BY HIRE_DATE;

-- 5.)
SELECT LAST_NAME, DEPARTMENT_ID
FROM EMPLOYEES
WHERE DEPARTMENT_ID IN (20, 50)
ORDER BY LAT_NAME;

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
SELECT GETDATE();

-- 2.)
SELECT employee_id, last_name, salary, TRUNC(salary * 1.15) AS "New Salary"
FROM EMPLOYEES;

-- 3.)
-- 4.)
SELECT employee_id, last_name, salary, TRUNC(salary * 1.15) AS "New Salary", salary - TRUNC(salary * 1.15) AS Increase
FROM EMPLOYEES;

-- 5.)
-- 6.)
-- 7.)
-- 8.)
-- 9.)

/*************************************************************
* Lecture 3
**************************************************************/

-- 1.)
-- 2.)
SELECT e.last_name, e.department_id, d.department_name
FROM  EMPLOYEES e, DEPARTMENTS d
WHERE e.department_id = d.department_id;

-- 3.)
-- 4.)
-- 5.)
SELECT *
FROM EMPLOYEES
WHERE manager_id IS NULL;

-- 6.)
SELECT e1.department_id, e1.last_name, e2.last_name
FROM EMPLOYEES e1, EMPLOYEES e2
WHERE e1.department_id = e2.department_id
    AND e1.employee_id <> e2.employee_id;

-- 7.)
-- 8.)
SELECT last_name, hire_date
FROM EMPLOYEES
WHERE hire_date > (
  SELECT hire_date
  FROM EMPLOYEES
  WHERE name = 'Davies'
);

-- 9.)
SELECT e.last_name, e.hire_date, m.last_name, m.hire_date
FROM EMPLOYEES e, EMPLOYEES m
WHERE hire_date > (
  SELECT hire_date
  FROM EMPLOYEES m1
  WHERE e.manager_id = m1.employee_id
)
AND e.manager_id = m.employee_id;

/**************************************************************
* Lecture 4
**************************************************************/

-- 1.)

-- true

-- 2.)

-- false

-- 3.)

-- true

-- 4.)
SELECT ROUND(MAX(salary)) as Maximum, ROUND(MIN(salary) as Minimum, ROUND(SUM(salary)) as Sum, ROUND(AVG(salary)) as Average
FROM EMPLOYEES;

-- 5.)
SELECT job_id, ROUND(MAX(salary)) as Maximum, ROUND(MIN(salary) as Minimum, ROUND(SUM(salary)) as Sum, ROUND(AVG(salary)) as Average
FROM EMPLOYEES
GROUP BY job_id;

-- 6.)
SELECT e1.job_id, COUNT(*)
FROM EMPLOYEES e1, EMPLOYEES e2
WHERE e1.employee_id <> e2.employee_id
    AND e1.job_id = e2.job_id
GROUP BY e1.job_id;

-- 7.)
SELECT COUNT(*) as "Number of Manager"
FROM (
  SELECT DISTINCT manager_id
  FROM EMPLOYEES
  WHERE manager_id IS NOT NULL
);

-- 8.)
SELECT MAX(salary) - MIN(salary) as Difference
FROM EMPLOYEES;

-- 9.)
-- 10.)
-- 11.)

/*************************************************************
* Lecture 5
**************************************************************/

-- 1.)
-- 2.)
SELECT employee_id, last_name, salary
FROM EMPLOYEES
HAVING salary > AVG(salary)
ORDER BY salary;

-- 3.)
SELECT e.employe_id, e.last_name
FROM EMPLOYEES e, (
  SELECT DISTINCT department_id
  FROM DEPARTMENTS d, (
    SELECT *
    FROM EMPLOYEES
    WHERE UPPER(last_name) LIKE '%A%'
  ) e
  WHERE d.department_id = e.employee_id
) d
WHERE e.department_id = d.department_id;


-- 4.)
SELECT e.last_name, e.department_id, E.job_id
FROM EMPLOYEES e, (
  SELECT *
  FROM DEPARTMENTS
  WHERE location_id = 1700
) d
WHERE e.department_id = d.department_id;

-- 5.)
-- 6.)
SELECT e.department_id, e.last_name, e.job_id
FROM EMPLOYEES e, (
  SELECT *
  FROM DEPARTMENTS
  WHERE department_name = 'Executive'
) d
WHERE e.department_id = d.department_id;

-- 7.)
SELECT *
FROM EMPLOYEES
WHERE salary > ANY(SELECT salary FROM EMPLOYEES WHERE department_id = 60);

-- 8.)
