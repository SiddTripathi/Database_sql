-------Lab 2------
select * from employees;
----1-----
select e.first_name||' '||e.last_name as "Full Name",j.job_id from employees e,jobs j 
where e.job_id=j.job_id and e.salary>10000;
-----*----

----2-------
select e.first_name||' '||e.last_name as "Full Name",j.job_id from employees e,jobs j 
where e.job_id=j.job_id and (e.salary between 5000 and 12000);

---3------
select e.first_name||' '||e.last_name as "Full Name",j.job_id, e.hire_date as "Start Date" from employees e,jobs j
where e.job_id=j.job_id  
and lower(e.first_name||' '||e.last_name) in ('alyssa hutton','david austin');


-----4-------
select l.street_address,l.postal_code,l.city from locations l where l.country_id in ('JP','IT');

----5----
select e.first_name||' '||e.last_name  as "Full Name", 'Phone: '||e.phone_number||'Email: '||e.email as "Contact Details"
from employees e
where e.hire_date between '01-01-96' and '31-01-96' order by e.last_name;

--------7
select e.first_name||' '||e.last_name  as "Full Name", 'Phone: '||e.phone_number||'Email: '||e.email as "Contact Details"
from employees e where e.hire_date>'31-Dec-99'
 order by e.hire_date desc;


-------8

select * from employees where lower(first_name) like 's%n';

-------9 
select * from employees where job_id IN ('(AC_MGR', 'AD_VP', 'FI_MGR', 'HR_REP', 'PR_REP');

-------10
select * from employees where job_id  not IN ('(AC_MGR', 'AD_VP', 'FI_MGR', 'HR_REP', 'PR_REP');

-----11

SELECT e.employee_id, e.last_name, e.salary, d.department_name 
FROM employees e, departments d
WHERE d.manager_id = &manager_id and e.department_id = d.department_id;



-------task2
 
-----1------
select * from room where price>40 order by type,price asc;

-------2
select * from guest where GUESTADDRESS LIKE '8 Mount St%'

