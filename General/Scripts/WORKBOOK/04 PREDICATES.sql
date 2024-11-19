-- IS, IN, BETWEEN, LIKE
-- PREDICATE EXAMPLE
CREATE TABLE COUNTRIES (
NAME VARCHAR(50) NOT NULL,
CAPITAL CHAR(40),
POPULATION BIGINT,
CONTINENT VARCHAR(10));

SELECT NAME FROM COUNTRIES
WHERE POPULATION > (SELECT POPULATION * 1.2
FROM COUNTRIES
WHERE NAME='France');

-- IS
SELECT COLUMN1
FROM TABLE_NAME
WHERE COLUMN2 IS NOT NULL; 

SELECT COLUMN1
FROM TABLE_NAME
WHERE COLUMN2 IS NULL; 

-- IN
SELECT COLUMN1
FROM TABLE_NAME
WHERE COLUMN1 IN ('name', 'string', 'etc');

SELECT COLUMN1
FROM TABLE_NAME
WHERE COLUMN3 IN (10, 40, 15);

-- BETWEEN
SELECT COLUMN1
FROM TABLE_NAME
WHERE COLUMN2 BETWEEN 1 AND 100;

SELECT COLUMN1
FROM TABLE_NAME
WHERE COLUMN2 BETWEEN 'A' AND 'C';

SELECT COLUMN1
FROM TABLE_NAME
WHERE COLUMN2 NOT BETWEEN 1 AND 100;

-- LIKE
SELECT COLUMN1
FROM TABLE_NAME
WHERE COLUMN1 LIKE 'A_%';



-- SESSION 4
CREATE TABLE COUNTRIES (
NAME VARCHAR(50) NOT NULL,
CAPITAL CHAR(40),
POPULATION BIGINT,
CONTINENT VARCHAR(10))

SELECT NAME FROM COUNTRIES
WHERE POPULATION > (SELECT POPULATION * 1.2
FROM COUNTRIES
WHERE NAME='France')

SELECT NAME
FROM COUNTRIES
WHERE POPULATION IS NULL;

SELECT NAME
FROM COUNTRIES
WHERE POPULATION IS NOT NULL;

SELECT NAME
FROM COUNTRIES 
WHERE POPULATION IS NULL
AND CAPITAL IS NOT NULL;

SELECT CAPITAL
FROM COUNTRIES
WHERE NAME IN ('France', 'Spain', 'United States');

SELECT CAPITAL
FROM COUNTRIES
WHERE POPULATION IN (1000000, 2000000, 3000000); -- It IS basically LIKE an OR STATEMENT placed many times

SELECT NAME
FROM COUNTRIES
WHERE POPULATION BETWEEN 1000000 AND 5000000;

SELECT NAME
FROM COUNTRIES
WHERE NAME LIKE 'United%';

SELECT NAME
FROM COUNTRIES
WHERE NAME LIKE '%Republic%';

SELECT NAME
FROM COUNTRIES
WHERE NAME LIKE '%nia';

SELECT NAME
FROM COUNTRIES
WHERE NAME LIKE 'Un_ted%';

SELECT NAME
FROM COUNTRIES
WHERE NAME BETWEEN 'A' AND 'C';

SELECT CAPITAL FROM COUNTRIES
WHERE RTRIM(CAPITAL) LIKE '%City'; -- FOR CHAR CHARACTERS, they expect an ending AND therefore you need TO use this clause

<predicate1> AND ( <predicate2> OR <predicate3> ) AND <predicate4>
<predicate1> AND ( <predicate2> OR <predicate3> ) -- Put parinthesis around the OR statements