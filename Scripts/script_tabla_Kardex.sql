CREATE proc USP_GET_Kardex_Todos
as
select * from Kardex
GO

CREATE PROCEDURE sp_InsertKardex
    @nCantidad INT,
    @nStockActual INT,
    @cTipoMovimiento VARCHAR(50),
	@dFechaMovimiento DATETIME,
	@nIdProducto INT,
	@nIdUsuario INT

AS
BEGIN
    INSERT INTO Kardex (nCantidad, nStockActual, cTipoMovimiento,  dFechaMovimiento, nIdProducto, nIdUsuario)
    VALUES (@nCantidad, @nStockActual, @cTipoMovimiento,  @dFechaMovimiento,@nIdProducto, @nIdUsuario);
    
    SELECT cast(SCOPE_IDENTITY() as int) AS nIdKardex; -- Devuelve el ID del nuevo registro
END;
GO

create PROCEDURE sp_UpdateKardex
    @nIdKardex INT,
    @nCantidad INT,
    @nStockActual INT,
    @cTipoMovimiento VARCHAR(50),
	@dFechaMovimiento DATETIME,
	@nIdProducto INT,
	@nIdUsuario INT
AS
BEGIN
    UPDATE Kardex
    SET nCantidad  = @nCantidad ,
        nStockActual = @nStockActual,
		cTipoMovimiento = @cTipoMovimiento,
		dFechaMovimiento = @dFechaMovimiento,
		nIdProducto = @nIdProducto,
		nIdUsuario = @nIdUsuario

    WHERE nIdKardex = @nIdKardex;
	select cast(@@ROWCOUNT as int)
END;
GO

CREATE PROCEDURE sp_DeleteKardex
    @nIdKardex INT
AS
BEGIN
    DELETE FROM Kardex
    WHERE nIdKardex = @nIdKardex;
	select cast(@@ROWCOUNT as int)
END;
GO