--------------------------------------------------------
--  File created - Friday-June-05-2020   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Procedure CREATE_DATE_TABLE
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "HTR0018"."CREATE_DATE_TABLE" (year_num NUMBER) AS 
leap_num NUMBER;
type monthseq IS varray(12) of NUMBER;
month_seq monthseq;
type trans_type IS varray(50) of TRANSACTIONS%ROWTYPE;
start_date Date;
quart number;
BEGIN
start_date:=TO_DATE('01-JAN-'||TO_CHAR(year_num));
--for i in 1..12 
--LOOP
----month_seq(i):= i;
--END LOOP;
leap_num:=365;
IF(mod(year_num,4)=0 ) THEN
leap_num:=366;
ELSIF (mod(year_num,4)=0 and mod(year_num,100)=0) THEN
leap_num:=365;
ELSIF (mod(year_num,4)=0)THEN
leap_num:=366;
END IF;
dbms_output.put_line(leap_num||start_date);
--dbms_output.put_line(dbms_utility.format_call_stack());
FOR i in 1..leap_num
LOOP
IF(extract(month from start_date) IN (1,2,3)) THEN
quart:=1;
ELSIF(extract(month from start_date) IN (4,5,6)) THEN
quart:=2;
ELSIF(extract(month from start_date) IN (7,8,9)) THEN
quart:=3;
ELSIF(extract(month from start_date) IN (10,11,12)) THEN
quart:=4;
END IF;
insert into date_table values(DATE_ID_SEQ.nextval,extract(day from start_date),to_char(start_date,'MONTH'),extract(month from start_date),start_date,year_num,quart);
dbms_output.put_line(extract(day from start_date)||extract(month from start_date)||quart);
start_date:=start_date+1;
END LOOP;
dbms_output.put_line(dbms_utility.format_call_stack());
commit;
EXCEPTION
WHEN others then
dbms_output.put_line(extract(day from start_date)||to_char(start_date,'MONTH'));

END CREATE_DATE_TABLE;

/
