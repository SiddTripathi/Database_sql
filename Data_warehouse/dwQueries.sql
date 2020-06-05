-----Task 1--------

select * from (select p.product_name,sum(tf.total_sale)as "Total_Sale", rank() over(order by sum(tf.total_sale) desc) as "Rank"
from product p,transaction_fact tf, date_table dt
where p.product_id = tf.product_id and tf.date_id=dt.date_id and dt.month_num=12
group by p.product_name) where rownum<6;


----Task 2------
select * from(select
s.store_name,sum(tf.total_sale) as "Total Sale",rank() over(order by sum(tf.total_sale) desc) as "Rank"
from store s, transaction_fact tf
where s.store_id = tf.store_id
group by s.store_name
) where rownum<=1;

--------------Task 3-------


select * from(select p.product_name,sum(tf.total_sale)as Total_Sale,dt.month,rank() over(partition by dt.month order by sum(tf.total_sale) desc)as rank
from product p,transaction_fact tf,date_table dt
where p.product_id = tf.product_id and tf.date_id = dt.date_id and 
dt.month_num in (select * from(select unique(month_num) from date_table where month_num<=&month order by month_num desc) where rownum<=3) 
group by dt.month,p.product_name
order by total_sale desc)res where res.rank<=3 order by res.month, res.rank; 


----Task-4------

create MATERIALIZED View storeanalysis as select s.store_id, p.product_id,sum(tf.total_sale)
from product p, store s, transaction_fact tf
where tf.store_id = s.store_id and tf.product_id =p.product_id
group by s.store_id,p.product_id
order by s.store_id,p.product_id;


--------Task5------
select s.store_id, p.product_id,sum(tf.total_sale)
from product p, store s, transaction_fact tf
where tf.store_id = s.store_id and tf.product_id =p.product_id
group by CUBE(s.store_id,p.product_id)
order by s.store_id,p.product_id;

select s.store_id, p.product_id,sum(tf.total_sale)
from product p, store s, transaction_fact tf
where tf.store_id = s.store_id and tf.product_id =p.product_id
group by ROLLUP(s.store_id,p.product_id)
order by s.store_id,p.product_id;


select * from date_table where date_id=51;
select* from transaction_fact;

select t.transaction_id,t.date_id, d.month,t.customer_id from transaction_fact t, date_table d where d.date_id=t.date_id;