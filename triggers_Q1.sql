Use AdventureWorks2019
Go
CREATE TRIGGER trgInsteadOfDeleteOrder
ON Orders
INSTEAD OF DELETE
AS
BEGIN
    DELETE FROM [Order Details]
    WHERE OrderID IN (SELECT OrderID FROM DELETED);

    DELETE FROM Orders
    WHERE OrderID IN (SELECT OrderID FROM DELETED);
END;
GO