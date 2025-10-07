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