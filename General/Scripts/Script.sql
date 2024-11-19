SELECT EDLEVEL, COUNT(*) AS COUNT
FROM EMPLOYEE
WHERE IS_EXTERNAL IS TRUE
GROUP BY EDLEVEL
ORDER BY COUNT DESC
LIMIT 1;

SELECT FIRSTNME, HIREDATE, IS_PARTTIME, BONUS
FROM EMPLOYEE
WHERE HIREDATE > '2020-01-01' AND IS_PARTTIME IS FALSE AND BONUS IS NULL;

SELECT COUNT(DISTINCT WORKDEPT)
FROM (SELECT * FROM EMPLOYEE WHERE SALARY > 50000);

SELECT FIRSTNME, HIREDATE
FROM EMPLOYEE
WHERE FIRSTNME LIKE 'J%'
ORDER BY HIREDATE ASC;

SELECT COUNT(*)
FROM EMPLOYEE
WHERE WORKDEPT IN 
(SELECT DEPTNO 
FROM DEPARTMENT 
WHERE BUDGET BETWEEN 500000 AND 1000000);

SELECT COUNT(DISTINCT PHONENO)
FROM EMPLOYEE
WHERE IS_PARTTIME IS TRUE;

SELECT COUNT(*)
FROM EMPLOYEE
WHERE EMAIL IS NOT NULL AND PHONENO IS NULL;

SELECT SUM(COALESCE(SALARY, 0) + COALESCE(BONUS, 0) + COALESCE(COMM, 0))
FROM EMPLOYEE
WHERE HIREDATE >= '2021-01-01';

SELECT FIRSTNME, HIREDATE, (COALESCE(SALARY, 0) + COALESCE(BONUS, 0) + COALESCE(COMM, 0)) AS TOTAL_SALARY
FROM EMPLOYEE
WHERE HIREDATE >= '2021-01-01'
ORDER BY HIREDATE ASC;

SELECT FIRSTNME, WORKDEPT, COMM
FROM EMPLOYEE
WHERE SALARY IN (SELECT COALESCE(SALARY, 0)
FROM EMPLOYEE
ORDER BY SALARY DESC
LIMIT 10)
ORDER BY COMM ASC;

SELECT COMM
FROM (SELECT *
FROM EMPLOYEE
WHERE SALARY IS NOT NULL AND COMM IS NOT NULL
ORDER BY SALARY DESC 
LIMIT 10)
ORDER BY COMM ASC
LIMIT 1;

SELECT WORKDEPT, SALARY, COMM
FROM EMPLOYEE
WHERE SALARY IS NOT NULL AND COMM IS NOT NULL
ORDER BY SALARY DESC 
LIMIT 10;

SELECT COUNT(*)
FROM EMPLOYEE
WHERE MIDINIT = '';

SELECT SALARY, HIREDATE
FROM EMPLOYEE
WHERE YEAR(HIREDATE) = 2022 AND SALARY IS NOT NULL
ORDER BY SALARY DESC
LIMIT 1;

