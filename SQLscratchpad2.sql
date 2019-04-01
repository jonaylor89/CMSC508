
/****************************************/

-- 1.)

CREATE SEQUENCE seq_pk_employees
MINVALUE 1
MAXVALUE 100000000
START WITH 1
INCREMENT BY 1
NOCYCLE;

-- 2.)

CREATE FUNCTION ( employee_id )
RETURN VARCHAR2(40)
BEGIN

END;

/**************************************/
