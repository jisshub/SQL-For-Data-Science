use course_data;

select * from fruit_imports;

-- Write a query that displays 3 columns. The query should display the fruit and it's total supply along with 
-- a category of either LOW, ENOUGH or FULL. Low category means that the total supply of the fruit is
-- less than 20,000. The enough category means that the total supply is between 20,000 and 50,000. 
-- If the total supply is greater than 50,000 then that fruit falls in the full category.
SELECT name, supply, 
	case 
		when supply < 20000 then 'LOW'
        WHEN supply between 20000 and 50000 then 'ENOUGH'
        WHEN supply > 50000 then 'FULL'
	END 
		AS fruit_categories
	from fruit_imports;


-- Taking into consideration the supply column and the cost_per_unit column, you should be able to 
-- tabulate the total cost to import fruits by each season. The result will look something like this:

-- "Winter" "10072.50"
-- "Summer" "19623.00"
-- "All Year" "22688.00"
-- "Spring" "29930.00"
-- "Fall" "29035.00"

-- Write a query that would transpose this data so that the seasons become columns and the total cost
-- for each season fills the first row?

SELECT season, SUM(supply) from fruit_imports group by season;



