-- SUBQUERIES IN BETWEEN CLAUSE

-- Example -1
-- select employee details with salary in range of min(sal) and 6000.
select * from employees where salary 
	between (select min(salary) from employees) and 80000;
    
-- Example - 2
-- select fruit import data where supply is in range of minimum supply and 15000.
SELECT * FROm fruit_imports where supply
	between (select min(supply) from fruit_imports) and 15000;
    
-- Get employees of country 'United States'
use course_data;
select * from employees;
select * from regions;

select * from employees where region_id in
	(select region_id from regions where country = 'United States')
    order by first_name;

-- SELECT ALL EMPLOYEES WHOSE REGION ID GREATER THAN THE REGION ID RETURNED FROM SUBQUERY.
select * from employees where region_id>(select region_id from regions where country = 'Asia' limit 1);

----------------- ANY OPERATOR ------------------------
-- ANY OPERATOR RETURNS TRUE IF ANY OF THE SUBQUERY VALUE MEETS THE WHERE CONDITION IN OUTER QUERY.
-- IE IF EMPLOYEES RECORDS HAVE REGION ID > ANY OF THE REGION ID RETURNED FROM SUBQUERY.THEN THAT WHERE CONDITION EVALUATES TO TRUE.
-- FOR EG: IF SUBQUERY RETURNS REGIONID 4 AND 5,AND IF EMPLOYEE RECORDS HAVE REGION ID 4,5,8 AND 9.
-- THEN WHERE CONDITION EVALUATES TO TRUE.
SELECT * FROM employees WHERE region_id > ANY
	(SELECT region_id FROM regions where country = 'Asia');

select * from professor;

-- get employee salaries which is greater than salary obtained from professor table

select * from employees where salary > ANY 
	(select salary from professor where hire_date between 2005-01-01 and 2008-01-01);


-- ALL OPERATOR-----------------
-- all operator returns true if all of the subquery values meets the condition.
-- subquery returns region id 4 and 5.and outer query returns employee ecords with regionid >4and5
-- here output will have records with region id > 4 and 5.

-- get all employee details whose region id > region id of country asia
use course_data;
select * from employees where region_id > ALL (select region_id from regions where country="Asia");


-- get all employee details whose salary > salary of professors working in Math and Astronomy department

select * from employees where salary > ALL
	(select salary from professor where department in ('Math', 'Astronomy'));
    