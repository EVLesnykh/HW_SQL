-- 1. Объявление переменной

-- SET
SET @test := 5;
SELECT @test;

-- SELECT
SELECT @test2 := 5;

-- 2. IF
SELECT IF(1=1, 'true', 'false');

SELECT IF(1=2, 'true', 'false');