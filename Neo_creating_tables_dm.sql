--Витрина оборотов 
--drop table DM.DM_ACCOUNT_TURNOVER_F; 
create table DM.DM_ACCOUNT_TURNOVER_F (
    on_date             DATE,
    account_rk          NUMBER,
    credit_amount       NUMBER(23,8),
    credit_amount_rub   NUMBER(23,8),
    debet_amount        NUMBER(23,8),
    debet_amount_rub    NUMBER(23,8)
)
tablespace users;

select * from DM.DM_ACCOUNT_TURNOVER_F;
TRUNCATE TABLE DM.DM_ACCOUNT_TURNOVER_F;

--Витрина 101-й формы 
--drop table DM.DM_F101_ROUND_F; 
create table DM.DM_F101_ROUND_F (
FROM_DATE           DATE,
TO_DATE             DATE,
CHAPTER             CHAR(1 CHAR),
LEDGER_ACCOUNT      CHAR(5 CHAR),
CHARACTERISTIC      CHAR(1 CHAR),
BALANCE_IN_RUB      NUMBER(23,8),
R_BALANCE_IN_RUB    NUMBER(23,8),
BALANCE_IN_VAL      NUMBER(23,8),
R_BALANCE_IN_VAL    NUMBER(23,8),
BALANCE_IN_TOTAL    NUMBER(23,8),
R_BALANCE_IN_TOTAL  NUMBER(23,8),
TURN_DEB_RUB        NUMBER(23,8),
R_TURN_DEB_RUB      NUMBER(23,8),
TURN_DEB_VAL        NUMBER(23,8),
R_TURN_DEB_VAL      NUMBER(23,8),
TURN_DEB_TOTAL      NUMBER(23,8),
R_TURN_DEB_TOTAL    NUMBER(23,8),
TURN_CRE_RUB        NUMBER(23,8),
R_TURN_CRE_RUB      NUMBER(23,8),
TURN_CRE_VAL        NUMBER(23,8),
R_TURN_CRE_VAL      NUMBER(23,8),
TURN_CRE_TOTAL      NUMBER(23,8),
R_TURN_CRE_TOTAL    NUMBER(23,8),
BALANCE_OUT_RUB     NUMBER(23,8),
R_BALANCE_OUT_RUB   NUMBER(23,8),
BALANCE_OUT_VAL     NUMBER(23,8),
R_BALANCE_OUT_VAL   NUMBER(23,8),
BALANCE_OUT_TOTAL   NUMBER(23,8),
R_BALANCE_OUT_TOTAL NUMBER(23,8)
)
tablespace users;

select * from DM.DM_F101_ROUND_F;
TRUNCATE TABLE DM.DM_F101_ROUND_F;

--Таблица для записи логов
--drop table DM.LG_messages; 
create table DM.LG_messages (
record_id       NUMBER not null,
date_time       TIMESTAMP(6) not null,
sid             NUMBER not null,
message         varchar2(4000 CHAR) not null,
message_type    number(1) not null,
caller_type     varchar2(60 CHAR),
caller_owner    varchar2(60 CHAR),
caller          varchar2(60 CHAR),
line            number,
serial          number,
username        varchar2(60 CHAR),
osuser          varchar2(60 CHAR),
machine        varchar2(60 CHAR),
program         varchar2(60 CHAR),
module          varchar2(60 CHAR),
action          varchar2(60 CHAR),
logon_time      DATE
)
tablespace users;

select * from DM.LG_messages order by date_time desc;
TRUNCATE table DM.lg_messages;

--Последовательность для генерации ID строки
CREATE SEQUENCE dm.seq_lg_messages
  MINVALUE 1
  START WITH 1
  INCREMENT BY 1
  CACHE 20;
  
--Запуск процедуры по заполнению витрины оборотов для каждого дня января 2018 года
BEGIN
    DBMS_SCHEDULER.create_job (
        job_name    => 'FILL_account_turnover',
        job_type    => 'PLSQL_BLOCK',
        job_action  => '
            declare
                start_date  date;
                end_date    date;
            begin
                start_date := to_date(''2018-01-01'', ''yyyy-mm-dd'');
                end_date := to_date(''2018-01-31'', ''yyyy-mm-dd'');
                for x in 0..(end_date - start_date) loop
                    dm.fill_account_turnover_f.fill(start_date + x);
                end loop;
            end;',
        enabled => TRUE
    );
END;

--Запуск процедуры по заполнению витрины 101 формы для января 2018 года
BEGIN
    DBMS_SCHEDULER.create_job (
        job_name    => 'FILL_f101_f',
        job_type    => 'PLSQL_BLOCK',
        job_action  => '
            begin
            dm.fill_f101_round_f.fill(to_date(''2018-01-01'', ''yyyy-mm-dd''));
            end;',
        enabled => TRUE
    );
END;                 
                    
                    
                    
                    
