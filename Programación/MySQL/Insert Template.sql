use inventory;
INSERT INTO client(IdClient, WWID, First_Name, Last_Name1, Last_Name2, Phone, Email, Province)
VALUES (12121212, '00000000', 'Juan', 'Chaves', 'Solis', '3333-3333', 'juan@gmail.com', 'Puerto');

INSERT INTO category(Name)
VALUES ('Cables');

INSERT INTO status(Name)
VALUES ('Usado');

INSERT INTO Object(Name, Price, idCategory)
VALUES ('Extension Patito', 2300, 1);

INSERT INTO Stock(Barcode,Comments, idObject, idStatus)
VALUES (1234,'Perfecto',1,1);

INSERT INTO History(WWID_Approver, Start_Date, Return_Date, End_Date, Barcode_Stock, idClient)
VALUES(15151515, '9/9/9', '11/11/11', '10/10/10', 1234, 12121212);