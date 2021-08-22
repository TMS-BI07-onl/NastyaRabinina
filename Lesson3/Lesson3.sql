
SELECT DISTINCT Name, StandardCost, 
	CASE WHEN StandardCost = 0 THEN 'Not for sale'
	     WHEN StandardCost > 0 AND StandardCost < 100   THEN '<$100'
		 WHEN StandardCost >= 100 AND  StandardCost <500 THEN '<$500'
	ELSE '>=$500'
	END PriceRange
FROM AdventureWorks2017.Production.Product  



SELECT Purchasing.ProductVendor.ProductID, Purchasing.Vendor.Name,Purchasing.Vendor.BusinessEntityID
FROM Purchasing.ProductVendor
     JOIN Purchasing.Vendor
          ON Purchasing.ProductVendor.BusinessEntityID = Purchasing.Vendor.BusinessEntityID
 WHERE Purchasing.ProductVendor.StandardPrice > 10 
       AND (Purchasing.Vendor.Name LIKE '%X%' OR Purchasing.Vendor.Name LIKE 'N%')
	  


SELECT Purchasing.Vendor.Name AS Name_Vendor
FROM Purchasing.ProductVendor
     LEFT JOIN Purchasing.Vendor
          ON Purchasing.ProductVendor.BusinessEntityID = Purchasing.Vendor.BusinessEntityID
WHERE [OnOrderQty] IS NULL
			 