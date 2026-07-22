Select * from traindata ;
Select * from testdata limit 10 ;
Select column_name,data_type from information_schema.columns where table_name = 'traindata';
Select column_name,data_type from information_schema.columns where table_name='testdata';

ALTER TABLE testdata
ALTER COLUMN transaction_date TYPE text
USING transaction_date::DATE;