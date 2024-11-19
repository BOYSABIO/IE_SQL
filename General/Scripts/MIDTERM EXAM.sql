-- QUESTION #2: How many employees are not part time workers? (Please include employees with null values in part-time attribute).
SELECT COUNT(*)
FROM EXAM_EMPLOYEE
WHERE IS_PARTTIME IS FALSE OR IS_PARTTIME IS NULL;

-- QUESTION #3: [TRUE/FALSE] We have a curious statement: [ SELECT count(*), count(DISTINCT EMPNO) FROM .... ]. When we launch it in the employee table, we discovered that the output for all columns is exactly the same! We think that the only reason why count(*) and count(distinct empno) are the same is because there are no null values in the employee column.
SELECT count(*), count(DISTINCT EMPNO) 
FROM EXAM_EMPLOYEE;

--QUESTION #4: Show the age of the youngest consultant 
-- working in the company with a master's degree.
SELECT EDLEVEL, (YEAR(CURRENT_DATE) - YEAR(BIRTHDATE)) AS AGE
FROM EXAM_EMPLOYEE
WHERE EDLEVEL = 'Master Degree'
ORDER BY BIRTHDATE DESC;

--QUESTION #5: [YES/NO] Does the Washington sales division 
--headquarters have enough budget to satisfy all their 
--employee's expenses?
SELECT DEPTNO, BUDGET
FROM EXAM_DEPARTMENT
WHERE DEPTNAME = 'SALES DIVISION HQ' AND LOCATION = 'WASHINGTON DC';

SELECT SUM(COALESCE(SALARY, 0) + COALESCE(BONUS, 0) + COALESCE(COMM, 0)) AS TOTAL_EXPENSE
FROM EXAM_EMPLOYEE
WHERE WORKDEPT = 'D00';

--QUESTION #6: How many different education levels do female 
workers have?

SELECT COUNT(DISTINCT EDLEVEL)
FROM EXAM_EMPLOYEE
WHERE GENDER = 'F';

SELECT DISTINCT EDLEVEL
FROM EXAM_EMPLOYEE
WHERE GENDER = 'F';

--QUESTION #7: Christmas is near, and the company decided 
--to give a 1000 Euros bonus to receptionists. 
--They used the following SET clause in their UPDATE statement:
-- [ SET BONUS=BONUS + 1000 ]. 
--PLEASE DO NOT TRY THIS IN YOUR LAB. 
--You will change the current data set which might jeopardize 
--the other answers of this exam. Can you tell us how many 
--receptionists got this money for Christmas?

SELECT COUNT(*)
FROM EXAM_EMPLOYEE
WHERE BONUS IS NOT NULL AND JOB = 'RECEPTIONIST';

--QUESTION #8: [TRUE/FALSE] The following combination in a SQL 
--statement will NOT generate an SQL Error:
SELECT JOB, AVG(SALARY)  
FROM EXAM_EMPLOYEE
WHERE LOWER(JOB) BETWEEN 'c' AND 'e'
GROUP BY JOB;

--QUESTION #9: [TRUE/FALSE] Both expressions shows 
--approximately how old the employee was when he got hired: 
--[ YEAR(hiredate)-YEAR(birthdate) ], [ YEAR(hiredate-birthdate) ]. 
--We can assure you that both expressions always ends with 
--exactly the same result.

SELECT YEAR(HIREDATE - BIRHDATE) AS AGE
FROM EXAM_EMPLOYEE;


--QUESTION #10: Assuming that IS_PARTTIME null values are 
--considered part-time workers, how many part-time female 
--workers does the company have earning less than 20,000 Euros?

SELECT COUNT(*)
FROM EXAM_EMPLOYEE
WHERE (IS_PARTTIME IS TRUE OR IS_PARTTIME IS NULL) 
AND GENDER = 'F' 
AND (COALESCE(SALARY, 0) + COALESCE(BONUS, 0) + COALESCE(COMM, 0)) < 20000;

SELECT COUNT(*)
FROM EXAM_EMPLOYEE
WHERE (IS_PARTTIME IS TRUE OR IS_PARTTIME IS NULL) 
AND GENDER = 'F' 
AND (SALARY + BONUS + COMM) < 20000;


--QUESTION #11: [TRUE/FALSE] Using the following function: 
--[ REPLACE(FIRSTNME||LASTNAME,'m','*') ], 
--we can assure that if we use this other one: 
--[ REPLACE(FIRSTNME,'m','*')||REPLACE(LASTNAME,'m','*') ], 
--the output will be different for some rows. COME BACK


