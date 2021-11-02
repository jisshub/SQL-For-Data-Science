 -- return all employees who make more salary than average salary of all employees.

-- normal subquery
 select * from employees where salary>(select avg(salary) from employees);
 
-- correlated subquery
 select first_name ,last_name from employees e1 where salary
	> (select avg(salary) from employees e2 where e1.department=e2.department);


-- now the both the queries r corelated. here subquery runs for evey single reord of the outer query,
-- ie for every single record of outer query, WHERE clause excutes subquery over and over again.
-- n previous version subquery runs once and v get average of all employees and that result is compared with
-- outer query. bt in this case, subquery runs for every record of outer query,
-- We are relating department of outer employees table with department of inner employees table.
-- this is called corelation. since v r relating both queries based on a common column(department).

-- Example - 2
-- find all employees whose salary > avg sal of all employees in a region. 

select * from employees emp1 where salary >
	(select avg(salary) from employees emp2 where emp1.region_id=emp2.region_id);	
-- here v are relating the region_id of emp1 with region_id of emp2

-- Example - 3
-- To find department with more than 38 employees
select department, count(*) from employees e1 where 38 < (select count(*) from employees e2 
	where e1.department=e2.department) group by department;


-- Example - 4
-- find maximum salary of departments with more than 38 employees.
select department, max(salary), count(*) from employees ep1 where 38 <
	(select count(*) from employees ep2 where ep1.department = ep2.department)
    group by department
    order by count(*);

