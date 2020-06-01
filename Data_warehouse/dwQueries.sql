-----Task 1--------

select * from (select p.product_name,sum(tf.total_sale)as "Total_Sale", rank() over(order by sum(tf.total_sale) desc) as "Rank"
from product p,transaction_fact tf
where p.product_id = tf.product_id and extract(month from tf.t_date)=12
group by p.product_name) where rownum<6;


----Task 2------
select * from(select
s.store_name,sum(tf.total_sale) as "Total Sale",rank() over(order by sum(tf.total_sale) desc) as "Rank"
from store s, transaction_fact tf
where s.store_id = tf.store_id
group by s.store_name
) where rownum<=1;

--------------Task 3-------
select * from(select p.product_name,sum(tf.total_sale)as "Total Sale",rank() over(order by sum(tf.total_sale) desc) ||' '||extract(month from tf.t_date)as "Rank"
from product p,transaction_fact tf
where p.product_id = tf.product_id and extract(month from tf.t_date) =12
group by p.product_name,extract(month from tf.t_date)
) where rownum<4
union
select * from(select p.product_name,sum(tf.total_sale)as "Total Sale",rank() over(order by sum(tf.total_sale) desc)||' '||extract(month from tf.t_date) as "Rank"
from product p,transaction_fact tf
where p.product_id = tf.product_id and extract(month from tf.t_date) =11
group by p.product_name,extract(month from tf.t_date)
) where rownum<4
union
select * from(select p.product_name,sum(tf.total_sale)as "Total Sale",rank() over(order by sum(tf.total_sale) desc) ||' '||extract(month from tf.t_date) as "Rank"
from product p,transaction_fact tf
where p.product_id = tf.product_id and extract(month from tf.t_date) =10
group by p.product_name,extract(month from tf.t_date)
) where rownum<4;


----Task-4------

create MATERIALIZED View storeanalysis as select s.store_id, p.product_id,sum(tf.total_sale)
from product p, store s, transaction_fact tf
where tf.store_id = s.store_id and tf.product_id =p.product_id
group by s.store_id,p.product_id
order by s.store_id,p.product_id;



