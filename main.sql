-- Combine Two Tables

select Person.firstName,Person.lastName,Address.city,Address.state from Person left join Address on Person.personId = Address.personId;

-- Not Boring Movies

Select id,movie,description,rating from Cinema where id%2 != 0 and description != "boring" order by rating desc;