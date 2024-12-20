USE [ing_almacen]
GO
/****** Object:  Table [dbo].[Categoria]    Script Date: 14/11/2024 13:05:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categoria](
	[nIdCategoria] [int] IDENTITY(1,1) NOT NULL,
	[cNombre] [varchar](255) NULL,
 CONSTRAINT [XPKCategoria] PRIMARY KEY CLUSTERED 
(
	[nIdCategoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 14/11/2024 13:05:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cliente](
	[nIdCliente] [int] IDENTITY(1,1) NOT NULL,
	[cNombre] [varchar](255) NULL,
	[cApellido] [varchar](255) NULL,
	[cDireccion] [varchar](255) NULL,
	[cEmail] [varchar](255) NULL,
	[cTelefono] [varchar](255) NULL,
 CONSTRAINT [XPKCliente] PRIMARY KEY CLUSTERED 
(
	[nIdCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DetalleOrden]    Script Date: 14/11/2024 13:05:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetalleOrden](
	[nIdDetalleorden] [int] IDENTITY(1,1) NOT NULL,
	[nCantidad] [int] NULL,
	[nPrecioUnitario] [decimal](10, 2) NULL,
	[nIdProducto] [int] NULL,
	[nIdOrden] [int] NULL,
 CONSTRAINT [XPKDetalleOrden] PRIMARY KEY CLUSTERED 
(
	[nIdDetalleorden] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Kardex]    Script Date: 14/11/2024 13:05:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kardex](
	[nIdKardex] [int] IDENTITY(1,1) NOT NULL,
	[nCantidad] [int] NULL,
	[nStockActual] [int] NULL,
	[cTipoMovimiento] [varchar](50) NULL,
	[dFechaMovimiento] [datetime] NULL,
	[nIdProducto] [int] NULL,
	[nIdUsuario] [int] NULL,
 CONSTRAINT [XPKKardex] PRIMARY KEY CLUSTERED 
(
	[nIdKardex] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orden]    Script Date: 14/11/2024 13:05:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orden](
	[nIdOrden] [int] IDENTITY(1,1) NOT NULL,
	[cEstado] [varchar](50) NULL,
	[dFecha] [datetime] NULL,
	[nTotal] [decimal](10, 2) NULL,
	[nIdUsuario] [int] NULL,
	[nIdCliente] [int] NULL,
 CONSTRAINT [XPKOrden] PRIMARY KEY CLUSTERED 
(
	[nIdOrden] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Producto]    Script Date: 14/11/2024 13:05:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Producto](
	[nIdProducto] [int] IDENTITY(1,1) NOT NULL,
	[cNombre] [varchar](255) NULL,
	[cColor] [varchar](50) NULL,
	[nPrecio] [decimal](10, 2) NULL,
	[cTalla] [varchar](50) NULL,
	[nIdCategoria] [int] NULL,
 CONSTRAINT [XPKProducto] PRIMARY KEY CLUSTERED 
(
	[nIdProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rol]    Script Date: 14/11/2024 13:05:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rol](
	[nIdRol] [int] IDENTITY(1,1) NOT NULL,
	[cDescripcion] [varchar](100) NULL,
 CONSTRAINT [XPKRol] PRIMARY KEY CLUSTERED 
(
	[nIdRol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 14/11/2024 13:05:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[nIdUsuario] [int] IDENTITY(1,1) NOT NULL,
	[cNombreUsuario] [varchar](255) NOT NULL,
	[cContrasenaHash] [varchar](255) NOT NULL,
	[cNombreCompleto] [varchar](255) NULL,
	[dtFechaCreacion] [datetime] NULL,
	[dtUltimoAcceso] [datetime] NULL,
	[bActivo] [bit] NULL,
	[nIdRol] [int] NULL,
 CONSTRAINT [XPKUsuario] PRIMARY KEY CLUSTERED 
(
	[nIdUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Categoria] ON 

INSERT [dbo].[Categoria] ([nIdCategoria], [cNombre]) VALUES (1, N'zapatillas')
INSERT [dbo].[Categoria] ([nIdCategoria], [cNombre]) VALUES (2, N'abarrotes')
INSERT [dbo].[Categoria] ([nIdCategoria], [cNombre]) VALUES (4, N'string')
INSERT [dbo].[Categoria] ([nIdCategoria], [cNombre]) VALUES (5, N'venta')
INSERT [dbo].[Categoria] ([nIdCategoria], [cNombre]) VALUES (6, N'verduras')
SET IDENTITY_INSERT [dbo].[Categoria] OFF
GO
SET IDENTITY_INSERT [dbo].[Cliente] ON 

INSERT [dbo].[Cliente] ([nIdCliente], [cNombre], [cApellido], [cDireccion], [cEmail], [cTelefono]) VALUES (1, N'Luz', N'Prado', N'Avenida Ejercito 124', N'luzprado@gmail.com', N'908765432')
INSERT [dbo].[Cliente] ([nIdCliente], [cNombre], [cApellido], [cDireccion], [cEmail], [cTelefono]) VALUES (2, N'Vanessa', N'Pereda', N'Avenida Union 924', N'vanessapereda@gmail.com', N'912765432')
INSERT [dbo].[Cliente] ([nIdCliente], [cNombre], [cApellido], [cDireccion], [cEmail], [cTelefono]) VALUES (4, N'Vanessa', N'Martinez', N'Avenida Primavera', N'vanessa@gmail.com', N'908734562')
SET IDENTITY_INSERT [dbo].[Cliente] OFF
GO
SET IDENTITY_INSERT [dbo].[DetalleOrden] ON 

INSERT [dbo].[DetalleOrden] ([nIdDetalleorden], [nCantidad], [nPrecioUnitario], [nIdProducto], [nIdOrden]) VALUES (1, 2, CAST(50.00 AS Decimal(10, 2)), 6, 2)
INSERT [dbo].[DetalleOrden] ([nIdDetalleorden], [nCantidad], [nPrecioUnitario], [nIdProducto], [nIdOrden]) VALUES (3, 30, CAST(120.00 AS Decimal(10, 2)), 6, 2)
SET IDENTITY_INSERT [dbo].[DetalleOrden] OFF
GO
SET IDENTITY_INSERT [dbo].[Kardex] ON 

INSERT [dbo].[Kardex] ([nIdKardex], [nCantidad], [nStockActual], [cTipoMovimiento], [dFechaMovimiento], [nIdProducto], [nIdUsuario]) VALUES (2, 33, 50, N'salida', CAST(N'2024-10-21T00:38:01.773' AS DateTime), 4, 3)
SET IDENTITY_INSERT [dbo].[Kardex] OFF
GO
SET IDENTITY_INSERT [dbo].[Orden] ON 

INSERT [dbo].[Orden] ([nIdOrden], [cEstado], [dFecha], [nTotal], [nIdUsuario], [nIdCliente]) VALUES (2, N'No disponible', CAST(N'2024-10-20T23:58:55.793' AS DateTime), CAST(4.00 AS Decimal(10, 2)), 2, 2)
SET IDENTITY_INSERT [dbo].[Orden] OFF
GO
SET IDENTITY_INSERT [dbo].[Producto] ON 

INSERT [dbo].[Producto] ([nIdProducto], [cNombre], [cColor], [nPrecio], [cTalla], [nIdCategoria]) VALUES (2, N'chocolate', N'blanco', CAST(10.00 AS Decimal(10, 2)), N's', 1)
INSERT [dbo].[Producto] ([nIdProducto], [cNombre], [cColor], [nPrecio], [cTalla], [nIdCategoria]) VALUES (4, N'tomates', N'rojos', CAST(20.00 AS Decimal(10, 2)), N's', 6)
INSERT [dbo].[Producto] ([nIdProducto], [cNombre], [cColor], [nPrecio], [cTalla], [nIdCategoria]) VALUES (6, N'sandia', N'verde', CAST(12.00 AS Decimal(10, 2)), N'', 5)
SET IDENTITY_INSERT [dbo].[Producto] OFF
GO
SET IDENTITY_INSERT [dbo].[Rol] ON 

INSERT [dbo].[Rol] ([nIdRol], [cDescripcion]) VALUES (2, N'Admin')
INSERT [dbo].[Rol] ([nIdRol], [cDescripcion]) VALUES (3, N'Admin')
SET IDENTITY_INSERT [dbo].[Rol] OFF
GO
SET IDENTITY_INSERT [dbo].[Usuario] ON 

INSERT [dbo].[Usuario] ([nIdUsuario], [cNombreUsuario], [cContrasenaHash], [cNombreCompleto], [dtFechaCreacion], [dtUltimoAcceso], [bActivo], [nIdRol]) VALUES (2, N'Fabi', N'123', N'Fabrizio Vidal Paredes', CAST(N'2024-09-17T15:04:02.267' AS DateTime), CAST(N'2024-10-17T15:04:02.267' AS DateTime), 1, 2)
INSERT [dbo].[Usuario] ([nIdUsuario], [cNombreUsuario], [cContrasenaHash], [cNombreCompleto], [dtFechaCreacion], [dtUltimoAcceso], [bActivo], [nIdRol]) VALUES (3, N'Fabi', N'123', N'Fabrizio Vidal Paredes', CAST(N'2024-09-17T15:04:02.267' AS DateTime), CAST(N'2024-10-17T15:04:02.267' AS DateTime), 1, 2)
SET IDENTITY_INSERT [dbo].[Usuario] OFF
GO
ALTER TABLE [dbo].[DetalleOrden]  WITH CHECK ADD  CONSTRAINT [R_32] FOREIGN KEY([nIdProducto])
REFERENCES [dbo].[Producto] ([nIdProducto])
GO
ALTER TABLE [dbo].[DetalleOrden] CHECK CONSTRAINT [R_32]
GO
ALTER TABLE [dbo].[DetalleOrden]  WITH CHECK ADD  CONSTRAINT [R_34] FOREIGN KEY([nIdOrden])
REFERENCES [dbo].[Orden] ([nIdOrden])
GO
ALTER TABLE [dbo].[DetalleOrden] CHECK CONSTRAINT [R_34]
GO
ALTER TABLE [dbo].[Kardex]  WITH CHECK ADD  CONSTRAINT [R_31] FOREIGN KEY([nIdProducto])
REFERENCES [dbo].[Producto] ([nIdProducto])
GO
ALTER TABLE [dbo].[Kardex] CHECK CONSTRAINT [R_31]
GO
ALTER TABLE [dbo].[Kardex]  WITH CHECK ADD  CONSTRAINT [R_45] FOREIGN KEY([nIdUsuario])
REFERENCES [dbo].[Usuario] ([nIdUsuario])
GO
ALTER TABLE [dbo].[Kardex] CHECK CONSTRAINT [R_45]
GO
ALTER TABLE [dbo].[Orden]  WITH CHECK ADD  CONSTRAINT [R_41] FOREIGN KEY([nIdUsuario])
REFERENCES [dbo].[Usuario] ([nIdUsuario])
GO
ALTER TABLE [dbo].[Orden] CHECK CONSTRAINT [R_41]
GO
ALTER TABLE [dbo].[Orden]  WITH CHECK ADD  CONSTRAINT [R_42] FOREIGN KEY([nIdCliente])
REFERENCES [dbo].[Cliente] ([nIdCliente])
GO
ALTER TABLE [dbo].[Orden] CHECK CONSTRAINT [R_42]
GO
ALTER TABLE [dbo].[Producto]  WITH CHECK ADD  CONSTRAINT [R_36] FOREIGN KEY([nIdCategoria])
REFERENCES [dbo].[Categoria] ([nIdCategoria])
GO
ALTER TABLE [dbo].[Producto] CHECK CONSTRAINT [R_36]
GO
ALTER TABLE [dbo].[Usuario]  WITH CHECK ADD  CONSTRAINT [R_27] FOREIGN KEY([nIdRol])
REFERENCES [dbo].[Rol] ([nIdRol])
GO
ALTER TABLE [dbo].[Usuario] CHECK CONSTRAINT [R_27]
GO
/****** Object:  StoredProcedure [dbo].[sp_DeleteCategoria]    Script Date: 14/11/2024 13:05:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_DeleteCategoria]
    @nIdCategoria INT
AS
BEGIN
    DELETE FROM Categoria
    WHERE nIdCategoria = @nIdCategoria;
	select cast(@@ROWCOUNT as int)
END;

GO
/****** Object:  StoredProcedure [dbo].[sp_DeleteCliente]    Script Date: 14/11/2024 13:05:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_DeleteCliente]
    @nIdCliente INT
AS
BEGIN
    DELETE FROM Cliente
    WHERE nIdCliente = @nIdCliente;
	select cast(@@ROWCOUNT as int)
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_DeleteDetalleOrden]    Script Date: 14/11/2024 13:05:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_DeleteDetalleOrden]
    @nIdDetalleorden INT
AS
BEGIN
    DELETE FROM DetalleOrden
    WHERE nIdDetalleorden = @nIdDetalleorden;
	select cast(@@ROWCOUNT as int)
END;

GO
/****** Object:  StoredProcedure [dbo].[sp_DeleteKardex]    Script Date: 14/11/2024 13:05:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_DeleteKardex]
    @nIdKardex INT
AS
BEGIN
    DELETE FROM Kardex
    WHERE nIdKardex = @nIdKardex;
	select cast(@@ROWCOUNT as int)
END;

GO
/****** Object:  StoredProcedure [dbo].[sp_DeleteOrden]    Script Date: 14/11/2024 13:05:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_DeleteOrden]
    @nIdOrden INT
AS
BEGIN
    DELETE FROM Orden
    WHERE nIdOrden = @nIdOrden;
	select cast(@@ROWCOUNT as int)
END;

GO
/****** Object:  StoredProcedure [dbo].[sp_DeleteProducto]    Script Date: 14/11/2024 13:05:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_DeleteProducto]
    @nIdProducto INT
AS
BEGIN
    DELETE FROM Producto
    WHERE nIdProducto = @nIdProducto;
	select cast(@@ROWCOUNT as int)
END;

GO
/****** Object:  StoredProcedure [dbo].[sp_DeleteRol]    Script Date: 14/11/2024 13:05:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_DeleteRol]
    @nIdRol INT
AS
BEGIN
    DELETE FROM Rol
    WHERE nIdRol = @nIdRol;
	select cast(@@ROWCOUNT as int)
END;

GO
/****** Object:  StoredProcedure [dbo].[sp_DeleteUsuario]    Script Date: 14/11/2024 13:05:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_DeleteUsuario]
    @nIdUsuario INT
AS
BEGIN
    DELETE FROM Usuario
    WHERE nIdUsuario = @nIdUsuario;
	select cast(@@ROWCOUNT as int)
END;

GO
/****** Object:  StoredProcedure [dbo].[sp_InsertCategoria]    Script Date: 14/11/2024 13:05:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_InsertCategoria]
    @cNombre VARCHAR(255)
    
AS
BEGIN
    INSERT INTO Categoria (cNombre)
    VALUES (@cNombre);
    
    SELECT cast (SCOPE_IDENTITY() as int) AS nIdCategoria; -- Devuelve el ID del nuevo registro
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertCliente]    Script Date: 14/11/2024 13:05:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_InsertCliente]
    @cNombre VARCHAR(255),
    @cApellido VARCHAR(255),
    @cDireccion NVARCHAR(255),
    @cEmail NVARCHAR(255),
    @cTelefono NVARCHAR(255)
AS
BEGIN
    INSERT INTO Cliente (cNombre, cApellido, cDireccion, cEmail, cTelefono)
    VALUES (@cNombre, @cApellido, @cDireccion, @cEmail, @cTelefono);
    
    SELECT cast(SCOPE_IDENTITY() as int) AS nIdCliente; -- Devuelve el ID del nuevo registro
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertDetalleOrden]    Script Date: 14/11/2024 13:05:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_InsertDetalleOrden]
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
/****** Object:  StoredProcedure [dbo].[sp_InsertKardex]    Script Date: 14/11/2024 13:05:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_InsertKardex]
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
/****** Object:  StoredProcedure [dbo].[sp_InsertOrden]    Script Date: 14/11/2024 13:05:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_InsertOrden]
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
/****** Object:  StoredProcedure [dbo].[sp_InsertProducto]    Script Date: 14/11/2024 13:05:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_InsertProducto]
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
/****** Object:  StoredProcedure [dbo].[sp_InsertRol]    Script Date: 14/11/2024 13:05:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_InsertRol]
    @cDescripcion VARCHAR(100)
    
AS
BEGIN
    INSERT INTO Rol (cDescripcion)
    VALUES (@cDescripcion);
    
    SELECT cast (SCOPE_IDENTITY() as int) AS nIdRol; -- Devuelve el ID del nuevo registro
END;

GO
/****** Object:  StoredProcedure [dbo].[sp_InsertUsuario]    Script Date: 14/11/2024 13:05:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_InsertUsuario]
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
/****** Object:  StoredProcedure [dbo].[sp_UpdateCategoria]    Script Date: 14/11/2024 13:05:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_UpdateCategoria]
    @nIdCategoria INT,
    @cNombre VARCHAR(255)
    
AS
BEGIN
    UPDATE Categoria
    SET cNombre = @cNombre
        
    WHERE nIdCategoria = @nIdCategoria;
	select cast(@@ROWCOUNT as int)
END;

GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateCliente]    Script Date: 14/11/2024 13:05:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[sp_UpdateCliente]
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
GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateDetalleOrden]    Script Date: 14/11/2024 13:05:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create PROCEDURE [dbo].[sp_UpdateDetalleOrden]
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
/****** Object:  StoredProcedure [dbo].[sp_UpdateKardex]    Script Date: 14/11/2024 13:05:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create PROCEDURE [dbo].[sp_UpdateKardex]
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
/****** Object:  StoredProcedure [dbo].[sp_UpdateOrden]    Script Date: 14/11/2024 13:05:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create PROCEDURE [dbo].[sp_UpdateOrden]
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
/****** Object:  StoredProcedure [dbo].[sp_UpdateProducto]    Script Date: 14/11/2024 13:05:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[sp_UpdateProducto]
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
/****** Object:  StoredProcedure [dbo].[sp_UpdateRol]    Script Date: 14/11/2024 13:05:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_UpdateRol]
    @nIdRol INT,
    @cDescripcion VARCHAR(100)
    
AS
BEGIN
    UPDATE Rol
    SET cDescripcion = @cDescripcion
        
    WHERE nIdRol = @nIdRol;
	select cast(@@ROWCOUNT as int)
END;

GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateUsuario]    Script Date: 14/11/2024 13:05:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create PROCEDURE [dbo].[sp_UpdateUsuario]
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
/****** Object:  StoredProcedure [dbo].[USP_GET_Categoria_Todos]    Script Date: 14/11/2024 13:05:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[USP_GET_Categoria_Todos]
as
select * from Categoria
GO
/****** Object:  StoredProcedure [dbo].[USP_GET_Cliente_Todos]    Script Date: 14/11/2024 13:05:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[USP_GET_Cliente_Todos]
as
select * from Cliente
GO
/****** Object:  StoredProcedure [dbo].[USP_GET_DetalleOrden_Todos]    Script Date: 14/11/2024 13:05:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[USP_GET_DetalleOrden_Todos]
as
select * from DetalleOrden
GO
/****** Object:  StoredProcedure [dbo].[USP_GET_Kardex_Todos]    Script Date: 14/11/2024 13:05:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[USP_GET_Kardex_Todos]
as
select * from Kardex
GO
/****** Object:  StoredProcedure [dbo].[USP_GET_Orden_Todos]    Script Date: 14/11/2024 13:05:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[USP_GET_Orden_Todos]
as
select * from Orden
GO
/****** Object:  StoredProcedure [dbo].[USP_GET_Producto_ById]    Script Date: 14/11/2024 13:05:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[USP_GET_Producto_ById]
@nIdProducto int 
as
select nIdProducto, 
p.cNombre ,
cColor ,
nPrecio ,
cTalla ,
p.nIdCategoria,
c.cNombre cNombreCategoria  from Producto p
inner join categoria c
on p.nIdCategoria = c.nIdCategoria
where  nIdProducto = @nIdProducto
GO
/****** Object:  StoredProcedure [dbo].[USP_GET_Producto_Todos]    Script Date: 14/11/2024 13:05:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[USP_GET_Producto_Todos]
as
select nIdProducto, 
p.cNombre ,
cColor ,
nPrecio ,
cTalla ,
p.nIdCategoria,
c.cNombre cNombreCategoria  from Producto p
inner join categoria c
on p.nIdCategoria = c.nIdCategoria
GO
/****** Object:  StoredProcedure [dbo].[USP_GET_Rol_Todos]    Script Date: 14/11/2024 13:05:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[USP_GET_Rol_Todos]
as
select * from Rol
GO
/****** Object:  StoredProcedure [dbo].[USP_GET_Usuario_Todos]    Script Date: 14/11/2024 13:05:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[USP_GET_Usuario_Todos]
as
select * from Usuario
GO
/****** Object:  StoredProcedure [dbo].[uspInsertarCliente]    Script Date: 14/11/2024 13:05:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[uspInsertarCliente]
 
@cNombre varchar(255),
@cApellido varchar(255),
@cDireccion varchar(255),
@cEmail varchar(255),
@cTelefono varchar(255)
AS
BEGIN
INSERT INTO Cliente
(cNombre,cApellido,cDireccion,cEmail,cTelefono)
VALUES
(@cNombre,@cApellido,@cDireccion,@cEmail,@cTelefono)         
END
GO
