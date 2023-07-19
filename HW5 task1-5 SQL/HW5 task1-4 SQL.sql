-- 1. Создайте представление, в которое попадут автомобили стоимостью до 25 000 долларов

CREATE TABLE IF NOT EXISTS cars
(
id INT PRIMARY KEY AUTO_INCREMENT,
Name VARCHAR(25) NOT NULL,
Cost DECIMAL(14,2) NOT NULL
)
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;

INSERT INTO cars (Name, Cost)
VALUE
('Audi', 52642),
('Mercedes', 57127),
('Skoda', 9000), 
('Volvo', 29000), 
('Bentley', 350000),
('Citroen', 21000), 
('Hummer', 41400),
('Volkswagen', 21600);

-- Создадим представление

CREATE VIEW new_cars
AS SELECT *
FROM cars
WHERE Cost <= 25000;

-- 2. Изменить в существующем представлении порог для стоимости: пусть цена будет до 30 000 долларов 
-- (используя оператор ALTER VIEW)

ALTER VIEW new_cars
AS SELECT *
FROM cars
WHERE Cost <= 30000;

-- 3. Создайте представление, в котором будут только автомобили марки “Шкода” и “Ауди” (аналогично)

CREATE VIEW models_cars
AS SELECT *
FROM cars
WHERE Name IN ('Audi','Skoda');

-- 4. Вывести название и цену для всех анализов, которые продавались 5 февраля 2020 и всю следующую неделю.

-- Таблица групп анализов Groups
CREATE TABLE IF NOT EXISTS Groups
(
gr_id INT PRIMARY KEY AUTO_INCREMENT,
gr_name VARCHAR(50) NOT NULL,
gr_temp DECIMAL(2,1) NOT NULL
)
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;

INSERT INTO Groups(gr_name, gr_temp)
VALUE
('Группа №1', 8.0),
('Группа №2', 6.5),
('Группа №3', 4.0),
('Группа №4', 2.0),
('Группа №5', -5.5);

-- Таблица группы анализов Analysis
CREATE TABLE IF NOT EXISTS Analysis
(
an_id INT PRIMARY KEY AUTO_INCREMENT,
an_name VARCHAR(50) NOT NULL,
an_cost DECIMAL(14,2) NOT NULL,
an_price DECIMAL(14,2) NOT NULL,
an_group INT,
FOREIGN KEY (an_group) REFERENCES Groups (gr_id) ON DELETE CASCADE
)
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;

INSERT INTO Analysis(an_name, an_cost, an_price, an_group)
VALUE
('Анализ тип 1', 700.00, 1200.50, 1),
('Анализ тип 2', 800.00, 1600.20, 1),
('Анализ тип 3', 1000.00, 1800.30, 2),
('Анализ тип 4', 1500.00, 2300.45, 2),
('Анализ тип 5', 3000.00, 4100.75, 3),
('Анализ тип 6', 4000.00, 5600.90, 4),
('Анализ тип 7', 4500.00, 6400.10, 5);

-- Таблица заказов Orders
CREATE TABLE IF NOT EXISTS Orders
(
ord_id INT PRIMARY KEY AUTO_INCREMENT,
ord_datetime DATETIME NOT NULL,
ord_an INT,
FOREIGN KEY (ord_an) REFERENCES Analysis (an_id) ON DELETE CASCADE
)
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;

INSERT INTO Orders(ord_datetime, ord_an)
VALUE
('2020-01-10 08:00:00', 1),
('2020-02-12 08:45:00', 2),
('2020-01-13 10:30:00', 3),
('2020-01-28 14:45:00', 4),
('2020-02-05 08:05:00', 5),
('2020-02-06 08:10:00', 6),
('2020-02-10 08:15:00', 7),
('2020-02-14 08:25:00', 1),
('2020-03-01 08:30:00', 2);

-- Запрос
SELECT an_name AS 'Название заказа', an_price AS 'Стоимость анализа'
FROM Analysis AS a 
INNER JOIN Orders AS o 
ON a.an_id = o.ord_an
WHERE  ord_datetime >= '2020-02-05' and ord_datetime <= '2020-02-16';

-- 5**. Добавьте новый столбец под названием «время до следующей станции». 
/*Чтобы получить это значение, мы вычитаем время станций для пар смежных станций.
 Мы можем вычислить это значение без использования оконной функции SQL, но это может быть 
 очень сложно. Проще это сделать с помощью оконной функции LEAD . Эта функция сравнивает 
 значения из одной строки со следующей строкой, чтобы получить результат. В этом случае функция
 сравнивает значения в столбце «время» для станции со станцией сразу после нее.*/

CREATE TABLE Train
(
train_id INT,
station VARCHAR (25) NOT NULL,
station_time TIME
)
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;

INSERT INTO Train (train_id, station, station_time) 
VALUES
(110, 'San Francisco', '10:00:00'),
(110, 'Redwood City', '10:54:00'),
(110, 'Palo Alto', '11:02:00'),
(110, 'San Jose', '12:35:00'),
(120, 'San Francisco', '11:00:00'),
(120, 'Palo Alto', '12:49:00'),
(120, 'San Jose', '13:30:00');

SELECT train_id, station, station_time,
TIMEDIFF(LEAD(station_time) OVER (PARTITION BY train_id ORDER BY station_time), station_time) 
AS time_to_next_station 
FROM train; 