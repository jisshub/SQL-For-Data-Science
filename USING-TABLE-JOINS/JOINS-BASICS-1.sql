-- TABLE JOINS --

SELECT *FROM regions;
SELECT * FROM employees,regions;

-- select firs_name, country from both tables using join.
-- here v compare region_id of employees table with region_id of regions table.
-- if they match, data is returned.
select first_name, country from employees e1, regions reg where e1.region_id = reg.region_id;

-- selecting first_name,email and division using JOIN technnique. AND IGNORING THOSE WITH NO EMAIL.
select first_name, email, division from employees emp, departments dept 
	where emp.email is not null and emp.department=dept.department;

-- Retrive first_name,division and country where hire_date between 2005 and 2007.
select first_name, division, country from employees e, departments d, regions r 
	where e.department = d.department and 
		  e.region_id = r.region_id and
          e.hire_date between '2005-01-01' and '2007-01-01';
-- here v retrieve the data from 3 columns. ie first_name,division and country.
-- SO HERE V JOIN 3 TABLES USING COMMON COLUMNS region_id and department.

-- so here v select 4 datas. and also need to specify from which source v need to return department col.
-- since department columns comes in both employees and departments tables. use alias on department col.
select first_name, e.department, division, country from employees e,
	departments d,
    regions r
    where e.department = d.department and e.region_id = r.region_id;

-- -- EXERCISE -- ---
-- retrieving country and total employees in that country using join
select * from regions;

select country, count(*) as total_employees from employees ep1, regions regs 
	where ep1.region_id = regs.region_id
    group by country;


    

    

