CREATE TABLE CUSTOMER (
CUSTOMER CHAR(4) NOT NULL,
NAME VARCHAR(10) NOT NULL,
ZIPCODE SMALLINT);

INSERT INTO CUSTOMER VALUES
('A001','Felicity',20221),
('A002','Fionna',20222),
('A003','Francheska',20222),
('A004','Fatima',20222),
('A005','Faith',20223);

CREATE TABLE PRODUCT (
PRODUCT CHAR(4) NOT NULL,
NAME VARCHAR(10) NOT NULL);

INSERT INTO PRODUCT VALUES
('P001','Broccoli'),
('P002','Corn'),
('P003','Tomato'),
('P004','Lettuce'),
('P005','Potatoe'),
('P006','Onion'),
('P007','Garlic'),
('P008','Mushroom'),
('P009','Lemon');

CREATE TABLE PURCHASE (
CUSTOMER CHAR(4) NOT NULL,
PRODUCT CHAR(4) NOT NULL,
PRICE DECIMAL(5,3),
TAXES DECIMAL(5,3));

DROP TABLE PURCHASE;

INSERT INTO PURCHASE VALUES
('A001','P001',0.21,0.021),
('A001','P002',0.32,NULL),
('A001','P003',0.58,0.058),
('A001','P004',0.78,0.078),
('A002','P005',0.30,0.030),
('A002','P006',0.12,0.012),
('A002','P002',0.32,NULL),
('A002','P007',0.22,0.022),
('A004','P007',0.28,0.028),
('A004','P009',0.81,0.081),
('A004','P004',0.87,0.087),
('A004','P002',0.32,NULL),
('A006','P003',0.58,0.058),
('A006','P004',0.78,0.078),
('A006','P005',0.30,0.030);

SELECT C.ZIPCODE, P.NAME, SUM(PUR.PRICE + COALESCE(PUR.TAXES, 0)) AS AMOUNT_SOLD
FROM CUSTOMER C, PRODUCT P, PURCHASE PUR
WHERE C.CUSTOMER = PUR.CUSTOMER 
AND P.PRODUCT = PUR.PRODUCT
GROUP BY C.ZIPCODE, P.NAME;


SELECT C.ZIPCODE, P.NAME, SUM(PUR.PRICE + COALESCE(PUR.TAXES, 0)) AS AMOUNT_SOLD
FROM CUSTOMER C
INNER JOIN PURCHASE PUR
ON (C.CUSTOMER = PUR.CUSTOMER)
INNER JOIN PRODUCT P
ON (P.PRODUCT = PUR.PRODUCT)
GROUP BY C.ZIPCODE, P.NAME;

SELECT C.NAME, COUNT(PRODUCT) AS ITEMS
FROM CUSTOMER C
LEFT OUTER JOIN PURCHASE PUR
ON C.CUSTOMER = PUR.CUSTOMER
GROUP BY C.NAME;

SELECT C.NAME, COUNT(PRODUCT) AS ITEMS
FROM PURCHASE PUR
RIGHT OUTER JOIN CUSTOMER C
ON C.CUSTOMER = PUR.CUSTOMER
GROUP BY C.NAME;

SELECT C.NAME, P.NAME, COUNT(PUR.PRODUCT)
FROM CUSTOMER C
FULL OUTER JOIN PURCHASE PUR
ON (C.CUSTOMER = PUR.CUSTOMER)
FULL OUTER JOIN PRODUCT P
ON (P.PRODUCT = PUR.PRODUCT)
GROUP BY C.NAME, P.NAME 
ORDER BY C.NAME;

SELECT E.LASTNAME, D.DEPTNAME
FROM
(SELECT WORKDEPT, LASTNAME 
FROM EMPLOYEE 
WHERE LASTNAME IN ('Haigh', 'Fenwick', 'Wolstenholme')) E
INNER JOIN DEPARTMENT D
ON (E.WORKDEPT = D.DEPTNO);

SELECT DISTINCT A.WORKDEPT, A.LASTNAME, B.DEPTNAME
FROM EMPLOYEE A 
INNER JOIN DEPARTMENT B
ON (A.WORKDEPT = B.DEPTNO)
WHERE A.LASTNAME IN ('Haigh', 'Fenwick', 'Wolstenholme');


