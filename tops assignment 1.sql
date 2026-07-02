use datadb;
-- section A:concept application

-- 1. What is the functional difference between SELECT * and specifying column 
-- names, and when is each preferred?
--  select * is used to retrieve all columns from the table and column name specifically tells about which column to select.
--  select* is preferred respectively as if either to explore the table or viewing the complete table.
-- and column names are preferred specify column names used when we need especific column name.
-- eg: select * from employees_datatable;
       -- select name, salary from employees_datatable;
       
       -- 2-- . Which keyword renames a column in the output, and does this alias change 
-- the actual table structure in the database?
-- AS keyword is used to give a temporary name (Alias) to a column in the output.
--  It never changes the original column name or the table structure in the database.
--  It only changes the display name of the result. 
-- for ex: select sum(profit) as total_profit from `sample - superstore`;

-- 3. Why does wrapping a numeric value in quotes (e.g., '5000') in a WHERE clause 
-- create a data type conflict in SQL?
-- if we put strings in numbers instead of text it creates conflict in datatype.
-- putting strings in numbers instead of text always create a datatype conflict.
-- therefore numeric values should and must be written without quotes.
--  ex: select * from employees where salary =>5000;

-- 4.Contrast the results of ORDER BY Profit DESC versus ASC when the goal is to 
-- identify the top 10 most profitable orders. 
--  order by profit desc is used to arrange the data in highest to lowest order.
-- and top 10 most profitable means desc+limit 10
-- and order by profit asc is used to arrange the data in lowest to highest order.
-- ex: select * from `sample - superstore`
--      order by profit desc
--      limit 10;

-- ex:select * from `sample - superstore`
--  order by profit  asc
--      limit 10;

--  5. What is the T-SQL equivalent of the LIMIT clause in MS SQL Server, and why does syntax vary across SQL engines?
--       In MySQL, the LIMIT clause is used to restrict the number of rows returned by a query.

-- In MS SQL Server (T-SQL), the equivalent of LIMIT is the TOP keyword.
-- The syntax varies across SQL engines because each database management system (DBMS) has its own SQL implementation
--  and features. Although they follow the SQL standard, commands like LIMIT, TOP, and FETCH are vendor-specific.
-- Summary:
-- * MySQL → LIMIT
-- * MS SQL Server → TOP
-- * Syntax differs because different SQL databases use their own implementations of SQL.
--     ex: my SQL
-- SELECT *
-- FROM employees
-- LIMIT 10;

-- my SQL SERVER (T-SQL)
-- SELECT TOP 10 *
-- FROM employees;

-- 6. Explain the logical execution order of a query containing SELECT, WHERE, ORDER 
-- BY, and LIMIT clauses.
 -- from: from which table data has to be retrieved.
--  where: to filter out the data row by row directly from the table.
--  select:to select the required column.
--  order by:for sorting the data in  asc/ desc order.
--  limit:to resctrict the number of rows in the final output.

-- section B: practical task
use datadb;

select * from orders_data limit 20;


select * , `order id`
Order_Date,
 Sales as total_sales,
 profit
from `sample - superstore`;

select * from `sample - superstore`  where sales>=5000;

select * from `sample - superstore`
order by profit desc
limit 10;

-- section C:-- mini project

use datadb;

 
select* from `sample - superstore` where Discount>0.20 and Profit<0;

select region, sum(sales) as total_sales,
			   sum(profit) as total_profit
               from `sample - superstore`
               group by Region;
               
	   select category, region,
      avg(discount) as avg_discount,
      sum(profit) as total_profit
      from `sample - superstore`
      group by Category,Region
      having sum(profit)<0;
      
      select   region,
      sum(profit) as total_profit,
      avg(profit) as average_profit,
      min(profit) as minimum_profit,
      max(profit) as maximum_profit
      from `sample - superstore`
      group by region;
      
      
        