-- 11.Confirmation Rate

select user_id,round(avg(counter),2) as confirmation_rate 
from (select Signups.user_id, 
case
when Confirmations.action = 'confirmed' then 1
else 0
end as counter
from Signups 
left join Confirmations 
on Signups.user_id = Confirmations.user_id) as ctable
group by user_id;

-- 12.At Least 5 Students

select class from
(select class,count(*) as counter 
from Courses group by class) as tabler 
where counter >=5;

-- 13.Employee salary < 30000

select employee_id 
from Employees 
where manager_id 
not in (select employee_id from Employees) and salary < 30000 
order by employee_id;

-- 14. Biggest Single Number

select max(num) as num
from (select *,count(num) as counter 
from MyNumbers 
group by num) as ctable 
where counter = 1;

-- 15. Last Person to Fit in the Bus

select person_name from
(select person_id,person_name,weight,sum(weight) over (order by turn) as total_sum  
from Queue order by turn) as stable
where total_sum <= 1000 
order by total_sum desc 
limit 1;

-- 16. Patients with Conditions

select * from Patients 
where conditions 
like '% DIAB1%' or conditions like 'DIAB1%'

-- 17. No. of Employees

select a.employee_id,a.name,count(*) as reports_count,round(avg(b.age),0) as average_age 
from Employees a 
join Employees b 
on a.employee_id = b.reports_to 
group by b.reports_to 
having b.reports_to 
is not null 
order by a.employee_id;