USE [master]
GO
/****** Object:  Database [rionapo-pr4-pc]    Script Date: 10/19/2015 16:18:36 ******/
CREATE DATABASE [rionapo-pr4-pc] ON  PRIMARY 
( NAME = N'Rio Napo_Data', FILENAME = N'D:\Data\rionapo-pr4-pc.MDF' , SIZE = 150976KB , MAXSIZE = UNLIMITED, FILEGROWTH = 20480KB )
 LOG ON 
( NAME = N'Rio Napo_Log', FILENAME = N'D:\Log\rionapo-pr4-pc.LDF' , SIZE = 37888KB , MAXSIZE = UNLIMITED, FILEGROWTH = 6144KB )
GO
ALTER DATABASE [rionapo-pr4-pc] SET COMPATIBILITY_LEVEL = 80
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [rionapo-pr4-pc].[dbo].[sp_fulltext_database] @action = 'disable'
end
GO
ALTER DATABASE [rionapo-pr4-pc] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [rionapo-pr4-pc] SET ANSI_NULLS OFF
GO
ALTER DATABASE [rionapo-pr4-pc] SET ANSI_PADDING OFF
GO
ALTER DATABASE [rionapo-pr4-pc] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [rionapo-pr4-pc] SET ARITHABORT OFF
GO
ALTER DATABASE [rionapo-pr4-pc] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [rionapo-pr4-pc] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [rionapo-pr4-pc] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [rionapo-pr4-pc] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [rionapo-pr4-pc] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [rionapo-pr4-pc] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [rionapo-pr4-pc] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [rionapo-pr4-pc] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [rionapo-pr4-pc] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [rionapo-pr4-pc] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [rionapo-pr4-pc] SET  DISABLE_BROKER
GO
ALTER DATABASE [rionapo-pr4-pc] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [rionapo-pr4-pc] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [rionapo-pr4-pc] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [rionapo-pr4-pc] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [rionapo-pr4-pc] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [rionapo-pr4-pc] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [rionapo-pr4-pc] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [rionapo-pr4-pc] SET  READ_WRITE
GO
ALTER DATABASE [rionapo-pr4-pc] SET RECOVERY SIMPLE
GO
ALTER DATABASE [rionapo-pr4-pc] SET  MULTI_USER
GO
ALTER DATABASE [rionapo-pr4-pc] SET PAGE_VERIFY TORN_PAGE_DETECTION
GO
ALTER DATABASE [rionapo-pr4-pc] SET DB_CHAINING OFF
GO
USE [rionapo-pr4-pc]
GO
/****** Object:  User [rionapo4]    Script Date: 10/19/2015 16:18:36 ******/
CREATE USER [rionapo4] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [rionapo2014]    Script Date: 10/19/2015 16:18:36 ******/
CREATE USER [rionapo2014] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [rionapo]    Script Date: 10/19/2015 16:18:36 ******/
CREATE USER [rionapo] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[rionapo]
GO
/****** Object:  User [GYL]    Script Date: 10/19/2015 16:18:36 ******/
CREATE USER [GYL] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Schema [rionapo]    Script Date: 10/19/2015 16:18:36 ******/
CREATE SCHEMA [rionapo] AUTHORIZATION [rionapo]
GO
/****** Object:  Table [dbo].[tbrhucat]    Script Date: 10/19/2015 16:18:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbrhucat](
	[catmodulo] [char](3) NOT NULL,
	[catnombre] [char](60) NOT NULL,
	[catcaption] [char](30) NOT NULL,
	[catdescrip] [char](80) NOT NULL,
	[catform] [char](30) NOT NULL,
	[catoricap] [char](30) NOT NULL,
	[catorides] [char](200) NOT NULL,
 CONSTRAINT [PK_tbrhucat] PRIMARY KEY CLUSTERED 
(
	[catmodulo] ASC,
	[catform] ASC,
	[catnombre] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbdocemp]    Script Date: 10/19/2015 16:18:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbdocemp](
	[emplegajo] [char](12) NOT NULL,
	[emptipodoc] [int] NOT NULL,
	[empfecha] [datetime] NOT NULL,
	[emparchivo] [char](200) NOT NULL,
	[empcomenta] [char](254) NOT NULL,
 CONSTRAINT [PK_tbdocemp] PRIMARY KEY CLUSTERED 
(
	[emplegajo] ASC,
	[emparchivo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [rionapo].[sp_ww_NewId]    Script Date: 10/19/2015 16:18:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [rionapo].[sp_ww_NewId]
 @Tabla Char(15),
 @pnID  Int output
AS
 If Not Exists(Select Tabla
  From TBRHUIDS
  Where Tabla = @Tabla)
  Begin
   Insert Into TBRHUIDS(Tabla, LastID)
   Values (@Tabla, 1)
  
   Select @pnID = 1
  End
 Else
  Update TBRHUIDS
  Set  LastID = LastID + 1
      , @pnID = LastID + 1
  Where Tabla = @Tabla
GO
/****** Object:  Table [dbo].[RVACDET]    Script Date: 10/19/2015 16:18:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RVACDET](
	[Codigo] [char](12) NOT NULL,
	[Fecha_act] [datetime] NOT NULL,
	[Totpen] [numeric](6, 2) NOT NULL,
	[PeriPen] [char](30) NOT NULL,
	[Normdev] [numeric](6, 2) NOT NULL,
	[Normtom] [numeric](6, 2) NOT NULL,
	[Propdev] [numeric](6, 2) NOT NULL,
	[Proptom] [numeric](6, 2) NOT NULL,
	[Prgrdev] [numeric](6, 2) NOT NULL,
	[Prgrtom] [numeric](6, 2) NOT NULL,
	[Adicdev] [numeric](6, 2) NOT NULL,
	[Adictom] [numeric](6, 2) NOT NULL,
	[Jdd] [int] NOT NULL,
	[Dulper] [int] NOT NULL,
 CONSTRAINT [PK_RVACDET] PRIMARY KEY CLUSTERED 
(
	[Jdd] ASC,
	[Codigo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RVACACIG]    Script Date: 10/19/2015 16:18:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RVACACIG](
	[Numdoc] [int] NOT NULL,
	[Codigo] [char](12) NOT NULL,
	[Feini] [datetime] NOT NULL,
	[Fefin] [datetime] NOT NULL,
	[Dias] [numeric](6, 2) NOT NULL,
	[Status] [char](1) NOT NULL,
	[Numrem] [int] NOT NULL,
	[Opd] [int] NOT NULL,
	[Dmi] [int] NOT NULL,
	[Dmf] [int] NOT NULL,
	[Ampm] [int] NOT NULL,
	[Fecha_ret] [datetime] NOT NULL,
	[Motanul] [char](30) NOT NULL,
	[Pertom] [char](20) NOT NULL,
	[Jdd] [int] NOT NULL,
 CONSTRAINT [PK_RVACACIG] PRIMARY KEY CLUSTERED 
(
	[Codigo] ASC,
	[Numdoc] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RVACACID]    Script Date: 10/19/2015 16:18:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RVACACID](
	[Codigo] [char](12) NOT NULL,
	[Dias] [int] NOT NULL,
	[Fecha_ini] [datetime] NOT NULL,
	[Fecha_fin] [datetime] NOT NULL,
	[Tipo] [char](1) NOT NULL,
	[Descrip] [char](30) NOT NULL,
	[Nro] [int] NOT NULL,
	[Jdd] [int] NOT NULL,
 CONSTRAINT [PK_RVACACID] PRIMARY KEY CLUSTERED 
(
	[Codigo] ASC,
	[Nro] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RVACACI]    Script Date: 10/19/2015 16:18:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RVACACI](
	[Numdoc] [int] NOT NULL,
	[Codigo] [char](12) NOT NULL,
	[Feini] [datetime] NOT NULL,
	[Fefin] [datetime] NOT NULL,
	[Dias] [numeric](6, 2) NOT NULL,
	[Status] [char](1) NOT NULL,
	[Numrem] [int] NOT NULL,
	[Opd] [int] NOT NULL,
	[Dmi] [int] NOT NULL,
	[Dmf] [int] NOT NULL,
	[Ampm] [int] NOT NULL,
	[Jdd] [int] NOT NULL,
	[Motanul] [char](30) NOT NULL,
	[fecha_ret] [datetime] NOT NULL,
	[Pertom] [char](20) NOT NULL,
	[fecha_dat] [datetime] NOT NULL,
	[usuario] [char](12) NOT NULL,
	[Fecha_ult] [datetime] NOT NULL,
 CONSTRAINT [PK_RVACACI] PRIMARY KEY CLUSTERED 
(
	[Numdoc] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RUSUARIOS]    Script Date: 10/19/2015 16:18:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RUSUARIOS](
	[jdd] [int] NOT NULL,
	[Usuario] [char](12) NOT NULL,
	[Estado] [char](1) NOT NULL,
	[Descrip] [char](30) NOT NULL,
	[Dato] [char](250) NOT NULL,
	[Historia] [char](140) NOT NULL,
	[Fecha_exp] [datetime] NOT NULL,
	[perfil] [char](12) NOT NULL,
	[mail] [char](50) NOT NULL,
	[Empresa] [char](3) NOT NULL,
	[Ubica] [int] NOT NULL,
	[Intentos] [int] NOT NULL,
	[Sele] [char](1) NOT NULL,
	[Antig] [char](1) NOT NULL,
 CONSTRAINT [PK_RUSUARIOS] PRIMARY KEY CLUSTERED 
(
	[Usuario] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RUSUARIOI]    Script Date: 10/19/2015 16:18:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RUSUARIOI](
	[jdd] [int] NOT NULL,
	[Usuario] [char](12) NOT NULL,
	[Intentos] [int] NOT NULL,
 CONSTRAINT [PK_RUSUARIOI] PRIMARY KEY CLUSTERED 
(
	[Usuario] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RUSUARIO]    Script Date: 10/19/2015 16:18:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RUSUARIO](
	[Usuario] [char](12) NOT NULL,
	[Descrip] [char](30) NOT NULL,
	[Dato] [char](30) NOT NULL,
	[Condicion] [char](99) NOT NULL,
	[Estado] [char](1) NOT NULL,
	[DescCond] [char](20) NOT NULL,
	[Codigo] [char](12) NOT NULL,
	[Dato2] [char](30) NOT NULL,
	[Histori] [char](30) NOT NULL,
	[Ngrab] [int] NOT NULL,
	[Tie] [char](1) NOT NULL,
	[Jdd] [int] NOT NULL,
 CONSTRAINT [PK_RUSUARIO] PRIMARY KEY CLUSTERED 
(
	[Usuario] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RUNICAR]    Script Date: 10/19/2015 16:18:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RUNICAR](
	[Empresa] [char](3) NOT NULL,
	[Unidad] [int] NOT NULL,
	[Cargo] [int] NOT NULL,
	[vacan] [int] NOT NULL,
	[Dotacion] [int] NOT NULL,
	[Jdd] [int] NOT NULL,
 CONSTRAINT [PK_RUNICAR] PRIMARY KEY CLUSTERED 
(
	[Empresa] ASC,
	[Unidad] ASC,
	[Cargo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RULTSEL]    Script Date: 10/19/2015 16:18:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RULTSEL](
	[Jdd] [int] NOT NULL,
	[jdato] [char](8) NOT NULL,
	[Usuario] [char](12) NOT NULL,
	[Codigo] [char](12) NOT NULL,
	[rut] [char](12) NOT NULL,
 CONSTRAINT [PK_RULTSEL] PRIMARY KEY CLUSTERED 
(
	[Jdd] ASC,
	[jdato] ASC,
	[Usuario] ASC,
	[Codigo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RULTIMOS]    Script Date: 10/19/2015 16:18:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RULTIMOS](
	[Copar] [char](12) NOT NULL,
	[Descrip] [char](30) NOT NULL,
	[Param] [char](254) NOT NULL,
	[Ngrab] [int] NOT NULL,
	[Paradi] [varchar](2000) NOT NULL,
 CONSTRAINT [PK_RULTIMOS] PRIMARY KEY CLUSTERED 
(
	[Copar] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RTRAPRO]    Script Date: 10/19/2015 16:18:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RTRAPRO](
	[Cod_pro] [int] NOT NULL,
	[Descrip] [char](40) NOT NULL,
	[Valor] [money] NOT NULL,
	[Unidad] [char](5) NOT NULL,
	[Cohade] [char](6) NOT NULL,
	[Jdd] [int] NOT NULL,
 CONSTRAINT [PK_RTRAPRO] PRIMARY KEY CLUSTERED 
(
	[Cod_pro] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RTRAMOV]    Script Date: 10/19/2015 16:18:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RTRAMOV](
	[Codigo] [char](12) NOT NULL,
	[Numcom] [int] NOT NULL,
	[Ames] [char](6) NOT NULL,
	[fecha_tra] [datetime] NOT NULL,
	[Cod_pro] [int] NOT NULL,
	[Cantid] [money] NOT NULL,
	[ValUni] [money] NOT NULL,
	[Cohade] [char](6) NOT NULL,
	[Cencos] [int] NOT NULL,
	[Jdd] [int] NOT NULL,
 CONSTRAINT [PK_RTRAMOV] PRIMARY KEY CLUSTERED 
(
	[Codigo] ASC,
	[fecha_tra] ASC,
	[Numcom] ASC,
	[Cod_pro] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RTEMPLATES]    Script Date: 10/19/2015 16:18:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RTEMPLATES](
	[Codigo] [char](20) NOT NULL,
	[Tipo] [int] NOT NULL,
	[Fecha_cre] [datetime] NOT NULL,
	[Fecha_mod] [datetime] NOT NULL,
	[Descrip] [char](30) NOT NULL,
	[Template] [text] NOT NULL,
	[Jdd] [int] NOT NULL,
	[Formato] [char](1) NOT NULL,
 CONSTRAINT [PK_RTEMPLATES] PRIMARY KEY CLUSTERED 
(
	[Jdd] ASC,
	[Codigo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RTABLAS]    Script Date: 10/19/2015 16:18:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RTABLAS](
	[Tipo] [char](1) NOT NULL,
	[Cotab] [int] NOT NULL,
	[Codigo] [int] NOT NULL,
	[Descrip] [char](40) NOT NULL,
	[Valor] [money] NOT NULL,
	[Valor2] [money] NOT NULL,
	[ValorC] [char](200) NOT NULL,
	[Valor4] [char](15) NOT NULL,
	[CodAl] [char](10) NOT NULL,
	[Jdd] [int] NOT NULL,
	[ValorG] [varchar](2000) NOT NULL,
 CONSTRAINT [PK_RTABLAS] PRIMARY KEY CLUSTERED 
(
	[Cotab] ASC,
	[Codigo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RSOLPEN]    Script Date: 10/19/2015 16:18:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RSOLPEN](
	[Codigo] [char](12) NOT NULL,
	[Tipo] [int] NOT NULL,
	[Nusol] [int] NOT NULL,
	[Fecha_sol] [datetime] NOT NULL,
	[Estado] [int] NOT NULL,
	[Fecha_ter] [datetime] NOT NULL,
	[Detalle] [char](250) NOT NULL,
	[Params] [char](200) NOT NULL,
	[Priori] [char](1) NOT NULL,
	[Jefe] [char](12) NOT NULL,
	[Obs] [char](200) NOT NULL,
	[Jdd] [int] NOT NULL,
 CONSTRAINT [PK_RSOLPEN] PRIMARY KEY CLUSTERED 
(
	[Codigo] ASC,
	[Tipo] ASC,
	[Nusol] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE NONCLUSTERED INDEX [Llauno] ON [dbo].[RSOLPEN] 
(
	[Jefe] ASC,
	[Tipo] ASC,
	[Codigo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RSOLICI]    Script Date: 10/19/2015 16:18:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RSOLICI](
	[Codigo] [char](12) NOT NULL,
	[Tipo] [int] NOT NULL,
	[Fecha_ini] [datetime] NOT NULL,
	[Estado] [int] NOT NULL,
	[Fecha_ter] [datetime] NOT NULL,
	[Detalle] [char](250) NOT NULL,
	[Jdd] [int] NOT NULL,
 CONSTRAINT [PK_RSOLICI] PRIMARY KEY CLUSTERED 
(
	[Codigo] ASC,
	[Tipo] ASC,
	[Fecha_ini] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RSEGGRUP]    Script Date: 10/19/2015 16:18:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RSEGGRUP](
	[Grupo] [char](10) NOT NULL,
	[Nombre] [char](30) NOT NULL,
	[Empresas] [char](52) NOT NULL,
	[Ngrab] [int] NOT NULL,
	[Jdd] [int] NOT NULL,
 CONSTRAINT [PK_RSEGGRUP] PRIMARY KEY CLUSTERED 
(
	[Grupo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RSEGDER]    Script Date: 10/19/2015 16:18:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RSEGDER](
	[Codseg] [char](10) NOT NULL,
	[Item] [char](20) NOT NULL,
	[Tipo] [char](1) NOT NULL,
	[Stipo] [char](3) NOT NULL,
	[Permisos] [char](5) NOT NULL,
	[Ngrab] [char](10) NOT NULL,
	[Tie] [char](1) NOT NULL,
	[Jdd] [int] NOT NULL,
 CONSTRAINT [PK_RSEGDER] PRIMARY KEY CLUSTERED 
(
	[Codseg] ASC,
	[Item] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RROTULOS]    Script Date: 10/19/2015 16:18:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RROTULOS](
	[Campo] [char](10) NOT NULL,
	[Alias] [char](1) NOT NULL,
	[Clasif] [char](3) NOT NULL,
	[Rotulo] [char](30) NOT NULL,
	[Descrip] [char](50) NOT NULL,
	[Jdd] [int] NOT NULL,
 CONSTRAINT [PK_RROTULOS] PRIMARY KEY CLUSTERED 
(
	[Jdd] ASC,
	[Clasif] ASC,
	[Campo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE NONCLUSTERED INDEX [Llauno] ON [dbo].[RROTULOS] 
(
	[Jdd] ASC,
	[Alias] ASC,
	[Campo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RRECIBOS]    Script Date: 10/19/2015 16:18:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RRECIBOS](
	[Codigo] [char](12) NOT NULL,
	[Ames] [char](6) NOT NULL,
	[Peri] [char](1) NOT NULL,
	[Recibo] [image] NOT NULL,
	[Usu_cre] [char](12) NOT NULL,
	[Fecha_cre] [datetime] NOT NULL,
	[Firmante] [char](12) NOT NULL,
	[Fecha_fir] [datetime] NOT NULL,
	[Fecha_epr] [datetime] NOT NULL,
	[IP_fir] [char](15) NOT NULL,
	[Obs] [char](30) NOT NULL,
	[Jdd] [int] NOT NULL,
 CONSTRAINT [PK_RRECIBOS] PRIMARY KEY CLUSTERED 
(
	[Codigo] ASC,
	[Ames] ASC,
	[Peri] ASC,
	[Jdd] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE NONCLUSTERED INDEX [Llauno] ON [dbo].[RRECIBOS] 
(
	[Ames] ASC,
	[Peri] ASC,
	[Codigo] ASC,
	[Jdd] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RPUBLICA]    Script Date: 10/19/2015 16:18:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RPUBLICA](
	[RUT] [char](12) NOT NULL,
	[titulo] [char](50) NOT NULL,
	[autores] [varchar](100) NOT NULL,
	[anhio] [int] NOT NULL,
	[fecha] [datetime] NOT NULL,
	[revlibeve] [varchar](100) NOT NULL,
	[capitulo] [varchar](50) NOT NULL,
	[paginas] [varchar](10) NOT NULL,
	[clave] [varchar](100) NOT NULL,
	[isbn] [varchar](20) NOT NULL,
	[editores] [varchar](50) NOT NULL,
	[editorial] [varchar](50) NOT NULL,
	[lugar] [varchar](50) NOT NULL,
	[tipo] [int] NOT NULL,
	[Fecha_mod] [datetime] NOT NULL,
	[observ] [varchar](200) NOT NULL,
	[vobo] [int] NOT NULL,
	[usrvobo] [char](12) NOT NULL,
 CONSTRAINT [PK_RPUBLICA] PRIMARY KEY CLUSTERED 
(
	[RUT] ASC,
	[fecha] ASC,
	[titulo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RPROGRL]    Script Date: 10/19/2015 16:18:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RPROGRL](
	[Codigo] [char](12) NOT NULL,
	[Ames] [char](6) NOT NULL,
	[EMPRESA] [char](3) NOT NULL,
	[CENCOS] [int] NOT NULL,
	[DIAS] [numeric](8, 2) NOT NULL,
	[MONTO] [money] NOT NULL,
	[BASE] [money] NOT NULL,
	[DIASP] [numeric](8, 2) NOT NULL,
	[PORCEN] [int] NOT NULL,
 CONSTRAINT [PK_RPROGRL] PRIMARY KEY CLUSTERED 
(
	[EMPRESA] ASC,
	[Codigo] ASC,
	[Ames] ASC,
	[CENCOS] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RPREUNI]    Script Date: 10/19/2015 16:18:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RPREUNI](
	[Empresa] [char](3) NOT NULL,
	[Unidad] [int] NOT NULL,
	[Depe] [char](10) NOT NULL,
	[Codres] [char](12) NOT NULL,
	[nivel] [char](48) NOT NULL,
	[Jdd] [int] NOT NULL,
 CONSTRAINT [PK_RPREUNI] PRIMARY KEY CLUSTERED 
(
	[Empresa] ASC,
	[Unidad] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RPLANCU]    Script Date: 10/19/2015 16:18:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RPLANCU](
	[Codplan] [int] NOT NULL,
	[Cohade] [char](6) NOT NULL,
	[PerEsqD] [int] NOT NULL,
	[PerEsqC] [int] NOT NULL,
	[PerDato] [char](20) NOT NULL,
	[PerDato2] [char](20) NOT NULL,
	[DiaEsqD] [int] NOT NULL,
	[DiaEsqC] [int] NOT NULL,
	[DiaDato] [char](20) NOT NULL,
	[DiaDato2] [char](20) NOT NULL,
	[Fuera] [char](1) NOT NULL,
	[Jdd] [int] NOT NULL,
	[CUENTAS] [char](50) NOT NULL,
 CONSTRAINT [PK_RPLANCU] PRIMARY KEY CLUSTERED 
(
	[Codplan] ASC,
	[Cohade] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RPLAING]    Script Date: 10/19/2015 16:18:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RPLAING](
	[Usuario] [char](12) NOT NULL,
	[Fecha] [datetime] NOT NULL,
	[Cencos] [int] NOT NULL,
	[Codigo] [char](12) NOT NULL,
	[Cohade] [char](6) NOT NULL,
	[Monto] [money] NOT NULL,
	[Jdd] [int] NOT NULL,
 CONSTRAINT [PK_RPLAING] PRIMARY KEY CLUSTERED 
(
	[Usuario] ASC,
	[Fecha] ASC,
	[Codigo] ASC,
	[Cohade] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RPERFILES]    Script Date: 10/19/2015 16:18:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RPERFILES](
	[Jdd] [int] NOT NULL,
	[Perfil] [char](12) NOT NULL,
	[Descrip] [char](30) NOT NULL,
	[Dato] [char](40) NOT NULL,
 CONSTRAINT [PK_RPERFILES] PRIMARY KEY CLUSTERED 
(
	[Perfil] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RPAUSER]    Script Date: 10/19/2015 16:18:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RPAUSER](
	[Usuario] [char](12) NOT NULL,
	[Copar] [char](12) NOT NULL,
	[Descrip] [char](30) NOT NULL,
	[Param] [char](254) NOT NULL,
	[Jdd] [int] NOT NULL,
 CONSTRAINT [PK_RPAUSER] PRIMARY KEY CLUSTERED 
(
	[Usuario] ASC,
	[Copar] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RPASREL]    Script Date: 10/19/2015 16:18:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RPASREL](
	[Codigo] [char](12) NOT NULL,
	[Ames] [char](6) NOT NULL,
	[Empresa] [char](3) NOT NULL,
	[Peri] [char](1) NOT NULL,
	[Afecto] [money] NOT NULL,
	[Impuesto] [money] NOT NULL,
	[Afp] [money] NOT NULL,
	[Isapre] [money] NOT NULL,
	[Ktim] [money] NOT NULL,
	[Factor] [numeric](9, 6) NOT NULL,
	[ScTafe] [money] NOT NULL,
	[ScTmon] [money] NOT NULL,
	[ScEafe] [money] NOT NULL,
	[ScEmon] [money] NOT NULL,
	[ScIafe] [money] NOT NULL,
	[ScImon] [money] NOT NULL,
	[Jdd] [int] NOT NULL,
	[Traper] [money] NOT NULL,
	[Ktimafp] [money] NOT NULL,
	[sisafp] [money] NOT NULL,
 CONSTRAINT [PK_RPASREL] PRIMARY KEY CLUSTERED 
(
	[Jdd] ASC,
	[Ames] ASC,
	[Codigo] ASC,
	[Peri] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RPASIGA]    Script Date: 10/19/2015 16:18:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RPASIGA](
	[Codigo] [char](12) NOT NULL,
	[Peri] [char](1) NOT NULL,
	[Concepto] [char](4) NOT NULL,
	[MontoM] [money] NOT NULL,
	[MontoP] [money] NOT NULL,
	[MontoG] [money] NOT NULL,
	[Fecha_pag] [datetime] NOT NULL,
 CONSTRAINT [PK_RPASIGA] PRIMARY KEY CLUSTERED 
(
	[Codigo] ASC,
	[Peri] ASC,
	[Concepto] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RPARAMS]    Script Date: 10/19/2015 16:18:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RPARAMS](
	[Copar] [char](12) NOT NULL,
	[Descrip] [char](30) NOT NULL,
	[Param] [char](254) NOT NULL,
	[Ngrab] [int] NOT NULL,
	[Paradi] [varchar](2048) NULL,
	[Jdd] [int] NOT NULL,
 CONSTRAINT [PK_RPARAMS] PRIMARY KEY CLUSTERED 
(
	[Copar] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RNUMCHE]    Script Date: 10/19/2015 16:18:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RNUMCHE](
	[Empresa] [char](3) NOT NULL,
	[Banco] [int] NOT NULL,
	[Numche] [int] NOT NULL,
	[Codigo] [char](12) NOT NULL,
	[Monto] [money] NOT NULL,
	[fecha] [datetime] NOT NULL,
	[Jdd] [int] NOT NULL,
 CONSTRAINT [PK_RNUMCHE] PRIMARY KEY CLUSTERED 
(
	[Empresa] ASC,
	[Banco] ASC,
	[Numche] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RNOTICI]    Script Date: 10/19/2015 16:18:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RNOTICI](
	[Tipo] [int] NOT NULL,
	[Codigo] [char](12) NOT NULL,
	[Fecha_not] [datetime] NOT NULL,
	[Detalle] [char](250) NOT NULL,
	[Nro] [int] NOT NULL,
	[Jdd] [int] NOT NULL,
 CONSTRAINT [PK_RNOTICI] PRIMARY KEY CLUSTERED 
(
	[Tipo] ASC,
	[Fecha_not] ASC,
	[Codigo] ASC,
	[Nro] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RMODULOS]    Script Date: 10/19/2015 16:18:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RMODULOS](
	[Modulo] [char](8) NOT NULL,
	[Descrip] [char](40) NOT NULL,
	[Clasif] [int] NOT NULL,
	[Campos] [varchar](2000) NOT NULL,
	[Desde] [varchar](512) NOT NULL,
	[Filtro] [varchar](2000) NOT NULL,
	[Agrupa] [char](150) NOT NULL,
	[Orden] [char](150) NOT NULL,
	[Tipper] [int] NOT NULL,
	[Cohades] [varchar](2000) NOT NULL,
	[Indir] [int] NOT NULL,
	[Grupos] [char](160) NOT NULL,
	[Directa] [varchar](2000) NOT NULL,
	[Swhere] [char](150) NOT NULL,
	[Nperiodo] [int] NOT NULL,
	[varis] [varchar](2000) NOT NULL,
	[Jdd] [int] NOT NULL,
	[dueno] [char](12) NOT NULL,
 CONSTRAINT [PK_RMODULOS] PRIMARY KEY CLUSTERED 
(
	[Modulo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RMODIFICAS]    Script Date: 10/19/2015 16:18:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RMODIFICAS](
	[Id] [int] NOT NULL,
	[Fecha] [datetime] NOT NULL,
	[Concepto] [char](20) NOT NULL,
	[CodigoC] [char](30) NOT NULL,
	[Acc] [char](1) NOT NULL,
	[Codigo] [char](12) NOT NULL,
	[Deta] [char](150) NOT NULL,
	[Usuario] [char](12) NOT NULL,
	[Wcompu] [char](25) NOT NULL,
	[Jdd] [int] NOT NULL,
 CONSTRAINT [PK_RMODIFICAS] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RMAPITMH]    Script Date: 10/19/2015 16:18:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RMAPITMH](
	[Codigo] [char](12) NOT NULL,
	[Cohade] [char](6) NOT NULL,
	[Nro] [int] NOT NULL,
	[Tipo] [int] NOT NULL,
	[Orden] [int] NOT NULL,
	[Periodo] [char](1) NOT NULL,
	[COFORM] [char](4) NOT NULL,
	[CUOTOT] [int] NOT NULL,
	[CUOPAR] [int] NOT NULL,
	[Monto] [money] NOT NULL,
	[Fecha_cre] [datetime] NOT NULL,
	[Fecha_ini] [datetime] NOT NULL,
	[Fecha_fin] [datetime] NOT NULL,
	[Cencos] [int] NOT NULL,
	[Cuenta] [char](14) NOT NULL,
	[Ticen] [char](1) NOT NULL,
	[Fepro] [datetime] NOT NULL,
	[Codpres] [int] NOT NULL,
	[Obs] [varchar](40) NOT NULL,
	[Formula] [varchar](80) NOT NULL,
	[Procede] [char](1) NOT NULL,
	[Estado] [char](1) NOT NULL,
	[Coinst] [int] NOT NULL,
	[PerImp] [int] NOT NULL,
	[Pone] [char](1) NOT NULL,
	[Acumu] [money] NOT NULL,
	[Tiacu] [char](1) NOT NULL,
	[MontoC] [money] NOT NULL,
	[MontoP] [money] NOT NULL,
	[Propor] [char](1) NOT NULL,
	[Grupo] [int] NOT NULL,
	[Simes] [char](1) NOT NULL,
	[Queperi] [char](7) NOT NULL,
	[Fecha_ing] [datetime] NOT NULL,
	[Fecha_apr] [datetime] NOT NULL,
	[Codigo_in] [char](12) NOT NULL,
	[Codigo_ap] [char](12) NOT NULL,
	[Plantilla] [char](10) NOT NULL,
	[Ames] [char](6) NOT NULL,
	[Jdd] [int] NOT NULL,
	[Fecha_ult] [datetime] NOT NULL,
	[Moti_mod] [int] NOT NULL,
	[Condi] [varchar](120) NOT NULL,
 CONSTRAINT [PK_RMAPITMH] PRIMARY KEY CLUSTERED 
(
	[Codigo] ASC,
	[Ames] ASC,
	[Periodo] ASC,
	[Cohade] ASC,
	[Nro] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RMAPITM]    Script Date: 10/19/2015 16:18:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RMAPITM](
	[Codigo] [char](12) NOT NULL,
	[Cohade] [char](6) NOT NULL,
	[Nro] [int] NOT NULL,
	[Tipo] [int] NOT NULL,
	[Orden] [int] NOT NULL,
	[Periodo] [char](1) NOT NULL,
	[COFORM] [char](4) NOT NULL,
	[CUOTOT] [int] NOT NULL,
	[CUOPAR] [int] NOT NULL,
	[Monto] [money] NOT NULL,
	[Fecha_cre] [datetime] NOT NULL,
	[Fecha_ini] [datetime] NOT NULL,
	[Fecha_fin] [datetime] NOT NULL,
	[Cencos] [int] NOT NULL,
	[Cuenta] [char](14) NOT NULL,
	[Ticen] [char](1) NOT NULL,
	[Fepro] [datetime] NOT NULL,
	[Codpres] [int] NOT NULL,
	[Obs] [varchar](40) NOT NULL,
	[Formula] [varchar](80) NOT NULL,
	[Procede] [char](1) NOT NULL,
	[Estado] [char](1) NOT NULL,
	[Coinst] [int] NOT NULL,
	[PerImp] [int] NOT NULL,
	[Pone] [char](1) NOT NULL,
	[Acumu] [money] NOT NULL,
	[Tiacu] [char](1) NOT NULL,
	[MontoC] [money] NOT NULL,
	[MontoP] [money] NOT NULL,
	[Propor] [char](1) NOT NULL,
	[Grupo] [int] NOT NULL,
	[Condi] [char](120) NOT NULL,
	[Simes] [char](1) NOT NULL,
	[Queperi] [char](7) NOT NULL,
	[Jdd] [int] NOT NULL,
	[Fecha_ing] [datetime] NOT NULL,
	[Fecha_apr] [datetime] NOT NULL,
	[Codigo_in] [char](12) NOT NULL,
	[Codigo_ap] [char](12) NOT NULL,
	[Plantilla] [char](10) NOT NULL,
	[Ames] [char](6) NOT NULL,
	[Fecha_ult] [datetime] NOT NULL,
	[Moti_mod] [int] NOT NULL,
 CONSTRAINT [PK_RMAPITM] PRIMARY KEY CLUSTERED 
(
	[Codigo] ASC,
	[Cohade] ASC,
	[Periodo] ASC,
	[Nro] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Rliquid]    Script Date: 10/19/2015 16:18:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Rliquid](
	[Codigo] [char](12) NOT NULL,
	[Ames] [char](6) NOT NULL,
	[Peri] [char](1) NOT NULL,
	[Cohade] [char](6) NOT NULL,
	[Tipo] [int] NOT NULL,
	[Descitm] [varchar](72) NOT NULL,
	[Orden] [int] NOT NULL,
	[Monto] [money] NOT NULL,
	[MontoO] [money] NOT NULL,
	[MontoA] [money] NOT NULL,
	[Vo] [money] NOT NULL,
	[PerImp] [int] NOT NULL,
	[Empresa] [char](3) NOT NULL,
	[Inform] [char](1) NOT NULL,
	[Cencos] [int] NOT NULL,
	[Coprev] [int] NOT NULL,
	[Origen] [char](1) NOT NULL,
	[Cod_reg] [int] NOT NULL,
	[Codpres] [int] NOT NULL,
	[Cmapa] [char](14) NOT NULL,
	[Dato] [char](10) NOT NULL,
	[Nro] [int] NOT NULL,
	[Jdd] [int] NOT NULL,
 CONSTRAINT [PK_Rliquid] PRIMARY KEY CLUSTERED 
(
	[Codigo] ASC,
	[Ames] ASC,
	[Peri] ASC,
	[Cohade] ASC,
	[Nro] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE NONCLUSTERED INDEX [Llauno] ON [dbo].[Rliquid] 
(
	[Ames] ASC,
	[Peri] ASC,
	[Cohade] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RJERARQ]    Script Date: 10/19/2015 16:18:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RJERARQ](
	[Segmento] [char](15) NOT NULL,
	[GranZona] [char](15) NOT NULL,
	[Zona] [char](15) NOT NULL,
	[Jop] [char](35) NOT NULL,
	[Supervis] [char](35) NOT NULL,
	[TipoCC] [char](5) NOT NULL,
	[Cencos] [int] NOT NULL,
	[Agrupador] [char](5) NOT NULL,
	[Venta] [money] NOT NULL,
	[Dotacion] [money] NOT NULL,
	[Ingresos] [int] NOT NULL,
	[IngxTras] [int] NOT NULL,
	[Licencias] [int] NOT NULL,
	[Finiquito] [int] NOT NULL,
	[SalxTras] [int] NOT NULL,
	[HrsExtra] [money] NOT NULL,
	[Ames] [char](6) NOT NULL,
	[Peri] [char](1) NOT NULL,
	[Permisos] [int] NOT NULL,
	[Accidente] [int] NOT NULL,
	[Empresa] [char](3) NOT NULL,
	[Descripcc] [char](40) NOT NULL,
	[Diaspag] [int] NOT NULL,
	[Diasvac] [int] NOT NULL,
	[Jdd] [int] NOT NULL,
 CONSTRAINT [PK_RJERARQ] PRIMARY KEY CLUSTERED 
(
	[Empresa] ASC,
	[Ames] ASC,
	[Peri] ASC,
	[Cencos] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RJDATOS]    Script Date: 10/19/2015 16:18:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RJDATOS](
	[Jdd] [int] NOT NULL,
	[Nombre] [char](35) NOT NULL,
	[Encargado] [char](35) NOT NULL,
	[Fono] [char](15) NOT NULL,
	[email] [char](35) NOT NULL,
	[numtra] [int] NOT NULL,
 CONSTRAINT [PK_RJDATOS] PRIMARY KEY CLUSTERED 
(
	[Jdd] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE NONCLUSTERED INDEX [Llauno] ON [dbo].[RJDATOS] 
(
	[Nombre] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RINDICES]    Script Date: 10/19/2015 16:18:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RINDICES](
	[Aa] [int] NOT NULL,
	[Mm] [int] NOT NULL,
	[Utm] [int] NOT NULL,
	[Uf] [money] NOT NULL,
	[Ipc] [money] NOT NULL,
	[Fipc] [money] NOT NULL,
	[Jdd] [int] NOT NULL,
	[TopeAFP] [money] NOT NULL,
	[TopeSEC] [money] NOT NULL,
	[SueldoMin] [money] NOT NULL,
 CONSTRAINT [PK_RINDICES] PRIMARY KEY CLUSTERED 
(
	[Aa] ASC,
	[Mm] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RIGDET]    Script Date: 10/19/2015 16:18:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RIGDET](
	[Codigo] [char](12) NOT NULL,
	[Ames] [char](6) NOT NULL,
	[Concepto] [char](4) NOT NULL,
	[MontoA] [money] NOT NULL,
	[MontoP] [money] NOT NULL,
	[Jdd] [int] NOT NULL,
 CONSTRAINT [PK_RIGDET] PRIMARY KEY CLUSTERED 
(
	[Codigo] ASC,
	[Ames] ASC,
	[Concepto] ASC,
	[Jdd] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RIGAESQ]    Script Date: 10/19/2015 16:18:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RIGAESQ](
	[Jdd] [int] NOT NULL,
	[Concepto] [char](4) NOT NULL,
	[Descrip] [char](30) NOT NULL,
	[Orden] [int] NOT NULL,
	[Signo] [char](1) NOT NULL,
	[Formula] [char](4) NOT NULL,
	[Tipo] [char](1) NOT NULL,
 CONSTRAINT [PK_RIGAESQ] PRIMARY KEY CLUSTERED 
(
	[Orden] ASC,
	[Concepto] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RIDIOMAS]    Script Date: 10/19/2015 16:18:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RIDIOMAS](
	[rut] [char](12) NOT NULL,
	[idioma] [int] NOT NULL,
	[habla] [int] NOT NULL,
	[lee] [int] NOT NULL,
	[escribe] [int] NOT NULL,
	[observ] [varchar](254) NOT NULL,
	[Fecha_mod] [datetime] NOT NULL,
	[vobo] [int] NOT NULL,
	[usrvobo] [char](12) NOT NULL,
 CONSTRAINT [PK_RIDIOMAS] PRIMARY KEY CLUSTERED 
(
	[rut] ASC,
	[idioma] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RHONORA]    Script Date: 10/19/2015 16:18:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RHONORA](
	[Jdd] [int] NOT NULL,
	[Rut] [char](12) NOT NULL,
	[Tiser] [char](1) NOT NULL,
	[Fecha_con] [datetime] NOT NULL,
	[Fecha_hon] [datetime] NOT NULL,
	[Tipo] [char](1) NOT NULL,
	[Numbol] [int] NOT NULL,
	[Monto] [money] NOT NULL,
	[Tasa] [money] NOT NULL,
	[Impues] [money] NOT NULL,
	[Empresa] [char](3) NOT NULL,
	[Codigo] [char](12) NOT NULL,
	[Nombre] [char](40) NOT NULL,
	[Direccion] [char](40) NOT NULL,
	[Motivo] [int] NOT NULL,
	[Tibol] [char](1) NOT NULL,
	[Cencos] [int] NOT NULL,
	[Fecha_ser] [datetime] NOT NULL,
 CONSTRAINT [PK_RHONORA] PRIMARY KEY CLUSTERED 
(
	[Empresa] ASC,
	[Rut] ASC,
	[Numbol] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RHOJAVI]    Script Date: 10/19/2015 16:18:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RHOJAVI](
	[Codigo] [char](12) NOT NULL,
	[Fecha] [datetime] NOT NULL,
	[Hora] [char](8) NOT NULL,
	[DesTipo] [char](20) NOT NULL,
	[Detalle] [char](230) NOT NULL,
	[Estado] [char](1) NOT NULL,
	[Tipo] [int] NOT NULL,
	[Respon] [char](12) NOT NULL,
	[Nhoras] [numeric](6, 2) NOT NULL,
	[Ivt] [int] NOT NULL,
	[Jdd] [int] NOT NULL,
 CONSTRAINT [PK_RHOJAVI] PRIMARY KEY CLUSTERED 
(
	[Codigo] ASC,
	[Fecha] ASC,
	[Hora] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RHISLAB]    Script Date: 10/19/2015 16:18:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RHISLAB](
	[rut] [char](12) NOT NULL,
	[cargo] [varchar](50) NOT NULL,
	[empresa] [varchar](60) NOT NULL,
	[fechingr] [datetime] NOT NULL,
	[fechegr] [datetime] NOT NULL,
	[estado] [int] NOT NULL,
	[observ] [varchar](254) NOT NULL,
	[remunerac] [money] NOT NULL,
	[func1] [int] NOT NULL,
	[func2] [int] NOT NULL,
	[func3] [int] NOT NULL,
	[area] [int] NOT NULL,
	[Fecha_mod] [datetime] NOT NULL,
	[vobo] [int] NOT NULL,
	[usrvobo] [char](12) NOT NULL,
 CONSTRAINT [PK_RHISLAB] PRIMARY KEY CLUSTERED 
(
	[rut] ASC,
	[fechingr] ASC,
	[cargo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RHABDES]    Script Date: 10/19/2015 16:18:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RHABDES](
	[Cohade] [char](6) NOT NULL,
	[Descrip] [char](30) NOT NULL,
	[Tipo] [int] NOT NULL,
	[Orden] [int] NOT NULL,
	[Vo] [char](1) NOT NULL,
	[Propor] [char](1) NOT NULL,
	[Coine] [int] NOT NULL,
	[Coform] [char](4) NOT NULL,
	[Pone] [char](1) NOT NULL,
	[Pror] [char](1) NOT NULL,
	[Acumus] [char](30) NOT NULL,
	[Refer] [char](20) NOT NULL,
	[Indice] [int] NOT NULL,
	[Simes] [char](1) NOT NULL,
	[Afe1] [char](1) NOT NULL,
	[Afe2] [char](1) NOT NULL,
	[Afe3] [char](1) NOT NULL,
	[Afe4] [char](1) NOT NULL,
	[Inform] [char](1) NOT NULL,
	[Aobs] [char](1) NOT NULL,
	[Tiphab] [char](1) NOT NULL,
	[Coinst] [int] NOT NULL,
	[RetDonde] [int] NOT NULL,
	[Funda] [varchar](2000) NOT NULL,
	[VoCoform] [char](4) NOT NULL,
	[Proiga] [char](1) NOT NULL,
	[Infcon] [char](1) NOT NULL,
	[RetTipo] [char](1) NOT NULL,
	[Ctacor] [char](1) NOT NULL,
	[Grupo] [int] NOT NULL,
	[Af] [char](1) NOT NULL,
	[AfCoform] [char](4) NOT NULL,
	[Dato] [char](20) NOT NULL,
	[Retencion] [char](1) NOT NULL,
	[Exliq] [char](1) NOT NULL,
	[accres] [char](1) NOT NULL,
	[Jdd] [int] NOT NULL,
	[Refiva] [char](1) NOT NULL,
	[Afev] [char](1) NOT NULL,
	[dAF01] [char](1) NOT NULL,
	[dAF02] [char](1) NOT NULL,
	[dAF03] [char](1) NOT NULL,
	[dAF04] [char](1) NOT NULL,
	[dAF05] [char](1) NOT NULL,
	[dAF06] [char](1) NOT NULL,
	[dAF07] [char](1) NOT NULL,
	[dAF08] [char](1) NOT NULL,
	[dAF09] [char](1) NOT NULL,
	[dAF10] [char](1) NOT NULL,
	[dAF11] [char](1) NOT NULL,
	[dAF12] [char](1) NOT NULL,
	[dAF13] [char](1) NOT NULL,
	[dAF14] [char](1) NOT NULL,
	[dAF15] [char](1) NOT NULL,
	[dAF16] [char](1) NOT NULL,
	[dAF17] [char](1) NOT NULL,
	[dAF18] [char](1) NOT NULL,
	[dAF19] [char](1) NOT NULL,
	[dAF20] [char](1) NOT NULL,
	[Afev2] [char](1) NOT NULL,
	[Pone0] [char](1) NOT NULL,
	[Unico] [char](1) NOT NULL,
	[dAF21] [char](1) NOT NULL,
	[dAF22] [char](1) NOT NULL,
	[dAF23] [char](1) NOT NULL,
	[dAF24] [char](1) NOT NULL,
	[dAF25] [char](1) NOT NULL,
 CONSTRAINT [PK_RHABDES] PRIMARY KEY CLUSTERED 
(
	[Cohade] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE NONCLUSTERED INDEX [Llauno] ON [dbo].[RHABDES] 
(
	[Descrip] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RGRUPFA]    Script Date: 10/19/2015 16:18:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RGRUPFA](
	[Codigo] [char](12) NOT NULL,
	[Nombre] [char](60) NOT NULL,
	[Apc] [char](15) NOT NULL,
	[Rut] [char](12) NOT NULL,
	[PARIENTE] [int] NOT NULL,
	[Fecha_nac] [datetime] NOT NULL,
	[Sexo] [char](1) NOT NULL,
	[Estudios] [int] NOT NULL,
	[Gensal] [char](1) NOT NULL,
	[Preexis] [char](60) NOT NULL,
	[Tipo_doc] [int] NOT NULL,
	[Desc_par] [char](10) NOT NULL,
	[Desc_est] [char](10) NOT NULL,
	[Fecha_alt] [datetime] NOT NULL,
	[Fecha_baj] [datetime] NOT NULL,
	[Invalid] [int] NOT NULL,
	[Relacion] [int] NOT NULL,
	[Curso] [int] NOT NULL,
	[Numdoc] [char](11) NOT NULL,
	[Rebimp] [int] NOT NULL,
	[Identidad] [int] NOT NULL,
	[Matri_cer] [int] NOT NULL,
	[Matri_fec] [datetime] NOT NULL,
	[Naci_cer] [int] NOT NULL,
	[Naci_fec] [datetime] NOT NULL,
	[Prena_cer] [int] NOT NULL,
	[Prena_fec] [datetime] NOT NULL,
	[Estu_cer] [int] NOT NULL,
	[Estu_fec] [datetime] NOT NULL,
	[Fecha_aig] [datetime] NOT NULL,
	[Fecha_big] [datetime] NOT NULL,
	[RetJud] [char](1) NOT NULL,
	[Carsal] [char](1) NOT NULL,
	[Jdd] [int] NOT NULL,
	[AfpVol] [char](1) NOT NULL,
	[AfpCod] [int] NOT NULL,
	[AfpMonto] [money] NOT NULL,
	[AfpCoform] [char](4) NOT NULL,
	[AfpDesde] [datetime] NOT NULL,
	[AfpHasta] [datetime] NOT NULL,
	[AhoVol] [char](1) NOT NULL,
	[AhoMonto] [money] NOT NULL,
	[AhoCoform] [char](4) NOT NULL,
	[Direccion] [varchar](128) NOT NULL,
	[Fono] [char](18) NOT NULL,
	[Pmail] [varchar](50) NOT NULL,
 CONSTRAINT [PK_RGRUPFA] PRIMARY KEY CLUSTERED 
(
	[Jdd] ASC,
	[Codigo] ASC,
	[Rut] ASC,
	[Nombre] ASC,
	[Relacion] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RFORMLA]    Script Date: 10/19/2015 16:18:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RFORMLA](
	[Coform] [char](4) NOT NULL,
	[Descrip] [char](40) NOT NULL,
	[Tipo] [char](1) NOT NULL,
	[Trazo] [char](1) NOT NULL,
	[Formula] [varchar](2000) NOT NULL,
	[Jdd] [int] NOT NULL,
	[Obs] [varchar](2000) NOT NULL,
 CONSTRAINT [PK_RFORMLA] PRIMARY KEY CLUSTERED 
(
	[Coform] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RFERIAD]    Script Date: 10/19/2015 16:18:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RFERIAD](
	[Jdd] [int] NOT NULL,
	[Fecha] [datetime] NOT NULL,
	[Tipo] [char](1) NOT NULL,
	[Motivo] [char](30) NOT NULL,
	[Condicion] [varchar](2000) NOT NULL,
 CONSTRAINT [PK_RFERIAD] PRIMARY KEY CLUSTERED 
(
	[Fecha] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[REVENTOS]    Script Date: 10/19/2015 16:18:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[REVENTOS](
	[Fecha] [datetime] NOT NULL,
	[Usuario] [char](12) NOT NULL,
	[Prog] [char](8) NOT NULL,
	[Accion] [char](1) NOT NULL,
	[Conti] [char](1) NOT NULL,
	[Evento] [varchar](150) NOT NULL,
	[Wcompu] [char](12) NOT NULL,
	[Ngrab] [int] NOT NULL,
	[Jdd] [int] NOT NULL,
	[MARCA] [timestamp] NOT NULL,
 CONSTRAINT [PK_REVENTOS] PRIMARY KEY CLUSTERED 
(
	[Fecha] ASC,
	[Usuario] ASC,
	[Prog] ASC,
	[MARCA] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE NONCLUSTERED INDEX [Llauno] ON [dbo].[REVENTOS] 
(
	[Usuario] ASC,
	[Prog] ASC,
	[Fecha] ASC,
	[Accion] ASC,
	[Conti] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RESUMEN]    Script Date: 10/19/2015 16:18:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RESUMEN](
	[Codigo] [char](12) NOT NULL,
	[Ames] [char](6) NOT NULL,
	[Peri] [char](1) NOT NULL,
	[Periodo] [char](7) NOT NULL,
	[Origen] [char](1) NOT NULL,
	[Neto] [money] NOT NULL,
	[Ktha] [money] NOT NULL,
	[Kthn] [money] NOT NULL,
	[KthI] [money] NOT NULL,
	[Ktim] [money] NOT NULL,
	[Ktdl] [money] NOT NULL,
	[Ktde] [money] NOT NULL,
	[Ktfm] [money] NOT NULL,
	[Ktex] [money] NOT NULL,
	[DiasTr] [numeric](4, 1) NOT NULL,
	[DiasLi] [numeric](4, 1) NOT NULL,
	[TramoCar] [int] NOT NULL,
	[Coprev] [int] NOT NULL,
	[Cod_Reg] [int] NOT NULL,
	[Kcay] [int] NOT NULL,
	[Khij] [int] NOT NULL,
	[Kotc] [int] NOT NULL,
	[Afecto1] [money] NOT NULL,
	[Afecto2] [money] NOT NULL,
	[Afecto3] [money] NOT NULL,
	[Afecto4] [money] NOT NULL,
	[Empresa] [char](3) NOT NULL,
	[Ktds] [money] NOT NULL,
	[Diaslim] [numeric](4, 1) NOT NULL,
	[Subsil] [money] NOT NULL,
	[Fafp] [numeric](5, 2) NOT NULL,
	[Fecha_dep] [datetime] NOT NULL,
	[BancoDep] [int] NOT NULL,
	[NroRec] [int] NOT NULL,
	[Fecha_pag] [datetime] NOT NULL,
	[Jdd] [int] NOT NULL,
	[KtdlO] [money] NOT NULL,
	[Afevari] [money] NOT NULL,
	[Dias3pd] [numeric](4, 1) NOT NULL,
	[Fecha_ult] [datetime] NOT NULL,
	[SubsilN] [money] NOT NULL,
	[Afevar2] [money] NOT NULL,
	[Licmd] [char](12) NOT NULL,
 CONSTRAINT [PK_RESUMEN] PRIMARY KEY CLUSTERED 
(
	[Codigo] ASC,
	[Ames] ASC,
	[Peri] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE NONCLUSTERED INDEX [Llauno] ON [dbo].[RESUMEN] 
(
	[Ames] ASC,
	[Peri] ASC,
	[Codigo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RESTANQ]    Script Date: 10/19/2015 16:18:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RESTANQ](
	[Jdd] [int] NOT NULL,
	[Cohade] [char](6) NOT NULL,
	[Codigo] [char](12) NOT NULL,
	[Nro] [int] NOT NULL,
	[Codpres] [int] NOT NULL,
	[Monto] [money] NOT NULL,
	[Empresa] [char](3) NOT NULL,
	[Cencos] [int] NOT NULL,
	[Tipo] [int] NOT NULL,
	[MontoO] [money] NOT NULL,
	[Cmapa] [char](14) NOT NULL,
 CONSTRAINT [PK_RESTANQ] PRIMARY KEY CLUSTERED 
(
	[Cohade] ASC,
	[Codigo] ASC,
	[Nro] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RESQUEMA]    Script Date: 10/19/2015 16:18:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RESQUEMA](
	[Jdd] [int] NOT NULL,
	[Esquema] [int] NOT NULL,
	[Descrip] [char](30) NOT NULL,
	[Parte] [int] NOT NULL,
	[Largo] [int] NOT NULL,
	[Conc] [int] NOT NULL,
	[Tx] [int] NOT NULL,
	[DatoX] [char](10) NOT NULL,
	[Ty] [int] NOT NULL,
	[DatoY] [char](10) NOT NULL,
	[Resul] [int] NOT NULL,
	[DatoP] [char](50) NOT NULL,
	[Deci] [int] NOT NULL,
	[Alinea] [int] NOT NULL,
	[Relleno] [int] NOT NULL,
	[Destino] [int] NOT NULL,
 CONSTRAINT [PK_RESQUEMA] PRIMARY KEY CLUSTERED 
(
	[Esquema] ASC,
	[Parte] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RENCAPA]    Script Date: 10/19/2015 16:18:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RENCAPA](
	[Curso] [char](15) NOT NULL,
	[Codigo] [char](12) NOT NULL,
	[Situ] [char](10) NOT NULL,
	[Fecha_ini] [datetime] NOT NULL,
	[Fecha_ter] [datetime] NOT NULL,
	[Tipo] [char](1) NOT NULL,
	[Jdd] [int] NOT NULL,
	[Asisten] [int] NOT NULL,
	[Obs] [char](128) NOT NULL,
	[Rut] [char](12) NOT NULL,
	[Puntaje] [numeric](5, 2) NOT NULL,
	[Direccion] [varchar](2000) NOT NULL,
	[causen] [int] NOT NULL,
	[lugar] [varchar](2000) NOT NULL,
	[horas] [money] NOT NULL,
	[ubicas] [varchar](2000) NOT NULL,
 CONSTRAINT [PK_RENCAPA] PRIMARY KEY CLUSTERED 
(
	[Curso] ASC,
	[Fecha_ini] ASC,
	[Codigo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[REMPRESA]    Script Date: 10/19/2015 16:18:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[REMPRESA](
	[Empresa] [char](3) NOT NULL,
	[Nombre] [char](50) NOT NULL,
	[Rut] [char](12) NOT NULL,
	[Direccion] [char](128) NOT NULL,
	[Fono] [char](15) NOT NULL,
	[Activi] [char](6) NOT NULL,
	[Repleg] [char](12) NOT NULL,
	[Coafil] [int] NOT NULL,
	[Mutual] [char](25) NOT NULL,
	[Cacomp] [char](25) NOT NULL,
	[Fecha_ini] [datetime] NOT NULL,
	[Ingbru] [char](12) NOT NULL,
	[Diradm] [varchar](128) NOT NULL,
	[Fax] [char](15) NOT NULL,
	[Email] [char](30) NOT NULL,
	[RutRep] [char](12) NOT NULL,
	[Comut] [numeric](5, 2) NOT NULL,
	[Jdd] [int] NOT NULL,
	[Giro] [char](80) NOT NULL,
	[Junaeb] [char](10) NOT NULL,
	[mailRegi] [char](40) NOT NULL,
	[mailrrhh] [char](40) NOT NULL,
	[Firmante] [char](12) NOT NULL,
	[AutRRHH] [char](12) NOT NULL,
	[Tipoemp] [char](1) NOT NULL,
	[estatuto] [char](1) NOT NULL,
	[CodAct] [char](1) NOT NULL,
	[CalTrab] [char](1) NOT NULL,
	[lusuario] [char](12) NOT NULL,
	[lclave] [char](12) NOT NULL,
	[sisafp] [char](1) NOT NULL,
	[PassWSCon] [char](60) NOT NULL,
	[UserWSCon] [char](15) NOT NULL,
	[Nit] [char](15) NOT NULL,
	[Desc_act] [varchar](100) NOT NULL,
	[IdAdp] [char](12) NOT NULL,
 CONSTRAINT [PK_REMPRESA] PRIMARY KEY CLUSTERED 
(
	[Empresa] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[REMPLESH]    Script Date: 10/19/2015 16:18:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[REMPLESH](
	[Codigo] [char](12) NOT NULL,
	[Estado] [char](1) NOT NULL,
	[Tiprem] [char](1) NOT NULL,
	[Empresa] [char](3) NOT NULL,
	[Nombre] [varchar](60) NOT NULL,
	[Rut] [char](12) NOT NULL,
	[Sexo] [char](1) NOT NULL,
	[Fecha_nac] [datetime] NOT NULL,
	[Nacion] [int] NOT NULL,
	[Est_civil] [char](15) NOT NULL,
	[Estudios] [int] NOT NULL,
	[Titulo] [int] NOT NULL,
	[Clase] [int] NOT NULL,
	[Idiomas] [int] NOT NULL,
	[Autopas] [char](1) NOT NULL,
	[Fecha_ing] [datetime] NOT NULL,
	[Tipo_doc] [int] NOT NULL,
	[Numdoc] [char](11) NOT NULL,
	[Jefe] [char](12) NOT NULL,
	[Fecha_ret] [datetime] NOT NULL,
	[Moti_ret] [int] NOT NULL,
	[Fecha_xtr] [datetime] NOT NULL,
	[Cencos] [int] NOT NULL,
	[Ticen] [char](1) NOT NULL,
	[Catego] [int] NOT NULL,
	[Clasif] [int] NOT NULL,
	[Ubica] [int] NOT NULL,
	[Lpago] [int] NOT NULL,
	[Cargo] [int] NOT NULL,
	[Grado] [int] NOT NULL,
	[Division] [int] NOT NULL,
	[Unidad] [int] NOT NULL,
	[Horario] [int] NOT NULL,
	[Sit_lab] [int] NOT NULL,
	[Fpago] [int] NOT NULL,
	[Banco] [int] NOT NULL,
	[Ofiban] [int] NOT NULL,
	[Cta_corr] [char](26) NOT NULL,
	[Talla_r] [char](4) NOT NULL,
	[Talla_z] [char](5) NOT NULL,
	[CARNET] [char](2) NOT NULL,
	[Cod_afp] [int] NOT NULL,
	[Cod_sin] [int] NOT NULL,
	[Cod_isa] [int] NOT NULL,
	[Fun] [char](15) NOT NULL,
	[Fecha_isa] [datetime] NOT NULL,
	[Cod_ine] [int] NOT NULL,
	[Cod_caj] [int] NOT NULL,
	[Zonafa] [int] NOT NULL,
	[Tramo_car] [int] NOT NULL,
	[Cod_reg] [int] NOT NULL,
	[Jubila] [char](1) NOT NULL,
	[Fecha_vac] [datetime] NOT NULL,
	[Vac_anre] [numeric](6, 2) NOT NULL,
	[Vac_form] [char](4) NOT NULL,
	[Vac_ini] [numeric](7, 2) NOT NULL,
	[Vac_base] [int] NOT NULL,
	[Vac_dmas] [numeric](7, 2) NOT NULL,
	[Vac_PrTo] [int] NOT NULL,
	[Vac_PrVe] [int] NOT NULL,
	[Asigfam] [char](1) NOT NULL,
	[Fecha_lic] [datetime] NOT NULL,
	[Anexo] [int] NOT NULL,
	[SiAus] [char](1) NOT NULL,
	[Diastr] [int] NOT NULL,
	[Diasli] [int] NOT NULL,
	[Sen_niv] [int] NOT NULL,
	[Sen_fra] [numeric](6, 2) NOT NULL,
	[TopeLey] [money] NOT NULL,
	[GradoC] [int] NOT NULL,
	[Fecha_gra] [datetime] NOT NULL,
	[NumTar] [int] NOT NULL,
	[L18566] [char](1) NOT NULL,
	[Lpacot] [char](3) NOT NULL,
	[Cuenta] [int] NOT NULL,
	[RegPag] [char](1) NOT NULL,
	[Trapes] [numeric](4, 1) NOT NULL,
	[Horas] [money] NOT NULL,
	[Licmed] [char](1) NOT NULL,
	[Trespd] [char](1) NOT NULL,
	[Subsil] [char](1) NOT NULL,
	[reblim] [char](1) NOT NULL,
	[Manliq] [char](1) NOT NULL,
	[Fecha_mod] [datetime] NOT NULL,
	[Ames] [char](6) NOT NULL,
	[Credenc] [char](16) NOT NULL,
	[Jdd] [int] NOT NULL,
	[Fecha_sec] [datetime] NOT NULL,
	[Tipcon] [char](1) NOT NULL,
	[Peri] [char](1) NOT NULL,
	[fecha_rea] [datetime] NOT NULL,
	[Convenio] [int] NOT NULL,
	[Confid] [char](1) NOT NULL,
	[Autoriza] [char](12) NOT NULL,
	[Cheres] [char](1) NOT NULL,
	[Chenum] [int] NOT NULL,
	[Cheval] [int] NOT NULL,
	[TICKET] [char](1) NOT NULL,
	[OCUPACION] [varchar](50) NOT NULL,
	[esFpri] [varchar](50) NOT NULL,
	[Nficha] [int] NOT NULL,
	[FechaApvc] [datetime] NOT NULL,
	[EstApvc] [char](1) NOT NULL,
	[SiContra] [char](1) NOT NULL,
	[Seccion] [int] NOT NULL,
	[IndMonto] [money] NOT NULL,
	[IndDias] [int] NOT NULL,
	[UserAD] [char](50) NOT NULL,
	[Esrecon] [char](1) NOT NULL,
	[fecha_rct] [datetime] NOT NULL,
	[CodOcupa] [int] NOT NULL,
	[Fpago2] [int] NOT NULL,
	[Banco2] [int] NOT NULL,
	[Cta_corr2] [varchar](2000) NOT NULL,
	[Ffp] [numeric](5, 2) NOT NULL,
	[Ffp2] [numeric](5, 2) NOT NULL,
	[Ofiban2] [int] NOT NULL,
	[Evaluador] [char](12) NOT NULL,
	[FechasJov] [datetime] NOT NULL,
	[Fp2Benef] [int] NOT NULL,
	[Jornada] [char](1) NOT NULL,
	[JorCont] [char](1) NOT NULL,
	[Sdato2] [varchar](2000) NOT NULL,
	[P5taex] [char](1) NOT NULL,
	[Pafisp] [char](1) NOT NULL,
	[Pdisca] [char](1) NOT NULL,
	[Pindom] [char](1) NOT NULL,
	[Ping5t] [char](1) NOT NULL,
	[Pjortm] [char](1) NOT NULL,
	[PlanOS] [int] NOT NULL,
	[Pmadres] [char](1) NOT NULL,
	[PorcUnif] [numeric](6, 2) NOT NULL,
	[PreSalud] [int] NOT NULL,
	[Psujhn] [char](1) NOT NULL,
	[Cta_inte2] [char](26) NOT NULL,
	[Cta_inter] [char](26) NOT NULL,
	[Dir_trab] [int] NOT NULL,
	[Fecha_ult] [datetime] NOT NULL,
	[Premint] [char](1) NOT NULL,
	[Cod_dni] [int] NOT NULL,
	[Antica] [money] NOT NULL,
	[APC] [varchar](50) NOT NULL,
	[AutFirmar] [char](1) NOT NULL,
	[Bloques] [char](8) NOT NULL,
	[Celular] [char](18) NOT NULL,
	[Direccion] [varchar](128) NOT NULL,
	[Fecha_afp] [datetime] NOT NULL,
	[Fono] [char](18) NOT NULL,
	[Ktim] [money] NOT NULL,
	[Monto_red] [money] NOT NULL,
	[Monto_sgr] [money] NOT NULL,
	[Numafp] [char](15) NOT NULL,
	[pmail] [varchar](50) NOT NULL,
	[Renmax] [money] NOT NULL,
	[Sdato] [char](30) NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE NONCLUSTERED INDEX [Llauno] ON [dbo].[REMPLESH] 
(
	[Jdd] ASC,
	[Codigo] ASC,
	[Ames] ASC,
	[Peri] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[REMPLES]    Script Date: 10/19/2015 16:18:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[REMPLES](
	[Codigo] [char](12) NOT NULL,
	[Estado] [char](1) NOT NULL,
	[Tiprem] [char](1) NOT NULL,
	[Empresa] [char](3) NOT NULL,
	[Nombre] [varchar](60) NOT NULL,
	[Rut] [char](12) NOT NULL,
	[Sexo] [char](1) NOT NULL,
	[Direccion] [varchar](128) NOT NULL,
	[Fono] [char](18) NOT NULL,
	[Fecha_nac] [datetime] NOT NULL,
	[Nacion] [int] NOT NULL,
	[Celular] [char](18) NOT NULL,
	[Est_civil] [char](15) NOT NULL,
	[Estudios] [int] NOT NULL,
	[Titulo] [int] NOT NULL,
	[Clase] [int] NOT NULL,
	[Idiomas] [int] NOT NULL,
	[Renmax] [money] NOT NULL,
	[Autopas] [char](1) NOT NULL,
	[pmail] [char](50) NOT NULL,
	[Fecha_ing] [datetime] NOT NULL,
	[Tipo_doc] [int] NOT NULL,
	[Numdoc] [char](11) NOT NULL,
	[Jefe] [char](12) NOT NULL,
	[Fecha_ret] [datetime] NOT NULL,
	[Moti_ret] [int] NOT NULL,
	[Fecha_xtr] [datetime] NOT NULL,
	[Cencos] [int] NOT NULL,
	[Ticen] [char](1) NOT NULL,
	[Catego] [int] NOT NULL,
	[Clasif] [int] NOT NULL,
	[Ubica] [int] NOT NULL,
	[Lpago] [int] NOT NULL,
	[Cargo] [int] NOT NULL,
	[Grado] [int] NOT NULL,
	[Division] [int] NOT NULL,
	[Unidad] [int] NOT NULL,
	[Horario] [int] NOT NULL,
	[Sit_lab] [int] NOT NULL,
	[Fpago] [int] NOT NULL,
	[Banco] [int] NOT NULL,
	[Ofiban] [int] NOT NULL,
	[Cta_corr] [char](26) NOT NULL,
	[Talla_r] [char](4) NOT NULL,
	[Talla_z] [char](5) NOT NULL,
	[CARNET] [char](2) NOT NULL,
	[Cod_afp] [int] NOT NULL,
	[Numafp] [char](15) NOT NULL,
	[Fecha_afp] [datetime] NOT NULL,
	[Cod_sin] [int] NOT NULL,
	[Cod_isa] [int] NOT NULL,
	[Fun] [char](15) NOT NULL,
	[Fecha_isa] [datetime] NOT NULL,
	[Cod_ine] [int] NOT NULL,
	[Cod_caj] [int] NOT NULL,
	[Zonafa] [int] NOT NULL,
	[Tramo_car] [int] NOT NULL,
	[Cod_reg] [int] NOT NULL,
	[Jubila] [char](1) NOT NULL,
	[Fecha_vac] [datetime] NOT NULL,
	[Vac_anre] [numeric](6, 2) NOT NULL,
	[Vac_dias] [numeric](7, 2) NOT NULL,
	[Vac_form] [char](4) NOT NULL,
	[Vac_ini] [numeric](7, 2) NOT NULL,
	[Vac_base] [int] NOT NULL,
	[Vac_dmas] [numeric](7, 2) NOT NULL,
	[Vac_PrTo] [int] NOT NULL,
	[Vac_PrVe] [int] NOT NULL,
	[Asigfam] [char](1) NOT NULL,
	[Fecha_lic] [datetime] NOT NULL,
	[Anexo] [int] NOT NULL,
	[Apc] [varchar](50) NOT NULL,
	[SiAus] [char](1) NOT NULL,
	[Monto_red] [money] NOT NULL,
	[Monto_sgr] [money] NOT NULL,
	[Ktim] [money] NOT NULL,
	[Antica] [money] NOT NULL,
	[Diastr] [int] NOT NULL,
	[Diasli] [int] NOT NULL,
	[Sen_niv] [int] NOT NULL,
	[Sen_fra] [numeric](6, 2) NOT NULL,
	[Bloques] [char](8) NOT NULL,
	[TopeLey] [money] NOT NULL,
	[GradoC] [int] NOT NULL,
	[Fecha_gra] [datetime] NOT NULL,
	[NumTar] [int] NOT NULL,
	[L18566] [char](1) NOT NULL,
	[Lpacot] [char](3) NOT NULL,
	[Cuenta] [int] NOT NULL,
	[RegPag] [char](1) NOT NULL,
	[Trapes] [numeric](4, 1) NOT NULL,
	[Horas] [money] NOT NULL,
	[Licmed] [char](1) NOT NULL,
	[Trespd] [char](1) NOT NULL,
	[Subsil] [char](1) NOT NULL,
	[reblim] [char](1) NOT NULL,
	[Manliq] [char](1) NOT NULL,
	[Fecha_mod] [datetime] NOT NULL,
	[Ames] [char](6) NOT NULL,
	[Sdato] [char](16) NOT NULL,
	[Credenc] [char](16) NOT NULL,
	[Jdd] [int] NOT NULL,
	[Fecha_sec] [datetime] NOT NULL,
	[Tipcon] [char](1) NOT NULL,
	[Peri] [char](1) NOT NULL,
	[fecha_rea] [datetime] NOT NULL,
	[Convenio] [int] NOT NULL,
	[Confid] [char](1) NOT NULL,
	[Autoriza] [char](12) NOT NULL,
	[Cheres] [char](1) NOT NULL,
	[Chenum] [int] NOT NULL,
	[Cheval] [int] NOT NULL,
	[TICKET] [char](1) NOT NULL,
	[OCUPACION] [varchar](50) NOT NULL,
	[esFpri] [varchar](50) NOT NULL,
	[Nficha] [int] NOT NULL,
	[FechaSjov] [datetime] NOT NULL,
	[FechaApvc] [datetime] NOT NULL,
	[EstApvc] [char](1) NOT NULL,
	[IndMonto] [money] NOT NULL,
	[IndDias] [int] NOT NULL,
	[Seccion] [int] NOT NULL,
	[UserAD] [char](50) NOT NULL,
	[Esrecon] [char](1) NOT NULL,
	[SiContra] [char](1) NOT NULL,
	[fecha_rct] [datetime] NOT NULL,
	[CodOcupa] [int] NOT NULL,
	[Fpago2] [int] NOT NULL,
	[Banco2] [int] NOT NULL,
	[Cta_corr2] [varchar](2000) NOT NULL,
	[Ffp] [numeric](5, 2) NOT NULL,
	[Ffp2] [numeric](5, 2) NOT NULL,
	[Ofiban2] [int] NOT NULL,
	[Fp2Benef] [int] NOT NULL,
	[Evaluador] [char](12) NOT NULL,
	[Jornada] [char](1) NOT NULL,
	[Sdato2] [varchar](2000) NOT NULL,
	[JorCont] [char](1) NOT NULL,
	[P5taex] [char](1) NOT NULL,
	[Pafisp] [char](1) NOT NULL,
	[Pdisca] [char](1) NOT NULL,
	[Pindom] [char](1) NOT NULL,
	[Ping5t] [char](1) NOT NULL,
	[Pjortm] [char](1) NOT NULL,
	[PlanOS] [int] NOT NULL,
	[Pmadres] [char](1) NOT NULL,
	[PorcUnif] [numeric](6, 2) NOT NULL,
	[PreSalud] [int] NOT NULL,
	[Psujhn] [char](1) NOT NULL,
	[Cta_inte2] [char](26) NOT NULL,
	[Cta_inter] [char](26) NOT NULL,
	[Dir_trab] [int] NOT NULL,
	[Fecha_ult] [datetime] NOT NULL,
	[Premint] [char](1) NOT NULL,
	[Cod_dni] [int] NOT NULL,
	[AutFirmar] [char](1) NOT NULL,
 CONSTRAINT [PK_REMPLES] PRIMARY KEY CLUSTERED 
(
	[Codigo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE NONCLUSTERED INDEX [Llados] ON [dbo].[REMPLES] 
(
	[Rut] ASC,
	[Nficha] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [Llauno] ON [dbo].[REMPLES] 
(
	[Nombre] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[REMPLEPER]    Script Date: 10/19/2015 16:18:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[REMPLEPER](
	[Rut] [char](12) NOT NULL,
	[Empresa] [char](3) NOT NULL,
	[Ktim] [money] NOT NULL,
	[Ksip] [money] NOT NULL,
	[ksaim] [money] NOT NULL,
	[kspue] [money] NOT NULL,
	[kafesec] [money] NOT NULL,
	[kgl25] [money] NOT NULL,
	[Jdd] [int] NOT NULL,
 CONSTRAINT [PK_REMPLEPER] PRIMARY KEY CLUSTERED 
(
	[Rut] ASC,
	[Empresa] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[REMPLEC]    Script Date: 10/19/2015 16:18:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[REMPLEC](
	[Codigo] [char](12) NOT NULL,
	[Codcam] [int] NOT NULL,
	[ValorN] [money] NOT NULL,
	[ValorF] [datetime] NOT NULL,
	[ValorC] [char](30) NOT NULL,
	[Jdd] [int] NOT NULL,
	[ValorM] [varchar](2000) NOT NULL,
	[Fecha_ult] [datetime] NOT NULL,
 CONSTRAINT [PK_REMPLEC] PRIMARY KEY CLUSTERED 
(
	[Codigo] ASC,
	[Codcam] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[REMPLAN]    Script Date: 10/19/2015 16:18:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[REMPLAN](
	[Codigo] [char](12) NOT NULL,
	[Nombre] [char](60) NOT NULL,
	[Rut] [char](12) NOT NULL,
	[Cargo] [int] NOT NULL,
	[Direccion] [char](95) NOT NULL,
	[Fono] [char](18) NOT NULL,
	[Fecha_nac] [datetime] NOT NULL,
	[Fecha_ing] [datetime] NOT NULL,
	[Fecha_ret] [datetime] NOT NULL,
	[Moti_ret] [int] NOT NULL,
	[Obs] [char](163) NOT NULL,
	[Jdd] [int] NOT NULL,
	[Cencos] [int] NOT NULL,
	[Empresa] [char](3) NOT NULL,
	[estado] [char](1) NOT NULL,
	[Ocupacion] [varchar](2000) NOT NULL,
 CONSTRAINT [PK_REMPLAN] PRIMARY KEY CLUSTERED 
(
	[Codigo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RECORDAR]    Script Date: 10/19/2015 16:18:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RECORDAR](
	[Jdd] [int] NOT NULL,
	[Fecha_cre] [datetime] NOT NULL,
	[Usuario] [char](12) NOT NULL,
	[Titulo] [char](15) NOT NULL,
	[Destino] [char](1) NOT NULL,
	[Grupos] [char](72) NOT NULL,
	[Restrin] [char](1) NOT NULL,
	[Fecha_act] [datetime] NOT NULL,
	[Color] [char](1) NOT NULL,
	[Dato] [varchar](2000) NOT NULL,
 CONSTRAINT [PK_RECORDAR] PRIMARY KEY CLUSTERED 
(
	[Jdd] ASC,
	[Fecha_cre] ASC,
	[Usuario] ASC,
	[Titulo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RDOCUMS]    Script Date: 10/19/2015 16:18:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RDOCUMS](
	[Codigo] [char](12) NOT NULL,
	[Fecha_doc] [datetime] NOT NULL,
	[Tipo] [int] NOT NULL,
	[Descrip] [char](40) NOT NULL,
	[Nombre] [varchar](30) NOT NULL,
	[Fecha_car] [datetime] NOT NULL,
	[Elemento] [text] NOT NULL,
	[Jdd] [int] NOT NULL,
	[Dire] [char](20) NOT NULL,
 CONSTRAINT [PK_RDOCUMS] PRIMARY KEY CLUSTERED 
(
	[Jdd] ASC,
	[Codigo] ASC,
	[Nombre] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RDIREC]    Script Date: 10/19/2015 16:18:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RDIREC](
	[Codigo] [int] NOT NULL,
	[Descrip] [char](30) NOT NULL,
	[Direccion] [varchar](128) NOT NULL,
	[Telefono] [char](18) NOT NULL,
	[Valor] [money] NOT NULL,
	[Valorc] [varchar](20) NOT NULL,
	[Mail] [varchar](60) NOT NULL,
	[Jdd] [int] NOT NULL,
 CONSTRAINT [PK_RDIREC] PRIMARY KEY CLUSTERED 
(
	[Codigo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RDESCUR]    Script Date: 10/19/2015 16:18:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RDESCUR](
	[Curso] [char](15) NOT NULL,
	[Descrip] [char](30) NOT NULL,
	[Institu] [int] NOT NULL,
	[Nivel] [int] NOT NULL,
	[Costo] [money] NOT NULL,
	[Horas] [money] NOT NULL,
	[Relator] [char](30) NOT NULL,
	[Fecha_ini] [datetime] NOT NULL,
	[Fecha_ter] [datetime] NOT NULL,
	[Compet] [int] NOT NULL,
	[EsSence] [char](1) NOT NULL,
	[Cordina] [char](12) NOT NULL,
	[Jdd] [int] NOT NULL,
	[Tipo] [int] NOT NULL,
	[objetivo] [varchar](2000) NOT NULL,
	[metodo] [int] NOT NULL,
	[obligat] [char](1) NOT NULL,
	[unidad] [int] NOT NULL,
 CONSTRAINT [PK_RDESCUR] PRIMARY KEY CLUSTERED 
(
	[Curso] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE NONCLUSTERED INDEX [Llauno] ON [dbo].[RDESCUR] 
(
	[Compet] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RCURRICU]    Script Date: 10/19/2015 16:18:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RCURRICU](
	[Codigo] [char](12) NOT NULL,
	[Fecha_ini] [datetime] NOT NULL,
	[Duracion] [numeric](5, 2) NOT NULL,
	[TipDur] [char](1) NOT NULL,
	[Detalle] [char](50) NOT NULL,
	[Tipo] [int] NOT NULL,
	[Institu] [int] NOT NULL,
	[Compet] [int] NOT NULL,
	[ValorS] [money] NOT NULL,
	[ValorT] [money] NOT NULL,
	[EsSence] [char](1) NOT NULL,
	[Situ] [char](10) NOT NULL,
	[Asisten] [int] NOT NULL,
	[Aproba] [char](1) NOT NULL,
	[Obs] [char](128) NOT NULL,
	[Jdd] [int] NOT NULL,
	[Nacion] [int] NOT NULL,
	[Area] [char](30) NOT NULL,
	[Fecha_ter] [datetime] NOT NULL,
	[Dinstitu] [varchar](2000) NOT NULL,
	[Grado] [int] NOT NULL,
	[Titulo] [char](50) NOT NULL,
	[Especial] [char](30) NOT NULL,
	[Puntaje] [numeric](5, 2) NOT NULL,
	[fecha_mod] [datetime] NOT NULL,
	[Estado] [int] NOT NULL,
	[Tipotract] [int] NOT NULL,
	[vobo] [int] NOT NULL,
	[Causen] [int] NOT NULL,
	[usrvobo] [char](12) NOT NULL,
 CONSTRAINT [PK_RCURRICU] PRIMARY KEY CLUSTERED 
(
	[Codigo] ASC,
	[Tipo] ASC,
	[Fecha_ini] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE NONCLUSTERED INDEX [Llauno] ON [dbo].[RCURRICU] 
(
	[Codigo] ASC,
	[Tipo] ASC,
	[Compet] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RCUENTAS]    Script Date: 10/19/2015 16:18:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RCUENTAS](
	[Cohade] [char](6) NOT NULL,
	[Indice] [int] NOT NULL,
	[Cuenta] [char](14) NOT NULL,
	[Jdd] [int] NOT NULL,
 CONSTRAINT [PK_RCUENTAS] PRIMARY KEY CLUSTERED 
(
	[Jdd] ASC,
	[Cohade] ASC,
	[Indice] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RCTACOR]    Script Date: 10/19/2015 16:18:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RCTACOR](
	[Codigo] [char](12) NOT NULL,
	[Codpres] [int] NOT NULL,
	[Fecha] [datetime] NOT NULL,
	[Detalle] [char](30) NOT NULL,
	[MontoH] [money] NOT NULL,
	[MontoC] [money] NOT NULL,
	[MontoA] [money] NOT NULL,
	[MontoP] [money] NOT NULL,
	[Cohade] [char](6) NOT NULL,
	[Signo] [char](1) NOT NULL,
	[Coform] [char](4) NOT NULL,
	[Tipo] [int] NOT NULL,
	[Cuotot] [int] NOT NULL,
	[Fecha_ini] [datetime] NOT NULL,
	[Jdd] [int] NOT NULL,
	[Tiesta] [timestamp] NOT NULL,
	[Origen] [char](1) NOT NULL,
	[Moneda] [int] NOT NULL,
	[cuota] [int] NOT NULL,
	[Nucom] [int] NOT NULL,
	[Refere] [char](15) NOT NULL,
 CONSTRAINT [PK_RCTACOR] PRIMARY KEY CLUSTERED 
(
	[Codigo] ASC,
	[Codpres] ASC,
	[Signo] ASC,
	[Fecha] ASC,
	[Tiesta] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RCONJUN]    Script Date: 10/19/2015 16:18:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RCONJUN](
	[CodCon] [int] NOT NULL,
	[Descrip] [char](30) NOT NULL,
	[Tipo] [char](1) NOT NULL,
	[Condi] [varchar](2000) NOT NULL,
	[Jdd] [int] NOT NULL,
 CONSTRAINT [PK_RCONJUN] PRIMARY KEY CLUSTERED 
(
	[CodCon] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RCONGSEM]    Script Date: 10/19/2015 16:18:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RCONGSEM](
	[RUT] [char](12) NOT NULL,
	[evento] [varchar](100) NOT NULL,
	[instit] [varchar](100) NOT NULL,
	[fecha] [datetime] NOT NULL,
	[fecha_fin] [datetime] NOT NULL,
	[caracter] [char](10) NOT NULL,
	[ciudad] [varchar](50) NOT NULL,
	[pais] [char](30) NOT NULL,
	[observ] [varchar](100) NOT NULL,
	[Fecha_mod] [datetime] NOT NULL,
	[vobo] [int] NOT NULL,
	[usrvobo] [char](12) NOT NULL,
 CONSTRAINT [PK_RCONGSEM] PRIMARY KEY CLUSTERED 
(
	[RUT] ASC,
	[fecha] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RCONFIR]    Script Date: 10/19/2015 16:18:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RCONFIR](
	[Codigo] [char](12) NOT NULL,
	[Ames] [char](6) NOT NULL,
	[Peri] [char](1) NOT NULL,
	[marca] [char](1) NOT NULL,
	[Fecha_mar] [datetime] NOT NULL,
	[Detalle] [char](160) NOT NULL,
	[Jdd] [int] NOT NULL,
 CONSTRAINT [PK_RCONFIR] PRIMARY KEY CLUSTERED 
(
	[Codigo] ASC,
	[Ames] ASC,
	[Peri] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RCONDIS]    Script Date: 10/19/2015 16:18:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RCONDIS](
	[Jdd] [int] NOT NULL,
	[Usuario] [char](12) NOT NULL,
	[Descrip] [char](30) NOT NULL,
	[Condicion] [char](250) NOT NULL,
 CONSTRAINT [PK_RCONDIS] PRIMARY KEY CLUSTERED 
(
	[Usuario] ASC,
	[Descrip] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RCONDAT]    Script Date: 10/19/2015 16:18:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RCONDAT](
	[Jdd] [int] NOT NULL,
	[Usuario] [char](12) NOT NULL,
	[Wcompu] [char](20) NOT NULL,
	[Identi] [int] NOT NULL,
	[Wuser] [char](12) NOT NULL,
	[Fecha] [datetime] NOT NULL,
	[Programa] [char](30) NOT NULL,
 CONSTRAINT [PK_RCONDAT] PRIMARY KEY CLUSTERED 
(
	[Jdd] ASC,
	[Usuario] ASC,
	[Wcompu] ASC,
	[Identi] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RCOMISI]    Script Date: 10/19/2015 16:18:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RCOMISI](
	[Codigo] [char](12) NOT NULL,
	[Ames] [char](6) NOT NULL,
	[Peri] [char](1) NOT NULL,
	[Cohade] [char](6) NOT NULL,
	[Numero] [int] NOT NULL,
	[Valor1] [money] NOT NULL,
	[Valor2] [money] NOT NULL,
	[Valor3] [money] NOT NULL,
	[Valor4] [money] NOT NULL,
	[Campo1] [varchar](15) NOT NULL,
	[Campo2] [varchar](30) NOT NULL,
	[Campo3] [varchar](50) NOT NULL,
	[Campo4] [varchar](100) NOT NULL,
	[Largo1] [varchar](250) NOT NULL,
	[Largo2] [varchar](2000) NOT NULL,
	[Jdd] [int] NOT NULL,
 CONSTRAINT [PK_RCOMISI] PRIMARY KEY CLUSTERED 
(
	[Ames] ASC,
	[Peri] ASC,
	[Codigo] ASC,
	[Cohade] ASC,
	[Numero] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RCOMCAR]    Script Date: 10/19/2015 16:18:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RCOMCAR](
	[Cargo] [int] NOT NULL,
	[Compet] [int] NOT NULL,
	[Priori] [int] NOT NULL,
	[Sicap] [char](1) NOT NULL,
	[Jdd] [int] NOT NULL,
 CONSTRAINT [PK_RCOMCAR] PRIMARY KEY CLUSTERED 
(
	[Cargo] ASC,
	[Compet] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RCLAREM]    Script Date: 10/19/2015 16:18:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RCLAREM](
	[Codigo] [char](12) NOT NULL,
	[Cohade] [char](6) NOT NULL,
	[Nro] [int] NOT NULL,
	[Tipo] [int] NOT NULL,
	[Orden] [int] NOT NULL,
	[Periodo] [char](1) NOT NULL,
	[COFORM] [char](4) NOT NULL,
	[CUOTOT] [int] NOT NULL,
	[Cuopar] [int] NOT NULL,
	[Monto] [money] NOT NULL,
	[Fecha_cre] [datetime] NOT NULL,
	[Fecha_ini] [datetime] NOT NULL,
	[Fecha_fin] [datetime] NOT NULL,
	[Cencos] [int] NOT NULL,
	[Cuenta] [char](14) NOT NULL,
	[Ticen] [char](1) NOT NULL,
	[Ctacor] [char](1) NOT NULL,
	[Obs] [char](20) NOT NULL,
	[Formula] [varchar](40) NOT NULL,
	[Coinst] [int] NOT NULL,
	[Pone] [char](1) NOT NULL,
	[Grupo] [int] NOT NULL,
	[Condi] [char](120) NOT NULL,
	[Simes] [char](1) NOT NULL,
	[QuePeri] [char](7) NOT NULL,
	[Jdd] [int] NOT NULL,
 CONSTRAINT [PK_RCLAREM] PRIMARY KEY CLUSTERED 
(
	[Codigo] ASC,
	[Cohade] ASC,
	[Periodo] ASC,
	[Nro] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RCLAENC]    Script Date: 10/19/2015 16:18:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RCLAENC](
	[Codigo] [char](12) NOT NULL,
	[Descrip] [char](30) NOT NULL,
	[Codemp] [char](12) NOT NULL,
	[Funda] [varchar](2000) NOT NULL,
	[Jdd] [int] NOT NULL,
 CONSTRAINT [PK_RCLAENC] PRIMARY KEY CLUSTERED 
(
	[Codigo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RCERTIREN]    Script Date: 10/19/2015 16:18:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RCERTIREN](
	[Rut] [char](12) NOT NULL,
	[Ames] [char](6) NOT NULL,
	[Empresa] [char](3) NOT NULL,
	[Rembru] [money] NOT NULL,
	[Cotiza] [money] NOT NULL,
	[Afecto] [money] NOT NULL,
	[Impues] [money] NOT NULL,
	[Exento] [money] NOT NULL,
	[Zonafa] [money] NOT NULL,
	[Ppm] [money] NOT NULL,
	[factor] [numeric](6, 3) NOT NULL,
	[aAfecto] [money] NOT NULL,
	[aImpues] [money] NOT NULL,
	[aExento] [money] NOT NULL,
	[aZonafa] [money] NOT NULL,
	[aPpm] [money] NOT NULL,
	[numcer] [int] NOT NULL,
	[Jdd] [int] NOT NULL,
 CONSTRAINT [PK_RCERTIREN] PRIMARY KEY CLUSTERED 
(
	[Rut] ASC,
	[Ames] ASC,
	[Empresa] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RCENTROS]    Script Date: 10/19/2015 16:18:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RCENTROS](
	[Codigo] [char](12) NOT NULL,
	[Ames] [char](6) NOT NULL,
	[Peri] [char](1) NOT NULL,
	[Periodo] [char](7) NOT NULL,
	[Cencos] [int] NOT NULL,
	[Porcen] [money] NOT NULL,
	[Unids] [money] NOT NULL,
	[Ticen] [char](1) NOT NULL,
	[Jdd] [int] NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RBECAS]    Script Date: 10/19/2015 16:18:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RBECAS](
	[RUT] [char](12) NOT NULL,
	[tipobeca] [varchar](50) NOT NULL,
	[fecha] [datetime] NOT NULL,
	[fecha_fin] [datetime] NOT NULL,
	[instit] [varchar](100) NOT NULL,
	[observ] [varchar](100) NOT NULL,
	[monto] [money] NOT NULL,
	[Fecha_mod] [datetime] NOT NULL,
	[vobo] [int] NOT NULL,
	[usrvobo] [char](12) NOT NULL,
 CONSTRAINT [PK_RBECAS] PRIMARY KEY CLUSTERED 
(
	[RUT] ASC,
	[fecha] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RAUSENT]    Script Date: 10/19/2015 16:18:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RAUSENT](
	[Codigo] [char](12) NOT NULL,
	[Fecha_ini] [datetime] NOT NULL,
	[Dias] [numeric](6, 2) NOT NULL,
	[Fecha_fin] [datetime] NOT NULL,
	[Fecha_lic] [datetime] NOT NULL,
	[Rebsal] [int] NOT NULL,
	[Escon] [char](1) NOT NULL,
	[Tipo] [int] NOT NULL,
	[Dtipo] [char](12) NOT NULL,
	[Causal] [int] NOT NULL,
	[Dcausal] [char](20) NOT NULL,
	[Detalle] [char](200) NOT NULL,
	[Medico] [char](30) NOT NULL,
	[Nulic] [int] NOT NULL,
	[DiasE] [int] NOT NULL,
	[Medios] [char](1) NOT NULL,
	[Diagnos] [int] NOT NULL,
	[Mailen] [int] NOT NULL,
	[Jdd] [int] NOT NULL,
	[fecha_ret] [datetime] NOT NULL,
	[Rutpro] [char](12) NOT NULL,
	[Especia] [int] NOT NULL,
	[MontoAn] [money] NOT NULL,
	[MontoRe] [money] NOT NULL,
	[MontoCo] [money] NOT NULL,
	[Fecha_ico] [datetime] NOT NULL,
	[fecha_env] [datetime] NOT NULL,
	[estado] [char](1) NOT NULL,
	[CodSub] [char](1) NOT NULL,
	[fecha_ing] [datetime] NOT NULL,
	[usuario] [char](12) NOT NULL,
	[origen] [char](1) NOT NULL,
	[Dias3pd] [numeric](4, 2) NOT NULL,
	[Fecha_ult] [datetime] NOT NULL,
	[SubsilB] [money] NOT NULL,
	[SubsilN] [money] NOT NULL,
	[Dv] [char](1) NOT NULL,
 CONSTRAINT [PK_RAUSENT] PRIMARY KEY CLUSTERED 
(
	[Codigo] ASC,
	[Fecha_ini] ASC,
	[Nulic] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE NONCLUSTERED INDEX [Llauno] ON [dbo].[RAUSENT] 
(
	[Fecha_ini] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RASIGNA]    Script Date: 10/19/2015 16:18:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RASIGNA](
	[Codigo] [char](12) NOT NULL,
	[Fecha_asi] [datetime] NOT NULL,
	[Descrip] [char](30) NOT NULL,
	[Valor] [money] NOT NULL,
	[Fecha_ven] [datetime] NOT NULL,
	[Bien] [int] NOT NULL,
	[Respon] [char](12) NOT NULL,
	[Obs] [char](250) NOT NULL,
	[Devuelto] [char](1) NOT NULL,
	[Jdd] [int] NOT NULL,
	[Cantid] [int] NOT NULL,
 CONSTRAINT [PK_RASIGNA] PRIMARY KEY CLUSTERED 
(
	[Jdd] ASC,
	[Codigo] ASC,
	[Bien] ASC,
	[Fecha_asi] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RALERTAS]    Script Date: 10/19/2015 16:18:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RALERTAS](
	[Id] [int] NOT NULL,
	[Descrip] [char](40) NOT NULL,
	[Estado] [char](1) NOT NULL,
	[Ubica] [char](1) NOT NULL,
	[Proce] [char](15) NOT NULL,
	[Params] [char](100) NOT NULL,
	[Explica] [varchar](2000) NOT NULL,
	[Jdd] [int] NOT NULL,
 CONSTRAINT [PK_RALERTAS] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RAFECTOS]    Script Date: 10/19/2015 16:18:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RAFECTOS](
	[Codigo] [char](12) NOT NULL,
	[Ames] [char](6) NOT NULL,
	[Peri] [char](1) NOT NULL,
	[Jdd] [int] NOT NULL,
	[AF01] [money] NOT NULL,
	[AF02] [money] NOT NULL,
	[AF03] [money] NOT NULL,
	[AF04] [money] NOT NULL,
	[AF05] [money] NOT NULL,
	[AF06] [money] NOT NULL,
	[AF07] [money] NOT NULL,
	[AF08] [money] NOT NULL,
	[AF09] [money] NOT NULL,
	[AF10] [money] NOT NULL,
	[AF11] [money] NOT NULL,
	[AF12] [money] NOT NULL,
	[AF13] [money] NOT NULL,
	[AF14] [money] NOT NULL,
	[AF15] [money] NOT NULL,
	[AF16] [money] NOT NULL,
	[AF17] [money] NOT NULL,
	[AF18] [money] NOT NULL,
	[AF19] [money] NOT NULL,
	[AF20] [money] NOT NULL,
	[AF21] [money] NOT NULL,
	[AF22] [money] NOT NULL,
	[AF23] [money] NOT NULL,
	[AF24] [money] NOT NULL,
	[AF25] [money] NOT NULL,
 CONSTRAINT [PK_RAFECTOS] PRIMARY KEY CLUSTERED 
(
	[Jdd] ASC,
	[Codigo] ASC,
	[Ames] ASC,
	[Peri] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[prueba]    Script Date: 10/19/2015 16:18:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[prueba] (
             @nombre varchar(20)
)
as
   declare @rut int
begin

 set @rut = 0

end
GO
/****** Object:  StoredProcedure [rionapo].[LaVersion]    Script Date: 10/19/2015 16:18:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*---------------------------------------------------------------------------
                          Lee un valor desde una tabla.
----------------------------------------------------------------------------
RCM 05.dic.01 -Se agrego Codal.
RCM 04.oct.01 -Valor 4 a 15.
RCM 21.sep.04 -Version inicial.
--------------------------------------------------------------------------*/
CREATE PROCEDURE [rionapo].[LaVersion]  @ver varchar(200) output

AS
select @ver = @@version
return
GO
/****** Object:  StoredProcedure [dbo].[insliq]    Script Date: 10/19/2015 16:18:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[insliq]
@codigo char(12),
@dia datetime,
@cohade char(6),
@horas numeric(19,4),
@tipo char(1),
@cencos int
 
 AS
insert into tbcasliq values(@codigo,@dia,@cohade,@horas,@tipo,@cencos,' ',0)
GO
/****** Object:  StoredProcedure [rionapo].[InsertarSalida]    Script Date: 10/19/2015 16:18:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [rionapo].[InsertarSalida]
(@legajo char(12),@dia datetime, @hora char(5),@reloj char(16),@horamin char(5),@horamax char(5)) 
as
begin
 	declare @codigo int
 	declare @estado char(1)
	if not exists (select * from tbcasapa where apalegajo=@legajo and apafecha =@dia and apahoras between @horamin and @horamax or apalegajo=@legajo and apafecha =dateadd(day,-1,@dia) and apahoras between @horamin and @horamax and apahorae >= @hora)
	begin
  		select @codigo=max(apacodigo) from tbcasapa where apalegajo=@legajo and apafecha =@dia and apahorae < @hora and apahorae >= '00:00' 
  		if @codigo is not null
		begin	
   			select @estado=apaestado from tbcasapa where apacodigo = @codigo
   			if @estado = 2 
				update  tbcasapa set apahoras = @hora, apaestado = 0, aparels = @reloj where apacodigo =@codigo
   			else
     				insert into tbcasapa(apacodigo,apalegajo, apafecha,apahoras,apaestado,aparels,apatipo) select max(apacodigo)+1, @legajo,@dia,@hora,1,@reloj,'A' from tbcasapa	
		end
  		else
		begin
   			select @codigo = max(apacodigo) from tbcasapa where apalegajo=@legajo and apafecha =dateadd(day,-1,@dia) and apahorae >= @hora and apahorae >= '00:00' 
   			if @codigo is not null
			begin	
   				select @estado=apaestado from tbcasapa where apacodigo = @codigo
				if @estado = 2 
		    			update  tbcasapa set apahoras = @hora, apaestado = 0, aparels = @reloj where apacodigo = @codigo
		   		else
     					insert into tbcasapa(apacodigo,apalegajo, apafecha,apahoras,apaestado,aparels,apatipo) select max(apacodigo)+1, @legajo,@dia,@hora,1,@reloj,'A' from tbcasapa	
			end
   			else
     				insert into tbcasapa(apacodigo,apalegajo, apafecha,apahoras,apaestado,aparels,apatipo) select max(apacodigo)+1, @legajo,@dia,@hora,1,@reloj,'A' from tbcasapa
  		end
 	end
end
GO
/****** Object:  StoredProcedure [rionapo].[InsertarEntrada]    Script Date: 10/19/2015 16:18:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [rionapo].[InsertarEntrada]
(@legajo char(12),@dia datetime, @hora char(5),@reloj char(16),@horamin char(5),@horamax char(5)) 
as
begin
if not exists (select * from tbcasapa where apalegajo=@legajo and apafecha =@dia and  apahorae between @horamin and @horamax)
 insert into tbcasapa 
(apacodigo,apalegajo, apafecha,apahorae,apaestado,aparele,apatipo)
select max(apacodigo)+1, @legajo,@dia,@hora,2,@reloj,'A' from tbcasapa
end
GO
/****** Object:  StoredProcedure [rionapo].[VALORTABLA]    Script Date: 10/19/2015 16:18:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*---------------------------------------------------------------------------
                          Lee un valor desde una tabla.
----------------------------------------------------------------------------
RCM 05.dic.01 -Se agrego Codal.
RCM 04.oct.01 -Valor 4 a 15.
RCM 12.jun.01 -Descrip a 40.
RCM 18.ago.00 -Valor4
RCM 20.dic.98 -Incorporacion.
RCM 30.nov.98 -Version inicial.
--------------------------------------------------------------------------*/
CREATE PROCEDURE [rionapo].[VALORTABLA] 
                            @cotab   Int, 
                            @codigo  Int,
                            @Descrip Char(40)  output,
                            @valor   Money         output,
                            @valor2  Money        output,
                            @valor4  Char(15)    output,
                            @codal   Char(10)    output,
                            @valorC Char(200) output
AS
SELECT @Descrip = descrip,
       @valor   = valor,
       @valor2  = valor2,
       @valor4  = valor4,
       @codal  = codal,
       @valorC  = valorC
       FROM Rtablas 
       WHERE cotab = @cotab AND codigo = @codigo
Return
GO
/****** Object:  StoredProcedure [rionapo].[DIAS_TOM]    Script Date: 10/19/2015 16:18:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*---------------------------------------------------------------------------
        Suma los dias Tomados de vacaciones que parten en el mes actual.
----------------------------------------------------------------------------
RCM 23.ago.99 -No considerab las vacaciones multi mes.
RCM 22.abr.99 -Controla fechas Tope.
RCM 21.abr.99 -Version inicial.
--------------------------------------------------------------------------*/
CREATE PROCEDURE [rionapo].[DIAS_TOM]
                 @codigo Char(12),
                 @feini  DateTime,
                 @fefin  DateTime,
                 @dias   Numeric(6,2) output
AS
SELECT @dias = Sum(dias) FROM Rvacaci 
               WHERE      codigo  = @codigo 
                     AND  Feini  >= @feini
                     AND  Feini  <= @fefin
Return
GO
/****** Object:  StoredProcedure [rionapo].[DATOADI]    Script Date: 10/19/2015 16:18:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*---------------------------------------------------------------------------
                          Lee un dato adicional.
----------------------------------------------------------------------------
RCM 20.dic.98 -Incorporacion.
RCM 22.jul.98 -Version inicial.
--------------------------------------------------------------------------*/
CREATE PROCEDURE [rionapo].[DATOADI] @codigo Char(12), 
                         @codcam Int,
                         @valorN Money    output,
                         @valorF DateTime output,
                         @valorC Char(30) output
AS
SELECT  @valorN = valorN,
        @valorF = valorF,
        @valorC = valorC
     FROM  Remplec
     WHERE codigo = @codigo AND codcam = @codcam

Return
GO
/****** Object:  StoredProcedure [rionapo].[BORRAUNO]    Script Date: 10/19/2015 16:18:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*--------------------------------------------------------------------------------------------
                   Borra un emplado desde los Historicos.
----------------------------------------------------------------------------------------------
RCM 03.may.00 -Se elimino RPASIGA.
RCM 28.feb.00 -Rpasiga incluye el Periodo.
RCM 25.ene.00 -Version inicial.
--------------------------------------------------------------------------------------------*/
CREATE PROCEDURE [rionapo].[BORRAUNO]
                            @codigo  Char(12),
                            @ames    Char(6),
                            @peri    Char(1)
AS

  DELETE FROM RLIQUID 
         WHERE Codigo = @codigo AND Ames = @ames AND Peri = @peri
  
  DELETE FROM RESUMEN
         WHERE Codigo = @codigo AND Ames = @ames AND peri = @peri

  DELETE FROM RPASREL
         WHERE Codigo = @codigo AND peri = @peri
GO
/****** Object:  StoredProcedure [rionapo].[PonerSemaforoSQL]    Script Date: 10/19/2015 16:18:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [rionapo].[PonerSemaforoSQL]
 @sema Char(15),
 @resultado Char(1) output
AS
 If Not Exists(Select param
  From rparams
  Where copar = @sema)

  Begin
   Insert Into rparams(Copar,descrip,param)
   Values (@sema,'Semaforo CAS','S')
  
   Select @resultado = 'S'
  End

 Else

 begin
  Update rparams
  Set  param = 'S'
  Where copar = @sema and param = 'N'
    if @@rowcount = 1
      select @resultado = 'S'
    else
      select @resultado = 'N'
    end
GO
/****** Object:  StoredProcedure [rionapo].[PERMISOSQL]    Script Date: 10/19/2015 16:18:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*---------------------------------------------------------------------------
                          Lee un permiso
----------------------------------------------------------------------------
RCM 20.dic.98 -Incorporacion.
RCM 22.jul.98 -Version inicial.
--------------------------------------------------------------------------*/
CREATE PROCEDURE [rionapo].[PERMISOSQL] @codseg   Char(10), 
                            @item     Char(20),
                            @permisos Char(5) output
AS
 SELECT  @permisos = permisos
     FROM  rsegder
     WHERE codseg = @codseg AND item = @item

Return
GO
/****** Object:  StoredProcedure [rionapo].[LiberarSemaforoSQL]    Script Date: 10/19/2015 16:18:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [rionapo].[LiberarSemaforoSQL]
 @sema Char(15)
 AS
  Update rparams
  Set  param = 'N'
  Where copar = @sema
GO
/****** Object:  Default [DF__tbrhucat__catmod__4944D3CA]    Script Date: 10/19/2015 16:18:36 ******/
ALTER TABLE [dbo].[tbrhucat] ADD  DEFAULT (' ') FOR [catmodulo]
GO
/****** Object:  Default [DF__tbrhucat__catnom__4A38F803]    Script Date: 10/19/2015 16:18:36 ******/
ALTER TABLE [dbo].[tbrhucat] ADD  DEFAULT (' ') FOR [catnombre]
GO
/****** Object:  Default [DF__tbrhucat__catcap__4B2D1C3C]    Script Date: 10/19/2015 16:18:36 ******/
ALTER TABLE [dbo].[tbrhucat] ADD  DEFAULT (' ') FOR [catcaption]
GO
/****** Object:  Default [DF__tbrhucat__catdes__4C214075]    Script Date: 10/19/2015 16:18:36 ******/
ALTER TABLE [dbo].[tbrhucat] ADD  DEFAULT (' ') FOR [catdescrip]
GO
/****** Object:  Default [DF__tbrhucat__catfor__4D1564AE]    Script Date: 10/19/2015 16:18:36 ******/
ALTER TABLE [dbo].[tbrhucat] ADD  DEFAULT (' ') FOR [catform]
GO
/****** Object:  Default [DF__tbrhucat__catori__4E0988E7]    Script Date: 10/19/2015 16:18:36 ******/
ALTER TABLE [dbo].[tbrhucat] ADD  DEFAULT (' ') FOR [catoricap]
GO
/****** Object:  Default [DF__tbrhucat__catori__4EFDAD20]    Script Date: 10/19/2015 16:18:36 ******/
ALTER TABLE [dbo].[tbrhucat] ADD  DEFAULT (' ') FOR [catorides]
GO
/****** Object:  Default [DF__tbdocemp__empleg__4297D63B]    Script Date: 10/19/2015 16:18:36 ******/
ALTER TABLE [dbo].[tbdocemp] ADD  DEFAULT (' ') FOR [emplegajo]
GO
/****** Object:  Default [DF__tbdocemp__emptip__438BFA74]    Script Date: 10/19/2015 16:18:36 ******/
ALTER TABLE [dbo].[tbdocemp] ADD  DEFAULT (0) FOR [emptipodoc]
GO
/****** Object:  Default [DF__tbdocemp__empfec__44801EAD]    Script Date: 10/19/2015 16:18:36 ******/
ALTER TABLE [dbo].[tbdocemp] ADD  DEFAULT (getdate()) FOR [empfecha]
GO
/****** Object:  Default [DF__tbdocemp__emparc__457442E6]    Script Date: 10/19/2015 16:18:36 ******/
ALTER TABLE [dbo].[tbdocemp] ADD  DEFAULT (' ') FOR [emparchivo]
GO
/****** Object:  Default [DF__tbdocemp__empcom__4668671F]    Script Date: 10/19/2015 16:18:36 ******/
ALTER TABLE [dbo].[tbdocemp] ADD  DEFAULT (' ') FOR [empcomenta]
GO
/****** Object:  Default [DF__RVACDET__Codigo__407A839F]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RVACDET] ADD  DEFAULT (' ') FOR [Codigo]
GO
/****** Object:  Default [DF__RVACDET__Fecha_a__416EA7D8]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RVACDET] ADD  DEFAULT (getdate()) FOR [Fecha_act]
GO
/****** Object:  Default [DF__RVACDET__Totpen__4262CC11]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RVACDET] ADD  DEFAULT (0) FOR [Totpen]
GO
/****** Object:  Default [DF__RVACDET__PeriPen__4356F04A]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RVACDET] ADD  DEFAULT (' ') FOR [PeriPen]
GO
/****** Object:  Default [DF__RVACDET__Normdev__444B1483]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RVACDET] ADD  DEFAULT (0) FOR [Normdev]
GO
/****** Object:  Default [DF__RVACDET__Normtom__453F38BC]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RVACDET] ADD  DEFAULT (0) FOR [Normtom]
GO
/****** Object:  Default [DF__RVACDET__Propdev__46335CF5]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RVACDET] ADD  DEFAULT (0) FOR [Propdev]
GO
/****** Object:  Default [DF__RVACDET__Proptom__4727812E]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RVACDET] ADD  DEFAULT (0) FOR [Proptom]
GO
/****** Object:  Default [DF__RVACDET__Prgrdev__481BA567]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RVACDET] ADD  DEFAULT (0) FOR [Prgrdev]
GO
/****** Object:  Default [DF__RVACDET__Prgrtom__490FC9A0]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RVACDET] ADD  DEFAULT (0) FOR [Prgrtom]
GO
/****** Object:  Default [DF__RVACDET__Adicdev__4A03EDD9]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RVACDET] ADD  DEFAULT (0) FOR [Adicdev]
GO
/****** Object:  Default [DF__RVACDET__Adictom__4AF81212]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RVACDET] ADD  DEFAULT (0) FOR [Adictom]
GO
/****** Object:  Default [DF__RVACDET__Jdd__4BEC364B]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RVACDET] ADD  DEFAULT (0) FOR [Jdd]
GO
/****** Object:  Default [DF__RVACDET__Dulper__3A8CA01F]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RVACDET] ADD  DEFAULT (0) FOR [Dulper]
GO
/****** Object:  Default [DF__RVACACIG__Numdoc__3F51553C]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RVACACIG] ADD  DEFAULT (0) FOR [Numdoc]
GO
/****** Object:  Default [DF__RVACACIG__Codigo__40457975]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RVACACIG] ADD  DEFAULT (' ') FOR [Codigo]
GO
/****** Object:  Default [DF__RVACACIG__Feini__41399DAE]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RVACACIG] ADD  DEFAULT (getdate()) FOR [Feini]
GO
/****** Object:  Default [DF__RVACACIG__Fefin__422DC1E7]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RVACACIG] ADD  DEFAULT (getdate()) FOR [Fefin]
GO
/****** Object:  Default [DF__RVACACIG__Dias__4321E620]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RVACACIG] ADD  DEFAULT (0) FOR [Dias]
GO
/****** Object:  Default [DF__RVACACIG__Status__44160A59]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RVACACIG] ADD  DEFAULT (' ') FOR [Status]
GO
/****** Object:  Default [DF__RVACACIG__Numrem__450A2E92]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RVACACIG] ADD  DEFAULT (0) FOR [Numrem]
GO
/****** Object:  Default [DF__RVACACIG__Opd__45FE52CB]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RVACACIG] ADD  DEFAULT (0) FOR [Opd]
GO
/****** Object:  Default [DF__RVACACIG__Dmi__46F27704]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RVACACIG] ADD  DEFAULT (0) FOR [Dmi]
GO
/****** Object:  Default [DF__RVACACIG__Dmf__47E69B3D]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RVACACIG] ADD  DEFAULT (0) FOR [Dmf]
GO
/****** Object:  Default [DF__RVACACIG__Ampm__48DABF76]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RVACACIG] ADD  DEFAULT (0) FOR [Ampm]
GO
/****** Object:  Default [DF__RVACACIG__Fecha___49CEE3AF]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RVACACIG] ADD  DEFAULT (getdate()) FOR [Fecha_ret]
GO
/****** Object:  Default [DF__RVACACIG__Motanu__4AC307E8]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RVACACIG] ADD  DEFAULT (' ') FOR [Motanul]
GO
/****** Object:  Default [DF__RVACACIG__Pertom__4BB72C21]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RVACACIG] ADD  DEFAULT (' ') FOR [Pertom]
GO
/****** Object:  Default [DF__RVACACIG__Jdd__4CAB505A]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RVACACIG] ADD  DEFAULT (0) FOR [Jdd]
GO
/****** Object:  Default [DF__RVACACID__Codigo__4F87BD05]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RVACACID] ADD  DEFAULT (' ') FOR [Codigo]
GO
/****** Object:  Default [DF__RVACACID__Dias__507BE13E]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RVACACID] ADD  DEFAULT (0) FOR [Dias]
GO
/****** Object:  Default [DF__RVACACID__Fecha___51700577]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RVACACID] ADD  DEFAULT (getdate()) FOR [Fecha_ini]
GO
/****** Object:  Default [DF__RVACACID__Fecha___526429B0]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RVACACID] ADD  DEFAULT (getdate()) FOR [Fecha_fin]
GO
/****** Object:  Default [DF__RVACACID__Tipo__53584DE9]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RVACACID] ADD  DEFAULT (' ') FOR [Tipo]
GO
/****** Object:  Default [DF__RVACACID__Descri__544C7222]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RVACACID] ADD  DEFAULT (' ') FOR [Descrip]
GO
/****** Object:  Default [DF__RVACACID__Nro__5540965B]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RVACACID] ADD  DEFAULT (0) FOR [Nro]
GO
/****** Object:  Default [DF__RVACACID__Jdd__5634BA94]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RVACACID] ADD  DEFAULT (0) FOR [Jdd]
GO
/****** Object:  Default [DF__RVACACI__Numdoc__00AA174D]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RVACACI] ADD  DEFAULT (0) FOR [Numdoc]
GO
/****** Object:  Default [DF__RVACACI__Codigo__019E3B86]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RVACACI] ADD  DEFAULT (' ') FOR [Codigo]
GO
/****** Object:  Default [DF__RVACACI__Feini__02925FBF]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RVACACI] ADD  DEFAULT (getdate()) FOR [Feini]
GO
/****** Object:  Default [DF__RVACACI__Fefin__038683F8]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RVACACI] ADD  DEFAULT (getdate()) FOR [Fefin]
GO
/****** Object:  Default [DF__RVACACI__Dias__047AA831]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RVACACI] ADD  DEFAULT (0) FOR [Dias]
GO
/****** Object:  Default [DF__RVACACI__Status__056ECC6A]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RVACACI] ADD  DEFAULT (' ') FOR [Status]
GO
/****** Object:  Default [DF__RVACACI__Numrem__0662F0A3]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RVACACI] ADD  DEFAULT (0) FOR [Numrem]
GO
/****** Object:  Default [DF__RVACACI__Opd__075714DC]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RVACACI] ADD  DEFAULT (0) FOR [Opd]
GO
/****** Object:  Default [DF__RVACACI__Dmi__084B3915]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RVACACI] ADD  DEFAULT (0) FOR [Dmi]
GO
/****** Object:  Default [DF__RVACACI__Dmf__093F5D4E]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RVACACI] ADD  DEFAULT (0) FOR [Dmf]
GO
/****** Object:  Default [DF__RVACACI__Ampm__0A338187]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RVACACI] ADD  DEFAULT (0) FOR [Ampm]
GO
/****** Object:  Default [DF__RVACACI__Jdd__0B27A5C0]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RVACACI] ADD  DEFAULT (0) FOR [Jdd]
GO
/****** Object:  Default [DF__RVACACI__Motanul__3CDEFCE5]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RVACACI] ADD  DEFAULT (' ') FOR [Motanul]
GO
/****** Object:  Default [DF__RVACACI__fecha_r__3DD3211E]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RVACACI] ADD  DEFAULT (' ') FOR [fecha_ret]
GO
/****** Object:  Default [DF__RVACACI__Pertom__3EC74557]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RVACACI] ADD  DEFAULT (' ') FOR [Pertom]
GO
/****** Object:  Default [DF__RVACACI__fecha_d__5B4E756C]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RVACACI] ADD  DEFAULT (' ') FOR [fecha_dat]
GO
/****** Object:  Default [DF__RVACACI__usuario__5C4299A5]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RVACACI] ADD  DEFAULT (' ') FOR [usuario]
GO
/****** Object:  Default [DF__RVACACI__Fecha_u__5D36BDDE]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RVACACI] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(120)),(120))) FOR [Fecha_ult]
GO
/****** Object:  Default [DF__RUSUARIOS__jdd__1C0818FF]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RUSUARIOS] ADD  DEFAULT (0) FOR [jdd]
GO
/****** Object:  Default [DF__RUSUARIOS__Usuar__1CFC3D38]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RUSUARIOS] ADD  DEFAULT (' ') FOR [Usuario]
GO
/****** Object:  Default [DF__RUSUARIOS__Estad__1DF06171]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RUSUARIOS] ADD  DEFAULT (' ') FOR [Estado]
GO
/****** Object:  Default [DF__RUSUARIOS__Descr__1EE485AA]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RUSUARIOS] ADD  DEFAULT (' ') FOR [Descrip]
GO
/****** Object:  Default [DF__RUSUARIOS__Dato__1FD8A9E3]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RUSUARIOS] ADD  DEFAULT (' ') FOR [Dato]
GO
/****** Object:  Default [DF__RUSUARIOS__Histo__20CCCE1C]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RUSUARIOS] ADD  DEFAULT (' ') FOR [Historia]
GO
/****** Object:  Default [DF__RUSUARIOS__Fecha__21C0F255]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RUSUARIOS] ADD  DEFAULT (getdate()) FOR [Fecha_exp]
GO
/****** Object:  Default [DF__RUSUARIOS__perfi__22B5168E]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RUSUARIOS] ADD  DEFAULT (' ') FOR [perfil]
GO
/****** Object:  Default [DF__RUSUARIOS__mail__23A93AC7]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RUSUARIOS] ADD  DEFAULT (' ') FOR [mail]
GO
/****** Object:  Default [DF__RUSUARIOS__Empre__249D5F00]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RUSUARIOS] ADD  DEFAULT (' ') FOR [Empresa]
GO
/****** Object:  Default [DF__RUSUARIOS__Ubica__25918339]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RUSUARIOS] ADD  DEFAULT (0) FOR [Ubica]
GO
/****** Object:  Default [DF__RUSUARIOS__Inten__7B313519]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RUSUARIOS] ADD  DEFAULT (0) FOR [Intentos]
GO
/****** Object:  Default [DF__RUSUARIOS__Sele__7C255952]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RUSUARIOS] ADD  DEFAULT (' ') FOR [Sele]
GO
/****** Object:  Default [DF__RUSUARIOS__Antig__7D197D8B]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RUSUARIOS] ADD  DEFAULT (' ') FOR [Antig]
GO
/****** Object:  Default [DF__RUSUARIOI__jdd__286DEFE4]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RUSUARIOI] ADD  DEFAULT (0) FOR [jdd]
GO
/****** Object:  Default [DF__RUSUARIOI__Usuar__2962141D]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RUSUARIOI] ADD  DEFAULT (' ') FOR [Usuario]
GO
/****** Object:  Default [DF__RUSUARIOI__Inten__2A563856]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RUSUARIOI] ADD  DEFAULT (0) FOR [Intentos]
GO
/****** Object:  Default [DF__RUSUARIO__Usuari__4CF5691D]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RUSUARIO] ADD  DEFAULT (' ') FOR [Usuario]
GO
/****** Object:  Default [DF__RUSUARIO__Descri__4DE98D56]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RUSUARIO] ADD  DEFAULT (' ') FOR [Descrip]
GO
/****** Object:  Default [DF__RUSUARIO__Dato__4EDDB18F]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RUSUARIO] ADD  DEFAULT (' ') FOR [Dato]
GO
/****** Object:  Default [DF__RUSUARIO__Condic__4FD1D5C8]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RUSUARIO] ADD  DEFAULT (' ') FOR [Condicion]
GO
/****** Object:  Default [DF__RUSUARIO__Estado__50C5FA01]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RUSUARIO] ADD  DEFAULT (' ') FOR [Estado]
GO
/****** Object:  Default [DF__RUSUARIO__DescCo__51BA1E3A]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RUSUARIO] ADD  DEFAULT (' ') FOR [DescCond]
GO
/****** Object:  Default [DF__RUSUARIO__Codigo__52AE4273]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RUSUARIO] ADD  DEFAULT (' ') FOR [Codigo]
GO
/****** Object:  Default [DF__RUSUARIO__Dato2__53A266AC]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RUSUARIO] ADD  DEFAULT (' ') FOR [Dato2]
GO
/****** Object:  Default [DF__RUSUARIO__Histor__54968AE5]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RUSUARIO] ADD  DEFAULT (' ') FOR [Histori]
GO
/****** Object:  Default [DF__RUSUARIO__Ngrab__558AAF1E]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RUSUARIO] ADD  DEFAULT (0) FOR [Ngrab]
GO
/****** Object:  Default [DF__RUSUARIO__Tie__567ED357]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RUSUARIO] ADD  DEFAULT (' ') FOR [Tie]
GO
/****** Object:  Default [DF__RUSUARIO__Jdd__5772F790]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RUSUARIO] ADD  DEFAULT (0) FOR [Jdd]
GO
/****** Object:  Default [DF__RUNICAR__Empresa__43F60EC8]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RUNICAR] ADD  DEFAULT (' ') FOR [Empresa]
GO
/****** Object:  Default [DF__RUNICAR__Unidad__44EA3301]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RUNICAR] ADD  DEFAULT (0) FOR [Unidad]
GO
/****** Object:  Default [DF__RUNICAR__Cargo__45DE573A]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RUNICAR] ADD  DEFAULT (0) FOR [Cargo]
GO
/****** Object:  Default [DF__RUNICAR__vacan__46D27B73]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RUNICAR] ADD  DEFAULT (0) FOR [vacan]
GO
/****** Object:  Default [DF__RUNICAR__Dotacio__47C69FAC]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RUNICAR] ADD  DEFAULT (0) FOR [Dotacion]
GO
/****** Object:  Default [DF__RUNICAR__Jdd__48BAC3E5]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RUNICAR] ADD  DEFAULT (0) FOR [Jdd]
GO
/****** Object:  Default [DF__RULTSEL__Jdd__5B988E2F]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RULTSEL] ADD  DEFAULT (0) FOR [Jdd]
GO
/****** Object:  Default [DF__RULTSEL__jdato__5C8CB268]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RULTSEL] ADD  DEFAULT (' ') FOR [jdato]
GO
/****** Object:  Default [DF__RULTSEL__Usuario__5D80D6A1]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RULTSEL] ADD  DEFAULT (' ') FOR [Usuario]
GO
/****** Object:  Default [DF__RULTSEL__Codigo__5E74FADA]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RULTSEL] ADD  DEFAULT (' ') FOR [Codigo]
GO
/****** Object:  Default [DF__RULTSEL__rut__7A3D10E0]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RULTSEL] ADD  DEFAULT (' ') FOR [rut]
GO
/****** Object:  Default [DF__RULTIMOS__Copar__4E298478]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RULTIMOS] ADD  DEFAULT (' ') FOR [Copar]
GO
/****** Object:  Default [DF__RULTIMOS__Descri__4F1DA8B1]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RULTIMOS] ADD  DEFAULT (' ') FOR [Descrip]
GO
/****** Object:  Default [DF__RULTIMOS__Param__5011CCEA]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RULTIMOS] ADD  DEFAULT (' ') FOR [Param]
GO
/****** Object:  Default [DF__RULTIMOS__Ngrab__5105F123]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RULTIMOS] ADD  DEFAULT (0) FOR [Ngrab]
GO
/****** Object:  Default [DF__RULTIMOS__Paradi__51FA155C]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RULTIMOS] ADD  DEFAULT (' ') FOR [Paradi]
GO
/****** Object:  Default [DF__RTRAPRO__Cod_pro__2724C5F0]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RTRAPRO] ADD  DEFAULT (0) FOR [Cod_pro]
GO
/****** Object:  Default [DF__RTRAPRO__Descrip__2818EA29]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RTRAPRO] ADD  DEFAULT (' ') FOR [Descrip]
GO
/****** Object:  Default [DF__RTRAPRO__Valor__290D0E62]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RTRAPRO] ADD  DEFAULT (0) FOR [Valor]
GO
/****** Object:  Default [DF__RTRAPRO__Unidad__2A01329B]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RTRAPRO] ADD  DEFAULT (' ') FOR [Unidad]
GO
/****** Object:  Default [DF__RTRAPRO__Cohade__2AF556D4]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RTRAPRO] ADD  DEFAULT (' ') FOR [Cohade]
GO
/****** Object:  Default [DF__RTRAPRO__Jdd__2BE97B0D]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RTRAPRO] ADD  DEFAULT (0) FOR [Jdd]
GO
/****** Object:  Default [DF__RTRAMOV__Codigo__2EC5E7B8]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RTRAMOV] ADD  DEFAULT (' ') FOR [Codigo]
GO
/****** Object:  Default [DF__RTRAMOV__Numcom__2FBA0BF1]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RTRAMOV] ADD  DEFAULT (0) FOR [Numcom]
GO
/****** Object:  Default [DF__RTRAMOV__Ames__30AE302A]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RTRAMOV] ADD  DEFAULT (' ') FOR [Ames]
GO
/****** Object:  Default [DF__RTRAMOV__fecha_t__31A25463]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RTRAMOV] ADD  DEFAULT (getdate()) FOR [fecha_tra]
GO
/****** Object:  Default [DF__RTRAMOV__Cod_pro__3296789C]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RTRAMOV] ADD  DEFAULT (0) FOR [Cod_pro]
GO
/****** Object:  Default [DF__RTRAMOV__Cantid__338A9CD5]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RTRAMOV] ADD  DEFAULT (0) FOR [Cantid]
GO
/****** Object:  Default [DF__RTRAMOV__ValUni__347EC10E]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RTRAMOV] ADD  DEFAULT (0) FOR [ValUni]
GO
/****** Object:  Default [DF__RTRAMOV__Cohade__3572E547]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RTRAMOV] ADD  DEFAULT (' ') FOR [Cohade]
GO
/****** Object:  Default [DF__RTRAMOV__Cencos__36670980]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RTRAMOV] ADD  DEFAULT (0) FOR [Cencos]
GO
/****** Object:  Default [DF__RTRAMOV__Jdd__375B2DB9]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RTRAMOV] ADD  DEFAULT (0) FOR [Jdd]
GO
/****** Object:  Default [DF__RTEMPLATE__Codig__5FF32EF8]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RTEMPLATES] ADD  DEFAULT (' ') FOR [Codigo]
GO
/****** Object:  Default [DF__RTEMPLATES__Tipo__60E75331]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RTEMPLATES] ADD  DEFAULT (0) FOR [Tipo]
GO
/****** Object:  Default [DF__RTEMPLATE__Fecha__61DB776A]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RTEMPLATES] ADD  DEFAULT (getdate()) FOR [Fecha_cre]
GO
/****** Object:  Default [DF__RTEMPLATE__Fecha__62CF9BA3]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RTEMPLATES] ADD  DEFAULT (getdate()) FOR [Fecha_mod]
GO
/****** Object:  Default [DF__RTEMPLATE__Descr__63C3BFDC]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RTEMPLATES] ADD  DEFAULT (' ') FOR [Descrip]
GO
/****** Object:  Default [DF__RTEMPLATE__Templ__64B7E415]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RTEMPLATES] ADD  DEFAULT (' ') FOR [Template]
GO
/****** Object:  Default [DF__RTEMPLATES__Jdd__65AC084E]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RTEMPLATES] ADD  DEFAULT (0) FOR [Jdd]
GO
/****** Object:  Default [DF__RTEMPLATE__Forma__74B941B4]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RTEMPLATES] ADD  DEFAULT ('H') FOR [Formato]
GO
/****** Object:  Default [DF__RTABLAS__Tipo__47DBAE45]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RTABLAS] ADD  DEFAULT (' ') FOR [Tipo]
GO
/****** Object:  Default [DF__RTABLAS__Cotab__48CFD27E]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RTABLAS] ADD  DEFAULT (0) FOR [Cotab]
GO
/****** Object:  Default [DF__RTABLAS__Codigo__49C3F6B7]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RTABLAS] ADD  DEFAULT (0) FOR [Codigo]
GO
/****** Object:  Default [DF__RTABLAS__Descrip__4AB81AF0]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RTABLAS] ADD  DEFAULT (' ') FOR [Descrip]
GO
/****** Object:  Default [DF__RTABLAS__Valor__4BAC3F29]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RTABLAS] ADD  DEFAULT (0) FOR [Valor]
GO
/****** Object:  Default [DF__RTABLAS__Valor2__4CA06362]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RTABLAS] ADD  DEFAULT (0) FOR [Valor2]
GO
/****** Object:  Default [DF__RTABLAS__ValorC__4D94879B]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RTABLAS] ADD  DEFAULT (' ') FOR [ValorC]
GO
/****** Object:  Default [DF__RTABLAS__Valor4__4E88ABD4]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RTABLAS] ADD  DEFAULT (' ') FOR [Valor4]
GO
/****** Object:  Default [DF__RTABLAS__CodAl__4F7CD00D]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RTABLAS] ADD  DEFAULT (' ') FOR [CodAl]
GO
/****** Object:  Default [DF__RTABLAS__Jdd__5070F446]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RTABLAS] ADD  DEFAULT (0) FOR [Jdd]
GO
/****** Object:  Default [DF__RTABLAS__ValorG__37B03374]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RTABLAS] ADD  DEFAULT ('') FOR [ValorG]
GO
/****** Object:  Default [DF__RSOLPEN__Codigo__17786E0C]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RSOLPEN] ADD  DEFAULT (' ') FOR [Codigo]
GO
/****** Object:  Default [DF__RSOLPEN__Tipo__186C9245]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RSOLPEN] ADD  DEFAULT (0) FOR [Tipo]
GO
/****** Object:  Default [DF__RSOLPEN__Nusol__1960B67E]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RSOLPEN] ADD  DEFAULT (0) FOR [Nusol]
GO
/****** Object:  Default [DF__RSOLPEN__Fecha_s__1A54DAB7]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RSOLPEN] ADD  DEFAULT (getdate()) FOR [Fecha_sol]
GO
/****** Object:  Default [DF__RSOLPEN__Estado__1B48FEF0]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RSOLPEN] ADD  DEFAULT (0) FOR [Estado]
GO
/****** Object:  Default [DF__RSOLPEN__Fecha_t__1C3D2329]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RSOLPEN] ADD  DEFAULT (getdate()) FOR [Fecha_ter]
GO
/****** Object:  Default [DF__RSOLPEN__Detalle__1D314762]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RSOLPEN] ADD  DEFAULT (' ') FOR [Detalle]
GO
/****** Object:  Default [DF__RSOLPEN__Params__1E256B9B]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RSOLPEN] ADD  DEFAULT (' ') FOR [Params]
GO
/****** Object:  Default [DF__RSOLPEN__Priori__1F198FD4]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RSOLPEN] ADD  DEFAULT (' ') FOR [Priori]
GO
/****** Object:  Default [DF__RSOLPEN__Jefe__200DB40D]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RSOLPEN] ADD  DEFAULT (' ') FOR [Jefe]
GO
/****** Object:  Default [DF__RSOLPEN__Obs__2101D846]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RSOLPEN] ADD  DEFAULT (' ') FOR [Obs]
GO
/****** Object:  Default [DF__RSOLPEN__Jdd__21F5FC7F]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RSOLPEN] ADD  DEFAULT (0) FOR [Jdd]
GO
/****** Object:  Default [DF__RSOLICI__Codigo__76818E95]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RSOLICI] ADD  DEFAULT (' ') FOR [Codigo]
GO
/****** Object:  Default [DF__RSOLICI__Tipo__7775B2CE]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RSOLICI] ADD  DEFAULT (0) FOR [Tipo]
GO
/****** Object:  Default [DF__RSOLICI__Fecha_i__7869D707]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RSOLICI] ADD  DEFAULT (getdate()) FOR [Fecha_ini]
GO
/****** Object:  Default [DF__RSOLICI__Estado__795DFB40]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RSOLICI] ADD  DEFAULT (0) FOR [Estado]
GO
/****** Object:  Default [DF__RSOLICI__Fecha_t__7A521F79]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RSOLICI] ADD  DEFAULT (getdate()) FOR [Fecha_ter]
GO
/****** Object:  Default [DF__RSOLICI__Detalle__7B4643B2]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RSOLICI] ADD  DEFAULT (' ') FOR [Detalle]
GO
/****** Object:  Default [DF__RSOLICI__Jdd__7C3A67EB]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RSOLICI] ADD  DEFAULT (0) FOR [Jdd]
GO
/****** Object:  Default [DF__RSEGGRUP__Grupo__46486B8E]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RSEGGRUP] ADD  DEFAULT (' ') FOR [Grupo]
GO
/****** Object:  Default [DF__RSEGGRUP__Nombre__473C8FC7]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RSEGGRUP] ADD  DEFAULT (' ') FOR [Nombre]
GO
/****** Object:  Default [DF__RSEGGRUP__Empres__4830B400]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RSEGGRUP] ADD  DEFAULT (' ') FOR [Empresas]
GO
/****** Object:  Default [DF__RSEGGRUP__Ngrab__4924D839]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RSEGGRUP] ADD  DEFAULT (0) FOR [Ngrab]
GO
/****** Object:  Default [DF__RSEGGRUP__Jdd__4A18FC72]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RSEGGRUP] ADD  DEFAULT (0) FOR [Jdd]
GO
/****** Object:  Default [DF__RSEGDER__Codseg__3CBF0154]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RSEGDER] ADD  DEFAULT (' ') FOR [Codseg]
GO
/****** Object:  Default [DF__RSEGDER__Item__3DB3258D]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RSEGDER] ADD  DEFAULT (' ') FOR [Item]
GO
/****** Object:  Default [DF__RSEGDER__Tipo__3EA749C6]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RSEGDER] ADD  DEFAULT (' ') FOR [Tipo]
GO
/****** Object:  Default [DF__RSEGDER__Stipo__3F9B6DFF]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RSEGDER] ADD  DEFAULT (' ') FOR [Stipo]
GO
/****** Object:  Default [DF__RSEGDER__Permiso__408F9238]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RSEGDER] ADD  DEFAULT (' ') FOR [Permisos]
GO
/****** Object:  Default [DF__RSEGDER__Ngrab__4183B671]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RSEGDER] ADD  DEFAULT (' ') FOR [Ngrab]
GO
/****** Object:  Default [DF__RSEGDER__Tie__4277DAAA]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RSEGDER] ADD  DEFAULT (' ') FOR [Tie]
GO
/****** Object:  Default [DF__RSEGDER__Jdd__436BFEE3]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RSEGDER] ADD  DEFAULT (0) FOR [Jdd]
GO
/****** Object:  Default [DF__RROTULOS__Campo__58520D30]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RROTULOS] ADD  DEFAULT (' ') FOR [Campo]
GO
/****** Object:  Default [DF__RROTULOS__Alias__59463169]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RROTULOS] ADD  DEFAULT (' ') FOR [Alias]
GO
/****** Object:  Default [DF__RROTULOS__Clasif__5A3A55A2]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RROTULOS] ADD  DEFAULT (' ') FOR [Clasif]
GO
/****** Object:  Default [DF__RROTULOS__Rotulo__5B2E79DB]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RROTULOS] ADD  DEFAULT (' ') FOR [Rotulo]
GO
/****** Object:  Default [DF__RROTULOS__Descri__5C229E14]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RROTULOS] ADD  DEFAULT (' ') FOR [Descrip]
GO
/****** Object:  Default [DF__RROTULOS__Jdd__5D16C24D]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RROTULOS] ADD  DEFAULT (0) FOR [Jdd]
GO
/****** Object:  Default [DF__RRECIBOS__Codigo__713DB68B]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RRECIBOS] ADD  DEFAULT (' ') FOR [Codigo]
GO
/****** Object:  Default [DF__RRECIBOS__Ames__7231DAC4]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RRECIBOS] ADD  DEFAULT (' ') FOR [Ames]
GO
/****** Object:  Default [DF__RRECIBOS__Peri__7325FEFD]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RRECIBOS] ADD  DEFAULT (' ') FOR [Peri]
GO
/****** Object:  Default [DF__RRECIBOS__Recibo__741A2336]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RRECIBOS] ADD  DEFAULT (0x00) FOR [Recibo]
GO
/****** Object:  Default [DF__RRECIBOS__Usu_cr__750E476F]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RRECIBOS] ADD  DEFAULT (' ') FOR [Usu_cre]
GO
/****** Object:  Default [DF__RRECIBOS__Fecha___76026BA8]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RRECIBOS] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [Fecha_cre]
GO
/****** Object:  Default [DF__RRECIBOS__Firman__76F68FE1]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RRECIBOS] ADD  DEFAULT (' ') FOR [Firmante]
GO
/****** Object:  Default [DF__RRECIBOS__Fecha___77EAB41A]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RRECIBOS] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [Fecha_fir]
GO
/****** Object:  Default [DF__RRECIBOS__Fecha___78DED853]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RRECIBOS] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [Fecha_epr]
GO
/****** Object:  Default [DF__RRECIBOS__IP_fir__79D2FC8C]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RRECIBOS] ADD  DEFAULT (' ') FOR [IP_fir]
GO
/****** Object:  Default [DF__RRECIBOS__Obs__7AC720C5]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RRECIBOS] ADD  DEFAULT (' ') FOR [Obs]
GO
/****** Object:  Default [DF__RRECIBOS__Jdd__7BBB44FE]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RRECIBOS] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__RPUBLICA__RUT__0E7913B7]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RPUBLICA] ADD  DEFAULT (' ') FOR [RUT]
GO
/****** Object:  Default [DF__RPUBLICA__titulo__0F6D37F0]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RPUBLICA] ADD  DEFAULT (' ') FOR [titulo]
GO
/****** Object:  Default [DF__RPUBLICA__autore__10615C29]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RPUBLICA] ADD  DEFAULT (' ') FOR [autores]
GO
/****** Object:  Default [DF__RPUBLICA__anhio__11558062]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RPUBLICA] ADD  DEFAULT (0) FOR [anhio]
GO
/****** Object:  Default [DF__RPUBLICA__fecha__1249A49B]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RPUBLICA] ADD  DEFAULT (getdate()) FOR [fecha]
GO
/****** Object:  Default [DF__RPUBLICA__revlib__133DC8D4]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RPUBLICA] ADD  DEFAULT (' ') FOR [revlibeve]
GO
/****** Object:  Default [DF__RPUBLICA__capitu__1431ED0D]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RPUBLICA] ADD  DEFAULT (' ') FOR [capitulo]
GO
/****** Object:  Default [DF__RPUBLICA__pagina__15261146]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RPUBLICA] ADD  DEFAULT (' ') FOR [paginas]
GO
/****** Object:  Default [DF__RPUBLICA__clave__161A357F]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RPUBLICA] ADD  DEFAULT (' ') FOR [clave]
GO
/****** Object:  Default [DF__RPUBLICA__isbn__170E59B8]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RPUBLICA] ADD  DEFAULT (' ') FOR [isbn]
GO
/****** Object:  Default [DF__RPUBLICA__editor__18027DF1]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RPUBLICA] ADD  DEFAULT (' ') FOR [editores]
GO
/****** Object:  Default [DF__RPUBLICA__editor__18F6A22A]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RPUBLICA] ADD  DEFAULT (' ') FOR [editorial]
GO
/****** Object:  Default [DF__RPUBLICA__lugar__19EAC663]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RPUBLICA] ADD  DEFAULT (' ') FOR [lugar]
GO
/****** Object:  Default [DF__RPUBLICA__tipo__1ADEEA9C]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RPUBLICA] ADD  DEFAULT (0) FOR [tipo]
GO
/****** Object:  Default [DF__RPUBLICA__Fecha___1BD30ED5]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RPUBLICA] ADD  DEFAULT (getdate()) FOR [Fecha_mod]
GO
/****** Object:  Default [DF__RPUBLICA__observ__1CC7330E]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RPUBLICA] ADD  DEFAULT (' ') FOR [observ]
GO
/****** Object:  Default [DF__RPUBLICA__vobo__1DBB5747]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RPUBLICA] ADD  DEFAULT (0) FOR [vobo]
GO
/****** Object:  Default [DF__RPUBLICA__usrvob__1EAF7B80]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RPUBLICA] ADD  DEFAULT (' ') FOR [usrvobo]
GO
/****** Object:  Default [DF__RPROGRL__Codigo__2E90DD8E]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RPROGRL] ADD  DEFAULT (' ') FOR [Codigo]
GO
/****** Object:  Default [DF__RPROGRL__Ames__2F8501C7]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RPROGRL] ADD  DEFAULT (' ') FOR [Ames]
GO
/****** Object:  Default [DF__RPROGRL__EMPRESA__30792600]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RPROGRL] ADD  DEFAULT (' ') FOR [EMPRESA]
GO
/****** Object:  Default [DF__RPROGRL__CENCOS__316D4A39]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RPROGRL] ADD  DEFAULT (0) FOR [CENCOS]
GO
/****** Object:  Default [DF__RPROGRL__DIAS__32616E72]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RPROGRL] ADD  DEFAULT (0) FOR [DIAS]
GO
/****** Object:  Default [DF__RPROGRL__MONTO__335592AB]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RPROGRL] ADD  DEFAULT (0) FOR [MONTO]
GO
/****** Object:  Default [DF__RPROGRL__BASE__3449B6E4]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RPROGRL] ADD  DEFAULT (0) FOR [BASE]
GO
/****** Object:  Default [DF__RPROGRL__DIASP__353DDB1D]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RPROGRL] ADD  DEFAULT (0) FOR [DIASP]
GO
/****** Object:  Default [DF__RPROGRL__PORCEN__3631FF56]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RPROGRL] ADD  DEFAULT (0) FOR [PORCEN]
GO
/****** Object:  Default [DF__RPREUNI__Empresa__3C54ED00]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RPREUNI] ADD  DEFAULT (' ') FOR [Empresa]
GO
/****** Object:  Default [DF__RPREUNI__Unidad__3D491139]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RPREUNI] ADD  DEFAULT (0) FOR [Unidad]
GO
/****** Object:  Default [DF__RPREUNI__Depe__3E3D3572]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RPREUNI] ADD  DEFAULT (' ') FOR [Depe]
GO
/****** Object:  Default [DF__RPREUNI__Codres__3F3159AB]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RPREUNI] ADD  DEFAULT (' ') FOR [Codres]
GO
/****** Object:  Default [DF__RPREUNI__nivel__40257DE4]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RPREUNI] ADD  DEFAULT (' ') FOR [nivel]
GO
/****** Object:  Default [DF__RPREUNI__Jdd__4119A21D]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RPREUNI] ADD  DEFAULT (0) FOR [Jdd]
GO
/****** Object:  Default [DF__RPLANCU__Codplan__0ABD916C]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RPLANCU] ADD  DEFAULT (0) FOR [Codplan]
GO
/****** Object:  Default [DF__RPLANCU__Cohade__0BB1B5A5]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RPLANCU] ADD  DEFAULT (' ') FOR [Cohade]
GO
/****** Object:  Default [DF__RPLANCU__PerEsqD__0CA5D9DE]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RPLANCU] ADD  DEFAULT (0) FOR [PerEsqD]
GO
/****** Object:  Default [DF__RPLANCU__PerEsqC__0D99FE17]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RPLANCU] ADD  DEFAULT (0) FOR [PerEsqC]
GO
/****** Object:  Default [DF__RPLANCU__PerDato__0E8E2250]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RPLANCU] ADD  DEFAULT (' ') FOR [PerDato]
GO
/****** Object:  Default [DF__RPLANCU__PerDato__0F824689]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RPLANCU] ADD  DEFAULT (' ') FOR [PerDato2]
GO
/****** Object:  Default [DF__RPLANCU__DiaEsqD__10766AC2]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RPLANCU] ADD  DEFAULT (0) FOR [DiaEsqD]
GO
/****** Object:  Default [DF__RPLANCU__DiaEsqC__116A8EFB]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RPLANCU] ADD  DEFAULT (0) FOR [DiaEsqC]
GO
/****** Object:  Default [DF__RPLANCU__DiaDato__125EB334]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RPLANCU] ADD  DEFAULT (' ') FOR [DiaDato]
GO
/****** Object:  Default [DF__RPLANCU__DiaDato__1352D76D]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RPLANCU] ADD  DEFAULT (' ') FOR [DiaDato2]
GO
/****** Object:  Default [DF__RPLANCU__Fuera__1446FBA6]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RPLANCU] ADD  DEFAULT (' ') FOR [Fuera]
GO
/****** Object:  Default [DF__RPLANCU__Jdd__153B1FDF]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RPLANCU] ADD  DEFAULT (0) FOR [Jdd]
GO
/****** Object:  Default [DF__RPLANCU__CUENTAS__7740A8A4]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RPLANCU] ADD  DEFAULT (' ') FOR [CUENTAS]
GO
/****** Object:  Default [DF__RPLAING__Usuario__3A379A64]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RPLAING] ADD  DEFAULT (' ') FOR [Usuario]
GO
/****** Object:  Default [DF__RPLAING__Fecha__3B2BBE9D]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RPLAING] ADD  DEFAULT (getdate()) FOR [Fecha]
GO
/****** Object:  Default [DF__RPLAING__Cencos__3C1FE2D6]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RPLAING] ADD  DEFAULT (0) FOR [Cencos]
GO
/****** Object:  Default [DF__RPLAING__Codigo__3D14070F]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RPLAING] ADD  DEFAULT (' ') FOR [Codigo]
GO
/****** Object:  Default [DF__RPLAING__Cohade__3E082B48]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RPLAING] ADD  DEFAULT (' ') FOR [Cohade]
GO
/****** Object:  Default [DF__RPLAING__Monto__3EFC4F81]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RPLAING] ADD  DEFAULT (0) FOR [Monto]
GO
/****** Object:  Default [DF__RPLAING__Jdd__3FF073BA]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RPLAING] ADD  DEFAULT (0) FOR [Jdd]
GO
/****** Object:  Default [DF__RPERFILES__Jdd__5911273F]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RPERFILES] ADD  DEFAULT (0) FOR [Jdd]
GO
/****** Object:  Default [DF__RPERFILES__Perfi__5A054B78]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RPERFILES] ADD  DEFAULT (' ') FOR [Perfil]
GO
/****** Object:  Default [DF__RPERFILES__Descr__5AF96FB1]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RPERFILES] ADD  DEFAULT (' ') FOR [Descrip]
GO
/****** Object:  Default [DF__RPERFILES__Dato__5BED93EA]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RPERFILES] ADD  DEFAULT (' ') FOR [Dato]
GO
/****** Object:  Default [DF__RPAUSER__Usuario__1BFD2C07]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RPAUSER] ADD  DEFAULT (' ') FOR [Usuario]
GO
/****** Object:  Default [DF__RPAUSER__Copar__1CF15040]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RPAUSER] ADD  DEFAULT (' ') FOR [Copar]
GO
/****** Object:  Default [DF__RPAUSER__Descrip__1DE57479]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RPAUSER] ADD  DEFAULT (' ') FOR [Descrip]
GO
/****** Object:  Default [DF__RPAUSER__Param__1ED998B2]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RPAUSER] ADD  DEFAULT (' ') FOR [Param]
GO
/****** Object:  Default [DF__RPAUSER__Jdd__1FCDBCEB]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RPAUSER] ADD  DEFAULT (0) FOR [Jdd]
GO
/****** Object:  Default [DF__RPASREL__Codigo__28F7FFC9]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RPASREL] ADD  DEFAULT (' ') FOR [Codigo]
GO
/****** Object:  Default [DF__RPASREL__Ames__29EC2402]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RPASREL] ADD  DEFAULT (' ') FOR [Ames]
GO
/****** Object:  Default [DF__RPASREL__Empresa__2AE0483B]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RPASREL] ADD  DEFAULT (' ') FOR [Empresa]
GO
/****** Object:  Default [DF__RPASREL__Peri__2BD46C74]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RPASREL] ADD  DEFAULT (' ') FOR [Peri]
GO
/****** Object:  Default [DF__RPASREL__Afecto__2CC890AD]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RPASREL] ADD  DEFAULT (0) FOR [Afecto]
GO
/****** Object:  Default [DF__RPASREL__Impuest__2DBCB4E6]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RPASREL] ADD  DEFAULT (0) FOR [Impuesto]
GO
/****** Object:  Default [DF__RPASREL__Afp__2EB0D91F]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RPASREL] ADD  DEFAULT (0) FOR [Afp]
GO
/****** Object:  Default [DF__RPASREL__Isapre__2FA4FD58]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RPASREL] ADD  DEFAULT (0) FOR [Isapre]
GO
/****** Object:  Default [DF__RPASREL__Ktim__30992191]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RPASREL] ADD  DEFAULT (0) FOR [Ktim]
GO
/****** Object:  Default [DF__RPASREL__Factor__318D45CA]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RPASREL] ADD  DEFAULT (0) FOR [Factor]
GO
/****** Object:  Default [DF__RPASREL__ScTafe__32816A03]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RPASREL] ADD  DEFAULT (0) FOR [ScTafe]
GO
/****** Object:  Default [DF__RPASREL__ScTmon__33758E3C]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RPASREL] ADD  DEFAULT (0) FOR [ScTmon]
GO
/****** Object:  Default [DF__RPASREL__ScEafe__3469B275]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RPASREL] ADD  DEFAULT (0) FOR [ScEafe]
GO
/****** Object:  Default [DF__RPASREL__ScEmon__355DD6AE]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RPASREL] ADD  DEFAULT (0) FOR [ScEmon]
GO
/****** Object:  Default [DF__RPASREL__ScIafe__3651FAE7]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RPASREL] ADD  DEFAULT (0) FOR [ScIafe]
GO
/****** Object:  Default [DF__RPASREL__ScImon__37461F20]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RPASREL] ADD  DEFAULT (0) FOR [ScImon]
GO
/****** Object:  Default [DF__RPASREL__Jdd__383A4359]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RPASREL] ADD  DEFAULT (0) FOR [Jdd]
GO
/****** Object:  Default [DF__RPASREL__Traper__392E6792]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RPASREL] ADD  DEFAULT (0) FOR [Traper]
GO
/****** Object:  Default [DF__RPASREL__Ktimafp__3A228BCB]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RPASREL] ADD  DEFAULT (0) FOR [Ktimafp]
GO
/****** Object:  Default [DF__RPASREL__sisafp__468862B0]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RPASREL] ADD  DEFAULT (0) FOR [sisafp]
GO
/****** Object:  Default [DF__RPASIGA__Codigo__71F1E3A2]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RPASIGA] ADD  DEFAULT (' ') FOR [Codigo]
GO
/****** Object:  Default [DF__RPASIGA__Peri__72E607DB]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RPASIGA] ADD  DEFAULT (' ') FOR [Peri]
GO
/****** Object:  Default [DF__RPASIGA__Concept__73DA2C14]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RPASIGA] ADD  DEFAULT (' ') FOR [Concepto]
GO
/****** Object:  Default [DF__RPASIGA__MontoM__74CE504D]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RPASIGA] ADD  DEFAULT (0) FOR [MontoM]
GO
/****** Object:  Default [DF__RPASIGA__MontoP__75C27486]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RPASIGA] ADD  DEFAULT (0) FOR [MontoP]
GO
/****** Object:  Default [DF__RPASIGA__MontoG__76B698BF]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RPASIGA] ADD  DEFAULT (0) FOR [MontoG]
GO
/****** Object:  Default [DF__RPASIGA__Fecha_p__77AABCF8]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RPASIGA] ADD  DEFAULT (getdate()) FOR [Fecha_pag]
GO
/****** Object:  Default [DF__RPARAMS__Copar__014935CB]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RPARAMS] ADD  DEFAULT (' ') FOR [Copar]
GO
/****** Object:  Default [DF__RPARAMS__Descrip__023D5A04]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RPARAMS] ADD  DEFAULT (' ') FOR [Descrip]
GO
/****** Object:  Default [DF__RPARAMS__Param__03317E3D]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RPARAMS] ADD  DEFAULT (' ') FOR [Param]
GO
/****** Object:  Default [DF__RPARAMS__Ngrab__0425A276]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RPARAMS] ADD  DEFAULT (0) FOR [Ngrab]
GO
/****** Object:  Default [DF__rparams__Paradi__24134F1B]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RPARAMS] ADD  DEFAULT (' ') FOR [Paradi]
GO
/****** Object:  Default [DF__RPARAMS__Jdd__5A8F5B5D]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RPARAMS] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__RNUMCHE__Empresa__4B622666]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RNUMCHE] ADD  DEFAULT (' ') FOR [Empresa]
GO
/****** Object:  Default [DF__RNUMCHE__Banco__4C564A9F]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RNUMCHE] ADD  DEFAULT (0) FOR [Banco]
GO
/****** Object:  Default [DF__RNUMCHE__Numche__4D4A6ED8]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RNUMCHE] ADD  DEFAULT (0) FOR [Numche]
GO
/****** Object:  Default [DF__RNUMCHE__Codigo__4E3E9311]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RNUMCHE] ADD  DEFAULT (' ') FOR [Codigo]
GO
/****** Object:  Default [DF__RNUMCHE__Monto__4F32B74A]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RNUMCHE] ADD  DEFAULT (0) FOR [Monto]
GO
/****** Object:  Default [DF__RNUMCHE__fecha__5026DB83]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RNUMCHE] ADD  DEFAULT (getdate()) FOR [fecha]
GO
/****** Object:  Default [DF__RNUMCHE__Jdd__511AFFBC]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RNUMCHE] ADD  DEFAULT (0) FOR [Jdd]
GO
/****** Object:  Default [DF__RNOTICI__Tipo__7F16D496]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RNOTICI] ADD  DEFAULT (0) FOR [Tipo]
GO
/****** Object:  Default [DF__RNOTICI__Codigo__000AF8CF]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RNOTICI] ADD  DEFAULT (' ') FOR [Codigo]
GO
/****** Object:  Default [DF__RNOTICI__Fecha_n__00FF1D08]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RNOTICI] ADD  DEFAULT (getdate()) FOR [Fecha_not]
GO
/****** Object:  Default [DF__RNOTICI__Detalle__01F34141]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RNOTICI] ADD  DEFAULT (' ') FOR [Detalle]
GO
/****** Object:  Default [DF__RNOTICI__Nro__02E7657A]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RNOTICI] ADD  DEFAULT (0) FOR [Nro]
GO
/****** Object:  Default [DF__RNOTICI__Jdd__03DB89B3]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RNOTICI] ADD  DEFAULT (0) FOR [Jdd]
GO
/****** Object:  Default [DF__RMODULOS__Modulo__0539C240]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RMODULOS] ADD  DEFAULT (' ') FOR [Modulo]
GO
/****** Object:  Default [DF__RMODULOS__Descri__062DE679]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RMODULOS] ADD  DEFAULT (' ') FOR [Descrip]
GO
/****** Object:  Default [DF__RMODULOS__Clasif__07220AB2]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RMODULOS] ADD  DEFAULT (0) FOR [Clasif]
GO
/****** Object:  Default [DF__RMODULOS__Campos__08162EEB]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RMODULOS] ADD  DEFAULT (' ') FOR [Campos]
GO
/****** Object:  Default [DF__RMODULOS__Desde__090A5324]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RMODULOS] ADD  DEFAULT (' ') FOR [Desde]
GO
/****** Object:  Default [DF__RMODULOS__Filtro__09FE775D]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RMODULOS] ADD  DEFAULT (' ') FOR [Filtro]
GO
/****** Object:  Default [DF__RMODULOS__Agrupa__0AF29B96]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RMODULOS] ADD  DEFAULT (' ') FOR [Agrupa]
GO
/****** Object:  Default [DF__RMODULOS__Orden__0BE6BFCF]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RMODULOS] ADD  DEFAULT (' ') FOR [Orden]
GO
/****** Object:  Default [DF__RMODULOS__Tipper__0CDAE408]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RMODULOS] ADD  DEFAULT (0) FOR [Tipper]
GO
/****** Object:  Default [DF__RMODULOS__Cohade__0DCF0841]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RMODULOS] ADD  DEFAULT (' ') FOR [Cohades]
GO
/****** Object:  Default [DF__RMODULOS__Indir__0EC32C7A]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RMODULOS] ADD  DEFAULT (0) FOR [Indir]
GO
/****** Object:  Default [DF__RMODULOS__Grupos__0FB750B3]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RMODULOS] ADD  DEFAULT (' ') FOR [Grupos]
GO
/****** Object:  Default [DF__RMODULOS__Direct__10AB74EC]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RMODULOS] ADD  DEFAULT (' ') FOR [Directa]
GO
/****** Object:  Default [DF__RMODULOS__Swhere__119F9925]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RMODULOS] ADD  DEFAULT (' ') FOR [Swhere]
GO
/****** Object:  Default [DF__RMODULOS__Nperio__1293BD5E]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RMODULOS] ADD  DEFAULT (0) FOR [Nperiodo]
GO
/****** Object:  Default [DF__RMODULOS__varis__1387E197]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RMODULOS] ADD  DEFAULT (' ') FOR [varis]
GO
/****** Object:  Default [DF__RMODULOS__Jdd__147C05D0]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RMODULOS] ADD  DEFAULT (0) FOR [Jdd]
GO
/****** Object:  Default [DF__RMODULOS__dueno__3FBB6990]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RMODULOS] ADD  DEFAULT (' ') FOR [dueno]
GO
/****** Object:  Default [DF__RMODIFICAS__Id__6A3BB341]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RMODIFICAS] ADD  DEFAULT (0) FOR [Id]
GO
/****** Object:  Default [DF__RMODIFICA__Fecha__6B2FD77A]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RMODIFICAS] ADD  DEFAULT (getdate()) FOR [Fecha]
GO
/****** Object:  Default [DF__RMODIFICA__Conce__6C23FBB3]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RMODIFICAS] ADD  DEFAULT (' ') FOR [Concepto]
GO
/****** Object:  Default [DF__RMODIFICA__Codig__6D181FEC]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RMODIFICAS] ADD  DEFAULT (' ') FOR [CodigoC]
GO
/****** Object:  Default [DF__RMODIFICAS__Acc__6E0C4425]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RMODIFICAS] ADD  DEFAULT (' ') FOR [Acc]
GO
/****** Object:  Default [DF__RMODIFICA__Codig__6F00685E]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RMODIFICAS] ADD  DEFAULT (' ') FOR [Codigo]
GO
/****** Object:  Default [DF__RMODIFICAS__Deta__6FF48C97]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RMODIFICAS] ADD  DEFAULT (' ') FOR [Deta]
GO
/****** Object:  Default [DF__RMODIFICA__Usuar__70E8B0D0]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RMODIFICAS] ADD  DEFAULT (' ') FOR [Usuario]
GO
/****** Object:  Default [DF__RMODIFICA__Wcomp__71DCD509]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RMODIFICAS] ADD  DEFAULT (' ') FOR [Wcompu]
GO
/****** Object:  Default [DF__RMODIFICAS__Jdd__72D0F942]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RMODIFICAS] ADD  DEFAULT (0) FOR [Jdd]
GO
/****** Object:  Default [DF__RMAPITMH__Codigo__6F6A7CB2]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RMAPITMH] ADD  DEFAULT (' ') FOR [Codigo]
GO
/****** Object:  Default [DF__RMAPITMH__Cohade__705EA0EB]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RMAPITMH] ADD  DEFAULT (' ') FOR [Cohade]
GO
/****** Object:  Default [DF__RMAPITMH__Nro__7152C524]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RMAPITMH] ADD  DEFAULT (0) FOR [Nro]
GO
/****** Object:  Default [DF__RMAPITMH__Tipo__7246E95D]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RMAPITMH] ADD  DEFAULT (0) FOR [Tipo]
GO
/****** Object:  Default [DF__RMAPITMH__Orden__733B0D96]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RMAPITMH] ADD  DEFAULT (0) FOR [Orden]
GO
/****** Object:  Default [DF__RMAPITMH__Period__742F31CF]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RMAPITMH] ADD  DEFAULT (' ') FOR [Periodo]
GO
/****** Object:  Default [DF__RMAPITMH__COFORM__75235608]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RMAPITMH] ADD  DEFAULT (' ') FOR [COFORM]
GO
/****** Object:  Default [DF__RMAPITMH__CUOTOT__76177A41]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RMAPITMH] ADD  DEFAULT (0) FOR [CUOTOT]
GO
/****** Object:  Default [DF__RMAPITMH__CUOPAR__770B9E7A]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RMAPITMH] ADD  DEFAULT (0) FOR [CUOPAR]
GO
/****** Object:  Default [DF__RMAPITMH__Monto__77FFC2B3]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RMAPITMH] ADD  DEFAULT (0) FOR [Monto]
GO
/****** Object:  Default [DF__RMAPITMH__Fecha___78F3E6EC]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RMAPITMH] ADD  DEFAULT (getdate()) FOR [Fecha_cre]
GO
/****** Object:  Default [DF__RMAPITMH__Fecha___79E80B25]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RMAPITMH] ADD  DEFAULT (getdate()) FOR [Fecha_ini]
GO
/****** Object:  Default [DF__RMAPITMH__Fecha___7ADC2F5E]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RMAPITMH] ADD  DEFAULT (getdate()) FOR [Fecha_fin]
GO
/****** Object:  Default [DF__RMAPITMH__Cencos__7BD05397]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RMAPITMH] ADD  DEFAULT (0) FOR [Cencos]
GO
/****** Object:  Default [DF__RMAPITMH__Cuenta__7CC477D0]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RMAPITMH] ADD  DEFAULT (' ') FOR [Cuenta]
GO
/****** Object:  Default [DF__RMAPITMH__Ticen__7DB89C09]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RMAPITMH] ADD  DEFAULT (' ') FOR [Ticen]
GO
/****** Object:  Default [DF__RMAPITMH__Fepro__7EACC042]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RMAPITMH] ADD  DEFAULT (getdate()) FOR [Fepro]
GO
/****** Object:  Default [DF__RMAPITMH__Codpre__7FA0E47B]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RMAPITMH] ADD  DEFAULT (0) FOR [Codpres]
GO
/****** Object:  Default [DF__RMAPITMH__Obs__009508B4]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RMAPITMH] ADD  DEFAULT (' ') FOR [Obs]
GO
/****** Object:  Default [DF__RMAPITMH__Formul__01892CED]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RMAPITMH] ADD  DEFAULT (' ') FOR [Formula]
GO
/****** Object:  Default [DF__RMAPITMH__Proced__027D5126]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RMAPITMH] ADD  DEFAULT (' ') FOR [Procede]
GO
/****** Object:  Default [DF__RMAPITMH__Estado__0371755F]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RMAPITMH] ADD  DEFAULT (' ') FOR [Estado]
GO
/****** Object:  Default [DF__RMAPITMH__Coinst__04659998]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RMAPITMH] ADD  DEFAULT (0) FOR [Coinst]
GO
/****** Object:  Default [DF__RMAPITMH__PerImp__0559BDD1]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RMAPITMH] ADD  DEFAULT (0) FOR [PerImp]
GO
/****** Object:  Default [DF__RMAPITMH__Pone__064DE20A]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RMAPITMH] ADD  DEFAULT (' ') FOR [Pone]
GO
/****** Object:  Default [DF__RMAPITMH__Acumu__07420643]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RMAPITMH] ADD  DEFAULT (0) FOR [Acumu]
GO
/****** Object:  Default [DF__RMAPITMH__Tiacu__08362A7C]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RMAPITMH] ADD  DEFAULT (' ') FOR [Tiacu]
GO
/****** Object:  Default [DF__RMAPITMH__MontoC__092A4EB5]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RMAPITMH] ADD  DEFAULT (0) FOR [MontoC]
GO
/****** Object:  Default [DF__RMAPITMH__MontoP__0A1E72EE]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RMAPITMH] ADD  DEFAULT (0) FOR [MontoP]
GO
/****** Object:  Default [DF__RMAPITMH__Propor__0B129727]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RMAPITMH] ADD  DEFAULT (' ') FOR [Propor]
GO
/****** Object:  Default [DF__RMAPITMH__Grupo__0C06BB60]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RMAPITMH] ADD  DEFAULT (0) FOR [Grupo]
GO
/****** Object:  Default [DF__RMAPITMH__Simes__0CFADF99]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RMAPITMH] ADD  DEFAULT (' ') FOR [Simes]
GO
/****** Object:  Default [DF__RMAPITMH__Queper__0DEF03D2]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RMAPITMH] ADD  DEFAULT (' ') FOR [Queperi]
GO
/****** Object:  Default [DF__RMAPITMH__Fecha___0EE3280B]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RMAPITMH] ADD  DEFAULT (getdate()) FOR [Fecha_ing]
GO
/****** Object:  Default [DF__RMAPITMH__Fecha___0FD74C44]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RMAPITMH] ADD  DEFAULT (getdate()) FOR [Fecha_apr]
GO
/****** Object:  Default [DF__RMAPITMH__Codigo__10CB707D]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RMAPITMH] ADD  DEFAULT (' ') FOR [Codigo_in]
GO
/****** Object:  Default [DF__RMAPITMH__Codigo__11BF94B6]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RMAPITMH] ADD  DEFAULT (' ') FOR [Codigo_ap]
GO
/****** Object:  Default [DF__RMAPITMH__Planti__12B3B8EF]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RMAPITMH] ADD  DEFAULT (' ') FOR [Plantilla]
GO
/****** Object:  Default [DF__RMAPITMH__Ames__13A7DD28]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RMAPITMH] ADD  DEFAULT (' ') FOR [Ames]
GO
/****** Object:  Default [DF__RMAPITMH__Jdd__149C0161]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RMAPITMH] ADD  DEFAULT (0) FOR [Jdd]
GO
/****** Object:  Default [DF__RMAPITMH__Fecha___587208C1]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RMAPITMH] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(120)),(120))) FOR [Fecha_ult]
GO
/****** Object:  Default [DF__RMAPITMH__Moti_m__59662CFA]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RMAPITMH] ADD  DEFAULT ((0)) FOR [Moti_mod]
GO
/****** Object:  Default [DF__RMAPITMH__Condi__5A5A5133]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RMAPITMH] ADD  DEFAULT (' ') FOR [Condi]
GO
/****** Object:  Default [DF__RMAPITM__Codigo__18B6AB08]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RMAPITM] ADD  DEFAULT (' ') FOR [Codigo]
GO
/****** Object:  Default [DF__RMAPITM__Cohade__19AACF41]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RMAPITM] ADD  DEFAULT (' ') FOR [Cohade]
GO
/****** Object:  Default [DF__RMAPITM__Nro__1A9EF37A]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RMAPITM] ADD  DEFAULT (0) FOR [Nro]
GO
/****** Object:  Default [DF__RMAPITM__Tipo__1B9317B3]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RMAPITM] ADD  DEFAULT (0) FOR [Tipo]
GO
/****** Object:  Default [DF__RMAPITM__Orden__1C873BEC]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RMAPITM] ADD  DEFAULT (0) FOR [Orden]
GO
/****** Object:  Default [DF__RMAPITM__Periodo__1D7B6025]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RMAPITM] ADD  DEFAULT (' ') FOR [Periodo]
GO
/****** Object:  Default [DF__RMAPITM__COFORM__1E6F845E]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RMAPITM] ADD  DEFAULT (' ') FOR [COFORM]
GO
/****** Object:  Default [DF__RMAPITM__CUOTOT__1F63A897]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RMAPITM] ADD  DEFAULT (0) FOR [CUOTOT]
GO
/****** Object:  Default [DF__RMAPITM__CUOPAR__2057CCD0]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RMAPITM] ADD  DEFAULT (0) FOR [CUOPAR]
GO
/****** Object:  Default [DF__RMAPITM__Monto__214BF109]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RMAPITM] ADD  DEFAULT (0) FOR [Monto]
GO
/****** Object:  Default [DF__RMAPITM__Fecha_c__22401542]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RMAPITM] ADD  DEFAULT (getdate()) FOR [Fecha_cre]
GO
/****** Object:  Default [DF__RMAPITM__Fecha_i__2334397B]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RMAPITM] ADD  DEFAULT (getdate()) FOR [Fecha_ini]
GO
/****** Object:  Default [DF__RMAPITM__Fecha_f__24285DB4]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RMAPITM] ADD  DEFAULT (getdate()) FOR [Fecha_fin]
GO
/****** Object:  Default [DF__RMAPITM__Cencos__251C81ED]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RMAPITM] ADD  DEFAULT (0) FOR [Cencos]
GO
/****** Object:  Default [DF__RMAPITM__Cuenta__2610A626]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RMAPITM] ADD  DEFAULT (' ') FOR [Cuenta]
GO
/****** Object:  Default [DF__RMAPITM__Ticen__2704CA5F]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RMAPITM] ADD  DEFAULT (' ') FOR [Ticen]
GO
/****** Object:  Default [DF__RMAPITM__Fepro__27F8EE98]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RMAPITM] ADD  DEFAULT (getdate()) FOR [Fepro]
GO
/****** Object:  Default [DF__RMAPITM__Codpres__28ED12D1]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RMAPITM] ADD  DEFAULT (0) FOR [Codpres]
GO
/****** Object:  Default [DF__RMAPITM__Obs__29E1370A]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RMAPITM] ADD  DEFAULT (' ') FOR [Obs]
GO
/****** Object:  Default [DF__RMAPITM__Formula__2AD55B43]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RMAPITM] ADD  DEFAULT (' ') FOR [Formula]
GO
/****** Object:  Default [DF__RMAPITM__Procede__2BC97F7C]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RMAPITM] ADD  DEFAULT (' ') FOR [Procede]
GO
/****** Object:  Default [DF__RMAPITM__Estado__2CBDA3B5]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RMAPITM] ADD  DEFAULT (' ') FOR [Estado]
GO
/****** Object:  Default [DF__RMAPITM__Coinst__2DB1C7EE]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RMAPITM] ADD  DEFAULT (0) FOR [Coinst]
GO
/****** Object:  Default [DF__RMAPITM__PerImp__2EA5EC27]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RMAPITM] ADD  DEFAULT (0) FOR [PerImp]
GO
/****** Object:  Default [DF__RMAPITM__Pone__2F9A1060]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RMAPITM] ADD  DEFAULT (' ') FOR [Pone]
GO
/****** Object:  Default [DF__RMAPITM__Acumu__308E3499]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RMAPITM] ADD  DEFAULT (0) FOR [Acumu]
GO
/****** Object:  Default [DF__RMAPITM__Tiacu__318258D2]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RMAPITM] ADD  DEFAULT (' ') FOR [Tiacu]
GO
/****** Object:  Default [DF__RMAPITM__MontoC__32767D0B]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RMAPITM] ADD  DEFAULT (0) FOR [MontoC]
GO
/****** Object:  Default [DF__RMAPITM__MontoP__336AA144]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RMAPITM] ADD  DEFAULT (0) FOR [MontoP]
GO
/****** Object:  Default [DF__RMAPITM__Propor__345EC57D]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RMAPITM] ADD  DEFAULT (' ') FOR [Propor]
GO
/****** Object:  Default [DF__RMAPITM__Grupo__3552E9B6]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RMAPITM] ADD  DEFAULT (0) FOR [Grupo]
GO
/****** Object:  Default [DF__RMAPITM__Condi__36470DEF]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RMAPITM] ADD  DEFAULT (' ') FOR [Condi]
GO
/****** Object:  Default [DF__RMAPITM__Simes__373B3228]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RMAPITM] ADD  DEFAULT (' ') FOR [Simes]
GO
/****** Object:  Default [DF__RMAPITM__Queperi__382F5661]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RMAPITM] ADD  DEFAULT (' ') FOR [Queperi]
GO
/****** Object:  Default [DF__RMAPITM__Jdd__39237A9A]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RMAPITM] ADD  DEFAULT (0) FOR [Jdd]
GO
/****** Object:  Default [DF__RMAPITM__Fecha_i__688874F9]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RMAPITM] ADD  DEFAULT (' ') FOR [Fecha_ing]
GO
/****** Object:  Default [DF__RMAPITM__Fecha_a__697C9932]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RMAPITM] ADD  DEFAULT (' ') FOR [Fecha_apr]
GO
/****** Object:  Default [DF__RMAPITM__Codigo___6A70BD6B]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RMAPITM] ADD  DEFAULT (' ') FOR [Codigo_in]
GO
/****** Object:  Default [DF__RMAPITM__Codigo___6B64E1A4]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RMAPITM] ADD  DEFAULT (' ') FOR [Codigo_ap]
GO
/****** Object:  Default [DF__RMAPITM__Plantil__6C5905DD]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RMAPITM] ADD  DEFAULT (' ') FOR [Plantilla]
GO
/****** Object:  Default [DF__RMAPITM__Ames__6D4D2A16]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RMAPITM] ADD  DEFAULT (' ') FOR [Ames]
GO
/****** Object:  Default [DF__RMAPITM__Fecha_u__5689C04F]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RMAPITM] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(120)),(120))) FOR [Fecha_ult]
GO
/****** Object:  Default [DF__RMAPITM__Moti_mo__577DE488]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RMAPITM] ADD  DEFAULT ((0)) FOR [Moti_mod]
GO
/****** Object:  Default [DF__Rliquid__Codigo__61516785]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[Rliquid] ADD  DEFAULT (' ') FOR [Codigo]
GO
/****** Object:  Default [DF__Rliquid__Ames__62458BBE]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[Rliquid] ADD  DEFAULT (' ') FOR [Ames]
GO
/****** Object:  Default [DF__Rliquid__Peri__6339AFF7]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[Rliquid] ADD  DEFAULT (' ') FOR [Peri]
GO
/****** Object:  Default [DF__Rliquid__Cohade__642DD430]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[Rliquid] ADD  DEFAULT (' ') FOR [Cohade]
GO
/****** Object:  Default [DF__Rliquid__Tipo__6521F869]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[Rliquid] ADD  DEFAULT (0) FOR [Tipo]
GO
/****** Object:  Default [DF__Rliquid__Descitm__66161CA2]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[Rliquid] ADD  DEFAULT (' ') FOR [Descitm]
GO
/****** Object:  Default [DF__Rliquid__Orden__670A40DB]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[Rliquid] ADD  DEFAULT (0) FOR [Orden]
GO
/****** Object:  Default [DF__Rliquid__Monto__67FE6514]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[Rliquid] ADD  DEFAULT (0) FOR [Monto]
GO
/****** Object:  Default [DF__Rliquid__MontoO__68F2894D]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[Rliquid] ADD  DEFAULT (0) FOR [MontoO]
GO
/****** Object:  Default [DF__Rliquid__MontoA__69E6AD86]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[Rliquid] ADD  DEFAULT (0) FOR [MontoA]
GO
/****** Object:  Default [DF__Rliquid__Vo__6ADAD1BF]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[Rliquid] ADD  DEFAULT (0) FOR [Vo]
GO
/****** Object:  Default [DF__Rliquid__PerImp__6BCEF5F8]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[Rliquid] ADD  DEFAULT (0) FOR [PerImp]
GO
/****** Object:  Default [DF__Rliquid__Empresa__6CC31A31]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[Rliquid] ADD  DEFAULT (' ') FOR [Empresa]
GO
/****** Object:  Default [DF__Rliquid__Inform__6DB73E6A]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[Rliquid] ADD  DEFAULT (' ') FOR [Inform]
GO
/****** Object:  Default [DF__Rliquid__Cencos__6EAB62A3]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[Rliquid] ADD  DEFAULT (0) FOR [Cencos]
GO
/****** Object:  Default [DF__Rliquid__Coprev__6F9F86DC]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[Rliquid] ADD  DEFAULT (0) FOR [Coprev]
GO
/****** Object:  Default [DF__Rliquid__Origen__7093AB15]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[Rliquid] ADD  DEFAULT (' ') FOR [Origen]
GO
/****** Object:  Default [DF__Rliquid__Cod_reg__7187CF4E]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[Rliquid] ADD  DEFAULT (0) FOR [Cod_reg]
GO
/****** Object:  Default [DF__Rliquid__Codpres__727BF387]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[Rliquid] ADD  DEFAULT (0) FOR [Codpres]
GO
/****** Object:  Default [DF__Rliquid__Cmapa__737017C0]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[Rliquid] ADD  DEFAULT (' ') FOR [Cmapa]
GO
/****** Object:  Default [DF__Rliquid__Dato__74643BF9]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[Rliquid] ADD  DEFAULT (' ') FOR [Dato]
GO
/****** Object:  Default [DF__Rliquid__Nro__75586032]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[Rliquid] ADD  DEFAULT (0) FOR [Nro]
GO
/****** Object:  Default [DF__Rliquid__Jdd__764C846B]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[Rliquid] ADD  DEFAULT (0) FOR [Jdd]
GO
/****** Object:  Default [DF__RJERARQ__Segment__0D64F3ED]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RJERARQ] ADD  DEFAULT (' ') FOR [Segmento]
GO
/****** Object:  Default [DF__RJERARQ__GranZon__0E591826]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RJERARQ] ADD  DEFAULT (' ') FOR [GranZona]
GO
/****** Object:  Default [DF__RJERARQ__Zona__0F4D3C5F]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RJERARQ] ADD  DEFAULT (' ') FOR [Zona]
GO
/****** Object:  Default [DF__RJERARQ__Jop__10416098]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RJERARQ] ADD  DEFAULT (' ') FOR [Jop]
GO
/****** Object:  Default [DF__RJERARQ__Supervi__113584D1]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RJERARQ] ADD  DEFAULT (' ') FOR [Supervis]
GO
/****** Object:  Default [DF__RJERARQ__TipoCC__1229A90A]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RJERARQ] ADD  DEFAULT (' ') FOR [TipoCC]
GO
/****** Object:  Default [DF__RJERARQ__Cencos__131DCD43]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RJERARQ] ADD  DEFAULT (0) FOR [Cencos]
GO
/****** Object:  Default [DF__RJERARQ__Agrupad__1411F17C]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RJERARQ] ADD  DEFAULT (' ') FOR [Agrupador]
GO
/****** Object:  Default [DF__RJERARQ__Venta__150615B5]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RJERARQ] ADD  DEFAULT (0) FOR [Venta]
GO
/****** Object:  Default [DF__RJERARQ__Dotacio__15FA39EE]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RJERARQ] ADD  DEFAULT (0) FOR [Dotacion]
GO
/****** Object:  Default [DF__RJERARQ__Ingreso__16EE5E27]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RJERARQ] ADD  DEFAULT (0) FOR [Ingresos]
GO
/****** Object:  Default [DF__RJERARQ__IngxTra__17E28260]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RJERARQ] ADD  DEFAULT (0) FOR [IngxTras]
GO
/****** Object:  Default [DF__RJERARQ__Licenci__18D6A699]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RJERARQ] ADD  DEFAULT (0) FOR [Licencias]
GO
/****** Object:  Default [DF__RJERARQ__Finiqui__19CACAD2]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RJERARQ] ADD  DEFAULT (0) FOR [Finiquito]
GO
/****** Object:  Default [DF__RJERARQ__SalxTra__1ABEEF0B]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RJERARQ] ADD  DEFAULT (0) FOR [SalxTras]
GO
/****** Object:  Default [DF__RJERARQ__HrsExtr__1BB31344]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RJERARQ] ADD  DEFAULT (0) FOR [HrsExtra]
GO
/****** Object:  Default [DF__RJERARQ__Ames__1CA7377D]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RJERARQ] ADD  DEFAULT (' ') FOR [Ames]
GO
/****** Object:  Default [DF__RJERARQ__Peri__1D9B5BB6]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RJERARQ] ADD  DEFAULT (' ') FOR [Peri]
GO
/****** Object:  Default [DF__RJERARQ__Permiso__1E8F7FEF]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RJERARQ] ADD  DEFAULT (0) FOR [Permisos]
GO
/****** Object:  Default [DF__RJERARQ__Acciden__1F83A428]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RJERARQ] ADD  DEFAULT (0) FOR [Accidente]
GO
/****** Object:  Default [DF__RJERARQ__Empresa__2077C861]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RJERARQ] ADD  DEFAULT (' ') FOR [Empresa]
GO
/****** Object:  Default [DF__RJERARQ__Descrip__216BEC9A]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RJERARQ] ADD  DEFAULT (' ') FOR [Descripcc]
GO
/****** Object:  Default [DF__RJERARQ__Diaspag__226010D3]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RJERARQ] ADD  DEFAULT (0) FOR [Diaspag]
GO
/****** Object:  Default [DF__RJERARQ__Diasvac__2354350C]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RJERARQ] ADD  DEFAULT (0) FOR [Diasvac]
GO
/****** Object:  Default [DF__RJERARQ__Jdd__24485945]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RJERARQ] ADD  DEFAULT (0) FOR [Jdd]
GO
/****** Object:  Default [DF__RJDATOS__Jdd__53F76C67]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RJDATOS] ADD  DEFAULT (0) FOR [Jdd]
GO
/****** Object:  Default [DF__RJDATOS__Nombre__54EB90A0]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RJDATOS] ADD  DEFAULT (' ') FOR [Nombre]
GO
/****** Object:  Default [DF__RJDATOS__Encarga__55DFB4D9]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RJDATOS] ADD  DEFAULT (' ') FOR [Encargado]
GO
/****** Object:  Default [DF__RJDATOS__Fono__56D3D912]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RJDATOS] ADD  DEFAULT (' ') FOR [Fono]
GO
/****** Object:  Default [DF__RJDATOS__email__57C7FD4B]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RJDATOS] ADD  DEFAULT (' ') FOR [email]
GO
/****** Object:  Default [DF__RJDATOS__numtra__58BC2184]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RJDATOS] ADD  DEFAULT (0) FOR [numtra]
GO
/****** Object:  Default [DF__RINDICES__Aa__1975C517]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RINDICES] ADD  DEFAULT (0) FOR [Aa]
GO
/****** Object:  Default [DF__RINDICES__Mm__1A69E950]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RINDICES] ADD  DEFAULT (0) FOR [Mm]
GO
/****** Object:  Default [DF__RINDICES__Utm__1B5E0D89]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RINDICES] ADD  DEFAULT (0) FOR [Utm]
GO
/****** Object:  Default [DF__RINDICES__Uf__1C5231C2]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RINDICES] ADD  DEFAULT (0) FOR [Uf]
GO
/****** Object:  Default [DF__RINDICES__Ipc__1D4655FB]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RINDICES] ADD  DEFAULT (0) FOR [Ipc]
GO
/****** Object:  Default [DF__RINDICES__Fipc__1E3A7A34]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RINDICES] ADD  DEFAULT (0) FOR [Fipc]
GO
/****** Object:  Default [DF__RINDICES__Jdd__1F2E9E6D]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RINDICES] ADD  DEFAULT (0) FOR [Jdd]
GO
/****** Object:  Default [DF__RINDICES__TopeAF__5CACADF9]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RINDICES] ADD  DEFAULT (0) FOR [TopeAFP]
GO
/****** Object:  Default [DF__RINDICES__TopeSE__477C86E9]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RINDICES] ADD  DEFAULT (0) FOR [TopeSEC]
GO
/****** Object:  Default [DF__RINDICES__Sueldo__55959C16]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RINDICES] ADD  DEFAULT ((0)) FOR [SueldoMin]
GO
/****** Object:  Default [DF__RIGDET__Codigo__26EFBBC6]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RIGDET] ADD  DEFAULT (' ') FOR [Codigo]
GO
/****** Object:  Default [DF__RIGDET__Ames__27E3DFFF]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RIGDET] ADD  DEFAULT (' ') FOR [Ames]
GO
/****** Object:  Default [DF__RIGDET__Concepto__28D80438]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RIGDET] ADD  DEFAULT (' ') FOR [Concepto]
GO
/****** Object:  Default [DF__RIGDET__MontoA__29CC2871]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RIGDET] ADD  DEFAULT (0) FOR [MontoA]
GO
/****** Object:  Default [DF__RIGDET__MontoP__2AC04CAA]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RIGDET] ADD  DEFAULT (0) FOR [MontoP]
GO
/****** Object:  Default [DF__RIGDET__Jdd__2BB470E3]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RIGDET] ADD  DEFAULT (0) FOR [Jdd]
GO
/****** Object:  Default [DF__RIGAESQ__Jdd__52793849]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RIGAESQ] ADD  DEFAULT (0) FOR [Jdd]
GO
/****** Object:  Default [DF__RIGAESQ__Concept__536D5C82]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RIGAESQ] ADD  DEFAULT (' ') FOR [Concepto]
GO
/****** Object:  Default [DF__RIGAESQ__Descrip__546180BB]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RIGAESQ] ADD  DEFAULT (' ') FOR [Descrip]
GO
/****** Object:  Default [DF__RIGAESQ__Orden__5555A4F4]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RIGAESQ] ADD  DEFAULT (0) FOR [Orden]
GO
/****** Object:  Default [DF__RIGAESQ__Signo__5649C92D]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RIGAESQ] ADD  DEFAULT (' ') FOR [Signo]
GO
/****** Object:  Default [DF__RIGAESQ__Formula__573DED66]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RIGAESQ] ADD  DEFAULT (' ') FOR [Formula]
GO
/****** Object:  Default [DF__RIGAESQ__Tipo__5832119F]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RIGAESQ] ADD  DEFAULT (' ') FOR [Tipo]
GO
/****** Object:  Default [DF__RIDIOMAS__rut__31C24FF4]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RIDIOMAS] ADD  DEFAULT (' ') FOR [rut]
GO
/****** Object:  Default [DF__RIDIOMAS__idioma__32B6742D]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RIDIOMAS] ADD  DEFAULT (0) FOR [idioma]
GO
/****** Object:  Default [DF__RIDIOMAS__habla__33AA9866]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RIDIOMAS] ADD  DEFAULT (0) FOR [habla]
GO
/****** Object:  Default [DF__RIDIOMAS__lee__349EBC9F]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RIDIOMAS] ADD  DEFAULT (0) FOR [lee]
GO
/****** Object:  Default [DF__RIDIOMAS__escrib__3592E0D8]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RIDIOMAS] ADD  DEFAULT (0) FOR [escribe]
GO
/****** Object:  Default [DF__RIDIOMAS__observ__36870511]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RIDIOMAS] ADD  DEFAULT (' ') FOR [observ]
GO
/****** Object:  Default [DF__RIDIOMAS__Fecha___377B294A]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RIDIOMAS] ADD  DEFAULT (getdate()) FOR [Fecha_mod]
GO
/****** Object:  Default [DF__RIDIOMAS__vobo__386F4D83]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RIDIOMAS] ADD  DEFAULT (0) FOR [vobo]
GO
/****** Object:  Default [DF__RIDIOMAS__usrvob__396371BC]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RIDIOMAS] ADD  DEFAULT (' ') FOR [usrvobo]
GO
/****** Object:  Default [DF__RHONORA__Jdd__7A8729A3]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RHONORA] ADD  DEFAULT (0) FOR [Jdd]
GO
/****** Object:  Default [DF__RHONORA__Rut__7B7B4DDC]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RHONORA] ADD  DEFAULT (' ') FOR [Rut]
GO
/****** Object:  Default [DF__RHONORA__Tiser__7C6F7215]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RHONORA] ADD  DEFAULT (' ') FOR [Tiser]
GO
/****** Object:  Default [DF__RHONORA__Fecha_c__7D63964E]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RHONORA] ADD  DEFAULT (getdate()) FOR [Fecha_con]
GO
/****** Object:  Default [DF__RHONORA__Fecha_h__7E57BA87]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RHONORA] ADD  DEFAULT (getdate()) FOR [Fecha_hon]
GO
/****** Object:  Default [DF__RHONORA__Tipo__7F4BDEC0]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RHONORA] ADD  DEFAULT (' ') FOR [Tipo]
GO
/****** Object:  Default [DF__RHONORA__Numbol__004002F9]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RHONORA] ADD  DEFAULT (0) FOR [Numbol]
GO
/****** Object:  Default [DF__RHONORA__Monto__01342732]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RHONORA] ADD  DEFAULT (0) FOR [Monto]
GO
/****** Object:  Default [DF__RHONORA__Tasa__02284B6B]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RHONORA] ADD  DEFAULT (0) FOR [Tasa]
GO
/****** Object:  Default [DF__RHONORA__Impues__031C6FA4]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RHONORA] ADD  DEFAULT (0) FOR [Impues]
GO
/****** Object:  Default [DF__RHONORA__Empresa__041093DD]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RHONORA] ADD  DEFAULT (' ') FOR [Empresa]
GO
/****** Object:  Default [DF__RHONORA__Codigo__0504B816]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RHONORA] ADD  DEFAULT (' ') FOR [Codigo]
GO
/****** Object:  Default [DF__RHONORA__Nombre__05F8DC4F]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RHONORA] ADD  DEFAULT (' ') FOR [Nombre]
GO
/****** Object:  Default [DF__RHONORA__Direcci__06ED0088]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RHONORA] ADD  DEFAULT (' ') FOR [Direccion]
GO
/****** Object:  Default [DF__RHONORA__Motivo__07E124C1]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RHONORA] ADD  DEFAULT (0) FOR [Motivo]
GO
/****** Object:  Default [DF__RHONORA__Tibol__6F357288]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RHONORA] ADD  DEFAULT ('M') FOR [Tibol]
GO
/****** Object:  Default [DF__RHONORA__Cencos__75E27017]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RHONORA] ADD  DEFAULT (0) FOR [Cencos]
GO
/****** Object:  Default [DF__RHONORA__Fecha_s__78BEDCC2]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RHONORA] ADD  DEFAULT (' ') FOR [Fecha_ser]
GO
/****** Object:  Default [DF__RHOJAVI__Codigo__2FEF161B]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RHOJAVI] ADD  DEFAULT (' ') FOR [Codigo]
GO
/****** Object:  Default [DF__RHOJAVI__Fecha__30E33A54]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RHOJAVI] ADD  DEFAULT (getdate()) FOR [Fecha]
GO
/****** Object:  Default [DF__RHOJAVI__Hora__31D75E8D]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RHOJAVI] ADD  DEFAULT (' ') FOR [Hora]
GO
/****** Object:  Default [DF__RHOJAVI__DesTipo__32CB82C6]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RHOJAVI] ADD  DEFAULT (' ') FOR [DesTipo]
GO
/****** Object:  Default [DF__RHOJAVI__Detalle__33BFA6FF]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RHOJAVI] ADD  DEFAULT (' ') FOR [Detalle]
GO
/****** Object:  Default [DF__RHOJAVI__Estado__34B3CB38]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RHOJAVI] ADD  DEFAULT (' ') FOR [Estado]
GO
/****** Object:  Default [DF__RHOJAVI__Tipo__35A7EF71]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RHOJAVI] ADD  DEFAULT (0) FOR [Tipo]
GO
/****** Object:  Default [DF__RHOJAVI__Respon__369C13AA]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RHOJAVI] ADD  DEFAULT (' ') FOR [Respon]
GO
/****** Object:  Default [DF__RHOJAVI__Nhoras__379037E3]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RHOJAVI] ADD  DEFAULT (0) FOR [Nhoras]
GO
/****** Object:  Default [DF__RHOJAVI__Ivt__38845C1C]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RHOJAVI] ADD  DEFAULT (0) FOR [Ivt]
GO
/****** Object:  Default [DF__RHOJAVI__Jdd__39788055]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RHOJAVI] ADD  DEFAULT (0) FOR [Jdd]
GO
/****** Object:  Default [DF__RHISLAB__rut__218BE82B]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RHISLAB] ADD  DEFAULT (' ') FOR [rut]
GO
/****** Object:  Default [DF__RHISLAB__cargo__22800C64]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RHISLAB] ADD  DEFAULT (' ') FOR [cargo]
GO
/****** Object:  Default [DF__RHISLAB__empresa__2374309D]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RHISLAB] ADD  DEFAULT (' ') FOR [empresa]
GO
/****** Object:  Default [DF__RHISLAB__feching__246854D6]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RHISLAB] ADD  DEFAULT (getdate()) FOR [fechingr]
GO
/****** Object:  Default [DF__RHISLAB__fechegr__255C790F]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RHISLAB] ADD  DEFAULT (getdate()) FOR [fechegr]
GO
/****** Object:  Default [DF__RHISLAB__estado__26509D48]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RHISLAB] ADD  DEFAULT (0) FOR [estado]
GO
/****** Object:  Default [DF__RHISLAB__observ__2744C181]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RHISLAB] ADD  DEFAULT (' ') FOR [observ]
GO
/****** Object:  Default [DF__RHISLAB__remuner__2838E5BA]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RHISLAB] ADD  DEFAULT (0) FOR [remunerac]
GO
/****** Object:  Default [DF__RHISLAB__func1__292D09F3]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RHISLAB] ADD  DEFAULT (0) FOR [func1]
GO
/****** Object:  Default [DF__RHISLAB__func2__2A212E2C]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RHISLAB] ADD  DEFAULT (0) FOR [func2]
GO
/****** Object:  Default [DF__RHISLAB__func3__2B155265]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RHISLAB] ADD  DEFAULT (0) FOR [func3]
GO
/****** Object:  Default [DF__RHISLAB__area__2C09769E]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RHISLAB] ADD  DEFAULT (0) FOR [area]
GO
/****** Object:  Default [DF__RHISLAB__Fecha_m__2CFD9AD7]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RHISLAB] ADD  DEFAULT (getdate()) FOR [Fecha_mod]
GO
/****** Object:  Default [DF__RHISLAB__vobo__2DF1BF10]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RHISLAB] ADD  DEFAULT (0) FOR [vobo]
GO
/****** Object:  Default [DF__RHISLAB__usrvobo__2EE5E349]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RHISLAB] ADD  DEFAULT (' ') FOR [usrvobo]
GO
/****** Object:  Default [DF__RHABDES__Cohade__22AA2996]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RHABDES] ADD  DEFAULT (' ') FOR [Cohade]
GO
/****** Object:  Default [DF__RHABDES__Descrip__239E4DCF]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RHABDES] ADD  DEFAULT (' ') FOR [Descrip]
GO
/****** Object:  Default [DF__RHABDES__Tipo__24927208]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RHABDES] ADD  DEFAULT (0) FOR [Tipo]
GO
/****** Object:  Default [DF__RHABDES__Orden__25869641]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RHABDES] ADD  DEFAULT (0) FOR [Orden]
GO
/****** Object:  Default [DF__RHABDES__Vo__267ABA7A]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RHABDES] ADD  DEFAULT (' ') FOR [Vo]
GO
/****** Object:  Default [DF__RHABDES__Propor__276EDEB3]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RHABDES] ADD  DEFAULT (' ') FOR [Propor]
GO
/****** Object:  Default [DF__RHABDES__Coine__286302EC]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RHABDES] ADD  DEFAULT (0) FOR [Coine]
GO
/****** Object:  Default [DF__RHABDES__Coform__29572725]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RHABDES] ADD  DEFAULT (' ') FOR [Coform]
GO
/****** Object:  Default [DF__RHABDES__Pone__2A4B4B5E]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RHABDES] ADD  DEFAULT (' ') FOR [Pone]
GO
/****** Object:  Default [DF__RHABDES__Pror__2B3F6F97]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RHABDES] ADD  DEFAULT (' ') FOR [Pror]
GO
/****** Object:  Default [DF__RHABDES__Acumus__2C3393D0]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RHABDES] ADD  DEFAULT (' ') FOR [Acumus]
GO
/****** Object:  Default [DF__RHABDES__Refer__2D27B809]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RHABDES] ADD  DEFAULT (' ') FOR [Refer]
GO
/****** Object:  Default [DF__RHABDES__Indice__2E1BDC42]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RHABDES] ADD  DEFAULT (0) FOR [Indice]
GO
/****** Object:  Default [DF__RHABDES__Simes__2F10007B]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RHABDES] ADD  DEFAULT (' ') FOR [Simes]
GO
/****** Object:  Default [DF__RHABDES__Afe1__300424B4]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RHABDES] ADD  DEFAULT (' ') FOR [Afe1]
GO
/****** Object:  Default [DF__RHABDES__Afe2__30F848ED]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RHABDES] ADD  DEFAULT (' ') FOR [Afe2]
GO
/****** Object:  Default [DF__RHABDES__Afe3__31EC6D26]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RHABDES] ADD  DEFAULT (' ') FOR [Afe3]
GO
/****** Object:  Default [DF__RHABDES__Afe4__32E0915F]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RHABDES] ADD  DEFAULT (' ') FOR [Afe4]
GO
/****** Object:  Default [DF__RHABDES__Inform__33D4B598]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RHABDES] ADD  DEFAULT (' ') FOR [Inform]
GO
/****** Object:  Default [DF__RHABDES__Aobs__34C8D9D1]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RHABDES] ADD  DEFAULT (' ') FOR [Aobs]
GO
/****** Object:  Default [DF__RHABDES__Tiphab__35BCFE0A]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RHABDES] ADD  DEFAULT (' ') FOR [Tiphab]
GO
/****** Object:  Default [DF__RHABDES__Coinst__36B12243]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RHABDES] ADD  DEFAULT (0) FOR [Coinst]
GO
/****** Object:  Default [DF__RHABDES__RetDond__37A5467C]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RHABDES] ADD  DEFAULT (0) FOR [RetDonde]
GO
/****** Object:  Default [DF__RHABDES__Funda__38996AB5]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RHABDES] ADD  DEFAULT (' ') FOR [Funda]
GO
/****** Object:  Default [DF__RHABDES__VoCofor__398D8EEE]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RHABDES] ADD  DEFAULT (' ') FOR [VoCoform]
GO
/****** Object:  Default [DF__RHABDES__Proiga__3A81B327]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RHABDES] ADD  DEFAULT (' ') FOR [Proiga]
GO
/****** Object:  Default [DF__RHABDES__Infcon__3B75D760]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RHABDES] ADD  DEFAULT (' ') FOR [Infcon]
GO
/****** Object:  Default [DF__RHABDES__RetTipo__3C69FB99]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RHABDES] ADD  DEFAULT (' ') FOR [RetTipo]
GO
/****** Object:  Default [DF__RHABDES__Ctacor__3D5E1FD2]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RHABDES] ADD  DEFAULT (' ') FOR [Ctacor]
GO
/****** Object:  Default [DF__RHABDES__Grupo__3E52440B]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RHABDES] ADD  DEFAULT (0) FOR [Grupo]
GO
/****** Object:  Default [DF__RHABDES__Af__3F466844]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RHABDES] ADD  DEFAULT (' ') FOR [Af]
GO
/****** Object:  Default [DF__RHABDES__AfCofor__403A8C7D]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RHABDES] ADD  DEFAULT (' ') FOR [AfCoform]
GO
/****** Object:  Default [DF__RHABDES__Dato__412EB0B6]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RHABDES] ADD  DEFAULT (' ') FOR [Dato]
GO
/****** Object:  Default [DF__RHABDES__Retenci__4222D4EF]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RHABDES] ADD  DEFAULT (' ') FOR [Retencion]
GO
/****** Object:  Default [DF__RHABDES__Exliq__4316F928]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RHABDES] ADD  DEFAULT (' ') FOR [Exliq]
GO
/****** Object:  Default [DF__RHABDES__accres__440B1D61]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RHABDES] ADD  DEFAULT (' ') FOR [accres]
GO
/****** Object:  Default [DF__RHABDES__Jdd__44FF419A]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RHABDES] ADD  DEFAULT (0) FOR [Jdd]
GO
/****** Object:  Default [DF__RHABDES__Refiva__7DEDA633]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RHABDES] ADD  DEFAULT ('F') FOR [Refiva]
GO
/****** Object:  Default [DF__RHABDES__Afev__09E968C4]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RHABDES] ADD  DEFAULT ('N') FOR [Afev]
GO
/****** Object:  Default [DF__RHABDES__dAF01__3FA65AF7]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RHABDES] ADD  DEFAULT (' ') FOR [dAF01]
GO
/****** Object:  Default [DF__RHABDES__dAF02__409A7F30]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RHABDES] ADD  DEFAULT (' ') FOR [dAF02]
GO
/****** Object:  Default [DF__RHABDES__dAF03__418EA369]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RHABDES] ADD  DEFAULT (' ') FOR [dAF03]
GO
/****** Object:  Default [DF__RHABDES__dAF04__4282C7A2]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RHABDES] ADD  DEFAULT (' ') FOR [dAF04]
GO
/****** Object:  Default [DF__RHABDES__dAF05__4376EBDB]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RHABDES] ADD  DEFAULT (' ') FOR [dAF05]
GO
/****** Object:  Default [DF__RHABDES__dAF06__446B1014]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RHABDES] ADD  DEFAULT (' ') FOR [dAF06]
GO
/****** Object:  Default [DF__RHABDES__dAF07__455F344D]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RHABDES] ADD  DEFAULT (' ') FOR [dAF07]
GO
/****** Object:  Default [DF__RHABDES__dAF08__46535886]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RHABDES] ADD  DEFAULT (' ') FOR [dAF08]
GO
/****** Object:  Default [DF__RHABDES__dAF09__47477CBF]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RHABDES] ADD  DEFAULT (' ') FOR [dAF09]
GO
/****** Object:  Default [DF__RHABDES__dAF10__483BA0F8]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RHABDES] ADD  DEFAULT (' ') FOR [dAF10]
GO
/****** Object:  Default [DF__RHABDES__dAF11__492FC531]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RHABDES] ADD  DEFAULT (' ') FOR [dAF11]
GO
/****** Object:  Default [DF__RHABDES__dAF12__4A23E96A]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RHABDES] ADD  DEFAULT (' ') FOR [dAF12]
GO
/****** Object:  Default [DF__RHABDES__dAF13__4B180DA3]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RHABDES] ADD  DEFAULT (' ') FOR [dAF13]
GO
/****** Object:  Default [DF__RHABDES__dAF14__4C0C31DC]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RHABDES] ADD  DEFAULT (' ') FOR [dAF14]
GO
/****** Object:  Default [DF__RHABDES__dAF15__4D005615]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RHABDES] ADD  DEFAULT (' ') FOR [dAF15]
GO
/****** Object:  Default [DF__RHABDES__dAF16__4DF47A4E]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RHABDES] ADD  DEFAULT (' ') FOR [dAF16]
GO
/****** Object:  Default [DF__RHABDES__dAF17__4EE89E87]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RHABDES] ADD  DEFAULT (' ') FOR [dAF17]
GO
/****** Object:  Default [DF__RHABDES__dAF18__4FDCC2C0]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RHABDES] ADD  DEFAULT (' ') FOR [dAF18]
GO
/****** Object:  Default [DF__RHABDES__dAF19__50D0E6F9]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RHABDES] ADD  DEFAULT (' ') FOR [dAF19]
GO
/****** Object:  Default [DF__RHABDES__dAF20__51C50B32]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RHABDES] ADD  DEFAULT (' ') FOR [dAF20]
GO
/****** Object:  Default [DF__RHABDES__Afev2__52B92F6B]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RHABDES] ADD  DEFAULT (' ') FOR [Afev2]
GO
/****** Object:  Default [DF__RHABDES__Pone0__53AD53A4]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RHABDES] ADD  DEFAULT (' ') FOR [Pone0]
GO
/****** Object:  Default [DF__RHABDES__Unico__54A177DD]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RHABDES] ADD  DEFAULT (' ') FOR [Unico]
GO
/****** Object:  Default [DF__RHABDES__dAF21__035C66C6]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RHABDES] ADD  DEFAULT (' ') FOR [dAF21]
GO
/****** Object:  Default [DF__RHABDES__dAF22__04508AFF]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RHABDES] ADD  DEFAULT (' ') FOR [dAF22]
GO
/****** Object:  Default [DF__RHABDES__dAF23__0544AF38]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RHABDES] ADD  DEFAULT (' ') FOR [dAF23]
GO
/****** Object:  Default [DF__RHABDES__dAF24__0638D371]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RHABDES] ADD  DEFAULT (' ') FOR [dAF24]
GO
/****** Object:  Default [DF__RHABDES__dAF25__072CF7AA]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RHABDES] ADD  DEFAULT (' ') FOR [dAF25]
GO
/****** Object:  Default [DF__RGRUPFA__Codigo__4A4E069C]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RGRUPFA] ADD  DEFAULT (' ') FOR [Codigo]
GO
/****** Object:  Default [DF__RGRUPFA__Nombre__4B422AD5]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RGRUPFA] ADD  DEFAULT (' ') FOR [Nombre]
GO
/****** Object:  Default [DF__RGRUPFA__Apc__4C364F0E]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RGRUPFA] ADD  DEFAULT (' ') FOR [Apc]
GO
/****** Object:  Default [DF__RGRUPFA__Rut__4D2A7347]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RGRUPFA] ADD  DEFAULT (' ') FOR [Rut]
GO
/****** Object:  Default [DF__RGRUPFA__PARIENT__4E1E9780]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RGRUPFA] ADD  DEFAULT (0) FOR [PARIENTE]
GO
/****** Object:  Default [DF__RGRUPFA__Fecha_n__4F12BBB9]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RGRUPFA] ADD  DEFAULT (getdate()) FOR [Fecha_nac]
GO
/****** Object:  Default [DF__RGRUPFA__Sexo__5006DFF2]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RGRUPFA] ADD  DEFAULT (' ') FOR [Sexo]
GO
/****** Object:  Default [DF__RGRUPFA__Estudio__50FB042B]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RGRUPFA] ADD  DEFAULT (0) FOR [Estudios]
GO
/****** Object:  Default [DF__RGRUPFA__Gensal__51EF2864]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RGRUPFA] ADD  DEFAULT (' ') FOR [Gensal]
GO
/****** Object:  Default [DF__RGRUPFA__Preexis__52E34C9D]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RGRUPFA] ADD  DEFAULT (' ') FOR [Preexis]
GO
/****** Object:  Default [DF__RGRUPFA__Tipo_do__53D770D6]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RGRUPFA] ADD  DEFAULT (0) FOR [Tipo_doc]
GO
/****** Object:  Default [DF__RGRUPFA__Desc_pa__54CB950F]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RGRUPFA] ADD  DEFAULT (' ') FOR [Desc_par]
GO
/****** Object:  Default [DF__RGRUPFA__Desc_es__55BFB948]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RGRUPFA] ADD  DEFAULT (' ') FOR [Desc_est]
GO
/****** Object:  Default [DF__RGRUPFA__Fecha_a__56B3DD81]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RGRUPFA] ADD  DEFAULT (getdate()) FOR [Fecha_alt]
GO
/****** Object:  Default [DF__RGRUPFA__Fecha_b__57A801BA]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RGRUPFA] ADD  DEFAULT (getdate()) FOR [Fecha_baj]
GO
/****** Object:  Default [DF__RGRUPFA__Invalid__589C25F3]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RGRUPFA] ADD  DEFAULT (0) FOR [Invalid]
GO
/****** Object:  Default [DF__RGRUPFA__Relacio__59904A2C]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RGRUPFA] ADD  DEFAULT (0) FOR [Relacion]
GO
/****** Object:  Default [DF__RGRUPFA__Curso__5A846E65]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RGRUPFA] ADD  DEFAULT (0) FOR [Curso]
GO
/****** Object:  Default [DF__RGRUPFA__Numdoc__5B78929E]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RGRUPFA] ADD  DEFAULT (' ') FOR [Numdoc]
GO
/****** Object:  Default [DF__RGRUPFA__Rebimp__5C6CB6D7]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RGRUPFA] ADD  DEFAULT (0) FOR [Rebimp]
GO
/****** Object:  Default [DF__RGRUPFA__Identid__5D60DB10]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RGRUPFA] ADD  DEFAULT (0) FOR [Identidad]
GO
/****** Object:  Default [DF__RGRUPFA__Matri_c__5E54FF49]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RGRUPFA] ADD  DEFAULT (0) FOR [Matri_cer]
GO
/****** Object:  Default [DF__RGRUPFA__Matri_f__5F492382]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RGRUPFA] ADD  DEFAULT (getdate()) FOR [Matri_fec]
GO
/****** Object:  Default [DF__RGRUPFA__Naci_ce__603D47BB]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RGRUPFA] ADD  DEFAULT (0) FOR [Naci_cer]
GO
/****** Object:  Default [DF__RGRUPFA__Naci_fe__61316BF4]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RGRUPFA] ADD  DEFAULT (getdate()) FOR [Naci_fec]
GO
/****** Object:  Default [DF__RGRUPFA__Prena_c__6225902D]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RGRUPFA] ADD  DEFAULT (0) FOR [Prena_cer]
GO
/****** Object:  Default [DF__RGRUPFA__Prena_f__6319B466]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RGRUPFA] ADD  DEFAULT (getdate()) FOR [Prena_fec]
GO
/****** Object:  Default [DF__RGRUPFA__Estu_ce__640DD89F]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RGRUPFA] ADD  DEFAULT (0) FOR [Estu_cer]
GO
/****** Object:  Default [DF__RGRUPFA__Estu_fe__6501FCD8]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RGRUPFA] ADD  DEFAULT (getdate()) FOR [Estu_fec]
GO
/****** Object:  Default [DF__RGRUPFA__Fecha_a__65F62111]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RGRUPFA] ADD  DEFAULT (getdate()) FOR [Fecha_aig]
GO
/****** Object:  Default [DF__RGRUPFA__Fecha_b__66EA454A]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RGRUPFA] ADD  DEFAULT (getdate()) FOR [Fecha_big]
GO
/****** Object:  Default [DF__RGRUPFA__RetJud__67DE6983]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RGRUPFA] ADD  DEFAULT (' ') FOR [RetJud]
GO
/****** Object:  Default [DF__RGRUPFA__Carsal__68D28DBC]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RGRUPFA] ADD  DEFAULT (' ') FOR [Carsal]
GO
/****** Object:  Default [DF__RGRUPFA__Jdd__69C6B1F5]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RGRUPFA] ADD  DEFAULT (0) FOR [Jdd]
GO
/****** Object:  Default [DF__RGRUPFA__AfpVol__71A7CADF]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RGRUPFA] ADD  DEFAULT ('N') FOR [AfpVol]
GO
/****** Object:  Default [DF__RGRUPFA__AfpCod__729BEF18]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RGRUPFA] ADD  DEFAULT (0) FOR [AfpCod]
GO
/****** Object:  Default [DF__RGRUPFA__AfpMont__73901351]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RGRUPFA] ADD  DEFAULT (0) FOR [AfpMonto]
GO
/****** Object:  Default [DF__RGRUPFA__AfpCofo__7484378A]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RGRUPFA] ADD  DEFAULT (' ') FOR [AfpCoform]
GO
/****** Object:  Default [DF__RGRUPFA__AfpDesd__75785BC3]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RGRUPFA] ADD  DEFAULT (' ') FOR [AfpDesde]
GO
/****** Object:  Default [DF__RGRUPFA__AfpHast__766C7FFC]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RGRUPFA] ADD  DEFAULT (' ') FOR [AfpHasta]
GO
/****** Object:  Default [DF__RGRUPFA__AhoVol__7760A435]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RGRUPFA] ADD  DEFAULT ('N') FOR [AhoVol]
GO
/****** Object:  Default [DF__RGRUPFA__AhoMont__7854C86E]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RGRUPFA] ADD  DEFAULT (0) FOR [AhoMonto]
GO
/****** Object:  Default [DF__RGRUPFA__AhoCofo__7948ECA7]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RGRUPFA] ADD  DEFAULT (' ') FOR [AhoCoform]
GO
/****** Object:  Default [DF__RGRUPFA__Direcci__3CC9EE4C]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RGRUPFA] ADD  DEFAULT (' ') FOR [Direccion]
GO
/****** Object:  Default [DF__RGRUPFA__Fono__3DBE1285]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RGRUPFA] ADD  DEFAULT (' ') FOR [Fono]
GO
/****** Object:  Default [DF__RGRUPFA__Pmail__3EB236BE]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RGRUPFA] ADD  DEFAULT (' ') FOR [Pmail]
GO
/****** Object:  Default [DF__RFORMLA__Coform__534D60F1]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RFORMLA] ADD  DEFAULT (' ') FOR [Coform]
GO
/****** Object:  Default [DF__RFORMLA__Descrip__5441852A]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RFORMLA] ADD  DEFAULT (' ') FOR [Descrip]
GO
/****** Object:  Default [DF__RFORMLA__Tipo__5535A963]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RFORMLA] ADD  DEFAULT (' ') FOR [Tipo]
GO
/****** Object:  Default [DF__RFORMLA__Trazo__5629CD9C]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RFORMLA] ADD  DEFAULT (' ') FOR [Trazo]
GO
/****** Object:  Default [DF__RFORMLA__Formula__571DF1D5]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RFORMLA] ADD  DEFAULT (' ') FOR [Formula]
GO
/****** Object:  Default [DF__RFORMLA__Jdd__5812160E]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RFORMLA] ADD  DEFAULT (0) FOR [Jdd]
GO
/****** Object:  Default [DF__RFORMLA__Obs__59063A47]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RFORMLA] ADD  DEFAULT (' ') FOR [Obs]
GO
/****** Object:  Default [DF__RFERIAD__Jdd__2A363CC5]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RFERIAD] ADD  DEFAULT (0) FOR [Jdd]
GO
/****** Object:  Default [DF__RFERIAD__Fecha__2B2A60FE]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RFERIAD] ADD  DEFAULT (getdate()) FOR [Fecha]
GO
/****** Object:  Default [DF__RFERIAD__Tipo__2C1E8537]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RFERIAD] ADD  DEFAULT (' ') FOR [Tipo]
GO
/****** Object:  Default [DF__RFERIAD__Motivo__2D12A970]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RFERIAD] ADD  DEFAULT (' ') FOR [Motivo]
GO
/****** Object:  Default [DF__RFERIAD__Condici__3BD5CA13]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RFERIAD] ADD  DEFAULT (' ') FOR [Condicion]
GO
/****** Object:  Default [DF__REVENTOS__Fecha__76CBA758]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[REVENTOS] ADD  CONSTRAINT [DF__REVENTOS__Fecha__76CBA758]  DEFAULT (getdate()) FOR [Fecha]
GO
/****** Object:  Default [DF__REVENTOS__Usuari__77BFCB91]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[REVENTOS] ADD  CONSTRAINT [DF__REVENTOS__Usuari__77BFCB91]  DEFAULT (' ') FOR [Usuario]
GO
/****** Object:  Default [DF__REVENTOS__Prog__78B3EFCA]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[REVENTOS] ADD  CONSTRAINT [DF__REVENTOS__Prog__78B3EFCA]  DEFAULT (' ') FOR [Prog]
GO
/****** Object:  Default [DF__REVENTOS__Accion__79A81403]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[REVENTOS] ADD  CONSTRAINT [DF__REVENTOS__Accion__79A81403]  DEFAULT (' ') FOR [Accion]
GO
/****** Object:  Default [DF__REVENTOS__Conti__7A9C383C]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[REVENTOS] ADD  CONSTRAINT [DF__REVENTOS__Conti__7A9C383C]  DEFAULT (' ') FOR [Conti]
GO
/****** Object:  Default [DF__REVENTOS__Evento__7B905C75]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[REVENTOS] ADD  CONSTRAINT [DF__REVENTOS__Evento__7B905C75]  DEFAULT (' ') FOR [Evento]
GO
/****** Object:  Default [DF__REVENTOS__Wcompu__7C8480AE]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[REVENTOS] ADD  CONSTRAINT [DF__REVENTOS__Wcompu__7C8480AE]  DEFAULT (' ') FOR [Wcompu]
GO
/****** Object:  Default [DF__REVENTOS__Ngrab__7D78A4E7]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[REVENTOS] ADD  CONSTRAINT [DF__REVENTOS__Ngrab__7D78A4E7]  DEFAULT (0) FOR [Ngrab]
GO
/****** Object:  Default [DF__REVENTOS__Jdd__7E6CC920]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[REVENTOS] ADD  CONSTRAINT [DF__REVENTOS__Jdd__7E6CC920]  DEFAULT (0) FOR [Jdd]
GO
/****** Object:  Default [DF__RESUMEN__Codigo__1D114BD1]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RESUMEN] ADD  DEFAULT (' ') FOR [Codigo]
GO
/****** Object:  Default [DF__RESUMEN__Ames__1E05700A]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RESUMEN] ADD  DEFAULT (' ') FOR [Ames]
GO
/****** Object:  Default [DF__RESUMEN__Peri__1EF99443]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RESUMEN] ADD  DEFAULT (' ') FOR [Peri]
GO
/****** Object:  Default [DF__RESUMEN__Periodo__1FEDB87C]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RESUMEN] ADD  DEFAULT (' ') FOR [Periodo]
GO
/****** Object:  Default [DF__RESUMEN__Origen__20E1DCB5]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RESUMEN] ADD  DEFAULT (' ') FOR [Origen]
GO
/****** Object:  Default [DF__RESUMEN__Neto__21D600EE]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RESUMEN] ADD  DEFAULT (0) FOR [Neto]
GO
/****** Object:  Default [DF__RESUMEN__Ktha__22CA2527]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RESUMEN] ADD  DEFAULT (0) FOR [Ktha]
GO
/****** Object:  Default [DF__RESUMEN__Kthn__23BE4960]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RESUMEN] ADD  DEFAULT (0) FOR [Kthn]
GO
/****** Object:  Default [DF__RESUMEN__KthI__24B26D99]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RESUMEN] ADD  DEFAULT (0) FOR [KthI]
GO
/****** Object:  Default [DF__RESUMEN__Ktim__25A691D2]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RESUMEN] ADD  DEFAULT (0) FOR [Ktim]
GO
/****** Object:  Default [DF__RESUMEN__Ktdl__269AB60B]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RESUMEN] ADD  DEFAULT (0) FOR [Ktdl]
GO
/****** Object:  Default [DF__RESUMEN__Ktde__278EDA44]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RESUMEN] ADD  DEFAULT (0) FOR [Ktde]
GO
/****** Object:  Default [DF__RESUMEN__Ktfm__2882FE7D]    Script Date: 10/19/2015 16:18:38 ******/
ALTER TABLE [dbo].[RESUMEN] ADD  DEFAULT (0) FOR [Ktfm]
GO
/****** Object:  Default [DF__RESUMEN__Ktex__297722B6]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RESUMEN] ADD  DEFAULT (0) FOR [Ktex]
GO
/****** Object:  Default [DF__RESUMEN__DiasTr__2A6B46EF]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RESUMEN] ADD  DEFAULT (0) FOR [DiasTr]
GO
/****** Object:  Default [DF__RESUMEN__DiasLi__2B5F6B28]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RESUMEN] ADD  DEFAULT (0) FOR [DiasLi]
GO
/****** Object:  Default [DF__RESUMEN__TramoCa__2C538F61]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RESUMEN] ADD  DEFAULT (0) FOR [TramoCar]
GO
/****** Object:  Default [DF__RESUMEN__Coprev__2D47B39A]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RESUMEN] ADD  DEFAULT (0) FOR [Coprev]
GO
/****** Object:  Default [DF__RESUMEN__Cod_Reg__2E3BD7D3]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RESUMEN] ADD  DEFAULT (0) FOR [Cod_Reg]
GO
/****** Object:  Default [DF__RESUMEN__Kcay__2F2FFC0C]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RESUMEN] ADD  DEFAULT (0) FOR [Kcay]
GO
/****** Object:  Default [DF__RESUMEN__Khij__30242045]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RESUMEN] ADD  DEFAULT (0) FOR [Khij]
GO
/****** Object:  Default [DF__RESUMEN__Kotc__3118447E]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RESUMEN] ADD  DEFAULT (0) FOR [Kotc]
GO
/****** Object:  Default [DF__RESUMEN__Afecto1__320C68B7]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RESUMEN] ADD  DEFAULT (0) FOR [Afecto1]
GO
/****** Object:  Default [DF__RESUMEN__Afecto2__33008CF0]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RESUMEN] ADD  DEFAULT (0) FOR [Afecto2]
GO
/****** Object:  Default [DF__RESUMEN__Afecto3__33F4B129]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RESUMEN] ADD  DEFAULT (0) FOR [Afecto3]
GO
/****** Object:  Default [DF__RESUMEN__Afecto4__34E8D562]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RESUMEN] ADD  DEFAULT (0) FOR [Afecto4]
GO
/****** Object:  Default [DF__RESUMEN__Empresa__35DCF99B]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RESUMEN] ADD  DEFAULT (' ') FOR [Empresa]
GO
/****** Object:  Default [DF__RESUMEN__Ktds__36D11DD4]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RESUMEN] ADD  DEFAULT (0) FOR [Ktds]
GO
/****** Object:  Default [DF__RESUMEN__Diaslim__37C5420D]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RESUMEN] ADD  DEFAULT (0) FOR [Diaslim]
GO
/****** Object:  Default [DF__RESUMEN__Subsil__38B96646]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RESUMEN] ADD  DEFAULT (0) FOR [Subsil]
GO
/****** Object:  Default [DF__RESUMEN__Fafp__39AD8A7F]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RESUMEN] ADD  DEFAULT (0) FOR [Fafp]
GO
/****** Object:  Default [DF__RESUMEN__Fecha_d__3AA1AEB8]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RESUMEN] ADD  DEFAULT (getdate()) FOR [Fecha_dep]
GO
/****** Object:  Default [DF__RESUMEN__BancoDe__3B95D2F1]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RESUMEN] ADD  DEFAULT (0) FOR [BancoDep]
GO
/****** Object:  Default [DF__RESUMEN__NroRec__3C89F72A]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RESUMEN] ADD  DEFAULT (0) FOR [NroRec]
GO
/****** Object:  Default [DF__RESUMEN__Fecha_p__3D7E1B63]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RESUMEN] ADD  DEFAULT (getdate()) FOR [Fecha_pag]
GO
/****** Object:  Default [DF__RESUMEN__Jdd__3E723F9C]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RESUMEN] ADD  DEFAULT (0) FOR [Jdd]
GO
/****** Object:  Default [DF__RESUMEN__KtdlO__390E6C01]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RESUMEN] ADD  DEFAULT (0) FOR [KtdlO]
GO
/****** Object:  Default [DF__RESUMEN__Afevari__0ADD8CFD]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RESUMEN] ADD  DEFAULT (0) FOR [Afevari]
GO
/****** Object:  Default [DF__RESUMEN__Dias3pd__371114F6]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RESUMEN] ADD  DEFAULT ((0)) FOR [Dias3pd]
GO
/****** Object:  Default [DF__RESUMEN__Fecha_u__3805392F]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RESUMEN] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(120)),(120))) FOR [Fecha_ult]
GO
/****** Object:  Default [DF__RESUMEN__SubsilN__38F95D68]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RESUMEN] ADD  DEFAULT ((0)) FOR [SubsilN]
GO
/****** Object:  Default [DF__RESUMEN__Afevar2__39ED81A1]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RESUMEN] ADD  DEFAULT ((0)) FOR [Afevar2]
GO
/****** Object:  Default [DF__RESUMEN__Licmd__3AE1A5DA]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RESUMEN] ADD  DEFAULT (' ') FOR [Licmd]
GO
/****** Object:  Default [DF__RESTANQ__Jdd__1DD065E0]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RESTANQ] ADD  DEFAULT (0) FOR [Jdd]
GO
/****** Object:  Default [DF__RESTANQ__Cohade__1EC48A19]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RESTANQ] ADD  DEFAULT (' ') FOR [Cohade]
GO
/****** Object:  Default [DF__RESTANQ__Codigo__1FB8AE52]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RESTANQ] ADD  DEFAULT (' ') FOR [Codigo]
GO
/****** Object:  Default [DF__RESTANQ__Nro__20ACD28B]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RESTANQ] ADD  DEFAULT (0) FOR [Nro]
GO
/****** Object:  Default [DF__RESTANQ__Codpres__21A0F6C4]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RESTANQ] ADD  DEFAULT (0) FOR [Codpres]
GO
/****** Object:  Default [DF__RESTANQ__Monto__22951AFD]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RESTANQ] ADD  DEFAULT (0) FOR [Monto]
GO
/****** Object:  Default [DF__RESTANQ__Empresa__23893F36]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RESTANQ] ADD  DEFAULT (' ') FOR [Empresa]
GO
/****** Object:  Default [DF__RESTANQ__Cencos__247D636F]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RESTANQ] ADD  DEFAULT (0) FOR [Cencos]
GO
/****** Object:  Default [DF__RESTANQ__Tipo__257187A8]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RESTANQ] ADD  DEFAULT (0) FOR [Tipo]
GO
/****** Object:  Default [DF__RESTANQ__MontoO__2665ABE1]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RESTANQ] ADD  DEFAULT (0) FOR [MontoO]
GO
/****** Object:  Default [DF__RESTANQ__Cmapa__2759D01A]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RESTANQ] ADD  DEFAULT (' ') FOR [Cmapa]
GO
/****** Object:  Default [DF__RESQUEMA__Jdd__414EAC47]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RESQUEMA] ADD  DEFAULT (0) FOR [Jdd]
GO
/****** Object:  Default [DF__RESQUEMA__Esquem__4242D080]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RESQUEMA] ADD  DEFAULT (0) FOR [Esquema]
GO
/****** Object:  Default [DF__RESQUEMA__Descri__4336F4B9]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RESQUEMA] ADD  DEFAULT (' ') FOR [Descrip]
GO
/****** Object:  Default [DF__RESQUEMA__Parte__442B18F2]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RESQUEMA] ADD  DEFAULT (0) FOR [Parte]
GO
/****** Object:  Default [DF__RESQUEMA__Largo__451F3D2B]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RESQUEMA] ADD  DEFAULT (0) FOR [Largo]
GO
/****** Object:  Default [DF__RESQUEMA__Conc__46136164]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RESQUEMA] ADD  DEFAULT (0) FOR [Conc]
GO
/****** Object:  Default [DF__RESQUEMA__Tx__4707859D]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RESQUEMA] ADD  DEFAULT (0) FOR [Tx]
GO
/****** Object:  Default [DF__RESQUEMA__DatoX__47FBA9D6]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RESQUEMA] ADD  DEFAULT (' ') FOR [DatoX]
GO
/****** Object:  Default [DF__RESQUEMA__Ty__48EFCE0F]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RESQUEMA] ADD  DEFAULT (0) FOR [Ty]
GO
/****** Object:  Default [DF__RESQUEMA__DatoY__49E3F248]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RESQUEMA] ADD  DEFAULT (' ') FOR [DatoY]
GO
/****** Object:  Default [DF__RESQUEMA__Resul__4AD81681]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RESQUEMA] ADD  DEFAULT (0) FOR [Resul]
GO
/****** Object:  Default [DF__RESQUEMA__DatoP__4BCC3ABA]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RESQUEMA] ADD  DEFAULT (' ') FOR [DatoP]
GO
/****** Object:  Default [DF__RESQUEMA__Deci__4CC05EF3]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RESQUEMA] ADD  DEFAULT (0) FOR [Deci]
GO
/****** Object:  Default [DF__RESQUEMA__Alinea__4DB4832C]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RESQUEMA] ADD  DEFAULT (0) FOR [Alinea]
GO
/****** Object:  Default [DF__RESQUEMA__Rellen__4EA8A765]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RESQUEMA] ADD  DEFAULT (0) FOR [Relleno]
GO
/****** Object:  Default [DF__RESQUEMA__Destin__4F9CCB9E]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RESQUEMA] ADD  DEFAULT (0) FOR [Destino]
GO
/****** Object:  Default [DF__RENCAPA__Curso__6DEC4894]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RENCAPA] ADD  DEFAULT (' ') FOR [Curso]
GO
/****** Object:  Default [DF__RENCAPA__Codigo__6EE06CCD]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RENCAPA] ADD  DEFAULT (' ') FOR [Codigo]
GO
/****** Object:  Default [DF__RENCAPA__Situ__6FD49106]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RENCAPA] ADD  DEFAULT (' ') FOR [Situ]
GO
/****** Object:  Default [DF__RENCAPA__Fecha_i__70C8B53F]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RENCAPA] ADD  DEFAULT (getdate()) FOR [Fecha_ini]
GO
/****** Object:  Default [DF__RENCAPA__Fecha_t__71BCD978]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RENCAPA] ADD  DEFAULT (getdate()) FOR [Fecha_ter]
GO
/****** Object:  Default [DF__RENCAPA__Tipo__72B0FDB1]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RENCAPA] ADD  DEFAULT (' ') FOR [Tipo]
GO
/****** Object:  Default [DF__RENCAPA__Jdd__73A521EA]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RENCAPA] ADD  DEFAULT (0) FOR [Jdd]
GO
/****** Object:  Default [DF__RENCAPA__Asisten__73FA27A5]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RENCAPA] ADD  DEFAULT (0) FOR [Asisten]
GO
/****** Object:  Default [DF__RENCAPA__Obs__74EE4BDE]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RENCAPA] ADD  DEFAULT (' ') FOR [Obs]
GO
/****** Object:  Default [DF__RENCAPA__Rut__35C7EB02]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RENCAPA] ADD  DEFAULT ('') FOR [Rut]
GO
/****** Object:  Default [DF__RENCAPA__Puntaje__05AEC38C]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RENCAPA] ADD  DEFAULT (0) FOR [Puntaje]
GO
/****** Object:  Default [DF__RENCAPA__Direcci__3FDB6521]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RENCAPA] ADD  DEFAULT (' ') FOR [Direccion]
GO
/****** Object:  Default [DF__RENCAPA__causen__40CF895A]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RENCAPA] ADD  DEFAULT (0) FOR [causen]
GO
/****** Object:  Default [DF__RENCAPA__lugar__41C3AD93]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RENCAPA] ADD  DEFAULT (' ') FOR [lugar]
GO
/****** Object:  Default [DF__RENCAPA__horas__42B7D1CC]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RENCAPA] ADD  DEFAULT (0) FOR [horas]
GO
/****** Object:  Default [DF__RENCAPA__ubicas__43ABF605]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RENCAPA] ADD  DEFAULT (' ') FOR [ubicas]
GO
/****** Object:  Default [DF__REMPRESA__Empres__07020F21]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPRESA] ADD  DEFAULT (' ') FOR [Empresa]
GO
/****** Object:  Default [DF__REMPRESA__Nombre__07F6335A]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPRESA] ADD  DEFAULT (' ') FOR [Nombre]
GO
/****** Object:  Default [DF__REMPRESA__Rut__08EA5793]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPRESA] ADD  DEFAULT (' ') FOR [Rut]
GO
/****** Object:  Default [DF__REMPRESA__Direcc__09DE7BCC]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPRESA] ADD  DEFAULT (' ') FOR [Direccion]
GO
/****** Object:  Default [DF__REMPRESA__Fono__0AD2A005]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPRESA] ADD  DEFAULT (' ') FOR [Fono]
GO
/****** Object:  Default [DF__REMPRESA__Activi__0BC6C43E]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPRESA] ADD  DEFAULT (' ') FOR [Activi]
GO
/****** Object:  Default [DF__REMPRESA__Repleg__0CBAE877]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPRESA] ADD  DEFAULT (' ') FOR [Repleg]
GO
/****** Object:  Default [DF__REMPRESA__Coafil__0DAF0CB0]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPRESA] ADD  DEFAULT (0) FOR [Coafil]
GO
/****** Object:  Default [DF__REMPRESA__Mutual__0EA330E9]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPRESA] ADD  DEFAULT (' ') FOR [Mutual]
GO
/****** Object:  Default [DF__REMPRESA__Cacomp__0F975522]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPRESA] ADD  DEFAULT (' ') FOR [Cacomp]
GO
/****** Object:  Default [DF__REMPRESA__Fecha___108B795B]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPRESA] ADD  DEFAULT (getdate()) FOR [Fecha_ini]
GO
/****** Object:  Default [DF__REMPRESA__Ingbru__117F9D94]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPRESA] ADD  DEFAULT (' ') FOR [Ingbru]
GO
/****** Object:  Default [DF__REMPRESA__Diradm__1273C1CD]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPRESA] ADD  DEFAULT (' ') FOR [Diradm]
GO
/****** Object:  Default [DF__REMPRESA__Fax__1367E606]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPRESA] ADD  DEFAULT (' ') FOR [Fax]
GO
/****** Object:  Default [DF__REMPRESA__Email__145C0A3F]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPRESA] ADD  DEFAULT (' ') FOR [Email]
GO
/****** Object:  Default [DF__REMPRESA__RutRep__15502E78]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPRESA] ADD  DEFAULT (' ') FOR [RutRep]
GO
/****** Object:  Default [DF__REMPRESA__Comut__164452B1]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPRESA] ADD  DEFAULT (0) FOR [Comut]
GO
/****** Object:  Default [DF__REMPRESA__Jdd__173876EA]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPRESA] ADD  DEFAULT (0) FOR [Jdd]
GO
/****** Object:  Default [DF__REMPRESA__Giro__182C9B23]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPRESA] ADD  DEFAULT (' ') FOR [Giro]
GO
/****** Object:  Default [DF__REMPRESA__Junaeb__1920BF5C]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPRESA] ADD  DEFAULT (' ') FOR [Junaeb]
GO
/****** Object:  Default [DF__REMPRESA__mailRe__66A02C87]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPRESA] ADD  DEFAULT (' ') FOR [mailRegi]
GO
/****** Object:  Default [DF__REMPRESA__mailrr__679450C0]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPRESA] ADD  DEFAULT (' ') FOR [mailrrhh]
GO
/****** Object:  Default [DF__REMPRESA__Firman__6E414E4F]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPRESA] ADD  DEFAULT (' ') FOR [Firmante]
GO
/****** Object:  Default [DF__REMPRESA__AutRRH__36BC0F3B]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPRESA] ADD  DEFAULT ('') FOR [AutRRHH]
GO
/****** Object:  Default [DF__REMPRESA__Tipoem__06A2E7C5]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPRESA] ADD  DEFAULT ('0') FOR [Tipoemp]
GO
/****** Object:  Default [DF__REMPRESA__estatu__07970BFE]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPRESA] ADD  DEFAULT ('0') FOR [estatuto]
GO
/****** Object:  Default [DF__REMPRESA__CodAct__088B3037]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPRESA] ADD  DEFAULT ('0') FOR [CodAct]
GO
/****** Object:  Default [DF__REMPRESA__CalTra__097F5470]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPRESA] ADD  DEFAULT ('3') FOR [CalTrab]
GO
/****** Object:  Default [DF__REMPRESA__lusuar__0A7378A9]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPRESA] ADD  DEFAULT (' ') FOR [lusuario]
GO
/****** Object:  Default [DF__REMPRESA__lclave__0B679CE2]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPRESA] ADD  DEFAULT (' ') FOR [lclave]
GO
/****** Object:  Default [DF__REMPRESA__sisafp__45943E77]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPRESA] ADD  DEFAULT ('A') FOR [sisafp]
GO
/****** Object:  Default [DF__REMPRESA__PassWS__33408412]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPRESA] ADD  DEFAULT (' ') FOR [PassWSCon]
GO
/****** Object:  Default [DF__REMPRESA__UserWS__3434A84B]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPRESA] ADD  DEFAULT (' ') FOR [UserWSCon]
GO
/****** Object:  Default [DF__REMPRESA__Nit__3528CC84]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPRESA] ADD  DEFAULT (' ') FOR [Nit]
GO
/****** Object:  Default [DF__REMPRESA__Desc_a__361CF0BD]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPRESA] ADD  DEFAULT (' ') FOR [Desc_act]
GO
/****** Object:  Default [DF__REMPRESA__IdAdp__0268428D]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPRESA] ADD  DEFAULT (' ') FOR [IdAdp]
GO
/****** Object:  Default [DF__REMPLESH__Codigo__40F9A68C]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (' ') FOR [Codigo]
GO
/****** Object:  Default [DF__REMPLESH__Estado__41EDCAC5]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (' ') FOR [Estado]
GO
/****** Object:  Default [DF__REMPLESH__Tiprem__42E1EEFE]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (' ') FOR [Tiprem]
GO
/****** Object:  Default [DF__REMPLESH__Empres__43D61337]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (' ') FOR [Empresa]
GO
/****** Object:  Default [DF__REMPLESH__Nombre__44CA3770]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (' ') FOR [Nombre]
GO
/****** Object:  Default [DF__REMPLESH__Rut__45BE5BA9]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (' ') FOR [Rut]
GO
/****** Object:  Default [DF__REMPLESH__Sexo__46B27FE2]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (' ') FOR [Sexo]
GO
/****** Object:  Default [DF__REMPLESH__Fecha___47A6A41B]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (getdate()) FOR [Fecha_nac]
GO
/****** Object:  Default [DF__REMPLESH__Nacion__489AC854]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (0) FOR [Nacion]
GO
/****** Object:  Default [DF__REMPLESH__Est_ci__498EEC8D]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (' ') FOR [Est_civil]
GO
/****** Object:  Default [DF__REMPLESH__Estudi__4A8310C6]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (0) FOR [Estudios]
GO
/****** Object:  Default [DF__REMPLESH__Titulo__4B7734FF]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (0) FOR [Titulo]
GO
/****** Object:  Default [DF__REMPLESH__Clase__4C6B5938]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (0) FOR [Clase]
GO
/****** Object:  Default [DF__REMPLESH__Idioma__4D5F7D71]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (0) FOR [Idiomas]
GO
/****** Object:  Default [DF__REMPLESH__Autopa__4E53A1AA]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (' ') FOR [Autopas]
GO
/****** Object:  Default [DF__REMPLESH__Fecha___4F47C5E3]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (getdate()) FOR [Fecha_ing]
GO
/****** Object:  Default [DF__REMPLESH__Tipo_d__503BEA1C]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (0) FOR [Tipo_doc]
GO
/****** Object:  Default [DF__REMPLESH__Numdoc__51300E55]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (' ') FOR [Numdoc]
GO
/****** Object:  Default [DF__REMPLESH__Jefe__5224328E]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (' ') FOR [Jefe]
GO
/****** Object:  Default [DF__REMPLESH__Fecha___531856C7]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (getdate()) FOR [Fecha_ret]
GO
/****** Object:  Default [DF__REMPLESH__Moti_r__540C7B00]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (0) FOR [Moti_ret]
GO
/****** Object:  Default [DF__REMPLESH__Fecha___55009F39]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (getdate()) FOR [Fecha_xtr]
GO
/****** Object:  Default [DF__REMPLESH__Cencos__55F4C372]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (0) FOR [Cencos]
GO
/****** Object:  Default [DF__REMPLESH__Ticen__56E8E7AB]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (' ') FOR [Ticen]
GO
/****** Object:  Default [DF__REMPLESH__Catego__57DD0BE4]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (0) FOR [Catego]
GO
/****** Object:  Default [DF__REMPLESH__Clasif__58D1301D]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (0) FOR [Clasif]
GO
/****** Object:  Default [DF__REMPLESH__Ubica__59C55456]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (0) FOR [Ubica]
GO
/****** Object:  Default [DF__REMPLESH__Lpago__5AB9788F]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (0) FOR [Lpago]
GO
/****** Object:  Default [DF__REMPLESH__Cargo__5BAD9CC8]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (0) FOR [Cargo]
GO
/****** Object:  Default [DF__REMPLESH__Grado__5CA1C101]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (0) FOR [Grado]
GO
/****** Object:  Default [DF__REMPLESH__Divisi__5D95E53A]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (0) FOR [Division]
GO
/****** Object:  Default [DF__REMPLESH__Unidad__5E8A0973]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (0) FOR [Unidad]
GO
/****** Object:  Default [DF__REMPLESH__Horari__5F7E2DAC]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (0) FOR [Horario]
GO
/****** Object:  Default [DF__REMPLESH__Sit_la__607251E5]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (0) FOR [Sit_lab]
GO
/****** Object:  Default [DF__REMPLESH__Fpago__6166761E]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (0) FOR [Fpago]
GO
/****** Object:  Default [DF__REMPLESH__Banco__625A9A57]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (0) FOR [Banco]
GO
/****** Object:  Default [DF__REMPLESH__Ofiban__634EBE90]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (0) FOR [Ofiban]
GO
/****** Object:  Default [DF__REMPLESH__Cta_co__6442E2C9]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (' ') FOR [Cta_corr]
GO
/****** Object:  Default [DF__REMPLESH__Talla___65370702]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (' ') FOR [Talla_r]
GO
/****** Object:  Default [DF__REMPLESH__Talla___662B2B3B]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (' ') FOR [Talla_z]
GO
/****** Object:  Default [DF__REMPLESH__CARNET__671F4F74]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (' ') FOR [CARNET]
GO
/****** Object:  Default [DF__REMPLESH__Cod_af__681373AD]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (0) FOR [Cod_afp]
GO
/****** Object:  Default [DF__REMPLESH__Cod_si__690797E6]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (0) FOR [Cod_sin]
GO
/****** Object:  Default [DF__REMPLESH__Cod_is__69FBBC1F]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (0) FOR [Cod_isa]
GO
/****** Object:  Default [DF__REMPLESH__Fun__6AEFE058]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (' ') FOR [Fun]
GO
/****** Object:  Default [DF__REMPLESH__Fecha___6BE40491]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (getdate()) FOR [Fecha_isa]
GO
/****** Object:  Default [DF__REMPLESH__Cod_in__6CD828CA]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (0) FOR [Cod_ine]
GO
/****** Object:  Default [DF__REMPLESH__Cod_ca__6DCC4D03]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (0) FOR [Cod_caj]
GO
/****** Object:  Default [DF__REMPLESH__Zonafa__6EC0713C]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (0) FOR [Zonafa]
GO
/****** Object:  Default [DF__REMPLESH__Tramo___6FB49575]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (0) FOR [Tramo_car]
GO
/****** Object:  Default [DF__REMPLESH__Cod_re__70A8B9AE]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (0) FOR [Cod_reg]
GO
/****** Object:  Default [DF__REMPLESH__Jubila__719CDDE7]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (' ') FOR [Jubila]
GO
/****** Object:  Default [DF__REMPLESH__Fecha___72910220]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (getdate()) FOR [Fecha_vac]
GO
/****** Object:  Default [DF__REMPLESH__Vac_an__73852659]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (0) FOR [Vac_anre]
GO
/****** Object:  Default [DF__REMPLESH__Vac_fo__74794A92]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (' ') FOR [Vac_form]
GO
/****** Object:  Default [DF__REMPLESH__Vac_in__756D6ECB]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (0) FOR [Vac_ini]
GO
/****** Object:  Default [DF__REMPLESH__Vac_ba__76619304]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (0) FOR [Vac_base]
GO
/****** Object:  Default [DF__REMPLESH__Vac_dm__7755B73D]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (0) FOR [Vac_dmas]
GO
/****** Object:  Default [DF__REMPLESH__Vac_Pr__7849DB76]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (0) FOR [Vac_PrTo]
GO
/****** Object:  Default [DF__REMPLESH__Vac_Pr__793DFFAF]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (0) FOR [Vac_PrVe]
GO
/****** Object:  Default [DF__REMPLESH__Asigfa__7A3223E8]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (' ') FOR [Asigfam]
GO
/****** Object:  Default [DF__REMPLESH__Fecha___7B264821]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (getdate()) FOR [Fecha_lic]
GO
/****** Object:  Default [DF__REMPLESH__Anexo__7C1A6C5A]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (0) FOR [Anexo]
GO
/****** Object:  Default [DF__REMPLESH__SiAus__7D0E9093]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (' ') FOR [SiAus]
GO
/****** Object:  Default [DF__REMPLESH__Diastr__7E02B4CC]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (0) FOR [Diastr]
GO
/****** Object:  Default [DF__REMPLESH__Diasli__7EF6D905]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (0) FOR [Diasli]
GO
/****** Object:  Default [DF__REMPLESH__Sen_ni__7FEAFD3E]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (0) FOR [Sen_niv]
GO
/****** Object:  Default [DF__REMPLESH__Sen_fr__00DF2177]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (0) FOR [Sen_fra]
GO
/****** Object:  Default [DF__REMPLESH__TopeLe__01D345B0]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (0) FOR [TopeLey]
GO
/****** Object:  Default [DF__REMPLESH__GradoC__02C769E9]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (0) FOR [GradoC]
GO
/****** Object:  Default [DF__REMPLESH__Fecha___03BB8E22]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (getdate()) FOR [Fecha_gra]
GO
/****** Object:  Default [DF__REMPLESH__NumTar__04AFB25B]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (0) FOR [NumTar]
GO
/****** Object:  Default [DF__REMPLESH__L18566__05A3D694]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (' ') FOR [L18566]
GO
/****** Object:  Default [DF__REMPLESH__Lpacot__0697FACD]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (' ') FOR [Lpacot]
GO
/****** Object:  Default [DF__REMPLESH__Cuenta__078C1F06]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (0) FOR [Cuenta]
GO
/****** Object:  Default [DF__REMPLESH__RegPag__0880433F]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (' ') FOR [RegPag]
GO
/****** Object:  Default [DF__REMPLESH__Trapes__09746778]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (0) FOR [Trapes]
GO
/****** Object:  Default [DF__REMPLESH__Horas__0A688BB1]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (0) FOR [Horas]
GO
/****** Object:  Default [DF__REMPLESH__Licmed__0B5CAFEA]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (' ') FOR [Licmed]
GO
/****** Object:  Default [DF__REMPLESH__Trespd__0C50D423]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (' ') FOR [Trespd]
GO
/****** Object:  Default [DF__REMPLESH__Subsil__0D44F85C]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (' ') FOR [Subsil]
GO
/****** Object:  Default [DF__REMPLESH__reblim__0E391C95]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (' ') FOR [reblim]
GO
/****** Object:  Default [DF__REMPLESH__Manliq__0F2D40CE]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (' ') FOR [Manliq]
GO
/****** Object:  Default [DF__REMPLESH__Fecha___10216507]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (getdate()) FOR [Fecha_mod]
GO
/****** Object:  Default [DF__REMPLESH__Ames__11158940]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (' ') FOR [Ames]
GO
/****** Object:  Default [DF__REMPLESH__Creden__1209AD79]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (' ') FOR [Credenc]
GO
/****** Object:  Default [DF__REMPLESH__Jdd__12FDD1B2]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (0) FOR [Jdd]
GO
/****** Object:  Default [DF__REMPLESH__Fecha___13F1F5EB]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (getdate()) FOR [Fecha_sec]
GO
/****** Object:  Default [DF__REMPLESH__Tipcon__14E61A24]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (' ') FOR [Tipcon]
GO
/****** Object:  Default [DF__REMPLESH__Peri__15DA3E5D]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (' ') FOR [Peri]
GO
/****** Object:  Default [DF__REMPLESH__fecha___3AF6B473]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (' ') FOR [fecha_rea]
GO
/****** Object:  Default [DF__REMPLESH__Conven__711DBAFA]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (0) FOR [Convenio]
GO
/****** Object:  Default [DF__REMPLESH__Confid__7306036C]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (' ') FOR [Confid]
GO
/****** Object:  Default [DF__REMPLESH__Autori__77CAB889]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (' ') FOR [Autoriza]
GO
/****** Object:  Default [DF__REMPLESH__Cheres__070CFC19]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT ('N') FOR [Cheres]
GO
/****** Object:  Default [DF__REMPLESH__Chenum__08012052]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (0) FOR [Chenum]
GO
/****** Object:  Default [DF__REMPLESH__Cheval__08F5448B]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (0) FOR [Cheval]
GO
/****** Object:  Default [DF__REMPLESH__TICKET__2F1AED73]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT ('') FOR [TICKET]
GO
/****** Object:  Default [DF__REMPLESH__OCUPAC__300F11AC]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT ('') FOR [OCUPACION]
GO
/****** Object:  Default [DF__REMPLESH__esFpri__310335E5]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT ('') FOR [esFpri]
GO
/****** Object:  Default [DF__REMPLESH__Nficha__31F75A1E]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (0) FOR [Nficha]
GO
/****** Object:  Default [DF__REMPLESH__FechaA__0F382DC6]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (' ') FOR [FechaApvc]
GO
/****** Object:  Default [DF__REMPLESH__EstApv__102C51FF]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT ('N') FOR [EstApvc]
GO
/****** Object:  Default [DF__REMPLESH__SiCont__11207638]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT ('N') FOR [SiContra]
GO
/****** Object:  Default [DF__REMPLESH__Seccio__12149A71]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (0) FOR [Seccion]
GO
/****** Object:  Default [DF__REMPLESH__IndMon__1308BEAA]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (0) FOR [IndMonto]
GO
/****** Object:  Default [DF__REMPLESH__IndDia__13FCE2E3]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (0) FOR [IndDias]
GO
/****** Object:  Default [DF__REMPLESH__UserAD__14F1071C]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (' ') FOR [UserAD]
GO
/****** Object:  Default [DF__REMPLESH__Esreco__15E52B55]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT ('A') FOR [Esrecon]
GO
/****** Object:  Default [DF__REMPLESH__fecha___16D94F8E]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (' ') FOR [fecha_rct]
GO
/****** Object:  Default [DF__REMPLESH__CodOcu__17CD73C7]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (0) FOR [CodOcupa]
GO
/****** Object:  Default [DF__REMPLESH__Fpago2__18C19800]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (0) FOR [Fpago2]
GO
/****** Object:  Default [DF__REMPLESH__Banco2__19B5BC39]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (0) FOR [Banco2]
GO
/****** Object:  Default [DF__REMPLESH__Cta_co__1AA9E072]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (' ') FOR [Cta_corr2]
GO
/****** Object:  Default [DF__REMPLESH__Ffp__1B9E04AB]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (0) FOR [Ffp]
GO
/****** Object:  Default [DF__REMPLESH__Ffp2__1C9228E4]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (0) FOR [Ffp2]
GO
/****** Object:  Default [DF__REMPLESH__Ofiban__1D864D1D]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (0) FOR [Ofiban2]
GO
/****** Object:  Default [DF__REMPLESH__Evalua__1E7A7156]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (' ') FOR [Evaluador]
GO
/****** Object:  Default [DF__REMPLESH__Fechas__1F6E958F]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (' ') FOR [FechasJov]
GO
/****** Object:  Default [DF__REMPLESH__Fp2Ben__2062B9C8]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (0) FOR [Fp2Benef]
GO
/****** Object:  Default [DF__REMPLESH__Jornad__2156DE01]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT ('V') FOR [Jornada]
GO
/****** Object:  Default [DF__REMPLESH__JorCon__4A58F394]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT ('C') FOR [JorCont]
GO
/****** Object:  Default [DF__REMPLESH__Sdato2__4B4D17CD]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (' ') FOR [Sdato2]
GO
/****** Object:  Default [DF__REMPLESH__P5taex__14BBFCF2]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (' ') FOR [P5taex]
GO
/****** Object:  Default [DF__REMPLESH__Pafisp__15B0212B]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (' ') FOR [Pafisp]
GO
/****** Object:  Default [DF__REMPLESH__Pdisca__16A44564]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (' ') FOR [Pdisca]
GO
/****** Object:  Default [DF__REMPLESH__Pindom__1798699D]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (' ') FOR [Pindom]
GO
/****** Object:  Default [DF__REMPLESH__Ping5t__188C8DD6]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (' ') FOR [Ping5t]
GO
/****** Object:  Default [DF__REMPLESH__Pjortm__1980B20F]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (' ') FOR [Pjortm]
GO
/****** Object:  Default [DF__REMPLESH__PlanOS__1A74D648]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT ((0)) FOR [PlanOS]
GO
/****** Object:  Default [DF__REMPLESH__Pmadre__1B68FA81]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (' ') FOR [Pmadres]
GO
/****** Object:  Default [DF__REMPLESH__PorcUn__1C5D1EBA]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT ((0)) FOR [PorcUnif]
GO
/****** Object:  Default [DF__REMPLESH__PreSal__1D5142F3]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT ((0)) FOR [PreSalud]
GO
/****** Object:  Default [DF__REMPLESH__Psujhn__1E45672C]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (' ') FOR [Psujhn]
GO
/****** Object:  Default [DF__REMPLESH__Cta_in__1F398B65]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (' ') FOR [Cta_inte2]
GO
/****** Object:  Default [DF__REMPLESH__Cta_in__202DAF9E]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (' ') FOR [Cta_inter]
GO
/****** Object:  Default [DF__REMPLESH__Dir_tr__2121D3D7]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT ((0)) FOR [Dir_trab]
GO
/****** Object:  Default [DF__REMPLESH__Fecha___2215F810]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(120)),(120))) FOR [Fecha_ult]
GO
/****** Object:  Default [DF__REMPLESH__Premin__230A1C49]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (' ') FOR [Premint]
GO
/****** Object:  Default [DF__REMPLESH__Cod_dn__23FE4082]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT ((0)) FOR [Cod_dni]
GO
/****** Object:  Default [DF__REMPLESH__Antica__24F264BB]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT ((0)) FOR [Antica]
GO
/****** Object:  Default [DF__REMPLESH__APC__25E688F4]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (' ') FOR [APC]
GO
/****** Object:  Default [DF__REMPLESH__AutFir__26DAAD2D]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (' ') FOR [AutFirmar]
GO
/****** Object:  Default [DF__REMPLESH__Bloque__27CED166]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (' ') FOR [Bloques]
GO
/****** Object:  Default [DF__REMPLESH__Celula__28C2F59F]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (' ') FOR [Celular]
GO
/****** Object:  Default [DF__REMPLESH__Direcc__29B719D8]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (' ') FOR [Direccion]
GO
/****** Object:  Default [DF__REMPLESH__Fecha___2AAB3E11]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (' ') FOR [Fecha_afp]
GO
/****** Object:  Default [DF__REMPLESH__Fono__2B9F624A]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (' ') FOR [Fono]
GO
/****** Object:  Default [DF__REMPLESH__Ktim__2C938683]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT ((0)) FOR [Ktim]
GO
/****** Object:  Default [DF__REMPLESH__Monto___2D87AABC]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT ((0)) FOR [Monto_red]
GO
/****** Object:  Default [DF__REMPLESH__Monto___2E7BCEF5]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT ((0)) FOR [Monto_sgr]
GO
/****** Object:  Default [DF__REMPLESH__Numafp__2F6FF32E]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (' ') FOR [Numafp]
GO
/****** Object:  Default [DF__REMPLESH__pmail__30641767]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (' ') FOR [pmail]
GO
/****** Object:  Default [DF__REMPLESH__Renmax__31583BA0]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT ((0)) FOR [Renmax]
GO
/****** Object:  Default [DF__REMPLESH__Sdato__324C5FD9]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (' ') FOR [Sdato]
GO
/****** Object:  Default [DF__REMPLES__Codigo__5BE2A6F2]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (' ') FOR [Codigo]
GO
/****** Object:  Default [DF__REMPLES__Estado__5CD6CB2B]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (' ') FOR [Estado]
GO
/****** Object:  Default [DF__REMPLES__Tiprem__5DCAEF64]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (' ') FOR [Tiprem]
GO
/****** Object:  Default [DF__REMPLES__Empresa__5EBF139D]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (' ') FOR [Empresa]
GO
/****** Object:  Default [DF__REMPLES__Nombre__5FB337D6]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (' ') FOR [Nombre]
GO
/****** Object:  Default [DF__REMPLES__Rut__60A75C0F]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (' ') FOR [Rut]
GO
/****** Object:  Default [DF__REMPLES__Sexo__619B8048]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (' ') FOR [Sexo]
GO
/****** Object:  Default [DF__REMPLES__Direcci__628FA481]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (' ') FOR [Direccion]
GO
/****** Object:  Default [DF__REMPLES__Fono__6383C8BA]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (' ') FOR [Fono]
GO
/****** Object:  Default [DF__REMPLES__Fecha_n__6477ECF3]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (getdate()) FOR [Fecha_nac]
GO
/****** Object:  Default [DF__REMPLES__Nacion__656C112C]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (0) FOR [Nacion]
GO
/****** Object:  Default [DF__REMPLES__Celular__66603565]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (' ') FOR [Celular]
GO
/****** Object:  Default [DF__REMPLES__Est_civ__6754599E]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (' ') FOR [Est_civil]
GO
/****** Object:  Default [DF__REMPLES__Estudio__68487DD7]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (0) FOR [Estudios]
GO
/****** Object:  Default [DF__REMPLES__Titulo__693CA210]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (0) FOR [Titulo]
GO
/****** Object:  Default [DF__REMPLES__Clase__6A30C649]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (0) FOR [Clase]
GO
/****** Object:  Default [DF__REMPLES__Idiomas__6B24EA82]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (0) FOR [Idiomas]
GO
/****** Object:  Default [DF__REMPLES__Renmax__6C190EBB]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (0) FOR [Renmax]
GO
/****** Object:  Default [DF__REMPLES__Autopas__6D0D32F4]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (' ') FOR [Autopas]
GO
/****** Object:  Default [DF__REMPLES__pmail__6E01572D]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (' ') FOR [pmail]
GO
/****** Object:  Default [DF__REMPLES__Fecha_i__6EF57B66]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (getdate()) FOR [Fecha_ing]
GO
/****** Object:  Default [DF__REMPLES__Tipo_do__6FE99F9F]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (0) FOR [Tipo_doc]
GO
/****** Object:  Default [DF__REMPLES__Numdoc__70DDC3D8]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (' ') FOR [Numdoc]
GO
/****** Object:  Default [DF__REMPLES__Jefe__71D1E811]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (' ') FOR [Jefe]
GO
/****** Object:  Default [DF__REMPLES__Fecha_r__72C60C4A]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (getdate()) FOR [Fecha_ret]
GO
/****** Object:  Default [DF__REMPLES__Moti_re__73BA3083]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (0) FOR [Moti_ret]
GO
/****** Object:  Default [DF__REMPLES__Fecha_x__74AE54BC]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (getdate()) FOR [Fecha_xtr]
GO
/****** Object:  Default [DF__REMPLES__Cencos__75A278F5]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (0) FOR [Cencos]
GO
/****** Object:  Default [DF__REMPLES__Ticen__76969D2E]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (' ') FOR [Ticen]
GO
/****** Object:  Default [DF__REMPLES__Catego__778AC167]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (0) FOR [Catego]
GO
/****** Object:  Default [DF__REMPLES__Clasif__787EE5A0]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (0) FOR [Clasif]
GO
/****** Object:  Default [DF__REMPLES__Ubica__797309D9]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (0) FOR [Ubica]
GO
/****** Object:  Default [DF__REMPLES__Lpago__7A672E12]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (0) FOR [Lpago]
GO
/****** Object:  Default [DF__REMPLES__Cargo__7B5B524B]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (0) FOR [Cargo]
GO
/****** Object:  Default [DF__REMPLES__Grado__7C4F7684]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (0) FOR [Grado]
GO
/****** Object:  Default [DF__REMPLES__Divisio__7D439ABD]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (0) FOR [Division]
GO
/****** Object:  Default [DF__REMPLES__Unidad__7E37BEF6]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (0) FOR [Unidad]
GO
/****** Object:  Default [DF__REMPLES__Horario__7F2BE32F]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (0) FOR [Horario]
GO
/****** Object:  Default [DF__REMPLES__Sit_lab__00200768]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (0) FOR [Sit_lab]
GO
/****** Object:  Default [DF__REMPLES__Fpago__01142BA1]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (0) FOR [Fpago]
GO
/****** Object:  Default [DF__REMPLES__Banco__02084FDA]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (0) FOR [Banco]
GO
/****** Object:  Default [DF__REMPLES__Ofiban__02FC7413]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (0) FOR [Ofiban]
GO
/****** Object:  Default [DF__REMPLES__Cta_cor__03F0984C]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (' ') FOR [Cta_corr]
GO
/****** Object:  Default [DF__REMPLES__Talla_r__04E4BC85]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (' ') FOR [Talla_r]
GO
/****** Object:  Default [DF__REMPLES__Talla_z__05D8E0BE]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (' ') FOR [Talla_z]
GO
/****** Object:  Default [DF__REMPLES__CARNET__06CD04F7]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (' ') FOR [CARNET]
GO
/****** Object:  Default [DF__REMPLES__Cod_afp__07C12930]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (0) FOR [Cod_afp]
GO
/****** Object:  Default [DF__REMPLES__Numafp__08B54D69]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (' ') FOR [Numafp]
GO
/****** Object:  Default [DF__REMPLES__Fecha_a__09A971A2]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (getdate()) FOR [Fecha_afp]
GO
/****** Object:  Default [DF__REMPLES__Cod_sin__0A9D95DB]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (0) FOR [Cod_sin]
GO
/****** Object:  Default [DF__REMPLES__Cod_isa__0B91BA14]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (0) FOR [Cod_isa]
GO
/****** Object:  Default [DF__REMPLES__Fun__0C85DE4D]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (' ') FOR [Fun]
GO
/****** Object:  Default [DF__REMPLES__Fecha_i__0D7A0286]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (getdate()) FOR [Fecha_isa]
GO
/****** Object:  Default [DF__REMPLES__Cod_ine__0E6E26BF]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (0) FOR [Cod_ine]
GO
/****** Object:  Default [DF__REMPLES__Cod_caj__0F624AF8]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (0) FOR [Cod_caj]
GO
/****** Object:  Default [DF__REMPLES__Zonafa__10566F31]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (0) FOR [Zonafa]
GO
/****** Object:  Default [DF__REMPLES__Tramo_c__114A936A]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (0) FOR [Tramo_car]
GO
/****** Object:  Default [DF__REMPLES__Cod_reg__123EB7A3]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (0) FOR [Cod_reg]
GO
/****** Object:  Default [DF__REMPLES__Jubila__1332DBDC]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (' ') FOR [Jubila]
GO
/****** Object:  Default [DF__REMPLES__Fecha_v__14270015]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (getdate()) FOR [Fecha_vac]
GO
/****** Object:  Default [DF__REMPLES__Vac_anr__151B244E]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (0) FOR [Vac_anre]
GO
/****** Object:  Default [DF__REMPLES__Vac_dia__160F4887]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (0) FOR [Vac_dias]
GO
/****** Object:  Default [DF__REMPLES__Vac_for__17036CC0]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (' ') FOR [Vac_form]
GO
/****** Object:  Default [DF__REMPLES__Vac_ini__17F790F9]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (0) FOR [Vac_ini]
GO
/****** Object:  Default [DF__REMPLES__Vac_bas__18EBB532]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (0) FOR [Vac_base]
GO
/****** Object:  Default [DF__REMPLES__Vac_dma__19DFD96B]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (0) FOR [Vac_dmas]
GO
/****** Object:  Default [DF__REMPLES__Vac_PrT__1AD3FDA4]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (0) FOR [Vac_PrTo]
GO
/****** Object:  Default [DF__REMPLES__Vac_PrV__1BC821DD]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (0) FOR [Vac_PrVe]
GO
/****** Object:  Default [DF__REMPLES__Asigfam__1CBC4616]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (' ') FOR [Asigfam]
GO
/****** Object:  Default [DF__REMPLES__Fecha_l__1DB06A4F]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (getdate()) FOR [Fecha_lic]
GO
/****** Object:  Default [DF__REMPLES__Anexo__1EA48E88]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (0) FOR [Anexo]
GO
/****** Object:  Default [DF__REMPLES__Apc__1F98B2C1]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (' ') FOR [Apc]
GO
/****** Object:  Default [DF__REMPLES__SiAus__208CD6FA]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (' ') FOR [SiAus]
GO
/****** Object:  Default [DF__REMPLES__Monto_r__2180FB33]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (0) FOR [Monto_red]
GO
/****** Object:  Default [DF__REMPLES__Monto_s__22751F6C]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (0) FOR [Monto_sgr]
GO
/****** Object:  Default [DF__REMPLES__Ktim__236943A5]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (0) FOR [Ktim]
GO
/****** Object:  Default [DF__REMPLES__Antica__245D67DE]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (0) FOR [Antica]
GO
/****** Object:  Default [DF__REMPLES__Diastr__25518C17]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (0) FOR [Diastr]
GO
/****** Object:  Default [DF__REMPLES__Diasli__2645B050]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (0) FOR [Diasli]
GO
/****** Object:  Default [DF__REMPLES__Sen_niv__2739D489]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (0) FOR [Sen_niv]
GO
/****** Object:  Default [DF__REMPLES__Sen_fra__282DF8C2]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (0) FOR [Sen_fra]
GO
/****** Object:  Default [DF__REMPLES__Bloques__29221CFB]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (' ') FOR [Bloques]
GO
/****** Object:  Default [DF__REMPLES__TopeLey__2A164134]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (0) FOR [TopeLey]
GO
/****** Object:  Default [DF__REMPLES__GradoC__2B0A656D]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (0) FOR [GradoC]
GO
/****** Object:  Default [DF__REMPLES__Fecha_g__2BFE89A6]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (getdate()) FOR [Fecha_gra]
GO
/****** Object:  Default [DF__REMPLES__NumTar__2CF2ADDF]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (0) FOR [NumTar]
GO
/****** Object:  Default [DF__REMPLES__L18566__2DE6D218]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (' ') FOR [L18566]
GO
/****** Object:  Default [DF__REMPLES__Lpacot__2EDAF651]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (' ') FOR [Lpacot]
GO
/****** Object:  Default [DF__REMPLES__Cuenta__2FCF1A8A]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (0) FOR [Cuenta]
GO
/****** Object:  Default [DF__REMPLES__RegPag__30C33EC3]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (' ') FOR [RegPag]
GO
/****** Object:  Default [DF__REMPLES__Trapes__31B762FC]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (0) FOR [Trapes]
GO
/****** Object:  Default [DF__REMPLES__Horas__32AB8735]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (0) FOR [Horas]
GO
/****** Object:  Default [DF__REMPLES__Licmed__339FAB6E]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (' ') FOR [Licmed]
GO
/****** Object:  Default [DF__REMPLES__Trespd__3493CFA7]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (' ') FOR [Trespd]
GO
/****** Object:  Default [DF__REMPLES__Subsil__3587F3E0]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (' ') FOR [Subsil]
GO
/****** Object:  Default [DF__REMPLES__reblim__367C1819]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (' ') FOR [reblim]
GO
/****** Object:  Default [DF__REMPLES__Manliq__37703C52]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (' ') FOR [Manliq]
GO
/****** Object:  Default [DF__REMPLES__Fecha_m__3864608B]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (getdate()) FOR [Fecha_mod]
GO
/****** Object:  Default [DF__REMPLES__Ames__395884C4]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (' ') FOR [Ames]
GO
/****** Object:  Default [DF__REMPLES__Sdato__3A4CA8FD]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (' ') FOR [Sdato]
GO
/****** Object:  Default [DF__REMPLES__Credenc__3B40CD36]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (' ') FOR [Credenc]
GO
/****** Object:  Default [DF__REMPLES__Jdd__3C34F16F]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (0) FOR [Jdd]
GO
/****** Object:  Default [DF__REMPLES__Fecha_s__3D2915A8]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (getdate()) FOR [Fecha_sec]
GO
/****** Object:  Default [DF__REMPLES__Tipcon__3E1D39E1]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (' ') FOR [Tipcon]
GO
/****** Object:  Default [DF__REMPLES__Peri__3F115E1A]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (' ') FOR [Peri]
GO
/****** Object:  Default [DF__REMPLES__fecha_r__3A02903A]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (' ') FOR [fecha_rea]
GO
/****** Object:  Default [DF__REMPLES__Conveni__702996C1]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (0) FOR [Convenio]
GO
/****** Object:  Default [DF__REMPLES__Confid__7211DF33]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (' ') FOR [Confid]
GO
/****** Object:  Default [DF__REMPLES__Autoriz__76D69450]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (' ') FOR [Autoriza]
GO
/****** Object:  Default [DF__REMPLES__Cheres__04308F6E]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT ('N') FOR [Cheres]
GO
/****** Object:  Default [DF__REMPLES__Chenum__0524B3A7]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (0) FOR [Chenum]
GO
/****** Object:  Default [DF__REMPLES__Cheval__0618D7E0]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (0) FOR [Cheval]
GO
/****** Object:  Default [DF__REMPLES__TICKET__2B4A5C8F]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT ('') FOR [TICKET]
GO
/****** Object:  Default [DF__REMPLES__OCUPACI__2C3E80C8]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT ('') FOR [OCUPACION]
GO
/****** Object:  Default [DF__REMPLES__esFpri__2D32A501]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT ('') FOR [esFpri]
GO
/****** Object:  Default [DF__REMPLES__Nficha__2E26C93A]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (0) FOR [Nficha]
GO
/****** Object:  Default [DF__REMPLES__FechaSj__5E94F66B]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (' ') FOR [FechaSjov]
GO
/****** Object:  Default [DF__REMPLES__FechaAp__5F891AA4]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (' ') FOR [FechaApvc]
GO
/****** Object:  Default [DF__REMPLES__EstApvc__607D3EDD]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT ('N') FOR [EstApvc]
GO
/****** Object:  Default [DF__REMPLES__IndMont__61716316]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (0) FOR [IndMonto]
GO
/****** Object:  Default [DF__REMPLES__IndDias__6265874F]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (0) FOR [IndDias]
GO
/****** Object:  Default [DF__REMPLES__Seccion__6359AB88]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (0) FOR [Seccion]
GO
/****** Object:  Default [DF__REMPLES__UserAD__644DCFC1]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (' ') FOR [UserAD]
GO
/****** Object:  Default [DF__REMPLES__Esrecon__6541F3FA]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT ('A') FOR [Esrecon]
GO
/****** Object:  Default [DF__REMPLES__SiContr__66361833]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT ('N') FOR [SiContra]
GO
/****** Object:  Default [DF__REMPLES__fecha_r__672A3C6C]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (' ') FOR [fecha_rct]
GO
/****** Object:  Default [DF__REMPLES__CodOcup__681E60A5]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (0) FOR [CodOcupa]
GO
/****** Object:  Default [DF__REMPLES__Fpago2__691284DE]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (0) FOR [Fpago2]
GO
/****** Object:  Default [DF__REMPLES__Banco2__6A06A917]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (0) FOR [Banco2]
GO
/****** Object:  Default [DF__REMPLES__Cta_cor__6AFACD50]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (' ') FOR [Cta_corr2]
GO
/****** Object:  Default [DF__REMPLES__Ffp__6BEEF189]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (0) FOR [Ffp]
GO
/****** Object:  Default [DF__REMPLES__Ffp2__6CE315C2]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (0) FOR [Ffp2]
GO
/****** Object:  Default [DF__REMPLES__Ofiban2__6DD739FB]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (0) FOR [Ofiban2]
GO
/****** Object:  Default [DF__REMPLES__Fp2Bene__6ECB5E34]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (0) FOR [Fp2Benef]
GO
/****** Object:  Default [DF__REMPLES__Evaluad__6FBF826D]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (' ') FOR [Evaluador]
GO
/****** Object:  Default [DF__REMPLES__Jornada__70B3A6A6]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT ('V') FOR [Jornada]
GO
/****** Object:  Default [DF__REMPLES__Sdato2__4870AB22]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (' ') FOR [Sdato2]
GO
/****** Object:  Default [DF__REMPLES__JorCont__4964CF5B]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT ('C') FOR [JorCont]
GO
/****** Object:  Default [DF__REMPLES__P5taex__039170F0]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (' ') FOR [P5taex]
GO
/****** Object:  Default [DF__REMPLES__Pafisp__04859529]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (' ') FOR [Pafisp]
GO
/****** Object:  Default [DF__REMPLES__Pdisca__0579B962]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (' ') FOR [Pdisca]
GO
/****** Object:  Default [DF__REMPLES__Pindom__066DDD9B]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (' ') FOR [Pindom]
GO
/****** Object:  Default [DF__REMPLES__Ping5t__076201D4]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (' ') FOR [Ping5t]
GO
/****** Object:  Default [DF__REMPLES__Pjortm__0856260D]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (' ') FOR [Pjortm]
GO
/****** Object:  Default [DF__REMPLES__PlanOS__094A4A46]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT ((0)) FOR [PlanOS]
GO
/****** Object:  Default [DF__REMPLES__Pmadres__0A3E6E7F]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (' ') FOR [Pmadres]
GO
/****** Object:  Default [DF__REMPLES__PorcUni__0B3292B8]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT ((0)) FOR [PorcUnif]
GO
/****** Object:  Default [DF__REMPLES__PreSalu__0C26B6F1]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT ((0)) FOR [PreSalud]
GO
/****** Object:  Default [DF__REMPLES__Psujhn__0D1ADB2A]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (' ') FOR [Psujhn]
GO
/****** Object:  Default [DF__REMPLES__Cta_int__0E0EFF63]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (' ') FOR [Cta_inte2]
GO
/****** Object:  Default [DF__REMPLES__Cta_int__0F03239C]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (' ') FOR [Cta_inter]
GO
/****** Object:  Default [DF__REMPLES__Dir_tra__0FF747D5]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT ((0)) FOR [Dir_trab]
GO
/****** Object:  Default [DF__REMPLES__Fecha_u__10EB6C0E]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(120)),(120))) FOR [Fecha_ult]
GO
/****** Object:  Default [DF__REMPLES__Premint__11DF9047]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (' ') FOR [Premint]
GO
/****** Object:  Default [DF__REMPLES__Cod_dni__12D3B480]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT ((0)) FOR [Cod_dni]
GO
/****** Object:  Default [DF__REMPLES__AutFirm__13C7D8B9]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (' ') FOR [AutFirmar]
GO
/****** Object:  Default [DF__REMPLEPER__Rut__03FB8544]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLEPER] ADD  DEFAULT (' ') FOR [Rut]
GO
/****** Object:  Default [DF__REMPLEPER__Empre__04EFA97D]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLEPER] ADD  DEFAULT (' ') FOR [Empresa]
GO
/****** Object:  Default [DF__REMPLEPER__Ktim__05E3CDB6]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLEPER] ADD  DEFAULT (0) FOR [Ktim]
GO
/****** Object:  Default [DF__REMPLEPER__Ksip__06D7F1EF]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLEPER] ADD  DEFAULT (0) FOR [Ksip]
GO
/****** Object:  Default [DF__REMPLEPER__ksaim__07CC1628]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLEPER] ADD  DEFAULT (0) FOR [ksaim]
GO
/****** Object:  Default [DF__REMPLEPER__kspue__08C03A61]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLEPER] ADD  DEFAULT (0) FOR [kspue]
GO
/****** Object:  Default [DF__REMPLEPER__kafes__09B45E9A]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLEPER] ADD  DEFAULT (0) FOR [kafesec]
GO
/****** Object:  Default [DF__REMPLEPER__kgl25__0AA882D3]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLEPER] ADD  DEFAULT (0) FOR [kgl25]
GO
/****** Object:  Default [DF__REMPLEPER__Jdd__0B9CA70C]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLEPER] ADD  DEFAULT (0) FOR [Jdd]
GO
/****** Object:  Default [DF__REMPLEC__Codigo__3BFFE745]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLEC] ADD  DEFAULT (' ') FOR [Codigo]
GO
/****** Object:  Default [DF__REMPLEC__Codcam__3CF40B7E]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLEC] ADD  DEFAULT (0) FOR [Codcam]
GO
/****** Object:  Default [DF__REMPLEC__ValorN__3DE82FB7]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLEC] ADD  DEFAULT (0) FOR [ValorN]
GO
/****** Object:  Default [DF__REMPLEC__ValorF__3EDC53F0]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLEC] ADD  DEFAULT (getdate()) FOR [ValorF]
GO
/****** Object:  Default [DF__REMPLEC__ValorC__3FD07829]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLEC] ADD  DEFAULT (' ') FOR [ValorC]
GO
/****** Object:  Default [DF__REMPLEC__Jdd__40C49C62]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLEC] ADD  DEFAULT (0) FOR [Jdd]
GO
/****** Object:  Default [DF__REMPLEC__ValorM__38A457AD]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLEC] ADD  DEFAULT ('') FOR [ValorM]
GO
/****** Object:  Default [DF__REMPLEC__Fecha_u__029D4CB7]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLEC] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(120)),(120))) FOR [Fecha_ult]
GO
/****** Object:  Default [DF__REMPLAN__Codigo__4B973090]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLAN] ADD  DEFAULT (' ') FOR [Codigo]
GO
/****** Object:  Default [DF__REMPLAN__Nombre__4C8B54C9]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLAN] ADD  DEFAULT (' ') FOR [Nombre]
GO
/****** Object:  Default [DF__REMPLAN__Rut__4D7F7902]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLAN] ADD  DEFAULT (' ') FOR [Rut]
GO
/****** Object:  Default [DF__REMPLAN__Cargo__4E739D3B]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLAN] ADD  DEFAULT (0) FOR [Cargo]
GO
/****** Object:  Default [DF__REMPLAN__Direcci__4F67C174]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLAN] ADD  DEFAULT (' ') FOR [Direccion]
GO
/****** Object:  Default [DF__REMPLAN__Fono__505BE5AD]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLAN] ADD  DEFAULT (' ') FOR [Fono]
GO
/****** Object:  Default [DF__REMPLAN__Fecha_n__515009E6]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLAN] ADD  DEFAULT (getdate()) FOR [Fecha_nac]
GO
/****** Object:  Default [DF__REMPLAN__Fecha_i__52442E1F]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLAN] ADD  DEFAULT (getdate()) FOR [Fecha_ing]
GO
/****** Object:  Default [DF__REMPLAN__Fecha_r__53385258]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLAN] ADD  DEFAULT (getdate()) FOR [Fecha_ret]
GO
/****** Object:  Default [DF__REMPLAN__Moti_re__542C7691]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLAN] ADD  DEFAULT (0) FOR [Moti_ret]
GO
/****** Object:  Default [DF__REMPLAN__Obs__55209ACA]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLAN] ADD  DEFAULT (' ') FOR [Obs]
GO
/****** Object:  Default [DF__REMPLAN__Jdd__5614BF03]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLAN] ADD  DEFAULT (0) FOR [Jdd]
GO
/****** Object:  Default [DF__REMPLAN__Cencos__3726238F]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLAN] ADD  DEFAULT (0) FOR [Cencos]
GO
/****** Object:  Default [DF__REMPLAN__Empresa__381A47C8]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLAN] ADD  DEFAULT (' ') FOR [Empresa]
GO
/****** Object:  Default [DF__REMPLAN__estado__224B023A]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLAN] ADD  DEFAULT ('N') FOR [estado]
GO
/****** Object:  Default [DF__REMPLAN__Ocupaci__233F2673]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[REMPLAN] ADD  DEFAULT (' ') FOR [Ocupacion]
GO
/****** Object:  Default [DF__RECORDAR__Jdd__5B0E7E4A]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RECORDAR] ADD  DEFAULT (0) FOR [Jdd]
GO
/****** Object:  Default [DF__RECORDAR__Fecha___5C02A283]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RECORDAR] ADD  DEFAULT (getdate()) FOR [Fecha_cre]
GO
/****** Object:  Default [DF__RECORDAR__Usuari__5CF6C6BC]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RECORDAR] ADD  DEFAULT (' ') FOR [Usuario]
GO
/****** Object:  Default [DF__RECORDAR__Titulo__5DEAEAF5]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RECORDAR] ADD  DEFAULT (' ') FOR [Titulo]
GO
/****** Object:  Default [DF__RECORDAR__Destin__5EDF0F2E]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RECORDAR] ADD  DEFAULT (' ') FOR [Destino]
GO
/****** Object:  Default [DF__RECORDAR__Grupos__5FD33367]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RECORDAR] ADD  DEFAULT (' ') FOR [Grupos]
GO
/****** Object:  Default [DF__RECORDAR__Restri__60C757A0]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RECORDAR] ADD  DEFAULT (' ') FOR [Restrin]
GO
/****** Object:  Default [DF__RECORDAR__Fecha___61BB7BD9]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RECORDAR] ADD  DEFAULT (getdate()) FOR [Fecha_act]
GO
/****** Object:  Default [DF__RECORDAR__Color__62AFA012]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RECORDAR] ADD  DEFAULT (' ') FOR [Color]
GO
/****** Object:  Default [DF__RECORDAR__Dato__63A3C44B]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RECORDAR] ADD  DEFAULT (' ') FOR [Dato]
GO
/****** Object:  Default [DF__RDOCUMS__Codigo__4EC8A2F6]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RDOCUMS] ADD  DEFAULT (' ') FOR [Codigo]
GO
/****** Object:  Default [DF__RDOCUMS__Fecha_d__4FBCC72F]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RDOCUMS] ADD  DEFAULT (getdate()) FOR [Fecha_doc]
GO
/****** Object:  Default [DF__RDOCUMS__Tipo__50B0EB68]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RDOCUMS] ADD  DEFAULT (0) FOR [Tipo]
GO
/****** Object:  Default [DF__RDOCUMS__Descrip__51A50FA1]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RDOCUMS] ADD  DEFAULT (' ') FOR [Descrip]
GO
/****** Object:  Default [DF__RDOCUMS__Nombre__529933DA]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RDOCUMS] ADD  DEFAULT (' ') FOR [Nombre]
GO
/****** Object:  Default [DF__RDOCUMS__Fecha_c__538D5813]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RDOCUMS] ADD  DEFAULT (getdate()) FOR [Fecha_car]
GO
/****** Object:  Default [DF__RDOCUMS__Element__54817C4C]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RDOCUMS] ADD  DEFAULT (' ') FOR [Elemento]
GO
/****** Object:  Default [DF__RDOCUMS__Jdd__5575A085]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RDOCUMS] ADD  DEFAULT (0) FOR [Jdd]
GO
/****** Object:  Default [DF__RDOCUMS__Dire__39987BE6]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RDOCUMS] ADD  DEFAULT ('') FOR [Dire]
GO
/****** Object:  Default [DF__RDIREC__Codigo__763775D2]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RDIREC] ADD  DEFAULT ((0)) FOR [Codigo]
GO
/****** Object:  Default [DF__RDIREC__Descrip__772B9A0B]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RDIREC] ADD  DEFAULT (' ') FOR [Descrip]
GO
/****** Object:  Default [DF__RDIREC__Direccio__781FBE44]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RDIREC] ADD  DEFAULT (' ') FOR [Direccion]
GO
/****** Object:  Default [DF__RDIREC__Telefono__7913E27D]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RDIREC] ADD  DEFAULT (' ') FOR [Telefono]
GO
/****** Object:  Default [DF__RDIREC__Valor__7A0806B6]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RDIREC] ADD  DEFAULT ((0)) FOR [Valor]
GO
/****** Object:  Default [DF__RDIREC__Valorc__7AFC2AEF]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RDIREC] ADD  DEFAULT (' ') FOR [Valorc]
GO
/****** Object:  Default [DF__RDIREC__Mail__7BF04F28]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RDIREC] ADD  DEFAULT (' ') FOR [Mail]
GO
/****** Object:  Default [DF__RDIREC__Jdd__7CE47361]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RDIREC] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__RDESCUR__Curso__58F12BAE]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RDESCUR] ADD  DEFAULT (' ') FOR [Curso]
GO
/****** Object:  Default [DF__RDESCUR__Descrip__59E54FE7]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RDESCUR] ADD  DEFAULT (' ') FOR [Descrip]
GO
/****** Object:  Default [DF__RDESCUR__Institu__5AD97420]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RDESCUR] ADD  DEFAULT (0) FOR [Institu]
GO
/****** Object:  Default [DF__RDESCUR__Nivel__5BCD9859]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RDESCUR] ADD  DEFAULT (0) FOR [Nivel]
GO
/****** Object:  Default [DF__RDESCUR__Costo__5CC1BC92]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RDESCUR] ADD  DEFAULT (0) FOR [Costo]
GO
/****** Object:  Default [DF__RDESCUR__Horas__5DB5E0CB]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RDESCUR] ADD  DEFAULT (0) FOR [Horas]
GO
/****** Object:  Default [DF__RDESCUR__Relator__5EAA0504]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RDESCUR] ADD  DEFAULT (' ') FOR [Relator]
GO
/****** Object:  Default [DF__RDESCUR__Fecha_i__5F9E293D]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RDESCUR] ADD  DEFAULT (getdate()) FOR [Fecha_ini]
GO
/****** Object:  Default [DF__RDESCUR__Fecha_t__60924D76]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RDESCUR] ADD  DEFAULT (getdate()) FOR [Fecha_ter]
GO
/****** Object:  Default [DF__RDESCUR__Compet__618671AF]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RDESCUR] ADD  DEFAULT (0) FOR [Compet]
GO
/****** Object:  Default [DF__RDESCUR__EsSence__627A95E8]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RDESCUR] ADD  DEFAULT (' ') FOR [EsSence]
GO
/****** Object:  Default [DF__RDESCUR__Cordina__636EBA21]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RDESCUR] ADD  DEFAULT (' ') FOR [Cordina]
GO
/****** Object:  Default [DF__RDESCUR__Jdd__6462DE5A]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RDESCUR] ADD  DEFAULT (0) FOR [Jdd]
GO
/****** Object:  Default [DF__RDESCUR__Tipo__3B16B004]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RDESCUR] ADD  DEFAULT ('0') FOR [Tipo]
GO
/****** Object:  Default [DF__RDESCUR__objetiv__3C0AD43D]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RDESCUR] ADD  DEFAULT (' ') FOR [objetivo]
GO
/****** Object:  Default [DF__RDESCUR__metodo__3CFEF876]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RDESCUR] ADD  DEFAULT (0) FOR [metodo]
GO
/****** Object:  Default [DF__RDESCUR__obligat__3DF31CAF]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RDESCUR] ADD  DEFAULT (' ') FOR [obligat]
GO
/****** Object:  Default [DF__RDESCUR__unidad__3EE740E8]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RDESCUR] ADD  DEFAULT (0) FOR [unidad]
GO
/****** Object:  Default [DF__RCURRICU__Codigo__63D8CE75]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RCURRICU] ADD  DEFAULT (' ') FOR [Codigo]
GO
/****** Object:  Default [DF__RCURRICU__Fecha___64CCF2AE]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RCURRICU] ADD  DEFAULT (getdate()) FOR [Fecha_ini]
GO
/****** Object:  Default [DF__RCURRICU__Duraci__65C116E7]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RCURRICU] ADD  DEFAULT (0) FOR [Duracion]
GO
/****** Object:  Default [DF__RCURRICU__TipDur__66B53B20]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RCURRICU] ADD  DEFAULT (' ') FOR [TipDur]
GO
/****** Object:  Default [DF__RCURRICU__Detall__67A95F59]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RCURRICU] ADD  DEFAULT (' ') FOR [Detalle]
GO
/****** Object:  Default [DF__RCURRICU__Tipo__689D8392]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RCURRICU] ADD  DEFAULT (0) FOR [Tipo]
GO
/****** Object:  Default [DF__RCURRICU__Instit__6991A7CB]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RCURRICU] ADD  DEFAULT (0) FOR [Institu]
GO
/****** Object:  Default [DF__RCURRICU__Compet__6A85CC04]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RCURRICU] ADD  DEFAULT (0) FOR [Compet]
GO
/****** Object:  Default [DF__RCURRICU__ValorS__6B79F03D]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RCURRICU] ADD  DEFAULT (0) FOR [ValorS]
GO
/****** Object:  Default [DF__RCURRICU__ValorT__6C6E1476]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RCURRICU] ADD  DEFAULT (0) FOR [ValorT]
GO
/****** Object:  Default [DF__RCURRICU__EsSenc__6D6238AF]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RCURRICU] ADD  DEFAULT (' ') FOR [EsSence]
GO
/****** Object:  Default [DF__RCURRICU__Situ__6E565CE8]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RCURRICU] ADD  DEFAULT (' ') FOR [Situ]
GO
/****** Object:  Default [DF__RCURRICU__Asiste__6F4A8121]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RCURRICU] ADD  DEFAULT (0) FOR [Asisten]
GO
/****** Object:  Default [DF__RCURRICU__Aproba__703EA55A]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RCURRICU] ADD  DEFAULT (' ') FOR [Aproba]
GO
/****** Object:  Default [DF__RCURRICU__Obs__7132C993]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RCURRICU] ADD  DEFAULT (' ') FOR [Obs]
GO
/****** Object:  Default [DF__RCURRICU__Jdd__7226EDCC]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RCURRICU] ADD  DEFAULT (0) FOR [Jdd]
GO
/****** Object:  Default [DF__RCURRICU__Nacion__32EB7E57]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RCURRICU] ADD  DEFAULT (0) FOR [Nacion]
GO
/****** Object:  Default [DF__RCURRICU__Area__33DFA290]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RCURRICU] ADD  DEFAULT ('') FOR [Area]
GO
/****** Object:  Default [DF__RCURRICU__Fecha___34D3C6C9]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RCURRICU] ADD  DEFAULT (getdate()) FOR [Fecha_ter]
GO
/****** Object:  Default [DF__RCURRICU__Dinsti__73C51D7B]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RCURRICU] ADD  DEFAULT (' ') FOR [Dinstitu]
GO
/****** Object:  Default [DF__RCURRICU__Grado__7E0DA1C4]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RCURRICU] ADD  DEFAULT (0) FOR [Grado]
GO
/****** Object:  Default [DF__RCURRICU__Titulo__7F01C5FD]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RCURRICU] ADD  DEFAULT (' ') FOR [Titulo]
GO
/****** Object:  Default [DF__RCURRICU__Especi__7FF5EA36]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RCURRICU] ADD  DEFAULT (' ') FOR [Especial]
GO
/****** Object:  Default [DF__RCURRICU__Puntaj__00EA0E6F]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RCURRICU] ADD  DEFAULT (0) FOR [Puntaje]
GO
/****** Object:  Default [DF__RCURRICU__fecha___01DE32A8]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RCURRICU] ADD  DEFAULT (' ') FOR [fecha_mod]
GO
/****** Object:  Default [DF__RCURRICU__Estado__02D256E1]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RCURRICU] ADD  DEFAULT (0) FOR [Estado]
GO
/****** Object:  Default [DF__RCURRICU__Tipotr__03C67B1A]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RCURRICU] ADD  DEFAULT (0) FOR [Tipotract]
GO
/****** Object:  Default [DF__RCURRICU__vobo__04BA9F53]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RCURRICU] ADD  DEFAULT (0) FOR [vobo]
GO
/****** Object:  Default [DF__RCURRICU__Causen__44A01A3E]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RCURRICU] ADD  DEFAULT (0) FOR [Causen]
GO
/****** Object:  Default [DF__RCURRICU__usrvob__01A9287E]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RCURRICU] ADD  DEFAULT (' ') FOR [usrvobo]
GO
/****** Object:  Default [DF__RCUENTAS__Cohade__18178C8A]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RCUENTAS] ADD  DEFAULT (' ') FOR [Cohade]
GO
/****** Object:  Default [DF__RCUENTAS__Indice__190BB0C3]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RCUENTAS] ADD  DEFAULT (0) FOR [Indice]
GO
/****** Object:  Default [DF__RCUENTAS__Cuenta__19FFD4FC]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RCUENTAS] ADD  DEFAULT (' ') FOR [Cuenta]
GO
/****** Object:  Default [DF__RCUENTAS__Jdd__1AF3F935]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RCUENTAS] ADD  DEFAULT (0) FOR [Jdd]
GO
/****** Object:  Default [DF__RCTACOR__Codigo__75035A77]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RCTACOR] ADD  DEFAULT (' ') FOR [Codigo]
GO
/****** Object:  Default [DF__RCTACOR__Codpres__75F77EB0]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RCTACOR] ADD  DEFAULT (0) FOR [Codpres]
GO
/****** Object:  Default [DF__RCTACOR__Fecha__76EBA2E9]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RCTACOR] ADD  DEFAULT (getdate()) FOR [Fecha]
GO
/****** Object:  Default [DF__RCTACOR__Detalle__77DFC722]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RCTACOR] ADD  DEFAULT (' ') FOR [Detalle]
GO
/****** Object:  Default [DF__RCTACOR__MontoH__78D3EB5B]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RCTACOR] ADD  DEFAULT (0) FOR [MontoH]
GO
/****** Object:  Default [DF__RCTACOR__MontoC__79C80F94]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RCTACOR] ADD  DEFAULT (0) FOR [MontoC]
GO
/****** Object:  Default [DF__RCTACOR__MontoA__7ABC33CD]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RCTACOR] ADD  DEFAULT (0) FOR [MontoA]
GO
/****** Object:  Default [DF__RCTACOR__MontoP__7BB05806]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RCTACOR] ADD  DEFAULT (0) FOR [MontoP]
GO
/****** Object:  Default [DF__RCTACOR__Cohade__7CA47C3F]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RCTACOR] ADD  DEFAULT (' ') FOR [Cohade]
GO
/****** Object:  Default [DF__RCTACOR__Signo__7D98A078]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RCTACOR] ADD  DEFAULT (' ') FOR [Signo]
GO
/****** Object:  Default [DF__RCTACOR__Coform__7E8CC4B1]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RCTACOR] ADD  DEFAULT (' ') FOR [Coform]
GO
/****** Object:  Default [DF__RCTACOR__Tipo__7F80E8EA]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RCTACOR] ADD  DEFAULT (0) FOR [Tipo]
GO
/****** Object:  Default [DF__RCTACOR__Cuotot__00750D23]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RCTACOR] ADD  DEFAULT (0) FOR [Cuotot]
GO
/****** Object:  Default [DF__RCTACOR__Fecha_i__0169315C]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RCTACOR] ADD  DEFAULT (getdate()) FOR [Fecha_ini]
GO
/****** Object:  Default [DF__RCTACOR__Jdd__025D5595]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RCTACOR] ADD  DEFAULT (0) FOR [Jdd]
GO
/****** Object:  Default [DF__RCTACOR__Origen__7F6BDA51]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RCTACOR] ADD  DEFAULT ('P') FOR [Origen]
GO
/****** Object:  Default [DF__RCTACOR__Moneda__005FFE8A]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RCTACOR] ADD  DEFAULT (0) FOR [Moneda]
GO
/****** Object:  Default [DF__RCTACOR__cuota__015422C3]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RCTACOR] ADD  DEFAULT (0) FOR [cuota]
GO
/****** Object:  Default [DF__RCTACOR__Nucom__024846FC]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RCTACOR] ADD  DEFAULT (0) FOR [Nucom]
GO
/****** Object:  Default [DF__RCTACOR__Refere__033C6B35]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RCTACOR] ADD  DEFAULT (' ') FOR [Refere]
GO
/****** Object:  Default [DF__RCONJUN__CodCon__06B7F65E]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RCONJUN] ADD  DEFAULT (0) FOR [CodCon]
GO
/****** Object:  Default [DF__RCONJUN__Descrip__07AC1A97]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RCONJUN] ADD  DEFAULT (' ') FOR [Descrip]
GO
/****** Object:  Default [DF__RCONJUN__Tipo__08A03ED0]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RCONJUN] ADD  DEFAULT (' ') FOR [Tipo]
GO
/****** Object:  Default [DF__RCONJUN__Condi__09946309]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RCONJUN] ADD  DEFAULT (' ') FOR [Condi]
GO
/****** Object:  Default [DF__RCONJUN__Jdd__0A888742]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RCONJUN] ADD  DEFAULT (0) FOR [Jdd]
GO
/****** Object:  Default [DF__RCONGSEM__RUT__3C3FDE67]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RCONGSEM] ADD  DEFAULT (' ') FOR [RUT]
GO
/****** Object:  Default [DF__RCONGSEM__evento__3D3402A0]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RCONGSEM] ADD  DEFAULT (' ') FOR [evento]
GO
/****** Object:  Default [DF__RCONGSEM__instit__3E2826D9]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RCONGSEM] ADD  DEFAULT (' ') FOR [instit]
GO
/****** Object:  Default [DF__RCONGSEM__fecha__3F1C4B12]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RCONGSEM] ADD  DEFAULT (getdate()) FOR [fecha]
GO
/****** Object:  Default [DF__RCONGSEM__fecha___40106F4B]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RCONGSEM] ADD  DEFAULT (getdate()) FOR [fecha_fin]
GO
/****** Object:  Default [DF__RCONGSEM__caract__41049384]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RCONGSEM] ADD  DEFAULT (' ') FOR [caracter]
GO
/****** Object:  Default [DF__RCONGSEM__ciudad__41F8B7BD]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RCONGSEM] ADD  DEFAULT (' ') FOR [ciudad]
GO
/****** Object:  Default [DF__RCONGSEM__pais__42ECDBF6]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RCONGSEM] ADD  DEFAULT (' ') FOR [pais]
GO
/****** Object:  Default [DF__RCONGSEM__observ__43E1002F]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RCONGSEM] ADD  DEFAULT (' ') FOR [observ]
GO
/****** Object:  Default [DF__RCONGSEM__Fecha___44D52468]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RCONGSEM] ADD  DEFAULT (getdate()) FOR [Fecha_mod]
GO
/****** Object:  Default [DF__RCONGSEM__vobo__45C948A1]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RCONGSEM] ADD  DEFAULT (0) FOR [vobo]
GO
/****** Object:  Default [DF__RCONGSEM__usrvob__46BD6CDA]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RCONGSEM] ADD  DEFAULT (' ') FOR [usrvobo]
GO
/****** Object:  Default [DF__RCONFIR__Codigo__42CCE065]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RCONFIR] ADD  DEFAULT (' ') FOR [Codigo]
GO
/****** Object:  Default [DF__RCONFIR__Ames__43C1049E]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RCONFIR] ADD  DEFAULT (' ') FOR [Ames]
GO
/****** Object:  Default [DF__RCONFIR__Peri__44B528D7]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RCONFIR] ADD  DEFAULT (' ') FOR [Peri]
GO
/****** Object:  Default [DF__RCONFIR__marca__45A94D10]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RCONFIR] ADD  DEFAULT (' ') FOR [marca]
GO
/****** Object:  Default [DF__RCONFIR__Fecha_m__469D7149]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RCONFIR] ADD  DEFAULT (getdate()) FOR [Fecha_mar]
GO
/****** Object:  Default [DF__RCONFIR__Detalle__47919582]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RCONFIR] ADD  DEFAULT (' ') FOR [Detalle]
GO
/****** Object:  Default [DF__RCONFIR__Jdd__4885B9BB]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RCONFIR] ADD  DEFAULT (0) FOR [Jdd]
GO
/****** Object:  Default [DF__RCONDIS__Jdd__1758727B]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RCONDIS] ADD  DEFAULT (0) FOR [Jdd]
GO
/****** Object:  Default [DF__RCONDIS__Usuario__184C96B4]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RCONDIS] ADD  DEFAULT (' ') FOR [Usuario]
GO
/****** Object:  Default [DF__RCONDIS__Descrip__1940BAED]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RCONDIS] ADD  DEFAULT (' ') FOR [Descrip]
GO
/****** Object:  Default [DF__RCONDIS__Condici__1A34DF26]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RCONDIS] ADD  DEFAULT (' ') FOR [Condicion]
GO
/****** Object:  Default [DF__RCONDAT__Jdd__24D2692A]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RCONDAT] ADD  DEFAULT (0) FOR [Jdd]
GO
/****** Object:  Default [DF__RCONDAT__Usuario__25C68D63]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RCONDAT] ADD  DEFAULT (' ') FOR [Usuario]
GO
/****** Object:  Default [DF__RCONDAT__Wcompu__26BAB19C]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RCONDAT] ADD  DEFAULT (' ') FOR [Wcompu]
GO
/****** Object:  Default [DF__RCONDAT__Identi__27AED5D5]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RCONDAT] ADD  DEFAULT (0) FOR [Identi]
GO
/****** Object:  Default [DF__RCONDAT__Wuser__28A2FA0E]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RCONDAT] ADD  DEFAULT (' ') FOR [Wuser]
GO
/****** Object:  Default [DF__RCONDAT__Fecha__29971E47]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RCONDAT] ADD  DEFAULT (getdate()) FOR [Fecha]
GO
/****** Object:  Default [DF__RCONDAT__Program__2A8B4280]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RCONDAT] ADD  DEFAULT (' ') FOR [Programa]
GO
/****** Object:  Default [DF__RCOMISI__Codigo__60132A89]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RCOMISI] ADD  DEFAULT (' ') FOR [Codigo]
GO
/****** Object:  Default [DF__RCOMISI__Ames__61074EC2]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RCOMISI] ADD  DEFAULT (' ') FOR [Ames]
GO
/****** Object:  Default [DF__RCOMISI__Peri__61FB72FB]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RCOMISI] ADD  DEFAULT (' ') FOR [Peri]
GO
/****** Object:  Default [DF__RCOMISI__Cohade__62EF9734]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RCOMISI] ADD  DEFAULT (' ') FOR [Cohade]
GO
/****** Object:  Default [DF__RCOMISI__Numero__63E3BB6D]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RCOMISI] ADD  DEFAULT ((0)) FOR [Numero]
GO
/****** Object:  Default [DF__RCOMISI__Valor1__64D7DFA6]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RCOMISI] ADD  DEFAULT ((0)) FOR [Valor1]
GO
/****** Object:  Default [DF__RCOMISI__Valor2__65CC03DF]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RCOMISI] ADD  DEFAULT ((0)) FOR [Valor2]
GO
/****** Object:  Default [DF__RCOMISI__Valor3__66C02818]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RCOMISI] ADD  DEFAULT ((0)) FOR [Valor3]
GO
/****** Object:  Default [DF__RCOMISI__Valor4__67B44C51]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RCOMISI] ADD  DEFAULT ((0)) FOR [Valor4]
GO
/****** Object:  Default [DF__RCOMISI__Campo1__68A8708A]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RCOMISI] ADD  DEFAULT (' ') FOR [Campo1]
GO
/****** Object:  Default [DF__RCOMISI__Campo2__699C94C3]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RCOMISI] ADD  DEFAULT (' ') FOR [Campo2]
GO
/****** Object:  Default [DF__RCOMISI__Campo3__6A90B8FC]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RCOMISI] ADD  DEFAULT (' ') FOR [Campo3]
GO
/****** Object:  Default [DF__RCOMISI__Campo4__6B84DD35]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RCOMISI] ADD  DEFAULT (' ') FOR [Campo4]
GO
/****** Object:  Default [DF__RCOMISI__Largo1__6C79016E]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RCOMISI] ADD  DEFAULT (' ') FOR [Largo1]
GO
/****** Object:  Default [DF__RCOMISI__Largo2__6D6D25A7]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RCOMISI] ADD  DEFAULT (' ') FOR [Largo2]
GO
/****** Object:  Default [DF__RCOMISI__Jdd__6E6149E0]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RCOMISI] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__RCOMCAR__Cargo__673F4B05]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RCOMCAR] ADD  DEFAULT (0) FOR [Cargo]
GO
/****** Object:  Default [DF__RCOMCAR__Compet__68336F3E]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RCOMCAR] ADD  DEFAULT (0) FOR [Compet]
GO
/****** Object:  Default [DF__RCOMCAR__Priori__69279377]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RCOMCAR] ADD  DEFAULT (0) FOR [Priori]
GO
/****** Object:  Default [DF__RCOMCAR__Sicap__6A1BB7B0]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RCOMCAR] ADD  DEFAULT (' ') FOR [Sicap]
GO
/****** Object:  Default [DF__RCOMCAR__Jdd__6B0FDBE9]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RCOMCAR] ADD  DEFAULT (0) FOR [Jdd]
GO
/****** Object:  Default [DF__RCLAREM__Codigo__220B0B18]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RCLAREM] ADD  DEFAULT (' ') FOR [Codigo]
GO
/****** Object:  Default [DF__RCLAREM__Cohade__22FF2F51]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RCLAREM] ADD  DEFAULT (' ') FOR [Cohade]
GO
/****** Object:  Default [DF__RCLAREM__Nro__23F3538A]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RCLAREM] ADD  DEFAULT (0) FOR [Nro]
GO
/****** Object:  Default [DF__RCLAREM__Tipo__24E777C3]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RCLAREM] ADD  DEFAULT (0) FOR [Tipo]
GO
/****** Object:  Default [DF__RCLAREM__Orden__25DB9BFC]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RCLAREM] ADD  DEFAULT (0) FOR [Orden]
GO
/****** Object:  Default [DF__RCLAREM__Periodo__26CFC035]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RCLAREM] ADD  DEFAULT (' ') FOR [Periodo]
GO
/****** Object:  Default [DF__RCLAREM__COFORM__27C3E46E]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RCLAREM] ADD  DEFAULT (' ') FOR [COFORM]
GO
/****** Object:  Default [DF__RCLAREM__CUOTOT__28B808A7]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RCLAREM] ADD  DEFAULT (0) FOR [CUOTOT]
GO
/****** Object:  Default [DF__RCLAREM__Cuopar__29AC2CE0]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RCLAREM] ADD  DEFAULT (0) FOR [Cuopar]
GO
/****** Object:  Default [DF__RCLAREM__Monto__2AA05119]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RCLAREM] ADD  DEFAULT (0) FOR [Monto]
GO
/****** Object:  Default [DF__RCLAREM__Fecha_c__2B947552]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RCLAREM] ADD  DEFAULT (getdate()) FOR [Fecha_cre]
GO
/****** Object:  Default [DF__RCLAREM__Fecha_i__2C88998B]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RCLAREM] ADD  DEFAULT (getdate()) FOR [Fecha_ini]
GO
/****** Object:  Default [DF__RCLAREM__Fecha_f__2D7CBDC4]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RCLAREM] ADD  DEFAULT (getdate()) FOR [Fecha_fin]
GO
/****** Object:  Default [DF__RCLAREM__Cencos__2E70E1FD]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RCLAREM] ADD  DEFAULT (0) FOR [Cencos]
GO
/****** Object:  Default [DF__RCLAREM__Cuenta__2F650636]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RCLAREM] ADD  DEFAULT (' ') FOR [Cuenta]
GO
/****** Object:  Default [DF__RCLAREM__Ticen__30592A6F]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RCLAREM] ADD  DEFAULT (' ') FOR [Ticen]
GO
/****** Object:  Default [DF__RCLAREM__Ctacor__314D4EA8]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RCLAREM] ADD  DEFAULT (' ') FOR [Ctacor]
GO
/****** Object:  Default [DF__RCLAREM__Obs__324172E1]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RCLAREM] ADD  DEFAULT (' ') FOR [Obs]
GO
/****** Object:  Default [DF__RCLAREM__Formula__3335971A]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RCLAREM] ADD  DEFAULT (' ') FOR [Formula]
GO
/****** Object:  Default [DF__RCLAREM__Coinst__3429BB53]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RCLAREM] ADD  DEFAULT (0) FOR [Coinst]
GO
/****** Object:  Default [DF__RCLAREM__Pone__351DDF8C]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RCLAREM] ADD  DEFAULT (' ') FOR [Pone]
GO
/****** Object:  Default [DF__RCLAREM__Grupo__361203C5]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RCLAREM] ADD  DEFAULT (0) FOR [Grupo]
GO
/****** Object:  Default [DF__RCLAREM__Condi__370627FE]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RCLAREM] ADD  DEFAULT (' ') FOR [Condi]
GO
/****** Object:  Default [DF__RCLAREM__Simes__37FA4C37]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RCLAREM] ADD  DEFAULT (' ') FOR [Simes]
GO
/****** Object:  Default [DF__RCLAREM__QuePeri__38EE7070]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RCLAREM] ADD  DEFAULT (' ') FOR [QuePeri]
GO
/****** Object:  Default [DF__RCLAREM__Jdd__39E294A9]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RCLAREM] ADD  DEFAULT (0) FOR [Jdd]
GO
/****** Object:  Default [DF__RCLAENC__Codigo__43A1090D]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RCLAENC] ADD  DEFAULT (' ') FOR [Codigo]
GO
/****** Object:  Default [DF__RCLAENC__Descrip__44952D46]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RCLAENC] ADD  DEFAULT (' ') FOR [Descrip]
GO
/****** Object:  Default [DF__RCLAENC__Codemp__4589517F]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RCLAENC] ADD  DEFAULT (' ') FOR [Codemp]
GO
/****** Object:  Default [DF__RCLAENC__Funda__467D75B8]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RCLAENC] ADD  DEFAULT (' ') FOR [Funda]
GO
/****** Object:  Default [DF__RCLAENC__Jdd__477199F1]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RCLAENC] ADD  DEFAULT (0) FOR [Jdd]
GO
/****** Object:  Default [DF__RCERTIREN__Rut__2D67AF2B]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RCERTIREN] ADD  DEFAULT (' ') FOR [Rut]
GO
/****** Object:  Default [DF__RCERTIREN__Ames__2E5BD364]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RCERTIREN] ADD  DEFAULT (' ') FOR [Ames]
GO
/****** Object:  Default [DF__RCERTIREN__Empre__2F4FF79D]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RCERTIREN] ADD  DEFAULT (' ') FOR [Empresa]
GO
/****** Object:  Default [DF__RCERTIREN__Rembr__30441BD6]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RCERTIREN] ADD  DEFAULT (0) FOR [Rembru]
GO
/****** Object:  Default [DF__RCERTIREN__Cotiz__3138400F]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RCERTIREN] ADD  DEFAULT (0) FOR [Cotiza]
GO
/****** Object:  Default [DF__RCERTIREN__Afect__322C6448]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RCERTIREN] ADD  DEFAULT (0) FOR [Afecto]
GO
/****** Object:  Default [DF__RCERTIREN__Impue__33208881]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RCERTIREN] ADD  DEFAULT (0) FOR [Impues]
GO
/****** Object:  Default [DF__RCERTIREN__Exent__3414ACBA]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RCERTIREN] ADD  DEFAULT (0) FOR [Exento]
GO
/****** Object:  Default [DF__RCERTIREN__Zonaf__3508D0F3]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RCERTIREN] ADD  DEFAULT (0) FOR [Zonafa]
GO
/****** Object:  Default [DF__RCERTIREN__Ppm__35FCF52C]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RCERTIREN] ADD  DEFAULT (0) FOR [Ppm]
GO
/****** Object:  Default [DF__RCERTIREN__facto__36F11965]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RCERTIREN] ADD  DEFAULT (0) FOR [factor]
GO
/****** Object:  Default [DF__RCERTIREN__aAfec__37E53D9E]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RCERTIREN] ADD  DEFAULT (0) FOR [aAfecto]
GO
/****** Object:  Default [DF__RCERTIREN__aImpu__38D961D7]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RCERTIREN] ADD  DEFAULT (0) FOR [aImpues]
GO
/****** Object:  Default [DF__RCERTIREN__aExen__39CD8610]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RCERTIREN] ADD  DEFAULT (0) FOR [aExento]
GO
/****** Object:  Default [DF__RCERTIREN__aZona__3AC1AA49]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RCERTIREN] ADD  DEFAULT (0) FOR [aZonafa]
GO
/****** Object:  Default [DF__RCERTIREN__aPpm__3BB5CE82]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RCERTIREN] ADD  DEFAULT (0) FOR [aPpm]
GO
/****** Object:  Default [DF__RCERTIREN__numce__3CA9F2BB]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RCERTIREN] ADD  DEFAULT (0) FOR [numcer]
GO
/****** Object:  Default [DF__RCERTIREN__Jdd__3D9E16F4]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RCERTIREN] ADD  DEFAULT (0) FOR [Jdd]
GO
/****** Object:  Default [DF__RCENTROS__Codigo__595B4002]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RCENTROS] ADD  DEFAULT (' ') FOR [Codigo]
GO
/****** Object:  Default [DF__RCENTROS__Ames__5A4F643B]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RCENTROS] ADD  DEFAULT (' ') FOR [Ames]
GO
/****** Object:  Default [DF__RCENTROS__Peri__5B438874]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RCENTROS] ADD  DEFAULT (' ') FOR [Peri]
GO
/****** Object:  Default [DF__RCENTROS__Period__5C37ACAD]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RCENTROS] ADD  DEFAULT (' ') FOR [Periodo]
GO
/****** Object:  Default [DF__RCENTROS__Cencos__5D2BD0E6]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RCENTROS] ADD  DEFAULT (0) FOR [Cencos]
GO
/****** Object:  Default [DF__RCENTROS__Porcen__5E1FF51F]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RCENTROS] ADD  DEFAULT (0) FOR [Porcen]
GO
/****** Object:  Default [DF__RCENTROS__Unids__5F141958]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RCENTROS] ADD  DEFAULT (0) FOR [Unids]
GO
/****** Object:  Default [DF__RCENTROS__Ticen__60083D91]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RCENTROS] ADD  DEFAULT (' ') FOR [Ticen]
GO
/****** Object:  Default [DF__RCENTROS__Jdd__60FC61CA]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RCENTROS] ADD  DEFAULT (0) FOR [Jdd]
GO
/****** Object:  Default [DF__RBECAS__RUT__4999D985]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RBECAS] ADD  DEFAULT (' ') FOR [RUT]
GO
/****** Object:  Default [DF__RBECAS__tipobeca__4A8DFDBE]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RBECAS] ADD  DEFAULT (' ') FOR [tipobeca]
GO
/****** Object:  Default [DF__RBECAS__fecha__4B8221F7]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RBECAS] ADD  DEFAULT (getdate()) FOR [fecha]
GO
/****** Object:  Default [DF__RBECAS__fecha_fi__4C764630]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RBECAS] ADD  DEFAULT (getdate()) FOR [fecha_fin]
GO
/****** Object:  Default [DF__RBECAS__instit__4D6A6A69]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RBECAS] ADD  DEFAULT (' ') FOR [instit]
GO
/****** Object:  Default [DF__RBECAS__observ__4E5E8EA2]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RBECAS] ADD  DEFAULT (' ') FOR [observ]
GO
/****** Object:  Default [DF__RBECAS__monto__4F52B2DB]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RBECAS] ADD  DEFAULT (0) FOR [monto]
GO
/****** Object:  Default [DF__RBECAS__Fecha_mo__5046D714]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RBECAS] ADD  DEFAULT (getdate()) FOR [Fecha_mod]
GO
/****** Object:  Default [DF__RBECAS__vobo__513AFB4D]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RBECAS] ADD  DEFAULT (0) FOR [vobo]
GO
/****** Object:  Default [DF__RBECAS__usrvobo__522F1F86]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RBECAS] ADD  DEFAULT (' ') FOR [usrvobo]
GO
/****** Object:  Default [DF__RAUSENT__Codigo__6CA31EA0]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RAUSENT] ADD  DEFAULT (' ') FOR [Codigo]
GO
/****** Object:  Default [DF__RAUSENT__Fecha_i__6D9742D9]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RAUSENT] ADD  DEFAULT (getdate()) FOR [Fecha_ini]
GO
/****** Object:  Default [DF__RAUSENT__Dias__6E8B6712]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RAUSENT] ADD  DEFAULT (0) FOR [Dias]
GO
/****** Object:  Default [DF__RAUSENT__Fecha_f__6F7F8B4B]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RAUSENT] ADD  DEFAULT (getdate()) FOR [Fecha_fin]
GO
/****** Object:  Default [DF__RAUSENT__Fecha_l__7073AF84]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RAUSENT] ADD  DEFAULT (getdate()) FOR [Fecha_lic]
GO
/****** Object:  Default [DF__RAUSENT__Rebsal__7167D3BD]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RAUSENT] ADD  DEFAULT (0) FOR [Rebsal]
GO
/****** Object:  Default [DF__RAUSENT__Escon__725BF7F6]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RAUSENT] ADD  DEFAULT (' ') FOR [Escon]
GO
/****** Object:  Default [DF__RAUSENT__Tipo__73501C2F]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RAUSENT] ADD  DEFAULT (0) FOR [Tipo]
GO
/****** Object:  Default [DF__RAUSENT__Dtipo__74444068]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RAUSENT] ADD  DEFAULT (' ') FOR [Dtipo]
GO
/****** Object:  Default [DF__RAUSENT__Causal__753864A1]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RAUSENT] ADD  DEFAULT (0) FOR [Causal]
GO
/****** Object:  Default [DF__RAUSENT__Dcausal__762C88DA]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RAUSENT] ADD  DEFAULT (' ') FOR [Dcausal]
GO
/****** Object:  Default [DF__RAUSENT__Detalle__7720AD13]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RAUSENT] ADD  DEFAULT (' ') FOR [Detalle]
GO
/****** Object:  Default [DF__RAUSENT__Medico__7814D14C]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RAUSENT] ADD  DEFAULT (' ') FOR [Medico]
GO
/****** Object:  Default [DF__RAUSENT__Nulic__7908F585]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RAUSENT] ADD  DEFAULT (0) FOR [Nulic]
GO
/****** Object:  Default [DF__RAUSENT__DiasE__79FD19BE]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RAUSENT] ADD  DEFAULT (0) FOR [DiasE]
GO
/****** Object:  Default [DF__RAUSENT__Medios__7AF13DF7]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RAUSENT] ADD  DEFAULT (' ') FOR [Medios]
GO
/****** Object:  Default [DF__RAUSENT__Diagnos__7BE56230]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RAUSENT] ADD  DEFAULT (0) FOR [Diagnos]
GO
/****** Object:  Default [DF__RAUSENT__Mailen__7CD98669]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RAUSENT] ADD  DEFAULT (0) FOR [Mailen]
GO
/****** Object:  Default [DF__RAUSENT__Jdd__7DCDAAA2]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RAUSENT] ADD  DEFAULT (0) FOR [Jdd]
GO
/****** Object:  Default [DF__RAUSENT__fecha_r__3BEAD8AC]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RAUSENT] ADD  DEFAULT (' ') FOR [fecha_ret]
GO
/****** Object:  Default [DF__RAUSENT__Rutpro__79B300FB]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RAUSENT] ADD  DEFAULT (' ') FOR [Rutpro]
GO
/****** Object:  Default [DF__RAUSENT__Especia__7AA72534]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RAUSENT] ADD  DEFAULT (1) FOR [Especia]
GO
/****** Object:  Default [DF__RAUSENT__MontoAn__7B9B496D]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RAUSENT] ADD  DEFAULT (0) FOR [MontoAn]
GO
/****** Object:  Default [DF__RAUSENT__MontoRe__7C8F6DA6]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RAUSENT] ADD  DEFAULT (0) FOR [MontoRe]
GO
/****** Object:  Default [DF__RAUSENT__MontoCo__7D8391DF]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RAUSENT] ADD  DEFAULT (0) FOR [MontoCo]
GO
/****** Object:  Default [DF__RAUSENT__Fecha_i__75AD65ED]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RAUSENT] ADD  DEFAULT (' ') FOR [Fecha_ico]
GO
/****** Object:  Default [DF__RAUSENT__fecha_e__0C5BC11B]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RAUSENT] ADD  DEFAULT (' ') FOR [fecha_env]
GO
/****** Object:  Default [DF__RAUSENT__estado__0D4FE554]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RAUSENT] ADD  DEFAULT (' ') FOR [estado]
GO
/****** Object:  Default [DF__RAUSENT__CodSub__0E44098D]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RAUSENT] ADD  DEFAULT (' ') FOR [CodSub]
GO
/****** Object:  Default [DF__RAUSENT__fecha_i__24334AAC]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RAUSENT] ADD  DEFAULT (' ') FOR [fecha_ing]
GO
/****** Object:  Default [DF__RAUSENT__usuario__25276EE5]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RAUSENT] ADD  DEFAULT (' ') FOR [usuario]
GO
/****** Object:  Default [DF__RAUSENT__origen__261B931E]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RAUSENT] ADD  DEFAULT (' ') FOR [origen]
GO
/****** Object:  Default [DF__RAUSENT__Dias3pd__7DD8979A]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RAUSENT] ADD  DEFAULT ((0)) FOR [Dias3pd]
GO
/****** Object:  Default [DF__RAUSENT__Fecha_u__7ECCBBD3]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RAUSENT] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(120)),(120))) FOR [Fecha_ult]
GO
/****** Object:  Default [DF__RAUSENT__SubsilB__7FC0E00C]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RAUSENT] ADD  DEFAULT ((0)) FOR [SubsilB]
GO
/****** Object:  Default [DF__RAUSENT__SubsilN__00B50445]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RAUSENT] ADD  DEFAULT ((0)) FOR [SubsilN]
GO
/****** Object:  Default [DF__RAUSENT__Dv__01741E54]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RAUSENT] ADD  DEFAULT (' ') FOR [Dv]
GO
/****** Object:  Default [DF__RASIGNA__Codigo__0E04126B]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RASIGNA] ADD  DEFAULT (' ') FOR [Codigo]
GO
/****** Object:  Default [DF__RASIGNA__Fecha_a__0EF836A4]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RASIGNA] ADD  DEFAULT (getdate()) FOR [Fecha_asi]
GO
/****** Object:  Default [DF__RASIGNA__Descrip__0FEC5ADD]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RASIGNA] ADD  DEFAULT (' ') FOR [Descrip]
GO
/****** Object:  Default [DF__RASIGNA__Valor__10E07F16]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RASIGNA] ADD  DEFAULT (0) FOR [Valor]
GO
/****** Object:  Default [DF__RASIGNA__Fecha_v__11D4A34F]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RASIGNA] ADD  DEFAULT (getdate()) FOR [Fecha_ven]
GO
/****** Object:  Default [DF__RASIGNA__Bien__12C8C788]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RASIGNA] ADD  DEFAULT (0) FOR [Bien]
GO
/****** Object:  Default [DF__RASIGNA__Respon__13BCEBC1]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RASIGNA] ADD  DEFAULT (' ') FOR [Respon]
GO
/****** Object:  Default [DF__RASIGNA__Obs__14B10FFA]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RASIGNA] ADD  DEFAULT (' ') FOR [Obs]
GO
/****** Object:  Default [DF__RASIGNA__Devuelt__15A53433]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RASIGNA] ADD  DEFAULT (' ') FOR [Devuelto]
GO
/****** Object:  Default [DF__RASIGNA__Jdd__1699586C]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RASIGNA] ADD  DEFAULT (0) FOR [Jdd]
GO
/****** Object:  Default [DF__RASIGNA__Cantid__7E77B618]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RASIGNA] ADD  DEFAULT (0) FOR [Cantid]
GO
/****** Object:  Default [DF__RALERTAS__Id__550B8C31]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RALERTAS] ADD  DEFAULT (0) FOR [Id]
GO
/****** Object:  Default [DF__RALERTAS__Descri__55FFB06A]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RALERTAS] ADD  DEFAULT (' ') FOR [Descrip]
GO
/****** Object:  Default [DF__RALERTAS__Estado__56F3D4A3]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RALERTAS] ADD  DEFAULT (' ') FOR [Estado]
GO
/****** Object:  Default [DF__RALERTAS__Ubica__57E7F8DC]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RALERTAS] ADD  DEFAULT (' ') FOR [Ubica]
GO
/****** Object:  Default [DF__RALERTAS__Proce__58DC1D15]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RALERTAS] ADD  DEFAULT (' ') FOR [Proce]
GO
/****** Object:  Default [DF__RALERTAS__Params__59D0414E]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RALERTAS] ADD  DEFAULT (' ') FOR [Params]
GO
/****** Object:  Default [DF__RALERTAS__Explic__5AC46587]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RALERTAS] ADD  DEFAULT (' ') FOR [Explica]
GO
/****** Object:  Default [DF__RALERTAS__Jdd__5BB889C0]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RALERTAS] ADD  DEFAULT (0) FOR [Jdd]
GO
/****** Object:  Default [DF__RAFECTOS__Codigo__5D6BC808]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RAFECTOS] ADD  DEFAULT (' ') FOR [Codigo]
GO
/****** Object:  Default [DF__RAFECTOS__Ames__5E5FEC41]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RAFECTOS] ADD  DEFAULT (' ') FOR [Ames]
GO
/****** Object:  Default [DF__RAFECTOS__Peri__5F54107A]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RAFECTOS] ADD  DEFAULT (' ') FOR [Peri]
GO
/****** Object:  Default [DF__RAFECTOS__Jdd__604834B3]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RAFECTOS] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__RAFECTOS__AF01__613C58EC]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RAFECTOS] ADD  DEFAULT ((0)) FOR [AF01]
GO
/****** Object:  Default [DF__RAFECTOS__AF02__62307D25]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RAFECTOS] ADD  DEFAULT ((0)) FOR [AF02]
GO
/****** Object:  Default [DF__RAFECTOS__AF03__6324A15E]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RAFECTOS] ADD  DEFAULT ((0)) FOR [AF03]
GO
/****** Object:  Default [DF__RAFECTOS__AF04__6418C597]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RAFECTOS] ADD  DEFAULT ((0)) FOR [AF04]
GO
/****** Object:  Default [DF__RAFECTOS__AF05__650CE9D0]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RAFECTOS] ADD  DEFAULT ((0)) FOR [AF05]
GO
/****** Object:  Default [DF__RAFECTOS__AF06__66010E09]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RAFECTOS] ADD  DEFAULT ((0)) FOR [AF06]
GO
/****** Object:  Default [DF__RAFECTOS__AF07__66F53242]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RAFECTOS] ADD  DEFAULT ((0)) FOR [AF07]
GO
/****** Object:  Default [DF__RAFECTOS__AF08__67E9567B]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RAFECTOS] ADD  DEFAULT ((0)) FOR [AF08]
GO
/****** Object:  Default [DF__RAFECTOS__AF09__68DD7AB4]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RAFECTOS] ADD  DEFAULT ((0)) FOR [AF09]
GO
/****** Object:  Default [DF__RAFECTOS__AF10__69D19EED]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RAFECTOS] ADD  DEFAULT ((0)) FOR [AF10]
GO
/****** Object:  Default [DF__RAFECTOS__AF11__6AC5C326]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RAFECTOS] ADD  DEFAULT ((0)) FOR [AF11]
GO
/****** Object:  Default [DF__RAFECTOS__AF12__6BB9E75F]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RAFECTOS] ADD  DEFAULT ((0)) FOR [AF12]
GO
/****** Object:  Default [DF__RAFECTOS__AF13__6CAE0B98]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RAFECTOS] ADD  DEFAULT ((0)) FOR [AF13]
GO
/****** Object:  Default [DF__RAFECTOS__AF14__6DA22FD1]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RAFECTOS] ADD  DEFAULT ((0)) FOR [AF14]
GO
/****** Object:  Default [DF__RAFECTOS__AF15__6E96540A]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RAFECTOS] ADD  DEFAULT ((0)) FOR [AF15]
GO
/****** Object:  Default [DF__RAFECTOS__AF16__6F8A7843]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RAFECTOS] ADD  DEFAULT ((0)) FOR [AF16]
GO
/****** Object:  Default [DF__RAFECTOS__AF17__707E9C7C]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RAFECTOS] ADD  DEFAULT ((0)) FOR [AF17]
GO
/****** Object:  Default [DF__RAFECTOS__AF18__7172C0B5]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RAFECTOS] ADD  DEFAULT ((0)) FOR [AF18]
GO
/****** Object:  Default [DF__RAFECTOS__AF19__7266E4EE]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RAFECTOS] ADD  DEFAULT ((0)) FOR [AF19]
GO
/****** Object:  Default [DF__RAFECTOS__AF20__735B0927]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RAFECTOS] ADD  DEFAULT ((0)) FOR [AF20]
GO
/****** Object:  Default [DF__RAFECTOS__AF21__7CAF6937]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RAFECTOS] ADD  DEFAULT ((0)) FOR [AF21]
GO
/****** Object:  Default [DF__RAFECTOS__AF22__7DA38D70]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RAFECTOS] ADD  DEFAULT ((0)) FOR [AF22]
GO
/****** Object:  Default [DF__RAFECTOS__AF23__7E97B1A9]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RAFECTOS] ADD  DEFAULT ((0)) FOR [AF23]
GO
/****** Object:  Default [DF__RAFECTOS__AF24__7F8BD5E2]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RAFECTOS] ADD  DEFAULT ((0)) FOR [AF24]
GO
/****** Object:  Default [DF__RAFECTOS__AF25__007FFA1B]    Script Date: 10/19/2015 16:18:39 ******/
ALTER TABLE [dbo].[RAFECTOS] ADD  DEFAULT ((0)) FOR [AF25]
GO
