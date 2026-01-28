CREATE TABLE IF NOT EXISTS Products
(
id INT PRIMARY KEY 	AUTO_INCREMENT,
ProductName VARCHAR(30) NOT NULL,
Manufacturers VARCHAR(20) NOT NULL,
ProductCount INT DEFAULT 0,
Price DECIMAL
)
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;

-- INSERT INTO LECTURE_3.PRODUCTS
-- VALUES
-- ('1', 'iPhoneX', 'Apple', '3', '76000'),
-- ('2', 'iPhone8', 'Apple', '2', '51000'),
-- ('3', 'Galaxv S9', 'Samsung', '2', '56000'),
-- ('4', 'Galaxv S8', 'Samsung', '1', '41000'),
-- ('5', 'P20Pro', 'Huawei', '5', '36000') 

-- 1. Сортировка ORDER BY
SELECT * FROM products
ORDER BY Price;

-- 1.1. Упорядочивание с помощью AS
SELECT ProductName, ProductCount * Price AS TotalSum
FROM Products
ORDER BY TotalSum;

-- или

SELECT ProductName, Price, ProductCount
FROM Products
ORDER BY ProductCount * Price;

-- 2. Ограничение выборки
-- LIMIT

SELECT * FROM products
order by id
LIMIT 0, 1;

SELECT * FROM products
order by id
LIMIT 2 offset 3;

SELECT * FROM products
LIMIT 2;

/* 2. SELECT TOP 2 * 
FROM Products; */

-- 3. Уникальные значения
SELECT distinct Manufacturers 
FROM products;

-- 4. Группировка товаров по производителю
SELECT Manufacturers, COUNT(*) AS ModelsCount
FROM Products
GROUP BY Manufacturers;

-- 5. Агрегатные_функции

SELECT AVG(Price) AS Average_Price 
FROM lecture_3.Products;

SELECT COUNT(*) 
FROM lecture_3.Products;

SELECT AVG(Price) FROM lecture_3.Products
WHERE Manufacturers = 'Apple';

SELECT MIN(Price), MAX(Price) FROM Products;

SELECT Manufacturers, COUNT(*) AS ModelsCount
FROM Products
GROUP BY Manufacturers
HAVING count(*) > 1;

SELECT Manufacturers, COUNT(*) AS Models, SUM(ProductCount) AS Units
FROM Products
WHERE Price * ProductCount > 80000
GROUP BY Manufacturers
HAVING SUM(ProductCount) > 2
ORDER BY Units DESC;

SELECT * FROM Products
ORDER BY Price DESC;

SELECT COUNT(*) AS ModelsCount
FROM Products;

SELECT * FROM products
LIMIT 5;

SELECT 
    Min(price),
    Max(price),
	avg(price)
FROM products
WHERE Manufacturers = 'Samsung';

    
