-- Exercises

-- 1. Return first name and email of female workers in tools dept with sal > 110000 -- 
select * from employees;

select first_name, email from employees where department = 'Tools' and salary > 110000;


-- 2. returns first_name and hire date of employees with salary > 165000 as well as(or) 
-- those male emps works in sports dept --
select first_name, hire_date from employees where salary > 165000 or (gender="M" AND department="Sports");


-- 3. returns details of male emps works in auto dept and with salary<40000 and sal>100000 as well as females -- 
-- those works in tools dept --
select * from employees where gender="M" and salary between 40000 and 100000 or (gender="F" and department="Tools");


-- 4. Return first_name and hire_date of employees who were hired during Jan 1st 2002 and Jan 1st 2004.
select first_name, hire_date from employees where hire_date between '2002-01-01' and '2004-01-01';

