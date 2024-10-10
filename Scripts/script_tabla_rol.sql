create proc USP_GET_Rol_Todos
as
select * from Rol
go

CREATE PROCEDURE sp_InsertRol
    @cDescripcion VARCHAR(100)
    
AS
BEGIN
    INSERT INTO Rol (cDescripcion)
    VALUES (@cDescripcion);
    
    SELECT cast (SCOPE_IDENTITY() as int) AS nIdRol; -- Devuelve el ID del nuevo registro
END;
go

CREATE PROCEDURE sp_UpdateRol
    @nIdRol INT,
    @cDescripcion VARCHAR(100)
    
AS
BEGIN
    UPDATE Rol
    SET cDescripcion = @cDescripcion
        
    WHERE nIdRol = @nIdRol;
	select cast(@@ROWCOUNT as int)
END;
go

CREATE PROCEDURE sp_DeleteRol
    @nIdRol INT
AS
BEGIN
    DELETE FROM Rol
    WHERE nIdRol = @nIdRol;
	select cast(@@ROWCOUNT as int)
END;
go

