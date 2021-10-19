SELECT * FROM employees;

-- MAX,MIN,COUNT,SUM FUNCTIONS

select max(salary) from employees;
select min(salary) from employees;
select count(employee_id) from employees;
select round(avg(salary), 2) from employees;
select sum(salary) as total_salary from employees;
select count(*) from employees where region_id=4;
select max(salary) from employees where hire_date between '2006-01-01' and '2009-01-01';