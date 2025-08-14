SQL> select avg(salary) from employees;

AVG(SALARY)                                                                                                                                                                                             
-----------                                                                                                                                                                                             
 6461.83178                                                                                                                                                                                             

SQL> select avg(salary) count()* staff from employees;
select avg(salary) count()* staff from employees
                        *
ERROR at line 1:
ORA-00923: FROM keyword not found where expected 


SQL> select avg(salary) count(*) staff from employees;
select avg(salary) count(*) staff from employees
                        *
ERROR at line 1:
ORA-00923: FROM keyword not found where expected 


SQL> select avg(salary), count(*) staff from employees;

AVG(SALARY)      STAFF                                                                                                                                                                                  
----------- ----------                                                                                                                                                                                  
 6461.83178        107                                                                                                                                                                                  

SQL> select department_id, sum(salary) total, avg(salary),count(*) staff from employees;
select department_id, sum(salary) total, avg(salary),count(*) staff from employees
       *
ERROR at line 1:
ORA-00937: not a single-group group function 


SQL> select department_id, sum(salary) total, avg(salary),count(*) staff from employees group by department_id;

DEPARTMENT_ID      TOTAL AVG(SALARY)      STAFF                                                                                                                                                         
------------- ---------- ----------- ----------                                                                                                                                                         
          100      51608  8601.33333          6                                                                                                                                                         
           30      24900        4150          6                                                                                                                                                         
                    7000        7000          1                                                                                                                                                         
           90      58000  19333.3333          3                                                                                                                                                         
           20      19000        9500          2                                                                                                                                                         
           70      10000       10000          1                                                                                                                                                         
          110      20308       10154          2                                                                                                                                                         
           50     156400  3475.55556         45                                                                                                                                                         
           80     304500  8955.88235         34                                                                                                                                                         
           40       6500        6500          1                                                                                                                                                         
           60      28800        5760          5                                                                                                                                                         
           10       4400        4400          1                                                                                                                                                         

12 rows selected.

SQL> select job_id, sum(salary) total, avg(salary),count(*) staff from employees group by job_id;en
  2  select job_id, sum(salary) total, avg(salary),count(*) staff from employees group by job_id;
select job_id, sum(salary) total, avg(salary),count(*) staff from employees group by job_id;en
                                                                                           *
ERROR at line 1:
ORA-00911: invalid character 


SQL> select job_id, sum(salary) total, avg(salary),count(*) staff from employees group by job_id;

JOB_ID          TOTAL AVG(SALARY)      STAFF                                                                                                                                                            
---------- ---------- ----------- ----------                                                                                                                                                            
IT_PROG         28800        5760          5                                                                                                                                                            
AC_MGR          12008       12008          1                                                                                                                                                            
AC_ACCOUNT       8300        8300          1                                                                                                                                                            
ST_MAN          36400        7280          5                                                                                                                                                            
PU_MAN          11000       11000          1                                                                                                                                                            
AD_ASST          4400        4400          1                                                                                                                                                            
AD_VP           34000       17000          2                                                                                                                                                            
SH_CLERK        64300        3215         20                                                                                                                                                            
FI_ACCOUNT      39600        7920          5                                                                                                                                                            
FI_MGR          12008       12008          1                                                                                                                                                            
PU_CLERK        13900        2780          5                                                                                                                                                            
SA_MAN          61000       12200          5                                                                                                                                                            
MK_MAN          13000       13000          1                                                                                                                                                            
PR_REP          10000       10000          1                                                                                                                                                            
AD_PRES         24000       24000          1                                                                                                                                                            
SA_REP         250500        8350         30                                                                                                                                                            
MK_REP           6000        6000          1                                                                                                                                                            
ST_CLERK        55700        2785         20                                                                                                                                                            
HR_REP           6500        6500          1                                                                                                                                                            

19 rows selected.

SQL> select department_id,job_id, sum(salary) total, avg(salary),count(*) staff from employees group by department_id,job_id;

