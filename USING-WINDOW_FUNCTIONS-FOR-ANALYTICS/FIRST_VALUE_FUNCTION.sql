			-- FIRST_VALUE() FUNCTION
-- This function takes a column as an argument.

select first_name, department, salary,
	first_value(salary) over(partition by department order by salary desc) as salary_first 
    from employees;
-- here v pass column salary as an argument to the first_value() function.
-- this function takes first value of salary coloumn of each department
-- and this value is repeated for every record in that depatment.

-- Example 2
-- Here Total Revenue of first record for a country is repeated on 
-- following records of that country.
-- And first Revenue of next coutnry is repeated for that particular country.

select Country, Total_Revenue, first_value(Total_Revenue) 
	over(partition by Country order by Total_Revenue desc) as first_value_revenue
	from sales_record;