# Исходные данные

Табличка:
https://drive.google.com/file/d/1PQn576YVakvlWrIgIjSP9YEf5id4cqYs/view?usp=sharing

1. Вывести на экран сколько машин каждого цвета для машин марок BMW и LADA.
2. Вывести на экран марку авто и количество AUTO не этой марки.
3. Даны 2 таблицы, созданные следующим образом: <br>
create table test_a (id number, data varchar2(1));<br>
create table test_b (id number);<br>
insert into test_a(id, data) values<br>
(10, 'A'),<br>
(20, 'A'),<br>
(30, 'F'),<br>
(40, 'D'),<br>
(50, 'C');<br>
insert into test_b(id) values<br>
(10),<br>
(30),<br>
(50);<br>
Напишите запрос, который вернет строки из таблицы test_a, id которых нет в таблице test_b, НЕ используя ключевого слова NOT
