
-- Overall Fraud rate in a dataset,How many transaction are legitimate and fraudulant.....
Select * from traindata limit 101;
select distinct is_fraud from traindata ;
Select is_fraud,count(transaction_id) as total_transaction from traindata group by is_fraud order by total_transaction;

SELECT
    is_fraud,
    COUNT(transaction_id) AS total_transaction,
    SUM(COUNT(transaction_id)) OVER() AS overall_transaction,
    ROUND(
        COUNT(transaction_id) * 100.0 /
        SUM(COUNT(transaction_id)) OVER(),
        2
    ) AS fraud_percentage
FROM testdata
GROUP BY is_fraud;


-- Transaction categories having highest fraud rate and top 3 having lowest fraud rate 
Select * from traindata limit 10;
Select  distinct category,
		sum(count(transaction_id)) over(partition by category) as Total_Transaction,
		sum(count(transaction_id)) over() as Overall_Transaction ,
		concat(
		round(
			count(transaction_id)/(sum(count(transaction_id)) over())
			,2)*100," ","%")
		 as Fraud_Rate 
from traindata where is_fraud=1 group by category order by Fraud_rate;

SELECT
    category,
    COUNT(transaction_id) AS total_transaction,
    SUM(COUNT(transaction_id)) OVER () AS overall_transaction,
    CONCAT(
        ROUND(
            COUNT(transaction_id) * 100.0 /
            SUM(COUNT(transaction_id)) OVER (),
            2 
        ),
        ' %'
    ) AS Highest_fraud,
FROM traindata
WHERE is_fraud = 1
GROUP BY category
ORDER BY COUNT(transaction_id) * 100.0 /
         SUM(COUNT(transaction_id)) OVER () DESC;