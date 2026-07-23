-- DATA DEFINITION AND TABLE ALTERATION AND UPDATION 
Select * from traindata ;
Select * from testdata limit 10 ;
Select column_name,data_type from information_schema.columns where table_name = 'traindata';
Select column_name,data_type from information_schema.columns where table_name='testdata';

ALTER TABLE testdata
ALTER COLUMN transaction_date TYPE text
USING transaction_date::DATE;
Select transaction_id,transaction_date from testdata ;
alter table traindata add column transaction_time timestamp;
alter table traindata drop column transaction_time ;
create table dtraindata as(Select * from traindata limit 100);
create table dtestdata as(Select * from testdata limit 100);
select * from dtestdata ;

alter table dtestdata add column split_time time ; 
alter table dtestdata add column split_date date ; 


alter table dtestdata alter column transaction_date type Date using
transaction_date::timestamp::date;

Select column_name,data_type from information_schema.columns where
table_name ='testdata';
Select column_name,data_type from information_schema.columns where
table_name ='traindata';

rollback ;

drop table dtestdata ;

update dtestdata set  split_date = transaction_date::timestamp::date,
split_time = transaction_date::timestamp::time ;

Select * from dtestdata ;



alter table testdata add column transactiondate date;
alter table testdata add column tranaction_time time
alter table testdata rename tranaction_time to transaction_time ;

SELECT column_name, data_type
FROM information_schema.columns
WHERE table_name = 'testdata';

select * from testdata limit 100 ;
Select * from traindata limit 100;

update testdata set transactiondate = transaction_date::timestamp::date,
transaction_time = transaction_date::timestamp::time;

ALTER TABLE testdata
ALTER COLUMN transaction_time
TYPE TIME
USING CAST(transaction_time AS TIME);


select table_name,column_name,data_type from information_schema.columns where
table_name in ('traindata','testdata') order by column_name,table_name;
	

-- Find columns common to both tables 
SELECT t.column_name
FROM information_schema.columns t
JOIN information_schema.columns d
  ON t.column_name = d.column_name
WHERE t.table_name = 'traindata'
  AND d.table_name = 'testdata'
ORDER BY t.column_name;

-- Colunns find in testdata but not in traindata 
Select column_name from information_schema.columns where table_name = 'testdata'
except
select column_name from information_schema.columns where table_name = 'traindata';


-- Comparing the datatype of all the column name inside the both tables ..
Select t.column_name,t.data_type as traindata_type,
d.data_type	 as testdata_type from ainformation_schema.columns t 
join
information_schema.columns d
on t.column_name = d.column_name
where t.table_name = 'traindata'
and d.table_name='testdata'
order by t.column_name;