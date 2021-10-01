-- retrive employees not working in sports dept.
select * from employees where department != 'Sports';

-- retrive records of employees with no email.
select * from employees where email is null;

-- retrive records of employees with email.
select * from employees where email is not null;

-- select male employees with no email
use course_data;
select * from employees where gender="M" and email is null;

-- RETRIEVE EMPLOYEES WORKING IN either of these DEPARTMENTS-COMPUTER,FIRST AID,MOVIES,TOYS
select * from employees where department in ('Computer', 'First Aid', 'Movies', 'Toys');

-- RETRIEVE EMPLOYEES NOT WORKING IN either of these DEPARTMENTS-COMPUTER,FIRST AID,MOVIES,TOYS
select * from employees where department not in ('Computer', 'First Aid', 'Movies', 'Toys');

-- RETRIEVE EMPLOYEES WITH IN A GIVEN RANGE OF SALARY
select * from employees where salary between 50000 and 100000;
select * from employees where salary between 100000 and 120000;

-- some practice work arounds.
select country from regions where region in ('Central', 'East Asia');


