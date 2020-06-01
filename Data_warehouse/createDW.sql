drop table transaction_fact;
drop table product;
drop table supplier;
drop table customer;
drop table store;


create table product(
product_id varchar2(6),
product_name varchar2(30) not null,
price number(5,2) default 0.0,
constraint product_id_pk Primary key (product_id));


create table supplier(
supplier_id varchar2(5),
supplier_name varchar2(30) not null,
constraint supplier_id_pk primary key (supplier_id)
);

create table customer(
customer_id varchar2(4),
customer_name varchar2(30) not null,
constraint customer_id_pk primary key (customer_id)
);

create table store(
store_id varchar2(4),
store_name varchar2(20) not null,
constraint store_id_pk primary key (store_id)
);

create table transaction_fact(
transaction_id number(8,0),
t_date date not null,
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
constraint store_id_fk FOREIGN key (store_id)references store(store_id)

);

insert into product(product_id,product_name,price)
select md.product_id,md.product_name,md.price from  masterdata md;

insert into supplier (supplier_id,supplier_name)
select unique(md.supplier_id),md.supplier_name from masterdata md;

insert into customer (customer_id,customer_name)
select unique(t.customer_id),t.customer_name from transactions t, masterdata md;

insert into store (store_id,store_name)
select unique(t.store_id),t.store_name from masterdata md,transactions t;



insert into transaction_fact
select t.transactions_id,t.t_date, t.quantity,t.product_id,t.customer_id,md.supplier_id,t.store_id,t.quantity*md.price
from transactions t, masterdata md
where t.product_id = md.product_id;
commit;