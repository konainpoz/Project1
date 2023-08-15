select * from LOGS.LOAD_LOGS;
TRUNCATE TABLE LOGS.LOAD_LOGS;

select * from DS.ft_balance_f order by balance_out Desc;
TRUNCATE TABLE DS.ft_balance_f;

select * from DS.md_account_d;
TRUNCATE TABLE DS.ft_balance_f;

select * from DS.ft_posting_f;
TRUNCATE TABLE DS.ft_posting_f;

select * from DS.MD_CURRENCY_D;
TRUNCATE TABLE DS.MD_CURRENCY_D;

select * from DS.MD_EXCHANGE_RATE_D;
TRUNCATE TABLE DS.MD_EXCHANGE_RATE_D;a

select * from DS.MD_LEDGER_ACCOUNT_S;
TRUNCATE TABLE DS.MD_LEDGER_ACCOUNT_S;

insert into DS.ft_balance_f values('10.01.2020', 45874587, 14521452, 152564.45);