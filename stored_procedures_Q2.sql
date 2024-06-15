Use AdventureWorks2019
Go
CREATE PROCEDURE UpdateOrderDetails
    @OrderID INT,
    @ProductID INT,
    @UnitPrice MONEY = NULL,
    @Quantity INT = NULL,
    @Discount FLOAT = NULL
AS
BEGIN
    IF @UnitPrice IS NOT NULL
    BEGIN
        UPDATE [Order Details]
        SET UnitPrice = @UnitPrice
        WHERE OrderID = @OrderID AND ProductID = @ProductID;
    END

    IF @Quantity IS NOT NULL
    BEGIN
        UPDATE [Order Details]
        SET Quantity = @Quantity
        WHERE OrderID = @OrderID AND ProductID = @ProductID;
    END

    IF @Discount IS NOT NULL
    BEGIN
        UPDATE [Order Details]
        SET Discount = @Discount
        WHERE OrderID = @OrderID AND ProductID = @ProductID;
    END
END;
GO