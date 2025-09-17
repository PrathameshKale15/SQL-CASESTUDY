SQL> set pagesize 200;
SQL> set linesize 200;
SQL> --create customers table
SQL> CREATE TABLE CUSTOMERS(
  2  CUSTOMER_ID NUMBER PRIMACREATE TABLE CUSTOMERS(
  3  /
CUSTOMER_ID NUMBER PRIMACREATE TABLE CUSTOMERS(
                   *
ERROR at line 2:
ORA-00907: missing right parenthesis 


SQL> CREATE TABLE CUSTOMERS(
  2  CUSTOMER_ID NUMBER PRIMARY KEY,
  3  NAME VARCHAR2(100) NOT NULL,
  4  EMAIL VARCHAR2(100) UNIQUE,
  5  PHONE VARCHAR2(15) NOT NULL,
  6  ADDRESS VARCHAR2(255));

Table created.

SQL> INSERT INTO CUSTOMERS(CUSTOMER_ID,NAME,EMAIL,PHONE,ADDRESS)
  2  VALUES(1,'JOHN DOE','JOHN@EXAMPLE.COM','1234567890','123 ELM ST');

1 row created.

SQL> --ACCOUNTS TABLE
SQL> CREATE  TABLE ACCOUNTS(
  2  ACCOUNT_ID NUMBER PRIMARY KEY,
  3   CUSTOMER_ID NUMBER,
  4  ACCOUNT_TYPE VARCHAR2(20) NOT NULL,
  5  BALANCE NUMBER DEFAULT 0 CHECK(BALANCE >=0),
  6  FOREIGN KEY (CUSTOMER_ID) REFERENCES CUSTOMERS(CUSTOMER_ID));

Table created.

SQL> INSERT INTO ACCOUNTS(ACCOUNT_ID,CUSTOMER_ID,ACCOUNT_TYPE,BALANCE)
  2  VALUES(1,1,'SAVINGS',1500.00);

1 row created.

SQL> --transactions table(banking account managerment)
SQL> --Transactions Table
SQL> CREATE TABLE TRANSACTIONS(
  2  TRANSACTION_ID NUMBER PRIMARY KEY,
  3   ACCOUNT_ID NUMBER,
  4  T_DATE DATE NOT NULL,
  5  AMOUNT NUMBER NOT NULL CHECK(AMOUNT >=0),
  6  TRANSACTION_TYPE VARCHAR2(20) NOT NULL,
  7  FOREIGN KEY (ACCOUNT_ID) REFERENCES ACCOUNTS(ACCOUNT_ID));

Table created.

SQL> INSERT INTO TRANSACTIONS(TRANSACTION_ID,ACCOUNT_ID,T_DATE,AMOUNT,TRANSACTION_TYPE)
  2  VALUES(1,1,TO_DATE('2023-01-01','YYYY-MM-DD'),500.00,'DEPOSIT');

1 row created.

SQL> SELECT * FROM CUSTOMERS;

CUSTOMER_ID NAME                                                                                                                                                                                        
----------- ----------------------------------------------------------------------------------------------------                                                                                        
EMAIL                                                                                                PHONE                                                                                              
---------------------------------------------------------------------------------------------------- ---------------                                                                                    
ADDRESS                                                                                                                                                                                                 
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
          1 JOHN DOE                                                                                                                                                                                    
JOHN@EXAMPLE.COM                                                                                     1234567890                                                                                         
123 ELM ST                                                                                                                                                                                              
                                                                                                                                                                                                        

SQL> SELECT * FROM ACCOUNTS;

ACCOUNT_ID CUSTOMER_ID ACCOUNT_TYPE            BALANCE                                                                                                                                                  
---------- ----------- -------------------- ----------                                                                                                                                                  
         1           1 SAVINGS                    1500                                                                                                                                                  

SQL> SELECT * FROM TRANSACTIONS;

TRANSACTION_ID ACCOUNT_ID T_DATE        AMOUNT TRANSACTION_TYPE                                                                                                                                         
-------------- ---------- --------- ---------- --------------------                                                                                                                                     
             1          1 01-JAN-23        500 DEPOSIT                                                                                                                                                  

SQL> --Retrive data using sql select statements|banking account management system
SQL> --to retrieve the name and email of all customers from customer table..
SQL> SELECT NAME,EMAIL FROM CUSTOMERS;

NAME                                                                                                                                                                                                    
----------------------------------------------------------------------------------------------------                                                                                                    
EMAIL                                                                                                                                                                                                   
----------------------------------------------------------------------------------------------------                                                                                                    
JOHN DOE                                                                                                                                                                                                
JOHN@EXAMPLE.COM                                                                                                                                                                                        
                                                                                                                                                                                                        

SQL> --to fetch accountid and balance from the account table
SQL> SELECT ACCOUNT_ID,BALANCE FROM ACCOUNTS;

ACCOUNT_ID    BALANCE                                                                                                                                                                                   
---------- ----------                                                                                                                                                                                   
         1       1500                                                                                                                                                                                   

SQL> --retrive all columns from transactions table
SQL> SELECT * FROM TRANSACTIONS;

TRANSACTION_ID ACCOUNT_ID T_DATE        AMOUNT TRANSACTION_TYPE                                                                                                                                         
-------------- ---------- --------- ---------- --------------------                                                                                                                                     
             1          1 01-JAN-23        500 DEPOSIT                                                                                                                                                  

SQL> --to fetch the customerid,name and email of customers
SQL> SELECT CUSTOMER_ID,NAME,EMAIL FROM CUSTOMERS;

CUSTOMER_ID NAME                                                                                                                                                                                        
----------- ----------------------------------------------------------------------------------------------------                                                                                        
EMAIL                                                                                                                                                                                                   
----------------------------------------------------------------------------------------------------                                                                                                    
          1 JOHN DOE                                                                                                                                                                                    
JOHN@EXAMPLE.COM                                                                                                                                                                                        
                                                                                                                                                                                                        

SQL> --to retrive all columns from customers table
SQL> SELECT * FROM CUSTOMERS;

CUSTOMER_ID NAME                                                                                                                                                                                        
----------- ----------------------------------------------------------------------------------------------------                                                                                        
EMAIL                                                                                                PHONE                                                                                              
---------------------------------------------------------------------------------------------------- ---------------                                                                                    
ADDRESS                                                                                                                                                                                                 
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
          1 JOHN DOE                                                                                                                                                                                    
JOHN@EXAMPLE.COM                                                                                     1234567890                                                                                         
123 ELM ST                                                                                                                                                                                              
                                                                                                                                                                                                        

SQL> to retrive all columns from the transactions table where the transaction ammount is greater than 500
SP2-0734: unknown command beginning "to retrive..." - rest of line ignored.
SQL> --to retrive all columns from the transactions table where the transaction ammount is greater than 500
SQL> SELECT * FROM TRANSACTIONS WHERE AMOUNT >500;

no rows selected

SQL> --fetch all customer records without using*
SQL> SELECT CUSTOMER_ID,NAME,EMAIL,PHONE,ADDRESS FROM CUSTOMERS;

CUSTOMER_ID NAME                                                                                                                                                                                        
----------- ----------------------------------------------------------------------------------------------------                                                                                        
EMAIL                                                                                                PHONE                                                                                              
---------------------------------------------------------------------------------------------------- ---------------                                                                                    
ADDRESS                                                                                                                                                                                                 
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
          1 JOHN DOE                                                                                                                                                                                    
JOHN@EXAMPLE.COM                                                                                     1234567890                                                                                         
123 ELM ST                                                                                                                                                                                              
                                                                                                                                                                                                        

SQL> --to retrive all transaction details for a specific account_id eg-101
SQL> SELECT * FROM TRANSACTIONS WHERE ACCOUNT_ID=101;

no rows selected

SQL> SELECT * FROM TRANSACTIONS WHERE ACCOUNT_ID=1;

TRANSACTION_ID ACCOUNT_ID T_DATE        AMOUNT TRANSACTION_TYPE                                                                                                                                         
-------------- ---------- --------- ---------- --------------------                                                                                                                                     
             1          1 01-JAN-23        500 DEPOSIT                                                                                                                                                  

SQL> --to find customers who are active(assuming isactive=1 exists in the customers table)
SQL> SELECT * FROM CUSTOMERS WHERE ISACTIVE=1;
SELECT * FROM CUSTOMERS WHERE ISACTIVE=1
                              *
ERROR at line 1:
ORA-00904: "ISACTIVE": invalid identifier 


SQL> SELECT * FROM CUSTOMERS WHERE ISACTIVE = 1;
SELECT * FROM CUSTOMERS WHERE ISACTIVE = 1
                              *
ERROR at line 1:
ORA-00904: "ISACTIVE": invalid identifier 


SQL> --to retrive the details of customers whose name start with j
SQL> SELECT * FROM CUSTOMERS WHERE NAME LIKE 'J%';

CUSTOMER_ID NAME                                                                                                                                                                                        
----------- ----------------------------------------------------------------------------------------------------                                                                                        
EMAIL                                                                                                PHONE                                                                                              
---------------------------------------------------------------------------------------------------- ---------------                                                                                    
ADDRESS                                                                                                                                                                                                 
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
          1 JOHN DOE                                                                                                                                                                                    
JOHN@EXAMPLE.COM                                                                                     1234567890                                                                                         
123 ELM ST                                                                                                                                                                                              
                                                                                                                                                                                                        

SQL> --to fetch customer who have an email address that contain "gmail.com"
SQL> SELECT * FROM CUSTOMERS WHERE EMAIL LIKE '%GMAIL.COM';

no rows selected

SQL> SELECT * FROM CUSTOMERS WHERE EMAIL LIKE '%EXAMPLE.COM';

CUSTOMER_ID NAME                                                                                                                                                                                        
----------- ----------------------------------------------------------------------------------------------------                                                                                        
EMAIL                                                                                                PHONE                                                                                              
---------------------------------------------------------------------------------------------------- ---------------                                                                                    
ADDRESS                                                                                                                                                                                                 
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
          1 JOHN DOE                                                                                                                                                                                    
JOHN@EXAMPLE.COM                                                                                     1234567890                                                                                         
123 ELM ST                                                                                                                                                                                              
                                                                                                                                                                                                        

SQL> --to list all transactions for the month of jan 2024
SQL> SELECT * FROM TRANSACTIONS WHERE T_DATE BETWEEN TO_DATE('2024-01-01','YYYY-MM-DD')AND TO_DATE('2024-01-31','YYYY-MM-DD');

no rows selected

SQL> --to find all accounts with a balance less than 1000
SQL> SELECT * FROM ACCOUNTS WHERE BALANCE <500;

no rows selected

SQL> SELECT * FROM ACCOUNTS WHERE BALANCE <1000;

no rows selected

SQL> --retrive customers whose phone number contains 123
SQL> SELECT * FROM CUSTOMERS WHERE PHONE LIKE '%123%';

CUSTOMER_ID NAME                                                                                                                                                                                        
----------- ----------------------------------------------------------------------------------------------------                                                                                        
EMAIL                                                                                                PHONE                                                                                              
---------------------------------------------------------------------------------------------------- ---------------                                                                                    
ADDRESS                                                                                                                                                                                                 
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
          1 JOHN DOE                                                                                                                                                                                    
JOHN@EXAMPLE.COM                                                                                     1234567890                                                                                         
123 ELM ST                                                                                                                                                                                              
                                                                                                                                                                                                        

SQL> --to find all customers who have an address startinf with pune
SQL> SELECT * FROM CUSTOMERS WHERE ADDRESS LIKE '123 ELM%';

CUSTOMER_ID NAME                                                                                                                                                                                        
----------- ----------------------------------------------------------------------------------------------------                                                                                        
EMAIL                                                                                                PHONE                                                                                              
---------------------------------------------------------------------------------------------------- ---------------                                                                                    
ADDRESS                                                                                                                                                                                                 
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
          1 JOHN DOE                                                                                                                                                                                    
JOHN@EXAMPLE.COM                                                                                     1234567890                                                                                         
123 ELM ST                                                                                                                                                                                              
                                                                                                                                                                                                        

SQL> -- to list all transactions transactions fro specific transactiontype
SQL> SELECT * FROM TRANSACTIONS WHERE TRANSACTIONS_TYPE ='DEPOSIT';
SELECT * FROM TRANSACTIONS WHERE TRANSACTIONS_TYPE ='DEPOSIT'
                                 *
ERROR at line 1:
ORA-00904: "TRANSACTIONS_TYPE": invalid identifier 


SQL> SELECT * FROM TRANSACTIONS WHERE TRANSACTION_TYPE ='DEPOSIT';

TRANSACTION_ID ACCOUNT_ID T_DATE        AMOUNT TRANSACTION_TYPE                                                                                                                                         
-------------- ---------- --------- ---------- --------------------                                                                                                                                     
             1          1 01-JAN-23        500 DEPOSIT                                                                                                                                                  

SQL> --will return all transaction_type is deposit or withdrawal
SQL> SELECT * FROM TRANSACTION_TYPE IN('DEPOSIT','WITHDRAWAL');
SELECT * FROM TRANSACTION_TYPE IN('DEPOSIT','WITHDRAWAL')
                               *
ERROR at line 1:
ORA-00933: SQL command not properly ended 


SQL> SELECT * FROM WHERE TRANSACTION_TYPE IN('DEPOSIT','WITHDRAWAL');
SELECT * FROM WHERE TRANSACTION_TYPE IN('DEPOSIT','WITHDRAWAL')
              *
ERROR at line 1:
ORA-00903: invalid table name 


SQL> SELECT * FROM TRANSACTINS WHERE TRANSACTION_TYPE IN('DEPOSIT','WITHDRAWAL');
SELECT * FROM TRANSACTINS WHERE TRANSACTION_TYPE IN('DEPOSIT','WITHDRAWAL')
              *
ERROR at line 1:
ORA-00942: table or view does not exist 


SQL> SELECT * FROM TRANSACTIONS WHERE TRANSACTION_TYPE IN('DEPOSIT','WITHDRAWAL');

TRANSACTION_ID ACCOUNT_ID T_DATE        AMOUNT TRANSACTION_TYPE                                                                                                                                         
-------------- ---------- --------- ---------- --------------------                                                                                                                                     
             1          1 01-JAN-23        500 DEPOSIT                                                                                                                                                  

SQL> --will list customers whose account type is either savings or checking
SQL> SELECT * FROM CUSTOMERS WHERE CUSTOMER_ID IN ('SAVINGS,'CHECKING'));
ERROR:
ORA-01756: quoted string not properly terminated 


SQL> SELECT * FROM CUSTOMERS WHERE CUSTOMER_ID IN ('SAVINGS','CHECKING'));
SELECT * FROM CUSTOMERS WHERE CUSTOMER_ID IN ('SAVINGS','CHECKING'))
                                                                   *
ERROR at line 1:
ORA-00933: SQL command not properly ended 


SQL> SELECT CUSTOMER_ID FROM ACCOUNTS WHERE ACCOUNT_TYPE IN ('SAVINGS','CHECKING'));
SELECT CUSTOMER_ID FROM ACCOUNTS WHERE ACCOUNT_TYPE IN ('SAVINGS','CHECKING'))
                                                                             *
