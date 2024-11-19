-- LENGTH(), UPPER() / LOWER(), SUBSTR(), COALESCE(), REPLACE(), LOCATE(), CONCAT(), COLUMN ALIAS, CASE EXPRESSION
--LENGTH()
SELECT NAME, LENGTH (CAPITAL)
FROM COUNTRIES;

SELECT NAME FROM COUNTRIES
WHERE LENGTH(NAME)=10;

-- UPPER() / LOWER()
SELECT LOWER(NAME) FROM COUNTRIES
WHERE UPPER(NAME) LIKE 'UNITED%';

-- SUBSTR()
SELECT NAME FROM COUNTRIES
WHERE SUBSTR(NAME,1,6 )= 'UNITED'; -- SUBSTR(STRING, STARTING POSITION IN STRING, NUMBER OF CHARACTERS)

-- COALESCE()
SELECT COALESCE(POPULATION,0)
FROM COUNTRIES;

SELECT COALESCE(NAME,'N/A')
FROM COUNTRIES; -- COALSCE CHANGES ALL NULL VALUES 

-- REPLACE()
SELECT FIRSTNME, REPLACE(MIDINIT,MIDINIT,'X'), LASTNAME
FROM EMPLOYEE
WHERE JOB='MANAGER' AND GENDER='F';

REPLACE('DINING ROOM', 'DIN', 'LIV') = 'LIVING ROOM'
REPLACE(PRODUCT,'Peanut Butter', UPPER(PRODUCT)) -- REPLACE(STRING, OLD VALUE, NEW VALUE TO REPLACE OLD VALUE)

-- LOCATE
SELECT NAME, LOCATE ('UNITED',UPPER(NAME)) -- LOCATE(STRING BEING SEARCHED INSIDE EXPRESSION 2, EXPRESSION2)
FROM COUNTRIES
WHERE UPPER(NAME) LIKE '%UNITED%'; -- RETURNS FIRST POSITION WHERE EXPRESSION 1 IS INSIDE EXPRESSION 2 (IF NOT FOUND RETURNS 0)

-- CONCAT
SELECT CONCAT(NAME,CAPITAL) 
FROM COUNTRIES;

SELECT NAME || POPULATION || CAPITAL
FROM COUNTRIES;

-- COLUMN ALIAS
SELECT STORE, SUBSTR(STORE,1,3) as CITY
FROM SALES;

-- CASE EXPRESSION
SELECT STORE, DAYNAME(SALEDATE) as DAYNAME,
CASE DAYNAME(SALEDATE)
WHEN 'Saturday' THEN 'Weekend'
WHEN 'Sunday' THEN 'Weekend'
ELSE 'Workday'
END as DAYTYPE
FROM SALES;



-- SESSION 5
CREATE TABLE COUNTRIES (
NAME VARCHAR(50) NOT NULL,
CAPITAL CHAR(40),
POPULATION BIGINT,
CONTINENT VARCHAR(10))

SELECT NAME, LENGTH(CAPITAL)
FROM COUNTRIES;

SELECT NAME
FROM COUNTRIES
WHERE LENGTH(NAME) = 10;

SELECT LOWER(NAME)
FROM COUNTRIES
WHERE UPPER(NAME) LIKE 'UNITED%';

SELECT NAME
FROM COUNTRIES
WHERE SUBSTRING(UPPER(NAME), 1, 6) = 'UNITED';

SELECT EMPNO, SUBSTRING(HIREDATE, 1, 4)
FROM EMPLOYEE
WHERE SUBSTRING(HIREDATE, 1, 4) BETWEEN 2020 AND 2029
AND JOB LIKE 'SALESMAN %';

SELECT WORKDEPT, LASTNAME, COALESCE(SALARY, 0) + COALESCE(BONUS, 0) + COALESCE(COMM, 0) AS TOTAL_SALARY
FROM EMPLOYEE
WHERE WORKDEPT IN ('C00', 'D00');

SELECT FIRSTNME, REPLACE(MIDINIT, MIDINIT, 'X'), LASTNAME
FROM EMPLOYEE
WHERE JOB = 'MANAGER' AND GENDER = 'F';

SELECT REPLACE(FIRSTNME, SUBSTRING(FIRSTNME, LENGTH(FIRSTNME) -2), 'xxx'), MIDINIT, LASTNAME
FROM EMPLOYEE
WHERE GENDER = 'M' AND JOB = 'MANAGER';

SELECT LOCATE ('UNITED',NAME) FROM COUNTRIES; -- Obtain START POSITION OF UNITED IN name countries AND IF NOT contained THEN RETURN 0
-- LOCATE(substring, string, start) Locates the position of the substring in the string

SELECT CONCAT(NAME, CAPITAL)
FROM COUNTRIES;

SELECT NAME || POPULATION
FROM COUNTRIES;

SELECT NAME || ',' || POPULATION || ',' || CAPITAL 
FROM COUNTRIES;

SELECT LOWER(SUBSTRING(FIRSTNME, 1, 1)) || UPPER(SUBSTRING(FIRSTNME, 2, 1)) || SUBSTRING(FIRSTNME, 3)
FROM EMPLOYEE
WHERE GENDER = 'F';

SELECT CURRENT TIMESTAMP;

SELECT DAY(CURRENT DATE), DAYNAME(CURRENT DATE), MONTHNAME(CURRENT DATE);

SELECT CURRENT TIME, SECOND(CURRENT TIME), MIDNIGHT_SECONDS(CURRENT TIME);

DAY()
MONTH()
YEAR()
HOUR()
MINUTE()
SECOND()
MICROSECOND()

DAYNAME()
DAYOFWEEK()
DAYOFYEAR()
WEEK()
MONTHNAME()
MIDNIGHT_SECONDS()

SELECT CAST(POPULATION AS VARCHAR(10))
FROM COUNTRIES;

SELECT VARCHAR(POPULATION)
FROM COUNTRIES;

SELECT DECIMAL(POPULATION);

SELECT FLOAT(POPULATION);

SELECT DECIMAL(POPULATION, 16, 4);

SMALLINT( expression )
INTEGER( expression )
BIGINT( expression )
DECIMAL( expression )
FLOAT ( expression )

CHAR ( expression )
VARCHAR ( expression )

DATE ( expression )
TIME ( expression )
TIMESTAMP ( expression )

DECIMAL (expression, scale, precision)
CHAR (expression, length)
VARCHAR (expression, length)

SELECT STORE, SUBSTRING(STORE, 1, 3) AS CITY
FROM SALES;

SELECT STORE,
CASE
WHEN STORE LIKE 'NYC%' THEN 'New York City'
WHEN STORE LIKE 'MAD%' THEN 'Madison'
WHEN STORE LIKE 'ORL%' THEN 'Orlando'
ELSE 'Unknown'
END as CITY
FROM SALES;

SELECT STORE, DAYNAME(SALEDATE) as DAYNAME,
CASE DAYNAME(SALEDATE)
WHEN 'Saturday' THEN 'Weekend'
WHEN 'Sunday' THEN 'Weekend'
ELSE 'Workday'
END as DAYTYPE
FROM SALES;