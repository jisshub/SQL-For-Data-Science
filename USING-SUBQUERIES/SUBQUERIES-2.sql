-- SUBQUERIES IN BETWEEN CLAUSE

-- Example -1
-- select employee details with salary in range of min(sal) and 6000.
select * from employees where salary 
	between (select min(salary) from employees) and 80000;
    
-- Example - 2
-- select fruit import data where supply is in range of minimum supply and 15000.
SELECT * FROm fruit_imports where supply
	between (select min(supply) from fruit_imports) and 15000;