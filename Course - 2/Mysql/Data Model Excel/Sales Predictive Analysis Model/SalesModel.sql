USE `salespredictiveanalytics`;

CREATE TABLE `DSAI_M_CUSTOMER`(
	Customer_ID VARCHAR(8), 
    Customer_Name VARCHAR(50), 
    Address VARCHAR(50), 
    Location_Code VARCHAR(4),
    Phone DOUBLE,
    Email VARCHAR(50),
    Created_DT DATETIME,
    Created_User VARCHAR(10),
    Updated_DT DATETIME,
    Updated_User VARCHAR(10)
);

LOAD DATA INFILE "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/DSAI_M_Customer.csv"
INTO TABLE DSAI_M_CUSTOMER
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

SELECT * FROM DSAI_M_CUSTOMER;

CREATE TABLE `DSAI_M_PRODUCT`(
	Product_Code VARCHAR(5), 
    Product_Group_Code VARCHAR(5), 
    Product_Name VARCHAR(50), 
    Created_DT DATETIME,
    Created_User VARCHAR(10),
    Updated_DT DATETIME,
    Updated_User VARCHAR(10)
);

LOAD DATA INFILE "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/DSAI_M_Product.csv"
INTO TABLE DSAI_M_PRODUCT
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

SELECT * FROM DSAI_M_PRODUCT;

CREATE TABLE `DSAI_PRODUCT_GROUP`(
    Product_Group_Code VARCHAR(5), 
    Product_Group_Name VARCHAR(15), 
    Created_DT DATETIME,
    Created_User VARCHAR(10),
    Updated_DT DATETIME,
    Updated_User VARCHAR(10)
);

LOAD DATA INFILE "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/DSAI_Product_Group.csv"
INTO TABLE DSAI_PRODUCT_GROUP
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

SELECT * FROM DSAI_PRODUCT_GROUP;

CREATE TABLE `DSAI_M_UNIT_PRICE`(
    Product_Code VARCHAR(5), 
    Unit_Price_Code VARCHAR(6),
    Unit_Price INT,
    Measure INT,
    Measure_Code VARCHAR(10),
    Created_DT DATETIME,
    Created_User VARCHAR(10),
    Updated_DT DATETIME,
    Updated_User VARCHAR(10)
);

LOAD DATA INFILE "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/DSAI_M_Unit_Price.csv"
INTO TABLE DSAI_M_UNIT_PRICE
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

SELECT * FROM DSAI_M_UNIT_PRICE;

CREATE TABLE `DSAI_LOYALTY_PROGRAM`(
    Loyalty_Program_Code VARCHAR(5), 
    Loyalty_Program_Name VARCHAR(12),
    Created_DT DATETIME,
    Created_User VARCHAR(10),
    Updated_DT DATETIME,
    Updated_User VARCHAR(10)
);

LOAD DATA INFILE "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/DSAI_Loyalty_Program.csv"
INTO TABLE DSAI_LOYALTY_PROGRAM
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

SELECT * FROM DSAI_LOYALTY_PROGRAM;

CREATE TABLE `DSAI_DISCOUNT`(
    Discount_Code VARCHAR(5), 
    Discount_Name VARCHAR(15),
    Created_DT DATETIME,
    Created_User VARCHAR(10),
    Updated_DT DATETIME,
    Updated_User VARCHAR(10),
    Discount_Type VARCHAR(10),
    Discount_Number INT
);

LOAD DATA INFILE "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/DSAI_Discount.csv"
INTO TABLE DSAI_DISCOUNT
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

SELECT * FROM DSAI_DISCOUNT;

CREATE TABLE `DSAI_M_PROMOTION`(
    Promotion_Code VARCHAR(7), 
    Promotion_Name VARCHAR(15),
    Created_DT DATETIME,
    Created_User VARCHAR(10),
    Updated_DT DATETIME,
    Updated_User VARCHAR(10)
);

LOAD DATA INFILE "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/DSAI_M_Promotion.csv"
INTO TABLE DSAI_M_Promotion
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

SELECT * FROM DSAI_M_PROMOTION;

CREATE TABLE DSAI_M_Currency(
	Currency_Code VARCHAR(3),
    Currency_Name VARCHAR(20), 
    Created_DT DATETIME,
    Created_User VARCHAR(10),
    Updated_DT DATETIME,
    Updated_User VARCHAR(10)
);

LOAD DATA INFILE "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/DSAI_M_Currency.csv"
INTO TABLE DSAI_M_Currency
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

SELECT * FROM DSAI_M_Currency;


DROP TABLE DSAI_M_SALES_PERIOD;

CREATE TABLE DSAI_M_Sales_Period(
    `YEAR` YEAR,
    `MONTH` VARCHAR(3),
    `Quarter` INT,
    `Date` DATE,
    Created_DT DATETIME,
    Created_User VARCHAR(10),
    Updated_DT DATETIME,
    Updated_User VARCHAR(10)
);


LOAD DATA INFILE "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/DSAI_M_Sales_Period.csv"
INTO TABLE DSAI_M_Sales_Period
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

SELECT * FROM DSAI_M_SALES_PERIOD;

CREATE TABLE DSAI_T_Sales(
	Customer_ID VARCHAR(7),
    Product_Code VARCHAR(5),
    Unit_Price_Code VARCHAR(6),
    Location_Code VARCHAR(4),
    Currency_Code VARCHAR(3),
    Unit_of_Measure VARCHAR(10),
    Sales_Quantity INT,
    `Sales_Date` DATE,
    Promotion_Code VARCHAR(10) DEFAULT 'No Code',
    Discount_Code VARCHAR(10) DEFAULT 'No Code',
    Loyalty_Program_Code VARCHAR(10) DEFAULT 'No Code',
    `History` VARCHAR(3), 
    Created_DT DATETIME,
    Created_User VARCHAR(10),
    Updated_DT DATETIME,
    Updated_User VARCHAR(10)
);

LOAD DATA INFILE "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/DSAI_T_Sales.csv"
INTO TABLE DSAI_T_Sales
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

SELECT * FROM DSAI_T_Sales;


CREATE TABLE DSAI_M_Location(
    Location_Code VARCHAR(4),
    Location_Name VARCHAR(20),
    Postal_Code VARCHAR(6),
    State_Code INT, 
    Created_DT DATETIME,
    Created_User VARCHAR(10),
    Updated_DT DATETIME,
    Updated_User VARCHAR(10)
);

LOAD DATA INFILE "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/DSAI_M_Location.csv"
INTO TABLE DSAI_M_Location
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

SELECT * FROM DSAI_M_LOCATION;