CREATE DATABASE fraud_db;
USE fraud_db;
SHOW TABLES;
SELECT * FROM creditcard LIMIT 10;
SELECT 
COUNT(*) AS total_transactions,
SUM(Class) AS fraud_transactions,
ROUND(100.0 * SUM(Class)/COUNT(*), 2) AS fraud_rate
FROM creditcard;
SELECT 
CASE 
    WHEN Amount < 50 THEN 'Low'
    WHEN Amount BETWEEN 50 AND 200 THEN 'Medium'
    ELSE 'High'
END AS amount_category,
COUNT(*) AS total_transactions,
SUM(Class) AS fraud_cases
FROM creditcard
GROUP BY amount_category
ORDER BY fraud_cases DESC;
SELECT 
MOD(FLOOR(Time/3600), 24) AS hour,
COUNT(*) AS total_transactions,
SUM(Class) AS fraud_cases
FROM creditcard
GROUP BY hour
ORDER BY fraud_cases DESC;
SELECT 
AVG(Amount) AS avg_fraud_amount
FROM creditcard
WHERE Class = 1;