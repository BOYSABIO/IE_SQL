-- You have two tables that share the column department id

-- Find all departments at the location whos id is 1700
SELECT 
    *
FROM
    departments
WHERE
    location_id = 1700;


-- Find all the employees that belong to the location 1700 using the department id list 
   SELECT 
    employee_id, first_name, last_name
FROM
    employees
WHERE
    department_id IN (1 , 3, 8, 10, 11)
ORDER BY first_name , last_name;


-- BETTER TO JUST DO IT ALL THIS WAY
SELECT employee_id, first_name, last_name
FROM employees
WHERE department_id IN (SELECT department_id
FROM departments
WHERE location_id = 1700)
ORDER BY first_name , last_name;