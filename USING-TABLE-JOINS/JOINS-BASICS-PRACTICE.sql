use course_data;
create table salesman (salesman_id numeric(20) primary key, name varchar(50), city varchar(50), commission double);

insert into salesman values
	(5002 , 'Nail Knite', 'Paris', 0.13),
    (5005 , 'Pit Alex', 'London', 0.11),
    (5006, 'Mc Lyon', 'Paris', 0.14 ),
    (5007 , 'Paul Adam', 'Rome', 0.13),
    (5003, 'Lauson Hen', 'San Jose', 0.12);
    
select * from salesman;

use course_data;
create table customer_tbl (customer_id numeric(20) primary key,  
						cust_name varchar(50),
                        city varchar(20),
                        grade numeric(10),
                        salesman_id numeric(10));
insert into salesman values
	(5002 , 'Nail Knite', 'Paris', 0.13),
    (5005 , 'Pit Alex', 'London', 0.11),
    (5006, 'Mc Lyon', 'Paris', 0.14 ),
    (5007 , 'Paul Adam', 'Rome', 0.13),
    (5003, 'Lauson Hen', 'San Jose', 0.12);
insert into customer_tbl values(3002, 'Nick Rimando', 'New York', 100, 5001),
								(3007, 'Brad Davis', 'New York', 200, 5001),
                                (3005, 'Graham Zusi', 'California', 200, 5002),
                                (3008, 'Julian Green', 'London', 300, 5002),
                                (3004, 'Fabian Johnson', 'Paris', 300, 5006),
                                (3009, 'Geoff Cameron', 'Berlin', 100, 5003),
                                (3003, 'Jozy Altidor', 'Moscow', 200, 5007),
                                (3001, 'Brad Guzan', 'London', 200, 5005);

select * from customer_tbl;

-- From the following tables write a SQL query to find the salesperson and customer 
-- who belongs to same city. Return Salesman, cust_name and city.


select cust_name, name as salesman_name, customer_tbl.city from salesman, customer_tbl 
	where salesman.city=customer_tbl.city
    order by customer_tbl.city;
    
-- Write a SQL query to find those orders where order amount 
-- exists between 500 and 2000. Return ord_no, purch_amt, cust_name, city. 

select odr_no, purch_amt, cust_name, city from order_tbl, customer_tbl 	
	where purch_amt between 500 and 200 and order_tbl.customer_id=customer_tbl.customer_id;
    

-- 3. From the following tables write a SQL query to find the salesperson(s) and the 
-- customer(s) he handle. Return Customer Name, city, Salesman, commission.

select customer_tbl.cust_name, customer_tbl.city, name as salesman_name,
	salesman.commission from customer_tbl inner join salesman 
    on customer_tbl.salesman_id=salesman.salesman_id;

select * from customer_tbl;

-- 4. From the following tables write a SQL query to find those salespersons who 
-- received a commission from the company more than 12%. 
-- Return Customer Name, customer city, Salesman, commission.
select customer_tbl.cust_name, customer_tbl.city, salesman.name as salesman_name, commission
from customer_tbl inner join salesman on customer_tbl.salesman_id=salesman.salesman_id 
AND salesman.commission > 0.12;

 -- 5. From the following tables write a SQL query to find those salespersons do not 
 -- live in the same city where their customers live and received a commission from 
 -- the company more than 12%. 
 -- Return Customer Name, customer city, Salesman, salesman city, commission.
 
 select * from salesman;
 select * from customer_tbl;
 
 select cust_name, customer_tbl.city, salesman.name as salesman, salesman.city, salesman.commission
	from customer_tbl
	inner join salesman on customer_tbl.salesman_id=salesman.salesman_id 
    AND customer_tbl.city != salesman.city AND salesman.commission > 0.12;