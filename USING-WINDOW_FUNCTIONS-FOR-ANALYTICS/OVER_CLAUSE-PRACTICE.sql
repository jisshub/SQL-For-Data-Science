select * from sales_record;

-- FIND THE SUM OF units THAT SPENT THRU EACH SALES CHANNELS 


select Sales_Channel, SUM(Unit_Price) 
 from sales_record
	group by sales_channel;

-- find count of orders placed grouped by item_types along with units sold
select Item_Type, 
	Count(Order_ID) AS Total_Orders, 
	SUM(Units_Sold ) AS Total_Units
	from sales_record
	group by Item_Type
    order by Item_Type
    