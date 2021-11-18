-- Import CSV File to MYSQL Using Command Line

-- https://phoenixnap.com/kb/import-csv-file-into-mysql

-- First Create Table

CREATE TABLE sales_record
 (Region varchar(50), 
 Country varchar(50),
 Item_Type varchar(50),
 Sales_Channel varchar(50),
 Order_Priority varchar(50),
 Order_Date varchar(50), 
 Order_Id varchar(50) primary key,
 Ship_Date varchar(50),
 Units_Sold numeric(10),
 Unit_Price float(10, 2),
 Unit_Cost float(10, 2),
 Total_Revenue float(20, 2),
 Total_Cost float(20, 2),
 Total_Profit float(20, 2)
 );

-- 2. Access MySQL Shell

-- mysql –u username –p

-- 3. Choose database
use course_data;
 
-- 3. Import CSV into MySQL Table 
LOAD DATA LOCAL INFILE 'C:/Users/Home/Desktop/SQL-For-Data-Science/data/1000 Sales Records.csv' 
INTO TABLE sales_record 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' 
LINES TERMINATED BY '\n' 
IGNORE 1 ROWS;

-- OTHER RESOURCES BELOW

-- SHOW VARIABLES LIKE "secure_file_priv";
-- https://stackoverflow.com/questions/5920136/mysql-is-not-recognised-as-an-internal-or-external-command-operable-program-or-b
-- select * from sales_record;
-- https://stackoverflow.com/questions/59993844/error-loading-local-data-is-disabled-this-must-be-enabled-on-both-the-client
-- SELECT @@global.secure_file_priv;
-- https://www.mattswint.com/create-a-mysql-table-from-a-csv-file/

