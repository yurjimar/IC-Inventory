-- SHOW OBJECTS FROM DB
-- JOINING THE TABLES OBJECT WITH CATEGORY

delimiter $
CREATE PROCEDURE show_objects ()
BEGIN
	SELECT obj.idObject, obj.Name, obj.Price, obj.idCategory, cat.idCategory, cat.Name 
	FROM  Object obj INNER JOIN Category cat ON cat.idCategory = obj.idCategory;

END $

-- SHOW HISTORY FROM DB
-- JOINING ALL THE TABLES

delimiter $
CREATE PROCEDURE show_history ()
BEGIN
	SELECT 	*
    FROM Client 
    INNER JOIN History ON History.idClient = Client.idClient
    INNER JOIN Stock ON History.Barcode_Stock = Stock.Barcode 
    INNER JOIN Status ON Stock.idStatus = Status.idStatus
    INNER JOIN Object ON Stock.idObject = Object.idObject
    INNER JOIN Category ON Stock.idStock = Category.idCategory
    
    
    
    
    
    
    