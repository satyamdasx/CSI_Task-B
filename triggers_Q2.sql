Use AdventureWorks2019
Go
CREATE TRIGGER trgCheckStockBeforeInsert
ON [Order Details]
FOR INSERT
AS
BEGIN
    DECLARE @ProductID INT, @Quantity INT;

    SELECT @ProductID = i.ProductID, @Quantity = i.Quantity
    FROM INSERTED i;

    IF EXISTS (
        SELECT 1
        FROM Products
        WHERE ProductID = @ProductID
        AND UnitsInStock >= @Quantity
    )
    BEGIN
        UPDATE Products
        SET UnitsInStock = UnitsInStock - @Quantity
        WHERE ProductID = @ProductID;
    END
    ELSE
    BEGIN
        RAISERROR ('Insufficient stock', 16, 1);
        ROLLBACK;
    END
END;
GO