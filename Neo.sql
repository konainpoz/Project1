select * from all_tables;
--
alter session set "_ORACLE_SCRIPT" = true;
Create USER DS IDENTIFIED by 123456;
GRANT CREATE SESSION TO DS;
ALTER USER DS quota unlimited on USERS;

Create USER LOGS IDENTIFIED by 123456;
GRANT CREATE SESSION TO LOGS;
ALTER USER LOGS quota unlimited on USERS;