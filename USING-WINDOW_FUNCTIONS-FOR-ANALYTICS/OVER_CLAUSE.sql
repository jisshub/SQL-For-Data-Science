use course_data;

-- to get the total count of employees working in each department
select department, count(employee_id) from employees group by department;	

-- so if v want to add the first_name of employees along with department and count,
-- objective is to get fisrst_nam ef all employees their corresponding depts and count
-- of employees in that dept.

select first_name, department, count(employee_id) from employees group by department;	
-- so here v r combining non aggregate col first_name with aggregate col department.
-- but the above doesnt return data that we actually want and its wrong.

-- so the solution is ,here v does count in subquery.

select first_name, department, 
(select count(*) from employees e1 where e1.department = e2.department) as Employee_Count
from employees e2 order by department;

-- THHIS METHOD is expensive.
-- So we use windows over() function for the same.

-- OVER() CLAUSE DETATCH/SEPERATE THE RESULT OF COUNT(*) FROM THE OTHER 
-- COLUMNS(department and first_name) HERE.

select first_name, department, count(*) over() from employees;

-- if v run this, count returns the count of all employee records in the table.
-- AND IT REPEATS FOR EVERY SINGLE RECORDS.
-- But we need to get the count of employees in each dept.
-- so pass 'PARTITION BY department' as a parameter to OVER() clause.

select first_name, department, count(*) over(partition by department) as employees_count 
from employees;
-- here the output is automatically ordered by department column. 
-- OVER(PARTITION BY department) : IT IS THE WINDOWING PORTION OF THE QUERY.
-- so here v count all the records over a window that partition by department column.


-- Example -2

