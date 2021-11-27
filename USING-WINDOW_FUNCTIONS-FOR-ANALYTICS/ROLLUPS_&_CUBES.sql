use course_data;

CREATE TABLE sales
(
	continent varchar(20),
	country varchar(20),
	city varchar(20),
	units_sold integer
);

INSERT INTO sales VALUES ('North America', 'Canada', 'Toronto', 10000);
INSERT INTO sales VALUES ('North America', 'Canada', 'Montreal', 5000);
INSERT INTO sales VALUES ('North America', 'Canada', 'Vancouver', 15000);
INSERT INTO sales VALUES ('Asia', 'China', 'Hong Kong', 7000);
INSERT INTO sales VALUES ('Asia', 'China', 'Shanghai', 3000);
INSERT INTO sales VALUES ('Asia', 'Japan', 'Tokyo', 5000);
INSERT INTO sales VALUES ('Europe', 'UK', 'London', 6000);
INSERT INTO sales VALUES ('Europe', 'UK', 'Manchester', 12000);
INSERT INTO sales VALUES ('Europe', 'France', 'Paris', 5000);

select * from sales;

select * from sales order by country;

-- get sum of units sold in each continent.
select continent, sum(units_sold) from sales group by continent;

-- get sum of units sold in each country.
select country, sum(units_sold) from sales group by country;

-- get sum of units sold by each city
select city, sum(units_sold) as sum from sales group by city;

-- -- -- ROLLUP()-- -- --
-- The ROLLUP clause is an extension of the GROUP BY clause 
-- that produces another row and shows the grand-total (super-aggregate) values
-- If we want to understand the ROLLUP modifier, 
-- we must have to know what is grouping set. A grouping set is a set 
-- of columns that 
-- we want to group to get the resultant output. 
-- For example, suppose we have a table "sales" that contains the 
-- following data:

select * from sales;

-- If we want to summarize the result per country, 
-- we will use the simple GROUP BY clause as below:
select country, sum(units_sold) as total_units from sales group by country;

-- using roll up with group by we get total sum of units sold in new row.
select country, sum(units_sold) as total_units from sales group by country with rollup;


-- If the GROUP BY clause has more than one column, 
-- the ROLLUP modifier has a more complex effect. In this case, the ROLLUP modifier 
-- assumes a hierarchy among the columns specified in the GROUP BY clause.
-- Each time there is a change in column value, the query generates an extra 
-- super-aggregate summary row at the end of the result.

-- For example, assumes we have specified the three columns in the GROUP BY clause 
-- as below:

select country, city, continent, sum(units_sold) as total_units 
	from sales group by country, city, continent;
    
-- Without rollup Here we will get the summary values only 
-- at the Country/City/Continent level of analysis.
    

select country, city, continent, sum(units_sold) as total_units 
	from sales group by country, city, continent
    with rollup;
    
-- With ROLLUP added, the query produces several extra rows.
-- For all other rows, it generates an extra super-aggregate summary row that shows 
-- the grand total for all columns. It will set the Country, City, and Continent
-- columns to NULL.

-- Examples
create table sales_new (employee_name varchar(20), 
						year_of_join year,
                        country varchar(50),
                        product varchar(50),
                        sales numeric(10));

insert into sales_new values ('Bob', 2017, 'US', 'Computer', 15000),
					('Bob', 2018, 'US', 'Computer', 10000),
                    ('Bob', 2019, 'US', 'TV', 20000),
                    ('Bob', 2017, 'INDIA', 'LAPTOP', 10000),
                    ('Bob', 2018, 'INDIA', 'LAPTOP', 15000),
                    ('Bob', 2019, 'INDIA', 'Computer', 20000),
                    ('Bob', 2017, 'CANADA', 'TV', 20000),
                    ('Bob', 2018, 'CANADA', 'MOBILE', 1500),
                    ('Bob', 2019, 'CANADA', 'CALCULATOR', 25000);
                    
SELECT * FROM sales_new;


-- 1.
select year_of_join, sum(sales) from sales_new group by year_of_join
	with rollup;

-- 2. 
select country, year_of_join, product, sum(sales) from sales_new
	group by year_of_join, country, product
	with rollup;

-- 3.
select year_of_join, country, product, sum(sales) from sales_new
	group by year_of_join, country
	with rollup;


    