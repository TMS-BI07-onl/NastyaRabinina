

SELECT  CONCAT(FirstName, ' ' , ParentName, ' ', LastName) AS son,
	CONCAT(ParentName, ' ', LastName) AS father
FROM People
WHERE FirstName = '�������' OR ParentName = '�������'