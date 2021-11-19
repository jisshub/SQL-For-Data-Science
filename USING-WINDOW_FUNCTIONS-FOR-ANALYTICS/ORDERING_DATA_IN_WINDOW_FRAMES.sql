USE course_data;

select first_name, hire_date, salary from employees order by hire_date;

-- next we need to display the running total of salary.
-- running total of salary means we are adding each salary of employees and print it in following row.
-- ie given a salary of first employee. We then add his salary with salary of following employee and display it
-- in salary column of that employee and so on. At the last row, we get sum of all salaries
-- This is called running total.

select first_name, hire_date, salary, 
	sum(salary) OVER(ORDER BY hire_date) 
    as running_total_of_salaries
	from employees
    order by hire_date;
    
-- so here we find sum of salary based on hiredate.
-- if we hire 3 employees on same date, the total sum of salary spent on that date will be shown in running total salary
-- column of that employees.
-- and that sum is added to the salary of employee hired on later date.

-- To get running total of salaries in all rows we use over() clause
-- and order them by hire_date.
-- Syntax:
	-- OVER(ORDER BY hire_date) 
-- we tell the window function to order based on hire_date.


-- Find the running total of salaries by department.
select first_name, hire_date, department, salary, sum(salary) 
	over(partition by department) as running_total_salaries
    from employees;

-- Here running total of salaries of each department in computed
-- and shown in corresponding rows.


-- USING PARTITIONING AND ORDER BY TOGETHER

select first_name, hire_date, department, salary, sum(salary) 
	over(partition by department order by hire_date) as running_total_salaries
    from employees;

-- Here we just order the records by hire date and. 
-- Signifance is we can use partition by and order by together in over().


-- OTHER USE CASES
select first_name, hire_date, salary, 
	sum(salary) over(order by hire_date rows between 1 preceding and current row)
    as running_salary_total 
    from employees;
    
-- Here running salary of first row is same as its corresponding salary.
-- but for preceding rows running salaries are computed.




