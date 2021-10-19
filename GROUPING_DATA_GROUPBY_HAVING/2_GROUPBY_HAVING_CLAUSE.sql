-- TO FIND OUT TOTAL AMOUNT PAID FOR SALARY BY EACH DEPT.
SELECT * FROM employees;
select department, sum(salary) as 'total amount' from employees group by department;

-- TO FIND OUT TOTAL SALARY PAID BY EACH DEPT FOR EMPLOYEES WORKING IN GIVEN REGION_IDS
select department, region_id, sum(salary) as 'total amount' from employees 
	where region_id in (4,3,7)
    group by department
    order by region_id;

-- To count total employees, average sal, max sal, min sal per department
-- with salary>75000 and
-- ORDER THEM BASED ON TOTAL EMPLOYEES

select department, count(*) as total_employees, avg(salary) as average, 
	min(salary) as min,
    max(salary) as max
	from employees 
	where salary>75000
    group by department
    order by total_employees;
    
-- NOTE: Filter records first - then do the grouping.-- 


-- GROUPING BY TWO COLUMNS-- 
-------------------------
SELECT department,gender,COUNT(*)
FROM employees 
GROUP BY department,gender
ORDER BY department;

-- In above Query, v group by using department and gender column 
-- v can see 2 entries for each dept.
-- one entry for F and other for M.
-- it is because in gender there are two groups F and M.
-- suppose if gender has one more group like transgender(T).
-- then there will be 3 entries(F,M,T) for each dept.

select department, region_id from employees
	group by department, region_id 
    order by department;

-- here there will be 7 entries for each dept.
-- it is because in region_id, there are 7 groups.




