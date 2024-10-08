USE [ing_almacen]
GO
/****** Object:  Table [dbo].[Categoria]    Script Date: 07/10/2024 11:46:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categoria](
	[nIdCategoria] [int] IDENTITY,
	[cNombre] [varchar](255) NULL,
 CONSTRAINT [XPKCategoria] PRIMARY KEY CLUSTERED 
(
	[nIdCategoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 07/10/2024 11:46:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cliente](
	[nIdCliente] [int] IDENTITY,
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
/****** Object:  Table [dbo].[DetalleOrden]    Script Date: 07/10/2024 11:46:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetalleOrden](
	[nIdDetalleorden] [int] IDENTITY,
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
/****** Object:  Table [dbo].[Kardex]    Script Date: 07/10/2024 11:46:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kardex](
	[nIdKardex] [int] IDENTITY,
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
/****** Object:  Table [dbo].[Orden]    Script Date: 07/10/2024 11:46:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orden](
	[nIdOrden] [int] IDENTITY,
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
/****** Object:  Table [dbo].[Producto]    Script Date: 07/10/2024 11:46:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Producto](
	[nIdProducto] [int] IDENTITY,
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
/****** Object:  Table [dbo].[Rol]    Script Date: 07/10/2024 11:46:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rol](
	[nIdRol] [int] IDENTITY,
	[cDescripcion] [varchar](100) NULL,
 CONSTRAINT [XPKRol] PRIMARY KEY CLUSTERED 
(
	[nIdRol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 07/10/2024 11:46:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[nIdUsuario] [int] IDENTITY,
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
/****** Object:  StoredProcedure [dbo].[sp_DeleteCliente]    Script Date: 07/10/2024 11:46:20 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_InsertCliente]    Script Date: 07/10/2024 11:46:20 ******/
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
    
    SELECT SCOPE_IDENTITY() AS nIdCliente; -- Devuelve el ID del nuevo registro
END;
GO
/****** Object:  StoredProcedure [dbo].[USP_GET_Cliente_Todos]    Script Date: 07/10/2024 11:46:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[USP_GET_Cliente_Todos]
as
select * from Cliente
GO
/****** Object:  StoredProcedure [dbo].[uspInsertarCliente]    Script Date: 07/10/2024 11:46:20 ******/
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
