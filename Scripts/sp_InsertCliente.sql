CREATE PROCEDURE sp_InsertCliente
    @cNombre VARCHAR(255),
    @cApellido VARCHAR(255),
    @cDireccion NVARCHAR(255),
    @cEmail NVARCHAR(255),
    @cTelefono NVARCHAR(255)
AS
BEGIN
    INSERT INTO Cliente (cNombre, cApellido, cDireccion, cEmail, cTelefono)
    VALUES (@cNombre, @cApellido, @cDireccion, @cEmail, @cTelefono);
    
    SELECT SCOPE_IDENTITY() AS nIdCliente; -- Devuelve el ID del nuevo registro
END;