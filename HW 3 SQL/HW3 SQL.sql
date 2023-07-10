-- Исходные данные 

-- Задание 1.
-- Таблицы для работы на слайде.

-- Создаем таблицу salespeople

CREATE TABLE IF NOT EXISTS salespeople
(
snum INT PRIMARY KEY UNIQUE,
sname VARCHAR (25) NOT NULL,
city VARCHAR (25) NOT NULL,
comm DECIMAL(5,2) NOT NULL
);
INSERT INTO salespeople(snum, sname, city, comm)
VALUES
(1001, 'Peel', 'London', 0.12),
(1002, 'Serres', 'San Jose', 0.13),
(1004, 'Motika', 'London', 0.11),
(1007, 'Rifkin', 'Barcelona', 0.15),
(1003, 'Axelrod', 'New York', 0.10);

-- Создаем таблицу customers

CREATE TABLE customers
(
cnum INT PRIMARY KEY UNIQUE,
cname CHAR(25) NOT NULL,
city CHAR(25) NOT NULL,
rating INT NOT NULL,
snum INT,
FOREIGN KEY (snum)  REFERENCES salespeople (snum)
);
INSERT INTO customers(cnum, cname, city, rating, snum)
VALUES
(2001, 'Hoffman', 'London', 100, 1001),
(2002, 'Giovanni', 'Rome', 200, 1003),
(2003, 'Liu', 'SanJose', 200, 1002),
(2004, 'Grass', 'Berlin', 300, 1002),
(2006, 'Clemens', 'London', 100, 1001),
(2008, 'Cisneros', 'SanJose', 300, 1007),
(2007, 'Pereira', 'Rome', 100, 1004);

-- Создаем таблицу orders

CREATE TABLE orders
(
onum INT PRIMARY KEY UNIQUE,
amt DECIMAL(7,2) NOT NULL,
odate DATE NOT NULL,
cnum INT,
snum INT,
FOREIGN KEY (cnum)  REFERENCES customers (cnum),
FOREIGN KEY (snum)  REFERENCES salespeople (snum)
);
INSERT INTO orders(onum, amt, odate, cnum, snum)
VALUES
(3001, 18.69, '1990-03-10', 2008, 1007),
(3003, 767.19, '1990-03-10', 2001, 1001),
(3002, 1900.10, '1990-03-10', 2007, 1004),
(3005, 5160.45, '1990-03-10', 2003, 1002),
(3006, 1098.16, '1990-03-10', 2008, 1007),
(3009, 1713.23, '1990-04-10', 2002, 1003),
(3007, 75.75, '1990-04-10', 2004, 1002),
(3008, 4723.00, '1990-05-10', 2006, 1001),
(3010, 1309.95, '1990-06-10', 2004, 1002),
(3011, 9891.88, '1990-06-10', 2006, 1001);

-- 1.1. Напишите запрос который вывел бы таблицу со столбцами в следующем порядке: 
-- city, sname, snum, comm. (к первой или второй таблице, используя SELECT).

SELECT city, sname, snum, comm
FROM hw3_sql.salespeople;

-- 1.2. Напишите команду SELECT, которая вывела бы оценку(rating), сопровождаемую именем 
-- каждого заказчика в городе San Jose. (“заказчики”).

SELECT cname AS 'Заказчики', rating
FROM hw3_sql.customers
WHERE city = 'SanJose';

-- 1.3. Напишите запрос, который вывел бы значения snum всех продавцов из таблицы заказов
-- без каких бы то ни было повторений. (уникальные значения в “snum“ “Продавцы”).

SELECT DISTINCT snum
FROM hw3_sql.salespeople;

-- 1.4*. Напишите запрос, который бы выбирал заказчиков, чьи имена начинаются с буквы G. 
-- Используется оператор "LIKE": (“заказчики”) https://dev.mysql.com/doc/refman/8.0/en/string-comparison-functions.html.

SELECT * 
FROM hw3_sql.customers
WHERE cname LIKE 'G%';

-- 1.5. Напишите запрос, который может дать вам все заказы со значениями суммы 
-- выше чем $1,000. (“Заказы”, “amt” - сумма).

SELECT * 
FROM hw3_sql.orders
WHERE amt > 1000;

-- 1.6. Напишите запрос который выбрал бы наименьшую сумму заказа.
-- (Из поля “amt” - сумма в табличке “Заказы” выбрать наименьшее значение)

SELECT  MIN(amt) 
FROM hw3_sql.orders;

-- 1.7. Напишите запрос к табличке “Заказчики”, который может показать всех заказчиков, 
-- у которых рейтинг больше 100 и они находятся не в Риме.

SELECT *
FROM hw3_sql.customers
WHERE rating > 100 AND NOT city = 'Rome';

-- Задание 2.
-- Таблица workers:

-- Создаем таблицу workers 

CREATE TABLE workers 
(
id INT PRIMARY KEY AUTO_INCREMENT,
name VARCHAR(50) NOT NULL,
surname VARCHAR(50) NOT NULL,
specialty VARCHAR(50) NOT NULL,
seniority INT NOT NULL,
salary INT NOT NULL,
age INT NOT NULL
)
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;

INSERT hw3_sql.workers (name, surname, specialty, seniority, salary, age)
VALUES
('Вася', 'Васькин',	'Начальник', 40, 100000, 60),
('Петя', 'Петькин', 'Начальник',	8,	70000,	30),
('Катя', 'Катькина', 'Инженер',	2,	70000,	25),
('Саша', 'Сашкин', 'Инженер',	12,	50000,	35),
('Иван', 'Иванов', 'Рабочий',	40,	30000,	59),
('Юра',	'Юркин', 'Рабочий',	5,	15000,	25),
('Максим', 'Воронин', 'Рабочий', 2,	11000,	22);
 
-- 2.1. Отсортируйте поле “зарплата” в порядке убывания и возрастания.

SELECT *
FROM workers
ORDER BY salary DESC;

SELECT *
FROM workers
ORDER BY salary ASC;

-- 2.2. Отсортируйте по возрастанию поле “Зарплата” и выведите 5 строк с наибольшей заработной платой.

SELECT
* FROM workers
ORDER BY salary DESC
LIMIT 5;

-- 2.3. Выполните группировку всех сотрудников по специальности , суммарная зарплата которых превышает 100000.

SELECT specialty, SUM(salary) AS SumSalary 
FROM workers
GROUP BY specialty
HAVING SUM(salary) > 100000;
