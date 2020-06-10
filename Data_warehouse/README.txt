------README FILE FOR INSTRUCTIONS TO RUN SQL QUERIES FOR ASSIGNMENT 2- NATURE FRESH DW------------

1. CONTENT - THE ZIP FOLDER CONTAINS FOLLOWING sql scripts.
 a)createDW.sql 
 b)INLJ.sql
 c)CREATE_DATE_TABLE.sql
 d)dwQueries.sql
 e)README.txt



2. STEPS TO RUN QUERIES

 Step 1: Run createDW.sql for creating the star-schema DW. This query should create one center fact table - Transaction_fact and
         5 Dimension table - PRODUCT, STORE, CUSTOMER, SUPPLIER and Date_table

 Step 2: Run CREATE_DATE_TABLE.sql. This will create a procedure CREATE_DATE_TABLE which is responsible for inserting data in 
         Date_table. Dont run this procedure seperately as it is called in INLJ procedure and runs automatically when INLJ procedure 
         is run.

 Step 3: Run INLJ.sql. This will create a procedure  for Indexed nested loop join algorithm. After this procedure is created, run this
         Procedure. This procedure loads data into star-schema DW we created in step 1

 Step 4: Run the sql Queries in dwQueries.sql file. The sql queries are in sequence with the tasks given in assignment sheet. For better
         understanding, comments have also been provided at the starting of each query.  


NOTE-1 -> The above steps are written assuming that data source table - TRANSACTIONS, and master data table - MASTERDATA have already been  
        created. In case they are not created, please run Transaction_and_masterData_Generator.sql script

NOTE-2 -> Sometimes, it might be possible that you encounter a disabled run button while running procedure. In such instance, compile the
          procedure (ctrl+F8) first and the button will get enabled. 