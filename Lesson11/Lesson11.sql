IF (OBJECT_ID('data_for_merge1') IS NOT NULL) DROP TABLE dbo.data_for_merge1;
CREATE TABLE data_for_merge1
(
   column1 VARCHAR(100),
    column2 VARCHAR(100),
	 column3 VARCHAR(100),
	  column4 VARCHAR(100),
	   column5 VARCHAR(100),
	    column6 VARCHAR(100),
		 column7 VARCHAR(100),
		  column8 VARCHAR(100),
		   column9 VARCHAR(100)
) 
BULK INSERT dbo.data_for_merge1
FROM 'C:\Users\Anastasia\Downloads\data_for_merge1.csv'
WITH (fieldterminator = ';', rowterminator = '\n');

SELECT * FROM [dbo].[data_for_merge1]

CREATE TABLE FunctionCount
(
   Function_name VARCHAR(100),
   Function_count INT
) 

SELECT*  FROM FunctionCount order by Function_name

MERGE FunctionCount AS trg
USING [dbo].[data_for_merge1] AS src 
ON trg.function_name = src.column1 --87654321

-- 1. —трока есть в trg но нет сопоставлени€ со строкой из src
--WHEN NOT MATCHED BY SOURCE THEN
--  DELETE

-- 2. ≈сть сопоставление строки trg со строкой из источника src
WHEN MATCHED THEN
  UPDATE SET
    trg.function_count=trg.function_count+1

-- 3. —трока не найдена в trg, но есть в src
WHEN NOT MATCHED AND src.column1 IS NOT NULL THEN 
  INSERT(function_name,function_count)
  VALUES(src.column1,1);