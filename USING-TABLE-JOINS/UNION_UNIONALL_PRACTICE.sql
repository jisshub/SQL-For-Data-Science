-- https://www.w3resource.com/sql-exercises/union/sql-union.php
use course_data;

-- 1. From the following tables, write a SQL query to find all salespersons 
-- and customer who located in 'London' city.

select * from salesman;
select * from customer_tbl;

select name, city from salesman where city='London'
union
select cust_name, city from customer_tbl where city='London';

-- 2. From the following tables, write a SQL query to find distinct salesperson and 
-- their cities. Return salesperson ID and city.
select salesman_id, city from salesman
union
select salesman_id, city from customer_tbl;

