-----Task 1

----1
select concat(concat(last_name,','),first_name) as "Full Name" , concat(email,'@megacorp.com') 
from employees;

----2

select last_name, concat('NZD ',salary) as "Salary", nvl(TO_CHAR(commission_pct) , 'No Commission') as "Commision %", 
nvl(to_char(salary*commission_pct),'No Commission') as "Commission" 
from employees
order by last_name; 

----3
select concat(concat(first_name,','),last_name) as "Full Name", 
concat(length(first_name)+length(last_name),' Char') as "Name Length",
to_char(hire_date,'Day') as "Hire Day", to_char(hire_date,'MONTH DDth YYYY') as "Hire Date"
from employees
where commission_pct is not null and job_id<>'SA_MAN';


----4
select concat(concat(first_name,','),last_name) as "Full Name", job_id as "Job Title",
concat(email,'@megacorp.com')
from employees
where lower(first_name) = lower('&first_name');

-----5
select min(salary), max(salary), round(avg(salary),2), round(stddev(salary),2) from employees;

-----6
select job_id as "Job Title", count(*) as "Number of Staff" from employees
group by job_id
order by "Number of Staff" desc;

-----7
select min(salary), max(salary), round(avg(salary),2), round(stddev(salary),2) 
from employees
where department_id=80;

-----8
select e.department_id, d.department_name, round(avg(e.salary),2) as "Average Salary"
from employees e, departments d
where e.department_id=d.department_id
group by e.department_id, d.department_name
order by avg(salary) desc;

-----9
select e.department_id, d.department_name, round(avg(e.salary),2) as "Average Salary"
from employees e, departments d
where e.department_id=d.department_id
group by e.department_id, d.department_name
having avg(salary)>6000
order by avg(salary) desc;

--------10
select concat(concat(e.first_name,','),e.last_name) as "Full Name", 
j.job_title as "Job Title", d.department_name as "Department Name", jh.start_date as "Start Date", jh.end_date,
trunc(MONTHS_BETWEEN(jh.end_date,jh.start_date),0) as "#Months in Position"
from employees e, jobs j, job_history jh, departments d
where e.department_id = d.department_id and e.job_id = j.job_id;