USE [master]
GO
/****** Object:  Database [ExplorArg]    Script Date: 26/03/2021 23:01:21 ******/
CREATE DATABASE [ExplorArg]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ExplorArg_Data', FILENAME = N'c:\dzsqls\ExplorArg.mdf' , SIZE = 8192KB , MAXSIZE = 30720KB , FILEGROWTH = 22528KB )
 LOG ON 
( NAME = N'ExplorArg_Logs', FILENAME = N'c:\dzsqls\ExplorArg.ldf' , SIZE = 8192KB , MAXSIZE = 30720KB , FILEGROWTH = 22528KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [ExplorArg] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ExplorArg].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ExplorArg] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ExplorArg] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ExplorArg] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ExplorArg] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ExplorArg] SET ARITHABORT OFF 
GO
ALTER DATABASE [ExplorArg] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ExplorArg] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ExplorArg] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ExplorArg] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ExplorArg] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ExplorArg] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ExplorArg] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ExplorArg] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ExplorArg] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ExplorArg] SET  ENABLE_BROKER 
GO
ALTER DATABASE [ExplorArg] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ExplorArg] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ExplorArg] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ExplorArg] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ExplorArg] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ExplorArg] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ExplorArg] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ExplorArg] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ExplorArg] SET  MULTI_USER 
GO
ALTER DATABASE [ExplorArg] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ExplorArg] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ExplorArg] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ExplorArg] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ExplorArg] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ExplorArg] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [ExplorArg] SET QUERY_STORE = OFF
GO
USE [ExplorArg]
GO
/****** Object:  User [Mponce_SQLLogin_1]    Script Date: 26/03/2021 23:01:24 ******/
CREATE USER [Mponce_SQLLogin_1] FOR LOGIN [Mponce_SQLLogin_1] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [Mponce_SQLLogin_1]
GO
/****** Object:  Schema [Mponce_SQLLogin_1]    Script Date: 26/03/2021 23:01:24 ******/
CREATE SCHEMA [Mponce_SQLLogin_1]
GO
/****** Object:  Table [dbo].[Actividad]    Script Date: 26/03/2021 23:01:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Actividad](
	[IdActividad] [int] IDENTITY(1,1) NOT NULL,
	[NombreActividad] [varchar](50) NOT NULL,
	[DescripcionActividad] [varchar](max) NOT NULL,
	[IdLocalidad] [int] NOT NULL,
	[IdTipoActividad] [int] NOT NULL,
	[IdGaleria] [int] NOT NULL,
 CONSTRAINT [PK_Actividad] PRIMARY KEY CLUSTERED 
(
	[IdActividad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Chat]    Script Date: 26/03/2021 23:01:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Chat](
	[IdChat] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[Mensaje] [varchar](max) NOT NULL,
	[IdUsuario] [int] NOT NULL,
 CONSTRAINT [PK_Chat] PRIMARY KEY CLUSTERED 
(
	[IdChat] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cuenta]    Script Date: 26/03/2021 23:01:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cuenta](
	[IdCuenta] [int] IDENTITY(1,1) NOT NULL,
	[NombreCuenta] [varchar](50) NOT NULL,
	[Contraseña] [varbinary](50) NOT NULL,
	[IdTipoCuenta] [int] NOT NULL,
	[IdUsuario] [int] NOT NULL,
	[IdGaleria] [int] NOT NULL,
	[IdClima] [int] NOT NULL,
 CONSTRAINT [PK_Cuenta] PRIMARY KEY CLUSTERED 
(
	[IdCuenta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Departamento]    Script Date: 26/03/2021 23:01:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Departamento](
	[IdDepartamento] [int] IDENTITY(1,1) NOT NULL,
	[NombreDepartamento] [varchar](50) NOT NULL,
	[Descripcion] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Departamento] PRIMARY KEY CLUSTERED 
(
	[IdDepartamento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Foro]    Script Date: 26/03/2021 23:01:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Foro](
	[IdForo] [int] IDENTITY(1,1) NOT NULL,
	[Tema] [varchar](50) NOT NULL,
	[Comentario] [varchar](max) NOT NULL,
	[FechaPublicación] [datetime] NOT NULL,
	[Valoración] [bit] NOT NULL,
	[IdCuenta] [int] NOT NULL,
 CONSTRAINT [PK_Foro] PRIMARY KEY CLUSTERED 
(
	[IdForo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Galeria]    Script Date: 26/03/2021 23:01:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Galeria](
	[IdGaleria] [int] IDENTITY(1,1) NOT NULL,
	[GaleriaDescripcion] [varchar](50) NOT NULL,
	[IdLocalidad] [int] NOT NULL,
 CONSTRAINT [PK_Galeria] PRIMARY KEY CLUSTERED 
(
	[IdGaleria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HistorialClima]    Script Date: 26/03/2021 23:01:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HistorialClima](
	[IdClima] [int] IDENTITY(1,1) NOT NULL,
	[RegistroFecha] [datetime] NOT NULL,
 CONSTRAINT [PK_HistorialClima] PRIMARY KEY CLUSTERED 
(
	[IdClima] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Itinerario]    Script Date: 26/03/2021 23:01:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Itinerario](
	[IdItinerario] [int] IDENTITY(1,1) NOT NULL,
	[IdActividad] [int] NOT NULL,
 CONSTRAINT [PK_Itinerario] PRIMARY KEY CLUSTERED 
(
	[IdItinerario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Localidad]    Script Date: 26/03/2021 23:01:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Localidad](
	[IdLocalidad] [int] IDENTITY(1,1) NOT NULL,
	[NombreLocalidad] [varchar](50) NOT NULL,
	[Descripcion] [varchar](50) NOT NULL,
	[IdDepartamento] [int] NOT NULL,
	[IdClima] [int] NOT NULL,
 CONSTRAINT [PK_Localidad] PRIMARY KEY CLUSTERED 
(
	[IdLocalidad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Perfil]    Script Date: 26/03/2021 23:01:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Perfil](
	[IdPerfil] [int] IDENTITY(1,1) NOT NULL,
	[IdCuenta] [int] NOT NULL,
 CONSTRAINT [PK_Perfil] PRIMARY KEY CLUSTERED 
(
	[IdPerfil] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoActividad]    Script Date: 26/03/2021 23:01:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoActividad](
	[IdTipoActividad] [int] IDENTITY(1,1) NOT NULL,
	[DescripcionTipoActividad] [varchar](50) NOT NULL,
 CONSTRAINT [PK_TipoActividad] PRIMARY KEY CLUSTERED 
(
	[IdTipoActividad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoCuenta]    Script Date: 26/03/2021 23:01:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoCuenta](
	[IdTipoCuenta] [int] IDENTITY(1,1) NOT NULL,
	[DescripciónTipoCuenta] [varchar](50) NOT NULL,
 CONSTRAINT [PK_TipoCuenta] PRIMARY KEY CLUSTERED 
(
	[IdTipoCuenta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 26/03/2021 23:01:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[IdUsuario] [int] IDENTITY(1,1) NOT NULL,
	[Apellido] [varchar](50) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[FechaNacimiento] [datetime] NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[DNI] [char](50) NOT NULL,
	[Domicilio] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[IdUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Actividad]  WITH CHECK ADD  CONSTRAINT [FK_Actividad_Galeria] FOREIGN KEY([IdGaleria])
REFERENCES [dbo].[Galeria] ([IdGaleria])
GO
ALTER TABLE [dbo].[Actividad] CHECK CONSTRAINT [FK_Actividad_Galeria]
GO
ALTER TABLE [dbo].[Actividad]  WITH CHECK ADD  CONSTRAINT [FK_Actividad_Localidad] FOREIGN KEY([IdLocalidad])
REFERENCES [dbo].[Localidad] ([IdLocalidad])
GO
ALTER TABLE [dbo].[Actividad] CHECK CONSTRAINT [FK_Actividad_Localidad]
GO
ALTER TABLE [dbo].[Actividad]  WITH CHECK ADD  CONSTRAINT [FK_Actividad_TipoActividad] FOREIGN KEY([IdTipoActividad])
REFERENCES [dbo].[TipoActividad] ([IdTipoActividad])
GO
ALTER TABLE [dbo].[Actividad] CHECK CONSTRAINT [FK_Actividad_TipoActividad]
GO
ALTER TABLE [dbo].[Chat]  WITH CHECK ADD  CONSTRAINT [FK_Chat_Usuario] FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[Usuario] ([IdUsuario])
GO
ALTER TABLE [dbo].[Chat] CHECK CONSTRAINT [FK_Chat_Usuario]
GO
ALTER TABLE [dbo].[Cuenta]  WITH CHECK ADD  CONSTRAINT [FK_Cuenta_TipoCuenta] FOREIGN KEY([IdTipoCuenta])
REFERENCES [dbo].[TipoCuenta] ([IdTipoCuenta])
GO
ALTER TABLE [dbo].[Cuenta] CHECK CONSTRAINT [FK_Cuenta_TipoCuenta]
GO
ALTER TABLE [dbo].[Cuenta]  WITH CHECK ADD  CONSTRAINT [FK_Cuenta_Usuario] FOREIGN KEY([IdGaleria])
REFERENCES [dbo].[Usuario] ([IdUsuario])
GO
ALTER TABLE [dbo].[Cuenta] CHECK CONSTRAINT [FK_Cuenta_Usuario]
GO
ALTER TABLE [dbo].[Foro]  WITH CHECK ADD  CONSTRAINT [FK_Foro_Cuenta] FOREIGN KEY([IdCuenta])
REFERENCES [dbo].[Cuenta] ([IdCuenta])
GO
ALTER TABLE [dbo].[Foro] CHECK CONSTRAINT [FK_Foro_Cuenta]
GO
ALTER TABLE [dbo].[HistorialClima]  WITH CHECK ADD  CONSTRAINT [FK_HistorialClima_Cuenta] FOREIGN KEY([IdClima])
REFERENCES [dbo].[Cuenta] ([IdCuenta])
GO
ALTER TABLE [dbo].[HistorialClima] CHECK CONSTRAINT [FK_HistorialClima_Cuenta]
GO
ALTER TABLE [dbo].[Itinerario]  WITH CHECK ADD  CONSTRAINT [FK_Itinerario_Actividad] FOREIGN KEY([IdActividad])
REFERENCES [dbo].[Actividad] ([IdActividad])
GO
ALTER TABLE [dbo].[Itinerario] CHECK CONSTRAINT [FK_Itinerario_Actividad]
GO
ALTER TABLE [dbo].[Localidad]  WITH CHECK ADD  CONSTRAINT [FK_Localidad_Departamento] FOREIGN KEY([IdDepartamento])
REFERENCES [dbo].[Departamento] ([IdDepartamento])
GO
ALTER TABLE [dbo].[Localidad] CHECK CONSTRAINT [FK_Localidad_Departamento]
GO
ALTER TABLE [dbo].[Localidad]  WITH CHECK ADD  CONSTRAINT [FK_Localidad_HistorialClima] FOREIGN KEY([IdClima])
REFERENCES [dbo].[HistorialClima] ([IdClima])
GO
ALTER TABLE [dbo].[Localidad] CHECK CONSTRAINT [FK_Localidad_HistorialClima]
GO
ALTER TABLE [dbo].[Perfil]  WITH CHECK ADD  CONSTRAINT [FK_Perfil_Cuenta] FOREIGN KEY([IdCuenta])
REFERENCES [dbo].[Cuenta] ([IdCuenta])
GO
ALTER TABLE [dbo].[Perfil] CHECK CONSTRAINT [FK_Perfil_Cuenta]
GO
USE [master]
GO
ALTER DATABASE [ExplorArg] SET  READ_WRITE 
GO
