-- WRITE SELECT STMT THAT RETURNS ALL EMPLOYEES THOSE WORKS IN ELECTRONICS DIVISION.
select * from employees where department in
	(select department from departments where division = 'Electronics');

--  SELECT EMPLOYEES THOSE WORK IN ASIA OR CANADA AND THOSE MAKE OVER 130000.
use course_data;
select * from employees where salary > 130000 and region_id in
	(select region_id from regions where country in ('Canada', 'Asia'));
    
-- SELECT FIRST_NAME,department,and salary diffrence of each employee with highest paid employee where each employees
-- are from region either asia or canada
select first_name, department, (select max(salary) from employees) as max_salary, ((select max(salary) from employees)-salary) as max_salary
    from employees where region_id in
	(select region_id from regions where country in ('Asia', 'Canada'));
    
-- select salaries from employees table that appears more frequently.(ie mode of salary column).
-- and also if there is multiple salaries which have same no of ocurences then select the highest one.
SELECT salary FROM employees
GROUP BY salary 
HAVING COUNT(*)>=ALL(SELECT count(*) FROM employees GROUP BY salary)
order by salary desc limit 1;


-- CREATE TABLE dupes(
-- id integer,name VARCHAR(30)
-- );

-- insert into dupes values(1,'FRANK');
-- insert into dupes values(2,'FRANK');
-- insert into dupes values(3,'ROBERT');
-- insert into dupes values(4,'ROBERT');
-- insert into dupes values(5,'SAM');
-- insert into dupes values(6,'FRANK');
-- insert into dupes values(7,'PETER');

SELECT * FROM dupes;

-- 1. select distinct names with their id.
select id, name from dupes group by name;

-- compute the average of all the employees that we have in our company but only to exclude
-- the minimum and maximum salaries of the employee.

select round(avg(salary)) from employees where salary not in
	((select min(salary) from employees), 
    (select max(salary) from employees));

-- SO HERE V EXCLUDE THE MIN AND MAX SALARY USING NOT IN OPERATOR.

-- find employee with second highest salary
select max(salary) as second_highest_salary from employees where salary not in 
	(select max(salary) from employees);

-- find employees work in same department of Feliks but exclude Feliks.
select * from employees where department in
	(select department from employees where first_name = 'Feliks')
    and first_name!='Feliks';
    
-- a query to display the employee number and name( first name and last name ) for all employees 
-- who work in a department with any employee whose name contains a T.

select employee_id, concat(first_name, ' ', last_name) as full_name from employees
	where department in
		(select department from employees 
			where concat(first_name, ' ', last_name) like '%T%');

-- Find EMPLOYEES WITH SALARY > AVERAGE SALARY USING SUBQUERY.
select * from employees where salary > 
	(select avg(salary) from employees);

-- Write a query to display the employee number, name( first name and last name ),
-- and salary for all employees who earn more than the average salary 
-- and who work in a department with any employee with a J in their name

select employee_id, concat(first_name, '', last_name) as full_name from employees where salary 
	> (select avg(salary) from employees) and department in 
	  (select department from employees where concat(first_name, '', last_name) like '%J%');

select * from employees;

-- Display the employee name( first name and last name ), employee id, and job 
-- title for all employees whose department location is Toronto.
select concat(first_name, '', last_name) from employees
	where department in 
		(select department from departments where location in 
		(select location from locations where location = 'Toronto'));
	
-- write a query to display the employee number, name( first name and last name ) and job title for 
-- all employees whose salary is smaller than any salary of those employees whose job title is MK_MAN.
select employee_id, first_name from table1 where salary
	< any (select salary from table2 where job_title = 'MK_MAN');
