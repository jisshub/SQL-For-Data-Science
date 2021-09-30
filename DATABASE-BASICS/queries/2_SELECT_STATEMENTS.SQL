-- select * from employees;

-- select first_name, last_name from employees;
-- use course_data;

select * from regions;

-- 1. GET employees in sports department-- 

SELECT * FROM employees where department ="Sports";

-- Using like operator with select -- 

SELECT * FROM employees WHERE department like 'f%nit%e';

SELECT * FROM employees WHERE first_name like 'S%ka';

-- Using conditions with WHERE clause-- 
SELECT * FROM employees WHERE salary > 90000;

-- Another select clause usage-- 
SELECT department from employees;

SELECT department FROM departments;

-- below query returns error since department column reside in both tables-- 
-- so to get department data we have to specifically provide the table from which we need the data-- 
select department from employees, departments;

-- we get department data from employees table since we specifically access department from employees table using
-- dot operator-- 
select employees.department from employees,departments;

select departments.department from departments, employees;

-- using aliases in select query-- 
SELECT d.department from employees AS e, departments AS d;
