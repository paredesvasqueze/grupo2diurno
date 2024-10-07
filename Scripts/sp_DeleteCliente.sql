CREATE PROCEDURE sp_DeleteCliente
    @nIdCliente INT
AS
BEGIN
    DELETE FROM Cliente
    WHERE nIdCliente = @nIdCliente;
	select cast(@@ROWCOUNT as int)
END;