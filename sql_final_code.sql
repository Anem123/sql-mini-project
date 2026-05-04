create table sales (
product_id int,
product_name varchar(255),
sale_date date, 
quantity int,
revenue decimal(10,2)
);

insert into sales (product_id,sale_date,product_name,quantity,revenue) values
(1,  '2021-01-01', 'Product Ab', 50, 100.00),
(2,  '2021-01-01', 'Product Ab ', 20, 1080.00),
(3,  '2021-01-04', 'Product An', 10, 199.00),
(4,  '2021-01-04', 'Product Ab', 90, 900.00),
(5,  '2021-01-05', 'Product An', 19, 399.00),
(6,  '2021-01-05', 'Product Akk', 100, 599.00),
(7,  '2021-01-01', 'Product Akk', 99, 4900.00);

---Retrieve all the data:
select * from sales;

---Filter for a specific product:
select * from sales where product_name = 'Product An';

---Total revenue per day:
select sale_date,sum(revenue) from sales group by sale_date order by sale_date;
---Total revenue per product:
select product_name,sum(revenue) from sales group by product_name;
--Top-selling products by quantity (descending):
select product_name,sum(quantity) from sales group by product_name order by sum(quantity) desc;

--1. Which products were sold on January 4th?
select product_name,sale_date from sales where sale_date ='2021-01-04';
--2. What was the total revenue for Product Ab?
select product_name,sum(revenue) from sales where product_name = 'Product Ab' group by product_name;
--3. Which days had revenue greater than $150?
select sale_date,sum(revenue) from sales group by sale_date having sum(revenue)>150;

--4. Which products had a total quantity sold greater than 30?
select product_name,sum(quantity) from sales group by product_name having sum(quantity)>30;
--5. What was the average revenue per sale for Product Akk?
select product_name,avg(revenue) from sales where product_name = 'Product Akk' group by product_name;


