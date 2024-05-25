use financialpredictiveanaly;

create table dsai_m_account_group(
Account_Group_Code VARCHAR(3) NOT NULL, 
Account_Group_Name VARCHAR(20) NOT NULL, 
Reporting_Category VARCHAR(2) NOT NULL, 
Created_User VARCHAR(10) NOT NULL, 
Created_DT DATETIME, 
Updated_User VARCHAR(10) NOT NULL,
Updated_DT DATETIME
);

LOAD DATA INFILE "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/DSAI_M_Account_Group-1.csv"
INTO TABLE DSAI_M_ACCOUNT_GROUP
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

create table DSAI_M_Company (
Country_Code VARCHAR(3) NOT NULL,
Company_Code VARCHAR(15) NOT NULL, 
Company_Name VARCHAR(50) NOT NULL, 
Subsidiary varchar(1) NOT NULL, 
Parent_Company VARCHAR(10) NOT NULL, 
Created_User VARCHAR(10) NOT NULL, 
Created_DT DATETIME, 
Updated_User VARCHAR(10) NOT NULL,
Updated_DT DATETIME
);

LOAD DATA INFILE "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/DSAI_M_Company-4.csv"
INTO TABLE DSAI_M_Company
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

SELECT * FROM DSAI_M_Company;

create table DSAI_M_Cost_Center(
Cost_Center_Code VARCHAR(10) NOT NULL, 
Cost_Center_Name VARCHAR(20) NOT NULL, 
Company_Code VARCHAR(3) NOT NULL,
Created_User VARCHAR(10) NOT NULL, 
Created_DT DATETIME, 
Updated_User VARCHAR(10) NOT NULL,
Updated_DT DATETIME
);

LOAD DATA INFILE "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/DSAI_M_Cost_Center-10.csv"
INTO TABLE DSAI_M_Cost_Center
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

SELECT * FROM DSAI_M_Cost_Center;

create table DSAI_M_Country(
Country_Code VARCHAR(3) NOT NULL,
Country_Name VARCHAR(25) NOT NULL, 
Created_User VARCHAR(10) NOT NULL, 
Created_DT DATETIME, 
Updated_User VARCHAR(10) NOT NULL,
Updated_DT DATETIME
);

LOAD DATA INFILE "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/DSAI_M_Country-3.csv"
INTO TABLE DSAI_M_Country
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

SELECT * FROM DSAI_M_Country;

create table DSAI_M_Exchange_Rate(
From_Currency VARCHAR(3) NOT NULL, 
To_Currency VARCHAR(3) NOT NULL, 
Historical_Exchange_Rates FLOAT(3) NOT NULL, 
Month_End_Average_Rate FLOAT(3) NOT NULL,
Created_User VARCHAR(10) NOT NULL, 
Created_DT DATETIME, 
Updated_User VARCHAR(10) NOT NULL,
Updated_DT DATETIME
);

LOAD DATA INFILE "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/DSAI_M_Exchange_Rate-7.csv"
INTO TABLE DSAI_M_Exchange_Rate
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

SELECT * FROM DSAI_M_Exchange_Rate;

create table DSAI_M_Fiscal_Year(
Fiscal_Year VARCHAR(4) NOT NULL,
From_Month VARCHAR(3) NOT NULL, 
To_Month VARCHAR(3) NOT NULL,
Created_User VARCHAR(10) NOT NULL, 
Created_DT DATETIME, 
Updated_User VARCHAR(10) NOT NULL,
Updated_DT DATETIME
);

LOAD DATA INFILE "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/DSAI_M_Fiscal_Year-9.csv"
INTO TABLE DSAI_M_Fiscal_Year
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

SELECT * FROM DSAI_M_Fiscal_Year;

create table DSAI_M_GL_Account(
GL_Account_Number INT NOT NULL,
Account_Group_Code VARCHAR(3) NOT NULL,
GL_Account_Name VARCHAR(25) NOT NULL, 
Created_User VARCHAR(10) NOT NULL, 
Created_DT DATETIME, 
Updated_User VARCHAR(10) NOT NULL,
Updated_DT DATETIME
);

LOAD DATA INFILE "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/DSAI_M_GL Account-2.csv"
INTO TABLE DSAI_M_GL_Account
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

SELECT * FROM DSAI_M_GL_Account;

create table DSAI_M_Local_Currency(
Country_Code VARCHAR(3) NOT NULL,
Local_Currency_Code VARCHAR(3) NOT NULL,
Local_Currency_Name VARCHAR(25) NOT NULL, 
Created_User VARCHAR(10) NOT NULL, 
Created_DT DATETIME, 
Updated_User VARCHAR(10) NOT NULL,
Updated_DT DATETIME
);

LOAD DATA INFILE "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/DSAI_M_Local Currency-5.csv"
INTO TABLE DSAI_M_Local_Currency
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

SELECT * FROM DSAI_M_Local_Currency;

create table DSAI_M_Posting_Period(
Period INT NOT NULL,
Month VARCHAR(3) NOT NULL, 
Created_User VARCHAR(10) NOT NULL, 
Created_DT DATETIME, 
Updated_User VARCHAR(10) NOT NULL,
Updated_DT DATETIME
);

LOAD DATA INFILE "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/DSAI_M_Posting_Period-8 .csv"
INTO TABLE DSAI_M_Posting_Period
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

SELECT * FROM DSAI_M_Posting_Period;

create table DSAI_M_Reporting_Currency(
Reporting_Currency_Code VARCHAR(3) NOT NULL,
Reporting_Currency_Name VARCHAR(25) NOT NULL, 
Created_User VARCHAR(10) NOT NULL, 
Created_DT DATETIME, 
Updated_User VARCHAR(10) NOT NULL,
Updated_DT DATETIME
);

LOAD DATA INFILE "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/DSAI_M_Reporting_Currency-6.csv"
INTO TABLE DSAI_M_Reporting_Currency
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

SELECT * FROM DSAI_M_Reporting_Currency;

create table DSAI_T_GL_Posting(
GL_Account_Number INT NOT NULL, 
Country_Code VARCHAR(3) NOT NULL, 
Company_Code VARCHAR(10) NOT NULL, 
Reporting_Currency_Code VARCHAR(3) NOT NULL, 
Period INT NOT  NULL,
Fiscal_Year VARCHAR(3) NOT NULL, 
Cost_Center_Code VARCHAR(10) NOT NULL, 
Amount_in_Local_Currency VARCHAR(14) NOT NULL,
Created_User VARCHAR(10) NOT NULL, 
Created_DT DATETIME, 
Updated_User VARCHAR(10) NOT NULL,
Updated_DT DATETIME
);

LOAD DATA INFILE "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/DSAI_T_GL_Posting-11.csv"
INTO TABLE DSAI_T_GL_Posting
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

SELECT * FROM DSAI_T_GL_Posting;