DEPARTMENT_ID JOB_ID          TOTAL AVG(SALARY)      STAFF                                                                                                                                              
------------- ---------- ---------- ----------- ----------                                                                                                                                              
          110 AC_ACCOUNT       8300        8300          1                                                                                                                                              
           90 AD_VP           34000       17000          2                                                                                                                                              
           50 ST_CLERK        55700        2785         20                                                                                                                                              
           80 SA_REP         243500  8396.55172         29                                                                                                                                              
           50 ST_MAN          36400        7280          5                                                                                                                                              
           80 SA_MAN          61000       12200          5                                                                                                                                              
          110 AC_MGR          12008       12008          1                                                                                                                                              
           90 AD_PRES         24000       24000          1                                                                                                                                              
           60 IT_PROG         28800        5760          5                                                                                                                                              
          100 FI_MGR          12008       12008          1                                                                                                                                              
           30 PU_CLERK        13900        2780          5                                                                                                                                              
           50 SH_CLERK        64300        3215         20                                                                                                                                              
           20 MK_MAN          13000       13000          1                                                                                                                                              
          100 FI_ACCOUNT      39600        7920          5                                                                                                                                              
              SA_REP           7000        7000          1                                                                                                                                              
           70 PR_REP          10000       10000          1                                                                                                                                              
           30 PU_MAN          11000       11000          1                                                                                                                                              
           10 AD_ASST          4400        4400          1                                                                                                                                              
           20 MK_REP           6000        6000          1                                                                                                                                              
           40 HR_REP           6500        6500          1                                                                                                                                              

20 rows selected.

SQL> select sum(salary) total, avg(salary),count(*) staff from employees group by department_id,job_id;

     TOTAL AVG(SALARY)      STAFF                                                                                                                                                                       
---------- ----------- ----------                                                                                                                                                                       
      8300        8300          1                                                                                                                                                                       
     34000       17000          2                                                                                                                                                                       
     55700        2785         20                                                                                                                                                                       
    243500  8396.55172         29                                                                                                                                                                       
     36400        7280          5                                                                                                                                                                       
     61000       12200          5                                                                                                                                                                       
     12008       12008          1                                                                                                                                                                       
     24000       24000          1                                                                                                                                                                       
     28800        5760          5                                                                                                                                                                       
     12008       12008          1                                                                                                                                                                       
     13900        2780          5                                                                                                                                                                       
     64300        3215         20                                                                                                                                                                       
     13000       13000          1                                                                                                                                                                       
     39600        7920          5                                                                                                                                                                       
      7000        7000          1                                                                                                                                                                       
     10000       10000          1                                                                                                                                                                       
     11000       11000          1                                                                                                                                                                       
      4400        4400          1                                                                                                                                                                       
      6000        6000          1                                                                                                                                                                       
      6500        6500          1                                                                                                                                                                       

20 rows selected.

SQL> select department_id, job_id, manager_id, sum(salary) total, avg(salary), count(*) staff from employees group by department_id, job_id;
select department_id, job_id, manager_id, sum(salary) total, avg(salary), count(*) staff from employees group by department_id, job_id
                              *
ERROR at line 1:
ORA-00979: not a GROUP BY expression 


SQL> select department_id, job_id, manager_id, sum(salary) total, avg(salary), count(*) staff from employees group by department_id, job_id, manager_id;

DEPARTMENT_ID JOB_ID     MANAGER_ID      TOTAL AVG(SALARY)      STAFF                                                                                                                                   
------------- ---------- ---------- ---------- ----------- ----------                                                                                                                                   
           80 SA_REP            148      51900        8650          6                                                                                                                                   
           50 SH_CLERK          120      11600        2900          4                                                                                                                                   
           90 AD_VP             100      34000       17000          2                                                                                                                                   
           90 AD_PRES                    24000       24000          1                                                                                                                                   
           60 IT_PROG           102       9000        9000          1                                                                                                                                   
           50 ST_MAN            100      36400        7280          5                                                                                                                                   
           50 ST_CLERK          120      10500        2625          4                                                                                                                                   
           50 ST_CLERK          121      10700        2675          4                                                                                                                                   
           50 ST_CLERK          122      10800        2700          4                                                                                                                                   
           50 ST_CLERK          123      12000        3000          4                                                                                                                                   
           50 ST_CLERK          124      11700        2925          4                                                                                                                                   
           20 MK_REP            201       6000        6000          1                                                                                                                                   
           60 IT_PROG           103      19800        4950          4                                                                                                                                   
           50 SH_CLERK          124      11300        2825          4                                                                                                                                   
          100 FI_ACCOUNT        108      39600        7920          5                                                                                                                                   
           30 PU_MAN            100      11000       11000          1                                                                                                                                   
           80 SA_REP            147      46600  7766.66667          6                                                                                                                                   
           50 SH_CLERK          121      14700        3675          4                                                                                                                                   
           40 HR_REP            101       6500        6500          1                                                                                                                                   
           80 SA_REP            146      51000        8500          6                                                                                                                                   
              SA_REP            149       7000        7000          1                                                                                                                                   
           20 MK_MAN            100      13000       13000          1                                                                                                                                   
           70 PR_REP            101      10000       10000          1                                                                                                                                   
          110 AC_MGR            101      12008       12008          1                                                                                                                                   
           30 PU_CLERK          114      13900        2780          5                                                                                                                                   
           80 SA_MAN            100      61000       12200          5                                                                                                                                   
           80 SA_REP            145      51000        8500          6                                                                                                                                   
           80 SA_REP            149      43000        8600          5                                                                                                                                   
           50 SH_CLERK          122      12800        3200          4                                                                                                                                   
           50 SH_CLERK          123      13900        3475          4                                                                                                                                   
           10 AD_ASST           101       4400        4400          1                                                                                                                                   
          100 FI_MGR            101      12008       12008          1                                                                                                                                   
          110 AC_ACCOUNT        205       8300        8300          1                                                                                                                                   

