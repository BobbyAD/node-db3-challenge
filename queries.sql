-- Multi-Table Query Practice

-- Display the ProductName and CategoryName for all products in the database. Shows 77 records.

select p.ProductName, c.CategoryName from Product as p
join Category as c
    on p.CategoryId = c.Id
order by c.Categoryname

-- Display the order Id and shipper CompanyName for all orders placed before August 9 2012. Shows 429 records.

select o.id, s.CompanyName from [order] as o
join shipper as s
    on o.ShipVia = s.id
order by o.id

-- Display the name and quantity of the products ordered in order with Id 10251. Sort by ProductName. Shows 3 records.

select p.productName, o.quantity from orderdetail as o 
join product as p
    on o.ProductId = p.id
where o.orderid = 10251
order by p.productName

-- Display the OrderID, Customer's Company Name and the employee's LastName for every order. All columns should be labeled clearly. Displays 16,789 records.

select o.id, c.companyname, e.lastname from [order] as o
join customer as c
    on o.CustomerId = c.id
join employee as e
    on o.employeeId = e.id
order by o.id