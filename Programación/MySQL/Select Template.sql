select Client.First_Name, Client.Last_Name1, History.Start_Date, Stock.Barcode, Status.Name,Object.Name, Category.Name
from Client INNER JOIN History ON History.Client = Client.idClient  
INNER JOIN Stock ON Stock.Barcode = History.Barcode_Stock
INNER JOIN Status ON Status.idStatus = Stock.Barcode
INNER JOIN Object ON Stock.Object = Object.idObject
INNER JOIN Category ON Category.idCategory = Object.Category


