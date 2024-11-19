-- Question 10
SELECT WORKDEPT, LASTNAME, (COALESCE(SALARY, 0) + COALESCE(BONUS, 0) + COALESCE(COMM, 0)) AS TOTALSALARY
FROM EMPLOYEE
WHERE WORKDEPT LIKE 'B%' OR WORKDEPT LIKE 'C%'
ORDER BY TOTALSALARY DESC, WORKDEPT ASC
LIMIT 5;

-- Question 11
SELECT SUM((COALESCE(SALARY, 0) + COALESCE(BONUS, 0) + COALESCE(COMM, 0))) AS TOTALSALARYEXPENSES
FROM EMPLOYEE 
WHERE GENDER = 'M' AND WORKDEPT LIKE 'D%';


SELECT SUM((COALESCE(SALARY, 0) + COALESCE(BONUS, 0))) AS TOTALSALARYEXPENSES
FROM EMPLOYEE 
WHERE GENDER = 'M' AND WORKDEPT LIKE 'D%';

SELECT SUM((COALESCE(SALARY, 0) + COALESCE(COMM, 0))) AS TOTALSALARYEXPENSES
FROM EMPLOYEE 
WHERE GENDER = 'M' AND WORKDEPT LIKE 'D%';

-- Question 12
SELECT PHONENO, COMM, SALARY, (SALARY + SALARY * 0.5) AS SALARYINCREASE
FROM EMPLOYEE
WHERE COMM IS NULL AND PHONENO IS NOT NULL;

SELECT PHONENO, COMM, SALARY, (SALARY + SALARY * 0.5) AS SALARYINCREASE
FROM EMPLOYEE
WHERE (COMM IS NULL OR COMM = 0) AND PHONENO IS NOT NULL;

-- Question 13
SELECT COUNT(*)
FROM EMPLOYEE
WHERE SALARY - 2000 > (
	SELECT AVG(SALARY) 
	FROM EMPLOYEE 
		WHERE WORKDEPT = 'A04') 
AND WORKDEPT = 'A04';

-- Question 14
SELECT COUNT(*)
FROM EMPLOYEE 
WHERE HIREDATE <= '2023-12-31' AND LENGTH(LASTNAME) >= 5 AND HIREDATE >= '2023-01-01' AND LENGTH(LASTNAME) <= 8;

SELECT LASTNAME, HIREDATE
FROM EMPLOYEE
WHERE YEAR(HIREDATE) = '2023' AND LENGTH(LASTNAME) < 9 AND LENGTH(LASTNAME) > 4;

-- Question 15
SELECT COUNT(JOB), COUNT(DISTINCT IS_PARTTIME), COUNT(PHONENO), MIN(BIRTHDATE)
FROM EMPLOYEE;

-- Question 16
SELECT SUM(COMM), COUNT(COMM), AVG(COMM), (SUM(COMM)/COUNT(COMM)) AS TEST
FROM EMPLOYEE;

-- Question 17
SELECT COUNT(LASTNAME) 
FROM EMPLOYEE 
WHERE SALARY > (
	SELECT AVG(SALARY) 
	FROM EMPLOYEE 
	WHERE GENDER='F');

SELECT COUNT(*) 
FROM EMPLOYEE 
WHERE SALARY > (
	SELECT AVG(SALARY) 
	FROM EMPLOYEE 
	WHERE GENDER='F');

-- Question 18
SELECT COUNT(ORIGIN) 
FROM ROUTES
WHERE DESTINATION = 'HKG' AND FLIGHT_MINUTES >= 120 
OR ORIGIN NOT IN (SELECT IATA_CODE FROM AIRPORTS WHERE CONTINENT = 'EUROPE');


SELECT ORIGIN, DESTINATION
FROM ROUTES
WHERE DESTINATION = 'HKG' AND FLIGHT_MINUTES >= 120 
OR ORIGIN NOT IN (SELECT IATA_CODE FROM AIRPORTS WHERE CONTINENT = 'EUROPE');

-- Question 19
SELECT TICKET_ID, DEPARTURE 
FROM TICKETS
WHERE DAYS('2024-07-07')- DAYS(DEPARTURE) <= 7
ORDER BY DEPARTURE ASC;

SELECT TICKET_ID, DEPARTURE 
FROM TICKETS
WHERE DEPARTURE >= CURRENT DATE - 7 DAYS;

-- Question 20
SELECT ROUTE_CODE, COUNT(ROUTE_CODE) AS COUNT, COUNT(DISTINCT ROUTE_CODE) AS COUNT_DISTINCT
FROM TICKETS
GROUP BY ROUTE_CODE 
HAVING COUNT(TICKET_ID) <> COUNT(DISTINCT PASSENGER_ID);

-- Question 21
SELECT SUBSTRING(SEAT, 2) AS ROW_NUMBER, COUNT(*) AS POPULARITY
FROM TICKETS
GROUP BY SUBSTRING(SEAT, 2)
ORDER BY POPULARITY DESC;

-- Question 22
SELECT AVG(PRICE_BUSINESS) AS B, AVG(PRICE_PREMIUM) AS P, AVG(PRICE_ECONOMY) AS E
FROM FLIGHTS;

-- Question 23
SELECT COUNT(*)
FROM TICKETS
WHERE CLASS = 'B' 
  AND PASSENGER_ID IN (
    SELECT ID
    FROM PASSENGERS
    WHERE GENDER = 'F'
  )
  AND FLIGHT_ID IN (
    SELECT FLIGHT_ID
    FROM TICKETS
    WHERE DEPARTURE LIKE '2024-07-03%'
  );

 
SELECT COUNT(*)
FROM TICKETS
WHERE CLASS = 'B' AND DEPARTURE LIKE '2024-07-03%'
  AND PASSENGER_ID IN (
    SELECT ID
    FROM PASSENGERS
    WHERE GENDER = 'F'
  );
   
-- Question 24
SELECT MODEL, COUNT(MODEL), AVG(CREW_MEMBERS)
FROM AIRPLANES
GROUP BY MODEL
HAVING MODEL LIKE 'AIRBUS%';

SELECT AVG(CREW_MEMBERS)
FROM AIRPLANES
WHERE MODEL LIKE 'AIRBUS%';

-- Question 25
SELECT SUM((AIRPORT_TAX + LOCAL_TAX)) AS TOTAL_TAX
FROM TICKETS
WHERE PASSENGER_ID IN (
	SELECT ID 
	FROM PASSENGERS 
	WHERE COUNTRY = 'SOUTH KOREA');


-- EXTRA
SELECT CASE
        WHEN 
        AVG(CASE WHEN class = 'B' THEN price END) > AVG(CASE WHEN class = 'P' THEN price END)
        AND AVG(CASE WHEN class = 'P' THEN price END) > AVG(CASE WHEN class = 'E' THEN price END)
        THEN 'True'
        ELSE 'False'
    END AS pricing_rule
FROM tickets;

SELECT CLASS, AVG(PRICE)
FROM TICKETS
GROUP BY CLASS;




