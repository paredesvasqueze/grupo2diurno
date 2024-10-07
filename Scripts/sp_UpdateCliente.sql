cREATE PROCEDURE sp_UpdateCliente
    @nIdCliente INT,
    @cNombre VARCHAR(255),
    @cApellido VARCHAR(255),
    @cDireccion VARCHAR(255),
    @cEmail VARCHAR(255),
    @cTelefono VARCHAR(255)
AS
BEGIN
    UPDATE Cliente
    SET cNombre = @cNombre,
        cApellido = @cApellido,
        cDireccion = @cDireccion,
        cEmail = @cEmail,
        cTelefono = @cTelefono
    WHERE nIdCliente = @nIdCliente;
	select cast(@@ROWCOUNT as int)
END;