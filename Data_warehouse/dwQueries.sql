
----****
--OLAP QUERIES
----****

---*************-------
-------Task 1----------
-------Top 5 Products in terms of sale in december month
---*************-------

select * from 
  (
   select p.product_name,sum(tf.total_sale)as "Total_Sale", 
   rank() over(order by sum(tf.total_sale) desc) as "Rank"
   from product p,transaction_fact tf, date_table dt
   where p.product_id = tf.product_id and tf.date_id=dt.date_id and dt.month_num=12
   group by p.product_name
   ) 
where rownum<6;


---*************-------
-------Task 2----------
--- top store in terms of sales in a year
---*************-------

select * from
 (select
  s.store_name,sum(tf.total_sale) as "Total Sale",
  rank() over(order by sum(tf.total_sale) desc) as "Rank"
  from store s, transaction_fact tf
  where s.store_id = tf.store_id
  group by s.store_name
 ) 
where rownum<=1;


---*************-------
-------Task 3----------
----Top 3 products for given month
----Enter Month in word-
---*************-------

select * from
     (
      select p.product_name,sum(tf.total_sale)as Total_Sale,
      dt.month,rank() over
        (
         partition by dt.month 
         order by sum(tf.total_sale) desc
         )as rank
      from product p,transaction_fact tf,date_table dt
      where p.product_id = tf.product_id and tf.date_id = dt.date_id and 
      dt.month_num in 
           (
             select * from
              (
                select unique(month_num) 
                from date_table 
                where month_num<=(select UNIQUE(d.month_num) from date_table d where d.MONTH LIKE UPPER('&month%'))
                order by month_num desc
                ) 
              where rownum<=3
             ) 
      group by dt.month,p.product_name
      order by total_sale desc
      )
rslt where rslt.rank<=3 order by rslt.month, rslt.rank; 


---*************-------
-------Task 4----------
---Creating Materialized View
---*************-------

create MATERIALIZED View 

storeanalysis as 

select s.store_id, p.product_id,sum(tf.total_sale) as "Total"
from product p, store s, transaction_fact tf
where tf.store_id = s.store_id and tf.product_id =p.product_id
group by s.store_id,p.product_id
order by s.store_id,p.product_id;




---*************-------
-------Task 5----------
---*************-------


---CUBE  USING Materialized View---

select 
NVL(store_id,'All Stores') as "Stores", 
NVL(product_id,'All Products') as "Products", 
sum("Total") 
from storeanalysis 
group by cube(store_id,product_id );


--ROLLUP USING Materialized View-----

select
NVL(store_id,'All Stores') as "Stores", 
NVL(product_id,'All Products') as "Products", 
sum("Total") 
from storeanalysis 
group by ROLLUP(store_id,product_id );
