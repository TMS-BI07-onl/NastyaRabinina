

SELECT  CONCAT(FirstName, ' ' , ParentName, ' ', LastName) AS son,
	CONCAT(ParentName, ' ', LastName) AS father
FROM People
WHERE FirstName = 'ִלטענטי' OR ParentName = 'ִלטענטי'