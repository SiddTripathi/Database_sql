------Review Task------
drop table emp_1;
-----1-------
create table emp_1 (
EMP_NUM char(3),
EMP_LNAME varchar(15) not null,
EMP_FNAME varchar(15) not null,
EMP_INITIAL char(1),
EMP_HIREDATE date,
JOB_CODE varchar2(3),
CONSTRAINT emp_num_pk Primary Key (EMP_NUM),
CONSTRAINT job_code_fk Foreign Key(JOB_CODE) REFERENCES job(job_code)
);

----2-------
insert into emp_1 (EMP_NUM, EMP_LNAME,EMP_FNAME, EMP_INITIAL,EMP_HIREDATE,JOB_CODE)
values ('&EMP_NUM','&EMP_LNAME','&EMP_FNAME','&EMP_INITIAL','&EMP_HIREDATE','&JOB_CODE');

-----3----
commit;


-----4-------
select * from emp_1 where job_code=502;

-----5-------------
update emp_1 set job_code = '501' where emp_num ='107';


--------6-------
delete from emp_1 where 
emp_fname='William' and 
emp_lname='Smithfield' and 
emp_hiredate='06/22/2004' and 
job_code='500';

----7------

create table emp_2
as select * from emp_1;

select * from emp_2;

ALTER TABLE EMP_2
ADD (EMP_PCT NUMBER (4,2), PROJ_NUM CHAR(3));


