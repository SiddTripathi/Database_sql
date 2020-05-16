select * from hotel;
select * from booking;
select * from room;
select * from employees;
select * from departments;
select * from locations;
select * from countries;
select * from job_history;
select * from jobs;
select * from guest;

----1
select h.hotelname, r.type, r.price   from hotel h, room r where h.hotelno = r.hotelno;

-----2
select h.hotelname, g.guestname, b.datefrom, b.dateto from hotel h,booking b, guest g 
where h.hotelno=b.hotelno and g.guestno=b.guestno;

--Task2
----1----
select e.first_name||' '||e.last_name as "Full Name", e.job_id as "Job Title",d.department_name 
from employees e, departments d where e.department_id=d.department_id;

----2-----
select e.first_name||' '||e.last_name as "Full Name", e.email as "Email",d.department_name as "Department Name",
l.city||','||c.country_name as "Full Address"
from employees e, departments d, locations l, countries c
where e.department_id = d.department_id and d.location_id=l.location_id and l.country_id=c.country_id
order by e.last_name;

----3----
select e.first_name||' '||e.last_name as "Full Name", e.email as "Email",d.department_name as "Department Name",
l.city||','||c.country_name as "Full Address"
from employees e, departments d, locations l, countries c
where e.department_id = d.department_id and d.location_id=l.location_id and l.country_id=c.country_id and c.country_name='&country'; 

-----4---
select e.first_name||' '||e.last_name as "Full Name", jo.job_title as "Job Title",d.department_name as "Department Name", j.start_date, j.end_date
from employees e, departments d, job_history j, jobs jo
where e.job_id=j.job_id and e.department_id = d.department_id and e.job_id = jo.job_id
order by e.employee_id,j.start_date;

------5------
select e.first_name||' '||e.last_name as "Full Name" , d.department_name
from employees e, departments d
where d.department_id=e.department_id(+);

----6-------
select e.first_name||' '||e.last_name as "Full Name", 
e.employee_id as "Employee#", e.manager_id as "Manager#",eh.first_name||''||eh.last_name as "Manager Name"
from employees e,employees eh
where e.manager_id=eh.employee_id;

 --------7-----
select e.first_name||' '||e.last_name as "Full Name", 
e.employee_id as "Employee#", e.manager_id as "Manager#",eh.first_name||''||eh.last_name as "Manager Name"
from employees e,employees eh
where e.manager_id=eh.employee_id (+) ;

-----8
select e.first_name||' '||e.last_name as "Full Name",jo.job_title as "Job Title",e.salary
from employees e, jobs jo
where e.job_id = jo.job_id and e.salary>(select avg(salary) from employees);

