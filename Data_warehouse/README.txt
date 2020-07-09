------README FILE FOR INSTRUCTIONS TO RUN SQL QUERIES FOR ASSIGNMENT 2- NATURE FRESH DW------------

1. CONTENT - THE ZIP FOLDER CONTAINS FOLLOWING sql scripts.
 a)Transaction_and_Masterdata_Generator.sql
 b)createDW.sql 
 c)INLJ.sql
 d)CREATE_DATE.sql
 e)dwQueries.sql
 f)Data_warehouse_report
 g)README.txt



2. STEPS TO RUN QUERIES

 Step 1: First of all, run Transaction_and_Masterdata_Generator.sql. Run createDW.sql for creating the star-schema DW. This query should create one center fact table - Transaction_fact and
         5 Dimension table - PRODUCT, STORE, CUSTOMER, SUPPLIER and DATE_TABLE

 Step 2: Run CREATE_DATE.sql. This will create a procedure CREATE_DATE which is responsible for inserting data in 
         Date_table. Dont run this procedure seperately as it is called in INLJ procedure and runs automatically when INLJ procedure 
         is run.

 Step 3: Run INLJ.sql. This will create a procedure  for Indexed nested loop join algorithm. After this procedure is created, run this
         Procedure. This procedure loads data into star-schema DW we created in step 1

 Step 4: Run the sql Queries in dwQueries.sql file. The sql queries are in sequence with the tasks given in assignment sheet. For better
         understanding, comments have also been provided at the starting of each query.  



NOTE-1 -> Sometimes, it might be possible that you encounter a disabled run button while running procedure. In such instance, compile the
          procedure (ctrl+F8) first and the button will get enabled. 

NOTE-2 -> Detailed report of this task is provided in pdf file named Data_warehouse_report.