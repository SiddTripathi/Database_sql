drop table transaction_fact;
drop table product;
drop table supplier;
drop table customer;
drop table store;
drop table date_table;
drop materialized view storeanalysis;



--SQL statement for creating Dimension table Product
--PK-->product_id
create table product(
product_id varchar2(6),
product_name varchar2(30) not null,
price number(5,2) default 0.0,
constraint product_id_pk Primary key (product_id));


--SQL statement for creating Dimension table Supplier
--PK-->supplier_id
create table supplier(
supplier_id varchar2(5),
supplier_name varchar2(30) not null,
constraint supplier_id_pk primary key (supplier_id)
);

--SQL statement for creating Dimension table Customer
--PK-->customer_id
create table customer(
customer_id varchar2(4),
customer_name varchar2(30) not null,
constraint customer_id_pk primary key (customer_id)
);

--SQL statement for creating Dimension table Store
--PK-->store_id
create table store(
store_id varchar2(4),
store_name varchar2(20) not null,
constraint store_id_pk primary key (store_id)
);

--SQL statement for creating Dimension table date_table
--PK-->date_id
Create table date_table(
date_id NUMBER,
day NUMBER,
MONTH varchar(10),
month_num number,
t_date date,
year number(4),
quart number,
constraint date_id_pk primary key (date_id));


--SQL statement for creating fact table Transaction_Fact
--PK-->transaction_id
create table transaction_fact(
transaction_id number(8,0),
date_id NUMBER,
--t_date date not null,
quantity number(3,0) not null,
product_id varchar2(6) not null,
customer_id varchar2(4) not null,
supplier_id varchar2(5) not null,
store_id varchar2(4) not null,
total_sale number(6,2) not null,
constraint transaction_id_pk primary key (transaction_id),
constraint product_id_fk FOREIGN key (product_id)references product(product_id),
constraint customer_id_fk FOREIGN key (customer_id)references customer(customer_id),
constraint supplier_id_fk FOREIGN key (supplier_id)references supplier(supplier_id),
constraint store_id_fk FOREIGN key (store_id)references store(store_id),
constraint date_id_fk FOREIGN key (date_id)references date_table(date_id)
);

commit;