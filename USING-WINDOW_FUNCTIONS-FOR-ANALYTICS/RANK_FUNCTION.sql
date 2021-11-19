
-- -- -- -- RANK FUNCTION --- ------
-- IF WE HAVE TO RANK OUR DATA BEASED ON CERTAIN CRITERIA WE USE RANK()

-- 1. Rank the employees based on criteria -> 'hire_date'
select first_name, department, hire_date,
	rank() over(partition by department order by hire_date)
    as ranks
    from employees;
    
-- 2. Rank employees based on their salary.
select first_name, salary,
	rank() over(order by salary) 
    as ranks
    from employees;
    
-- 3. Access the employee with rank as 8 in each department.

-- select first_name, department,  

select * from (
select employee_id, first_name, department, rank() 
over(partition by department order by salary) as ranks
from employees e1) as table_1
	where ranks=8;

-- why dont use where clause without subquery
SELECT first_name,email,department,salary,
RANK() OVER(PARTITION BY department ORDER BY salary DESC)
FROM employees WHERE rank = 10;
-- this throw ERROR:  column "rank" does not exist 

-- and reason is, here this window fucntion 
-- 'RANK() OVER(PARTITION BY department ORDER BY salary DESC)'
-- is the colummn and it is processed at the end of query after
-- the where clause.
-- in above query, where clause tries to filter, but it cant happen 
-- since rank column is not processed yet.
-- So that is why we can't filter for the given column rank like this.
-- therefore v use subquery.

-- Rank Function Practice
select * from sales_record;

-- 1. Rank orders by units sold and partition result by item types
select Item_Type, Order_Id, 
	rank() over(partition by Item_Type order by Units_Sold) as ranks,
    Units_Sold
    from sales_record;
    
-- 2. Rank orders by total revenue 
	-- and get orders details with rank as 20 in each Item Types.
    
    select * from(select Order_Id, Order_Date, Item_Type,
		rank() over(partition by Item_Type order by Total_Revenue)
        as rank_order
        from sales_record) as query_1 
        where rank_order=20;

-- 2. Rank orders by total revenue 
	-- and get orders details with rank 20 and 40 in each Item Types.
     select * from(select Order_Id, Order_Date, Item_Type,
		rank() over(partition by Item_Type order by Total_Revenue)
        as rank_order
        from sales_record) as query_1 
        where rank_order in (20, 40);

-- 2. Rank orders by total revenue 
	-- and get orders details with rank between 20 and 25 in each Item Types.
     select * from(select Order_Id, Order_Date, Region,
		rank() over(partition by Region order by Total_Revenue)
        as rank_order
        from sales_record) as query_1 
        where rank_order between 20 and 25;
	




    

    
    


