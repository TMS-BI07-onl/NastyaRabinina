--Решите на базе данных AdventureWorks2017 следующие задачи:

-- 1) Извлечь все столбцы из таблицы Sales.SalesTerritory.

SELECT *
FROM Sales.SalesTerritory

-- 2)Извлечь столбцы TerritoryID и Name из таблицы Sales.SalesTerritory.
SELECT TerritoryID, Name
FROM Sales.SalesTerritory


-- 3) Найдите все данные, которые существует для людей из Person.Person с LastName = ‘Norman’.
SELECT *
FROM Person.Person
WHERE LastName = 'Norman'

-- 4) Найдите все строки из Person.Person, где EmailPromotion не равен 2. 
SELECT *
FROM Person.Person
WHERE EmailPromotion != 2

--5) Сколько уникальных PersonType существует для людей из Person.Person с LastName 
--   начинающиеся с буквы М или не содержащий 1 в EmailPromotion.  

SELECT COUNT (PersonType) AS PersonTypeInCommonWith
FROM Person.Person
WHERE LastName LIKE 'M%' 
-- OR EmailPromotion NOT LIKE '%1%'
   OR EmailPromotion !=1


-- 6) Вывести первых 3 специальных предложений из Sales.SpecialOffer с наибольшими DiscountPct, 
--    которые начинали действовать с 2013-01-01 по 2014-01-01.

SELECT TOP 3* 
FROM Sales.SpecialOffer
WHERE StartDate BETWEEN '2013-01-01' AND '2014-01-01'
ORDER BY DiscountPct DESC


-- 7)Найти самый минимальный вес и самый максимальный размер продукта из Production.Product.

SELECT MIN(Weight) AS min_weight, MAX(Size) AS max_size
FROM Production.Product

-- 8) Найти самый минимальный вес и самый максимальный размер продукта 
--    для каждой подкатегории ProductSubcategoryID из Production.Product. 

SELECT ProductSubcategoryID, MIN(Weight) AS min_weight, MAX(Size) AS max_size
FROM Production.Product
GROUP BY ProductSubcategoryID


-- 9) Найти самый минимальный вес и самый максимальный размер продукта для каждой 
--    подкатегории ProductSubcategoryID из Production.Product, где цвет продукта определен(Color).

SELECT ProductSubcategoryID, Color, MIN(Weight) AS min_weight, MAX(Size) AS max_size
FROM Production.Product
WHERE Color IS NOT NULL
GROUP BY Color, ProductSubcategoryID