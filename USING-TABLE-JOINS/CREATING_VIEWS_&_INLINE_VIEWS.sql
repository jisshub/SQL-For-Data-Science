-- -- VIEW -- --
-- A VIEW IS A VIRTUAL TABLE.it is not an actual table in which v can insert and delete records.
-- VIEWS ARE generated by sql query.
-- WE CANT INSERT DATA INTO IT OR CANT DELETE DATA FROM THE VIEW. BUT CAN SELECT DATA FROM THE VIEW.

SELECT first_name, division FROM employees, departments where 
	employees.department=departments.department and employees.department in 
	(select department from departments where division in ('Fashion', 'Kids'));
    
-- HERE V CREATED AN SQL QUERY INCLUDE JOINS.
-- NOW WE CAN TURN THIS QWUERY IN TO A VIEW.

-- SYNTAX:
-- CREATE VIEW VIEWNAME AS <SQL QUERY>
CREATE VIEW test AS 
SELECT first_name, division FROM employees, departments where 
employees.department=departments.department and employees.department in 
(select department from departments where division in ('Fashion', 'Kids'));

-- WE CAN CALL THE VIEW USING SELECT CLAUSE.
select * from test;

-- CAN SELECT COLUMNS FROM VIEWS.
SELECT first_name from test;

-- Example - 2
create view test_view as
	select name, state, supply from fruit_imports group by season;

-- call the view
select * from test_view;

-- select supply column test_view
select supply from test_view;