33 rows selected.

SQL> select job_id, manager_id, sum(salary) total, avg(salary), count(*) staff from employees group by  job_id, manager_id;

JOB_ID     MANAGER_ID      TOTAL AVG(SALARY)      STAFF                                                                                                                                                 
---------- ---------- ---------- ----------- ----------                                                                                                                                                 
SH_CLERK          122      12800        3200          4                                                                                                                                                 
AC_MGR            101      12008       12008          1                                                                                                                                                 
ST_MAN            100      36400        7280          5                                                                                                                                                 
ST_CLERK          121      10700        2675          4                                                                                                                                                 
SA_REP            148      51900        8650          6                                                                                                                                                 
SH_CLERK          120      11600        2900          4                                                                                                                                                 
SH_CLERK          124      11300        2825          4                                                                                                                                                 
MK_MAN            100      13000       13000          1                                                                                                                                                 
AD_PRES                    24000       24000          1                                                                                                                                                 
FI_MGR            101      12008       12008          1                                                                                                                                                 
SA_REP            146      51000        8500          6                                                                                                                                                 
SH_CLERK          123      13900        3475          4                                                                                                                                                 
AD_ASST           101       4400        4400          1                                                                                                                                                 
IT_PROG           102       9000        9000          1                                                                                                                                                 
IT_PROG           103      19800        4950          4                                                                                                                                                 
FI_ACCOUNT        108      39600        7920          5                                                                                                                                                 
PU_MAN            100      11000       11000          1                                                                                                                                                 
ST_CLERK          122      10800        2700          4                                                                                                                                                 
SA_REP            145      51000        8500          6                                                                                                                                                 
AC_ACCOUNT        205       8300        8300          1                                                                                                                                                 
AD_VP             100      34000       17000          2                                                                                                                                                 
ST_CLERK          120      10500        2625          4                                                                                                                                                 
ST_CLERK          124      11700        2925          4                                                                                                                                                 
SA_REP            147      46600  7766.66667          6                                                                                                                                                 
SA_REP            149      50000  8333.33333          6                                                                                                                                                 
HR_REP            101       6500        6500          1                                                                                                                                                 
PR_REP            101      10000       10000          1                                                                                                                                                 
ST_CLERK          123      12000        3000          4                                                                                                                                                 
SH_CLERK          121      14700        3675          4                                                                                                                                                 
PU_CLERK          114      13900        2780          5                                                                                                                                                 
SA_MAN            100      61000       12200          5                                                                                                                                                 
MK_REP            201       6000        6000          1                                                                                                                                                 

32 rows selected.

SQL> select job_id, manager_id, sum(salary) total, avg(salary), count(*) staff from employees having count(*)>1 group by  job_id, manager_id;

JOB_ID     MANAGER_ID      TOTAL AVG(SALARY)      STAFF                                                                                                                                                 
---------- ---------- ---------- ----------- ----------                                                                                                                                                 
SH_CLERK          122      12800        3200          4                                                                                                                                                 
ST_MAN            100      36400        7280          5                                                                                                                                                 
ST_CLERK          121      10700        2675          4                                                                                                                                                 
SA_REP            148      51900        8650          6                                                                                                                                                 
SH_CLERK          120      11600        2900          4                                                                                                                                                 
SH_CLERK          124      11300        2825          4                                                                                                                                                 
SA_REP            146      51000        8500          6                                                                                                                                                 
SH_CLERK          123      13900        3475          4                                                                                                                                                 
IT_PROG           103      19800        4950          4                                                                                                                                                 
FI_ACCOUNT        108      39600        7920          5                                                                                                                                                 
ST_CLERK          122      10800        2700          4                                                                                                                                                 
SA_REP            145      51000        8500          6                                                                                                                                                 
AD_VP             100      34000       17000          2                                                                                                                                                 
ST_CLERK          120      10500        2625          4                                                                                                                                                 
ST_CLERK          124      11700        2925          4                                                                                                                                                 
SA_REP            147      46600  7766.66667          6                                                                                                                                                 
SA_REP            149      50000  8333.33333          6                                                                                                                                                 
ST_CLERK          123      12000        3000          4                                                                                                                                                 
SH_CLERK          121      14700        3675          4                                                                                                                                                 
PU_CLERK          114      13900        2780          5                                                                                                                                                 
SA_MAN            100      61000       12200          5                                                                                                                                                 

