CREATE TABLE sales(
sales_employee VARCHAR(50) NOT NULL,
fiscal_year INT NOT NULL,
sale DECIMAL(14,2) NOT NULL,
PRIMARY KEY(sales_employee,fiscal_year)
);

INSERT INTO sales(sales_employee,fiscal_year,sale)
VALUES('AndreyEx',2019,50000),
('AndreyEx',2017,44000),
('AndreyEx',2018,35000),
('Angel',2019,35000),
('Angel',2018,30000),
('Angel',2017,28000),
('Master',2019,32000),
('Master',2018,27000),
('Master',2017,25000);

SELECT * FROM sales;

SELECT
SUM(sale)
FROM
sales;

SELECT
fiscal_year,
sales_employee,
sale,
SUM(sale) OVER (PARTITION BY fiscal_year) total_sales
FROM
sales;

-- ROWS
SELECT 
fiscal_year,
sales_employee,
sale,
SUM(sale) 
OVER (PARTITION BY fiscal_year ORDER BY sale rows BETWEEN CURRENT ROW AND 1 FOLLOWING)  AS 'SUM'
FROM sales;