ERROR at line 1:
ORA-00933: SQL command not properly ended 


SQL> --to fetch all those transactions in which accountid is either 102,104
SQL> select * from trasactions where account_id in (102,104,106);
select * from trasactions where account_id in (102,104,106)
              *
ERROR at line 1:
ORA-00942: table or view does not exist 


SQL> select * from trasactions where account_id in (1);
select * from trasactions where account_id in (1)
              *
ERROR at line 1:
ORA-00942: table or view does not exist 


SQL> select * from transactions where account_id in (1);

TRANSACTION_ID ACCOUNT_ID T_DATE        AMOUNT TRANSACTION_TYPE                                                                                                                                         
-------------- ---------- --------- ---------- --------------------                                                                                                                                     
             1          1 01-JAN-23        500 DEPOSIT                                                                                                                                                  

SQL> -- to retrive all accounts whose balance is in the range 1000 to 5000
SQL> SELECT * FROM ACCOUNTS WHERE BALANCE BETWEEN 1000 AND 5000;

ACCOUNT_ID CUSTOMER_ID ACCOUNT_TYPE            BALANCE                                                                                                                                                  
---------- ----------- -------------------- ----------                                                                                                                                                  
         1           1 SAVINGS                    1500                                                                                                                                                  

SQL> --all customers who do not provide a phone number,such as phone is null
SQL> SELECT * FROM CUSTOMERS WHERE PHONE IS NULL;

