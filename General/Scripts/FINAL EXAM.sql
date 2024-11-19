--Isabel E. Robertson is one of the eldest passengers who 
--took a flight on July 1st, 2024, and was seated in row 
--number 10.

SELECT FIRSTNME, MIDINIT, LASTNAME, YEAR(CURRENT DATE) - YEAR(BIRTH_DATE) AS AGE, DATE(DEPARTURE), SEAT
FROM PASSENGERS A
INNER JOIN TICKETS B
ON (A.ID = B.PASSENGER_ID)
WHERE YEAR(CURRENT DATE) - YEAR(BIRTH_DATE) =
(SELECT MAX(YEAR(CURRENT DATE) - YEAR(BIRTH_DATE)) FROM PASSENGERS)
AND B.SEAT LIKE '%10%'
AND DATE(B.DEPARTURE) = '2024-07-01'
AND FIRSTNME = 'ISABEL';

SELECT FIRSTNME, MIDINIT, LASTNAME, YEAR(CURRENT DATE) - YEAR(BIRTH_DATE) AS AGE, DATE(DEPARTURE), SEAT
FROM PASSENGERS A
INNER JOIN TICKETS B
ON (A.ID = B.PASSENGER_ID)
WHERE FIRSTNME = 'Isabel'
AND MIDINIT = 'E'
AND LASTNAME = 'Robertson';








SELECT COUNT(DISTINCT ROUTE_CODE)
FROM ROUTES a 
INNER JOIN AIRPORTS b1
ON (ORIGIN=b1.IATA_CODE)
INNER JOIN ROUTES b2
ON (Blank 7=b2.Blank 8)
WHERE b1.CONTINENT <> b2.CONTINENT
AND b1.CONTINENT='Blank 9'
AND a.FLIGHT_MINUTES > 660



--On July 3rd, several Airbus plane models departed from 
--their airports. Airplane registration number IE05747 
--is one of these planes.
SELECT AIRCRAFT_REGISTRATION, MODEL, DATE(C.DEPARTURE)
FROM AIRPLANES A 
INNER JOIN FLIGHTS B 
ON (A.AIRCRAFT_REGISTRATION = B.AIRPLANE)
INNER JOIN TICKETS C 
ON (B.FLIGHT_ID = C.FLIGHT_ID)
WHERE A.MODEL = 'IE05747';

SELECT COUNT(DISTINCT ROUTE_CODE)
FROM ROUTES a INNER JOIN AIRPORTS b1
ON (ORIGIN=b1.IATA_CODE)
INNER JOIN AIRPORTS b2
ON (DESTINATION=b2.IATA_CODE)
WHERE b1.CONTINENT <> b2.CONTINENT
AND b1.CONTINENT='DESTINATION'
AND a.FLIGHT_MINUTES > 660;



--Airport and local taxes are paid to the arriving local 
--city government. Display the total amount of airport and
-- local taxes paid for routes arriving at any airport in 
--Europe. Consider only time zones CUT+1 and CUT+2.
SELECT C.CONTINENT, SUM(A.AIRPORT_TAX), SUM(A.LOCAL_TAX), SUM(A.TOTAL_AMOUNT)
FROM TICKETS A 
INNER JOIN ROUTES B 
ON (A.ROUTE_CODE = B.ROUTE_CODE)
INNER JOIN AIRPORTS C 
ON (B.DESTINATION = C.IATA_CODE)
WHERE C.CONTINENT = 'EUROPE'
GROUP BY C.CONTINENT;

--I’m proud to announce that IE Airlines will include 
--Santa International Airport at the North Pole in our 
--flights. The IATA_CLODE will be ‘SCA’. Santa Claus is 
--coming to town!
--Could you tell us how many routes we should add if we 
--want to cover round trips for all our Asian airports?
SELECT IATA_CODE
FROM AIRPORTS
WHERE CONTINENT = 'ASIA';

