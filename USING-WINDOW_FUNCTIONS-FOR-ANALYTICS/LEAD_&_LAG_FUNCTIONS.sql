		-- LEAD Function
-- lets say if v want to get the values from a row that is after or before 
-- the currently processing row.
-- for this v use lead and lag function.
SELECT first_name, salary from employees;
select * from employees;

-- LETS SAY, FOR EVERY ROW V WANT TO GET THE SALARY OF ROW THAT COMES AFTER IT AND 
-- DISPLAY IT IN A NEW COLUMN. HERE V USE lead().
select first_name, last_name, salary,
	lead(salary) over(order by first_name) as next_salary
    from employees;
    
select region, country, lead(region) over() as next_region
	from regions;
    
-- Example - 3
-- Disply total cost of order in next row under new column.
select Order_Id, Order_Date, Total_Cost,
	lead(Total_Cost) over(order by Order_Date) as next_total_cost
 from sales_record;
 
    -- -- LAG() -- --
-- just like LEAD() function, THERE IS LAG() function
-- an it does the exact opposite of lead().
-- here for every row v get the salary of row that comes before it and THAT VALUE IS 
-- displayed in a new column.

select first_name, salary, lag(salary) over(order by first_name)
	as previous_salary
	from employees;
    
-- Example -2

select Order_Id, Order_Date, Total_Cost,
	lag(Total_Cost) over(order by Order_Date) as next_total_cost
 from sales_record;

