------Task 1------


--------1----

create table student (student_no number(4),student_name  varchar2(20) not null,student_address varchar2(50),CONSTRAINT student_student_no_pk PRIMARY KEY (student_no));

-------------2--
create table course (course_no number(2),course_name  varchar2(20) not null,course_details varchar2(50),CONSTRAINT course_course_no_pk PRIMARY KEY (course_no));


-----------3-----
create table grade (student_no number(4),course_no number(2),grade  number(3) not null,constraint grade_pk PRIMARY KEY (student_no,course_no),
constraint grade_student_no_fk Foreign Key(student_no) References student(student_no),constraint grade_course_no_fk Foreign Key(course_no) References course(course_no));



-----Task2-------




----table category----
create table category
( category_id varchar2(2) not null, 
category_name varchar2(20),
category_details varchar2(100),
constraint category_category_id_pk primary key(category_id));


----table item desc-----
create table item_desc(
item_id varchar2(6) not null,
category_id varchar2(2) not null,
primary_desc varchar2(50),
secondary_desc varchar2(50),
color_desc varchar2(10),
size_desc varchar2(10),
status_code char(1) not null,
production_date date,
expiry_date date,
brand_name varchar2(20),
constraint item_desc_pk primary key(item_id),
constraint item_desc_category_fk foreign key(category_id) references category(category_id));


----table store_information---
create table store_information(
store_id varchar2(3) not null,
store_name varchar2(20) not null,
street_name varchar2(20),
city varchar2(20),
zip_code varchar2(6),
phone_nbr varchar2(20),
manager_name varchar2(30),
open_sunday_flag char(1) not null,
CONSTRAINT store_information_pk primary key(store_id)
);


-----table membership_index-----
create table members_index(
membership_id varchar2(6) not null,
customer_name varchar2(20),
address varchar2(50),
members_type varchar2(10) not null,
join_date date not null,
member_status char(1),
member_points number(3),
CONSTRAINT members_index_pk primary key(membership_id)
);

--table store_visit----
create table store_visit(
visit_id varchar2(6) not null,
store_id varchar2(3) not null,
membership_id varchar2(6) not null,
transaction_date date,
tot_unique_itm_cnt number(2),
tot_visit_amt number(5,3),
CONSTRAINT store_visit_pk primary key(visit_id),
CONSTRAINT table9_store_information_fk foreign key(store_id) references store_information(store_id),
CONSTRAINT table9_members_index_fk foreign key(membership_id) references members_index(membership_id)
);


-----table item_scan-----
create table item_scan(
visit_id varchar2(6) not null,
item_id varchar2(6) not null,
quantity number(2),
unit_cost number(5,3),
unit_total_cost number(5,3),
CONSTRAINT item_scan_pk primary key(visit_id,item_id),
CONSTRAINT item_scan_item_desc_fk foreign key(item_id) references item_desc(item_id),
CONSTRAINT item_scan_store_visit_fk foreign key(visit_id) references store_visit(visit_id)
);