21 rows selected.

SQL> select job_id, manager_id, sum(salary) total, avg(salary), count(*) staff from employees having count(*)>1 group by  job_id, manager_id having count(*)>1;
select job_id, manager_id, sum(salary) total, avg(salary), count(*) staff from employees having count(*)>1 group by  job_id, manager_id having count(*)>1
                                                                                                                                        *
ERROR at line 1:
ORA-01787: only one clause allowed per query block 


SQL> select job_id, manager_id, sum(salary) total, avg(salary), count(*) staff from employees group by  job_id, manager_id having count(*)>1;

JOB_ID     MANAGER_ID      TOTAL AVG(SALARY)      STAFF                                                                                                                                                 
---------- ---------- ---------- ----------- ----------                                                                                                                                                 
SH_CLERK          122      12800        3200          4                                                                                                                                                 
ST_MAN            100      36400        7280          5                                                                                                                                                 
ST_CLERK          121      10700        2675          4                                                                                                                                                 
SA_REP            148      51900        8650          6                                                                                                                                                 
SH_CLERK          120      11600        2900          4                                                                                                                                                 
SH_CLERK          124      11300        2825          4                                                                                                                                                 
SA_REP            146      51000        8500          6                                                                                                                                                 
SH_CLERK          123      13900        3475          4                                                                                                                                                 
IT_PROG           103      19800        4950          4                                                                                                                                                 
FI_ACCOUNT        108      39600        7920          5                                                                                                                                                 
ST_CLERK          122      10800        2700          4                                                                                                                                                 
SA_REP            145      51000        8500          6                                                                                                                                                 
AD_VP             100      34000       17000          2                                                                                                                                                 
ST_CLERK          120      10500        2625          4                                                                                                                                                 
ST_CLERK          124      11700        2925          4                                                                                                                                                 
SA_REP            147      46600  7766.66667          6                                                                                                                                                 
SA_REP            149      50000  8333.33333          6                                                                                                                                                 
ST_CLERK          123      12000        3000          4                                                                                                                                                 
SH_CLERK          121      14700        3675          4                                                                                                                                                 
PU_CLERK          114      13900        2780          5                                                                                                                                                 
SA_MAN            100      61000       12200          5                                                                                                                                                 

21 rows selected.

SQL> select job_id, manager_id, sum(salary) total, avg(salary), count(*) staff from employees group by  job_id, manager_id having count(*)>1 order by staff;

JOB_ID     MANAGER_ID      TOTAL AVG(SALARY)      STAFF                                                                                                                                                 
---------- ---------- ---------- ----------- ----------                                                                                                                                                 
AD_VP             100      34000       17000          2                                                                                                                                                 
ST_CLERK          121      10700        2675          4                                                                                                                                                 
SH_CLERK          121      14700        3675          4                                                                                                                                                 
SH_CLERK          120      11600        2900          4                                                                                                                                                 
ST_CLERK          124      11700        2925          4                                                                                                                                                 
ST_CLERK          123      12000        3000          4                                                                                                                                                 
SH_CLERK          123      13900        3475          4                                                                                                                                                 
IT_PROG           103      19800        4950          4                                                                                                                                                 
SH_CLERK          122      12800        3200          4                                                                                                                                                 
ST_CLERK          122      10800        2700          4                                                                                                                                                 
ST_CLERK          120      10500        2625          4                                                                                                                                                 
SH_CLERK          124      11300        2825          4                                                                                                                                                 
FI_ACCOUNT        108      39600        7920          5                                                                                                                                                 
SA_MAN            100      61000       12200          5                                                                                                                                                 
ST_MAN            100      36400        7280          5                                                                                                                                                 
PU_CLERK          114      13900        2780          5                                                                                                                                                 
SA_REP            149      50000  8333.33333          6                                                                                                                                                 
SA_REP            146      51000        8500          6                                                                                                                                                 
SA_REP            148      51900        8650          6                                                                                                                                                 
SA_REP            147      46600  7766.66667          6                                                                                                                                                 
SA_REP            145      51000        8500          6                                                                                                                                                 

