--------------------------------------------------------
--  File created - Friday-June-05-2020   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Procedure INLJ
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "HTR0018"."INLJ" AS


trans_id TRANSACTIONS.TRANSACTIONS_ID%type;
prod_id TRANSACTIONS.PRODUCT_ID%type;
cust_id TRANSACTIONS.CUSTOMER_ID%type;
cust_name TRANSACTIONS.CUSTOMER_NAME%type;
st_id TRANSACTIONS.STORE_ID%type;
st_name TRANSACTIONS.STORE_NAME%type;
trans_date TRANSACTIONS.T_DATE%type;
trans_quant TRANSACTIONS.QUANTITY%type;


type trans_type IS varray(50) of TRANSACTIONS%ROWTYPE;
transact trans_type;


md_prod_id MASTERDATA.PRODUCT_ID%type;
prod_name MASTERDATA.PRODUCT_NAME%type;
supp_id MASTERDATA.SUPPLIER_ID%type;
supp_name MASTERDATA.SUPPLIER_NAME%type;
md_price MASTERDATA.PRICE%type;
t_date_id date_table.date_id%type;
id_check NUMBER;
countr NUMBER;
loop_numb NUMBER;



CURSOR trans_fetch is 
SELECT * FROM transactions;
BEGIN
OPEN trans_fetch;

CREATE_DATE_TABLE(
    YEAR_NUM => 2019
  );
LOOP
loop_numb:=loop_numb+1;
FETCH trans_fetch BULK COLLECT INTO transact LIMIT 50;
EXIT WHEN trans_fetch%notfound;
FOR countr in 1..50

LOOP 
trans_id:=transact(countr).transactions_id;
prod_id:=transact(countr).product_id;
cust_id:=transact(countr).customer_id;
cust_name:=transact(countr).customer_name;
st_id:=transact(countr).store_id;
st_name:=transact(countr).store_name;
trans_date:=transact(countr).t_date;
trans_quant:=transact(countr).quantity;
SELECT product_id,product_name,supplier_id,supplier_name,price
INTO md_prod_id,prod_name,supp_id,supp_name,md_price
FROM MASTERDATA
WHERE product_id=prod_id;
--ADDING DATA IN DIMENSION TABLES
SELECT date_id INTO t_date_id FROM date_table WHERE t_date=trans_date;

SELECT COUNT(*) INTO id_check FROM product WHERE product_id=prod_id;
IF(id_check=0) THEN 
INSERT INTO product VALUES(prod_id,prod_name,md_price);
END IF;
SELECT COUNT(*) INTO id_check FROM customer WHERE customer_id=cust_id;
IF(id_check=0) THEN 
INSERT INTO customer VALUES(cust_id,cust_name);
END IF;
SELECT COUNT(*) INTO id_check FROM supplier WHERE supplier_id=supp_id;
IF(id_check=0) THEN 
INSERT INTO supplier VALUES(supp_id,supp_name);
END IF;
SELECT count(*) INTO id_check FROM store WHERE store_id=st_id;
IF(id_check=0) THEN 
INSERT INTO store VALUES(st_id,st_name);
END IF;
SELECT count(*) INTO id_check FROM transaction_fact WHERE transaction_id=trans_id;
IF(id_check=0) THEN 
INSERT INTO transaction_fact VALUES(trans_id,t_date_id,trans_quant,prod_id,cust_id,supp_id,st_id,trans_quant*md_price);
END IF;
END LOOP;

END LOOP;

COMMIT;
Exception
WHEN OTHERS THEN
dbms_output.put_line(countr||loop_numb);
dbms_output.put_line(dbms_utility.format_call_stack());
END INLJ;

/
