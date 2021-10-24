		-- SUBQUERIES --
-- we can use subqueries in the where cluase
-- subqueries are the data sources from which we gets the data

-- GET DEPARTMENTS FROM EMPLOYEES TABLE THAT R NOT PRESENT IN DEPARTMENTS TABLE.
use course_data;

select distinct department from employees 
	where department 
	not in (select department from departments) 
    order by department;
    
-- We can also use subqueries in a FROM Clause.BT NEED TO GIVE ALIASE FOR THE SUBQUERY ELSE THROWS ERROR
-- (ERROR: subquery in FROM must have an alias)

select * from(select * from employees where hire_date between '2010-01-01' and '2012-01-01') as alias;

-- we can also select particular columns from the result of subquery using the alias.
-- Eg: Write a querty to return employee with email ending 'com' and
-- select first_name, last_name, email from the result using subquery.

select first_name as FIRST_NAME, last_name AS LAST_NAME, email AS EMAIL 
from (select * from employees where email like '%com') as final_data;

--  using multiple subqueries

-- HERE WE USE ALIAS BEFORE COLUMN NAME TO SPECIFY FROM WHICH SUBQUERY OR DATA SOURCE WHERE V NEED TO GET THE DATA.
-- below query there is employee_name and salary in both subquery. so we need to separtely specify from 
-- which we need the data. SO USE ALIASES FOR THE BOTH THE DATA SOURCES AND LATER USE IT IN QUERY.
-- try using aliases while implementing mulitple subqueries.

select * from employees;
select * from professor;

-- Example: select last_name from either of employees or professor table ?
select distinct sub2.last_name from 
	(select last_name from employees) as sub1, 
    (select last_name from professor) as sub2
    order by last_name;
-- above we select last_name from professot table using alias

-- SELECT DISTINCT DEPARTMENTS FROM EITHER OF employees table or department table using subquery.
select distinct sub2.department from 
	(select department from employees) as sub1, 
    (select department from departments) as sub2
    order by department;

select * from professor;

-- Example - 3 - GET last name and salary from either of one table.
select distinct sub1.last_name, sub1.salary from 
	(select last_name, salary from employees where hire_date between '2010-01-01' and '2011-01-01') as sub1,
    (select last_name, salary from professor where salary > 90000) as sub2
    order by salary;
    
    
    