21 rows selected.

SQL> select job_id, manager_id, sum(salary) total, avg(salary), count(*) staff from employees group by  job_id, manager_id having count(*)>1 order by count(*);

JOB_ID     MANAGER_ID      TOTAL AVG(SALARY)      STAFF                                                                                                                                                 
---------- ---------- ---------- ----------- ----------                                                                                                                                                 
AD_VP             100      34000       17000          2                                                                                                                                                 
ST_CLERK          121      10700        2675          4                                                                                                                                                 
SH_CLERK          121      14700        3675          4                                                                                                                                                 
SH_CLERK          120      11600        2900          4                                                                                                                                                 
ST_CLERK          124      11700        2925          4                                                                                                                                                 
ST_CLERK          123      12000        3000          4                                                                                                                                                 
SH_CLERK          123      13900        3475          4                                                                                                                                                 
IT_PROG           103      19800        4950          4                                                                                                                                                 
SH_CLERK          122      12800        3200          4                                                                                                                                                 
ST_CLERK          122      10800        2700          4                                                                                                                                                 
ST_CLERK          120      10500        2625          4                                                                                                                                                 
SH_CLERK          124      11300        2825          4                                                                                                                                                 
FI_ACCOUNT        108      39600        7920          5                                                                                                                                                 
SA_MAN            100      61000       12200          5                                                                                                                                                 
ST_MAN            100      36400        7280          5                                                                                                                                                 
PU_CLERK          114      13900        2780          5                                                                                                                                                 
SA_REP            149      50000  8333.33333          6                                                                                                                                                 
SA_REP            146      51000        8500          6                                                                                                                                                 
SA_REP            148      51900        8650          6                                                                                                                                                 
SA_REP            147      46600  7766.66667          6                                                                                                                                                 
SA_REP            145      51000        8500          6                                                                                                                                                 

21 rows selected.

SQL> select job_id, manager_id, sum(salary) total, avg(salary), count(*) staff from employees group by  job_id, manager_id having staff>1 order by count(*);
select job_id, manager_id, sum(salary) total, avg(salary), count(*) staff from employees group by  job_id, manager_id having staff>1 order by count(*)
                                                                                                                             *
ERROR at line 1:
ORA-00904: "STAFF": invalid identifier 


SQL> select job_id, manager_id, sum(salary) total,  count(*) staff from employees group by  job_id, manager_id having having sum(salary)>50000 order by avg(salary);
select job_id, manager_id, sum(salary) total,  count(*) staff from employees group by  job_id, manager_id having having sum(salary)>50000 order by avg(salary)
                                                                                                                 *
ERROR at line 1:
ORA-00936: missing expression 


SQL> select job_id, manager_id, sum(salary) total,  count(*) staff from employees group by  job_id, manager_id having sum(salary)>50000 order by avg(salary);

JOB_ID     MANAGER_ID      TOTAL      STAFF                                                                                                                                                             
---------- ---------- ---------- ----------                                                                                                                                                             
SA_REP            146      51000          6                                                                                                                                                             
SA_REP            145      51000          6                                                                                                                                                             
SA_REP            148      51900          6                                                                                                                                                             
SA_MAN            100      61000          5                                                                                                                                                             

SQL> select commission_pct, count(*) staff from employees group by commission_pct order by commission pct;
select commission_pct, count(*) staff from employees group by commission_pct order by commission pct
                                                                                                 *
ERROR at line 1:
ORA-00933: SQL command not properly ended 


SQL> select commission_pct, count(*) staff from employees group by commission_pct order by commission_pct;

COMMISSION_PCT      STAFF                                                                                                                                                                               
-------------- ----------                                                                                                                                                                               
            .1          6                                                                                                                                                                               
           .15          5                                                                                                                                                                               
            .2          7                                                                                                                                                                               
           .25          6                                                                                                                                                                               
            .3          7                                                                                                                                                                               
           .35          3                                                                                                                                                                               
            .4          1                                                                                                                                                                               
                       72                                                                                                                                                                               

8 rows selected.

SQL> select commission_pct, count(*) staff from employees group by commission_pct;

COMMISSION_PCT      STAFF                                                                                                                                                                               
-------------- ----------                                                                                                                                                                               
                       72                                                                                                                                                                               
           .15          5                                                                                                                                                                               
           .35          3                                                                                                                                                                               
            .4          1                                                                                                                                                                               
            .3          7                                                                                                                                                                               
            .2          7                                                                                                                                                                               
           .25          6                                                                                                                                                                               
            .1          6                                                                                                                                                                               

8 rows selected.

SQL> spool on;
