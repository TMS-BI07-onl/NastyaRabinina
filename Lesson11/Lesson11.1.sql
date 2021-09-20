/*Table
Автосалон
Таблица Автосалон (id салона, город, id поставщика)
Таблица Поставщик (id поставщика, название)
Таблица Сервис (id сервис-центра, id салона, адрес)
Таблица Классы (id класса, класс) Class
Таблица Автомобили (id авто, модель, id класса) Automobile
Таблица Покупки (id авто, id_салона, дата, цена) Buy
Таблица Техобслуживание (id авто, id сервис-центра, услуга, стоимость)*/

--1. Вывести для каждого автомобиля стоимость продажи и сумму всех ремонтов.

SELECT DISTINCT a.id_auto, p.price, 
       SUM(t.cost) OVER (PARTITION BY id_auto) AS sum_tech
FROM  автомобили a 
      LEFT JOIN покупки p ON a.id_auto = p.id_auto
      LEFT JOIN техобслуживание t ON t.id_auto = a.id_auto
GROUP BY a.id_auto

--2. Для каждого салона вывести проданное количество автомобилей каждого класса. 
--   Результаты отобразить в транспонированной таблице.

SELECT *
FROM ( SELECT DISTINCT t.id_salon, 
                          t.class, 
					         COUNT(t.id_auto) OVER (PARTITION BY t.class) AS sumclass
       FROM ( SELECT b.id_auto AS id_auto, 
	                     b.id_salon AS id_salon, 
					            c.class AS id_class
                FROM Automobile a LEFT JOIN Class c ON a.id_class = c.id_class
	                              LEFT JOIN Buy b   ON a.id_auto = b.id_auto
				WHERE b.price IS NOT NULL
             ) t
       GROUP BY CUBE (t.id_salon, t.class)
) tr
PIVOT ( SUM(sumclass)
        FOR class IN ("A", "B", "C", "D", "E", "F")
       ) pvt	
;

--Variant 2 with CTE

WITH cte
AS	(
	SELECT DISTINCT t.id_salon, 
                          t.class, 
					         COUNT(t.id_auto) OVER (PARTITION BY t.class) AS sumclass
       FROM ( SELECT b.id_auto AS id_auto, 
	                     b.id_salon AS id_salon, 
					            c.class AS id_class
                FROM Automobile a LEFT JOIN Class c ON a.id_class = c.id_class
	                              LEFT JOIN Buy b   ON a.id_auto = b.id_auto
				WHERE b.price IS NOT NULL
             ) t
       GROUP BY CUBE (t.id_salon, t.class)
	)
select distinct t.id_salon, 
                    a.sumclass as A,
                    b.sumclass as B,
                    c.sumclass as C,
					d.sumclass as D,
                    e.sumclass as E,
                    f.sumclass as F
FROM cte t
LEFT JOIN cte a
	ON t.id_salon = a.id_salon AND a.class = 'A'
LEFT JOIN cte b
	ON t.id_salon = b.id_salon AND b.class = 'B'
LEFT JOIN cte c
	ON t.id_salon = c.id_salon AND c.class = 'C'
LEFT JOIN cte d
	ON t.id_salon = d.id_salon AND d.class = 'D'
LEFT JOIN cte e
	ON t.id_salon = e.id_salon AND e.class = 'E'
LEFT JOIN cte f
	ON t.id_salon = f.id_salon AND f.class = 'F'
ORDER BY id_salon;