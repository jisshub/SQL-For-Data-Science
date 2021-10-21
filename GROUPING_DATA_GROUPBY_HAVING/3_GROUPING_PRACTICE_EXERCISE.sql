
CREATE TABLE fruit_imports
(
	id integer,
	name varchar(20),
	season varchar(10),
	state varchar(20),
	supply integer,
	cost_per_unit decimal
);

insert into fruit_imports values(1, 'Apple', 'All Year', 'Kansas', 32900, 0.22);
insert into fruit_imports values(2, 'Avocado', 'All Year', 'Nebraska', 27000, 0.15);
insert into fruit_imports values(3, 'Coconut', 'All Year', 'California', 15200, 0.75);
insert into fruit_imports values(4, 'Orange', 'Winter', 'California', 17000, 0.22);
insert into fruit_imports values(5, 'Pear', 'Winter', 'Iowa', 37250, 0.17);
insert into fruit_imports values(6, 'Lime', 'Spring', 'Indiana', 40400, 0.15);
insert into fruit_imports values(7, 'Mango', 'Spring', 'Texas', 13650, 0.60);
insert into fruit_imports values(8, 'Orange', 'Spring', 'Iowa', 18000, 0.26);
insert into fruit_imports values(9, 'Apricot', 'Spring', 'Indiana', 55000, 0.20);
insert into fruit_imports values(10, 'Cherry', 'Summer', 'Texas', 62150, 0.02);
insert into fruit_imports values(11, 'Cantaloupe', 'Summer', 'Texas', 8000, 0.49);
insert into fruit_imports values(12, 'Apricot', 'Summer', 'Kansas', 14500, 0.20);
insert into fruit_imports values(13, 'Mango', 'Summer', 'Texas', 17000, 0.68);
insert into fruit_imports values(14, 'Pear', 'Fall', 'Nebraska', 30500, 0.12);
insert into fruit_imports values(15, 'Grape', 'Fall', 'Illinois', 72500, 0.35);

SELECT * FROM fruit_imports;

-- 1. Write a query that displays only the state with the largest amount of fruit supply.

SELECT state, supply from fruit_imports order by supply desc limit 1;


-- 2. Write a query that returns the most expensive cost_per_unit of every season. 
--    The query should display 2 columns, the season and the cost_per_unit
-- select season, cost_per_unit from fruit_imports where 

-- 3. Write a query that returns the state that has more than 1 import of the same fruit.
select state,count(*) from fruit_imports 
	group by state
	having count(*) > 1;
    
-- 4. Write a query that returns the seasons that produce either 3 fruits or 4 fruits.
select season, count(*) from fruit_imports
	group by season
    having count(*) >= 3 or count(*)>=4;
	

-- 5. Write a query that takes into consideration the supply and cost_per_unit columns for determining 
-- the total cost and returns the most expensive state with the total cost.

SELECT * FROM fruit_imports;
select state, supply, cost_per_unit, supply*cost_per_unit as total_cost from fruit_imports
	group by total_cost
	having max(total_cost)
    order by total_cost desc limit 1;


-- 6. Execute the below SQL script and answer the question that follows:

CREATE table fruits (fruit_name varchar(10));
INSERT INTO fruits VALUES ('Orange');
INSERT INTO fruits VALUES ('Apple');
INSERT INTO fruits VALUES (NULL);
INSERT INTO fruits VALUES (NULL);

-- Write a query that returns the count of 4. You'll need to count on the column fruit_name
-- and not use COUNT(*)
select * from fruits;
select count(coalesce(fruit_name, 'some data')) as total_count from fruits;

-- use coalesce to firtst replace null with a string values and do the count on fruit_name.alter
