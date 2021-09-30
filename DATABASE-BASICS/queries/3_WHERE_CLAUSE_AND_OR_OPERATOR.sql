# WHERE CLAUSE - AND - OR OPERATOR

SELECT * FROM departments;

SELECT * FROM departments WHERE division='Home';

# Using AND / OR Operator

SELECT * FROM employees WHERE hire_date > 2010-01-01 AND gender = 'M';

# Multiple conditions using AND operator.
SELECT * FROM employees WHERE department='Computers' AND salary > 50000 AND region_id=3;

