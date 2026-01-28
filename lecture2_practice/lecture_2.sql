use lecture_2;
create table if not exists customers
(
id int primary key auto_increment,
age int,
FirstName Varchar(20),
LastName Varchar(20)
);

create table if not exists orders
(
id int primary key auto_increment,
customerID INT,
createdAt DATE,
FOREIGN KEY (customerID) REFERENCES Customers(id)
);

# Комментарий
-- Комментарий
/*
Это комментарий
*/

-- Арифметические операции
-- 1. Сложение
SELECT 3 + 5;
-- 2. Вычитание
SELECT 3 - 5;
-- 3. Умножение и деление
SELECT 3*5;
SELECT 3/5;

-- Часть 2
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

-- INSERT INTO LECTURE_2.PRODUCTS
-- VALUES
-- ('1', 'iPhoneX', 'Apple', '3', '76000'),
-- ('2', 'iPhone8', 'Apple', '2', '51000'),
-- ('3', 'Galaxv S9', 'Samsung', '2', '56000'),
-- ('4', 'Galaxv S8', 'Samsung', '1', '41000'),
-- ('5', 'P20Pro', 'Huawei', '5', '36000') 

/* Задание 1. Выберем все товары, у которых производитель Samsung и
одновременно цена больше 50000 */
SELECT * from lecture_2. products
WHERE Manufacturers = 'Samsung' AND Price > 50000;

/* Задание 2. Выберем все товары, у
которых либо производитель Samsung, либо цена больше 50000 */
SELECT * from lecture_2. products
WHERE Manufacturers = 'Samsung' OR Price > 50000;

/* Задание 3. Выберем все товары, у которых
производитель не Samsung*/
SELECT * from lecture_2. products
WHERE NOT Manufacturers = 'Samsung';

/* Приоритет операций
*/
SELECT * from lecture_2. products
WHERE Manufacturers = 'Samsung' OR NOT (Price > 30000 AND ProductCount >2);

-- Оператор CASE
SELECT ProductName, ProductCount,
CASE
    WHEN ProductCount = 1
        THEN 'Товар заканчивается'
	WHEN ProductCount = 2
         THEN 'Мало товара'
    WHEN ProductCount = 3
         THEN 'Есть в наличии'
	ELSE 'Много товара'
END AS Category
FROM lecture_2. products;

-- Оператор IF
SELECT ProductName, Manufacturers,
IF(ProductCount > 3, 'Много товара', 'Мало товара')
FROM lecture_2. products;

-- UPDATE Обновление данных
UPDATE lecture_2.products
SET Price = Price + 3000
WHERE id > 0;
SELECT * FROM lecture_2.products;

-- Удаление данных DELETE
/*
DELETE FROM Products
WHERE Manufacturer='Huawei'; */
