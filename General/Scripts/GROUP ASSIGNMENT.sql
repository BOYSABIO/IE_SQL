CREATE TABLE STOCK
(
company varchar(20) NOT NULL, 
snapdate DATE NOT NULL, 
snaptime TIME NOT NULL, 
openprice DECIMAL(14,4),
highprice DECIMAL(14,4),
lowprice DECIMAL(14,4),
closeprice DECIMAL(14,4),
volume INTEGER
);


SELECT COMPANY, 
AVG(OPENPRICE) + AVG(HIGHPRICE) + AVG(LOWPRICE) + AVG(CLOSEPRICE) AS CHECK1,
AVG(VOLUME) AS CHECK2,
COUNT(COMPANY) AS COUNT
FROM STOCK
GROUP BY COMPANY;

-- Once you’ve your data verified, show the maximum and the minimum 
--stock values for each company. Also include the number of rows and the 
--total stock traded volume per company. Include the SQL statement used 
--to obtain the information.
SELECT COMPANY, 
MAX(HIGHPRICE) AS MAXIMUM,
MIN(LOWPRICE) AS MINIMUM,
COUNT(*) AS NUMBER_ROWS,
SUM(VOLUME) AS TOTAL_VOLUME
FROM STOCK
GROUP BY COMPANY;

--If you just take a look at the previous select count results, you'll 
--notice that the number of rows per company isn't the same. This means that some companies have more time periods than others. Could you make a 
--report that shows these differences for all 3 companies?
SELECT 
	COALESCE(A.SNAPDATE, B.SNAPDATE, C.SNAPDATE) AS SNAPDATE,
	COALESCE(A.SNAPTIME, B.SNAPTIME, C.SNAPTIME) AS SNAPTIME,
	CASE WHEN A.COMPANY IS NOT NULL THEN 'OK' END G01,
	CASE WHEN B.COMPANY IS NOT NULL THEN 'OK' END G02,
	CASE WHEN C.COMPANY IS NOT NULL THEN 'OK' END G03
FROM 
	(SELECT * FROM STOCK WHERE COMPANY = 'IEG01' AND SNAPDATE = '2022-08-11') AS A
FULL OUTER JOIN
	(SELECT * FROM STOCK WHERE COMPANY = 'IEG02' AND SNAPDATE = '2022-08-11') AS B
ON A.SNAPTIME = B.SNAPTIME
FULL OUTER JOIN 
	(SELECT * FROM STOCK WHERE COMPANY = 'IEG03' AND SNAPDATE = '2022-08-11') AS C
ON COALESCE(A.SNAPTIME, B.SNAPTIME) = C.SNAPTIME
WHERE 
	A.COMPANY IS NULL OR B.COMPANY IS NULL OR C.COMPANY IS NULL
ORDER BY SNAPTIME ASC;

--In the following table, you can see the number of times when the opening 
--price is higher (DECREASE), lower (INCREASE), or equal (NOCHANGE) to the 
--closing price for each company at a given time period.
SELECT 
	COMPANY, COUNT(DECREASE), COUNT(INCREASE), COUNT(NOCHANGE)
FROM 
	(SELECT *, 
		CASE WHEN OPENPRICE > CLOSEPRICE THEN 1 END DECREASE,
		CASE WHEN OPENPRICE < CLOSEPRICE THEN 1 END INCREASE,
		CASE WHEN OPENPRICE = CLOSEPRICE THEN 1 END NOCHANGE
	FROM STOCK)
GROUP BY COMPANY;

--Create a summary daily stock price table. Let’s call it DAILY. 
--This table should have a summary row per day and company.
CREATE TABLE DAILY (
COMPANY VARCHAR(20) NOT NULL,
SNAPDATE DATE NOT NULL,
HIGHPRICE DECIMAL(14,4),
LOWPRICE DECIMAL(14,4),
VOLUME INTEGER)

--Load the daily summary table using a SQL statement. Load its highest and lowest stock 
--price, and the total volume traded for each given company and date.
INSERT INTO DAILY (SELECT COMPANY, SNAPDATE, MAX(HIGHPRICE) AS HIGHPRICE, MIN(LOWPRICE) AS LOWPRICE, SUM(VOLUME) AS VOLUME
	FROM STOCK
	GROUP BY COMPANY, SNAPDATE
	ORDER BY COMPANY, SNAPDATE);

--Create table COMPANY in the database. This table contains all companies that belong 
--to the IEG Holding Corporation. Please review the information provided at the 
--beginning of this assignment. Use it to decide the composition of the COMPANY table 
--and load this table with all the information related to the IEG companies.

CREATE TABLE COMPANY (
COMPANY_ID VARCHAR(5) NOT NULL,
NAME VARCHAR(50),
FISCAL_ID VARCHAR(15),
ADDRESS VARCHAR(100),
CITY VARCHAR(50),
COUNTRY VARCHAR(25),
EMPLOYEES INTEGER,
STOCKS INTEGER);

INSERT INTO COMPANY VALUES
('IEG01', 'IE MERCHANT', 'B83812345', 'Maria de Molina 32B', 'Madrid', 'Spain', 12, 100000),
('IEG02', 'IE Exclusive Club', 'X234-123', 'Marble Street 250', 'Hartford', 'Connecticut, US', 25, 248000),
('IEG03', 'IE International Souvenirs', NULL, NULL, 'Shanghai', 'China', 238, NULL);


-- QUESTION 8
ALTER TABLE COMPANY 
ADD CONSTRAINT PK_COMPANY
PRIMARY KEY (COMPANY_ID);

ALTER TABLE DAILY 
ADD CONSTRAINT PK_DAILY
PRIMARY KEY (COMPANY, SNAPDATE);

ALTER TABLE STOCK
ADD CONSTRAINT FK_COMPANY_STOCK
FOREIGN KEY (COMPANY)
REFERENCES COMPANY(COMPANY_ID)
ON DELETE CASCADE
ADD CONSTRAINT FK_DAILY_STOCK
FOREIGN KEY (COMPANY, SNAPDATE)
REFERENCES DAILY(COMPANY, SNAPDATE)
ON DELETE CASCADE;

ALTER TABLE DAILY 
ADD CONSTRAINT FK_COMPANY_DAILY_DONE
FOREIGN KEY (COMPANY)
REFERENCES COMPANY(COMPANY_ID)
ON DELETE CASCADE;


-- Question 9
DELETE FROM STOCK 
WHERE COMPANY = 'IEG03' 
AND SNAPDATE = '2022-08-11' 
AND SNAPTIME BETWEEN '09:00:00' AND '09:59:00';

DELETE FROM STOCK 
WHERE COMPANY = 'IEG03' AND SNAPDATE = '2022-08-10';

DELETE FROM DAILY 
WHERE COMPANY = 'IEG03' AND SNAPDATE = '2022-08-11';

DELETE FROM COMPANY 
WHERE COMPANY_ID = 'IEG03';













