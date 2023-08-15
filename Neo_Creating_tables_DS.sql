alter SESSION set NLS_DATE_FORMAT = 'DD-MM-YYYY HH24:MI:SS';
alter session set NLS_NUMERIC_CHARACTERS='.,';

--drop table DS.MD_ACCOUNT_D
CREATE TABLE DS.MD_ACCOUNT_D (
    data_actual_date     date not null,
    data_actual_end_date date not null,
    account_rk           number not null,
    account_number       varchar2(20 char) not null,
    char_type            VARCHAR2(1 char) not null,
    currency_rk          NUMBER not null,
    currency_code        VARCHAR2(3 char) not null
)
TABLESPACE USERS;

alter table DS.md_account_d add primary key(DATA_ACTUAL_DATE, ACCOUNT_RK);

--drop table DS.FT_BALANCE_F
CREATE TABLE DS.FT_BALANCE_F (
    on_date     DATE not null,
    account_rk  NUMBER not null,
    currency_rk NUMBER,
    balance_out FLOAT
)
TABLESPACE USERS;

alter table DS.FT_BALANCE_F add primary key(ON_DATE, ACCOUNT_RK);

--drop table DS.FT_POSTING_F
CREATE TABLE DS.FT_POSTING_F (
    oper_date           DATE not null,
    credit_account_rk   NUMBER not null, 
    debet_account_rk    NUMBER not null,
    credit_amount       FLOAT,
    debet_amount        FLOAT
)
TABLESPACE USERS;

alter table DS.FT_POSTING_F add primary key(OPER_DATE, CREDIT_ACCOUNT_RK, DEBET_ACCOUNT_RK);

--drop table DS.MD_CURRENCY_D
CREATE TABLE DS.MD_CURRENCY_D (
    currency_rk             NUMBER not null,
    data_actual_date        DATE not null,
    data_actual_end_date    DATE,
    currency_code           VARCHAR2(3 char),
    code_iso_char           VARCHAR2(3 char)

)
TABLESPACE USERS;

alter table DS.MD_CURRENCY_D add primary key(CURRENCY_RK, DATA_ACTUAL_DATE);

--drop table DS.MD_EXCHANGE_RATE_D
CREATE TABLE DS.MD_EXCHANGE_RATE_D (
    data_actual_date        DATE not null,
    data_actual_end_date    DATE,
    currency_rk             NUMBER not null,
    reduced_cource          FLOAT,
    code_iso_num            VARCHAR2(3 char)
)
TABLESPACE USERS;

alter table DS.MD_EXCHANGE_RATE_D add primary key(DATA_ACTUAL_DATE, CURRENCY_RK);

--drop table DS.MD_LEDGER_ACCOUNT_S
CREATE TABLE DS.MD_LEDGER_ACCOUNT_S (
    chapter                         CHAR(1 char),
    chapter_name                    VARCHAR2(16 char),
    section_number                  INTEGER,
    section_name                    VARCHAR2(22 char),
    subsection_name                 VARCHAR2(21 char),
    ledger1_account                 INTEGER,
    ledger1_account_name            VARCHAR2(47 char),
    ledger_account                  INTEGER not null,
    ledger_account_name             VARCHAR2(153 char),
    characteristic                  CHAR(1 char),
    is_resident                     INTEGER,
    is_reserve                      INTEGER,
    is_reserved                     INTEGER,
    is_loan                         INTEGER,
    is_reserved_assets              INTEGER,
    is_overdue                      INTEGER,
    is_interest                     INTEGER,
    pair_account                    VARCHAR2(5 char),
    start_date                      DATE not null,
    end_date                        DATE,
    is_rub_only                     INTEGER,
    min_term                        VARCHAR2(1 char),
    min_term_measure                VARCHAR2(1 char),
    max_term                        VARCHAR2(1 char),
    max_term_measure                VARCHAR2(1 char),
    ledger_acc_full_name_translit   VARCHAR2(1 char),
    is_revaluation                  VARCHAR2(1 char),
    is_correct                      VARCHAR2(1 char)
)
TABLESPACE USERS;

alter table DS.MD_LEDGER_ACCOUNT_S add primary key(LEDGER_ACCOUNT, START_DATE);

--создаем таблицу для записи логов
--drop table LOGS.LOAD_LOGS
CREATE TABLE LOGS.LOAD_LOGS (
ROW_CHANGE_TIME TIMESTAMP Default systimestamp,
SOURCE          VARCHAR2(50),
ACTION_DATETIME DATE,
ACTION          VARCHAR2(50)
)
TABLESPACE USERS;

