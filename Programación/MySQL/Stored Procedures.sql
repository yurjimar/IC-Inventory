/*
----------------------------------------------------------------
CREATION OF STORED PROCEDURES FOR INNOVATION CENTER'S INVENTORY
----------------------------------------------------------------
*/
use Inventory;

-- SHOW OBJECTS FROM DB
-- JOINING THE TABLES OBJECT WITH CATEGORY

delimiter $
CREATE PROCEDURE show_objects ()
BEGIN
	SELECT obj.idObject, obj.Name, obj.Price, obj.idCategory, cat.idCategory, cat.Name 
	FROM  Object obj INNER JOIN Category cat ON cat.idCategory = obj.idCategory;

END $

-- SHOW INVENTORY FROM DB
-- JOINING ALL THE TABLES
-- SELECTS INFORMATION FROM ALL THE TABLES

delimiter $
CREATE PROCEDURE show_inventory ()
BEGIN
	SELECT 	History.idHistory, History.Start_Date, History.Return_Date, History.End_Date, History.WWID_Approver, 
			Object.idObject, Object.Name, Object.Price, 
			Client.idClient, Client.First_Name, Client.Last_Name1, Client.Last_Name2, Client.Email, Client.Phone, Client.Province,
            Stock.Barcode, Stock.Comments,
            Category.idCategory, Category.Name, 
            Status.idStatus, Status.Name
    FROM Client 
    INNER JOIN History ON History.idClient = Client.idClient
    INNER JOIN Stock ON History.Barcode_Stock = Stock.Barcode 
    INNER JOIN Status ON Stock.idStatus = Status.idStatus
    INNER JOIN Object ON Stock.idObject = Object.idObject
    INNER JOIN Category ON Object.idCategory = Category.idCategory
    ORDER BY DATE(History.Start_Date) DESC;
END $

-- SHOW CLIENTS FROM DB
-- JOINING ALL THE TABLES
-- SELECTS INFORMATION FROM ALL THE TABLES

delimiter $
CREATE PROCEDURE show_client ()
BEGIN 
     SELECT History.idHistory, History.Start_Date, History.Return_Date, History.End_Date, History.WWID_Approver, 
			Object.idObject, Object.Name, Object.Price, 
			Client.idClient, Client.First_Name, Client.Last_Name1, Client.Last_Name2, Client.Email, Client.Phone, Client.Province,
            Stock.Barcode, Stock.Comments,
            Category.idCategory, Category.Name, 
            Status.idStatus, Status.Name
    
    FROM Client 
    INNER JOIN History ON Client.idClient = History.idClient
    INNER JOIN Stock ON History.Barcode_Stock = Stock.Barcode 
    INNER JOIN Status ON Stock.idStatus = Status.idStatus
    INNER JOIN Object ON Stock.idObject = Object.idObject
    INNER JOIN Category ON Object.idCategory = Category.idCategory;
END $

-- INSERT CATEGORIES TO DB
-- JUST ADDS THE NAME, THE ID IS AI

delimiter $
CREATE PROCEDURE insert_category (IN pName VARCHAR(45))
BEGIN
	INSERT INTO Category (Name)
    VALUES (p);
END $

-- INSERT CLIENTS TO DB
-- ADD THE ROWS TO THE CLIENTS 
 
delimiter $
CREATE PROCEDURE insert_client (IN pidClient VARCHAR(15), IN pWWID VARCHAR(8), IN pFirst_Name VARCHAR(65), IN pLast_Name1 VARCHAR(65),
IN pLast_Name2 VARCHAR(65), IN pPhone VARCHAR(9), IN pEmail VARCHAR(100), IN pProvince VARCHAR(11))
BEGIN
	INSERT INTO Client (IdClient, WWID, First_Name, Last_Name1, Last_Name2, Phone, Email, Province)
    VALUES (pidClient, pWWID, pFirst_Name, pLast_Name1, pLast_Name2, pPhone, pEmail, pProvince);
END $

-- INSERT OBJECTS TO DB
-- ADD THE ROWS TO THE CLIENTS 

delimiter $
CREATE PROCEDURE insert_object (IN pName VARCHAR(255), IN pPrice DOUBLE, pidCategory INT)
BEGIN 
	INSERT INTO Object (Name, Price, idCategory)
    Values (pName, pPrice, pidCategory);
END $

-- INSERT STOCK TO DB
-- ADD THE ROWS TO THE CLIENTS 

delimiter $
CREATE PROCEDURE insert_stock (IN pBarcode VARCHAR(50), IN pComments VARCHAR (255), IN pidObject INT, IN pidStatus INT)
BEGIN 
     INSERT INTO Stock (Barcode, Comments, idObject, idStatus)
     Value (pBarcode, pComments, pidObject, pidStatus);
END $

-- INSERT HISTORY TO DB
-- ADD THE ROWS TO THE CLIENTS 

delimiter $
CREATE PROCEDURE insert_history (IN pWWID_Approver VARCHAR(8), pStart_Date DATETIME, pReturn_Date DATETIME, pEnd_Date DATETIME, pBarcode_stock VARCHAR(50), pidClient VARCHAR(15)) 
BEGIN 
	INSERT INTO History (WWID_Approver, Start_Date, Return_Date, End_Date, Barcode_stock, idClient)
    Value ( pWWID_Approver, pStart_Date, pReturn_Date, pEnd_Date, pBarcode_stock, pidClient);
END $

-- INSERT STATUS TO DB
-- ADD THE ROWS TO THE CLIENTS 

delimiter $
CREATE PROCEDURE insert_status (IN pName Varchar(45))
BEGIN  
     INSERT INTO Status (Name)
     Value (pName);
END $
