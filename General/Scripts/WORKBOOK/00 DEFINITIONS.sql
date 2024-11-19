-- SQL DATA TYPES
NUMERIC
• Integers: SMALLINT, INTEGER, BIGINT
• Decimal: DECIMAL(p,s)
where p is the precision (total digits)
and s is the scale (decimal part)
• Floating Point: FLOAT or REAL
➢ ALPHANUMERIC
• Fixed Length:
❑ CHAR(n) (n between 1 and 254 Bytes)
• Variable Length :
❑ VARCHAR(n) (until 32KB)
❑ CLOB(n) (until 2GB)
❑ BLOB(n) (until 2GB)
➢ TIME
• Date: DATE
• Time: TIME
• Date & Time: TIMESTAMP


-- BOOLEAN DATATYPE
CREATE TABLE T1
( C1 VARCHAR(25) NOT NULL,
C2 BOOLEAN NOT NULL);

INSERT INTO T1 VALUES ('A1',TRUE),('B1',FALSE);
INSERT INTO T1 VALUES ('A2',1),('B2',0);
INSERT INTO T1 VALUES ('A3',25),('B3',-25);
INSERT INTO T1 VALUES ('A3',25.),('B3',-25.); -- WONT WORK

INSERT INTO T1 VALUES ('A4','1'),('B4','0');
INSERT INTO T1 VALUES ('A5','TRUE'),('B5','FALSE');
INSERT INTO T1 VALUES ('A6','25'),('B6','-25');
INSERT INTO T1 VALUES ('A6','CARLOS'); -- WONT WORK
INSERT INTO T1 VALUES ('A6',CURRENT DATE); -- WONT WORK
INSERT INTO T1 VALUES ('A6',CURRENT TIME); -- WONT WORK
INSERT INTO T1 VALUES ('A6',CURRENT TIMESTAMP); -- WONT WORK

-- HANDLING NULL
CREATE TABLE T2 (
C1 INTEGER NOT NULL,
C2 CHAR(10),
C3 VARCHAR(5) NOT NULL WITH DEFAULT 'OK');

INSERT INTO T2 (C1, C2, C3)
VALUES (1, NULL, 'ERROR');

INSERT INTO T2 (C1, C2)
VALUES (1, NULL);

INSERT INTO T2 (C1)
VALUES (1);

INSERT INTO T2 (C2, C3)
VALUES (NULL, 'ERROR'); -- WONT WORK

INSERT INTO T2 (C1, C3)
VALUES (1, NULL); -- WONT WORK

INSERT INTO T2 (C1, C3)
VALUES (1, DEFAULT);

-- HANDLING DEFAULT
CREATE TABLE T1 (
C1 CHAR(5),
C2 CHAR(10) WITH DEFAULT,
C3 VARCHAR(5) WITH DEFAULT )

INSERT INTO T1
VALUES (DEFAULT,DEFAULT,DEFAULT); -- RESULT IS (NULL, STRING WITH 10 SPACES, EMPTY STRING)

CREATE TABLE T1 (
C1 SMALLINT,
C2 SMALLINT WITH DEFAULT,
C3 SMALLINT WITH DEFAULT 5)

INSERT INTO T1
VALUES (DEFAULT,DEFAULT,DEFAULT); -- RESULT IS (NULL, 0, 5)

-- PREDICATGE SYNTAX
Comparing predicates uses operators between both expressions:
<, >, =, >=, <=, <>, !=

-- COMPOUND PREDICATES
<predicate1> AND <predicate2> OR <predicate3> AND <predicate4>
( <predicate1> AND <predicate2> ) OR ( <predicate3> AND <predicate4> )

-- DATETIME FUNCTIONS
SELECT CURRENT TIMESTAMP;
CURRENT DATE
CURRENT TIME
CURRENT TIMESTAMP

SELECT DAY(CURRENT DATE),
DAYNAME(CURRENT DATE),
MONTHNAME(CURRENT DATE);
DAY( )
MONTH( )
YEAR( )
HOUR ( )
MINUTE ( )
SECOND ( )
MICROSECOND ( )

SELECT CURRENT TIME,
SECOND(CURRENT TIME),
MIDNIGHT_SECONDS(CURRENT TIME)
DAYNAME( )
DAYOFWEEK( )
DAYOFYEAR( )
WEEK( )
MONTHNAME( )
MIDNIGHT_SECONDS( )

-- EXPLICIT CASTING FUNCTIONS
SELECT CAST (POPULATION AS VARCHAR(10))
FROM COUNTRIES;

SELECT DECIMAL(POPULATION)
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













































