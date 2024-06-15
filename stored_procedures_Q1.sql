Use AdventureWorks2019
Go
CREATE PROCEDURE InsertOrderDetails
    @OrderID INT,
    @ProductID INT,
    @UnitPrice MONEY = NULL,
    @Quantity INT,
    @Discount FLOAT = 0
AS
BEGIN
    DECLARE @DefaultUnitPrice MONEY;
    SELECT @DefaultUnitPrice = UnitPrice
    FROM Products
    WHERE ProductID = @ProductID;
    IF @UnitPrice IS NULL
        SET @UnitPrice = @DefaultUnitPrice;
    INSERT INTO [Order Details] (OrderID, ProductID, UnitPrice, Quantity, Discount)
    VALUES (@OrderID, @ProductID, @UnitPrice, @Quantity, @Discount);
    IF @@ROWCOUNT = 0
    BEGIN
        PRINT 'Failed to place the order. Please try again.';
    END
    ELSE
    BEGIN
        UPDATE Products
        SET UnitsInStock = UnitsInStock - @Quantity
        WHERE ProductID = @ProductID;
        PRINT 'Order placed successfully.';
    END
END;
GO
