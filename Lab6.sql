select * from student;
select * from course;
select * from grade;

------Task 1---------
insert into student (student_no,student_name,student_address)
VALUES ('&student_no','&student_name','&student_address');

insert into course (course_no,course_name,course_details)
values ('&course_no','&course_name','&course_details');

insert into grade (student_no,course_no,grade)
values ('&student_no','&course_no',&grade);


select s.student_no, s.student_name, c.course_no, c.course_name, g.grade 
from student s, course c, grade g where s.student_no = g.student_no and c.course_no=g.course_no; 

-----Task 2----

insert into regions (region_id, region_name)
values (5,'Australia and Ocenia');

insert into countries (country_id,country_name,region_id)
values ('NZ','New Zealand',5);


insert into locations (location_id,street_address,postal_code,city,state_province,country_id)
values (3300,'AUT City Campus, WT Building',1010,'Auckland','Auckland','NZ');

insert into departments (department_id,department_name,manager_id,location_id)
values (280,'Research Development',100,3300);

insert into employees (employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id)
values (&employee_id,'&first_name','&last_name','&email','&phone_number','&hire_date','&job_id',&salary,&commission_pct,&manager_id,&department_id);


----Task3-----
select * from employees;
update employees SET commission_pct=0.05 where employee_id=208;