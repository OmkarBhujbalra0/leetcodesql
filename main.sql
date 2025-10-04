-- 1.Combine Two Tables

select Person.firstName,Person.lastName,Address.city,Address.state 
from Person 
left join Address 
on Person.personId = Address.personId;

-- 2.Not Boring Movies

Select id,movie,description,rating 
from Cinema 
where id%2 != 0 and description != "boring" 
order by rating desc;

-- 3.Bonus less than 1000

select Employee.name,Bonus.bonus 
from Employee 
left join Bonus 
on Employee.empId = Bonus.empId 
where (bonus < 1000) or (bonus is null);

-- 4.Employees having highest number of orders

select customer_number 
from (select count(*) as counter,customer_number
from Orders 
group by customer_number) as SubTable
order by counter desc
limit 1;

-- 5.Whether its Triangle or Not

select *, 
case
    when (x + y) > z and (x + z) > y and (y + z) > x
    then "Yes"
    else "No"
end as triangle
from Triangle;

-- 6.Books with Zero Available Copies

select book_id,title,author,genre,publication_year,current_borrowers from 
(select library_books.book_id,title,author,genre,publication_year,total_copies,count(borrowing_records.book_id) as current_borrowers,(total_copies - count(borrowing_records.book_id)) as available_copies 
from library_books 
join borrowing_records 
on library_books.book_id = borrowing_records.book_id
where return_date is null
group by title
order by library_books.book_id) as outputable
where available_copies = 0
order by current_borrowers desc,title asc;

-- 7.Visited Customers with no Transactions

select customer_id,count(customer_id) as count_no_trans 
from Visits 
left join Transactions 
on Visits.visit_id = Transactions.visit_id
where transaction_id is null
group by customer_id;

-- 8.Product Sales Analysis I

select product_name,year,price 
from Sales 
left join Product 
on Sales.product_id = Product.product_id; 

-- 9.Unique Id to Each Employee

select EmployeeUNI.unique_id,Employees.name 
from Employees
left join EmployeeUNI
on Employees.id = EmployeeUNI.id;

-- 10.Avg Exp Years

select Project.project_id,round(avg(Employee.experience_years),2) as average_years 
from Project 
join Employee 
on Project.employee_id = Employee.employee_id
group by Project.project_id;