Use AdventureWorks2019
Go
CREATE PROCEDURE DeleteOrderDetails
    @OrderID INT,
    @ProductID INT
AS
BEGIN
    IF NOT EXISTS (SELECT 1 FROM [Order Details] WHERE OrderID = @OrderID AND ProductID = @ProductID)
    BEGIN
        PRINT 'Invalid OrderID or ProductID';
        RETURN -1;
    END

    DELETE FROM [Order Details]
    WHERE OrderID = @OrderID AND ProductID = @ProductID;

    IF @@ROWCOUNT = 0
    BEGIN
        PRINT 'No rows deleted. Please check the OrderID and ProductID';
    END
    ELSE
    BEGIN
        PRINT 'Order detail deleted successfully.';
    END
END;
GO
