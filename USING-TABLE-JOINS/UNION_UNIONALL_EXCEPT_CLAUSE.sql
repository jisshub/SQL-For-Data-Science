## UNION CLAUSE
-- union takes the result from first select stmt and combine it with result of second select stmt
-- and returns departments by eliminating duplicates.UNION removes any duplicates. so no need to use DISTINCT
-- before department column of employees.
use course_data;

SELECT department from employees
UNION
SELECT department from departments;

-- duplicate departments were removed and returns the data.

select * from agents;

-- Example
SELECT AGENT_CODE from orders
UNION
select AGENT_CODE from agents;

-- UNION ALL -- --
-- union all takes the result from first select stmt and combine it with result of second select stmt
-- and returns departments without eliminating duplicates.
SELECT department from employees
UNION ALL
select department from departments;

-- 1000 departments from employees + 24 departments from departments table = 1024 records.

select AGENT_CODE from orders
UNION ALL
SELECT AGENT_CODE from agents;

-- 34 records from orders + 12 records from agents = 46 records.

-- NOTE: UNION eliminates duplicates bt UNION ALL doesnt eliminates duplicates.
-- if v try to union different no of columns in both queries.
-- it shows error saying: each UNION query must have the same number of columns.

SELECT DISTINCT department,region_id FROM employees
UNION 
SELECT department FROM departments;

-- Above, We try to union two columns having different data types it also results in error.
-- ERROR:  UNION types character varying and integer cannot be matched.

-- NOT IN OPERATOR --
-- we get records from subquery. if any result of subqurery present in outer query not 
-- in removes that records
select distinct department from employees where department
not in(SELECT department from departments);

-- we remove department from departments table if the same are present in employees table.alter

select distinct AGENT_CODE from orders 
	where AGENT_CODE not in (select AGENT_CODE from agents);
-- it return no records since agent_codes present in outer query matches with agent_codes
-- of sub query table. thus all records r removed and no agent_code r there which is 
-- specific to orders table.

 






