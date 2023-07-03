-- Задание 1.
-- Создайте таблицу с мобильными телефонами, используя графический интерфейс. Заполните БД данными

CREATE DATABASE IF NOT EXISTS hw1_sql;

CREATE TABLE IF NOT EXISTS hw1_sql.mobile_phones
(
id INT,
ProductName VARCHAR(45),
Manufacturers VARCHAR(45),
ProductCount INT,
Price DECIMAL
)
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;

INSERT INTO hw1_sql.mobile_phones
VALUES
('1', 'iPhoneX', 'Apple', '3', '76000'),
('2', 'iPhone8', 'Apple', '2', '51000'),
('3', 'Galaxv S9', 'Samsung', '2', '56000'),
('4', 'Galaxv S8', 'Samsung', '1', '41000'),
('5', 'P20Pro', 'Huawei', '5', '36000') 

-- Задание 2.
-- Выведите название, производителя и цену для товаров количество которых превышает 2;
SELECT ProductName, Manufacturers, Price 
FROM hw1_sql.mobile_phones
WHERE ProductCount > 2;

-- Задание 3.
-- Выведите весь ассортимент товаров марки “Samsung”
SELECT * FROM hw1_sql.mobile_phones
WHERE Manufacturers = 'Samsung';

-- Задание 4.
-- 4. С помощью регулярных выражений найти:

-- 4.1. Товары, в которых есть упоминание "Iphone"
SELECT * FROM hw1_sql.mobile_phones
WHERE ProductName LIKE 'Iphone%';

-- 4.2. "Samsung"
SELECT * FROM hw1_sql.mobile_phones
WHERE Manufacturers = 'Samsung';

-- 4.3.  Товары, в которых есть ЦИФРЫ
SELECT * FROM hw1_sql.mobile_phones
WHERE ProductName REGEXP '[0-9]';

-- 4.4.  Товары, в которых есть ЦИФРА "8"  
SELECT * FROM hw1_sql.mobile_phones
WHERE ProductName LIKE '%8%';