-- Задание 1. Создайте функцию, которая принимает кол-во сек и формат их в кол-во дней часов. 
-- Пример: 123456 ->'1 days 10 hours 17 minutes 36 seconds '.

drop procedure if exists print_time;

delimiter //
create procedure print_time
(
seconds int
)

begin
    declare days int default 0;
	declare hours int default 0;
	declare minutes int default 0;
           
    if seconds >= 86400 then
    set days = seconds div 86400;
    set seconds = seconds % 86400;
    end if;

   if seconds >= 3600 then
    SET hours = seconds div 3600;
    SET seconds = seconds % 3600;
    end if;

	if seconds >= 60 then
    SET minutes = seconds div 60;
    SET seconds = seconds % 60;
    end if;
    
select concat(
days, ' days ', hours, ' hours ', minutes, ' minutes ', seconds, ' seconds') as
'Результат перевода секунд в формат кол-ва дней часов:';
end //

call print_time(123456);

-- Задание 2. Выведите только четные числа от 1 до 10. Пример: 2,4,6,8,10.

drop procedure if exists print_even_nums;
delimiter //
create procedure print_even_nums
(
input_num  int
)
begin
    declare n int default 1; 
    declare result VARCHAR(100) default '';
WHILE n <= input_num DO
IF mod(n, 2) = 0 THEN SET result = CONCAT(result, ' ', n); 
end if; 
set n = n + 1; 
end while ;
select result;
end // 
 
 call print_even_nums(10);
 