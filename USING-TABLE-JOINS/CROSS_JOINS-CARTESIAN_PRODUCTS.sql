-- -- CROSS JOIN -- --
-- IN CERTAIN CASES, WE NEED THE CARTESIAN PRODUCT OF TABLES.
-- FOR THAT WE SPECIFY CROSS JOIN.
-- CROSS JOIN NOT SIMILAR TO BOTH INNER AND OUTER JOIN.
-- IT MEANS MULIPLY EACH RECORDS IN THE FIRST TABLE WITH EACH RECORDS OF SECOND TABLE.

select * from customer_tbl  cross join salesman;

-- rows count in customer_tbl is 8, 
-- rows count in salesman is 6
-- doing cross join, we get cartseian product of both. ie. 8 x 6 = 48 rows.

select * from fruit_imports  cross join fruits;
-- 15 rows x 4 rows = 60 rows
