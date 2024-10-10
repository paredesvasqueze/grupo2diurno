CREATE proc USP_GET_Orden_Todos
as
select * from Orden
GO

CREATE PROCEDURE sp_InsertOrden
    @cEstado VARCHAR(50),
    @dFecha DATETIME,
    @nTotal DECIMAL(10,2),
    @nIdUsuario INT,
	@nIdCliente INT

AS
BEGIN
    INSERT INTO Orden (cEstado, dFecha, nTotal,  nIdUsuario,nIdCliente )
    VALUES (@cEstado, @dFecha, @nTotal,  @nIdUsuario,@nIdCliente );
    
    SELECT cast(SCOPE_IDENTITY() as int) AS nIdOrden; -- Devuelve el ID del nuevo registro
END;
GO

create PROCEDURE sp_UpdateOrden
    @nIdOrden INT,
    @cEstado VARCHAR(50),
    @dFecha DATETIME,
    @nTotal DECIMAL(10,2),
    @nIdUsuario INT,
	@nIdCliente INT
AS
BEGIN
    UPDATE Orden
    SET cEstado = @cEstado,
        dFecha = @dFecha,
        nTotal = @nTotal,
		nIdUsuario = @nIdUsuario,
		nIdCliente = @nIdCliente
    WHERE nIdOrden = @nIdOrden;
	select cast(@@ROWCOUNT as int)
END;
GO

CREATE PROCEDURE sp_DeleteOrden
    @nIdOrden INT
AS
BEGIN
    DELETE FROM Orden
    WHERE nIdOrden = @nIdOrden;
	select cast(@@ROWCOUNT as int)
END;
GO