no rows selected

SQL> --return all transaction where the amount is null
SQL> SELECT * FROM TRANSACTIONS WHERE AMOUNT IS NULL;

no rows selected

SQL> -- to find customers who have not provided their address
SQL> SELECT * FROM CUSTOMERS WHERE ADDRESS IS NULL;

no rows selected

SQL> -- to retrive balance of accounts where accountid is null
SQL> SELECT BALANCE FROM ACCOUNTS WHERE ACCOUNT_ID IS NULL;

no rows selected

SQL> SELECT ACCOUNT_ID,CUSTOMER_ID,BALANCE,CASE WHEN BALANCE < 1000 THEN 'LOW BALANCE' ELSE 'HIGH BALANCE' END AS BALANCESTATUS FROM ACCOUNTS;

ACCOUNT_ID CUSTOMER_ID    BALANCE BALANCESTATU                                                                                                                                                          
---------- ----------- ---------- ------------                                                                                                                                                          
         1           1       1500 HIGH BALANCE                                                                                                                                                          

SQL> --SELECT TRANSACTION_TYPE,CASE WHEN AMOUNT > 1000 THEN 'HIGH TRANSACTION' ELSE 'LOW TRANSACTION'END AS TRANSACTIONSTATUS FROM TRANSACTION WHERE AMOUNT IS NOT NULL;
SQL> /

ACCOUNT_ID CUSTOMER_ID    BALANCE BALANCESTATU                                                                                                                                                          
---------- ----------- ---------- ------------                                                                                                                                                          
         1           1       1500 HIGH BALANCE                                                                                                                                                          

SQL> SPOOL OFF;
