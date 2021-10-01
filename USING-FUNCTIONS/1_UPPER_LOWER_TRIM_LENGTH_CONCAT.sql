-- UPPER and LOWER Functions
SELECT UPPER(first_name) as 'first name', lower(last_name) as 'last name' from employees;
select upper(department) as dept from employees;

-- LENGTH() Functions 
SELECT length(department) from employees LIMIT 10;

-- TRIM() FUNCTIONS
-- Trim extra spaces from a string and returns the length of characters.
SELECT length('    data  '); 
SELECT length(trim('    data  '));

-- CONCATENATING THE COLUMNS USING CONCAT()
SELECT concat(first_name,' ', last_name) as 'full name' from employees;

-- Example: 2
select concat(first_name,' ',last_name,' - ', salary) as 'employee' from employees;


