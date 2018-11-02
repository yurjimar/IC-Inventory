use inventory;
INSERT INTO client(IdClient, WWID, First_Name, Last_Name1, Last_Name2, Phone, Email, Province)
VALUES (208130385, '11849728', 'Llurlym', 'Ginenes', 'Araña', '2222-2222', 'yurjimar2001@gmail.com', 'Alajuela');

INSERT INTO category(Name)
VALUES ('PC');

INSERT INTO status(Name)
VALUES ('Nuevo');

INSERT INTO Object(Name, Price, idCategory)
VALUES ('PC Miedo', 3000000, 2);

INSERT INTO Stock(Barcode,Comments, idObject, idStatus)
VALUES (66666,'PC Miedo Terror',2,2);

INSERT INTO History(WWID_Approver, Start_Date, Return_Date, End_Date, Barcode_Stock, idClient)
VALUES(15151515, '5/5/5', '4/4/4', '2/2/2', 66666, 208130385);