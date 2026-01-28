-- Задание 1. Используя операторы языка SQL, создайте табличку “sales”. Заполните ее данными.

CREATE TABLE IF NOT EXISTS sales 
(
id INT PRIMARY KEY AUTO_INCREMENT,
order_date DATE NOT NULL,
bucket VARCHAR(45) NOT NULL
);

INSERT INTO hw2_sql.sales(order_date, bucket)
VALUES
('2021-01-01', '101 to 300'),
('2021-01-02', '101 to 300'),
('2021-01-02', 'less than equal to 100'),
('2021-01-04', '101 to 300'),
('2021-01-05', 'greater than 300');

-- Задание 2. Разделите  значения количества в 3 сегменте — меньше 100(“Маленький заказ”), 
-- 100-300(“Средний заказ” и больше 300 (“Большой заказ”)

SELECT *,
CASE
    WHEN bucket = '101 to 300'
        THEN 'Средний заказ'
    WHEN bucket = 'less than equal to 100' 
        THEN 'Маленький заказ'
    ELSE 'Большой заказ'
END AS order_quantity
FROM hw2_sql.sales;

-- Задание 3. Создайте таблицу “orders”, заполните ее значениями. Покажите “полный” статус заказа, используя оператор CASE
 
CREATE TABLE IF NOT EXISTS orders(
    orderid INT PRIMARY KEY AUTO_INCREMENT,
    employeeid VARCHAR(10) NOT NULL,
    amount DECIMAL NOT NULL,
    orderstatus VARCHAR(30) NOT NULL
);

INSERT INTO orders (employeeid, amount, orderstatus)
VALUES 
    ('e03', 15.00,'OPEN'),
    ('e01', 25.50,'OPEN'),
    ('e05', 100.70,'CLOSED'),
    ('e02', 22.18,'OPEN'),
    ('e04', 9.50,'CANCELLED'),
    ('e04', 99.99,'OPEN');

SELECT *,
CASE
    WHEN orderstatus = 'OPEN'
        THEN 'Order is in open state'
    WHEN orderstatus = 'CLOSED'
        THEN 'Order is closed'
    ELSE 'Order is cancelled'
END AS Full_order_status
FROM hw2_sql.orders;

-- Задание 4. Чем NULL отличается от 0?
-- NULL - означает отсутствие какого-либо значения в ячейке таблицы, т.е отсутствие данных.
-- 0 - это числовое значение (цифровое обозначение количества данных).