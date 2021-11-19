select * FROM sales_record;

-- 1. Find running total profit of orders by order date
select Item_Type, Order_Date, Total_Profit,
	SUM(Total_Profit) OVER(order by Order_Date) 
    AS Running_Total_profit
    from sales_record;

-- 2. Find running total profit of orders by item type and order result by it's date
select Item_Type, Order_Date, Total_Profit,
	SUM(Total_Profit) OVER(partition by Item_Type order by Order_Date) 
    AS Running_Total_profit
    from sales_record;

-- 3. Find running revenue by Order priority and order result
-- by it's ship date.
select Order_Priority, Order_Id, Total_Revenue, Ship_Date,
	sum(Total_Revenue) OVER(partition by Order_Priority order by Ship_Date)
    as running_revenue
    from sales_record
