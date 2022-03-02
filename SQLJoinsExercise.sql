/* joins: select all the computers from the products table:
using the products table and the categories table, return the product name and the category name */
select * from products
inner join categories on products.CategoryID = categories.CategoryID
where categories.Name = 'Computers';
 
/* joins: find all product names, product prices, and products ratings that have a rating of 5 */
select name, price, rating, comment from products
left join reviews on products.ProductID = reviews.ProductID
where reviews.Rating = 5;
 
/* joins: find the employee with the most total quantity sold.  use the sum() function and group by */
select employees.firstname, employees.lastname, sum(sales.Quantity) as total from employees
inner join sales on employees.EmployeeID = sales.EmployeeID
group by employees.EmployeeID
order by total desc
limit 2;

/* joins: find the name of the department, and the name of the category for Appliances and Games */
select c.Name as CatName, d.Name as DepName from categories as c
inner join departments as d on c.DepartmentID = d.DepartmentID
where c.Name like 'Appliances' or c.Name like 'Games';

/* joins: find the product name, total # sold, and total price sold,
for Eagles: Hotel California --You may need to use SUM() */
select p.Name, count(p.Name) as TotalSold, sum(s.priceperunit) as MoneyMade from products as p
inner join sales as s on p.ProductID = s.ProductID
where p.Name like 'Eagles: Hotel California';

/* joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) */
select p.Name, r.Reviewer, r.Rating, r.Comment from products as p
inner join reviews as r on p.ProductID = r.ProductID
where p.Name like 'Visio TV' and r.Rating like '1';

-- ------------------------------------------ Extra - May be difficult
/* Your goal is to write a query that serves as an employee sales report.
This query should return the employeeID, the employee's first and last name, the name of each product, how many of that product they sold */
select e.EmployeeID, e.FirstName, e.LastName, p.Name, s.Quantity from employees as e
left join sales as s on e.EmployeeID = s.EmployeeID
left join products as p on s.ProductID = p.ProductID
where s.Quantity is not null
order by e.LastName;

