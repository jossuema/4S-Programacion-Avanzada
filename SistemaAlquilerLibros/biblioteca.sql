USE [master]
GO
/****** Object:  Database [Biblioteca]    Script Date: 2/28/2024 1:56:03 PM ******/
CREATE DATABASE [Biblioteca]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Biblioteca', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Biblioteca.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Biblioteca_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Biblioteca_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Biblioteca] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Biblioteca].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Biblioteca] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Biblioteca] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Biblioteca] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Biblioteca] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Biblioteca] SET ARITHABORT OFF 
GO
ALTER DATABASE [Biblioteca] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Biblioteca] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Biblioteca] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Biblioteca] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Biblioteca] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Biblioteca] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Biblioteca] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Biblioteca] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Biblioteca] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Biblioteca] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Biblioteca] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Biblioteca] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Biblioteca] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Biblioteca] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Biblioteca] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Biblioteca] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Biblioteca] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Biblioteca] SET RECOVERY FULL 
GO
ALTER DATABASE [Biblioteca] SET  MULTI_USER 
GO
ALTER DATABASE [Biblioteca] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Biblioteca] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Biblioteca] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Biblioteca] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Biblioteca] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Biblioteca] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Biblioteca', N'ON'
GO
ALTER DATABASE [Biblioteca] SET QUERY_STORE = ON
GO
ALTER DATABASE [Biblioteca] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Biblioteca]
GO
/****** Object:  Table [dbo].[Categoria]    Script Date: 2/28/2024 1:56:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categoria](
	[id_categoria] [int] NOT NULL,
	[nombre] [varchar](100) NOT NULL,
	[descripcion] [varchar](100) NOT NULL,
 CONSTRAINT [PK4] PRIMARY KEY NONCLUSTERED 
(
	[id_categoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Editorial]    Script Date: 2/28/2024 1:56:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Editorial](
	[id_editorial] [int] NOT NULL,
	[nombre] [varchar](100) NOT NULL,
	[pais] [varchar](50) NOT NULL,
 CONSTRAINT [PK6] PRIMARY KEY NONCLUSTERED 
(
	[id_editorial] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Libro]    Script Date: 2/28/2024 1:56:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Libro](
	[id_libro] [int] NOT NULL,
	[estado] [varchar](50) NOT NULL,
	[anio_publicacion] [datetime] NOT NULL,
	[tipo] [varchar](100) NOT NULL,
	[nombre] [varchar](100) NOT NULL,
	[id_categoria] [int] NOT NULL,
	[id_editorial] [int] NOT NULL,
	[stock] [int] NOT NULL,
 CONSTRAINT [PK1] PRIMARY KEY NONCLUSTERED 
(
	[id_libro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[V_Listarlibro]    Script Date: 2/28/2024 1:56:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[V_Listarlibro]
AS
SELECT        dbo.Libro.id_libro, dbo.Libro.nombre, dbo.Libro.tipo, dbo.Libro.anio_publicacion, dbo.Categoria.nombre AS Categoria, dbo.Editorial.nombre AS Editorial, dbo.Libro.estado
FROM            dbo.Libro INNER JOIN
                         dbo.Editorial ON dbo.Libro.id_editorial = dbo.Editorial.id_editorial INNER JOIN
                         dbo.Categoria ON dbo.Libro.id_categoria = dbo.Categoria.id_categoria
GO
/****** Object:  Table [dbo].[Autor]    Script Date: 2/28/2024 1:56:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Autor](
	[id_autor] [int] NOT NULL,
	[estado] [varchar](50) NOT NULL,
	[nombre] [varchar](100) NOT NULL,
	[apellido] [varchar](100) NOT NULL,
	[sexo] [char](1) NOT NULL,
	[fecha_nacimiento] [datetime] NOT NULL,
 CONSTRAINT [PK3] PRIMARY KEY NONCLUSTERED 
(
	[id_autor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Autor Libro]    Script Date: 2/28/2024 1:56:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Autor Libro](
	[id_autor] [int] NOT NULL,
	[id_libro] [int] NOT NULL,
 CONSTRAINT [PK15] PRIMARY KEY NONCLUSTERED 
(
	[id_autor] ASC,
	[id_libro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Estudiante]    Script Date: 2/28/2024 1:56:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Estudiante](
	[id_estudiante] [int] NOT NULL,
	[cedula] [varchar](10) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[apellido] [varchar](50) NOT NULL,
	[fecha_nacimiento] [datetime] NOT NULL,
	[sexo] [char](1) NOT NULL,
	[estado_civil] [varchar](50) NOT NULL,
	[estado] [varchar](50) NOT NULL,
 CONSTRAINT [PK2] PRIMARY KEY NONCLUSTERED 
(
	[id_estudiante] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HistorialBajas]    Script Date: 2/28/2024 1:56:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HistorialBajas](
	[id_baja] [int] IDENTITY(1,1) NOT NULL,
	[id_libro] [int] NOT NULL,
	[fecha_baja] [datetime] NOT NULL,
	[motivo] [varchar](255) NULL,
	[decremento_stock] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_baja] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Prestamo]    Script Date: 2/28/2024 1:56:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Prestamo](
	[id_prestamo] [int] NOT NULL,
	[estado] [varchar](50) NOT NULL,
	[fecha_entrega] [datetime] NOT NULL,
	[fecha_tentativa] [datetime] NOT NULL,
	[fecha_devolucion] [datetime] NOT NULL,
	[id_estudiante] [int] NOT NULL,
 CONSTRAINT [PK7] PRIMARY KEY NONCLUSTERED 
(
	[id_prestamo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Prestamo Libro]    Script Date: 2/28/2024 1:56:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Prestamo Libro](
	[id_prestamo] [int] NOT NULL,
	[id_libro] [int] NOT NULL,
 CONSTRAINT [PK17] PRIMARY KEY NONCLUSTERED 
(
	[id_prestamo] ASC,
	[id_libro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Libro] ADD  DEFAULT ((0)) FOR [stock]
GO
ALTER TABLE [dbo].[Autor Libro]  WITH CHECK ADD  CONSTRAINT [RefAutor66] FOREIGN KEY([id_autor])
REFERENCES [dbo].[Autor] ([id_autor])
GO
ALTER TABLE [dbo].[Autor Libro] CHECK CONSTRAINT [RefAutor66]
GO
ALTER TABLE [dbo].[Autor Libro]  WITH CHECK ADD  CONSTRAINT [RefLibro67] FOREIGN KEY([id_libro])
REFERENCES [dbo].[Libro] ([id_libro])
GO
ALTER TABLE [dbo].[Autor Libro] CHECK CONSTRAINT [RefLibro67]
GO
ALTER TABLE [dbo].[HistorialBajas]  WITH CHECK ADD FOREIGN KEY([id_libro])
REFERENCES [dbo].[Libro] ([id_libro])
GO
ALTER TABLE [dbo].[Libro]  WITH CHECK ADD  CONSTRAINT [RefCategoria38] FOREIGN KEY([id_categoria])
REFERENCES [dbo].[Categoria] ([id_categoria])
GO
ALTER TABLE [dbo].[Libro] CHECK CONSTRAINT [RefCategoria38]
GO
ALTER TABLE [dbo].[Libro]  WITH CHECK ADD  CONSTRAINT [RefEditorial39] FOREIGN KEY([id_editorial])
REFERENCES [dbo].[Editorial] ([id_editorial])
GO
ALTER TABLE [dbo].[Libro] CHECK CONSTRAINT [RefEditorial39]
GO
ALTER TABLE [dbo].[Prestamo]  WITH CHECK ADD  CONSTRAINT [RefEstudiante40] FOREIGN KEY([id_estudiante])
REFERENCES [dbo].[Estudiante] ([id_estudiante])
GO
ALTER TABLE [dbo].[Prestamo] CHECK CONSTRAINT [RefEstudiante40]
GO
ALTER TABLE [dbo].[Prestamo Libro]  WITH CHECK ADD  CONSTRAINT [RefLibro73] FOREIGN KEY([id_libro])
REFERENCES [dbo].[Libro] ([id_libro])
GO
ALTER TABLE [dbo].[Prestamo Libro] CHECK CONSTRAINT [RefLibro73]
GO
ALTER TABLE [dbo].[Prestamo Libro]  WITH CHECK ADD  CONSTRAINT [RefPrestamo72] FOREIGN KEY([id_prestamo])
REFERENCES [dbo].[Prestamo] ([id_prestamo])
GO
ALTER TABLE [dbo].[Prestamo Libro] CHECK CONSTRAINT [RefPrestamo72]
GO
/****** Object:  StoredProcedure [dbo].[CP_ActualizarAutor]    Script Date: 2/28/2024 1:56:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CP_ActualizarAutor]
    @id_autor INT,
    @estado NVARCHAR(50),
    @nombre NVARCHAR(100),
    @apellido NVARCHAR(100),
    @sexo CHAR(1),
    @fecha_nacimiento DATETIME
AS
BEGIN
    UPDATE Autor
    SET estado = @estado,
        nombre = @nombre,
        apellido = @apellido,
        sexo = @sexo,
        fecha_nacimiento = @fecha_nacimiento
    WHERE id_autor = @id_autor
END
GO
/****** Object:  StoredProcedure [dbo].[CP_ActualizarBajaLibro]    Script Date: 2/28/2024 1:56:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CP_ActualizarBajaLibro]
    @id_baja INT,
	@id_libro INT,
    @fecha_baja DATETIME,
    @motivo VARCHAR(255),
    @decremento_stock INT
AS
BEGIN
	UPDATE Libro SET stock = stock + (SELECT decremento_stock FROM HistorialBajas WHERE id_baja = @id_baja) - @decremento_stock WHERE id_libro = @id_libro;

    UPDATE HistorialBajas
    SET fecha_baja = @fecha_baja,
        motivo = @motivo,
        decremento_stock = @decremento_stock
    WHERE id_baja = @id_baja;
END;
GO
/****** Object:  StoredProcedure [dbo].[CP_ActualizarCategoria]    Script Date: 2/28/2024 1:56:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Actualizar una Categoria Existente
CREATE PROCEDURE [dbo].[CP_ActualizarCategoria]
    @id_categoria INT,
    @nombre NVARCHAR(100),
    @descripcion NVARCHAR(255)
AS
BEGIN
    UPDATE Categoria
    SET nombre = @nombre,
        descripcion = @descripcion
    WHERE id_categoria = @id_categoria
END
GO
/****** Object:  StoredProcedure [dbo].[CP_ActualizarEditorial]    Script Date: 2/28/2024 1:56:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CP_ActualizarEditorial]
    @id_editorial INT,
    @nombre NVARCHAR(100),
    @pais NVARCHAR(50)
AS
BEGIN
    UPDATE Editorial
    SET nombre = @nombre,
        pais = @pais
    WHERE id_editorial = @id_editorial
END
GO
/****** Object:  StoredProcedure [dbo].[CP_ActualizarEstudiante]    Script Date: 2/28/2024 1:56:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Actualizar un Estudiante Existente
CREATE PROCEDURE [dbo].[CP_ActualizarEstudiante]
    @id_estudiante INT,
    @cedula NVARCHAR(10),
    @nombre NVARCHAR(50),
    @apellido NVARCHAR(50),
    @fecha_nacimiento DATETIME,
    @sexo CHAR(1),
    @estado_civil NVARCHAR(50),
    @estado NVARCHAR(50)
AS
BEGIN
    UPDATE Estudiante
    SET cedula = @cedula,
        nombre = @nombre,
        apellido = @apellido,
        fecha_nacimiento = @fecha_nacimiento,
        sexo = @sexo,
        estado_civil = @estado_civil,
        estado = @estado
    WHERE id_estudiante = @id_estudiante
END
GO
/****** Object:  StoredProcedure [dbo].[CP_ActualizarLibro]    Script Date: 2/28/2024 1:56:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CP_ActualizarLibro]
	@id_libro INT,
	@estado NVARCHAR(50),
	@anio DATETIME,
	@tipo NVARCHAR(100),
	@nombre NVARCHAR(100),
	@id_categoria INT,
	@id_editorial INT,
	@stock INT
AS
BEGIN
	UPDATE Libro
	SET estado = @estado,
		anio_publicacion = @anio,
		tipo = @tipo,
		nombre = @nombre,
		id_categoria = @id_categoria,
		id_editorial = @id_editorial,
		stock = @stock
	WHERE id_libro = @id_libro;
END;
GO
/****** Object:  StoredProcedure [dbo].[CP_ActualizarPrestamo]    Script Date: 2/28/2024 1:56:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CP_ActualizarPrestamo]
	@id_prestamo INT,
	@estado NVARCHAR(50),
	@fecha_entrega DATETIME,
	@fecha_tentativa DATETIME,
	@fecha_devolucion DATETIME,
	@id_estudiante INT
AS
BEGIN
	UPDATE Prestamo
	SET estado = @estado,
		fecha_entrega = @fecha_entrega,
		fecha_tentativa = @fecha_tentativa,
		fecha_devolucion = @fecha_devolucion,
		id_estudiante = @id_estudiante
	WHERE id_prestamo = @id_prestamo;
END;
GO
/****** Object:  StoredProcedure [dbo].[CP_BuscarAutor]    Script Date: 2/28/2024 1:56:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CP_BuscarAutor]
	@clave INT
AS
BEGIN
	SELECT * FROM Autor WHERE id_autor = @clave;
END
GO
/****** Object:  StoredProcedure [dbo].[CP_BuscarCategoria]    Script Date: 2/28/2024 1:56:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CP_BuscarCategoria]
	@clave INT
AS
BEGIN
	SELECT * FROM Categoria WHERE id_categoria = @clave;
END
GO
/****** Object:  StoredProcedure [dbo].[CP_BuscarEditorial]    Script Date: 2/28/2024 1:56:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CP_BuscarEditorial]
	@clave INT
AS
BEGIN
	SELECT * FROM Editorial WHERE id_editorial = @clave;
END
GO
/****** Object:  StoredProcedure [dbo].[CP_BuscarEstudiante]    Script Date: 2/28/2024 1:56:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CP_BuscarEstudiante]
	@clave INT
AS
BEGIN
	SELECT * FROM Estudiante WHERE id_estudiante = @clave;
END
GO
/****** Object:  StoredProcedure [dbo].[CP_BuscarHistorialBaja]    Script Date: 2/28/2024 1:56:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CP_BuscarHistorialBaja]
    @id_libro INT
AS
BEGIN
    SELECT * FROM HistorialBajas
    WHERE id_baja = @id_libro;
END;
GO
/****** Object:  StoredProcedure [dbo].[CP_BuscarLibro]    Script Date: 2/28/2024 1:56:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CP_BuscarLibro]
	@clave INT
AS
BEGIN
	SELECT * FROM Libro WHERE id_libro = @clave;
END
GO
/****** Object:  StoredProcedure [dbo].[CP_BuscarPrestamo]    Script Date: 2/28/2024 1:56:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CP_BuscarPrestamo]
	@clave INT
AS
BEGIN
	SELECT * FROM Prestamo WHERE id_prestamo = @clave;
END
GO
/****** Object:  StoredProcedure [dbo].[CP_EliminarAutor]    Script Date: 2/28/2024 1:56:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CP_EliminarAutor]
    @id_autor INT
AS
BEGIN
    DELETE FROM Autor
    WHERE id_autor = @id_autor
END
GO
/****** Object:  StoredProcedure [dbo].[CP_EliminarAutorLibro]    Script Date: 2/28/2024 1:56:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CP_EliminarAutorLibro]
	@id INT
AS
BEGIN
	DELETE FROM [Autor Libro] WHERE id_autor = @id;
END;
GO
/****** Object:  StoredProcedure [dbo].[CP_EliminarAutoryLibro]    Script Date: 2/28/2024 1:56:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CP_EliminarAutoryLibro]
	@id_autor INT,
	@id_libro INT
AS
BEGIN
	DELETE FROM [Autor Libro] WHERE id_autor = @id_autor AND id_libro = @id_libro 
END
GO
/****** Object:  StoredProcedure [dbo].[CP_EliminarCategoria]    Script Date: 2/28/2024 1:56:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Eliminar una Categoria
CREATE PROCEDURE [dbo].[CP_EliminarCategoria]
    @id_categoria INT
AS
BEGIN
    DELETE FROM Categoria
    WHERE id_categoria = @id_categoria
END
GO
/****** Object:  StoredProcedure [dbo].[CP_EliminarEditorial]    Script Date: 2/28/2024 1:56:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CP_EliminarEditorial]
    @id_editorial INT
AS
BEGIN
    DELETE FROM Editorial
    WHERE id_editorial = @id_editorial
END
GO
/****** Object:  StoredProcedure [dbo].[CP_EliminarEstudiante]    Script Date: 2/28/2024 1:56:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Eliminar un Estudiante
CREATE PROCEDURE [dbo].[CP_EliminarEstudiante]
    @id_estudiante INT
AS
BEGIN
    DELETE FROM Estudiante
    WHERE id_estudiante = @id_estudiante
END
GO
/****** Object:  StoredProcedure [dbo].[CP_EliminarHistorialBaja]    Script Date: 2/28/2024 1:56:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CP_EliminarHistorialBaja]
    @id_baja INT
AS
BEGIN
    -- Opcional: Ajustar el stock del libro antes de eliminar el registro de baja.
    -- Este paso depende de tus reglas de negocio.

    DELETE FROM HistorialBajas
    WHERE id_baja = @id_baja;
END;
GO
/****** Object:  StoredProcedure [dbo].[CP_EliminarLibro]    Script Date: 2/28/2024 1:56:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CP_EliminarLibro]
	@id_libro INT
AS
BEGIN
	DELETE FROM Libro
	WHERE id_libro = @id_libro;
END;
GO
/****** Object:  StoredProcedure [dbo].[CP_EliminarLibroAutor]    Script Date: 2/28/2024 1:56:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CP_EliminarLibroAutor]
	@id INT
AS
BEGIN
	DELETE FROM [Autor Libro] WHERE id_libro = @id;
END;
GO
/****** Object:  StoredProcedure [dbo].[CP_EliminarLibroPrestamo]    Script Date: 2/28/2024 1:56:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CP_EliminarLibroPrestamo]
	@id INT
AS
BEGIN
	DELETE FROM [Prestamo Libro] WHERE id_libro = @id;
END;
GO
/****** Object:  StoredProcedure [dbo].[CP_EliminarPrestamo]    Script Date: 2/28/2024 1:56:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CP_EliminarPrestamo]
	@id_prestamo INT
AS
BEGIN
	DELETE FROM Prestamo
	WHERE id_prestamo = @id_prestamo;
END;
GO
/****** Object:  StoredProcedure [dbo].[CP_EliminarPrestamoLibro]    Script Date: 2/28/2024 1:56:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CP_EliminarPrestamoLibro]
	@id INT
AS
BEGIN
	DELETE FROM [Prestamo Libro] WHERE id_prestamo = @id;
END;
GO
/****** Object:  StoredProcedure [dbo].[CP_EliminarPrestamoYLibro]    Script Date: 2/28/2024 1:56:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CP_EliminarPrestamoYLibro]
	@idPrestamo INT,
	@idLibro INT
AS
BEGIN
	DELETE FROM [Prestamo Libro] WHERE id_prestamo = @idPrestamo AND @idLibro = @idLibro;
END
GO
/****** Object:  StoredProcedure [dbo].[CP_InsertarAutor]    Script Date: 2/28/2024 1:56:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CP_InsertarAutor]
    @id_autor INT,
    @estado NVARCHAR(50),
    @nombre NVARCHAR(100),
    @apellido NVARCHAR(100),
    @sexo CHAR(1),
    @fecha_nacimiento DATETIME
AS
BEGIN
    INSERT INTO Autor (id_autor, estado, nombre, apellido, sexo, fecha_nacimiento)
    VALUES (@id_autor, @estado, @nombre, @apellido, @sexo, @fecha_nacimiento)
END
GO
/****** Object:  StoredProcedure [dbo].[CP_InsertarAutorLibro]    Script Date: 2/28/2024 1:56:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CP_InsertarAutorLibro]
	@id_autor INT,
	@id_libro INT
AS
BEGIN
	INSERT INTO [Autor Libro] (id_autor, id_libro)
	VALUES (@id_autor, @id_libro)
END;
GO
/****** Object:  StoredProcedure [dbo].[CP_InsertarCategoria]    Script Date: 2/28/2024 1:56:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Insertar una Nueva Categoria
CREATE PROCEDURE [dbo].[CP_InsertarCategoria]
    @id_categoria INT,
    @nombre NVARCHAR(100),
    @descripcion NVARCHAR(255)
AS
BEGIN
    INSERT INTO Categoria (id_categoria, nombre, descripcion)
    VALUES (@id_categoria, @nombre, @descripcion)
END
GO
/****** Object:  StoredProcedure [dbo].[CP_InsertarEditorial]    Script Date: 2/28/2024 1:56:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CP_InsertarEditorial]
    @id_editorial INT,
    @nombre NVARCHAR(100),
    @pais NVARCHAR(50)
AS
BEGIN
    INSERT INTO Editorial (id_editorial, nombre, pais)
    VALUES (@id_editorial, @nombre, @pais)
END
GO
/****** Object:  StoredProcedure [dbo].[CP_InsertarEstudiante]    Script Date: 2/28/2024 1:56:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Insertar un Nuevo Estudiante
CREATE PROCEDURE [dbo].[CP_InsertarEstudiante]
    @id_estudiante INT,
    @cedula NVARCHAR(10),
    @nombre NVARCHAR(50),
    @apellido NVARCHAR(50),
    @fecha_nacimiento DATETIME,
    @sexo CHAR(1),
    @estado_civil NVARCHAR(50),
    @estado NVARCHAR(50)
AS
BEGIN
    INSERT INTO Estudiante (id_estudiante, cedula, nombre, apellido, fecha_nacimiento, sexo, estado_civil, estado)
    VALUES (@id_estudiante, @cedula, @nombre, @apellido, @fecha_nacimiento, @sexo, @estado_civil, @estado)
END
GO
/****** Object:  StoredProcedure [dbo].[CP_InsertarLibro]    Script Date: 2/28/2024 1:56:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CP_InsertarLibro]
	@id_libro INT,
	@estado NVARCHAR(50),
	@anio DATETIME,
	@tipo NVARCHAR(100),
	@nombre NVARCHAR(100),
	@id_categoria INT,
	@id_editorial INT,
	@stock INT
AS
BEGIN
	INSERT INTO Libro (id_libro, estado, anio_publicacion, tipo, nombre, id_categoria, id_editorial, stock)
	VALUES (@id_libro, @estado, @anio, @tipo, @nombre, @id_categoria, @id_editorial, @stock);
END;
GO
/****** Object:  StoredProcedure [dbo].[CP_InsertarPrestamo]    Script Date: 2/28/2024 1:56:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CP_InsertarPrestamo]
	@id_prestamo INT,
	@estado NVARCHAR(50),
	@fecha_entrega DATETIME,
	@fecha_tentativa DATETIME,
	@fecha_devolucion DATETIME,
	@id_estudiante INT
AS
BEGIN
	INSERT INTO Prestamo (id_prestamo, estado, fecha_entrega, fecha_tentativa, fecha_devolucion, id_estudiante)
	VALUES (@id_prestamo, @estado, @fecha_entrega, @fecha_tentativa, @fecha_devolucion, @id_estudiante);
END;
GO
/****** Object:  StoredProcedure [dbo].[CP_InsertarPrestamoLibro]    Script Date: 2/28/2024 1:56:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CP_InsertarPrestamoLibro]
	@id_prestamo INT,
	@id_libro INT
AS
BEGIN
	INSERT INTO [Prestamo Libro] (id_prestamo, id_libro)
	VALUES (@id_prestamo, @id_libro)
END;
GO
/****** Object:  StoredProcedure [dbo].[CP_ListarAutores]    Script Date: 2/28/2024 1:56:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CP_ListarAutores]
    @filtro NVARCHAR(100) = NULL
AS
BEGIN
    IF @filtro IS NULL
    BEGIN
        SELECT * FROM Autor
    END
    ELSE
    BEGIN
        SELECT * FROM Autor
        WHERE nombre LIKE '%' + @filtro + '%' OR apellido LIKE '%' + @filtro + '%'
    END
END
GO
/****** Object:  StoredProcedure [dbo].[CP_ListarAutorLibro]    Script Date: 2/28/2024 1:56:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CP_ListarAutorLibro]
	@id INT = NULL
AS
BEGIN
	IF @id IS NULL
	BEGIN
		SELECT * FROM [Autor Libro];
	END
	ELSE
	BEGIN
		SELECT * FROM [Autor Libro] WHERE id_autor  = @id;
	END
END;
GO
/****** Object:  StoredProcedure [dbo].[CP_ListarCategorias]    Script Date: 2/28/2024 1:56:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Listar (Filtrar) Categorias
CREATE PROCEDURE [dbo].[CP_ListarCategorias]
    @filtro NVARCHAR(100) = NULL
AS
BEGIN
    IF @filtro IS NULL
    BEGIN
        SELECT * FROM Categoria
    END
    ELSE
    BEGIN
        SELECT * FROM Categoria
        WHERE nombre LIKE '%' + @filtro + '%'
    END
END
GO
/****** Object:  StoredProcedure [dbo].[CP_ListarEditoriales]    Script Date: 2/28/2024 1:56:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CP_ListarEditoriales]
    @filtro NVARCHAR(100) = NULL
AS
BEGIN
    IF @filtro IS NULL
    BEGIN
        SELECT * FROM Editorial
    END
    ELSE
    BEGIN
        SELECT * FROM Editorial
        WHERE nombre LIKE '%' + @filtro + '%'
    END
END
GO
/****** Object:  StoredProcedure [dbo].[CP_ListarEstudiantes]    Script Date: 2/28/2024 1:56:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Listar (Filtrar) Estudiantes
CREATE PROCEDURE [dbo].[CP_ListarEstudiantes]
    @filtro NVARCHAR(100) = NULL
AS
BEGIN
    IF @filtro IS NULL
    BEGIN
        SELECT * FROM Estudiante
    END
    ELSE
    BEGIN
        SELECT * FROM Estudiante
        WHERE nombre LIKE '%' + @filtro + '%'
           OR apellido LIKE '%' + @filtro + '%'
           OR cedula LIKE '%' + @filtro + '%'
    END
END
GO
/****** Object:  StoredProcedure [dbo].[CP_ListarHistorialBajas]    Script Date: 2/28/2024 1:56:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CP_ListarHistorialBajas]
AS
BEGIN
    SELECT * FROM HistorialBajas;
END;
GO
/****** Object:  StoredProcedure [dbo].[CP_ListarLibroAutor]    Script Date: 2/28/2024 1:56:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CP_ListarLibroAutor]
	@id INT
AS
BEGIN
	SELECT * FROM [Autor Libro] WHERE id_libro  = @id;
END;
GO
/****** Object:  StoredProcedure [dbo].[CP_ListarLibroPersonaPersonalizado]    Script Date: 2/28/2024 1:56:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CP_ListarLibroPersonaPersonalizado]
	@valor varchar(25)
AS
BEGIN
	SELECT @valor = RTRIM(@valor) + '%'
	SELECT * FROM V_Listarlibro
	WHERE nombre like @valor or tipo like @valor or Categoria like @valor
END
GO
/****** Object:  StoredProcedure [dbo].[CP_ListarLibroPrestamo]    Script Date: 2/28/2024 1:56:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CP_ListarLibroPrestamo]
	@id INT = NULL
AS
BEGIN
	IF @id IS NULL
	BEGIN
		SELECT * FROM [Prestamo Libro];
	END
	ELSE
	BEGIN
		SELECT * FROM [Prestamo Libro] WHERE id_libro  = @id;
	END
END;
GO
/****** Object:  StoredProcedure [dbo].[CP_ListarLibros]    Script Date: 2/28/2024 1:56:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CP_ListarLibros]
	@filtro NVARCHAR(100) = NULL
AS
BEGIN
	IF @filtro IS NULL
    BEGIN
        SELECT * FROM Libro
    END
    ELSE
    BEGIN
        SELECT * FROM Libro
        WHERE estado LIKE '%' + @filtro + '%'
           OR tipo LIKE '%' + @filtro + '%'
           OR nombre LIKE '%' + @filtro + '%'
    END
END;
GO
/****** Object:  StoredProcedure [dbo].[CP_ListarLibrosCategoria]    Script Date: 2/28/2024 1:56:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CP_ListarLibrosCategoria]
	
AS
BEGIN
	select Libro.id_libro, Libro.nombre, Libro.tipo, Categoria.nombre as Categoria, Editorial.nombre as Editorial
	from Libro inner join Categoria on Libro.id_categoria = Categoria.id_categoria inner join Editorial on Libro.id_editorial = Editorial.id_editorial
END
GO
/****** Object:  StoredProcedure [dbo].[CP_ListarLibrosDisponibles]    Script Date: 2/28/2024 1:56:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CP_ListarLibrosDisponibles]
	
AS
BEGIN
	SELECT *
	FROM Libro
	WHERE estado = 'Disponible';
END
GO
/****** Object:  StoredProcedure [dbo].[CP_ListarPrestamoLibro]    Script Date: 2/28/2024 1:56:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CP_ListarPrestamoLibro]
	@id INT = NULL
AS
BEGIN
	IF @id IS NULL
	BEGIN
		SELECT * FROM [Prestamo Libro];
	END
	ELSE
	BEGIN
		SELECT * FROM [Prestamo Libro] WHERE id_prestamo  = @id;
	END
END;
GO
/****** Object:  StoredProcedure [dbo].[CP_ListarPrestamos]    Script Date: 2/28/2024 1:56:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CP_ListarPrestamos]
	@filtro NVARCHAR(100) = NULL
AS
BEGIN
	IF @filtro IS NULL
    BEGIN
        SELECT * FROM Prestamo
    END
    ELSE
    BEGIN
        SELECT * FROM Prestamo
        WHERE estado LIKE '%' + @filtro + '%';
    END
END;
GO
/****** Object:  StoredProcedure [dbo].[CP_ListarPrestamosFecha]    Script Date: 2/28/2024 1:56:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CP_ListarPrestamosFecha]
	@filtro DATETIME = NULL
AS
BEGIN
	IF @filtro IS NULL
    BEGIN
        SELECT * FROM Prestamo
    END
    ELSE
    BEGIN
		DECLARE @FechaInicio DATETIME = CAST(CAST(@filtro AS DATE) AS DATETIME)
		DECLARE @FechaFin DATETIME = DATEADD(DAY, 1, @FechaInicio)

        SELECT * FROM Prestamo
        WHERE (CAST(fecha_entrega AS DATE) = CAST(@filtro AS DATE))
			OR (CAST(fecha_devolucion AS DATE) = CAST(@filtro AS DATE))
			OR (CAST(fecha_tentativa AS DATE) = CAST(@filtro AS DATE))
    END
END;
GO
/****** Object:  StoredProcedure [dbo].[CP_ListarVistaLibro]    Script Date: 2/28/2024 1:56:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CP_ListarVistaLibro]
	
AS
BEGIN
	select * from [dbo].[V_Listarlibro]
END
GO
/****** Object:  StoredProcedure [dbo].[CP_ListarVistaLibro2]    Script Date: 2/28/2024 1:56:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CP_ListarVistaLibro2]
@val varchar(40)	
AS
BEGIN
	select @val = rtrim(@val) + '%';
	select *
	from V_ListarLibro
	where nombre like @val or Categoria like @val or Editorial like @val
END
GO
/****** Object:  StoredProcedure [dbo].[DarDeBajaLibro]    Script Date: 2/28/2024 1:56:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DarDeBajaLibro]
    @id_libro INT,
    @fecha_baja DATETIME,
    @motivo VARCHAR(255),
    @decremento_stock INT
AS
BEGIN
    INSERT INTO HistorialBajas(id_libro, fecha_baja, motivo, decremento_stock)
    VALUES (@id_libro, @fecha_baja, @motivo, @decremento_stock);

    UPDATE Libro
    SET stock = stock - @decremento_stock
    WHERE id_libro = @id_libro;
END;
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[21] 2[17] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Libro"
            Begin Extent = 
               Top = 35
               Left = 392
               Bottom = 165
               Right = 571
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Editorial"
            Begin Extent = 
               Top = 56
               Left = 119
               Bottom = 169
               Right = 289
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Categoria"
            Begin Extent = 
               Top = 32
               Left = 671
               Bottom = 145
               Right = 841
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_Listarlibro'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_Listarlibro'
GO
USE [master]
GO
ALTER DATABASE [Biblioteca] SET  READ_WRITE 
GO
