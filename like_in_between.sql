-- If we press on execute button or press F5 key it will execute the whole document but if we highlight a particular line and then press on execute button or press F5 then it will run that particular line.
-- How to create a database
create database sprintskilldb;

-- After creating the database we need to use that database otherwise it will create the table in the master database
use sprintskilldb;

-- How to create a table
-- create table employee(emp_id int,emp_name varchar(500),emp_dept varchar(50),emp_salary int)

-- insert/load data in table (employee)
-- insert into employee values(1,'VIRAAT','IT',5000);
-- insert into employee values(2,'Monica', 'IT',10000);

-- This how we insert multiple values.
-- insert into employee values(3,'Prakarsh','HR',2),(4,'Vijaya','Sales',30),(5,'Adi','HR',6000);

-- Now data is inside the table employee. 
-- We need to check or see how data is looking in our table.
-- Retrieve data and check it
-- select * from employee; 

-- select * from employee where emp_dept='IT';

-- select * from employee where emp_dept='Sales';

-- select * from employee where emp_salary > 5000;

-- select emp_id,emp_name from employee;

-- question 1. Employee in IT whose salary is greater than 5000
-- select * from employee where emp_salary > 5000 and emp_dept='IT';

----------------------- DAY-2 ------------------------

CREATE TABLE Products (
ProductID INT PRIMARY KEY,
ProductName varchar(50),
Category varchar(50),
Price decimal(10,2),
Quantity int,
ManufactureDate date
);


insert into Products(ProductID,ProductName,Category,Price,Quantity,ManufactureDate) values
(1, 'Laptop',       'Electronics', 65000.00, 10, '2023-01-15'),
(2, 'Mobile',       'Electronics', 25000.00, 25, '2023-05-20'),
(3, 'Tablet',       'Electronics', 30000.00, 15, '2022-12-05'),
(4, 'Chair',        'Furniture',   5000.00,  50, '2024-03-01'),
(5, 'Desk',         'Furniture',   12000.00, 20, '2022-08-10'),
(6, 'Shampoo',      'Cosmetics',   250.00,   200, '2024-02-18'),
(7, 'Perfume',      'Cosmetics',   1200.00,  80, '2023-07-11'),
(8, 'Sofa',         'Furniture',   30000.00, 5,  '2021-11-01'),
(9, 'TV',           'Electronics', 45000.00, 8,  '2022-09-25'),
(10,'Lipstick',     'Cosmetics',   500.00,   150, '2023-12-15');


select * from Products;


-- Order By Clause

-- Question- Sort products by price lowest first.

-- Order by- default will return is from lowest to Highest. 1 -> 2 -> 3 -> 4

select * from Products order by Price; -- ise lowest to highest prices jayega





-- If we want result in descending order then use keyword desc. desc = descending
select * from Products order by price desc;




-- Question- sort the ProductName in alphabetical order (A -> Z)

select * from Products order by ProductName; -- Output ka logic (A → Z)




-- Question- sort the ProductName in alphabetical order (Z -> A)

select * from Products order by ProductName desc; -- Output ka logic (Z → A)



-- Question- sort by category and then by price descending.

select * from Products order by Category desc,price;




-- Like clause 

-- Question- Products starting with "L" and order by category

select * from Products where ProductName like 'L%' order by category;




-- Question- Product which is ending with double "oo".

select * from Products where ProductName like '%oo';





-- Question- Write a query to display product names and their 
-- categories where the product name has b somewhere before l.

select ProductName, Category from Products where ProductName like '%b%l%';




-- Question- Display the product name and quantity for all products whose
-- quantity ends with the digit `5`.

select ProductName, Quantity from Products where Quantity like '%5';





-- Question- Display the product name and quantity for products where the quantity is 
 
-- greater than 9, ends with the digit 5, and the product name 

-- contains the letters ob in the same order.

select ProductName, Quantity from Products where Quantity > 9 and Quantity like '%5' 
and ProductName like '%ob%';





-- IN(in) Clause

-- Question- Products only from electronics and furniture category.

select * from Products where Category='Electronics' and Category='Furniture'; -- this is wrong




-- we will use IN(in) clause to filter out data.

select * from Products where Category in ('Electronics','Furniture');





-- BETWEEN(between) Clause

-- Question- Retrieve all product details for products that belong to the Electronics 

-- or Furniture category and were manufactured between January 1, 2023 and December 31, 2024.

select * from Products where Category in ('Electronics','Furniture') and ManufactureDate 
between '2023-1-1' and '2024-12-31';




-- Question- Retrieve all product details for products whose 
-- price is between 10,000 and 25,000.

select * from Products where Price between 10000 and 25000;





-- Question- show only product name and price but product name should 

-- be in aplhabetical order.

select ProductName, Price from Products order by ProductName;





-- Question- show all products that have price 250 or 12000 or 45000

select * from Products where Price=250 or Price=12000 or Price=45000; --Less Optimized techniques



select * from Products where Price in (250,12000,45000);




-- Question- Show all products that have quantity between 10 and 50.

select * from Products where Quantity between 10 and 50;



-- Question- show all furniture products with price between 5000 and 30000 
--where product name has a in between in the name and order by price desencding

select * from Products where Category='Furniture' and Price between 5000 and 30000
and ProductName like '%a%' order by Price desc;