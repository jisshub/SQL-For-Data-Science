				-- CASE STATEMENTS --
-- USED WHEN WE WANT TO CATEGORISE A COLUMN BASED ON DIFFERENT CONDITION.
use course_data;
select salary from employees;

select first_name, salary,
	CASE 
		when salary > 50000 and salary < 100000 THEN 'normal'
        WHEN salary < 50000 then 'underpaid'
        when salary > 100000  and salary < '150000' then 'paid well'
        when salary > 150000 then 'executives'
        else 'OTHERS'
	END
	AS STATUS
    FROM employees
    ORDER BY salary;

-- Categorising employees based on hire dates.
select concat(first_name, last_name) as full_name, hire_date,
	case
		when hire_date between '2000-01-01' and '2005-01-01' THEN 'First Joinees'
        when hire_date between '2005-01-02' and '2010-01-01' then 'Second Joinees'
        when hire_date between '2010-01-02' and '2015-01-01' then 'Next Joinees'
        when hire_date > '2015-01-02' then 'Final Joinees'
	end
		as categories
	from employees
    order by hire_date;
    
-- Categorising employees based on emails
select email, 
	case 
		when email like '%.com' then 0
        when email like '%.gov' then 1
        when email like '%.edu' then 2
        when email like '%.uk' then 3
        when email like '%.jp' then 4
        else 'OTHERS'
	end
		as email_categories
        from employees
        ORDER BY email_categories;
	

	-- TRANSPOSING THE TABLE---
-- MEANING CHANGING ROWS TO COLUMNS AND VICE VERSA
-- HERE WE WANT TO MAKE EACH ROWS TO COLUMNS.	

-- EXPLANATION ----
-- SO HERE SUM() AGGREGATE ALL THE OCCURENCES OF 1(IE TOTAL EMPLOYEES WITH SAL<100000) IN FIRST COLUMN "UNDERPAID"
-- IN "PAID WELL" COLUMN WE SUM THE ALL OCCURENCE OF 1.
-- SIMILARLY IN "EXCEUTIVE" COLUMN V AGAIN SUM THE ALL OCCURENCE OF 1.
-- SO HERE V GET 3 COLUMNS EACH CONTAINING THE TOTAL COUNT OF EMPLOYEES THOSE SATISY THE CORRESPONDING CONDITION.
-- SUM() AGGREGATES THE OCCURENECE OF 1  IF WE GIVE ANY STRING IT SHOWS ERR.
-- IF V GIVE INTEGERS >1 THEN FOR EACH RECORD THAT SATISFY THE CONDITION,TOTAL COUNT WILL INCREMENTED BY THAT NO. 

-- EXAMPLE - 1
SELECT SUM(CASE WHEN salary<100000 THEN 1 ELSE 0 END) AS "UNDERPAID",
		SUM(CASE WHEN salary>100000 AND salary<160000 THEN 1 ELSE 0 END) AS "PAID WELL",
		SUM(CASE WHEN salary>160000 THEN 1 END) AS "EXECUTIVE"
FROM employees;	
-- WE GET 3 COLUMNS HERE- UNDERPAID, PAID WELL, EXECUTIVE - EACH CONTAINING THE COUNT OF EMPLOYEES 
-- SATISFYING THE RESPECTIVE CONDITONS

-- EXAMPLE - 2
select 
	sum(case when hire_date between  '2000-01-01' and '2005-01-01' THEN 1 ELSE 0 end) AS FIRST_JOINEE,
    SUM(CASE when hire_date between '2005-01-02' and '2010-01-01' then 1 ELSE 0 end) AS SECOND_JOINEE,
    SUM(CASE when hire_date between '2010-01-02' and '2015-01-01' THEN 1 ELSE 0 end) AS NEXT_JOINEE,
    SUM(CASE WHEN hire_date > '2015-01-02' THEN 1 ELSE 0 end) AS FINAL_JOINEE
FROM employees;
-- we get 4 columns here - each containing count of employee satisfying the respective conditions.

-- EXAMPLE - 3
SELECT 
	SUM(CASE WHEN email like '%.com' THEN 1 ELSE 0 END) AS ORGANIZATIONAL,
    SUM(CASE WHEN email like '%.gov' THEN 1 ELSE 0 END) AS GOVERNMENT,
    SUM(CASE when email like '%.jp' THEN 1 ELSE 0 END) AS EDUCATIONAL
FROM employees;
-- we get 4 columns (ORGNIZATIONAL, GOVERNMENT, EDUCATIONAL).
-- Each containing count of employee satisfying the respective conditions.