--QUESTION #12: The ranking for education level from the 
--highest to the lowest is the following:
--   1-PhD Doctor
--   2-Master Degree
--   3-Bachelor
   4-High School
   5-Primary Education
--Which is the highest education level for receptionists?

SELECT EDLEVEL, COUNT(*)
FROM EXAM_EMPLOYEE
WHERE JOB = 'RECEPTIONIST'
GROUP BY EDLEVEL;

--QUESTION #13: The company considers extra salary as the 
--total amount an employee receives besides the salary. 
--In our case, an employee's extra salary will be his bonus 
--plus his commission. How many sales women have an extra 
--salary higher than the average bachelor's salary extra?

-- SALES WOMEN EXTRA > AVERAGE BACHELORS EXTRA

SELECT COUNT(*)
FROM EXAM_EMPLOYEE
WHERE JOB = 'SALESMAN ADVISOR' 
AND GENDER = 'F'
AND (COALESCE(BONUS, 0) + COALESCE(COMM, 0)) >
(SELECT AVG(COALESCE(BONUS, 0) + COALESCE(COMM, 0))
FROM EXAM_EMPLOYEE); -- DOUBLE CHECK

SELECT COUNT(*)
FROM EXAM_EMPLOYEE
WHERE JOB = 'SALESMAN ADVISOR' 
AND GENDER = 'F'
AND (BONUS + COMM) >
(SELECT AVG(BONUS + COMM)
FROM EXAM_EMPLOYEE); -- DOUBLE CHECK

--QUESTION #14: How many part-time workers have a greater 
--salary than the average full-time worker's salary? 
--(Please exclude employees with part-time attribute set to NULL).
-- PARTIME SALARY > AVG(FULLTIMEWORKER) SAID TO NOT USE COALESCE

SELECT COUNT(*)
FROM EXAM_EMPLOYEE
WHERE IS_PARTTIME IS NOT NULL 
AND IS_PARTTIME IS TRUE
AND SALARY >
(SELECT AVG(SALARY)
FROM EXAM_EMPLOYEE
WHERE IS_PARTTIME IS NOT NULL 
AND IS_PARTTIME IS FALSE);

--QUESTION #15: The email for each employee is created using 
--the following algorithm: [ first name.last name@acme.com]. 
--For example: Quinn Bowles will have quinn.bowles@acme.com as 
--its email. But this is not the case for many employees. 
--Some have their first name shortened, some have their last 
--name sortened, and others have both shortened. How many male 
--employees do not have their last name shorten?

SELECT COUNT(*)
FROM EXAM_EMPLOYEE
WHERE GENDER = 'M'
AND LOWER(FIRSTNME) || '.' || LOWER(LASTNAME) || '@acme.com' = EMAIL;

--QUESTION #16: The law says that companies can not hire 
--employees younger than 18. The Human Resources department 
--claimed that they are following this law strictly. 
--However, there must be some inconsistent data because we can 
--see that some employees were hired when they were younger 
--than 18. Could you spot them and tell us how many part-time 
--employees were hired when they were younger than 18?

SELECT IS_PARTTIME, (YEAR(HIREDATE) - YEAR(BIRTHDATE)) AS HIRED
FROM EXAM_EMPLOYEE
WHERE IS_PARTTIME IS TRUE 
AND (YEAR(HIREDATE) - YEAR(BIRTHDATE)) < 18;

SELECT COUNT(*)
FROM EXAM_EMPLOYEE
WHERE IS_PARTTIME IS TRUE 
AND (YEAR(HIREDATE) - YEAR(BIRTHDATE)) < 18;


--QUESTION #17: In a company, middle initials are frequently 
--repeated on the employee's table. Could you show us the 
--frequency for the most frequent male middle initials? Let me
-- give you an example just for clarification. Suppose that M 
--is the most frequent male middle initial, and there are 10 
--male employees whose middle initial matches M. Your answer 
--should be 10 for this exercise.

SELECT MIDINIT, COUNT(*) AS COUNT
FROM EXAM_EMPLOYEE
WHERE GENDER = 'M'
GROUP BY MIDINIT
ORDER BY COUNT DESC;

SELECT COUNT(*)
FROM EXAM_EMPLOYEE
WHERE MIDINIT = 'E';



























