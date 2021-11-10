-- USING STRING FUNCTIONS

-- SUBSTRING()
-- to extract a set of characters from a string, use substring()
-- EXTRACT THE string FROM DEPATRMENT COLumn FROM POSITION 1 FOR A TOTAL OF 4 CHARACTERS  

select substring(department from 1 for 4) as name from employees;

SELECT CONCAT(SUBSTRING(first_name FROM 1 FOR 1),' ',SUBSTRING(last_name FROM 1 FOR 1))
AS Initals, first_name,last_name FROM employees;

SELECT * FROM departments;

SELECT SUBSTRING(division FROM 1 FOR 3) AS division FROM departments; 

-- REPLACE()
-- to replace a string or substring with another string in a column
SELECT department, REPLACE(department, 'Clothing', 'Attire') FROM departments;
	
-- POSITION()
-- TO FIND POSITION OF A CHARACTER IN A STRING 
SELECT * FROM employees;

SELECT email, substring(email FROM position('@' in email) + 1) AS "DOMAIN" from employees;

-- Example

select department, position('S' in department) as 'POSITION' from depasrtments;

select * from regions;

select region, position('C' in region) as 'POSITION' FROM regions;


-- COALESCE()
-- REPLACES NULL IN A COLUMN WITH A STRING.
select employee_id, email, coalesce(email, 'NO DATA') AS 'Formatted' from employees;

select * from departments;

select division, coalesce(division, 'NO DIVISION') AS 'Formatted' FROM departments;





