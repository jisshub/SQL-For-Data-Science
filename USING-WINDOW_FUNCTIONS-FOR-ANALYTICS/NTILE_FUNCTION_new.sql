			-- NTILE FUNCTION 
-- LETS SAY IF V WANT TO CONSIDER FIRST FIVE HIGHEST PAID EMPLOYEES
-- IN A DEPARTMENT AS RANK 1 AND NEXT FIVE HIGHEST PAID EMPLOYEES AS RANK 2.
-- AND SO ON. HERE V USE NTILE FUNCTION.

SELECT first_name, department, salary, 
	ntile(5) over(partition by department order by salary desc)
    as salary_buckets from employees;

-- HERE NTILE() TAKES AN ARGUMENT SAYING NO OF BUCKETS OF DATA THAT NEED TO BE CREATED.
-- IN ABOVE QERY WE SPLIT RECORDS IN EACH DEPARTMENT IN TO FIVE BUCKETS.
-- AND RANK THEM BASED ON HIGHEST PAID EMPLOYEES.
-- FOR EG: IN AUTOMOTIVE DEPT, FIRST 7 RECORDS IS CONSIDERED AS A BUCKET AND alloted RANK 1
-- TO EACH EMPLOYEES IN THAT BUCKET.

select *from sales_record;

-- Rank Countries by total revenue. ie. Split records in a country
-- and rank them by revenue.
select Country, Order_Date, Total_Revenue,
	ntile(5) over(partition by Country order by Total_Revenue desc)
    as revenue_buckets
	from sales_record;
    
-- Rank item types by units sold. ie. Split records in item types
-- and rank them by number of units sold.
select Item_Type, Units_Sold, ntile(20)
	over(partition by Item_Type order by Units_Sold desc)
    as ranks from sales_record;


select Item_Type, count(*) from sales_record group by Item_Type


