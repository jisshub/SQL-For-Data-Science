-- retrive employees not working in sports dept.
select * from employees where department != 'Sports';

-- retrive records of employees with no email.
select * from employees where email is null;

-- retrive records of employees with email.
select * from employees where email is not null;

-- select male ewmployee with email



