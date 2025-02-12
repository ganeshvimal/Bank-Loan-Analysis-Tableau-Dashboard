# Executive Summary
## Project Overview
The Bank Loan Report Dashboard is a data-driven analytical tool designed to provide insightful visualizations into loan applications, funding trends, and financial metrics. The dashboard was developed using MS SQL Server for data extraction, transformation, and validation, followed by Tableau for visualization. **It comprises 3 key dashboards:** First the Summary dashboard offers a high-level view of loan performance. Second the Overview dashboard analyzes trends in applications, funding, and borrower demographics and Third the Details dashboard presents granular loan-level data for deeper insights. The goal was to create a structured, interactive, and user-friendly reporting system for decision-makers in financial institutions.

## Dashboards
![Bank Loan Report Summary Dashboard](https://github.com/user-attachments/assets/67ac1ca5-d24b-4ff9-8834-0a153c99b221) 

![Bank Loan Report Overview Dashboard](https://github.com/user-attachments/assets/4ac140ca-bf8d-44e2-9466-567ee855c4c9) 

![Bank Loan Report Details Dashboard](https://github.com/user-attachments/assets/4cd42ca5-df71-4ef7-ae55-b9a5dba71b02)

## Key Performance Indicators (KPIs)
The dashboard focuses on the following five primary KPIs, each analyzed with Month-to-Date (MTD) and Month-over-Month (MoM) calculations for trend analysis:

- **Total Loan Applications –** Tracks the number of loan applications submitted. 
- **Total Funded Amount –** Measures the total loan amount disbursed to customers.
- **Total Amount Received –** Captures the total repayments received from borrowers.
- **Average Interest Rate –** Analyzes the average lending rate across different loans.
- **Average Debt-to-Income (DTI) Ratio –** Evaluates the borrower's ability to repay loans.

These KPIs provide a comprehensive financial performance overview and allow stakeholders to assess lending efficiency and risk management.

## Dashboard Features & Insights
**1. Overview Dashboard**
- **Loan Trends:** Displays monthly loan applications, showing steady growth.
- **Loan Applications by State:** A geographical heatmap identifying high-loan-volume regions.
- **Loan Terms:** Breaks down applications into 36-month (73.2%) and 60-month (26.8%) loan durations.
- **Employment Analysis:** Most applicants have 10+ years of experience (8.9K loans), followed by shorter tenures.
- **Loan Purpose:** Debt consolidation (18.2K loans) is the dominant reason for loan applications.
- **Home Ownership Status:** Renters account for a slightly higher share of loans than mortgage holders.
  
**2. Summary Dashboard**
- **Loan Quality Assessment:** Good Loans (86.2%) represent loans with consistent repayment and low risk, ensuring financial stability. In contrast, Bad Loans (13.8%) are higher-risk loans that may lead to potential defaults, posing challenges for loan recovery and risk management.
- **Loan Status Breakdown:** Fully Paid Loans (32.1K) dominate, followed by Charged-Off Loans (5.3K) and Current Loans (1.09K).
- **Funding & Repayment Analysis:** Good Loans were funded at $370.2M, with $435.8M received, ensuring strong returns. In contrast, Bad Loans were funded at $65.5M, but only $37.3M was received, highlighting the associated financial risk.

**3. Detail Dashboard**
- The details dashboard provides granular details on each loan, including ID, purpose, homeownership status, grade, issue date, amount, interest rate, installment, and total payment.It helps analyze borrower risk, repayment behavior, and loan distribution, offering insights into creditworthiness and financial trends.

## Data Processing and Validation
- MS SQL Server was utilized to query the raw data based on the requirement document.
- KPI calculations, data aggregation, and trend analysis were performed within SQL before connecting to Tableau.
- The dashboard results were rigorously validated against SQL queries to ensure data integrity and accuracy.
## Business Impact & Decision-Making
This dashboard enables financial institutions to: 

✅ **Monitor Lending Performance –** Identify trends in loan applications, funding, and repayments.

✅ **Improve Risk Assessment –** Assess DTI ratios, employment history, and loan purposes to manage risks.

✅ **Optimize Loan Offerings –** Adjust interest rates and funding strategies based on market insights.

✅ **Enhance Collection Strategies –** Focus on minimizing bad loan rates through proactive measures.

## Conclusion
The 3 Bank Loan Report Dashboards effectively consolidates critical financial insights into an intuitive, data-driven tool. The structured approach of using SQL for backend processing and Tableau for visualization ensures accuracy and reliability. With its ability to track performance, assess risks, and drive informed decision-making, this project provides substantial value for financial institutions aiming to optimize their loan portfolio management.










