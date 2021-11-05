-- -- INNER JOIN -- --
-- So here we join employees and regions using INNER JOIN syntax based ON common column region_id.
-- Here no use of WHERE CLAUSE.
-- HERE V PUT CONDITION ON 'ON CLAUSE' INSTEAD OF 'WHERE CLAUSE' .
SELECT * FROM employees INNER JOIN regions ON employees.region_id=regions.region_id;

-- RETRIEVE email, hire_date, country using inner join.
select email, hire_date, country from employees INNER JOIN regions ON
	employees.region_id=regions.region_id and employees.email is not NULL;

-- Select first_name,email,division,country USING INNER JOIN and email should end with '.com'
select first_name, email, division, country from employees INNER JOIN departments
	on employees.department = departments.department INNER JOIN regions
    on employees.region_id = regions.region_id and email like '%.com';
-- HERE V NEED TO SELECT country from regions table.
-- so here use anther inner join after the first inner join operation.
-- thus v join 3 tables together using INNER JOIN technque.
-- so here v first join two table using INNER JOIN ON A CONDITION.
-- LATER IF V WANT TO JOIN ANOTHER TABLE V DO SEPERATE INNER JOIN ON THAT TABLE.
-- AND SPECIFY THE CONDITION ON 'ON CLAUSE'.
-- similarly if want to join another table we declare another INNER JOIN ON THAT TABLE.

select * from orders;
select * from customer;
select * from agents;
-- select cust_name, phone_no, ord_num, ord_amount, agent_name, commission 
select CUST_NAME, customer.PHONE_NO, ORD_NUM, ORD_AMOUNT, AGENT_NAME 
	FROM customer INNER JOIN orders 
    ON customer.CUST_CODE=orders.CUST_CODE 
    INNER JOIN agents
    on customer.AGENT_CODE=agents.AGENT_CODE;
    
-- OUTER JOIN -- 
-- DIVIDED IN TO 3:
-- LEFT OUTER JOIN(ALSO CALLED AS LEFT JOIN), RIGHT OUTER JOIN(ALSO KNOWN AS RIGHT JOIN) 
-- AND FULL OUTER JOIN.

-- LEFT JOIN OR LEFT OUTER JOIN

-- Get distinct department from employees table regardles whether the same exist
-- in departments table/not.

select distinct 
	employees.department as employee_dept, 
	departments.department as department_dept 
    from employees 
	left outer join departments
	on employees.department=departments.department;

-- LEFT JOIN says give me all the departments that exists in employees table regardless of whether 
-- they exists OR NOT in THE departments table. LEFT JOIN means give preference to the table on LEFT
-- ie simply we can say we get all departments from employees table without considering departments
-- table. Thus here we are exposing all the departments in eemployees.

-- select distinct working area from agents table regardless whether they exist in customers table/not-- 
select distinct WORKING_AREA from agents;
select distinct WORKING_AREA from customer;

select distinct agents.WORKING_AREA as ag1, customer.WORKING_AREA as cus1
	FROM agents LEFT OUTER JOIN customer 
    ON agents.WORKING_AREA=customer.WORKING_AREA;

-- RIGHT JOIN OR RIGHT OUTER JOINS --
-- RIGHT JOIN give preference to TABLE ON RIGHT SIDE.
-- RIGHT JOIN says give all the department exists in departments table regardless of whether they exists or not
-- in the employees table. 
-- here v expose all the departments in departments table

SELECT distinct departments.department as dept_dp, employees.department as emp_dp
	from departments RIGHT OUTER JOIN employees
    ON departments.department=employees.department
    order by departments.department desc;

select customer.CUST_CODE, orders.CUST_CODE, customer.AGENT_CODE, orders.AGENT_CODE
	FROM customer RIGHT OUTER JOIN orders
    ON customer.CUST_CODE=orders.CUST_CODE;
    
-- -- -- RIGHT JOIN- PREFERNCE TO RIGHT TABLE -- -- --
-- -- -- LEFT JOIN - PREFERENCE TO LEFT TABLE -- -- --

-- FULL OUTER JOIN --
-- mysql doesn't support this join operation.
-- but We can emulate it by doing a UNION of a left join and a right join, like this:
-- full outer join exposes data from both tables.
select distinct employees.department as employee_depts, departments.department as departments_depts
	from employees left outer join departments 
    on departments.department=employees.department
UNION
select distinct employees.department as employee_depts, departments.department as departments_depts
	from employees right outer join departments 
    on departments.department=employees.department;

-- here departments that exist in departments table bt not in employees table
-- then the corresponding column will be shown as NULL in employees. and vice versa.

-- Example
select CUST_NAME, customer.PHONE_NO, ORD_NUM, ORD_AMOUNT
	FROM customer LEFT OUTER JOIN orders 
    ON customer.CUST_CODE=orders.CUST_CODE 
union
select CUST_NAME, customer.PHONE_NO, ORD_NUM, ORD_AMOUNT
	FROM customer RIGHT OUTER JOIN orders 
    ON customer.CUST_CODE=orders.CUST_CODE;

-- NOTE: NEVER USE TABLE ALIASES IN 'ON CLAUSE'. IT SHOWS ERROR. ALWAYS REFER USNG TABLE NAMES.

