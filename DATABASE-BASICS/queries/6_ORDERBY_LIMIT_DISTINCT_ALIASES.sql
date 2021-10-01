-- ORDER BY, LIMIT, DISTINCT, ALIASES
---------------------------------------

-- retrieve unique departments in the employee table
SELECT distinct department from employees;

-- Order by 1 means ordering based on the first column in the table
SELECT * from departments order by 1;

-- Order by 2 means ordering based on the SECOND column in the table
SELECT * FROM departments ORDER BY 2;

-- LIMIT THE NO OF RECORDS - LIMIT 10 means only 10 records are returned.
select distinct department from employees ORDER BY 1 limit 10;

-- ORDER BY, LIMIT PRACTICE-- 
SELECT * FROM regions ORDER BY region LIMIT 3;
SELECT * FROM employees ORDER BY region_id LIMIT 50;
select first_name, last_name from employees order by hire_date LIMIT 10;

-- ALIASES


