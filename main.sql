-- Combine Two Tables

select Person.firstName,Person.lastName,Address.city,Address.state 
from Person 
left join Address 
on Person.personId = Address.personId;

-- Not Boring Movies

Select id,movie,description,rating 
from Cinema 
where id%2 != 0 and description != "boring" 
order by rating desc;

-- Bonus less than 1000

select Employee.name,Bonus.bonus 
from Employee 
left join Bonus 
on Employee.empId = Bonus.empId 
where (bonus < 1000) or (bonus is null);

-- Employees having highest number of orders

select customer_number 
from (select count(*) as counter,customer_number
from Orders 
group by customer_number) as SubTable
order by counter desc
limit 1;