create proc USP_GET_Categoria_Todos
as
select * from Categoria
go

CREATE PROCEDURE sp_InsertCategoria
    @cNombre VARCHAR(255)
    
AS
BEGIN
    INSERT INTO Categoria (cNombre)
    VALUES (@cNombre);
    
    SELECT cast (SCOPE_IDENTITY() as int) AS nIdCategoria; -- Devuelve el ID del nuevo registro
END;
go

CREATE PROCEDURE sp_UpdateCategoria
    @nIdCategoria INT,
    @cNombre VARCHAR(255)
    
AS
BEGIN
    UPDATE Categoria
    SET cNombre = @cNombre
        
    WHERE nIdCategoria = @nIdCategoria;
	select cast(@@ROWCOUNT as int)
END;
go

CREATE PROCEDURE sp_DeleteCategoria
    @nIdCategoria INT
AS
BEGIN
    DELETE FROM Categoria
    WHERE nIdCategoria = @nIdCategoria;
	select cast(@@ROWCOUNT as int)
END;
go

