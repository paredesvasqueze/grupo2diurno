CREATE proc USP_GET_Producto_Todos
as
select * from Producto
GO

CREATE PROCEDURE sp_InsertProducto
    @cNombre VARCHAR(255),
    @cColor VARCHAR(50),
    @nPrecio DECIMAL(10,2),
    @cTalla VARCHAR(50),
	@nIdCategoria INT

AS
BEGIN
    INSERT INTO Producto (cNombre, cColor, nPrecio, cTalla, nIdCategoria)
    VALUES (@cNombre, @cColor, @nPrecio, @cTalla,@nIdCategoria);
    
    SELECT cast(SCOPE_IDENTITY() as int) AS nIdProducto; -- Devuelve el ID del nuevo registro
END;
GO

create PROCEDURE sp_UpdateProducto
    @nIdProducto INT,
    @cNombre VARCHAR(255),
    @cColor VARCHAR(50),
    @nPrecio DECIMAL(10,2),
    @cTalla VARCHAR(50),
    @nIdCategoria INT
AS
BEGIN
    UPDATE Producto
    SET cNombre = @cNombre,
        cColor = @cColor,
        nPrecio = @nPrecio,
        cTalla = @cTalla,
		nIdCategoria = @nIdCategoria
    WHERE nIdProducto = @nIdProducto;
	select cast(@@ROWCOUNT as int)
END;
GO

CREATE PROCEDURE sp_DeleteProducto
    @nIdProducto INT
AS
BEGIN
    DELETE FROM Producto
    WHERE nIdProducto = @nIdProducto;
	select cast(@@ROWCOUNT as int)
END;
GO