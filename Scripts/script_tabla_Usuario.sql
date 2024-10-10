CREATE proc USP_GET_Usuario_Todos
as
select * from Usuario
GO

CREATE PROCEDURE sp_InsertUsuario
    @cNombreUsuario VARCHAR(255),
    @cContrasenaHash VARCHAR(255),
    @cNombreCompleto VARCHAR(255),
    @dtFechaCreacion DATETIME,
	@dtUltimoAcceso DATETIME,
	@bActivo BIT,
	@nIdRol INT

AS
BEGIN
    INSERT INTO Usuario (cNombreUsuario, cContrasenaHash, cNombreCompleto, dtFechaCreacion, dtUltimoAcceso, bActivo, nIdRol )
    VALUES (@cNombreUsuario, @cContrasenaHash, @cNombreCompleto, @dtFechaCreacion,  @dtUltimoAcceso,  @bActivo,  @nIdRol );
    
    SELECT cast(SCOPE_IDENTITY() as int) AS nIdUsuario; -- Devuelve el ID del nuevo registro
END;
GO

create PROCEDURE sp_UpdateUsuario
	@nIdUsuario VARCHAR(255),
    @cNombreUsuario VARCHAR(255),
    @cContrasenaHash VARCHAR(255),
    @cNombreCompleto VARCHAR(255),
    @dtFechaCreacion DATETIME,
	@dtUltimoAcceso DATETIME,
	@bActivo BIT,
	@nIdRol INT
AS
BEGIN
    UPDATE Usuario
    SET cNombreUsuario = @cNombreUsuario,
        cContrasenaHash = @cContrasenaHash,
        cNombreCompleto = @cNombreCompleto,
        dtFechaCreacion = @dtFechaCreacion,
		dtUltimoAcceso = @dtUltimoAcceso,
		bActivo = @bActivo,
		nIdRol = @nIdRol

    WHERE nIdUsuario = @nIdUsuario;
	select cast(@@ROWCOUNT as int)
END;
GO

CREATE PROCEDURE sp_DeleteUsuario
    @nIdUsuario INT
AS
BEGIN
    DELETE FROM Usuario
    WHERE nIdUsuario = @nIdUsuario;
	select cast(@@ROWCOUNT as int)
END;
GO