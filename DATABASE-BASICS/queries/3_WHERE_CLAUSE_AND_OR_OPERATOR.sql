# WHERE CLAUSE - AND - OR OPERATOR

SELECT * FROM departments;

SELECT * FROM departments WHERE division='Home';

# Using AND / OR Operator

SELECT * FROM employees WHERE hire_date > 2010-01-01 AND gender = 'M';

# Multiple conditions using AND operator.
SELECT * FROM employees WHERE department='Computers' AND salary > 50000 AND region_id=3;

# USING OR OPERATOR
SELECT * FROM employees WHERE department='Clothing' OR last_name LIKE 'M%';

-- above query returns rows where department is clothing or last name starts with letter 'M'.
-- rows that satisfies either of both are returned.

# select employees with salary>40000 and works in either clothing or pharmacy dept.

SELECT * FROM employees WHERE salary > 40000 AND (department='Clothing' OR department='Pharmacy');

SELECT * FROM regions where region = "Central" OR country="Asia";

