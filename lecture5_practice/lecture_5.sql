-- 1. Создание таблицы
CREATE TABLE IF NOT EXISTS staff 
(
    id INT PRIMARY KEY,
    first_name VARCHAR(30),
    post VARCHAR(30),
    discipline VARCHAR(30),
    salary INT
)
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;

-- Заполнение таблицы данными
INSERT staff (id, first_name, post, discipline, salary)
VALUES
	(100,'Антон', 'Преподаватель', 'Программирование', 50),
	(101,'Василий', 'Преподаватель', 'Программирование', 60),
	(103,'Александр', 'Ассистент', 'Программирование', 25),
	(104,'Владимир', 'Профессор', 'Математика', 120),
	(105,'Иван', 'Профессор', 'Математика', 120),
	(106,'Михаил', 'Доцент', 'Физика', 70),
	(107, 'Анна', 'Доцент', 'Физика', 70),
	(108, 'Вероника', 'Доцент', 'ИКТ', 30),
	(109,'Григорий', 'Преподаватель', 'ИКТ', 25),
	(110,'Георгий', 'Ассистент', 'Программирование', 30);
    
-- 2. Запросы
SELECT SUM(salary)
FROM staff;

SELECT 
    id,
    first_name, 
    post,
    SUM(salary) 
    OVER ()  AS 'SUM'
FROM staff;

-- 3. ROVER and RANGE
/*Инструкция ROWS позволяет ограничить строки в окне,
указывая фиксированное количество строк, предшествующих
или следующих за текущей*/

SELECT 
    id,
    first_name, 
    post,
    SUM(salary) 
    OVER (PARTITION BY Date ORDER BY salary rows BETWEEN CURRENT ROW AND 1 FOLLOWING)  AS 'SUM'
FROM staff;

-- 4. Представление VIEW
CREATE VIEW personal
AS SELECT *
FROM staff
WHERE post = 'Доцент';

SELECT *
FROM personal;

-- Удаление
DROP VIEW personsl;

-- Объединение

