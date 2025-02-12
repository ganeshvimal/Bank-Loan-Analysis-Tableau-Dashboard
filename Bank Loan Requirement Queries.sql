SELECT * FROM bank_loan_Data

-- KPIS for Dashboard 1 (summary)
-- Total Loan applications
select count (id) as Total_Loan_Applications from bank_loan_Data

-- Month to date total loan applications for december
select count (id) as MTD_Total_Loan_Applications from bank_loan_Data
where MONTH(issue_date) = 12 and YEAR(issue_date) = 2021

-- Month to date total loan applications for november
select count (id) as PMTD_Total_Loan_Applications from bank_loan_Data
where MONTH(issue_date) = 11 and YEAR(issue_date) = 2021

-- (MTD - PMTD)/ PMTD -- Formula to calculate % change

--Second KPI - TOTAL funded amount

select sum(loan_amount) as Total_Funded_Amount from bank_loan_Data

-- now for MTD

-- FOR december
select sum(loan_amount) as MTD_Total_Funded_Amount from bank_loan_Data 
WHERE MONTH(issue_date) = 12 and YEAR(issue_date) = 2021

--PMTD (for november)
select sum(loan_amount) as PMTD_Total_Funded_Amount from bank_loan_Data 
WHERE MONTH(issue_date) = 11 and YEAR(issue_date) = 2021

-- TOTAL AMOUNT RECIEVED

select SUM(total_payment) AS Total_Amount_Recieved from bank_loan_Data

--MTD 
select SUM(total_payment) AS MTD_Total_Amount_Recieved from bank_loan_Data
WHERE MONTH(issue_date) = 12 and YEAR(issue_date) = 2021

-- PMTD
select SUM(total_payment) AS PMTD_Total_Amount_Recieved from bank_loan_Data
WHERE MONTH(issue_date) = 11 and YEAR(issue_date) = 2021

-- Average interest rate
select AVG(int_rate) as Average_Interest_Rate from bank_loan_Data

select AVG(int_rate) * 100 as Average_Interest_Rate from bank_loan_Data

select ROUND(AVG(int_rate), 4) * 100 as Average_Interest_Rate from bank_loan_Data

-- MTD FOR december
select ROUND(AVG(int_rate), 4) * 100 as MTD_Average_Interest_Rate from bank_loan_Data
WHERE MONTH(issue_date) = 12 and YEAR(issue_date) = 2021


--PMTD for november
select ROUND(AVG(int_rate), 4) * 100 as MTD_Average_Interest_Rate from bank_loan_Data
WHERE MONTH(issue_date) = 11 and YEAR(issue_date) = 2021

-- Average DTI
select ROUND(AVG(dti), 4) * 100 as Average_DTI from bank_loan_Data

-- MTD for average DTI
select ROUND(AVG(dti), 4) * 100 as MTD_Average_DTI from bank_loan_Data
where MONTH(issue_date) = 12 and YEAR(issue_date) = 2021

-- PMTD
select ROUND(AVG(dti), 4) * 100 as PMTD_Average_DTI from bank_loan_Data
where MONTH(issue_date) = 11 and YEAR(issue_date) = 2021

-- GOOD LOAN KPIS
-- Good loan application % 

select (COUNT(case when loan_status = 'Fully Paid' or loan_status = 'Current' THEN id END) * 100)
		/ COUNT(id) AS Good_Loan_Percentage from bank_loan_Data

-- this above query is taking counting the case when loan status is either paid fully or going on and dividing with no of applications( id - bcz id is unique)

-- Good loan applications

select count(id) AS Good_Loan_Applications from bank_loan_Data 
where loan_status = 'Fully Paid' or loan_status = 'Current'

-- Good Loan Funded Amount

select SUM(loan_amount) AS Good_Loan_Funded_Amount from bank_loan_Data 
where loan_status = 'Fully Paid' or loan_status = 'Current'

-- Good Loan Total Received Amount
select SUM(total_payment) AS Good_Loan_Amount_Recieved from bank_loan_Data 
where loan_status = 'Fully Paid' or loan_status = 'Current'

-- Bad Loan Application Percentage
select (COUNT(case when loan_status = 'Charged Off' THEN id END) * 100.0)
		/ COUNT(id) AS Bad_Loan_Percentage from bank_loan_Data

-- Bad Loan Applications
select count(id) AS Bad_Loan_Applications from bank_loan_Data 
where loan_status = 'Charged Off'

