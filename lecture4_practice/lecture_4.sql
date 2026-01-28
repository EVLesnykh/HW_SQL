-- 1. Создадим таблицы для объединения

CREATE TABLE customers
(
id INT PRIMARY KEY AUTO_INCREMENT,
FirstName varchar(20) NOT NULL,
LastName varchar(20) NOT NULL,
AccountSum DECIMAL
)
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;

CREATE TABLE employeers
(
id INT PRIMARY KEY AUTO_INCREMENT,
FirstName varchar(20) NOT NULL,
LastName varchar(20) NOT NULL
)
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;

INSERT INTO customers(FirstName, LastName, AccountSum)
VALUES
('Tom', 'Smith', 2000),
('Sam', 'Brown', 3000),
('Mark', 'Adams', 2500),
('Paul', 'Ins', 4200),
('John', 'Smith', 2800),
('Tim', 'Cook', 2800);

INSERT INTO employeers(FirstName, LastName)
VALUES
('Honer', 'Simpson'),
('Tom', 'Smith'),
('Mark', 'Adwars'),
('Nick', 'Swidan');

-- 2. Объединим таблицы UNION
SELECT FirstName, LastName
FROM customers
UNION SELECT FirstName, LastName 
FROM employeers;

-- 3. Объединим таблицы UNION  и добавим сортировку
SELECT FirstName, LastName
FROM customers
UNION SELECT FirstName, LastName 
FROM employeers
ORDER BY FirstName ASC;

-- 4. Объединим таблицы UNION ALL  и добавим сортировку
SELECT FirstName, LastName
FROM customers
UNION ALL SELECT FirstName, LastName 
FROM employeers
ORDER BY FirstName ASC;

-- 5. UNION в пределах одной таблицы

SELECT FirstName, LastName, AccountSum + AccountSum * 0.1 AS TotalSum
FROM customers WHERE AccountSum < 3000
UNION SELECT FirstName, LastName, AccountSum + AccountSum * 0.3 AS TotalSum
FROM customers  WHERE AccountSum  >= 3000;

-- 6. Объединение  таблиц JOIN

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

INSERT INTO LECTURE_4.PRODUCTS
VALUES
('1', 'iPhoneX', 'Apple', '3', '76000'),
('2', 'iPhone8', 'Apple', '2', '51000'),
('3', 'Galaxv S9', 'Samsung', '2', '56000'),
('4', 'Galaxv S8', 'Samsung', '1', '41000'),
('5', 'P20Pro', 'Huawei', '5', '36000'); 

CREATE TABLE IF NOT EXISTS customers_one
(
id INT PRIMARY KEY 	AUTO_INCREMENT,
FirstName varchar(20) NOT NULL
)
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS orders
(
id INT PRIMARY KEY 	AUTO_INCREMENT,
ProductID INT NOT NULL,
Customers_oneId  INT NOT NULL,
CreatedAt DATE NOT NULL,
ProductCount INT DEFAULT 1,
Price DECIMAL NOT NULL,
Foreign key (ProductId) REFERENCES products(Id) ON DELETE CASCADE,
Foreign key (Customers_oneId) REFERENCES customers_one(Id) ON DELETE CASCADE
)
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;

SELECT Orders.CreatedAt, Orders. ProductCount, Products.ProductName
From Orders
JOIN Products ON ProductId = Orders.ProductId;

-- 7. LEFT, RIGHT

SELECT FirstName, CreatedAt, ProductCount, Price, ProductID
From Orders left join customers_one
ON Orders.Customers_oneId = Customers_oneId;

SELECT FirstName, CreatedAt, ProductCount, Price
From customers right join orders
ON Orders.Customers_oneId = Customers_oneId;

-- 8. IN оператор. Выберем все товары из таблицы Products, на которые
-- есть заказы в таблице Orders и наоборот

SELECT * FROM Products
WHERE Id IN (SELECT ProductId FROM orders);

SELECT * FROM Products
WHERE Id NOT IN (SELECT ProductId FROM orders);

-- 9. EXISTS

SELECT * FROM products
WHERE exists
(SELECT * FROM Orders WHERE Orders.ProductId = Products.Id);

