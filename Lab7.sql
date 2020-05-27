---Creating database salesCo

--ALTER SESSION SET NLS_DATE_FORMAT = 'MM/DD/YYYY';
--
--DROP TABLE LINE;
--DROP TABLE PRODUCT;
--DROP TABLE INVOICE;
--DROP TABLE VENDOR;
--DROP TABLE CUSTOMER;
--
--CREATE TABLE CUSTOMER (
--CUS_CODE integer PRIMARY KEY,
--CUS_LNAME varchar2(15),
--CUS_FNAME varchar2(15),
--CUS_INITIAL varchar2(1),
--CUS_AREACODE varchar2(3),
--CUS_PHONE varchar2(8),
--CUS_BALANCE number(9,2)
--);
--INSERT INTO CUSTOMER VALUES('10010','Ramas','Alfred','A','615','844-2573','0');
--INSERT INTO CUSTOMER VALUES('10011','Dunne','Leona','K','713','894-1238','0');
--INSERT INTO CUSTOMER VALUES('10012','Smith','Kathy','W','615','894-2285','345.86');
--INSERT INTO CUSTOMER VALUES('10013','Olowski','Paul','F','615','894-2180','536.75');
--INSERT INTO CUSTOMER VALUES('10014','Orlando','Myron','','615','222-1672','0');
--INSERT INTO CUSTOMER VALUES('10015','O''Brian','Amy','B','713','442-3381','0');
--INSERT INTO CUSTOMER VALUES('10016','Brown','James','G','615','297-1228','221.19');
--INSERT INTO CUSTOMER VALUES('10017','Williams','George','','615','290-2556','768.93');
--INSERT INTO CUSTOMER VALUES('10018','Farriss','Anne','G','713','382-7185','216.55');
--INSERT INTO CUSTOMER VALUES('10019','Smith','Olette','K','615','297-3809','0');
--
--/* -- */
--
--
--
--CREATE TABLE INVOICE (
--INV_NUMBER integer PRIMARY KEY,
--CUS_CODE integer REFERENCES customer,
--INV_DATE date
--);
--INSERT INTO INVOICE VALUES('1001','10014','1/16/2008');
--INSERT INTO INVOICE VALUES('1002','10011','1/16/2008');
--INSERT INTO INVOICE VALUES('1003','10012','1/16/2008');
--INSERT INTO INVOICE VALUES('1004','10011','1/17/2008');
--INSERT INTO INVOICE VALUES('1005','10018','1/17/2008');
--INSERT INTO INVOICE VALUES('1006','10014','1/17/2008');
--INSERT INTO INVOICE VALUES('1007','10015','1/17/2008');
--INSERT INTO INVOICE VALUES('1008','10011','1/17/2008');
--
--/* -- */
--
--CREATE TABLE VENDOR (
--V_CODE integer PRIMARY KEY,
--V_NAME varchar2(15),
--V_CONTACT varchar2(50),
--V_AREACODE varchar2(3),
--V_PHONE varchar2(8),
--V_STATE varchar2(2),
--V_ORDER varchar2(1)
--);
--INSERT INTO VENDOR VALUES('21225','Bryson, Inc.','Smithson','615','223-3234','TN','Y');
--INSERT INTO VENDOR VALUES('21226','SuperLoo, Inc.','Flushing','904','215-8995','FL','N');
--INSERT INTO VENDOR VALUES('21231','DE Supply','Singh','615','228-3245','TN','Y');
--INSERT INTO VENDOR VALUES('21344','Gomez Bros.','Ortega','615','889-2546','KY','N');
--INSERT INTO VENDOR VALUES('22567','Dome Supply','Smith','901','678-1419','GA','N');
--INSERT INTO VENDOR VALUES('23119','Randsets Ltd.','Anderson','901','678-3998','GA','Y');
--INSERT INTO VENDOR VALUES('24004','Brackman Bros.','Browning','615','228-1410','TN','N');
--INSERT INTO VENDOR VALUES('24288','ORDVA, Inc.','Hakford','615','898-1234','TN','Y');
--INSERT INTO VENDOR VALUES('25443','BK, Inc.','Smith','904','227-0093','FL','N');
--INSERT INTO VENDOR VALUES('25501','Damal Supplies','Smythe','615','890-3529','TN','N');
--INSERT INTO VENDOR VALUES('25595','Rubicon Systems','Orton','904','456-0092','FL','Y');
--
--/* -- */
--
--CREATE TABLE LINE (
--INV_NUMBER integer REFERENCES Invoice,
--LINE_NUMBER integer,
--P_CODE varchar2(10),
--LINE_UNITS number(9,2),
--LINE_PRICE number(9,2),
--CONSTRAINT line_pk PRIMARY KEY (inv_number,line_number)
--);
--INSERT INTO LINE VALUES('1001','1','13-Q2/P2','1','14.99');
--INSERT INTO LINE VALUES('1001','2','23109-HB','1','9.95');
--INSERT INTO LINE VALUES('1002','1','54778-2T','2','4.99');
--INSERT INTO LINE VALUES('1003','1','2238/QPD','1','38.95');
--INSERT INTO LINE VALUES('1003','2','1546-QQ2','1','39.95');
--INSERT INTO LINE VALUES('1003','3','13-Q2/P2','5','14.99');
--INSERT INTO LINE VALUES('1004','1','54778-2T','3','4.99');
--INSERT INTO LINE VALUES('1004','2','23109-HB','2','9.95');
--INSERT INTO LINE VALUES('1005','1','PVC23DRT','12','5.87');
--INSERT INTO LINE VALUES('1006','1','SM-18277','3','6.99');
--INSERT INTO LINE VALUES('1006','2','2232/QTY','1','109.92');
--INSERT INTO LINE VALUES('1006','3','23109-HB','1','9.95');
--INSERT INTO LINE VALUES('1006','4','89-WRE-Q','1','256.99');
--INSERT INTO LINE VALUES('1007','1','13-Q2/P2','2','14.99');
--INSERT INTO LINE VALUES('1007','2','54778-2T','1','4.99');
--INSERT INTO LINE VALUES('1008','1','PVC23DRT','5','5.87');
--INSERT INTO LINE VALUES('1008','2','WR3/TT3','3','119.95');
--INSERT INTO LINE VALUES('1008','3','23109-HB','1','9.95');
--
--
--CREATE TABLE PRODUCT (
--P_CODE varchar2(10) PRIMARY KEY,
--P_DESCRIPT varchar2(35),
--P_INDATE date,
--P_QOH integer,
--P_MIN integer,
--P_PRICE number(8,2),
--P_DISCOUNT number(5,2),
--V_CODE integer REFERENCES Vendor
--);
--INSERT INTO PRODUCT VALUES('11QER/31','Power painter, 15 psi., 3-nozzle','11/3/2007','8','5','109.99','0','25595');
--INSERT INTO PRODUCT VALUES('13-Q2/P2','7.25-in. pwr. saw blade','12/13/2007','32','15', '14.99','0.05','21344');
--INSERT INTO PRODUCT VALUES('14-Q1/L3','9.00-in. pwr. saw blade','11/13/2007','18','12','17.49','0','21344');
--INSERT INTO PRODUCT VALUES('1546-QQ2','Hrd. cloth, 1/4-in., 2x50','1/15/2008','15','8','39.95','0','23119');
--INSERT INTO PRODUCT VALUES('1558-QW1','Hrd. cloth, 1/2-in., 3x50','1/15/2008','23','5','43.99','0','23119');
--INSERT INTO PRODUCT VALUES('2232/QTY','BD jigsaw, 12-in. blade','12/30/2007','8','5','109.92','0.05','24288');
--INSERT INTO PRODUCT VALUES('2232/QWE','BD jigsaw, 8-in. blade','12/24/2007','6','5','99.87','0.05','24288');
--INSERT INTO PRODUCT VALUES('2238/QPD','BD cordless drill, 1/2-in.','1/20/2008','12','5','38.95','0.05','25595');
--INSERT INTO PRODUCT VALUES('23109-HB','Claw hammer','1/20/2008','23','10','9.95','0.1','21225');
--INSERT INTO PRODUCT VALUES('23114-AA','Sledge hammer, 12 lb.','1/2/2008','8','5','14.40','0.05','');
--INSERT INTO PRODUCT VALUES('54778-2T','Rat-tail file, 1/8-in. fine','12/15/2007','43','20','4.99','0','21344');
--INSERT INTO PRODUCT VALUES('89-WRE-Q','Hicut chain saw, 16 in.','2/7/2008','11','5','256.99','0.05','24288');
--INSERT INTO PRODUCT VALUES('PVC23DRT','PVC pipe, 3.5-in., 8-ft','2/20/2008','188','75','5.87','0','');
--INSERT INTO PRODUCT VALUES('SM-18277','1.25-in. metal screw, 25','3/1/2008','172','75','6.99','0','21225');
--INSERT INTO PRODUCT VALUES('SW-23116','2.5-in. wd. screw, 50','2/24/2008','237','100','8.45','0','21231');
--INSERT INTO PRODUCT VALUES('WR3/TT3','Steel matting, 4''x8''x1/6", .5" mesh','1/17/2008','18','5','119.95','0.1','25595');


/* -- */


---Task 1------
select * from  LINE;
select * from PRODUCT;
select * from INVOICE;
select * from VENDOR;
select * from CUSTOMER;

---1-------
select COUNT(*) from customer where cus_balance>500;

-----2------
select p.p_code, p.p_descript from product p where p.v_code is not null;

-----3------
select c.cus_fname,c.cus_lname,c.cus_phone from customer c where c.cus_fname like 'A%' order by c.cus_fname;

---4----

select SUM(cus_balance) as "Total Balance", Min(cus_balance) as "Minimum Balance", 
Max(cus_balance) as "Maximum Balance", AVG(cus_balance) as "Average Balance" from customer;

---5-------


select DISTINCT i.cus_code,i.inv_number,i.inv_date,p.p_descript,l.line_units,l.line_price  
from customer c, invoice i,product p, line l
where c.cus_code=i.cus_code and i.inv_number = l.inv_number and p.p_code=l.p_code
order by i.cus_code,i.inv_number;

-----6-----

select inv_number INVOICE, sum(line_units*line_price) "Total Value" from  line l
group by inv_number
having sum(l.line_units*l.line_price)>100;

-----7-------
SELECT cus_code FROM customer
MINUS
SELECT cus_code FROM invoice;