-- Bad loan funded amount
select SUM(loan_amount) AS Bad_Loan_Funded_Amount from bank_loan_Data 
where loan_status = 'Charged Off'

-- Bad Loan Total Received Amount
select SUM(total_payment) AS Bad_Loan_Amount_Recieved from bank_loan_Data 
where loan_status = 'Charged Off'

-- LOAN STATUS
SELECT 
        loan_status, 
        COUNT(id) AS Total_Loan_Applications, 
        SUM(total_payment) AS Total_Amount_Received, 
        SUM(loan_amount) AS Total_Funded_Amount, 
        AVG(int_rate * 100) AS Interest_Rate, 
        AVG(dti * 100) AS DTI 
    FROM 
        bank_loan_data 
    GROUP BY 
        loan_status 

-- MTD LOAN STATUS for DECEMBER
SELECT  
 loan_status,  
 SUM(total_payment) AS MTD_Total_Amount_Received,  
 SUM(loan_amount) AS MTD_Total_Funded_Amount  
FROM bank_loan_data 
WHERE MONTH(issue_date) = 12  
GROUP BY loan_status

-- KPI For Dashboard 2 (Overview)
-- Bank Loan Report (Overview)

-- Monthly trends by issue date
SELECT  
	MONTH(issue_date) AS Month_Number,  
	DATENAME(MONTH, issue_date) AS Month_name,  
	COUNT(id) AS Total_Loan_Applications, 
	SUM(loan_amount) AS Total_Funded_Amount, 
	SUM(total_payment) AS Total_Amount_Received 
FROM bank_loan_data 
GROUP BY MONTH(issue_date), DATENAME(MONTH, issue_date) 
ORDER BY MONTH(issue_date)

-- Regional analysis by state
SELECT  
	address_state AS State,  
	COUNT(id) AS Total_Loan_Applications, 
	SUM(loan_amount) AS Total_Funded_Amount, 
	SUM(total_payment) AS Total_Amount_Received 
	FROM bank_loan_data 
	GROUP BY address_state 
	--ORDER BY address_state
	--ORDER BY SUM(loan_amount) desc
	ORDER BY COUNT(id) desc

-- Loan term analysis

SELECT  term AS Term,  
	COUNT(id) AS Total_Loan_Applications, 
	SUM(loan_amount) AS Total_Funded_Amount, 
	SUM(total_payment) AS Total_Amount_Received 
	FROM bank_loan_data 
	GROUP BY term 
	ORDER BY COUNT(id) desc 
	
-- Employee length analysis
SELECT  
	emp_length AS Employee_Length,  
	COUNT(id) AS Total_Loan_Applications, 
	SUM(loan_amount) AS Total_Funded_Amount, 
	SUM(total_payment) AS Total_Amount_Received 
	FROM bank_loan_data 
	GROUP BY emp_length 
	ORDER BY COUNT(id) desc
--  Loan Purpose Breakdown
SELECT  
	purpose AS PURPOSE,  
	COUNT(id) AS Total_Loan_Applications, 
	SUM(loan_amount) AS Total_Funded_Amount, 
	SUM(total_payment) AS Total_Amount_Received 
	FROM bank_loan_data 
	GROUP BY purpose 
	ORDER BY count(id) desc

-- Home ownership Analysis
SELECT  
	home_ownership AS Home_Ownership,  
	COUNT(id) AS Total_Loan_Applications, 
	SUM(loan_amount) AS Total_Funded_Amount, 
	SUM(total_payment) AS Total_Amount_Received 
	FROM bank_loan_data 
	GROUP BY home_ownership 
	ORDER BY count(id) desc

-- See the results when we hit the Grade A
SELECT  
	home_ownership,  
	COUNT(id) AS Total_Loan_Applications, 
	SUM(loan_amount) AS Total_Funded_Amount, 
	SUM(total_payment) AS Total_Amount_Received 
	FROM bank_loan_data 
	WHERE grade = 'A' 
	GROUP BY home_ownership 
	ORDER BY count(id) desc

	-- For grade A and for California state
SELECT  
	home_ownership,  
	COUNT(id) AS Total_Loan_Applications, 
	SUM(loan_amount) AS Total_Funded_Amount, 
	SUM(total_payment) AS Total_Amount_Received 
	FROM bank_loan_data 
	WHERE grade = 'A'  and address_state = 'CA'
	GROUP BY home_ownership 
	ORDER BY count(id) desc













