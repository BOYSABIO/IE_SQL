SELECT min(COMM)
FROM EXAM_EMPLOYEE
WHERE COMM IS NOT NULL 
GROUP BY EDLEVEL;

-- QUESTION #3: Show the first not null system administrator's salary if you order by their last name and middle 
-- initial letter, both on descending mode.
SELECT JOB, SALARY
FROM EXAM_EMPLOYEE
WHERE JOB like 'SYSTEM ADMIN' AND SALARY IS NOT NULL
ORDER BY LASTNAME DESC, MIDINIT DESC
LIMIT 1;

-- QUESTION #4: How many employees are sharing a phone for those departments belonging to the sales division. 
-- For your information, a division is a group of departments that has the same initial first letter.

SELECT PHONENO , count(*) AS NUMBER_OF_EMPLOYEES
FROM EXAM_EMPLOYEE
WHERE WORKDEPT LIKE 'D%' AND PHONENO IS NOT NULL
GROUP BY PHONENO
HAVING count(*) > 1;

SELECT SUM(PHONENO)
  FROM (SELECT COUNT(PHONENO) PHONENO
          FROM EXAM_EMPLOYEE
         WHERE WORKDEPT LIKE 'D%'
         GROUP BY PHONENO
        HAVING COUNT(PHONENO) > 1);
