--------------------------------------------------------
--  File created - Monday-June-01-2020   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Procedure INLJ
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "HTR0018"."INLJ" AS

tr_id transactions.transactions_id%type;
pr_id transactions.product_id%type;
cu_id transactions.customer_id%type;
cu_name transactions.customer_name%type;
st_id transactions.store_id%type;
st_name transactions.store_name%type;
tt_date transactions.t_date%type;
tr_quant transactions.quantity%type;
md_pr_id masterdata.product_id%type;
pr_name masterdata.product_name%type;
sup_id masterdata.supplier_id%type;
sup_name masterdata.supplier_name%type;
md_price masterdata.price%type;
counter number;
id_check number;
cursor transactions_fetch is 
select * from transactions;

BEGIN
  counter:=0;
  Open transactions_fetch;
  loop
  counter:=0;
  loop
  fetch transactions_fetch INTO tr_id,pr_id,cu_id,cu_name,st_id,st_name,tt_date,tr_quant;
  
  select product_id,product_name,supplier_id,supplier_name,price
  into md_pr_id,pr_name,sup_id,sup_name,md_price
  from masterdata 
  where product_id=pr_id;
  
  counter:=counter+1;
  --dbms_output.put_line(pr_name||counter);
  
  select count(*) into id_check from product where product_id=pr_id;
  if(id_check=0) THEN
  insert into product values (pr_id,pr_name,md_price);
  END IF;
  
  select count(*) into id_check from customer where customer_id=cu_id;
  if(id_check=0) THEN
  insert into customer values (cu_id,cu_name);
  END IF;
  
  select count(*) into id_check from supplier where supplier_id=sup_id;
  if(id_check=0) THEN
  insert into supplier values (sup_id,sup_name);
  END IF;
  
  select count(*) into id_check from store where store_id=st_id;
  if(id_check=0) THEN
  insert into store values (st_id,st_name);
  END IF;
  
  select count(*) into id_check from transaction_fact where transaction_id=tr_id;
  if(id_check=0) THEN
  insert into transaction_fact values (tr_id,tt_date,tr_quant,pr_id,cu_id,sup_id,st_id,tr_quant*md_price);
  END IF;
  
  exit when counter=50 or transactions_fetch%notfound;
  end loop;
  Exit when transactions_fetch%notfound;
  end loop;
 -- dbms_output.put_line(pr_name);
  --dbms_output.put_line(dbms_utility.format_call_stack());
  commit;
END INLJ;

/
