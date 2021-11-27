-- -- -- NTH_VALUE() FUNCTION -- -- --
-- SUPPOSE WE WANT THE NTH VALUE OF A SALARY COLUMN AND NEED TO REPEAT
-- THAT VALUE FOR ALL THE OTHER RECORDS THAT BELONGS TO SAME DEPARTMENT.

SELECT first_name,department,salary,
NTH_VALUE(salary,3) OVER(PARTITION BY department ORDER BY first_name desc)
AS NTH_value_sal
FROM employees;

select * from sales_record;

-- Example - 2
-- Suppose we awan to repeat th value of profit column for all records
-- belonging to same region.
select Country, Region, Total_Profit, 
	nth_value(Total_Profit, 4) over(partition by Region order by Country)
    as nth_value_profit
    from sales_record;