SELECT D.DEPTNO, D.DEPTNAME, E.JOB, E.FIRSTNME, E.MIDINIT, E.LASTNAME
FROM DEPARTMENT D
INNER JOIN EMPLOYEE E
ON (D.DEPTNO = E.WORKDEPT)
WHERE E.JOB = 'MANAGER'
ORDER BY DEPTNO;

SELECT COUNT(*)
FROM DEPARTMENT D
INNER JOIN EMPLOYEE E
ON (D.DEPTNO = E.WORKDEPT)
WHERE DEPTNAME LIKE '%SALES%';

SELECT D.DEPTNO, D.DEPTNAME, COUNT(*) AS AMOUNT
FROM DEPARTMENT D
INNER JOIN EMPLOYEE E
ON (D.DEPTNO = E.WORKDEPT)
WHERE D.DEPTNO LIKE 'A%' OR D.DEPTNO LIKE 'B%'
GROUP BY D.DEPTNO, D.DEPTNAME
ORDER BY AMOUNT DESC;

SELECT C.NAME, P.NAME
FROM CUSTOMER C, PRODUCT P
ORDER BY C.NAME, P.NAME;

SELECT A.FIRSTNME AS MANAGER, B.FIRSTNME, B.MIDINIT, B.LASTNAME
FROM EMPLOYEE A
INNER JOIN EMPLOYEE B
ON (A.WORKDEPT = B.WORKDEPT)
WHERE A.JOB = 'MANAGER'
AND A.GENDER = 'F'
AND B.JOB != 'MANAGER'
ORDER BY A.FIRSTNME;

SELECT COUNT(*)
FROM DEPARTMENT D
INNER JOIN EMPLOYEE E
ON (D.DEPTNO = E.WORKDEPT)
WHERE D.DEPTNAME = 'SALES DIVISION HQ';

SELECT COUNT(*)
FROM DEPARTMENT A 
INNER JOIN DEPARTMENT B
ON (SUBSTR(A.DEPTNO, 1, 1) = SUBSTR(B.DEPTNO, 1, 1))
INNER JOIN EMPLOYEE C
ON (B.DEPTNO = C.WORKDEPT)
WHERE A.DEPTNAME = 'SALES DIVISION HQ';

SELECT EMPNO 
FROM EMPLOYEE
WHERE SALARY = (SELECT MAX(SALARY) FROM EMPLOYEE);

SELECT B.NAME, SUM(A.PRICE) AS AMOUNT
FROM PURCHASE A 
INNER JOIN PRODUCT B 
ON (A.PRODUCT = B. PRODUCT)
GROUP BY B.NAME
ORDER BY AMOUNT DESC;


----------
SELECT b.NAME, SUM(PRICE) AS AMOUNT
FROM PURCHASE a INNER JOIN PRODUCT b
ON (a.PRODUCT = b.PRODUCT)
GROUP BY b.NAME
HAVING SUM(PRICE) = (SELECT SUM(PRICE)
FROM PURCHASE
GROUP BY PRODUCT
ORDER BY 1 DESC
LIMIT 1);

-- BETTER BELOW

SELECT b.NAME, SUM(PRICE)
FROM PURCHASE a INNER JOIN PRODUCT b
ON (a.PRODUCT = b.PRODUCT)
GROUP BY b.NAME
HAVING SUM(PRICE) >= ALL (SELECT SUM(PRICE) -- CAN ALSO USE ANY INSTEAD FOR DIFFERENT RESULT
FROM PURCHASE
GROUP BY PRODUCT);


SELECT 'FRUITS' AS TYPE, COUNT(*) AS ITEMS, SUM(PRICE + COALESCE(TAXES, 0)) AS AMOUNT
FROM PURCHASE A
INNER JOIN PRODUCT B
ON (A.PRODUCT = B.PRODUCT)
WHERE B.NAME IN ('Lemon', 'Tomato')
UNION ALL 
SELECT 'VEGGIES' AS TYPE, COUNT(*) AS ITEMS, SUM(PRICE + COALESCE(TAXES, 0)) AS AMOUNT
FROM PURCHASE A
INNER JOIN PRODUCT B
ON (A.PRODUCT = B.PRODUCT)
WHERE B.NAME NOT IN ('Lemon', 'Tomato');



-------














































