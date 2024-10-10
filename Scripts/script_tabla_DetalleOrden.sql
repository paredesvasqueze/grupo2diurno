CREATE proc USP_GET_DetalleOrden_Todos
as
select * from DetalleOrden
GO

CREATE PROCEDURE sp_InsertDetalleOrden
    @nCantidad INT,
    @nPrecioUnitario DECIMAL(10,2),
    @nIdProducto INT,
	@nIdOrden INT

AS
BEGIN
    INSERT INTO DetalleOrden (nCantidad, nPrecioUnitario, nIdProducto,  nIdOrden)
    VALUES (@nCantidad, @nPrecioUnitario, @nIdProducto,  @nIdOrden);
    
    SELECT cast(SCOPE_IDENTITY() as int) AS nIdDetalleorden; -- Devuelve el ID del nuevo registro
END;
GO

create PROCEDURE sp_UpdateDetalleOrden
    @nIdDetalleorden INT,
    @nCantidad INT,
    @nPrecioUnitario DECIMAL(10,2),
    @nIdProducto INT,
	@nIdOrden INT
AS
BEGIN
    UPDATE DetalleOrden
    SET nCantidad  = @nCantidad ,
        nPrecioUnitario = @nPrecioUnitario,
		nIdProducto = @nIdProducto,
		nIdOrden = @nIdOrden
    WHERE nIdDetalleorden = @nIdDetalleorden;
	select cast(@@ROWCOUNT as int)
END;
GO

CREATE PROCEDURE sp_DeleteDetalleOrden
    @nIdDetalleorden INT
AS
BEGIN
    DELETE FROM DetalleOrden
    WHERE nIdDetalleorden = @nIdDetalleorden;
	select cast(@@ROWCOUNT as int)
END;
GO