--The more seats a plane has, the bigger it is considered 
--to be. Airplane registration number IE26782 is one of 
--the biggest planes we have in our company.
SELECT AIRCRAFT_REGISTRATION, COALESCE(SEATS_BUSINESS, 0) + COALESCE(SEATS_PREMIUM, 0) + COALESCE(SEATS_ECONOMY, 0) AS SEATSTOTAL
FROM AIRPLANES 
WHERE COALESCE(SEATS_BUSINESS, 0) + COALESCE(SEATS_PREMIUM, 0) + COALESCE(SEATS_ECONOMY, 0) =
(SELECT MAX(COALESCE(SEATS_BUSINESS, 0) + COALESCE(SEATS_PREMIUM, 0) + COALESCE(SEATS_ECONOMY, 0)) FROM AIRPLANES);

SELECT AIRCRAFT_REGISTRATION, COALESCE(SEATS_BUSINESS, 0) + COALESCE(SEATS_PREMIUM, 0) + COALESCE(SEATS_ECONOMY, 0) AS SEATSTOTAL
FROM AIRPLANES 
WHERE AIRCRAFT_REGISTRATION = 'IE26782';

--For the newest (youngest) plane we have, show the total 
--amount we gained from the tickets we sold.
--RESULT: 790,777.10 Euros

SELECT YEAR(CURRENT DATE) - YEAR(BUILD_DATE) AS AGE, BUILD_DATE, AIRCRAFT_REGISTRATION
FROM AIRPLANES
ORDER BY AGE ASC;

-- YOUNGEST = IE98994
SELECT AIRCRAFT_REGISTRATION, COUNT(TICKET_ID)
FROM AIRPLANES A
INNER JOIN FLIGHTS B 
ON (A.AIRCRAFT_REGISTRATION = B.AIRPLANE)
INNER JOIN TICKETS C 
ON (B.FLIGHT_ID = C.FLIGHT_ID)
GROUP BY A.AIRCRAFT_REGISTRATION
HAVING A.AIRCRAFT_REGISTRATION = 'IE98994';

SELECT COUNT(TICKET_ID)
FROM AIRPLANES A
INNER JOIN FLIGHTS B 
ON (A.AIRCRAFT_REGISTRATION = B.AIRPLANE)
INNER JOIN TICKETS C 
ON (B.FLIGHT_ID = C.FLIGHT_ID)
WHERE A.AIRCRAFT_REGISTRATION = 'IE98994'; 

SELECT 




--HND
SELECT DAYNAME(DEPARTURE)
FROM TICKETS A 
INNER JOIN 
ROUTES B 
ON (A.ROUTE_CODE = B.ROUTE_CODE)
WHERE B.ORIGIN = 'HND';

--For flight IE0017, show the number of economy seats that 
--were not sold.
--RESULT: 81,770

SELECT COUNT(*)
FROM AIRPLANES A 
FULL OUTER JOIN FLIGHTS B 
ON (A.AIRCRAFT_REGISTRATION = B.AIRPLANE)
LEFT OUTER JOIN TICKETS C 
ON (B.FLIGHT_ID = C.FLIGHT_ID)
WHERE B.FLIGHT_ID = 'IE0017';

SELECT R.ROUTE_CODE
FROM ROUTES R LEFT OUTER JOIN TICKETS T
ON (T.ROUTE_CODE=R.ROUTE_CODE)
WHERE TICKET_ID IS NULL;


--Show the number of Spanish local country routes whose 
--distance between origin and destination airports is at 
--least 200 kilometers. We consider local country routes 
--for all routes departing and arriving in the same country.

SELECT COUNT(*)
FROM ROUTES A
INNER JOIN AIRPORTS B 
ON (A.ORIGIN = B.IATA_CODE)
INNER JOIN AIRPORTS C 
ON (A.DESTINATION = B.IATA_CODE)
WHERE B.COUNTRY = 'SPAIN'
AND C.COUNTRY = 'SPAIN'
AND A.DISTANCE >= 200;


SELECT *
FROM ROUTES A
LEFT JOIN AIRPORTS B 
ON (A.ORIGIN = B.IATA_CODE)
LEFT JOIN AIRPORTS C 
ON (A.DESTINATION = B.IATA_CODE)
WHERE ;


SELECT *
FROM ROUTES A
INNER JOIN AIRPORTS B 
ON (A.ORIGIN = B.IATA_CODE)
;