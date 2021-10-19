SELECT * FROM employees;

create table professor(last_name varchar(50), department varchar(50), salary int(10),
					   hire_date varchar(100));

insert into professor values('chong', 'science', 88000, '2006-04-18');
insert into professor values('Brown', 'Math', 97000, '2002-08-22'),
							('Jones', 'History', 67000, '2009-11-17'),
                            ('Wilson', 'Astronomy', 110000, '2005-01-15'),
                            ('Miller', 'Agriculture', 82000, '2008-05-08'),
                            ('Willians', 'Law', '105000', '2001-06-05');

select * from professor;


-- Write a SQL query against the professors table that would return the following result:

-- "It is false that professor Chong is highly paid"
-- "It is true that professor Brown is highly paid"
-- "It is false that professor Jones is highly paid"
-- "It is true that professor Wilson is highly paid"
-- "It is false that professor Miller is highly paid"
-- "It is true that professor Williams is highly paid"


SELECT 'It is ' || (salary > 95000) ||' that professor ' || last_name || ' is highly paid' FROM professors;


-- Write a query that returns all of the records and columns from the professors table but
-- shortens the department names to only the first three characters in upper case.

select * from professor;
select upper(substring(department from 1 for 3)) as department from professor;


-- Write a query that returns the highest and lowest salary from the professors table 
-- excluding the professor named 'Wilson'. 

select max(salary), min(salary) from professor where last_name != 'Wilson';

-- Write a query thats will display the hire date of the professor that has been teaching 
-- the longest. 

select last_name,hire_date from professor order by hire_date limit 1;

