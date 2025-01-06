-- Question 1: How many customers belong to each income group code

-- SELECT i.descript, count (c.cust_id) FROM customers c
-- INNER JOIN income_group i
-- on c.code = i.code
-- GROUP BY c.code, i.descript
-- ORDER BY c.code, i.descript

-- Question 2: What is the relationship between sex_code and number of transactions

-- SELECT
-- CASE 
--     WHEN c.sex_code::INT = 0 THEN 'Female'
--     WHEN c.sex_code::INT  = 1 THEN 'Male'
--     ELSE 'Unknown'
-- END AS gender,
-- count(c.cust_id) as transaction_count
-- FROM customers c
-- JOIN transaction t
-- ON c.cust_id = t.cust_id
-- GROUP BY c.sex_code

-- Question 3: How does the number of transactions vary across income groups?

-- SELECT i.descript, count(t.cust_id)
-- FROM customers c
-- JOIN income_group i
-- ON i.code = c.code
-- JOIN transaction t
-- ON c.cust_id = t.cust_id
-- GROUP BY i.code, i.descript

--Question 4: Which product code (account type) has the most significant cash flow?

-- SELECT
--     EXTRACT(YEAR FROM record_date) AS transaction_year,
--     EXTRACT(MONTH FROM record_date) AS transaction_month,
--     prod_code  AS account_type, 
--     SUM(amt) as cash_flow
-- FROM transaction
-- WHERE prod_code = 'CHEQ'
-- GROUP BY prod_code, transaction_year, transaction_month
-- ORDER BY transaction_year, transaction_month;

-- SELECT
--     EXTRACT(YEAR FROM record_date) AS transaction_year,
--     EXTRACT(MONTH FROM record_date) AS transaction_month,
--     prod_code  AS account_type, 
--     SUM(amt) as cash_flow
-- FROM transaction
-- WHERE prod_code = 'SAVE'
-- GROUP BY prod_code, transaction_year, transaction_month
-- ORDER BY transaction_year, transaction_month;

--Question 5: How does the average account balanace vary across different income groups

-- SELECT i.descript, AVG(t.acc_balance) AS average_account_balance
-- FROM customers c
-- JOIN income_group i
-- ON i.code = c.code
-- JOIN transaction t
-- ON c.cust_id = t.cust_id
-- GROUP BY i.code, i.descript

--Question 6: Which transaction channel generated the highest transaction amount?

-- SELECT t.channel, COUNT(t.cust_id) as total_transaction
-- FROM transaction t
-- JOIN customers c
-- ON t.cust_id = c.cust_id
-- GROUP BY t.channel