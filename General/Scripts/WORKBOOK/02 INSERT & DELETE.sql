-- INSERT UPDATE DELETE
-- INSERT
INSERT INTO TABLE_NAME
(COLUMN1, COLUMN2, COLUMN3)
VALUES ('name', '0001-01-01', 'F');

INSERT INTO TABLE_NAME
(COLUMN1, , COLUMN3)
VALUES ('name', 'F');

INSERT INTO TABLE_NAME VALUES
('name', '0001-01-01', 'F');

-- DELETE 
DELETE FROM TABLE_NAME
WHERE COLUMN1 = 'name';

-- UPDATE
UPDATE TABLE_NAME
SET COLUMN1 = 'CONDITION'
WHERE COLUMN2 = 'CONDITION';



-- SESSION 2
CREATE TABLE EMPLOYEES
(NAME VARCHAR(20),
EMPLOYEE_NUMBER INTEGER,
DEPARTMENT CHAR(3),
SALARY DECIMAL(8, 2));

INSERT INTO EMPLOYEES
(NAME, EMPLOYEE_NUMBER, DEPARTMENT, SALARY)
VALUES ('Spencer Wood', 560, '100', 5.23);

INSERT INTO EMPLOYEES
(NAME, EMPLOYEE_NUMBER, DEPARTMENT, SALARY)
VALUES ('Spencer Wood', 560, '100', 5.23),
		('Spencer Wood', 560, '100', 5.23),
		('Spencer Wood', 560, '100', 5.23),
		('Spencer Wood', 560, '100', 5.23);
		
CREATE TABLE T1
(C1 VARCHAR(25) NOT NULL,
C2 BOOLEAN NOT NULL);

INSERT INTO T1 
VALUES ('A1',TRUE),('B1',FALSE);
INSERT INTO T1 
VALUES ('A2',1),('B2',0);

INSERT INTO T1 
VALUES ('A3',25),('B3',-25); -- This works because it accepts ANY number AS TRUE but IF it IS a zero THEN it IS FALSE

INSERT INTO T1 VALUES ('A4','1'),('B4','0');
INSERT INTO T1 VALUES ('A5','TRUE'),('B5','FALSE');
INSERT INTO T1 VALUES ('A6','25'),('B6','-25');

CREATE TABLE T2 (
C1 INTEGER NOT NULL,
C2 CHAR(10),
C3 VARCHAR(5) NOT NULL WITH DEFAULT 'OK')

INSERT INTO T2 (C1, C2, C3)
VALUES (1, NULL, 'ERROR')

INSERT INTO T2 (C1, C2, C3)
VALUES (1, NULL, 'ERROR')

INSERT INTO T2 (C1, C2, C3)
VALUES (1, NULL, 'ERROR')

INSERT INTO T2 (C1, C3)
VALUES (1, DEFAULT)

INSERT INTO T2 (C1, C2)
VALUES (1, DEFAULT) -- This will WORK AS DEFAULT will just be shown AS NULL 

DELETE FROM EMPLOYEES; -- Deletes ALL ROWS

DELETE FROM EMPLOYEES
WHERE NAME = 'Spencer Wood'; -- Deletes just people WITH the name Spencer

DELETE FROM EMPLOYEES
WHERE COMMISION = 0;

DELETE FROM EMPLOYEES
WHERE SALARY > 65000
AND AGE > 50;

UPDATE EMPLOYEES
SET SALARY = SALARY + 10; -- Adds 10 TO everyones salary

UPDATE EMPLOYEES
SET SALARY = SALARY + 10000
WHERE NAME='CARLOS'

UPDATE EMPLOYEES
SET COMM = COMM + 100
WHERE COMM = 0

UPDATE EMPLOYEES
SET COMM = 0,
BONUS = 10000
WHERE JOB = 'MANAGER'

CREATE TABLE COUNTRY
(NAME VARCHAR(50),
CAPITAL CHAR(40),
POPULATION INTEGER);

INSERT INTO COUNTRY VALUES 
('Spain', 'Madrid', 45000000),
('France', 'Paris', 40000000);

UPDATE COUNTRY
SET POPULATION = 65000000
WHERE NAME = 'France';

DELETE COUNTRY
WHERE CAPITAL = 'Madrid';