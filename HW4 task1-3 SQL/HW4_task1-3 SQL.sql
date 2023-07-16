--  Исходные данные:
-- Таблица: https://drive.google.com/file/d/1PQn576YVakvlWrIgIjSP9YEf5id4cqYs/view?usp=sharing

CREATE TABLE  AUTO 
(       
	REGNUM VARCHAR(10) PRIMARY KEY, 
	MARK VARCHAR(10), 
	COLOR VARCHAR(15),
	RELEASEDT DATE, 
	PHONENUM VARCHAR(15)
)
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;

INSERT INTO AUTO (REGNUM, MARK,	COLOR, RELEASEDT, PHONENUM )
VALUES(111114,'LADA', 'КРАСНЫЙ', date'2008-01-01', '9152222221');
INSERT INTO AUTO (REGNUM, MARK,	COLOR, RELEASEDT, PHONENUM )
VALUES(111115,'VOLVO', 'КРАСНЫЙ', date'2013-01-01', '9173333334');
INSERT INTO AUTO (REGNUM, MARK,	COLOR, RELEASEDT, PHONENUM )
VALUES(111116,'BMW', 'СИНИЙ', date'2015-01-01', '9173333334');
INSERT INTO AUTO (REGNUM, MARK,	COLOR, RELEASEDT, PHONENUM )
VALUES(111121,'AUDI', 'СИНИЙ', date'2009-01-01', '9173333332');
INSERT INTO AUTO (REGNUM, MARK,	COLOR, RELEASEDT, PHONENUM )
VALUES(111122,'AUDI', 'СИНИЙ', date'2011-01-01', '9213333336');
INSERT INTO AUTO (REGNUM, MARK,	COLOR, RELEASEDT, PHONENUM )
VALUES(111113,'BMW', 'ЗЕЛЕНЫЙ', date'2007-01-01', '9214444444');
INSERT INTO AUTO (REGNUM, MARK,	COLOR, RELEASEDT, PHONENUM )
VALUES(111126,'LADA', 'ЗЕЛЕНЫЙ', date'2005-01-01', null);
INSERT INTO AUTO (REGNUM, MARK,	COLOR, RELEASEDT, PHONENUM )
VALUES(111117,'BMW', 'СИНИЙ', date'2005-01-01', null);
INSERT INTO AUTO (REGNUM, MARK,	COLOR, RELEASEDT, PHONENUM )
VALUES(111119,'LADA', 'СИНИЙ', date'2017-01-01', 9213333331);

-- Задание 1. Вывести на экран сколько машин каждого цвета для машин марок BMW и LADA
SELECT mark as 'Производитель', color as 'Цвет', count(*) as 'Количество'
FROM auto
WHERE mark IN ('BMW', 'LADA')
GROUP BY Производитель, Цвет;

-- Задание 2.Вывести на экран марку авто и количество AUTO не этой марки

SELECT mark as 'Производитель',
(SELECT count(*) FROM auto)-Count(*) as 'Количество AUTO не этого производителя'
FROM auto
GROUP BY Производитель;

-- или

SELECT DISTINCT mark as 'Производитель',
(SELECT count(*) 
FROM auto a1 
WHERE a1.mark != a.mark) AS 'Количество AUTO не этого производителя'
FROM auto a
GROUP BY Производитель;

-- Задание 3.
-- Даны 2 таблицы, созданные следующим образом:

CREATE TABLE  test_a 
(
id_number INT, 
test varchar (1)
)
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;

CREATE TABLE test_b 
(
id_number INT
)
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;

INSERT INTO test_a
VALUES
(10, 'A'),
(20, 'A'),
(30, 'F'),
(40, 'D'),
(50, 'C');

INSERT INTO test_b
VALUES
(10),
(30),
(50);

-- Напишите запрос, который вернет строки из таблицы test_a, id_number которых нет в таблице test_b,
-- НЕ используя ключевого слова NOT

SELECT *
FROM test_a
LEFT JOIN test_b
ON test_a.id_number = test_b.id_number
WHERE test_b.id_number IS NULL;