--/****** Object:  StoredProcedure [rionapo].[LaVersion]    Script Date: 10/19/2015 10:35:08 ******/
--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO
--/*---------------------------------------------------------------------------
--                          Lee un valor desde una tabla.
------------------------------------------------------------------------------
--RCM 05.dic.01 -Se agrego Codal.
--RCM 04.oct.01 -Valor 4 a 15.
--RCM 21.sep.04 -Version inicial.
----------------------------------------------------------------------------*/
--CREATE PROCEDURE [rionapo].[LaVersion]  @ver varchar(200) output

--AS
--select @ver = @@version
--return
--GO
/****** Object:  Table [dbo].[LaunchServers]    Script Date: 10/19/2015 10:35:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LaunchServers](
	[IdLaunch] [int] IDENTITY(1,1) NOT NULL,
	[UrlServ] [char](100) NOT NULL,
	[ServName] [char](50) NOT NULL,
	[CPU] [int] NOT NULL,
	[SrvState] [char](1) NOT NULL,
	[LastRun] [datetime] NOT NULL,
 CONSTRAINT [PK_LaunchServers] PRIMARY KEY CLUSTERED 
(
	[IdLaunch] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  UserDefinedFunction [dbo].[Convertir_Horas]    Script Date: 10/19/2015 10:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[Convertir_Horas] (@lfHoras decimal(8, 4)) returns varchar(5) 
 AS 
BEGIN 
  declare @minutos int 
  declare @horas int 
  declare @horx varchar(2) 
  declare @minx varchar(2) 
  
  select @horas = Round(@lfHoras, 0,1) 
  select @minutos = Round((@lfHoras - @horas) * 60, 0) 
  If @minutos = 60 
  Begin 
    set @minutos = 0 
    set @horas = @horas + 1 
  End 
  select @horx = convert(varchar(2),@horas) 
  select @minx = convert(varchar(2),@minutos) 
  return REPLICATE('0',2-LEN(@horx)) + @horx + ':' + REPLICATE('0',2-LEN(@minx)) + @minx 
END
GO
/****** Object:  UserDefinedFunction [dbo].[HoraAEntero]    Script Date: 10/19/2015 10:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[HoraAEntero] (@horaS varchar(5)) returns int 
 AS 
BEGIN 
 Declare @hora int 
 Declare @min int 
 Declare @horaEntero int 
 
 select @hora = convert(int,substring(@horaS,1,2)) 
 select @min = convert(int,substring(@horaS,4,2)) 
 select @horaEntero = ((@hora * 60) + @min) 
 Return @horaEntero 
END
GO
/****** Object:  Table [dbo].[PCPwrkusr]    Script Date: 10/19/2015 10:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PCPwrkusr](
	[idWrkflw] [int] NOT NULL,
	[Usuario] [char](12) NOT NULL,
	[Modifica] [char](1) NOT NULL,
	[Jdd] [int] NOT NULL,
 CONSTRAINT [PK_PCPwrkusr] PRIMARY KEY CLUSTERED 
(
	[Jdd] ASC,
	[idWrkflw] ASC,
	[Usuario] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PCPwrkflw]    Script Date: 10/19/2015 10:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PCPwrkflw](
	[idWrkflw] [int] IDENTITY(1,1) NOT NULL,
	[Tipo] [int] NOT NULL,
	[Etapa] [int] NOT NULL,
	[Etapasig] [int] NOT NULL,
	[idItems] [int] NOT NULL,
	[Tipo_nodo] [int] NOT NULL,
	[Jdd] [int] NOT NULL,
 CONSTRAINT [PK_PCPwrkflw] PRIMARY KEY CLUSTERED 
(
	[Jdd] ASC,
	[idWrkflw] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PCPRvacaci]    Script Date: 10/19/2015 10:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PCPRvacaci](
	[Codigo] [char](12) NOT NULL,
	[Nombre] [char](60) NOT NULL,
	[Feini] [datetime] NOT NULL,
	[Dias] [numeric](6, 2) NOT NULL,
	[Status] [char](1) NOT NULL,
	[Opd] [int] NOT NULL,
	[DiasI] [int] NOT NULL,
	[Fefin] [datetime] NOT NULL,
	[Fecha_ret] [datetime] NOT NULL,
	[Dmi] [int] NOT NULL,
	[Dmf] [int] NOT NULL,
	[Numrem] [int] NOT NULL,
	[Numdoc] [int] NOT NULL,
	[Ampm] [int] NOT NULL,
	[Motanul] [char](30) NOT NULL,
	[Pertom] [char](20) NOT NULL,
	[Jdd] [int] NOT NULL,
	[IDOT] [int] NOT NULL,
	[PCPEstado] [int] NOT NULL,
	[PCPErrores] [varchar](200) NOT NULL,
	[IDvacaci] [int] IDENTITY(1,1) NOT NULL,
	[Linea_wfl] [int] NOT NULL,
	[Etapa_wfl] [int] NOT NULL,
	[Etasig_wfl] [int] NOT NULL,
	[Orden_wfl] [int] NOT NULL,
	[Estado_wfl] [int] NOT NULL,
	[User_wfl] [char](12) NOT NULL,
	[Fecha_wfl] [datetime] NOT NULL,
	[Obser_wfl] [char](200) NOT NULL,
 CONSTRAINT [PK_PCPRvacaci] PRIMARY KEY CLUSTERED 
(
	[IDvacaci] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PCPRmapitm]    Script Date: 10/19/2015 10:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PCPRmapitm](
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
	[Obs] [char](40) NOT NULL,
	[Formula] [char](80) NOT NULL,
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
	[Fecha_ing] [datetime] NOT NULL,
	[Fecha_apr] [datetime] NOT NULL,
	[Codigo_in] [char](12) NOT NULL,
	[Codigo_ap] [char](12) NOT NULL,
	[Plantilla] [char](10) NOT NULL,
	[Ames] [char](6) NOT NULL,
	[Jdd] [int] NOT NULL,
	[IDOT] [int] NOT NULL,
	[PCPEstado] [int] NOT NULL,
	[PCPErrores] [varchar](200) NOT NULL,
	[IDPCPRmap] [int] IDENTITY(1,1) NOT NULL,
	[Iddonat] [int] NOT NULL,
	[Linea_wfl] [int] NOT NULL,
	[Etapa_wfl] [int] NOT NULL,
	[Etasig_wfl] [int] NOT NULL,
	[Orden_wfl] [int] NOT NULL,
	[Estado_wfl] [int] NOT NULL,
	[User_wfl] [char](12) NOT NULL,
	[Fecha_wfl] [datetime] NOT NULL,
	[Obser_wfl] [char](200) NOT NULL,
 CONSTRAINT [PK_PCPRmapitm] PRIMARY KEY CLUSTERED 
(
	[IDPCPRmap] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PCPRgrupfa]    Script Date: 10/19/2015 10:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PCPRgrupfa](
	[Jdd] [int] NOT NULL,
	[Codigo] [char](12) NOT NULL,
	[Nombre] [char](60) NOT NULL,
	[Rut_Carga] [char](12) NOT NULL,
	[Identidad] [int] NOT NULL,
	[Nom_Carga] [char](20) NOT NULL,
	[Ape_Carga] [char](20) NOT NULL,
	[Mat_Carga] [char](20) NOT NULL,
	[Apc] [char](15) NOT NULL,
	[Pariente] [int] NOT NULL,
	[Desc_par] [char](10) NOT NULL,
	[Sexo] [char](1) NOT NULL,
	[Fecha_nac] [datetime] NOT NULL,
	[Tipo_doc] [int] NOT NULL,
	[Numdoc] [char](11) NOT NULL,
	[Gensal] [char](1) NOT NULL,
	[Rebimp] [int] NOT NULL,
	[Estudios] [int] NOT NULL,
	[Desc_est] [char](10) NOT NULL,
	[Fecha_alt] [datetime] NOT NULL,
	[Fecha_baj] [datetime] NOT NULL,
	[Invalid] [int] NOT NULL,
	[Preexis] [char](60) NOT NULL,
	[Relacion] [int] NOT NULL,
	[Curso] [int] NOT NULL,
	[RetJud] [char](1) NOT NULL,
	[Carsal] [char](1) NOT NULL,
	[Matri_fec] [datetime] NOT NULL,
	[Matri_cer] [int] NOT NULL,
	[Naci_fec] [datetime] NOT NULL,
	[Naci_cer] [int] NOT NULL,
	[Prena_fec] [datetime] NOT NULL,
	[Prena_cer] [int] NOT NULL,
	[Estu_fec] [datetime] NOT NULL,
	[Estu_cer] [int] NOT NULL,
	[Fecha_aig] [datetime] NOT NULL,
	[Fecha_big] [datetime] NOT NULL,
	[AfpVol] [char](1) NOT NULL,
	[AfpCod] [int] NOT NULL,
	[AfpNper] [int] NOT NULL,
	[AfpMonto] [money] NOT NULL,
	[AfpCoform] [char](4) NOT NULL,
	[AfpDesde] [datetime] NOT NULL,
	[AfpHasta] [datetime] NOT NULL,
	[AhoVol] [char](1) NOT NULL,
	[AhoMonto] [money] NOT NULL,
	[AhoCoform] [char](4) NOT NULL,
	[IDOT] [int] NOT NULL,
	[PCPEstado] [int] NOT NULL,
	[PCPErrores] [varchar](200) NOT NULL,
	[IDPCPRgru] [int] IDENTITY(1,1) NOT NULL,
	[Linea_wfl] [int] NOT NULL,
	[Etapa_wfl] [int] NOT NULL,
	[Etasig_wfl] [int] NOT NULL,
	[Orden_wfl] [int] NOT NULL,
	[Estado_wfl] [int] NOT NULL,
	[User_wfl] [char](12) NOT NULL,
	[Fecha_wfl] [datetime] NOT NULL,
	[Obser_wfl] [char](200) NOT NULL,
 CONSTRAINT [PK_PCPRgrupfa] PRIMARY KEY CLUSTERED 
(
	[IDPCPRgru] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PCPRemples]    Script Date: 10/19/2015 10:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PCPRemples](
	[Jdd] [int] NOT NULL,
	[Codigo] [char](12) NOT NULL,
	[Estado] [char](1) NOT NULL,
	[NFicha] [int] NOT NULL,
	[EsFpri] [char](1) NOT NULL,
	[Tiprem] [char](1) NOT NULL,
	[Empresa] [char](3) NOT NULL,
	[Nombre] [char](60) NOT NULL,
	[Rut] [char](12) NOT NULL,
	[Sexo] [char](1) NOT NULL,
	[Direccion] [char](128) NOT NULL,
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
	[Autoriza] [char](12) NOT NULL,
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
	[Ocupacion] [char](50) NOT NULL,
	[CodOcupa] [int] NOT NULL,
	[Grado] [int] NOT NULL,
	[Division] [int] NOT NULL,
	[Unidad] [int] NOT NULL,
	[Horario] [int] NOT NULL,
	[Convenio] [int] NOT NULL,
	[Confid] [char](1) NOT NULL,
	[Seccion] [int] NOT NULL,
	[Sit_lab] [int] NOT NULL,
	[CARNET] [char](2) NOT NULL,
	[Fpago] [int] NOT NULL,
	[Fpago2] [int] NOT NULL,
	[Banco] [int] NOT NULL,
	[Banco2] [int] NOT NULL,
	[Cta_corr] [char](26) NOT NULL,
	[Cta_corr2] [char](26) NOT NULL,
	[Ffp] [numeric](5, 2) NOT NULL,
	[Ffp2] [numeric](5, 2) NOT NULL,
	[Ofiban] [int] NOT NULL,
	[Ofiban2] [int] NOT NULL,
	[Talla_r] [char](4) NOT NULL,
	[Talla_z] [char](5) NOT NULL,
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
	[Vac_form] [char](4) NOT NULL,
	[Vac_anre] [numeric](6, 2) NOT NULL,
	[Fecha_rea] [datetime] NOT NULL,
	[Vac_ini] [numeric](7, 2) NOT NULL,
	[Vac_base] [int] NOT NULL,
	[Asigfam] [char](1) NOT NULL,
	[Fecha_lic] [datetime] NOT NULL,
	[Anexo] [int] NOT NULL,
	[Apc] [char](50) NOT NULL,
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
	[Sdato] [char](30) NOT NULL,
	[Credenc] [char](16) NOT NULL,
	[Ticket] [char](1) NOT NULL,
	[Fecha_sec] [datetime] NOT NULL,
	[Tipcon] [char](1) NOT NULL,
	[Cheres] [char](1) NOT NULL,
	[Chenum] [int] NOT NULL,
	[Cheval] [money] NOT NULL,
	[Peri] [char](1) NOT NULL,
	[Sicontra] [char](1) NOT NULL,
	[fecha_rct] [datetime] NOT NULL,
	[Evaluador] [char](12) NOT NULL,
	[Esrecon] [char](1) NOT NULL,
	[IndMonto] [money] NOT NULL,
	[IndDias] [int] NOT NULL,
	[FechaApvc] [datetime] NOT NULL,
	[EstApvc] [char](1) NOT NULL,
	[UserAD] [char](50) NOT NULL,
	[FechaSjov] [datetime] NOT NULL,
	[Jornada] [char](1) NOT NULL,
	[Sdato2] [char](50) NOT NULL,
	[JorCont] [char](1) NOT NULL,
	[Pjortm] [char](1) NOT NULL,
	[Psujhn] [char](1) NOT NULL,
	[PingSt] [char](1) NOT NULL,
	[Pafisp] [char](1) NOT NULL,
	[Pdisca] [char](1) NOT NULL,
	[P5taex] [char](1) NOT NULL,
	[Pmadres] [char](1) NOT NULL,
	[Pindom] [char](1) NOT NULL,
	[cta_inter] [char](26) NOT NULL,
	[cta_inte2] [char](26) NOT NULL,
	[dir_trab] [int] NOT NULL,
	[fp2benef] [int] NOT NULL,
	[AutFirmar] [char](1) NOT NULL,
	[Premint] [char](1) NOT NULL,
	[PorcUnif] [numeric](3, 2) NOT NULL,
	[Cod_dni] [int] NOT NULL,
	[Fecha_ult] [datetime] NOT NULL,
	[Cargo_est] [int] NOT NULL,
	[Srsicoss] [int] NOT NULL,
	[Ccsicoss] [int] NOT NULL,
	[IDOT] [int] NOT NULL,
	[PCPestado] [int] NOT NULL,
	[PCPErrores] [varchar](200) NOT NULL,
	[IDEmpleado] [int] IDENTITY(1,1) NOT NULL,
	[Linea_wfl] [int] NOT NULL,
	[Orden_wfl] [int] NOT NULL,
	[Etapa_wfl] [int] NOT NULL,
	[Etasig_wfl] [int] NOT NULL,
	[Estado_wfl] [int] NOT NULL,
	[User_wfl] [char](12) NOT NULL,
	[Fecha_wfl] [datetime] NOT NULL,
	[Obser_wfl] [char](200) NOT NULL,
 CONSTRAINT [PK_PCPRemples] PRIMARY KEY CLUSTERED 
(
	[IDEmpleado] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PCPRdomic]    Script Date: 10/19/2015 10:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PCPRdomic](
	[Jdd] [int] NOT NULL,
	[Codigo] [char](12) NOT NULL,
	[Nombre] [char](60) NOT NULL,
	[Calle] [char](25) NOT NULL,
	[Nro] [char](6) NOT NULL,
	[Piso] [char](2) NOT NULL,
	[Depto] [char](5) NOT NULL,
	[Comuna] [int] NOT NULL,
	[Ciudad] [char](20) NOT NULL,
	[Region] [int] NOT NULL,
	[IDOT] [int] NOT NULL,
	[PCPEstado] [int] NOT NULL,
	[PCPErrores] [varchar](200) NOT NULL,
	[IDRdomic] [int] IDENTITY(1,1) NOT NULL,
	[Codpostal] [char](8) NOT NULL,
	[Lote] [char](4) NOT NULL,
	[Km] [char](4) NOT NULL,
	[Block] [char](4) NOT NULL,
	[Etapa] [char](4) NOT NULL,
	[Manzana] [char](4) NOT NULL,
	[NombreZona] [char](20) NOT NULL,
	[Referencia] [char](40) NOT NULL,
	[Ubigeo] [char](6) NOT NULL,
	[Linea_wfl] [int] NOT NULL,
	[Etapa_wfl] [int] NOT NULL,
	[Etasig_wfl] [int] NOT NULL,
	[Orden_wfl] [int] NOT NULL,
	[Estado_wfl] [int] NOT NULL,
	[User_wfl] [char](12) NOT NULL,
	[Fecha_wfl] [datetime] NOT NULL,
	[Obser_wfl] [char](200) NOT NULL,
 CONSTRAINT [PK_PCPRdomic] PRIMARY KEY CLUSTERED 
(
	[IDRdomic] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PCPRausent]    Script Date: 10/19/2015 10:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PCPRausent](
	[Codigo] [char](12) NOT NULL,
	[Nombre] [char](60) NOT NULL,
	[Fecha_lic] [datetime] NOT NULL,
	[Dias] [numeric](6, 2) NOT NULL,
	[Rebsal] [int] NOT NULL,
	[Escon] [char](1) NOT NULL,
	[Tipo] [int] NOT NULL,
	[Dtipo] [char](12) NOT NULL,
	[Causal] [int] NOT NULL,
	[Dcausal] [char](20) NOT NULL,
	[Detalle] [char](200) NOT NULL,
	[Rutpro] [char](12) NOT NULL,
	[Medico] [char](30) NOT NULL,
	[Especia] [int] NOT NULL,
	[Nulic] [int] NOT NULL,
	[DiasE] [int] NOT NULL,
	[Medios] [char](1) NOT NULL,
	[Diagnos] [int] NOT NULL,
	[Mailen] [int] NOT NULL,
	[MontoAn] [money] NOT NULL,
	[MontoRe] [money] NOT NULL,
	[MontoCo] [money] NOT NULL,
	[Estado] [char](1) NOT NULL,
	[Fecha_env] [datetime] NOT NULL,
	[Fecha_ico] [datetime] NOT NULL,
	[CodSub] [char](1) NOT NULL,
	[Origen] [char](1) NOT NULL,
	[Fecha_ing] [datetime] NOT NULL,
	[Usuario] [char](12) NOT NULL,
	[Lscan] [varbinary](max) NOT NULL,
	[Fecha_ret] [datetime] NOT NULL,
	[Fecha_ini] [datetime] NOT NULL,
	[Fecha_fin] [datetime] NOT NULL,
	[Dv] [char](1) NOT NULL,
	[Jdd] [int] NOT NULL,
	[IDOT] [int] NOT NULL,
	[PCPEstado] [int] NOT NULL,
	[PCPErrores] [varchar](200) NOT NULL,
	[IDAusent] [int] IDENTITY(1,1) NOT NULL,
	[Linea_wfl] [int] NOT NULL,
	[Etapa_wfl] [int] NOT NULL,
	[Etasig_wfl] [int] NOT NULL,
	[Orden_wfl] [int] NOT NULL,
	[Estado_wfl] [int] NOT NULL,
	[User_wfl] [char](12) NOT NULL,
	[Fecha_wfl] [datetime] NOT NULL,
	[Obser_wfl] [char](200) NOT NULL,
 CONSTRAINT [PK_PCPRausent] PRIMARY KEY CLUSTERED 
(
	[IDAusent] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PCPPLANT]    Script Date: 10/19/2015 10:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PCPPLANT](
	[idPlant] [int] IDENTITY(1,1) NOT NULL,
	[Titulo] [varchar](50) NOT NULL,
	[Descrip] [varchar](100) NOT NULL,
	[Tipo] [int] NOT NULL,
	[Nomplant] [varchar](50) NOT NULL,
	[Extension] [char](5) NOT NULL,
	[Plantilla] [varbinary](max) NOT NULL,
	[Usuario] [char](12) NOT NULL,
	[Fecha] [datetime] NOT NULL,
	[Jdd] [int] NOT NULL,
	[TienePlant] [char](1) NOT NULL,
 CONSTRAINT [PK_PCPPLANT] PRIMARY KEY CLUSTERED 
(
	[idPlant] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PCPOT]    Script Date: 10/19/2015 10:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PCPOT](
	[idOT] [int] IDENTITY(1,1) NOT NULL,
	[Tipo] [int] NOT NULL,
	[Fecha] [datetime] NOT NULL,
	[Resumen] [varchar](max) NOT NULL,
	[Usuario] [char](12) NOT NULL,
	[Jdd] [int] NOT NULL,
	[Perfil] [char](12) NOT NULL,
	[Fecha_Env] [datetime] NOT NULL,
	[Fecha_Rec] [datetime] NOT NULL,
	[idItems] [int] NOT NULL,
 CONSTRAINT [PK_PCPOT] PRIMARY KEY CLUSTERED 
(
	[idOT] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PCPNovF]    Script Date: 10/19/2015 10:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PCPNovF](
	[Codigo] [char](12) NOT NULL,
	[Nombre] [char](60) NOT NULL,
	[Campo1] [varchar](25) NOT NULL,
	[Valor1] [varchar](40) NOT NULL,
	[Campo2] [varchar](25) NOT NULL,
	[Valor2] [varchar](40) NOT NULL,
	[Campo3] [varchar](25) NOT NULL,
	[Valor3] [varchar](40) NOT NULL,
	[Campo4] [varchar](25) NOT NULL,
	[Valor4] [varchar](40) NOT NULL,
	[rt1] [int] NOT NULL,
	[rt2] [int] NOT NULL,
	[rt3] [int] NOT NULL,
	[rt4] [int] NOT NULL,
	[Porc] [money] NOT NULL,
	[Jdd] [int] NOT NULL,
	[IDOT] [int] NOT NULL,
	[PCPEstado] [int] NOT NULL,
	[PCPErrores] [varchar](200) NOT NULL,
	[IDPCPNovf] [int] IDENTITY(1,1) NOT NULL,
	[Linea_wfl] [int] NOT NULL,
	[Etapa_wfl] [int] NOT NULL,
	[Etasig_wfl] [int] NOT NULL,
	[Orden_wfl] [int] NOT NULL,
	[Estado_wfl] [int] NOT NULL,
	[User_wfl] [char](12) NOT NULL,
	[Fecha_wfl] [datetime] NOT NULL,
	[Obser_wfl] [char](200) NOT NULL,
 CONSTRAINT [PK_PCPNovF] PRIMARY KEY CLUSTERED 
(
	[IDPCPNovf] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PCPNOVED]    Script Date: 10/19/2015 10:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PCPNOVED](
	[idNov] [int] IDENTITY(1,1) NOT NULL,
	[fecha] [datetime] NOT NULL,
	[juegodatos] [char](15) NOT NULL,
	[idJdd] [int] NOT NULL,
	[Tipo] [char](1) NOT NULL,
	[Jdd] [int] NOT NULL,
 CONSTRAINT [PK_PCPNOVED] PRIMARY KEY CLUSTERED 
(
	[Jdd] ASC,
	[idNov] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PCPMENSEST]    Script Date: 10/19/2015 10:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PCPMENSEST](
	[idEstMens] [int] IDENTITY(1,1) NOT NULL,
	[idMensaje] [int] NOT NULL,
	[estado] [char](1) NOT NULL,
	[fecha] [datetime] NOT NULL,
	[usuario] [char](12) NOT NULL,
	[Jdd] [int] NOT NULL,
 CONSTRAINT [PK_PCPMENSEST] PRIMARY KEY CLUSTERED 
(
	[idEstMens] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PCPMENSDET]    Script Date: 10/19/2015 10:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PCPMENSDET](
	[idMensaje] [int] NOT NULL,
	[Secuen_Det] [int] IDENTITY(1,1) NOT NULL,
	[Fecha] [datetime] NOT NULL,
	[Cuerpo] [varchar](500) NOT NULL,
	[Usuario] [char](12) NOT NULL,
	[Jdd] [int] NOT NULL,
 CONSTRAINT [PK_PCPMENSDET] PRIMARY KEY CLUSTERED 
(
	[Secuen_Det] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PCPMENSAJ]    Script Date: 10/19/2015 10:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PCPMENSAJ](
	[idMensaje] [int] IDENTITY(1,1) NOT NULL,
	[Usuario] [char](12) NOT NULL,
	[tipo_mensa] [int] NOT NULL,
	[asunto_men] [varchar](80) NOT NULL,
	[Jdd] [int] NOT NULL,
 CONSTRAINT [PK_PCPMENSAJ] PRIMARY KEY CLUSTERED 
(
	[idMensaje] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PCPMENSADJUN]    Script Date: 10/19/2015 10:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PCPMENSADJUN](
	[idAdjunt] [int] IDENTITY(1,1) NOT NULL,
	[Secuen_Det] [int] NOT NULL,
	[Docum] [varbinary](max) NOT NULL,
	[TipoArch] [varchar](100) NOT NULL,
	[NombreArch] [varchar](255) NOT NULL,
	[Jdd] [int] NOT NULL,
 CONSTRAINT [PK_PCPMENSADJUN] PRIMARY KEY CLUSTERED 
(
	[idAdjunt] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PCPItemsD]    Script Date: 10/19/2015 10:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PCPItemsD](
	[IDPCPitems] [int] NOT NULL,
	[Cohade] [char](6) NOT NULL,
	[Nro] [int] NOT NULL,
	[Titulo] [char](16) NOT NULL,
	[Coform] [char](4) NOT NULL,
	[Cuotot] [int] NOT NULL,
	[Cuopar] [int] NOT NULL,
	[Fecha_ini] [datetime] NOT NULL,
	[Fecha_fin] [datetime] NOT NULL,
	[Cencos] [int] NOT NULL,
	[Cuenta] [char](14) NOT NULL,
	[Ticen] [char](1) NOT NULL,
	[Obs] [char](40) NOT NULL,
	[Grupo] [int] NOT NULL,
	[Simes] [char](1) NOT NULL,
	[Codpres] [int] NOT NULL,
	[Propor] [char](1) NOT NULL,
	[Coinst] [int] NOT NULL,
	[PerImp] [int] NOT NULL,
	[Acumu] [money] NOT NULL,
	[Maximo] [money] NOT NULL,
	[Tiacu] [char](1) NOT NULL,
	[HNro] [int] NOT NULL,
	[HCoform] [int] NOT NULL,
	[HCuotot] [int] NOT NULL,
	[HCuopar] [int] NOT NULL,
	[HFecha_ini] [int] NOT NULL,
	[HFecha_fin] [int] NOT NULL,
	[HCencos] [int] NOT NULL,
	[HCuenta] [int] NOT NULL,
	[HTicen] [int] NOT NULL,
	[HObs] [int] NOT NULL,
	[HGrupo] [int] NOT NULL,
	[HSimes] [int] NOT NULL,
	[HCodpres] [int] NOT NULL,
	[HPropor] [int] NOT NULL,
	[HCoinst] [int] NOT NULL,
	[HPerImp] [int] NOT NULL,
	[HAcumu] [int] NOT NULL,
	[HTiacu] [int] NOT NULL,
	[Jdd] [int] NOT NULL,
	[IDPCPItemd] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_PCPItemsD] PRIMARY KEY CLUSTERED 
(
	[IDPCPItemd] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PCPItems]    Script Date: 10/19/2015 10:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PCPItems](
	[IDItems] [int] IDENTITY(1,1) NOT NULL,
	[Descrip] [char](30) NOT NULL,
	[Jdd] [int] NOT NULL,
	[UsuarioC] [char](12) NOT NULL,
	[FechaC] [datetime] NOT NULL,
	[UsuarioM] [char](12) NOT NULL,
	[FechaM] [datetime] NOT NULL,
	[Perfiles] [char](50) NOT NULL,
 CONSTRAINT [PK_PCPItems] PRIMARY KEY CLUSTERED 
(
	[IDItems] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[pcpestad]    Script Date: 10/19/2015 10:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[pcpestad](
	[Actividad] [int] NOT NULL,
	[Fteorica] [datetime] NOT NULL,
	[Act_desc] [char](60) NOT NULL,
	[Freal] [datetime] NOT NULL,
	[Atraso] [int] NOT NULL,
	[Ames] [char](6) NOT NULL,
	[status] [int] NOT NULL,
	[Responsab] [char](10) NOT NULL,
	[Status1] [char](60) NOT NULL,
	[Status2] [char](60) NOT NULL,
	[Grupo] [int] NOT NULL,
	[Grupo_desc] [char](60) NOT NULL,
	[Subgeren] [char](60) NOT NULL,
	[Gerencia] [char](60) NOT NULL,
	[Idjdd] [char](15) NOT NULL,
	[Idjdd_desc] [char](60) NOT NULL,
	[Idcliente] [int] NOT NULL,
	[Cliente] [char](60) NOT NULL,
	[jdd] [int] NOT NULL,
 CONSTRAINT [PK_pcpestad] PRIMARY KEY CLUSTERED 
(
	[jdd] ASC,
	[Actividad] ASC,
	[Ames] ASC,
	[Idjdd] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[pcperrpro]    Script Date: 10/19/2015 10:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[pcperrpro](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Idestado] [int] NOT NULL,
	[Descrip] [varchar](500) NOT NULL,
	[jdd] [int] NOT NULL,
 CONSTRAINT [PK_pcperrpro] PRIMARY KEY CLUSTERED 
(
	[jdd] ASC,
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PCPComisi]    Script Date: 10/19/2015 10:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PCPComisi](
	[Ames] [char](6) NOT NULL,
	[Peri] [char](1) NOT NULL,
	[Codigo] [char](12) NOT NULL,
	[Nombre] [char](60) NOT NULL,
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
	[IDOT] [int] NOT NULL,
	[PCPEstado] [int] NOT NULL,
	[PCPErrores] [varchar](200) NOT NULL,
	[IDPCPComis] [int] IDENTITY(1,1) NOT NULL,
	[Linea_wfl] [int] NOT NULL,
	[Etapa_wfl] [int] NOT NULL,
	[Etasig_wfl] [int] NOT NULL,
	[Orden_wfl] [int] NOT NULL,
	[Estado_wfl] [int] NOT NULL,
	[User_wfl] [char](12) NOT NULL,
	[Fecha_wfl] [datetime] NOT NULL,
	[Obser_wfl] [char](200) NOT NULL,
 CONSTRAINT [PK_PCPComisi] PRIMARY KEY CLUSTERED 
(
	[IDPCPComis] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PCPCARGEST]    Script Date: 10/19/2015 10:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PCPCARGEST](
	[idCarga] [int] NOT NULL,
	[idEstado] [int] IDENTITY(1,1) NOT NULL,
	[Estado] [int] NOT NULL,
	[Fecha] [datetime] NOT NULL,
	[Usuario] [char](12) NOT NULL,
	[Jdd] [int] NOT NULL,
 CONSTRAINT [PK_PCPCARGEST] PRIMARY KEY CLUSTERED 
(
	[Jdd] ASC,
	[idEstado] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE NONCLUSTERED INDEX [llave1] ON [dbo].[PCPCARGEST] 
(
	[Jdd] ASC,
	[idEstado] ASC,
	[idCarga] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PCPCARGAS]    Script Date: 10/19/2015 10:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PCPCARGAS](
	[idCarga] [int] IDENTITY(1,1) NOT NULL,
	[fecha] [datetime] NOT NULL,
	[Usuario] [char](12) NOT NULL,
	[Titulo] [varchar](40) NOT NULL,
	[Descrip] [varchar](200) NOT NULL,
	[Tipo] [int] NOT NULL,
	[Archivo] [varbinary](max) NOT NULL,
	[nomArch] [varchar](100) NOT NULL,
	[extArch] [varchar](20) NOT NULL,
	[Jdd] [int] NOT NULL,
 CONSTRAINT [PK_PCPCARGAS] PRIMARY KEY CLUSTERED 
(
	[Jdd] ASC,
	[idCarga] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PCPCALHIST]    Script Date: 10/19/2015 10:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PCPCALHIST](
	[idCalHist] [int] IDENTITY(1,1) NOT NULL,
	[actividad] [int] NOT NULL,
	[anio] [int] NOT NULL,
	[mes] [int] NOT NULL,
	[fteorica] [datetime] NOT NULL,
	[aprobada] [char](1) NOT NULL,
	[usuario] [char](12) NOT NULL,
	[fecha] [datetime] NOT NULL,
	[Jdd] [int] NOT NULL,
 CONSTRAINT [PK_PCPCALHIST] PRIMARY KEY CLUSTERED 
(
	[idCalHist] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PCPCALENDAR]    Script Date: 10/19/2015 10:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PCPCALENDAR](
	[actividad] [int] NOT NULL,
	[fteorica] [datetime] NOT NULL,
	[freal] [datetime] NOT NULL,
	[anio] [int] NOT NULL,
	[mes] [int] NOT NULL,
	[terminada] [char](1) NOT NULL,
	[status] [char](1) NOT NULL,
	[KPI] [char](1) NOT NULL,
	[Jdd] [int] NOT NULL,
 CONSTRAINT [PK_PCPCALENDAR] PRIMARY KEY CLUSTERED 
(
	[Jdd] ASC,
	[actividad] ASC,
	[anio] ASC,
	[mes] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Tbrhuids]    Script Date: 10/19/2015 10:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Tbrhuids](
	[tabla] [char](30) NOT NULL,
	[LastID] [int] NOT NULL,
	[Jdd] [int] NOT NULL,
 CONSTRAINT [PK_Tbrhuids] PRIMARY KEY CLUSTERED 
(
	[Jdd] ASC,
	[tabla] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO

-- II

/****** Object:  Table [dbo].[Tbporvdp]    Script Date: 10/19/2015 10:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbporvdp](
	[VDPCODCGO] [int] NOT NULL,
	[VDPCODVDP] [int] NOT NULL,
	[VDPVALOR] [numeric](8, 2) NOT NULL,
	[VDPSENSIB] [int] NOT NULL,
	[Jdd] [int] NOT NULL,
 CONSTRAINT [PK_Tbporvdp] PRIMARY KEY CLUSTERED 
(
	[Jdd] ASC,
	[VDPCODCGO] ASC,
	[VDPCODVDP] ASC,
	[VDPSENSIB] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbporrsa]    Script Date: 10/19/2015 10:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbporrsa](
	[ID] [int] NOT NULL,
	[CODCAT] [int] NOT NULL,
	[perc25] [int] NOT NULL,
	[perc50] [int] NOT NULL,
	[perc75] [int] NOT NULL,
	[fecha] [datetime] NOT NULL,
	[pmedio] [int] NOT NULL,
	[porcen1] [numeric](7, 4) NOT NULL,
	[porcen2] [numeric](7, 4) NOT NULL,
	[CODCATANT] [int] NOT NULL,
	[Jdd] [int] NOT NULL,
 CONSTRAINT [PK_Tbporrsa] PRIMARY KEY CLUSTERED 
(
	[Jdd] ASC,
	[CODCAT] ASC,
	[fecha] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbporrec]    Script Date: 10/19/2015 10:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Tbporrec](
	[reccodcgo] [int] NOT NULL,
	[reccodigo] [int] NOT NULL,
	[recporcent] [int] NOT NULL,
	[rectexclu] [int] NOT NULL,
	[rechabilit] [int] NOT NULL,
	[recdescrip] [char](30) NOT NULL,
	[reccondic] [char](254) NOT NULL,
	[recdescad] [char](254) NOT NULL,
	[rectipo] [int] NOT NULL,
	[recver] [int] NOT NULL,
	[Jdd] [int] NOT NULL,
 CONSTRAINT [PK_Tbporrec] PRIMARY KEY CLUSTERED 
(
	[Jdd] ASC,
	[reccodigo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Tbporrdp]    Script Date: 10/19/2015 10:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Tbporrdp](
	[RDPCODCGO] [int] NOT NULL,
	[RDPTIPOCON] [int] NOT NULL,
	[RDPPERIOD] [int] NOT NULL,
	[RDPAREA] [char](100) NOT NULL,
	[RDPMOTIVO] [char](100) NOT NULL,
	[Jdd] [int] NOT NULL,
 CONSTRAINT [PK_Tbporrdp] PRIMARY KEY CLUSTERED 
(
	[Jdd] ASC,
	[RDPCODCGO] ASC,
	[RDPTIPOCON] ASC,
	[RDPPERIOD] ASC,
	[RDPAREA] ASC,
	[RDPMOTIVO] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Tbporrca]    Script Date: 10/19/2015 10:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbporrca](
	[ID] [int] NOT NULL,
	[CODCAT] [int] NOT NULL,
	[MINIMO] [int] NOT NULL,
	[MAXIMO] [int] NOT NULL,
	[Jdd] [int] NOT NULL,
 CONSTRAINT [PK_Tbporrca] PRIMARY KEY CLUSTERED 
(
	[Jdd] ASC,
	[CODCAT] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbporpun]    Script Date: 10/19/2015 10:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbporpun](
	[ID] [int] NOT NULL,
	[GRADO] [int] NOT NULL,
	[FACTOR] [int] NOT NULL,
	[PUNTAJE] [money] NOT NULL,
	[Jdd] [int] NOT NULL,
 CONSTRAINT [PK_Tbporpun] PRIMARY KEY CLUSTERED 
(
	[Jdd] ASC,
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbporexa]    Script Date: 10/19/2015 10:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbporexa](
	[exacodcgo] [int] NOT NULL,
	[exacodigo] [int] NOT NULL,
	[exaaplica] [numeric](1, 0) NOT NULL,
	[exaporcent] [numeric](5, 2) NOT NULL,
	[exafin] [int] NOT NULL,
	[exaperio] [int] NOT NULL,
	[exaorden] [int] NOT NULL,
	[Jdd] [int] NOT NULL,
 CONSTRAINT [PK_Tbporexa] PRIMARY KEY CLUSTERED 
(
	[Jdd] ASC,
	[exacodcgo] ASC,
	[exacodigo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbpordto]    Script Date: 10/19/2015 10:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Tbpordto](
	[DTOCODCGO] [int] NOT NULL,
	[DTOID] [int] NOT NULL,
	[DTOTAREA] [char](254) NOT NULL,
	[DTOOBJETI] [char](254) NOT NULL,
	[DTONRO] [int] NOT NULL,
	[EVALUA] [int] NOT NULL,
	[GRADOS] [int] NOT NULL,
	[CALIFIC] [char](50) NOT NULL,
	[Jdd] [int] NOT NULL,
 CONSTRAINT [PK_Tbpordto] PRIMARY KEY CLUSTERED 
(
	[Jdd] ASC,
	[DTOID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Tbpordoc]    Script Date: 10/19/2015 10:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Tbpordoc](
	[CGOCODIGO] [int] NOT NULL,
	[Fecha_doc] [datetime] NOT NULL,
	[Tipo] [int] NOT NULL,
	[Descrip] [char](40) NOT NULL,
	[Nombre] [char](50) NOT NULL,
	[Fecha_car] [datetime] NOT NULL,
	[Elemento] [varbinary](max) NOT NULL,
	[Dire] [char](20) NOT NULL,
	[Dtipo] [char](10) NOT NULL,
	[Jdd] [int] NOT NULL,
 CONSTRAINT [PK_Tbpordoc] PRIMARY KEY CLUSTERED 
(
	[Jdd] ASC,
	[CGOCODIGO] ASC,
	[Nombre] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Tbpordmp]    Script Date: 10/19/2015 10:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbpordmp](
	[DMPCODCGO] [int] NOT NULL,
	[DMPCAREXT] [int] NOT NULL,
	[DMPREMEMP] [int] NOT NULL,
	[Jdd] [int] NOT NULL,
 CONSTRAINT [PK_Tbpordmp] PRIMARY KEY CLUSTERED 
(
	[Jdd] ASC,
	[DMPCODCGO] ASC,
	[DMPCAREXT] ASC,
	[DMPREMEMP] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbporcom]    Script Date: 10/19/2015 10:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Tbporcom](
	[comcargo] [int] NOT NULL,
	[comcodfac] [char](3) NOT NULL,
	[comcodsfa] [char](3) NOT NULL,
	[comcodgrd] [int] NOT NULL,
	[comdescrip] [char](254) NOT NULL,
	[comhabilit] [int] NOT NULL,
	[comexclu] [int] NOT NULL,
	[compesorel] [numeric](8, 2) NOT NULL,
	[Jdd] [int] NOT NULL,
 CONSTRAINT [PK_Tbporcom] PRIMARY KEY CLUSTERED 
(
	[Jdd] ASC,
	[comcargo] ASC,
	[comcodfac] ASC,
	[comcodsfa] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Tbporcgo]    Script Date: 10/19/2015 10:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Tbporcgo](
	[cgocodigo] [int] NOT NULL,
	[cgonivjer] [int] NOT NULL,
	[cgoescalaf] [int] NOT NULL,
	[cgopjeeval] [numeric](4, 2) NOT NULL,
	[cgogrado] [char](3) NOT NULL,
	[cgostaff] [numeric](1, 0) NOT NULL,
	[cgosuperv] [int] NOT NULL,
	[cgofmteval] [char](6) NOT NULL,
	[cgocardes] [int] NOT NULL,
	[cgotipodes] [int] NOT NULL,
	[cgofecdesc] [datetime] NOT NULL,
	[cgotipo] [int] NOT NULL,
	[cgodesctor] [int] NOT NULL,
	[cgoobjetiv] [varchar](2000) NOT NULL,
	[cgoptjeval] [numeric](5, 2) NOT NULL,
	[cgotipctr] [int] NOT NULL,
	[cgodurctr] [int] NOT NULL,
	[cgotiprem] [int] NOT NULL,
	[cgohorario] [int] NOT NULL,
	[cgomercado] [int] NOT NULL,
	[cgofactor] [numeric](1, 0) NOT NULL,
	[cgofuncion] [varchar](2000) NOT NULL,
	[cgogrd] [int] NOT NULL,
	[cgoclase] [int] NOT NULL,
	[cgoamb_la] [varchar](2000) NOT NULL,
	[cgodatosad] [varchar](2000) NOT NULL,
	[cgobenefi1] [int] NOT NULL,
	[cgobenefi2] [int] NOT NULL,
	[cgobenefi3] [int] NOT NULL,
	[cgobenefi4] [int] NOT NULL,
	[cgobenefi5] [int] NOT NULL,
	[cgoincon] [numeric](1, 0) NOT NULL,
	[cgocencos] [int] NOT NULL,
	[cgosector] [int] NOT NULL,
	[cgoperiod] [int] NOT NULL,
	[CGOTIPOCON] [int] NOT NULL,
	[CGOAREARP] [int] NOT NULL,
	[CGOMOTRP] [int] NOT NULL,
	[cgoobjtar] [varchar](2000) NOT NULL,
	[cgomerc] [int] NOT NULL,
	[cgoaprob] [int] NOT NULL,
	[Jdd] [int] NOT NULL,
	[cgodescrip] [char](40) NOT NULL,
 CONSTRAINT [PK_Tbporcgo] PRIMARY KEY CLUSTERED 
(
	[Jdd] ASC,
	[cgocodigo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Tbporbdp]    Script Date: 10/19/2015 10:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Tbporbdp](
	[BDPCODCGO] [int] NOT NULL,
	[BDPCODBdp] [int] NOT NULL,
	[BDPVALOR] [numeric](10, 0) NOT NULL,
	[BDPTEXLIB] [varchar](max) NOT NULL,
	[Jdd] [int] NOT NULL,
 CONSTRAINT [PK_Tbporbdp] PRIMARY KEY CLUSTERED 
(
	[BDPCODCGO] ASC,
	[BDPCODBdp] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Tbporadi]    Script Date: 10/19/2015 10:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Tbporadi](
	[codigo] [int] NOT NULL,
	[codcam] [int] NOT NULL,
	[valorn] [money] NOT NULL,
	[valorf] [datetime] NOT NULL,
	[valorc] [char](30) NOT NULL,
	[Jdd] [int] NOT NULL,
 CONSTRAINT [PK_Tbporadi] PRIMARY KEY CLUSTERED 
(
	[Jdd] ASC,
	[codigo] ASC,
	[codcam] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Tbporact]    Script Date: 10/19/2015 10:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Tbporact](
	[actcodcgo] [int] NOT NULL,
	[actcodigo] [int] NOT NULL,
	[actporcent] [int] NOT NULL,
	[acttexclu] [int] NOT NULL,
	[acthabilit] [int] NOT NULL,
	[actdescrip] [char](30) NOT NULL,
	[actcondic] [char](254) NOT NULL,
	[actdescad] [char](254) NOT NULL,
	[acttipo] [int] NOT NULL,
	[actver] [int] NOT NULL,
	[Jdd] [int] NOT NULL,
 CONSTRAINT [PK_Tbporact] PRIMARY KEY CLUSTERED 
(
	[Jdd] ASC,
	[actcodcgo] ASC,
	[actcodigo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TBEVAVOT]    Script Date: 10/19/2015 10:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TBEVAVOT](
	[votcodigo] [int] NOT NULL,
	[votgrupo] [int] NOT NULL,
	[votvotante] [int] NOT NULL,
	[vottipo] [int] NOT NULL,
	[votlegajo] [char](12) NOT NULL,
	[votnombre] [char](35) NOT NULL,
	[votclave] [char](20) NOT NULL,
	[votclave2] [char](20) NOT NULL,
	[votestado] [int] NOT NULL,
	[votcantap] [int] NOT NULL,
	[votcodeva] [int] NOT NULL,
	[votfecent] [datetime] NOT NULL,
	[votfortale] [varchar](max) NOT NULL,
	[votaspecto] [varchar](max) NOT NULL,
	[votsuceci] [int] NOT NULL,
	[votfuncio] [int] NOT NULL,
	[vot_tipo] [int] NOT NULL,
	[vot_nivel] [int] NOT NULL,
	[votarea] [varchar](max) NOT NULL,
	[Jdd] [int] NOT NULL,
 CONSTRAINT [PK_TBEVAVOT] PRIMARY KEY CLUSTERED 
(
	[Jdd] ASC,
	[votcodigo] ASC,
	[votgrupo] ASC,
	[vottipo] ASC,
	[votlegajo] ASC,
	[votnombre] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE NONCLUSTERED INDEX [llave1] ON [dbo].[TBEVAVOT] 
(
	[Jdd] ASC,
	[votcodigo] ASC,
	[votgrupo] ASC,
	[votvotante] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TBEVATDM]    Script Date: 10/19/2015 10:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TBEVATDM](
	[tdmcodigo] [char](6) NOT NULL,
	[tdmdescrip] [char](100) NOT NULL,
	[tdmporc] [numeric](6, 2) NOT NULL,
	[Jdd] [int] NOT NULL,
 CONSTRAINT [PK_TBEVATDM] PRIMARY KEY CLUSTERED 
(
	[Jdd] ASC,
	[tdmcodigo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TBEVASUC]    Script Date: 10/19/2015 10:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBEVASUC](
	[SUCCARGOE] [int] NOT NULL,
	[SUCOPCION] [int] NOT NULL,
	[SUCCARGOS] [int] NOT NULL,
	[Jdd] [int] NOT NULL,
 CONSTRAINT [PK_TBEVASUC] PRIMARY KEY CLUSTERED 
(
	[Jdd] ASC,
	[SUCCARGOE] ASC,
	[SUCOPCION] ASC,
	[SUCCARGOS] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TBEVASFD]    Script Date: 10/19/2015 10:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TBEVASFD](
	[SFDCODFAC] [char](3) NOT NULL,
	[SFDCODIGO] [char](3) NOT NULL,
	[ID] [int] NOT NULL,
	[DESCRIP] [varchar](max) NOT NULL,
	[Jdd] [int] NOT NULL,
 CONSTRAINT [PK_TBEVASFD] PRIMARY KEY CLUSTERED 
(
	[Jdd] ASC,
	[SFDCODFAC] ASC,
	[SFDCODIGO] ASC,
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TBEVASFA]    Script Date: 10/19/2015 10:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TBEVASFA](
	[SFAFACCOD] [char](3) NOT NULL,
	[SFACODIGO] [char](3) NOT NULL,
	[SFADESCRIP] [char](200) NOT NULL,
	[SFADESADI] [varchar](max) NOT NULL,
	[SFAPORCENT] [numeric](5, 2) NOT NULL,
	[SFADESCAPL] [char](70) NOT NULL,
	[SFAOPCION] [int] NOT NULL,
	[Jdd] [int] NOT NULL,
 CONSTRAINT [PK_TBEVASFA] PRIMARY KEY CLUSTERED 
(
	[Jdd] ASC,
	[SFAFACCOD] ASC,
	[SFACODIGO] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TBEVARDF]    Script Date: 10/19/2015 10:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TBEVARDF](
	[rdfnumero] [int] NOT NULL,
	[rdflegajo] [char](12) NOT NULL,
	[rdfevaluac] [int] NOT NULL,
	[rdflegvot] [char](12) NOT NULL,
	[rdfgrupo] [int] NOT NULL,
	[rdfregist] [char](26) NOT NULL,
	[rdfcoment] [varchar](max) NOT NULL,
	[rdffecha] [datetime] NOT NULL,
	[rdfestado] [int] NOT NULL,
	[rdfusuario] [char](12) NOT NULL,
	[Jdd] [int] NOT NULL,
 CONSTRAINT [PK_TBEVARDF] PRIMARY KEY CLUSTERED 
(
	[Jdd] ASC,
	[rdfnumero] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TBEVAPSF]    Script Date: 10/19/2015 10:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TBEVAPSF](
	[PSFFMT] [char](6) NOT NULL,
	[PSFFACTOR] [char](3) NOT NULL,
	[PSFSUBFAC] [char](3) NOT NULL,
	[SFAP1] [numeric](5, 2) NOT NULL,
	[SFAP2] [numeric](5, 2) NOT NULL,
	[SFAP3] [numeric](5, 2) NOT NULL,
	[SFAP4] [numeric](5, 2) NOT NULL,
	[SFAP5] [numeric](5, 2) NOT NULL,
	[SFAP6] [numeric](5, 2) NOT NULL,
	[SFAP7] [numeric](5, 2) NOT NULL,
	[SFAP8] [numeric](5, 2) NOT NULL,
	[SFAP9] [numeric](5, 2) NOT NULL,
	[SFAP10] [numeric](5, 2) NOT NULL,
	[SFAP11] [numeric](5, 2) NOT NULL,
	[SFAP12] [numeric](5, 2) NOT NULL,
	[SFAP13] [numeric](5, 2) NOT NULL,
	[SFAP14] [numeric](5, 2) NOT NULL,
	[SFAP15] [numeric](5, 2) NOT NULL,
	[Jdd] [int] NOT NULL,
 CONSTRAINT [PK_TBEVAPSF] PRIMARY KEY CLUSTERED 
(
	[Jdd] ASC,
	[PSFFMT] ASC,
	[PSFFACTOR] ASC,
	[PSFSUBFAC] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TBEVAOBJ]    Script Date: 10/19/2015 10:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TBEVAOBJ](
	[objcodmta] [char](6) NOT NULL,
	[objcodobj] [int] NOT NULL,
	[objcodper] [char](12) NOT NULL,
	[objporce] [numeric](6, 2) NOT NULL,
	[objestado] [numeric](6, 2) NOT NULL,
	[Jdd] [int] NOT NULL,
 CONSTRAINT [PK_TBEVAOBJ] PRIMARY KEY CLUSTERED 
(
	[Jdd] ASC,
	[objcodmta] ASC,
	[objcodobj] ASC,
	[objcodper] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TBEVANOT]    Script Date: 10/19/2015 10:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TBEVANOT](
	[NOTLEGAJO] [char](12) NOT NULL,
	[NOTFECHA] [datetime] NOT NULL,
	[NOTNOTAPOS] [varchar](max) NOT NULL,
	[NOTNOTANEG] [varchar](max) NOT NULL,
	[Jdd] [int] NOT NULL,
 CONSTRAINT [PK_TBEVANOT] PRIMARY KEY CLUSTERED 
(
	[Jdd] ASC,
	[NOTLEGAJO] ASC,
	[NOTFECHA] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TBEVAMTA]    Script Date: 10/19/2015 10:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TBEVAMTA](
	[mtatipcod] [char](6) NOT NULL,
	[mtacodigo] [char](6) NOT NULL,
	[mtaporc] [numeric](6, 2) NOT NULL,
	[mtadescrip] [char](100) NOT NULL,
	[mtaconsat] [char](100) NOT NULL,
	[mtafcumpli] [datetime] NOT NULL,
	[Jdd] [int] NOT NULL,
 CONSTRAINT [PK_TBEVAMTA] PRIMARY KEY CLUSTERED 
(
	[Jdd] ASC,
	[mtacodigo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TBEVAMGR]    Script Date: 10/19/2015 10:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TBEVAMGR](
	[MGRCODEVD] [int] NOT NULL,
	[MGRLEGAJO] [char](12) NOT NULL,
	[MGRCODMET] [int] NOT NULL,
	[MGRCODIGO] [int] NOT NULL,
	[Jdd] [int] NOT NULL,
 CONSTRAINT [PK_TBEVAMGR] PRIMARY KEY CLUSTERED 
(
	[Jdd] ASC,
	[MGRCODEVD] ASC,
	[MGRLEGAJO] ASC,
	[MGRCODMET] ASC,
	[MGRCODIGO] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TBEVAMET]    Script Date: 10/19/2015 10:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TBEVAMET](
	[METCODEVD] [int] NOT NULL,
	[METLEGAJO] [char](12) NOT NULL,
	[METCODIGO] [int] NOT NULL,
	[METMETAPER] [varchar](max) NOT NULL,
	[METSATPER] [varchar](max) NOT NULL,
	[METNOTSUP] [int] NOT NULL,
	[METNOTAUT] [int] NOT NULL,
	[METNOTPAR] [int] NOT NULL,
	[METNOTCOL] [int] NOT NULL,
	[METNOTCLI] [int] NOT NULL,
	[METNOTJSU] [int] NOT NULL,
	[METNOTOTR] [int] NOT NULL,
	[METNOTCLE] [int] NOT NULL,
	[METNOTPRO] [int] NOT NULL,
	[METMCGORI] [int] NOT NULL,
	[METMCGLEG] [char](12) NOT NULL,
	[METNOTFIN] [money] NOT NULL,
	[METTIPO] [int] NOT NULL,
	[METOBSSUP] [char](220) NOT NULL,
	[METOBSAUT] [char](220) NOT NULL,
	[METOBSPAR] [char](220) NOT NULL,
	[METOBSCOL] [char](220) NOT NULL,
	[METOBSCLI] [char](220) NOT NULL,
	[METOBSJSU] [char](220) NOT NULL,
	[METOBSOTR] [char](220) NOT NULL,
	[METOBSPRO] [char](220) NOT NULL,
	[METOBSCLE] [char](220) NOT NULL,
	[METOBJETI] [int] NOT NULL,
	[METOTROOBJ] [char](60) NOT NULL,
	[METTEMA] [char](254) NOT NULL,
	[METPOND] [int] NOT NULL,
	[METNOTAPON] [numeric](6, 2) NOT NULL,
	[METAFECHA] [datetime] NOT NULL,
	[METFECUM] [datetime] NOT NULL,
	[Jdd] [int] NOT NULL,
 CONSTRAINT [PK_TBEVAMET] PRIMARY KEY CLUSTERED 
(
	[Jdd] ASC,
	[METCODEVD] ASC,
	[METLEGAJO] ASC,
	[METCODIGO] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TBEVAMCG]    Script Date: 10/19/2015 10:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TBEVAMCG](
	[MCGCODEVD] [int] NOT NULL,
	[MCGLEGAJO] [char](12) NOT NULL,
	[MCGCODIGO] [int] NOT NULL,
	[MCGCLASE] [int] NOT NULL,
	[MCGCONSEC] [int] NOT NULL,
	[MCGLEGORI] [char](12) NOT NULL,
	[MCGCODORI] [int] NOT NULL,
	[MCGMETAPER] [varchar](max) NOT NULL,
	[MCGSATPER] [varchar](max) NOT NULL,
	[MCGNOTSUP] [int] NOT NULL,
	[MCGNOTAUT] [int] NOT NULL,
	[MCGNOTPAR] [int] NOT NULL,
	[MCGNOTCOL] [int] NOT NULL,
	[MCGNOTCLI] [int] NOT NULL,
	[MCGNOTJSU] [int] NOT NULL,
	[MCGNOTOTR] [int] NOT NULL,
	[MCGNOTCLE] [int] NOT NULL,
	[MCGNOTPRO] [int] NOT NULL,
	[MCGNOTFIN] [money] NOT NULL,
	[MCGTIPO] [int] NOT NULL,
	[MCGOBSSUP] [char](220) NOT NULL,
	[MCGOBSAUT] [char](220) NOT NULL,
	[MCGOBSPAR] [char](220) NOT NULL,
	[MCGOBSCOL] [char](220) NOT NULL,
	[MCGOBSCLI] [char](220) NOT NULL,
	[MCGOBSJSU] [char](220) NOT NULL,
	[MCGOBSOTR] [char](220) NOT NULL,
	[MCGOBSPRO] [char](220) NOT NULL,
	[MCGOBSCLE] [char](220) NOT NULL,
	[MCGOBJETI] [int] NOT NULL,
	[MCGOTROOBJ] [char](60) NOT NULL,
	[MCGTEMA] [char](254) NOT NULL,
	[MCGPOND] [int] NOT NULL,
	[MCGNOTAPON] [numeric](6, 2) NOT NULL,
	[MCGAFECHA] [datetime] NOT NULL,
	[MCGFECUM] [datetime] NOT NULL,
	[Jdd] [int] NOT NULL,
 CONSTRAINT [PK_TBEVAMCG] PRIMARY KEY CLUSTERED 
(
	[Jdd] ASC,
	[MCGCODEVD] ASC,
	[MCGLEGAJO] ASC,
	[MCGCODIGO] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TBEVAIRE]    Script Date: 10/19/2015 10:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TBEVAIRE](
	[irecodigo] [int] NOT NULL,
	[ireevdcod] [int] NOT NULL,
	[iretipo] [int] NOT NULL,
	[irerangode] [numeric](8, 2) NOT NULL,
	[irerangoha] [numeric](8, 2) NOT NULL,
	[iredescrip] [char](254) NOT NULL,
	[irediagnos] [char](254) NOT NULL,
	[ireaccrec] [char](254) NOT NULL,
	[irecolor] [int] NOT NULL,
	[Jdd] [int] NOT NULL,
 CONSTRAINT [PK_TBEVAIRE] PRIMARY KEY CLUSTERED 
(
	[Jdd] ASC,
	[ireevdcod] ASC,
	[irecodigo] ASC,
	[iretipo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TBEVAINP]    Script Date: 10/19/2015 10:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TBEVAINP](
	[INPCODINC] [int] NOT NULL,
	[INPLEGAJO] [char](12) NOT NULL,
	[INPCODEVA] [int] NOT NULL,
	[INPFECHA] [datetime] NOT NULL,
	[INPPUNTOS] [numeric](7, 2) NOT NULL,
	[INPESTADO] [int] NOT NULL,
	[INPFECASIG] [datetime] NOT NULL,
	[INPCANTI] [numeric](10, 2) NOT NULL,
	[Jdd] [int] NOT NULL,
 CONSTRAINT [PK_TBEVAINP] PRIMARY KEY CLUSTERED 
(
	[Jdd] ASC,
	[INPCODINC] ASC,
	[INPLEGAJO] ASC,
	[INPCODEVA] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TBEVAINC]    Script Date: 10/19/2015 10:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TBEVAINC](
	[INCCODIGO] [int] NOT NULL,
	[INCTIPO] [int] NOT NULL,
	[INCCANTID] [numeric](9, 2) NOT NULL,
	[INCFECHA] [datetime] NOT NULL,
	[INCDESCRIP] [char](254) NOT NULL,
	[INCFECVEN] [datetime] NOT NULL,
	[INCVALITEM] [int] NOT NULL,
	[INCITEM] [char](6) NOT NULL,
	[Jdd] [int] NOT NULL,
 CONSTRAINT [PK_TBEVAINC] PRIMARY KEY CLUSTERED 
(
	[Jdd] ASC,
	[INCCODIGO] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TBEVAFPO]    Script Date: 10/19/2015 10:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TBEVAFPO](
	[FPOFMTCOD] [char](6) NOT NULL,
	[FPOPONDERA] [int] NOT NULL,
	[FPODESCRIP] [char](254) NOT NULL,
	[Jdd] [int] NOT NULL,
 CONSTRAINT [PK_TBEVAFPO] PRIMARY KEY CLUSTERED 
(
	[Jdd] ASC,
	[FPOFMTCOD] ASC,
	[FPOPONDERA] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TBEVAFMT]    Script Date: 10/19/2015 10:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TBEVAFMT](
	[FMTCODIGO] [char](6) NOT NULL,
	[FMTDESCRIP] [char](100) NOT NULL,
	[FMTAPLICA] [int] NOT NULL,
	[FMTTIPO] [int] NOT NULL,
	[FMTFECHA] [datetime] NOT NULL,
	[FMTCONVENI] [int] NOT NULL,
	[FMTNOTA] [int] NOT NULL,
	[FMTNIVEL] [numeric](5, 2) NOT NULL,
	[FMTOBSAPLI] [char](254) NOT NULL,
	[FMTTIPFAC] [int] NOT NULL,
	[FMTFACPOND] [numeric](1, 0) NOT NULL,
	[FMTSFCPOND] [numeric](1, 0) NOT NULL,
	[FMTESTADO] [int] NOT NULL,
	[Jdd] [int] NOT NULL,
 CONSTRAINT [PK_TBEVAFMT] PRIMARY KEY CLUSTERED 
(
	[Jdd] ASC,
	[FMTCODIGO] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TBEVAFMD]    Script Date: 10/19/2015 10:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TBEVAFMD](
	[FMDCODIGO] [char](6) NOT NULL,
	[ID] [int] NOT NULL,
	[DESCRIP] [char](254) NOT NULL,
	[Jdd] [int] NOT NULL,
 CONSTRAINT [PK_TBEVAFMD] PRIMARY KEY CLUSTERED 
(
	[Jdd] ASC,
	[FMDCODIGO] ASC,
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TBEVAFGR]    Script Date: 10/19/2015 10:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TBEVAFGR](
	[FGRFACTOR] [char](3) NOT NULL,
	[FGRSUBFAC] [char](3) NOT NULL,
	[FGRNUMERO] [numeric](3, 0) NOT NULL,
	[FGRDESADI] [char](254) NOT NULL,
	[fgrcodigo] [int] NOT NULL,
	[fgrcodfac] [char](3) NOT NULL,
	[fgruso] [int] NOT NULL,
	[Jdd] [int] NOT NULL,
 CONSTRAINT [PK_TBEVAFGR] PRIMARY KEY CLUSTERED 
(
	[Jdd] ASC,
	[FGRFACTOR] ASC,
	[FGRSUBFAC] ASC,
	[fgrcodigo] ASC,
	[FGRNUMERO] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TBEVAFFA]    Script Date: 10/19/2015 10:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TBEVAFFA](
	[FFAFMTCOD] [char](6) NOT NULL,
	[FFAFACCOD] [char](3) NOT NULL,
	[FFAP1] [numeric](5, 2) NOT NULL,
	[FFAP2] [numeric](5, 2) NOT NULL,
	[FFAP3] [numeric](5, 2) NOT NULL,
	[FFAP4] [numeric](5, 2) NOT NULL,
	[FFAP5] [numeric](5, 2) NOT NULL,
	[FFAP6] [numeric](5, 2) NOT NULL,
	[FFAP7] [numeric](5, 2) NOT NULL,
	[FFAP8] [numeric](5, 2) NOT NULL,
	[FFAP9] [numeric](5, 2) NOT NULL,
	[FFAP10] [numeric](5, 2) NOT NULL,
	[FFAP11] [numeric](5, 2) NOT NULL,
	[FFAP12] [numeric](5, 2) NOT NULL,
	[FFAP13] [numeric](5, 2) NOT NULL,
	[FFAP14] [numeric](5, 2) NOT NULL,
	[FFAP15] [numeric](5, 2) NOT NULL,
	[FFaporcent] [numeric](5, 2) NOT NULL,
	[ffapjemin] [numeric](5, 2) NOT NULL,
	[Jdd] [int] NOT NULL,
 CONSTRAINT [PK_TBEVAFFA] PRIMARY KEY CLUSTERED 
(
	[Jdd] ASC,
	[FFAFMTCOD] ASC,
	[FFAFACCOD] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TBEVAFCT]    Script Date: 10/19/2015 10:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TBEVAFCT](
	[FCTCODIGO] [char](3) NOT NULL,
	[FCTDESCRIP] [char](100) NOT NULL,
	[FCTDESADI] [varchar](max) NOT NULL,
	[FCTTIPO] [int] NOT NULL,
	[FCTPORCENT] [numeric](5, 2) NOT NULL,
	[FCTPJEMIN] [numeric](5, 2) NOT NULL,
	[FCTCOMP] [numeric](1, 0) NOT NULL,
	[FCTMODO] [numeric](1, 0) NOT NULL,
	[FCTTIPCAL] [int] NOT NULL,
	[Jdd] [int] NOT NULL,
 CONSTRAINT [PK_TBEVAFCT] PRIMARY KEY CLUSTERED 
(
	[Jdd] ASC,
	[FCTCODIGO] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TBEVAFCP]    Script Date: 10/19/2015 10:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TBEVAFCP](
	[FCPFACCOD] [char](3) NOT NULL,
	[FCPPONDERA] [int] NOT NULL,
	[FCPDESCRIP] [char](64) NOT NULL,
	[Jdd] [int] NOT NULL,
 CONSTRAINT [PK_TBEVAFCP] PRIMARY KEY CLUSTERED 
(
	[Jdd] ASC,
	[FCPFACCOD] ASC,
	[FCPPONDERA] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TBEVAFCD]    Script Date: 10/19/2015 10:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TBEVAFCD](
	[FCDCODFAC] [char](3) NOT NULL,
	[FCDPOSICIO] [int] NOT NULL,
	[FCDTEXTO] [char](254) NOT NULL,
	[Jdd] [int] NOT NULL,
 CONSTRAINT [PK_TBEVAFCD] PRIMARY KEY CLUSTERED 
(
	[Jdd] ASC,
	[FCDCODFAC] ASC,
	[FCDPOSICIO] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TBEVAEVP]    Script Date: 10/19/2015 10:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TBEVAEVP](
	[EVPCODIGO] [int] NOT NULL,
	[EVPLEGAJO] [char](12) NOT NULL,
	[EVPCODFMT] [char](6) NOT NULL,
	[EVPFECHA] [datetime] NOT NULL,
	[EVPOBSERV] [char](254) NOT NULL,
	[EVPHECSOB] [varchar](max) NOT NULL,
	[EVPPLAFUT] [varchar](max) NOT NULL,
	[EVPCOMEVA] [varchar](max) NOT NULL,
	[EVPCOMEVO] [varchar](max) NOT NULL,
	[EVPESTADO] [int] NOT NULL,
	[EVPTOTALA] [numeric](7, 2) NOT NULL,
	[EVPTOTALE] [numeric](7, 2) NOT NULL,
	[EVPTOTALC] [numeric](7, 2) NOT NULL,
	[EVPTOTALPA] [numeric](7, 2) NOT NULL,
	[EVPTOTALSU] [numeric](7, 2) NOT NULL,
	[EVPTOTALES] [numeric](7, 2) NOT NULL,
	[EVPTOTALCL] [numeric](7, 2) NOT NULL,
	[EVPTOTALPR] [numeric](7, 2) NOT NULL,
	[EVPTOTALFI] [numeric](7, 2) NOT NULL,
	[EVPTOTALot] [numeric](7, 2) NOT NULL,
	[Jdd] [int] NOT NULL,
 CONSTRAINT [PK_TBEVAEVP] PRIMARY KEY CLUSTERED 
(
	[Jdd] ASC,
	[EVPCODIGO] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TBEVAEVD]    Script Date: 10/19/2015 10:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TBEVAEVD](
	[EVDCODIGO] [int] NOT NULL,
	[EVDFECHA] [datetime] NOT NULL,
	[EVDTIPO] [int] NOT NULL,
	[EVDCARGO] [int] NOT NULL,
	[EVDDESCAD] [char](64) NOT NULL,
	[EVDEVAANT] [int] NOT NULL,
	[EVDPFMT] [numeric](5, 2) NOT NULL,
	[EVDPMETA] [numeric](5, 2) NOT NULL,
	[EVDPONSUP] [numeric](5, 2) NOT NULL,
	[EVDPONAUT] [numeric](5, 2) NOT NULL,
	[EVDPONPAR] [numeric](5, 2) NOT NULL,
	[EVDPONCOL] [numeric](5, 2) NOT NULL,
	[EVDPONCLI] [numeric](5, 2) NOT NULL,
	[EVDPONJSU] [numeric](5, 2) NOT NULL,
	[EVDPONOTR] [numeric](5, 2) NOT NULL,
	[EVDPONCLE] [numeric](5, 2) NOT NULL,
	[EVDPONPRO] [numeric](5, 2) NOT NULL,
	[EVDVERAUT] [int] NOT NULL,
	[EVDVERjsu] [int] NOT NULL,
	[EVDVERotr] [int] NOT NULL,
	[EVDVERPAR] [int] NOT NULL,
	[EVDVERSUP] [int] NOT NULL,
	[EVDVERcol] [int] NOT NULL,
	[EVDVERCLI] [int] NOT NULL,
	[EVDVERPRO] [int] NOT NULL,
	[EVDVERcle] [int] NOT NULL,
	[EVDUSOSUP] [int] NOT NULL,
	[EVDUSOAUT] [int] NOT NULL,
	[EVDUSOPAR] [int] NOT NULL,
	[EVDUSOCOL] [int] NOT NULL,
	[EVDUSOCLI] [int] NOT NULL,
	[EVDUSOJSU] [int] NOT NULL,
	[EVDUSOOTR] [int] NOT NULL,
	[EVDUSOCLE] [int] NOT NULL,
	[EVDUSOPRO] [int] NOT NULL,
	[evdfchter] [datetime] NOT NULL,
	[evdfchlim] [datetime] NOT NULL,
	[evdfchpin] [datetime] NOT NULL,
	[evdfchpfn] [datetime] NOT NULL,
	[evdtitulo] [char](64) NOT NULL,
	[evdestado] [numeric](1, 0) NOT NULL,
	[EVDHABCIC] [int] NOT NULL,
	[EVDHABMAIL] [int] NOT NULL,
	[EVDHABGAC] [numeric](1, 0) NOT NULL,
	[EVDOCUCG] [numeric](1, 0) NOT NULL,
	[EVDHAMEPA] [numeric](1, 0) NOT NULL,
	[EVDMODOBS] [numeric](1, 0) NOT NULL,
	[EVDOCPONAC] [numeric](1, 0) NOT NULL,
	[EVDAASS] [numeric](1, 0) NOT NULL,
	[EVDPMETCR] [numeric](1, 0) NOT NULL,
	[EVDPMETCO] [numeric](5, 2) NOT NULL,
	[EVDORAP] [numeric](1, 0) NOT NULL,
	[EVDCFAENT] [numeric](1, 0) NOT NULL,
	[EVDCAMEVA] [numeric](1, 0) NOT NULL,
	[EVDSUCESI] [numeric](1, 0) NOT NULL,
	[EVDREQAUT] [int] NOT NULL,
	[EVDREQAU2] [numeric](1, 0) NOT NULL,
	[EVDREVIS1] [numeric](1, 0) NOT NULL,
	[EVDRE1OTR] [char](12) NOT NULL,
	[EVDRE1TIP] [numeric](1, 0) NOT NULL,
	[EVDREVIS2] [numeric](1, 0) NOT NULL,
	[EVDRE2OTR] [char](12) NOT NULL,
	[EVDRE2TIP] [numeric](1, 0) NOT NULL,
	[EVDRE2MAI] [char](64) NOT NULL,
	[EVDRE1MAI] [char](64) NOT NULL,
	[EVDRERRHH] [numeric](1, 0) NOT NULL,
	[EVDINFEEN] [int] NOT NULL,
	[EVDFEENFU] [int] NOT NULL,
	[EVDOCUSUC] [numeric](1, 0) NOT NULL,
	[EVDOCUFOR] [numeric](1, 0) NOT NULL,
	[Jdd] [int] NOT NULL,
 CONSTRAINT [PK_TBEVAEVD] PRIMARY KEY CLUSTERED 
(
	[Jdd] ASC,
	[EVDCODIGO] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TBEVAEMP]    Script Date: 10/19/2015 10:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TBEVAEMP](
	[EMPCODEVA] [int] NOT NULL,
	[CODIGO] [char](12) NOT NULL,
	[EMPLEGAJOS] [char](12) NOT NULL,
	[EMPLEGAJOE] [char](12) NOT NULL,
	[EMPCODPER] [char](6) NOT NULL,
	[EMPCODFMT] [char](6) NOT NULL,
	[EMPFECENV] [datetime] NOT NULL,
	[EMPFECREC] [datetime] NOT NULL,
	[EMPESTADO] [int] NOT NULL,
	[EMPOBSAPE] [char](254) NOT NULL,
	[EMPNORMAL] [numeric](1, 0) NOT NULL,
	[EMPFORZADA] [numeric](1, 0) NOT NULL,
	[EMPCOMLEG1] [char](12) NOT NULL,
	[EMPCOMLEG2] [char](12) NOT NULL,
	[EMPEVALUAC] [int] NOT NULL,
	[EMPMETA] [numeric](1, 0) NOT NULL,
	[EMPPONDERA] [int] NOT NULL,
	[EMPRESA] [char](3) NOT NULL,
	[CARGO] [int] NOT NULL,
	[OFICINA] [int] NOT NULL,
	[CENCOS] [int] NOT NULL,
	[UNIDAD] [int] NOT NULL,
	[EMPCODIREA] [int] NOT NULL,
	[EMPCODIREE] [int] NOT NULL,
	[EMPCODIREC] [int] NOT NULL,
	[EMPIREPAR] [int] NOT NULL,
	[EMPIREEMP] [int] NOT NULL,
	[EMPIRECLI] [int] NOT NULL,
	[EMPIREPRO] [int] NOT NULL,
	[EMPIREotr] [int] NOT NULL,
	[EMPIRESUP] [int] NOT NULL,
	[EMPIRERES] [int] NOT NULL,
	[EMPCERRAR] [numeric](1, 0) NOT NULL,
	[EMP_WEB] [numeric](1, 0) NOT NULL,
	[EMPNOTTSUP] [numeric](8, 2) NOT NULL,
	[EMPNOTTAUT] [numeric](8, 2) NOT NULL,
	[EMPNOTTPAR] [numeric](8, 2) NOT NULL,
	[EMPNOTTCOL] [numeric](8, 2) NOT NULL,
	[EMPNOTTCLI] [numeric](8, 2) NOT NULL,
	[EMPNOTTJSU] [numeric](8, 2) NOT NULL,
	[EMPNOTTCLE] [numeric](8, 2) NOT NULL,
	[EMPNOTTPRO] [numeric](8, 2) NOT NULL,
	[EMPNOTTotr] [numeric](8, 2) NOT NULL,
	[EMPNOTTFIN] [numeric](8, 2) NOT NULL,
	[EMPNOTFSUP] [numeric](8, 2) NOT NULL,
	[EMPNOTFAUT] [numeric](8, 2) NOT NULL,
	[EMPNOTFPAR] [numeric](8, 2) NOT NULL,
	[EMPNOTFCOL] [numeric](8, 2) NOT NULL,
	[EMPNOTFCLI] [numeric](8, 2) NOT NULL,
	[EMPNOTFSJU] [numeric](8, 2) NOT NULL,
	[EMPNOTFOTR] [numeric](8, 2) NOT NULL,
	[EMPNOTFCLE] [numeric](8, 2) NOT NULL,
	[EMPNOTFPRO] [numeric](8, 2) NOT NULL,
	[EMPNOTFFIN] [numeric](8, 2) NOT NULL,
	[EMPNOTMSUP] [numeric](8, 2) NOT NULL,
	[EMPNOTCAUT] [numeric](8, 2) NOT NULL,
	[EMPNOTCPAR] [numeric](8, 2) NOT NULL,
	[EMPNOTCSUP] [numeric](8, 2) NOT NULL,
	[EMPNOTCCOL] [numeric](8, 2) NOT NULL,
	[EMPNOTCCLI] [numeric](8, 2) NOT NULL,
	[EMPNOTCJSU] [numeric](8, 2) NOT NULL,
	[EMPNOTCOTR] [numeric](8, 2) NOT NULL,
	[EMPNOTCCLE] [numeric](8, 2) NOT NULL,
	[EMPNOTCPRO] [numeric](8, 2) NOT NULL,
	[EMPNOTCFIN] [numeric](8, 2) NOT NULL,
	[EMPNOTMAUT] [numeric](8, 2) NOT NULL,
	[EMPNOTMPAR] [numeric](8, 2) NOT NULL,
	[EMPNOTMCOL] [numeric](8, 2) NOT NULL,
	[EMPNOTMCLI] [numeric](8, 2) NOT NULL,
	[EMPNOTMJSU] [numeric](8, 2) NOT NULL,
	[EMPNOTMOTR] [numeric](8, 2) NOT NULL,
	[EMPNOTMCLE] [numeric](8, 2) NOT NULL,
	[EMPNOTMPRO] [numeric](8, 2) NOT NULL,
	[EMPNOTMFIN] [numeric](8, 2) NOT NULL,
	[empfeccer] [datetime] NOT NULL,
	[EMPCOMENT] [varchar](max) NOT NULL,
	[Jdd] [int] NOT NULL,
 CONSTRAINT [PK_TBEVAEMP] PRIMARY KEY CLUSTERED 
(
	[Jdd] ASC,
	[EMPCODEVA] ASC,
	[CODIGO] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TBEVADPR]    Script Date: 10/19/2015 10:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TBEVADPR](
	[dprcodigo] [int] NOT NULL,
	[dprcodfac] [char](3) NOT NULL,
	[dprcodsfa] [char](3) NOT NULL,
	[dprgrupo] [int] NOT NULL,
	[dprsubcod] [int] NOT NULL,
	[dprcodgrd] [int] NOT NULL,
	[dprcodfac2] [char](3) NOT NULL,
	[dprcodsfa2] [char](3) NOT NULL,
	[dpropcion] [int] NOT NULL,
	[Jdd] [int] NOT NULL,
 CONSTRAINT [PK_TBEVADPR] PRIMARY KEY CLUSTERED 
(
	[Jdd] ASC,
	[dprcodigo] ASC,
	[dprcodfac] ASC,
	[dprcodsfa] ASC,
	[dprgrupo] ASC,
	[dprsubcod] ASC,
	[dprcodfac2] ASC,
	[dprcodsfa2] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TBEVADEP]    Script Date: 10/19/2015 10:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TBEVADEP](
	[DEPCODIGO] [int] NOT NULL,
	[DEPCODFMT] [char](6) NOT NULL,
	[DEPCODFAC] [char](3) NOT NULL,
	[DEPCODSFA] [char](3) NOT NULL,
	[DEPLEGAJO] [char](12) NOT NULL,
	[DEPPUNSUP] [numeric](8, 2) NOT NULL,
	[DEPPUNAUT] [numeric](8, 2) NOT NULL,
	[DEPPUNPAR] [numeric](8, 2) NOT NULL,
	[DEPPUNCOL] [numeric](8, 2) NOT NULL,
	[DEPPUNCLI] [numeric](8, 2) NOT NULL,
	[DEPPUNJSU] [numeric](8, 2) NOT NULL,
	[DEPPUNOTR] [numeric](8, 2) NOT NULL,
	[DEPPUNCLE] [numeric](8, 2) NOT NULL,
	[DEPPUNPRO] [numeric](8, 2) NOT NULL,
	[DEPOBSERVA] [varchar](max) NOT NULL,
	[DEPOBSERVE] [varchar](max) NOT NULL,
	[DEPOBSERVC] [varchar](max) NOT NULL,
	[DEPOBSPAR] [varchar](max) NOT NULL,
	[DEPOBSSUP] [varchar](max) NOT NULL,
	[DEPOBSEMS] [varchar](max) NOT NULL,
	[DEPOBSCLI] [varchar](max) NOT NULL,
	[DEPOBSPRO] [varchar](max) NOT NULL,
	[DEPOBSotr] [varchar](max) NOT NULL,
	[DEPCOMENTA] [varchar](max) NOT NULL,
	[DEPCOMENTE] [varchar](max) NOT NULL,
	[DEPCOMENTC] [varchar](max) NOT NULL,
	[DEPCOMPAR] [varchar](max) NOT NULL,
	[DEPCOMSUP] [varchar](max) NOT NULL,
	[DEPCOMEMS] [varchar](max) NOT NULL,
	[DEPCOMCLI] [varchar](max) NOT NULL,
	[DEPCOMPRO] [varchar](max) NOT NULL,
	[DEPCOMotr] [varchar](max) NOT NULL,
	[DEPPTSRFIN] [money] NOT NULL,
	[Jdd] [int] NOT NULL,
 CONSTRAINT [PK_TBEVADEP] PRIMARY KEY CLUSTERED 
(
	[Jdd] ASC,
	[DEPCODIGO] ASC,
	[DEPCODFMT] ASC,
	[DEPCODFAC] ASC,
	[DEPCODSFA] ASC,
	[DEPLEGAJO] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TBEVADEF]    Script Date: 10/19/2015 10:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TBEVADEF](
	[DEFCODIGO] [int] NOT NULL,
	[DEFCODFMT] [char](6) NOT NULL,
	[DEFCODFAC] [char](3) NOT NULL,
	[DEFPUNTOSA] [money] NOT NULL,
	[DEFPUNTOSE] [money] NOT NULL,
	[DEFPUNTOSC] [money] NOT NULL,
	[DEFPTSPAR] [money] NOT NULL,
	[DEFPTSSUP] [money] NOT NULL,
	[DEFPTSEMS] [money] NOT NULL,
	[DEFPTSCLI] [money] NOT NULL,
	[DEFPTSPRO] [money] NOT NULL,
	[defptsotr] [money] NOT NULL,
	[Jdd] [int] NOT NULL,
 CONSTRAINT [PK_TBEVADEF] PRIMARY KEY CLUSTERED 
(
	[Jdd] ASC,
	[DEFCODIGO] ASC,
	[DEFCODFMT] ASC,
	[DEFCODFAC] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TBEVACON]    Script Date: 10/19/2015 10:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TBEVACON](
	[CONCODINC] [int] NOT NULL,
	[CONCODIGO] [int] NOT NULL,
	[CONPORCENT] [int] NOT NULL,
	[CONPROCED] [char](1) NOT NULL,
	[CONAPLICA] [int] NOT NULL,
	[CONTEXCLU] [int] NOT NULL,
	[CONHABILIT] [int] NOT NULL,
	[CONDESCRIP] [char](30) NOT NULL,
	[CONCONDIC] [char](254) NOT NULL,
	[CONDESCAD] [char](254) NOT NULL,
	[CONVER] [int] NOT NULL,
	[CONT1E] [int] NOT NULL,
	[CONT1A] [int] NOT NULL,
	[CONT2E] [int] NOT NULL,
	[CONT2A] [int] NOT NULL,
	[CONT3E] [int] NOT NULL,
	[CONT3A] [int] NOT NULL,
	[CONT4E] [int] NOT NULL,
	[CONT4A] [int] NOT NULL,
	[CONT5E] [int] NOT NULL,
	[CONT5A] [int] NOT NULL,
	[CONT6E] [int] NOT NULL,
	[CONT6A] [int] NOT NULL,
	[CONT7E] [int] NOT NULL,
	[CONT7A] [int] NOT NULL,
	[CONT8E] [int] NOT NULL,
	[CONT8A] [int] NOT NULL,
	[CONT9E] [int] NOT NULL,
	[CONT9A] [int] NOT NULL,
	[CONT10E] [int] NOT NULL,
	[CONT10A] [int] NOT NULL,
	[CONT11E] [int] NOT NULL,
	[CONT11A] [int] NOT NULL,
	[CONT12E] [int] NOT NULL,
	[CONT12A] [int] NOT NULL,
	[CONT13E] [int] NOT NULL,
	[CONT13A] [int] NOT NULL,
	[CONT14E] [int] NOT NULL,
	[CONT14A] [int] NOT NULL,
	[CONT15E] [int] NOT NULL,
	[CONT15A] [int] NOT NULL,
	[CONTIPO] [int] NOT NULL,
	[CONTIPOCAL] [int] NOT NULL,
	[CONCODEVA] [int] NOT NULL,
	[Jdd] [int] NOT NULL,
 CONSTRAINT [PK_TBEVACON] PRIMARY KEY CLUSTERED 
(
	[Jdd] ASC,
	[CONCODINC] ASC,
	[CONCODIGO] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TBEVACGR]    Script Date: 10/19/2015 10:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TBEVACGR](
	[cgrnumero] [int] NOT NULL,
	[cgrevaluac] [int] NOT NULL,
	[cgrgrupo] [int] NOT NULL,
	[cgrvotante] [int] NOT NULL,
	[cgrtipovot] [int] NOT NULL,
	[cgrfecha] [datetime] NOT NULL,
	[cgranot] [varchar](max) NOT NULL,
	[cgrcoment] [varchar](max) NOT NULL,
	[Jdd] [int] NOT NULL,
 CONSTRAINT [PK_TBEVACGR] PRIMARY KEY CLUSTERED 
(
	[Jdd] ASC,
	[cgrnumero] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TBEVACFG]    Script Date: 10/19/2015 10:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TBEVACFG](
	[CFGFORM] [char](10) NOT NULL,
	[CFGVALOR] [int] NOT NULL,
	[CFGVALOR2] [char](40) NOT NULL,
	[Jdd] [int] NOT NULL,
 CONSTRAINT [PK_TBEVACFG] PRIMARY KEY CLUSTERED 
(
	[Jdd] ASC,
	[CFGFORM] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TBEVACES]    Script Date: 10/19/2015 10:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TBEVACES](
	[cesnumero] [int] NOT NULL,
	[cesevaluac] [int] NOT NULL,
	[cesgrupo] [int] NOT NULL,
	[cesvotante] [int] NOT NULL,
	[cestipovot] [int] NOT NULL,
	[cesfactor] [char](3) NOT NULL,
	[cessubfac] [char](3) NOT NULL,
	[cesfecha] [datetime] NOT NULL,
	[cesanot] [varchar](max) NOT NULL,
	[cescoment] [varchar](max) NOT NULL,
	[cesposneg] [char](1) NOT NULL,
	[cesreqcap] [numeric](1, 0) NOT NULL,
	[cesposneg2] [numeric](1, 0) NOT NULL,
	[Jdd] [int] NOT NULL,
 CONSTRAINT [PK_TBEVACES] PRIMARY KEY CLUSTERED 
(
	[Jdd] ASC,
	[cesnumero] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TBEVACEM]    Script Date: 10/19/2015 10:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TBEVACEM](
	[cemCODEVD] [int] NOT NULL,
	[cemLEGAJO] [char](12) NOT NULL,
	[cemMETCOD] [int] NOT NULL,
	[cemGRUPO] [int] NOT NULL,
	[cemCODIGO] [int] NOT NULL,
	[cemFECHA] [datetime] NOT NULL,
	[cemCOMENT] [varchar](max) NOT NULL,
	[cemANOT] [varchar](max) NOT NULL,
	[cemPOSNEG] [char](1) NOT NULL,
	[cemREQCAP] [numeric](1, 0) NOT NULL,
	[cemPORC] [numeric](10, 2) NOT NULL,
	[Jdd] [int] NOT NULL,
 CONSTRAINT [PK_TBEVACEM] PRIMARY KEY CLUSTERED 
(
	[Jdd] ASC,
	[cemCODIGO] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TBEVACAT]    Script Date: 10/19/2015 10:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TBEVACAT](
	[codigo] [int] NOT NULL,
	[codvar] [char](14) NOT NULL,
	[archivo] [char](8) NOT NULL,
	[clasif] [char](3) NOT NULL,
	[campo] [char](10) NOT NULL,
	[caption] [char](30) NOT NULL,
	[descrip] [char](50) NOT NULL,
	[alias] [char](1) NOT NULL,
	[tabla] [int] NOT NULL,
	[rtcodigo] [int] NOT NULL,
	[contab] [char](1) NOT NULL,
	[calculo] [char](64) NOT NULL,
	[tipo] [char](1) NOT NULL,
	[largo] [int] NOT NULL,
	[deci] [numeric](2, 0) NOT NULL,
	[format] [char](5) NOT NULL,
	[pic] [char](20) NOT NULL,
	[valida] [char](50) NOT NULL,
	[busca] [char](50) NOT NULL,
	[modi] [char](1) NOT NULL,
	[histor] [char](1) NOT NULL,
	[lisord] [char](1) NOT NULL,
	[Jdd] [int] NOT NULL,
 CONSTRAINT [PK_TBEVACAT] PRIMARY KEY CLUSTERED 
(
	[Jdd] ASC,
	[codigo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TBEVAAPM]    Script Date: 10/19/2015 10:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBEVAAPM](
	[APMGRUPO] [int] NOT NULL,
	[APMESTADO] [int] NOT NULL,
	[APMEVALUA] [int] NOT NULL,
	[APMSUPERI] [int] NOT NULL,
	[APMREVIS1] [int] NOT NULL,
	[APMREVIS2] [int] NOT NULL,
	[APMRRHH] [int] NOT NULL,
	[APMEVDCOD] [int] NOT NULL,
	[Jdd] [int] NOT NULL,
 CONSTRAINT [PK_TBEVAAPM] PRIMARY KEY CLUSTERED 
(
	[Jdd] ASC,
	[APMGRUPO] ASC,
	[APMESTADO] ASC,
	[APMEVDCOD] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TBEVA_RHU]    Script Date: 10/19/2015 10:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TBEVA_RHU](
	[Modulo] [char](8) NOT NULL,
	[Descrip] [char](40) NOT NULL,
	[Tipo] [char](1) NOT NULL,
	[Campos] [varchar](max) NOT NULL,
	[Desde] [varchar](max) NOT NULL,
	[Filtro] [varchar](max) NOT NULL,
	[Agrupa] [char](150) NOT NULL,
	[Orden] [char](150) NOT NULL,
	[Tipper] [int] NOT NULL,
	[Cohades] [char](250) NOT NULL,
	[Usuario] [char](12) NOT NULL,
	[Indir] [int] NOT NULL,
	[Directa] [varchar](max) NOT NULL,
	[Swhere] [char](150) NOT NULL,
	[Pwhere] [char](250) NOT NULL,
	[org] [char](1) NOT NULL,
	[cabecera] [char](254) NOT NULL,
	[visibles] [char](254) NOT NULL,
	[nperiodo] [int] NOT NULL,
	[Pexpre] [varchar](max) NOT NULL,
	[Clasif] [int] NOT NULL,
	[grupos] [char](66) NOT NULL,
	[dueno] [char](12) NOT NULL,
	[Jdd] [int] NOT NULL,
 CONSTRAINT [PK_TBEVA_RHU] PRIMARY KEY CLUSTERED 
(
	[Jdd] ASC,
	[Modulo] ASC,
	[Usuario] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO

-- III

/****** Object:  Table [dbo].[TBCASTRA]    Script Date: 10/19/2015 10:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TBCASTRA](
	[tracodigo] [char](12) NOT NULL,
	[tradescrip] [char](40) NOT NULL,
	[trahoraini] [char](5) NOT NULL,
	[trahorafin] [char](5) NOT NULL,
	[tratipo] [char](1) NOT NULL,
	[tratolesat] [char](2) NOT NULL,
	[tratoleshe] [char](2) NOT NULL,
	[tratolssin] [char](2) NOT NULL,
	[tratolsshe] [char](2) NOT NULL,
	[tracolor] [int] NOT NULL,
	[traintini] [char](5) NOT NULL,
	[traintfin] [char](5) NOT NULL,
	[traflags] [int] NOT NULL,
	[traentmax] [char](5) NOT NULL,
	[traentsup] [char](5) NOT NULL,
	[tratolent] [char](5) NOT NULL,
	[tratotnor] [char](5) NOT NULL,
	[tratolcol] [char](5) NOT NULL,
	[traentlim] [char](5) NOT NULL,
	[tragrupo] [int] NOT NULL,
	[traconjun] [char](20) NOT NULL,
	[Jdd] [int] NOT NULL,
 CONSTRAINT [PK_TBCASTRA] PRIMARY KEY CLUSTERED 
(
	[Jdd] ASC,
	[tracodigo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbcastnn]    Script Date: 10/19/2015 10:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbcastnn](
	[tnncodigo] [int] NOT NULL,
	[tnndescrip] [char](50) NOT NULL,
	[tnnorden] [int] NOT NULL,
	[tnnmenu] [char](50) NOT NULL,
	[tnn_lbl1] [char](20) NOT NULL,
	[tnn_lbl2] [char](20) NOT NULL,
	[tnn_cotab] [int] NOT NULL,
	[tnn_otros] [int] NOT NULL,
	[tnnhabilit] [int] NOT NULL,
	[tnn_valid] [int] NOT NULL,
	[tnn_frmext] [char](30) NOT NULL,
	[tnn_cols] [char](60) NOT NULL,
	[Jdd] [int] NOT NULL,
 CONSTRAINT [PK_tbcastnn] PRIMARY KEY CLUSTERED 
(
	[Jdd] ASC,
	[tnncodigo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbcastnm]    Script Date: 10/19/2015 10:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbcastnm](
	[tnmcodigo] [int] NOT NULL,
	[tnmorden] [int] NOT NULL,
	[tnm_legaj] [char](40) NOT NULL,
	[tnm_fecha] [char](40) NOT NULL,
	[tnm_hini] [char](40) NOT NULL,
	[tnm_hfin] [char](40) NOT NULL,
	[tnm_tipo] [char](1) NOT NULL,
	[tnm_cam] [int] NOT NULL,
	[tnm_cext] [char](6) NOT NULL,
	[tnm_excl] [int] NOT NULL,
	[tnm_vteo] [int] NOT NULL,
	[tnm_vnov] [int] NOT NULL,
	[tnm_tdia] [int] NOT NULL,
	[Jdd] [int] NOT NULL,
 CONSTRAINT [PK_tbcastnm] PRIMARY KEY CLUSTERED 
(
	[Jdd] ASC,
	[tnmcodigo] ASC,
	[tnmorden] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TbCasTar]    Script Date: 10/19/2015 10:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TbCasTar](
	[TarCodigo] [char](12) NOT NULL,
	[TarFecha] [datetime] NOT NULL,
	[TarUnidad] [int] NOT NULL,
	[TarHorasP] [numeric](10, 2) NOT NULL,
	[TarHorasR] [numeric](10, 2) NOT NULL,
	[TarTipAsiP] [int] NOT NULL,
	[TarTipAsiR] [int] NOT NULL,
 CONSTRAINT [PK_TbCasTar] PRIMARY KEY CLUSTERED 
(
	[TarCodigo] ASC,
	[TarFecha] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TbCasTad]    Script Date: 10/19/2015 10:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TbCasTad](
	[TadNro] [int] IDENTITY(1,1) NOT NULL,
	[TadAmes] [char](6) NOT NULL,
	[TadUnidad] [int] NOT NULL,
	[TadFecha] [datetime] NOT NULL,
	[TadFecIni] [datetime] NOT NULL,
	[TadFecFin] [datetime] NOT NULL,
	[TadEstadop] [char](1) NOT NULL,
	[TadEstador] [char](1) NOT NULL,
	[TadUsuMod] [char](12) NOT NULL,
	[TadFecMod] [datetime] NOT NULL,
	[TadUsuSup] [char](12) NOT NULL,
	[TadFecSup] [datetime] NOT NULL,
	[TadUsuApr1] [char](12) NOT NULL,
	[TadFecaPr1] [datetime] NOT NULL,
	[TadUsuApr2] [char](12) NOT NULL,
	[TadFecApr2] [datetime] NOT NULL,
	[TadUsuRrhh] [char](12) NOT NULL,
	[TadFecRrhh] [datetime] NOT NULL,
	[TadEstadoE] [char](1) NOT NULL,
 CONSTRAINT [PK_TbCasTad] PRIMARY KEY CLUSTERED 
(
	[TadAmes] ASC,
	[TadUnidad] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TbCasStr]    Script Date: 10/19/2015 10:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TbCasStr](
	[StrNro] [int] IDENTITY(1,1) NOT NULL,
	[StrFecha] [datetime] NOT NULL,
	[StrUnidadO] [int] NOT NULL,
	[StrUnidadD] [int] NOT NULL,
	[StrCodigo] [char](12) NOT NULL,
	[StrEstado] [char](1) NOT NULL,
	[StrFecTra] [datetime] NOT NULL,
	[StrFecApr] [datetime] NOT NULL,
	[StrFecRec] [datetime] NOT NULL,
	[StrUsuario] [char](12) NOT NULL,
	[StrUsuApr] [char](12) NOT NULL,
	[StrUsuRec] [char](12) NOT NULL,
	[StrObserv] [varchar](max) NOT NULL,
	[Jdd] [int] NOT NULL,
 CONSTRAINT [PK_TbCasStr] PRIMARY KEY CLUSTERED 
(
	[StrNro] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TbCasSrA]    Script Date: 10/19/2015 10:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TbCasSrA](
	[SraNro] [int] IDENTITY(1,1) NOT NULL,
	[SraFecha] [datetime] NOT NULL,
	[SraUnidad] [int] NOT NULL,
	[SraAmes] [char](6) NOT NULL,
	[SraFecini] [datetime] NOT NULL,
	[SraFefini] [datetime] NOT NULL,
	[SraEstado] [char](1) NOT NULL,
	[SraFecapr] [datetime] NOT NULL,
	[SraFecrec] [datetime] NOT NULL,
	[SraUsuario] [char](12) NOT NULL,
	[SraUsuapr] [char](12) NOT NULL,
	[SraUsurec] [char](12) NOT NULL,
	[SraObserv] [varchar](max) NOT NULL,
	[Jdd] [int] NOT NULL,
 CONSTRAINT [PK_TbCasSrA] PRIMARY KEY CLUSTERED 
(
	[SraNro] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbcasrel]    Script Date: 10/19/2015 10:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbcasrel](
	[relcodigo] [int] NOT NULL,
	[rellegajo] [char](12) NOT NULL,
	[relfecha] [datetime] NOT NULL,
	[relhora] [char](5) NOT NULL,
	[reltipomov] [char](1) NOT NULL,
	[relreloj] [char](16) NOT NULL,
	[Jdd] [int] NOT NULL,
 CONSTRAINT [PK_tbcasrel] PRIMARY KEY CLUSTERED 
(
	[Jdd] ASC,
	[relcodigo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TBCASRAC]    Script Date: 10/19/2015 10:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TBCASRAC](
	[codigo] [int] NOT NULL,
	[descrip] [char](20) NOT NULL,
	[horario1e] [char](5) NOT NULL,
	[horario1s] [char](5) NOT NULL,
	[horario2e] [char](5) NOT NULL,
	[horario2s] [char](5) NOT NULL,
	[horario3e] [char](5) NOT NULL,
	[horario3s] [char](5) NOT NULL,
	[horario4e] [char](5) NOT NULL,
	[horario4s] [char](5) NOT NULL,
	[valor] [money] NOT NULL,
	[ant1] [int] NOT NULL,
	[ant2] [int] NOT NULL,
	[ant3] [int] NOT NULL,
	[ant4] [int] NOT NULL,
	[relojes] [char](80) NOT NULL,
	[Jdd] [int] NOT NULL,
 CONSTRAINT [PK_TBCASRAC] PRIMARY KEY CLUSTERED 
(
	[Jdd] ASC,
	[codigo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO

-- IV

/****** Object:  Table [dbo].[tbcasper]    Script Date: 10/19/2015 10:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbcasper](
	[fecha_ini] [datetime] NOT NULL,
	[fecha_fin] [datetime] NOT NULL,
	[fecha_cie] [datetime] NOT NULL,
	[usuario] [char](12) NOT NULL,
	[Jdd] [int] NOT NULL,
 CONSTRAINT [PK_tbcasper] PRIMARY KEY CLUSTERED 
(
	[Jdd] ASC,
	[fecha_ini] ASC,
	[fecha_fin] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbcaspen]    Script Date: 10/19/2015 10:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbcaspen](
	[codigo] [char](12) NOT NULL,
	[fecha] [datetime] NOT NULL,
	[estado] [char](1) NOT NULL,
	[cr] [datetime] NOT NULL,
	[Jdd] [int] NOT NULL,
 CONSTRAINT [PK_tbcaspen] PRIMARY KEY CLUSTERED 
(
	[Jdd] ASC,
	[codigo] ASC,
	[fecha] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TbCasPdo]    Script Date: 10/19/2015 10:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TbCasPdo](
	[PdoAmes] [char](6) NOT NULL,
	[PdoUnidad] [int] NOT NULL,
	[PdoEstado] [char](1) NOT NULL,
	[PdoEmpMod] [char](12) NOT NULL,
	[PdoFecMod] [datetime] NOT NULL,
	[PdoEmpSup] [char](12) NOT NULL,
	[PdoFecSup] [datetime] NOT NULL,
	[PdoEmpApr1] [char](12) NOT NULL,
	[PdoFecApr1] [datetime] NOT NULL,
	[PdoEmpApr2] [char](12) NOT NULL,
	[PdoFecApr2] [datetime] NOT NULL,
	[PdoEmpRRHH] [char](12) NOT NULL,
	[PdoFecRRHH] [datetime] NOT NULL,
 CONSTRAINT [PK_TbCasPdo] PRIMARY KEY CLUSTERED 
(
	[PdoAmes] ASC,
	[PdoUnidad] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbcaspac]    Script Date: 10/19/2015 10:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbcaspac](
	[codigo] [int] NOT NULL,
	[descrip] [char](32) NOT NULL,
	[lector] [int] NOT NULL,
	[tipo] [char](1) NOT NULL,
	[estado] [char](1) NOT NULL,
	[obs] [char](50) NOT NULL,
	[Jdd] [int] NOT NULL,
 CONSTRAINT [PK_tbcaspac] PRIMARY KEY CLUSTERED 
(
	[Jdd] ASC,
	[codigo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE NONCLUSTERED INDEX [llave1] ON [dbo].[tbcaspac] 
(
	[Jdd] ASC,
	[lector] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbcasnov]    Script Date: 10/19/2015 10:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbcasnov](
	[novcodigo] [int] NOT NULL,
	[novtipo] [int] NOT NULL,
	[novcrefech] [datetime] NOT NULL,
	[novcreusr] [char](12) NOT NULL,
	[novmotivo] [int] NOT NULL,
	[novobs] [char](254) NOT NULL,
	[novtdia] [int] NOT NULL,
	[novotros] [int] NOT NULL,
	[novnocas] [char](1) NOT NULL,
	[Jdd] [int] NOT NULL,
 CONSTRAINT [PK_tbcasnov] PRIMARY KEY CLUSTERED 
(
	[Jdd] ASC,
	[novcodigo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbcasnoh]    Script Date: 10/19/2015 10:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbcasnoh](
	[nohcodigo] [int] NOT NULL,
	[nohtipo] [int] NOT NULL,
	[nohcrefech] [datetime] NOT NULL,
	[nohcreusr] [char](12) NOT NULL,
	[nohmotivo] [int] NOT NULL,
	[nohobs] [char](254) NOT NULL,
	[nohtdia] [int] NOT NULL,
	[nohotros] [int] NOT NULL,
	[nohnocas] [char](1) NOT NULL,
	[Jdd] [int] NOT NULL,
	[novnocas] [char](1) NOT NULL,
 CONSTRAINT [PK_tbcasnoh] PRIMARY KEY CLUSTERED 
(
	[Jdd] ASC,
	[nohcodigo] ASC,
	[nohcrefech] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbcasnmo]    Script Date: 10/19/2015 10:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbcasnmo](
	[nmonovedad] [int] NOT NULL,
	[nmoordenpr] [int] NOT NULL,
	[nmofecha] [datetime] NOT NULL,
	[nmolegajo] [char](12) NOT NULL,
	[nmohoraini] [char](5) NOT NULL,
	[nmohorafin] [char](5) NOT NULL,
	[nmotipo] [char](1) NOT NULL,
	[nmoultimo] [int] NOT NULL,
	[nmocex] [char](6) NOT NULL,
	[nmoautfech] [datetime] NOT NULL,
	[nmoautusr] [char](12) NOT NULL,
	[nmoaprfech] [datetime] NOT NULL,
	[nmoaprusr] [char](12) NOT NULL,
	[nmocencos] [int] NOT NULL,
	[nmorecfech] [datetime] NOT NULL,
	[nmorecusr] [char](12) NOT NULL,
	[nmoautoriz] [char](12) NOT NULL,
	[Jdd] [int] NOT NULL,
 CONSTRAINT [PK_tbcasnmo] PRIMARY KEY CLUSTERED 
(
	[Jdd] ASC,
	[nmonovedad] ASC,
	[nmoordenpr] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE NONCLUSTERED INDEX [llave1] ON [dbo].[tbcasnmo] 
(
	[Jdd] ASC,
	[nmofecha] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbcasnmh]    Script Date: 10/19/2015 10:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbcasnmh](
	[nmhnovedad] [int] NOT NULL,
	[nmhordenpr] [int] NOT NULL,
	[nmhfecha] [datetime] NOT NULL,
	[nmhlegajo] [char](12) NOT NULL,
	[nmhhoraini] [char](5) NOT NULL,
	[nmhhorafin] [char](5) NOT NULL,
	[nmhtipo] [char](1) NOT NULL,
	[nmhultimo] [int] NOT NULL,
	[nmhcex] [char](6) NOT NULL,
	[nmhautfech] [datetime] NOT NULL,
	[nmhautusr] [char](12) NOT NULL,
	[nmhaprfech] [datetime] NOT NULL,
	[nmhaprusr] [char](12) NOT NULL,
	[nmhcencos] [int] NOT NULL,
	[nmhrecfech] [datetime] NOT NULL,
	[nmhrecusr] [char](12) NOT NULL,
	[nmhautoriz] [char](12) NOT NULL,
	[Jdd] [int] NOT NULL,
 CONSTRAINT [PK_tbcasnmh] PRIMARY KEY CLUSTERED 
(
	[Jdd] ASC,
	[nmhnovedad] ASC,
	[nmhordenpr] ASC,
	[nmhfecha] ASC,
	[nmhlegajo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE NONCLUSTERED INDEX [llave1] ON [dbo].[tbcasnmh] 
(
	[Jdd] ASC,
	[nmhfecha] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbcasneg]    Script Date: 10/19/2015 10:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbcasneg](
	[codigo] [char](12) NOT NULL,
	[punto] [int] NOT NULL,
	[Jdd] [int] NOT NULL,
 CONSTRAINT [PK_tbcasneg] PRIMARY KEY CLUSTERED 
(
	[Jdd] ASC,
	[codigo] ASC,
	[punto] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE NONCLUSTERED INDEX [llave1] ON [dbo].[tbcasneg] 
(
	[Jdd] ASC,
	[punto] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TBCASLIQ]    Script Date: 10/19/2015 10:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TBCASLIQ](
	[codigo] [char](12) NOT NULL,
	[dia] [datetime] NOT NULL,
	[cohade] [char](6) NOT NULL,
	[horas] [numeric](9, 4) NOT NULL,
	[tipo] [char](1) NOT NULL,
	[cencos] [int] NOT NULL,
	[cerrado] [char](1) NOT NULL,
	[modificado] [int] NOT NULL,
	[Jdd] [int] NOT NULL,
 CONSTRAINT [PK_TBCASLIQ] PRIMARY KEY CLUSTERED 
(
	[Jdd] ASC,
	[codigo] ASC,
	[dia] ASC,
	[cohade] ASC,
	[cencos] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE NONCLUSTERED INDEX [llave1] ON [dbo].[TBCASLIQ] 
(
	[Jdd] ASC,
	[dia] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TbCasEva]    Script Date: 10/19/2015 10:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TbCasEva](
	[EvaTareo] [int] NOT NULL,
	[EvaFecha] [datetime] NOT NULL,
	[EvaUsuario] [char](12) NOT NULL,
	[EvaEstado] [char](1) NOT NULL,
	[EvaObserv] [varchar](max) NOT NULL,
	[Jdd] [int] NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TBCASETU]    Script Date: 10/19/2015 10:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TBCASETU](
	[etucodigo] [char](8) NOT NULL,
	[etudescrip] [char](40) NOT NULL,
	[etuinicio] [datetime] NOT NULL,
	[etuesqrot] [char](8) NOT NULL,
	[etusecini] [numeric](2, 0) NOT NULL,
	[etudiaini] [numeric](2, 0) NOT NULL,
	[Jdd] [int] NOT NULL,
 CONSTRAINT [PK_TBCASETU] PRIMARY KEY CLUSTERED 
(
	[Jdd] ASC,
	[etucodigo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TBCASETR]    Script Date: 10/19/2015 10:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TBCASETR](
	[etrlegajo] [char](12) NOT NULL,
	[etrfecha] [datetime] NOT NULL,
	[etrtramo] [char](12) NOT NULL,
	[etresqtur] [char](8) NOT NULL,
	[etrent] [char](5) NOT NULL,
	[etrsal] [char](5) NOT NULL,
	[etrent1] [char](5) NOT NULL,
	[etrsal1] [char](5) NOT NULL,
	[Jdd] [int] NOT NULL,
 CONSTRAINT [PK_TBCASETR] PRIMARY KEY CLUSTERED 
(
	[Jdd] ASC,
	[etrlegajo] ASC,
	[etrfecha] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TBCASERT]    Script Date: 10/19/2015 10:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TBCASERT](
	[ertesqrot] [char](8) NOT NULL,
	[erttramo] [char](12) NOT NULL,
	[ertsecuenc] [numeric](2, 0) NOT NULL,
	[ertdias] [numeric](2, 0) NOT NULL,
	[Jdd] [int] NOT NULL,
 CONSTRAINT [PK_TBCASERT] PRIMARY KEY CLUSTERED 
(
	[Jdd] ASC,
	[ertesqrot] ASC,
	[ertsecuenc] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TBCASERO]    Script Date: 10/19/2015 10:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TBCASERO](
	[erocodigo] [char](8) NOT NULL,
	[erodescrip] [char](40) NOT NULL,
	[Jdd] [int] NOT NULL,
 CONSTRAINT [PK_TBCASERO] PRIMARY KEY CLUSTERED 
(
	[Jdd] ASC,
	[erocodigo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbcasera]    Script Date: 10/19/2015 10:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbcasera](
	[codigo] [char](12) NOT NULL,
	[racion] [int] NOT NULL,
	[multiples] [datetime] NOT NULL,
	[Jdd] [int] NOT NULL,
 CONSTRAINT [PK_tbcasera] PRIMARY KEY CLUSTERED 
(
	[Jdd] ASC,
	[codigo] ASC,
	[racion] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbcaselm]    Script Date: 10/19/2015 10:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbcaselm](
	[elmnovedad] [int] NOT NULL,
	[elmorden] [int] NOT NULL,
	[elmvalor] [char](100) NOT NULL,
	[Jdd] [int] NOT NULL,
 CONSTRAINT [PK_tbcaselm] PRIMARY KEY CLUSTERED 
(
	[Jdd] ASC,
	[elmnovedad] ASC,
	[elmorden] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbcascre]    Script Date: 10/19/2015 10:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbcascre](
	[crecodigo] [int] NOT NULL,
	[cretarjeta] [char](16) NOT NULL,
	[crefecha] [datetime] NOT NULL,
	[crehora] [char](5) NOT NULL,
	[cretipomov] [char](5) NOT NULL,
	[crereloj] [char](16) NOT NULL,
	[crenoapa] [numeric](1, 0) NOT NULL,
	[Jdd] [int] NOT NULL,
 CONSTRAINT [PK_tbcascre] PRIMARY KEY CLUSTERED 
(
	[Jdd] ASC,
	[crecodigo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbcascom]    Script Date: 10/19/2015 10:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbcascom](
	[comcodigo] [int] NOT NULL,
	[comlegajo] [char](12) NOT NULL,
	[comfecha] [datetime] NOT NULL,
	[comhora] [char](5) NOT NULL,
	[comtipomov] [char](1) NOT NULL,
	[comracion] [int] NOT NULL,
	[comdiaan] [int] NOT NULL,
	[comticket] [int] NOT NULL,
	[commanaut] [char](1) NOT NULL,
	[comreloj] [char](16) NOT NULL,
	[Jdd] [int] NOT NULL,
 CONSTRAINT [PK_tbcascom] PRIMARY KEY CLUSTERED 
(
	[Jdd] ASC,
	[comcodigo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbcascoh]    Script Date: 10/19/2015 10:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbcascoh](
	[cohcodigo] [int] NOT NULL,
	[cohlegajo] [char](12) NOT NULL,
	[cohfecha] [datetime] NOT NULL,
	[cohhora] [char](5) NOT NULL,
	[cohtipomov] [char](1) NOT NULL,
	[cohracion] [int] NOT NULL,
	[cohdiaan] [int] NOT NULL,
	[cohticket] [int] NOT NULL,
	[cohmanaut] [char](1) NOT NULL,
	[cohreloj] [char](16) NOT NULL,
	[Jdd] [int] NOT NULL,
 CONSTRAINT [PK_tbcascoh] PRIMARY KEY CLUSTERED 
(
	[Jdd] ASC,
	[cohcodigo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TBCASCLK]    Script Date: 10/19/2015 10:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TBCASCLK](
	[clkcodigo] [char](16) NOT NULL,
	[clkdescrip] [char](40) NOT NULL,
	[clktipocom] [int] NOT NULL,
	[clkportcom] [char](5) NOT NULL,
	[clkdirec] [char](20) NOT NULL,
	[clkconect] [char](20) NOT NULL,
	[clkcencos] [char](80) NOT NULL,
	[clkmodelo] [int] NOT NULL,
	[clkhabilit] [int] NOT NULL,
	[clkufecha] [datetime] NOT NULL,
	[clkuhor] [char](5) NOT NULL,
	[clkmail] [char](60) NOT NULL,
	[clktipo] [char](1) NOT NULL,
	[clkcondic] [char](254) NOT NULL,
	[Jdd] [int] NOT NULL,
 CONSTRAINT [PK_TBCASCLK] PRIMARY KEY CLUSTERED 
(
	[Jdd] ASC,
	[clkcodigo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TBCASCFG]    Script Date: 10/19/2015 10:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TBCASCFG](
	[clave] [int] NOT NULL,
	[valor] [char](254) NOT NULL,
	[valor2] [char](254) NOT NULL,
	[Jdd] [int] NOT NULL,
 CONSTRAINT [PK_TBCASCFG] PRIMARY KEY CLUSTERED 
(
	[Jdd] ASC,
	[clave] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbcascex]    Script Date: 10/19/2015 10:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbcascex](
	[cexcodnov] [int] NOT NULL,
	[cexorden] [int] NOT NULL,
	[cexmotivo] [int] NOT NULL,
	[cexcodigo] [char](6) NOT NULL,
	[Jdd] [int] NOT NULL,
 CONSTRAINT [PK_tbcascex] PRIMARY KEY CLUSTERED 
(
	[Jdd] ASC,
	[cexcodnov] ASC,
	[cexorden] ASC,
	[cexmotivo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbcascco]    Script Date: 10/19/2015 10:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbcascco](
	[ccolegajo] [char](12) NOT NULL,
	[ccofecha] [datetime] NOT NULL,
	[ccocch1] [money] NOT NULL,
	[ccocch2] [money] NOT NULL,
	[ccocch3] [money] NOT NULL,
	[ccocch4] [money] NOT NULL,
	[ccocch5] [money] NOT NULL,
	[ccocch6] [money] NOT NULL,
	[ccocch7] [money] NOT NULL,
	[ccocch8] [money] NOT NULL,
	[ccocch9] [money] NOT NULL,
	[ccocch10] [money] NOT NULL,
	[ccotipo] [char](1) NOT NULL,
	[ccoobs] [char](30) NOT NULL,
	[Jdd] [int] NOT NULL,
 CONSTRAINT [PK_tbcascco] PRIMARY KEY CLUSTERED 
(
	[Jdd] ASC,
	[ccolegajo] ASC,
	[ccofecha] ASC,
	[ccotipo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TBCASCAT]    Script Date: 10/19/2015 10:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TBCASCAT](
	[catfecha] [datetime] NOT NULL,
	[catesqtur] [char](12) NOT NULL,
	[cattramo] [char](8) NOT NULL,
	[Jdd] [int] NOT NULL,
 CONSTRAINT [PK_TBCASCAT] PRIMARY KEY CLUSTERED 
(
	[Jdd] ASC,
	[catfecha] ASC,
	[catesqtur] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbcasbla]    Script Date: 10/19/2015 10:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbcasbla](
	[codigo] [char](12) NOT NULL,
	[punto] [int] NOT NULL,
	[Jdd] [int] NOT NULL,
 CONSTRAINT [PK_tbcasbla] PRIMARY KEY CLUSTERED 
(
	[Jdd] ASC,
	[codigo] ASC,
	[punto] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE NONCLUSTERED INDEX [llave1] ON [dbo].[tbcasbla] 
(
	[Jdd] ASC,
	[punto] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TBCASAPH]    Script Date: 10/19/2015 10:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TBCASAPH](
	[aphcodigo] [int] NOT NULL,
	[aphlegajo] [char](12) NOT NULL,
	[aphfecha] [datetime] NOT NULL,
	[aphhorae] [char](5) NOT NULL,
	[aphhoras] [char](5) NOT NULL,
	[aphestado] [int] NOT NULL,
	[aphcencos] [int] NOT NULL,
	[aphobserv] [char](254) NOT NULL,
	[aphtipo] [char](1) NOT NULL,
	[aphrelE] [char](16) NOT NULL,
	[aphrelS] [char](16) NOT NULL,
	[Jdd] [int] NOT NULL,
 CONSTRAINT [PK_TBCASAPH] PRIMARY KEY CLUSTERED 
(
	[Jdd] ASC,
	[aphcodigo] ASC,
	[aphlegajo] ASC,
	[aphfecha] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TBCASAPA]    Script Date: 10/19/2015 10:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TBCASAPA](
	[apacodigo] [int] NOT NULL,
	[apalegajo] [char](12) NOT NULL,
	[apafecha] [datetime] NOT NULL,
	[apahorae] [char](5) NOT NULL,
	[apahoras] [char](5) NOT NULL,
	[apaestado] [int] NOT NULL,
	[apacencos] [int] NOT NULL,
	[apaobserv] [char](254) NOT NULL,
	[apatipo] [char](1) NOT NULL,
	[aparelE] [char](16) NOT NULL,
	[aparelS] [char](16) NOT NULL,
	[Jdd] [int] NOT NULL,
 CONSTRAINT [PK_TBCASAPA] PRIMARY KEY CLUSTERED 
(
	[Jdd] ASC,
	[apacodigo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE NONCLUSTERED INDEX [llave1] ON [dbo].[TBCASAPA] 
(
	[Jdd] ASC,
	[apalegajo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [llave2] ON [dbo].[TBCASAPA] 
(
	[Jdd] ASC,
	[apalegajo] ASC,
	[apafecha] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbcasacc]    Script Date: 10/19/2015 10:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbcasacc](
	[codigo] [char](12) NOT NULL,
	[fecha] [datetime] NOT NULL,
	[hora] [char](5) NOT NULL,
	[punto] [int] NOT NULL,
	[resultado] [char](2) NOT NULL,
	[credencial] [char](16) NOT NULL,
	[clave] [char](10) NOT NULL,
	[Jdd] [int] NOT NULL,
 CONSTRAINT [PK_tbcasacc] PRIMARY KEY CLUSTERED 
(
	[Jdd] ASC,
	[clave] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE NONCLUSTERED INDEX [llave1] ON [dbo].[tbcasacc] 
(
	[Jdd] ASC,
	[codigo] ASC,
	[fecha] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sindices]    Script Date: 10/19/2015 10:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Sindices](
	[Jdd] [int] NOT NULL,
	[Ames] [char](6) NOT NULL,
	[Uf] [money] NOT NULL,
	[Utm] [int] NOT NULL,
	[SueldoMin] [money] NOT NULL,
 CONSTRAINT [PK_Sindices] PRIMARY KEY CLUSTERED 
(
	[Ames] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RVerRep]    Script Date: 10/19/2015 10:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RVerRep](
	[reg_rep] [char](100) NOT NULL,
	[ver_rep] [int] NOT NULL,
	[fecha_eje] [datetime] NOT NULL,
	[usuario] [char](12) NOT NULL,
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Jdd] [int] NOT NULL,
 CONSTRAINT [PK_RVerRep] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RValidac]    Script Date: 10/19/2015 10:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RValidac](
	[Jdd] [int] NOT NULL,
	[Usuario] [char](12) NOT NULL,
	[Descrip] [char](30) NOT NULL,
	[Condicion] [char](250) NOT NULL,
	[Validacion] [char](250) NOT NULL,
	[Mens_error] [char](250) NOT NULL,
	[Tipo] [char](1) NOT NULL,
	[ID] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_RValidac] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO

-- V

/****** 
Object:  Table [dbo].[RUSUARIOS]
Script Date: 10/19/2015
Description: Re create RUSUARIOS table, in order to add columns: 
			 fono, cont_princ, ej_payroll, ger_out, subge_out, jefe_out, 
			 grupo_out, idArea, supervisor.
******/

-- Deleting table first.
IF EXISTS (SELECT 1 
           FROM INFORMATION_SCHEMA.TABLES 
           WHERE TABLE_NAME='RUSUARIOS')
	drop table RUSUARIOS;

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
	[fono] [char](18) NOT NULL,
	[cont_princ] [char](1) NOT NULL,
	[ej_payroll] [char](1) NOT NULL,
	[ger_out] [int] NOT NULL,
	[subge_out] [int] NOT NULL,
	[jefe_out] [int] NOT NULL,
	[grupo_out] [int] NOT NULL,
	[idArea] [int] NOT NULL,
	[supervisor] [char](12) NOT NULL,
 CONSTRAINT [PK_RUSUARIOS] PRIMARY KEY CLUSTERED 
(
	[Usuario] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO

-- VI

/****** Object:  Table [dbo].[RultseleD]    Script Date: 10/19/2015 10:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RultseleD](
	[Jdd] [int] NOT NULL,
	[Sele] [int] NOT NULL,
	[descrip] [char](30) NOT NULL,
 CONSTRAINT [PK_RultseleD] PRIMARY KEY CLUSTERED 
(
	[Jdd] ASC,
	[Sele] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Rultsele]    Script Date: 10/19/2015 10:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Rultsele](
	[Jdd] [int] NOT NULL,
	[jdato] [char](8) NOT NULL,
	[Sele] [int] NOT NULL,
	[Usuario] [char](12) NOT NULL,
	[Codigo] [char](12) NOT NULL,
	[rut] [char](12) NOT NULL,
 CONSTRAINT [PK_Rultsele] PRIMARY KEY CLUSTERED 
(
	[Jdd] ASC,
	[jdato] ASC,
	[Usuario] ASC,
	[Sele] ASC,
	[Codigo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO

-- VII

/****** Object:  Table [dbo].[Rtiposeg]    Script Date: 10/19/2015 10:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Rtiposeg](
	[Tipo] [char](3) NOT NULL,
	[Descrip] [char](30) NOT NULL,
	[Jdd] [int] NOT NULL,
 CONSTRAINT [PK_Rtiposeg] PRIMARY KEY CLUSTERED 
(
	[Jdd] ASC,
	[Tipo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO

-- VIII

/****** 
Object:  Table [dbo].[RTEMPLATES]
Script Date: 10/19/2015
Description: Re create RTEMPLATES table, in order to add columns: 
			 item1, item2, item3, item4, item5, item6, item7, item8, 
			 item9, item10, valor1, valor2, valor3, valor4, valor5, 
			 valor6, valor7, valor8, valor9 , valor10, firmacod, veautoc.
******/

-- Deleting table first.
IF EXISTS (SELECT 1 
           FROM INFORMATION_SCHEMA.TABLES 
           WHERE TABLE_NAME='RTEMPLATES')
	drop table RTEMPLATES;

/****** Object:  Table [dbo].[RTEMPLATES]    Script Date: 10/19/2015 10:35:10 ******/
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
	[item1] [char](6) NOT NULL,
	[item2] [char](6) NOT NULL,
	[item3] [char](6) NOT NULL,
	[item4] [char](6) NOT NULL,
	[item5] [char](6) NOT NULL,
	[item6] [char](6) NOT NULL,
	[item7] [char](6) NOT NULL,
	[item8] [char](6) NOT NULL,
	[item9] [char](6) NOT NULL,
	[item10] [char](6) NOT NULL,
	[valor1] [char](1) NOT NULL,
	[valor2] [char](1) NOT NULL,
	[valor3] [char](1) NOT NULL,
	[valor4] [char](1) NOT NULL,
	[valor5] [char](1) NOT NULL,
	[valor6] [char](1) NOT NULL,
	[valor7] [char](1) NOT NULL,
	[valor8] [char](1) NOT NULL,
	[valor9] [char](1) NOT NULL,
	[valor10] [char](1) NOT NULL,
	[firmacod] [char](12) NOT NULL,
	[veautoc] [char](1) NOT NULL,
 CONSTRAINT [PK_RTEMPLATES] PRIMARY KEY CLUSTERED 
(
	[Jdd] ASC,
	[Codigo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO

-- IX

/****** Object:  Table [dbo].[RtablasH]    Script Date: 10/19/2015 10:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RtablasH](
	[Jdd] [int] NOT NULL,
	[Ames] [char](6) NOT NULL,
	[Tipo] [char](1) NOT NULL,
	[Cotab] [int] NOT NULL,
	[Codigo] [int] NOT NULL,
	[Descrip] [char](40) NOT NULL,
	[Valor] [money] NOT NULL,
	[Valor2] [money] NOT NULL,
	[ValorC] [char](200) NOT NULL,
	[Valor4] [char](15) NOT NULL,
	[CodAl] [char](10) NOT NULL,
	[ValorG] [varchar](max) NOT NULL,
 CONSTRAINT [PK_RtablasH] PRIMARY KEY CLUSTERED 
(
	[Jdd] ASC,
	[Ames] ASC,
	[Cotab] ASC,
	[Codigo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO

-- X

/****** Object:  Table [dbo].[Rsercola]    Script Date: 10/19/2015 10:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Rsercola](
	[usuario] [char](12) NOT NULL,
	[id] [char](254) NOT NULL,
	[documento] [varbinary](max) NOT NULL,
	[IDReporte] [char](12) NOT NULL,
	[Finalizo] [int] NOT NULL,
	[Fecha_ini] [datetime] NOT NULL,
	[Fecha_in2] [datetime] NOT NULL,
	[Fecha_fin] [datetime] NOT NULL,
	[cantidad] [int] NOT NULL,
	[completo] [int] NOT NULL,
	[descrip] [char](254) NOT NULL,
	[feliq] [char](6) NOT NULL,
	[peri] [char](1) NOT NULL,
	[Jdd] [int] NOT NULL,
	[tipo] [int] NOT NULL,
	[Idbatch] [int] NOT NULL,
 CONSTRAINT [PK_Rsercola] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE NONCLUSTERED INDEX [llave1] ON [dbo].[Rsercola] 
(
	[id] ASC,
	[usuario] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RSeguros]    Script Date: 10/19/2015 10:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RSeguros](
	[Codigo] [char](12) NOT NULL,
	[Seguro] [int] NOT NULL,
	[Institu] [int] NOT NULL,
	[NroPoliza] [char](15) NOT NULL,
	[MontoEmpr] [money] NOT NULL,
	[MonEmpr] [int] NOT NULL,
	[MontoEmpl] [money] NOT NULL,
	[MonEmpl] [int] NOT NULL,
	[Fecha_ini] [datetime] NOT NULL,
	[Fecha_fin] [datetime] NOT NULL,
	[Jdd] [int] NOT NULL,
	[Estado] [int] NOT NULL,
 CONSTRAINT [PK_RSeguros] PRIMARY KEY CLUSTERED 
(
	[Codigo] ASC,
	[Seguro] ASC,
	[Jdd] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO

-- XI

/****** Object:  Table [dbo].[rrotupr5]    Script Date: 10/19/2015 10:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[rrotupr5](
	[campo] [char](12) NOT NULL,
	[tabla] [char](15) NOT NULL,
	[rotulo] [char](250) NOT NULL,
	[descrip] [char](250) NOT NULL,
	[cambiado] [char](250) NOT NULL,
	[Jdd] [int] NOT NULL,
 CONSTRAINT [PK_rrotupr5] PRIMARY KEY CLUSTERED 
(
	[Jdd] ASC,
	[campo] ASC,
	[tabla] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO

-- XII

/****** Object:  Table [dbo].[Rreportes]    Script Date: 10/19/2015 10:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Rreportes](
	[Jdd] [int] NOT NULL,
	[IDReporte] [char](12) NOT NULL,
	[Descrip] [char](40) NOT NULL,
	[Reporte] [varbinary](max) NOT NULL,
	[Autor] [char](40) NOT NULL,
	[Fecha_cre] [datetime] NOT NULL,
	[Fecha_rev] [datetime] NOT NULL,
	[Tipo] [int] NOT NULL,
 CONSTRAINT [PK_Rreportes] PRIMARY KEY CLUSTERED 
(
	[Jdd] ASC,
	[IDReporte] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO


-- XIII

/****** 
Object:  Table [dbo].[RRECIBOS]
Script Date: 10/19/2015
Description: Re create RRECIBOS table, in order to add columns: 
			 IdLote, Visto, Conform, ReciboC, ReciboNC.
******/

-- Deleting table first.
IF EXISTS (SELECT 1 
           FROM INFORMATION_SCHEMA.TABLES 
           WHERE TABLE_NAME='RRECIBOS')
	drop table RRECIBOS;

/****** Object:  Table [dbo].[RRECIBOS]    Script Date: 10/19/2015 10:35:10 ******/
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
	[IdLote] [int] NOT NULL,
	[Visto] [int] NOT NULL,
	[Conform] [int] NOT NULL,
	[ReciboC] [varbinary](max) NOT NULL,
	[ReciboNC] [varbinary](max) NOT NULL,
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

-- XIV

/****** 
Object:  Table [dbo].[RPUBLICA]
Script Date: 10/19/2015
Description: Re create RPUBLICA table, in order to add columns: 
			 Jdd.
******/

-- Deleting table first.
IF EXISTS (SELECT 1 
           FROM INFORMATION_SCHEMA.TABLES 
           WHERE TABLE_NAME='RPUBLICA')
	drop table RPUBLICA;

/****** Object:  Table [dbo].[RPUBLICA]    Script Date: 10/19/2015 10:35:10 ******/
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
	[Jdd] [int] NOT NULL,
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

-- XV

/****** 
Object:  Table [dbo].[RPROGRL]
Script Date: 10/19/2015
Description: Re create RPROGRL table, in order to add columns: 
			 Jdd.
******/

-- Deleting table first.
IF EXISTS (SELECT 1 
           FROM INFORMATION_SCHEMA.TABLES 
           WHERE TABLE_NAME='RPROGRL')
	drop table RPROGRL;

/****** Object:  Table [dbo].[RPROGRL]    Script Date: 10/19/2015 10:35:10 ******/
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
	[Jdd] [int] NOT NULL,
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

-- XVI

/****** Object:  Table [dbo].[RPRODUCTOS]    Script Date: 10/19/2015 10:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RPRODUCTOS](
	[IDproducto] [int] IDENTITY(1,1) NOT NULL,
	[Descrip] [varchar](100) NOT NULL,
	[Precio] [money] NOT NULL,
	[CantEmple] [int] NOT NULL,
	[Fechaini] [datetime] NOT NULL,
	[Fechafin] [datetime] NOT NULL,
	[UsuarAlta] [char](12) NOT NULL,
	[FechaAlta] [datetime] NOT NULL,
	[UsuarUltM] [char](12) NOT NULL,
	[FechaUltM] [datetime] NOT NULL,
	[Plataforma] [varchar](50) NOT NULL,
	[VencUpgr] [datetime] NOT NULL,
	[Tipolic] [varchar](50) NOT NULL,
	[Estup] [int] NOT NULL,
	[Elim] [int] NOT NULL,
	[ActivoCRM] [char](1) NOT NULL,
	[ActivoASP] [char](1) NOT NULL,
	[Version] [varchar](50) NOT NULL,
	[Jdd] [int] NOT NULL,
 CONSTRAINT [PK_RPRODUCTOS] PRIMARY KEY CLUSTERED 
(
	[IDproducto] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO

-- XVII

/****** Object:  Table [dbo].[Rpermisos]    Script Date: 10/19/2015 10:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Rpermisos](
	[Grupo] [char](12) NOT NULL,
	[Item] [char](20) NOT NULL,
	[Permisos] [char](20) NOT NULL,
	[Verif] [char](60) NOT NULL,
	[Jdd] [int] NOT NULL,
 CONSTRAINT [PK_Rpermisos] PRIMARY KEY CLUSTERED 
(
	[Jdd] ASC,
	[Grupo] ASC,
	[Item] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO

-- XVIII

/****** 
Object:  Table [dbo].[RPAUSER]
Script Date: 10/19/2015
Description: Re create RPAUSER table, in order to add columns: 
			 paradi.
******/

-- Deleting table first.
IF EXISTS (SELECT 1 
           FROM INFORMATION_SCHEMA.TABLES 
           WHERE TABLE_NAME='RPAUSER')
	drop table RPAUSER;

/****** Object:  Table [dbo].[RPAUSER]    Script Date: 10/19/2015 10:35:10 ******/
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
	[paradi] [char](2000) NOT NULL,
 CONSTRAINT [PK_RPAUSER] PRIMARY KEY CLUSTERED 
(
	[Usuario] ASC,
	[Copar] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO


-- XIX

/****** 
Object:  Table [dbo].[RPASIGA]
Script Date: 10/19/2015
Description: Re create RPASIGA table, in order to add columns: 
			 Jdd.
******/

-- Deleting table first.
IF EXISTS (SELECT 1 
           FROM INFORMATION_SCHEMA.TABLES 
           WHERE TABLE_NAME='RPASIGA')
	drop table RPASIGA;

/****** Object:  Table [dbo].[RPASIGA]    Script Date: 10/19/2015 10:35:10 ******/
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
	[Jdd] [int] NOT NULL,
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

-- XX

/****** Object:  Table [dbo].[RORGFUN5]    Script Date: 10/19/2015 10:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RORGFUN5](
	[Idorgani] [int] NOT NULL,
	[Idnodo] [int] NOT NULL,
	[Codigo] [char](12) NOT NULL,
	[Funcion] [int] NOT NULL,
 CONSTRAINT [PK_RORGFUN5] PRIMARY KEY CLUSTERED 
(
	[Idorgani] ASC,
	[Idnodo] ASC,
	[Codigo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ROrgCar5]    Script Date: 10/19/2015 10:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ROrgCar5](
	[IdOrgani] [int] NOT NULL,
	[IdNodo] [int] NOT NULL,
	[Cargo] [int] NOT NULL,
	[Cantidad] [int] NOT NULL,
	[Jdd] [int] NOT NULL,
 CONSTRAINT [PK_ROrgCar5] PRIMARY KEY CLUSTERED 
(
	[IdOrgani] ASC,
	[IdNodo] ASC,
	[Cargo] ASC,
	[Jdd] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ROrgani5]    Script Date: 10/19/2015 10:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ROrgani5](
	[IdOrgani] [int] NOT NULL,
	[Descrip] [char](40) NOT NULL,
	[Fecha_ini] [datetime] NOT NULL,
	[Fecha_fin] [datetime] NOT NULL,
	[Cotab] [int] NOT NULL,
	[Jdd] [int] NOT NULL,
 CONSTRAINT [PK_ROrgani5] PRIMARY KEY CLUSTERED 
(
	[IdOrgani] ASC,
	[Jdd] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Rorgani]    Script Date: 10/19/2015 10:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Rorgani](
	[Nivel] [char](20) NOT NULL,
	[Nroniv] [int] NOT NULL,
	[Descrip] [char](30) NOT NULL,
	[Nivsup] [char](20) NOT NULL,
	[Jdd] [int] NOT NULL,
 CONSTRAINT [PK_Rorgani] PRIMARY KEY CLUSTERED 
(
	[Jdd] ASC,
	[Nivel] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE NONCLUSTERED INDEX [llave1] ON [dbo].[Rorgani] 
(
	[Jdd] ASC,
	[Nroniv] ASC,
	[Nivel] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO

-- XXI

/****** Object:  Table [dbo].[rnotas]    Script Date: 10/19/2015 10:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[rnotas](
	[Jdd] [int] NOT NULL,
	[Usuario] [char](12) NOT NULL,
	[Nro] [int] NOT NULL,
	[Fecha_cre] [datetime] NOT NULL,
	[Descrip] [char](20) NOT NULL,
	[Fecha_ven] [datetime] NOT NULL,
	[Tipo] [char](1) NOT NULL,
	[Detalle] [varchar](max) NOT NULL,
	[FechaEnvio] [datetime] NOT NULL,
	[EnviaSMS] [char](1) NOT NULL,
	[EnviaMail] [char](1) NOT NULL,
	[Visto] [char](1) NOT NULL,
 CONSTRAINT [PK_rnotas] PRIMARY KEY CLUSTERED 
(
	[Jdd] ASC,
	[Usuario] ASC,
	[Nro] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RnominaE]    Script Date: 10/19/2015 10:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RnominaE](
	[Jdd] [int] NOT NULL,
	[Nomina] [int] NOT NULL,
	[Fecha_ing] [datetime] NOT NULL,
	[Ames] [char](6) NOT NULL,
	[Peri] [char](1) NOT NULL,
	[Ingreso] [char](12) NOT NULL,
	[Revisa] [char](12) NOT NULL,
	[Aprueba] [char](36) NOT NULL,
	[Fecha_apr] [datetime] NOT NULL,
	[Descrip] [varchar](200) NOT NULL,
	[Estado] [char](1) NOT NULL,
	[Motivor] [varchar](250) NOT NULL,
 CONSTRAINT [PK_RnominaE] PRIMARY KEY CLUSTERED 
(
	[Jdd] ASC,
	[Nomina] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE NONCLUSTERED INDEX [llave1] ON [dbo].[RnominaE] 
(
	[Jdd] ASC,
	[Aprueba] ASC,
	[Estado] ASC,
	[Nomina] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RnominaD]    Script Date: 10/19/2015 10:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RnominaD](
	[Jdd] [int] NOT NULL,
	[Nomina] [int] NOT NULL,
	[Linea] [int] NOT NULL,
	[codigo] [char](12) NOT NULL,
	[Id] [int] NOT NULL,
	[Cohade] [char](6) NOT NULL,
	[Monto] [money] NOT NULL,
	[Cuotas] [int] NOT NULL,
 CONSTRAINT [PK_RnominaD] PRIMARY KEY CLUSTERED 
(
	[Jdd] ASC,
	[Nomina] ASC,
	[Linea] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Rmsm]    Script Date: 10/19/2015 10:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Rmsm](
	[usuario] [char](12) NOT NULL,
	[id] [char](254) NOT NULL,
	[message] [char](254) NOT NULL,
	[source] [char](254) NOT NULL,
	[Fecha] [datetime] NOT NULL,
	[number] [char](254) NOT NULL,
	[Jdd] [int] NOT NULL,
 CONSTRAINT [PK_Rmsm] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE NONCLUSTERED INDEX [llave1] ON [dbo].[Rmsm] 
(
	[id] ASC,
	[usuario] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RmodulosI]    Script Date: 10/19/2015 10:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RmodulosI](
	[Jdd] [int] NOT NULL,
	[Id] [char](15) NOT NULL,
	[Descrip] [char](40) NOT NULL,
	[Clasif] [int] NOT NULL,
	[Campos] [varchar](500) NOT NULL,
	[Totales] [varchar](250) NOT NULL,
	[Tablas] [varchar](500) NOT NULL,
	[Filtro] [varchar](500) NOT NULL,
	[Orden] [char](150) NOT NULL,
	[Agrupa] [varchar](500) NOT NULL,
	[Peri] [char](1) NOT NULL,
	[Dueno] [char](12) NOT NULL,
	[Grupos] [varchar](160) NOT NULL,
	[fecha_cre] [datetime] NOT NULL,
 CONSTRAINT [PK_RmodulosI] PRIMARY KEY CLUSTERED 
(
	[Jdd] ASC,
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Rmodulos5]    Script Date: 10/19/2015 10:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Rmodulos5](
	[IDModulo] [char](12) NOT NULL,
	[Descrip] [char](40) NOT NULL,
	[Clasif] [int] NOT NULL,
	[Campos] [varchar](max) NOT NULL,
	[Desde] [varchar](max) NOT NULL,
	[Filtro] [varchar](max) NOT NULL,
	[Agrupa] [char](150) NOT NULL,
	[Orden] [char](150) NOT NULL,
	[Tipper] [int] NOT NULL,
	[Cohades] [varchar](max) NOT NULL,
	[Indir] [int] NOT NULL,
	[Grupos] [char](160) NOT NULL,
	[SQL] [varchar](max) NOT NULL,
	[Swhere] [char](150) NOT NULL,
	[SQLDirecto] [varchar](max) NOT NULL,
	[FSQLDirect] [int] NOT NULL,
	[Nperiodo] [int] NOT NULL,
	[varis] [varchar](max) NOT NULL,
	[ORDERBY] [char](200) NOT NULL,
	[Dueno] [char](12) NOT NULL,
	[Jdd] [int] NOT NULL,
 CONSTRAINT [PK_Rmodulos5] PRIMARY KEY CLUSTERED 
(
	[Jdd] ASC,
	[IDModulo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO

-- XXII

/****** Object:  Table [dbo].[RModRepOp]    Script Date: 10/19/2015 10:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RModRepOp](
	[CodTab80] [int] NOT NULL,
	[CodTab81] [int] NOT NULL,
	[id] [int] NOT NULL,
	[Jdd] [int] NOT NULL,
 CONSTRAINT [PK_RModRepOp] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- XXIII

/****** Object:  Table [dbo].[RModgest]    Script Date: 10/19/2015 10:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RModgest](
	[IDModulo] [char](12) NOT NULL,
	[Descrip] [char](40) NOT NULL,
	[Clasif] [int] NOT NULL,
	[Plantilla] [varbinary](max) NOT NULL,
	[Fecha_cre] [datetime] NOT NULL,
	[idCubo] [char](40) NOT NULL,
	[Seteo] [char](100) NOT NULL,
	[Dueno] [char](12) NOT NULL,
	[Jdd] [int] NOT NULL,
 CONSTRAINT [PK_RModgest] PRIMARY KEY CLUSTERED 
(
	[Jdd] ASC,
	[IDModulo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Rmodesp]    Script Date: 10/19/2015 10:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Rmodesp](
	[IDmodesp] [char](12) NOT NULL,
	[Descrip] [char](40) NOT NULL,
	[Fecha] [datetime] NOT NULL,
	[Usuario] [char](12) NOT NULL,
	[Definicion] [varchar](max) NOT NULL,
	[Jdd] [int] NOT NULL,
 CONSTRAINT [PK_Rmodesp] PRIMARY KEY CLUSTERED 
(
	[Jdd] ASC,
	[IDmodesp] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO

-- XXIV

/****** Object:  Table [dbo].[RLotes]    Script Date: 10/19/2015 10:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RLotes](
	[IdLote] [int] IDENTITY(1,1) NOT NULL,
	[Ames] [char](6) NOT NULL,
	[Peri] [char](1) NOT NULL,
	[Fecha_cre] [datetime] NOT NULL,
	[Usu_cre] [char](12) NOT NULL,
	[Obs_cre] [char](250) NOT NULL,
	[Total_emp] [int] NOT NULL,
	[Fecha_acr] [datetime] NOT NULL,
	[Fecha_pag] [datetime] NOT NULL,
	[Estado] [int] NOT NULL,
	[Fecha_mod] [datetime] NOT NULL,
	[Usu_mod] [char](12) NOT NULL,
	[Obs_mod] [char](250) NOT NULL,
	[Jdd] [int] NOT NULL,
 CONSTRAINT [PK_RLotes] PRIMARY KEY CLUSTERED 
(
	[IdLote] ASC,
	[Jdd] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Rlogval]    Script Date: 10/19/2015 10:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Rlogval](
	[Jdd] [int] NOT NULL,
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Proced] [char](30) NOT NULL,
	[Codigo] [char](12) NOT NULL,
	[Tipo] [char](1) NOT NULL,
	[Mens_Error] [varchar](250) NOT NULL,
	[Fecha] [datetime] NOT NULL,
	[Usuario] [char](12) NOT NULL,
	[Lote] [char](25) NOT NULL,
 CONSTRAINT [PK_Rlogval] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE NONCLUSTERED INDEX [llave1] ON [dbo].[Rlogval] 
(
	[Jdd] ASC,
	[Lote] ASC,
	[Codigo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [llave2] ON [dbo].[Rlogval] 
(
	[Jdd] ASC,
	[Codigo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [llave3] ON [dbo].[Rlogval] 
(
	[Jdd] ASC,
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RlogMP]    Script Date: 10/19/2015 10:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RlogMP](
	[Fecha] [datetime] NOT NULL,
	[Jdatos] [char](15) NOT NULL,
	[Servidor] [char](25) NOT NULL,
	[Base] [char](30) NOT NULL,
	[UserPay] [char](12) NOT NULL,
	[UserWin] [char](30) NOT NULL,
	[Proced] [char](30) NOT NULL,
	[Ruta] [char](50) NOT NULL,
	[Estado] [char](1) NOT NULL,
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Jdd] [int] NOT NULL,
 CONSTRAINT [PK_RlogMP] PRIMARY KEY CLUSTERED 
(
	[Jdd] ASC,
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RlogCliente]    Script Date: 10/19/2015 10:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RlogCliente](
	[IdLog] [int] IDENTITY(1,1) NOT NULL,
	[Tipo] [varchar](60) NOT NULL,
	[Descip] [varchar](max) NOT NULL,
	[Cliente] [varchar](150) NOT NULL,
	[NombreBase] [varchar](150) NOT NULL,
	[Fecha] [datetime] NOT NULL,
 CONSTRAINT [PK_RlogCliente] PRIMARY KEY CLUSTERED 
(
	[IdLog] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RlogAlertas]    Script Date: 10/19/2015 10:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RlogAlertas](
	[Jdd] [int] NOT NULL,
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nro] [int] NOT NULL,
	[Detalle] [varchar](max) NOT NULL,
	[Estado] [char](1) NOT NULL,
	[Usuario] [char](12) NOT NULL,
	[Fecha] [datetime] NOT NULL,
 CONSTRAINT [PK_RlogAlertas] PRIMARY KEY CLUSTERED 
(
	[Jdd] ASC,
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Rlog]    Script Date: 10/19/2015 10:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Rlog](
	[Jdd] [int] NOT NULL,
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Proced] [char](100) NOT NULL,
	[codigoA] [char](50) NOT NULL,
	[Concepto] [char](30) NOT NULL,
	[Deta] [varchar](max) NOT NULL,
	[Fecha] [datetime] NOT NULL,
	[Nucomp] [char](12) NOT NULL,
	[Usuario] [char](12) NOT NULL,
	[Wcompu] [char](25) NOT NULL,
 CONSTRAINT [PK_Rlog] PRIMARY KEY CLUSTERED 
(
	[Jdd] ASC,
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE NONCLUSTERED INDEX [llave1] ON [dbo].[Rlog] 
(
	[Jdd] ASC,
	[codigoA] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [llave2] ON [dbo].[Rlog] 
(
	[Jdd] ASC,
	[Usuario] ASC,
	[Nucomp] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [llave3] ON [dbo].[Rlog] 
(
	[Jdd] ASC,
	[Proced] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO

-- XXV

/****** Object:  Table [dbo].[Rlicencias]    Script Date: 10/19/2015 10:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Rlicencias](
	[Cliente] [char](40) NOT NULL,
	[Id] [int] NOT NULL,
	[IdCliente] [int] NOT NULL,
	[Producto] [int] NOT NULL,
	[Fecha_lic] [datetime] NOT NULL,
	[Dias] [int] NOT NULL,
	[Nlic] [int] NOT NULL,
	[sitcod] [varchar](20) NOT NULL,
	[Licencia] [varchar](50) NOT NULL,
	[envio] [char](1) NOT NULL,
	[mail] [varchar](50) NOT NULL,
	[usuario] [char](12) NOT NULL,
	[wcompu] [varchar](50) NOT NULL,
	[Obs] [varchar](200) NOT NULL,
	[Jdd] [int] NOT NULL,
 CONSTRAINT [PK_Rlicencias] PRIMARY KEY CLUSTERED 
(
	[Jdd] ASC,
	[IdCliente] ASC,
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RJerarq5]    Script Date: 10/19/2015 10:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RJerarq5](
	[IdOrgani] [int] NOT NULL,
	[IdNodo] [int] NOT NULL,
	[EsEmpresa] [int] NOT NULL,
	[Valor] [int] NOT NULL,
	[Padre] [int] NOT NULL,
	[Jdd] [int] NOT NULL,
	[Codigo] [char](12) NOT NULL,
 CONSTRAINT [PK_RJerarq5] PRIMARY KEY CLUSTERED 
(
	[IdOrgani] ASC,
	[IdNodo] ASC,
	[Jdd] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO

-- XXVI

/****** Object:  Table [dbo].[Ritemseg]    Script Date: 10/19/2015 10:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Ritemseg](
	[Tipo] [char](3) NOT NULL,
	[Stipo] [char](4) NOT NULL,
	[Item] [char](15) NOT NULL,
	[Descrip] [char](30) NOT NULL,
	[Acc] [char](1) NOT NULL,
	[Mod] [char](1) NOT NULL,
	[Cre] [char](1) NOT NULL,
	[Eli] [char](1) NOT NULL,
	[Imp] [char](1) NOT NULL,
	[Jdd] [int] NOT NULL,
 CONSTRAINT [PK_Ritemseg] PRIMARY KEY CLUSTERED 
(
	[Jdd] ASC,
	[Item] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RINTDETA]    Script Date: 10/19/2015 10:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RINTDETA](
	[BancoId] [int] NOT NULL,
	[Esquema] [int] NOT NULL,
	[Seccion] [int] NOT NULL,
	[Linea] [numeric](18, 2) NOT NULL,
	[Orden] [numeric](18, 2) NOT NULL,
	[TipoDato] [char](1) NOT NULL,
	[Largo] [int] NOT NULL,
	[Relleno] [char](1) NOT NULL,
	[Alinea] [int] NOT NULL,
	[CampoAsoc] [char](25) NOT NULL,
	[RellDecC0] [bit] NOT NULL,
	[CantDec] [int] NOT NULL,
	[SepDec] [char](1) NOT NULL,
	[SepMiles] [char](1) NOT NULL,
	[DatoFijo] [char](200) NOT NULL,
	[NomColumn] [char](40) NOT NULL,
	[FormatFec] [char](40) NOT NULL,
	[DatosForm] [char](1) NOT NULL,
	[QuiCarCad] [char](40) NOT NULL,
	[StrDesde] [int] NOT NULL,
	[StrHasta] [int] NOT NULL,
	[TablaConv] [int] NOT NULL,
	[EsCodigo] [bit] NOT NULL,
	[TablaCod] [int] NOT NULL,
	[Descrip] [char](60) NOT NULL,
	[ChAMayMin] [int] NOT NULL,
	[ReempCar] [char](40) NOT NULL,
	[TomHasCar] [char](1) NOT NULL,
	[TomIzqDer] [int] NOT NULL,
	[TbConvDef] [char](30) NOT NULL,
	[Jdd] [int] NOT NULL,
	[Espacios] [bit] NOT NULL,
 CONSTRAINT [PK_RINTDETA] PRIMARY KEY CLUSTERED 
(
	[BancoId] ASC,
	[Esquema] ASC,
	[Seccion] ASC,
	[Linea] ASC,
	[Orden] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RINTCONVER]    Script Date: 10/19/2015 10:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RINTCONVER](
	[Esquema] [int] NOT NULL,
	[Cotab] [int] NOT NULL,
	[Codigo] [int] NOT NULL,
	[DescAlter] [char](60) NOT NULL,
	[Jdd] [int] NOT NULL,
 CONSTRAINT [PK_RINTCONVER] PRIMARY KEY CLUSTERED 
(
	[Esquema] ASC,
	[Cotab] ASC,
	[Codigo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RINTBANC]    Script Date: 10/19/2015 10:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RINTBANC](
	[BancoId] [int] NOT NULL,
	[Esquema] [int] NOT NULL,
	[Descrip] [char](40) NOT NULL,
	[CtrCtaRep] [bit] NOT NULL,
	[TipOpcion] [int] NOT NULL,
	[NombArch] [char](25) NOT NULL,
	[TipArchGe] [int] NOT NULL,
	[RegiPagos] [bit] NOT NULL,
	[VerificaCB] [char](1) NOT NULL,
	[NoProcRegi] [char](1) NOT NULL,
	[UnifxRut] [int] NOT NULL,
	[Jdd] [int] NOT NULL,
	[CtrCbuRep] [bit] NOT NULL,
	[TipoOpcion] [int] NOT NULL,
	[TipoArchGe] [int] NOT NULL,
 CONSTRAINT [PK_RINTBANC] PRIMARY KEY CLUSTERED 
(
	[BancoId] ASC,
	[Esquema] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Ringresos]    Script Date: 10/19/2015 10:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Ringresos](
	[Usuario] [char](12) NOT NULL,
	[Tipo] [char](2) NOT NULL,
	[Fecha] [datetime] NOT NULL,
	[Ames] [char](6) NOT NULL,
	[Peri] [char](1) NOT NULL,
	[Deta] [varchar](50) NOT NULL,
	[Nucomp] [char](12) NOT NULL,
	[Jdd] [int] NOT NULL,
 CONSTRAINT [PK_Ringresos] PRIMARY KEY CLUSTERED 
(
	[Jdd] ASC,
	[Usuario] ASC,
	[Nucomp] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE NONCLUSTERED INDEX [llave1] ON [dbo].[Ringresos] 
(
	[Jdd] ASC,
	[Usuario] ASC,
	[Tipo] ASC,
	[Fecha] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ringreapro]    Script Date: 10/19/2015 10:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Ringreapro](
	[Jdd] [int] NOT NULL,
	[Codigo] [char](12) NOT NULL,
	[Funcion] [char](1) NOT NULL,
	[Situ] [char](1) NOT NULL,
	[ItemsTi] [char](1) NOT NULL,
	[IDplant] [varchar](100) NOT NULL,
	[Apro01] [char](12) NOT NULL,
	[Apro02] [char](12) NOT NULL,
	[Apro03] [char](12) NOT NULL,
 CONSTRAINT [PK_Ringreapro] PRIMARY KEY CLUSTERED 
(
	[Jdd] ASC,
	[Codigo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ringlicen]    Script Date: 10/19/2015 10:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ringlicen](
	[Usuario] [char](12) NOT NULL,
	[Codigo] [char](12) NOT NULL,
	[Rut] [char](12) NOT NULL,
	[Cargo] [int] NOT NULL,
	[Dias] [numeric](6, 2) NOT NULL,
	[Fecha_lic] [datetime] NOT NULL,
	[Fecha_ini] [datetime] NOT NULL,
	[Nulic] [int] NOT NULL,
	[Tipo] [int] NOT NULL,
	[Causal] [int] NOT NULL,
	[Escon] [char](1) NOT NULL,
	[Fecha_ico] [datetime] NOT NULL,
	[Medios] [char](1) NOT NULL,
	[Fecha_con] [datetime] NOT NULL,
	[Rutpro] [char](12) NOT NULL,
	[Medico] [char](30) NOT NULL,
	[Especia] [int] NOT NULL,
	[mailJefe] [varchar](60) NOT NULL,
	[Nombre] [char](40) NOT NULL,
	[Lscan] [varbinary](max) NOT NULL,
	[Jdd] [int] NOT NULL,
 CONSTRAINT [PK_ringlicen] PRIMARY KEY CLUSTERED 
(
	[Jdd] ASC,
	[Usuario] ASC,
	[Codigo] ASC,
	[Nulic] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO

-- XXVII

/****** Object:  Table [dbo].[Rimpuesxmes]    Script Date: 10/19/2015 10:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Rimpuesxmes](
	[jdd] [int] NOT NULL,
	[Empresa] [char](3) NOT NULL,
	[Aa] [int] NOT NULL,
	[ene] [money] NOT NULL,
	[feb] [money] NOT NULL,
	[mar] [money] NOT NULL,
	[abr] [money] NOT NULL,
	[may] [money] NOT NULL,
	[jun] [money] NOT NULL,
	[jul] [money] NOT NULL,
	[ago] [money] NOT NULL,
	[sep] [money] NOT NULL,
	[oct] [money] NOT NULL,
	[nov] [money] NOT NULL,
	[dic] [money] NOT NULL,
 CONSTRAINT [PK_Rimpuesxmes] PRIMARY KEY CLUSTERED 
(
	[jdd] ASC,
	[Empresa] ASC,
	[Aa] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO

-- XXVIII

/****** 
Object:  Table [dbo].[RIDIOMAS]
Script Date: 10/19/2015
Description: Re create RIDIOMAS table, in order to add columns: 
			 Jdd.
******/

-- Deleting table first.
IF EXISTS (SELECT 1 
           FROM INFORMATION_SCHEMA.TABLES 
           WHERE TABLE_NAME='RIDIOMAS')
	drop table RIDIOMAS;

/****** Object:  Table [dbo].[RIDIOMAS]    Script Date: 10/19/2015 10:35:10 ******/
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
	[Jdd] [int] NOT NULL,
 CONSTRAINT [PK_RIDIOMAS] PRIMARY KEY CLUSTERED 
(
	[rut] ASC,
	[idioma] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO

-- XXIX

/****** 
Object:  Table [dbo].[RHISLAB]
Script Date: 10/19/2015
Description: Re create RHISLAB table, in order to add columns: 
			 Jdd.
******/

-- Deleting table first.
IF EXISTS (SELECT 1 
           FROM INFORMATION_SCHEMA.TABLES 
           WHERE TABLE_NAME='RHISLAB')
	drop table RHISLAB;

/****** Object:  Table [dbo].[RHISLAB]    Script Date: 10/19/2015 10:35:10 ******/
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
	[Jdd] [int] NOT NULL,
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

-- XXX

/****** 
Object:  Table [dbo].[RHABDES]
Script Date: 10/19/2015
Description: Re create RHABDES table, in order to add columns: 
			 Ndecimon, claiga.
******/

-- Deleting table first.
IF EXISTS (SELECT 1 
           FROM INFORMATION_SCHEMA.TABLES 
           WHERE TABLE_NAME='RHABDES')
	drop table RHABDES;

/****** Object:  Table [dbo].[RHABDES]    Script Date: 10/19/2015 10:35:10 ******/
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
	[Ndecimon] [int] NOT NULL,
	[claiga] [char](4) NOT NULL,
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

-- XXXI

/****** 
Object:  Table [dbo].[RGRUPFA]
Script Date: 10/19/2015
Description: Re create RGRUPFA table, in order to add columns: 
			 AfpNper, Nacion, AsigBPS.
******/

-- Deleting table first.
IF EXISTS (SELECT 1 
           FROM INFORMATION_SCHEMA.TABLES 
           WHERE TABLE_NAME='RGRUPFA')
	drop table RGRUPFA;

/****** Object:  Table [dbo].[RGRUPFA]    Script Date: 10/19/2015 10:35:10 ******/
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
	[AfpNper] [int] NOT NULL,
	[Nacion] [int] NOT NULL,
	[AsigBPS] [char](1) NOT NULL,
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

-- XXXII

/****** Object:  Table [dbo].[rformlaH]    Script Date: 10/19/2015 10:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[rformlaH](
	[Jdd] [int] NOT NULL,
	[Ames] [char](6) NOT NULL,
	[Coform] [char](4) NOT NULL,
	[Descrip] [char](40) NOT NULL,
	[Tipo] [char](1) NOT NULL,
	[Trazo] [char](1) NOT NULL,
	[Formula] [varchar](max) NOT NULL,
	[Obs] [varchar](max) NOT NULL,
 CONSTRAINT [PK_rformlaH] PRIMARY KEY CLUSTERED 
(
	[Jdd] ASC,
	[Coform] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO

-- XXXIII

/****** Object:  Table [dbo].[RFormEsp]    Script Date: 10/19/2015 10:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RFormEsp](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdJdd] [char](15) NOT NULL,
	[Cohade] [char](6) NOT NULL,
	[Coform] [char](4) NOT NULL,
 CONSTRAINT [PK_RFormEsp] PRIMARY KEY CLUSTERED 
(
	[IdJdd] ASC,
	[Cohade] ASC,
	[Coform] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO

-- XXXIV

/****** Object:  Table [dbo].[rfactores]    Script Date: 10/19/2015 10:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[rfactores](
	[ames] [char](6) NOT NULL,
	[factor] [money] NOT NULL,
	[Jdd] [int] NOT NULL,
 CONSTRAINT [PK_rfactores] PRIMARY KEY CLUSTERED 
(
	[Jdd] ASC,
	[ames] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO

-- XXXV

/****** 
Object:  Table [dbo].[REVENTOS]
Script Date: 10/19/2015
Description: Re create REVENTOS table, in order to add columns: 
			 Codigo.
******/

-- Deleting table first.
IF EXISTS (SELECT 1 
           FROM INFORMATION_SCHEMA.TABLES 
           WHERE TABLE_NAME='REVENTOS')
	drop table REVENTOS;

/****** Object:  Table [dbo].[REVENTOS]    Script Date: 10/19/2015 10:35:10 ******/
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
	[Codigo] [char](12) NOT NULL,
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

--- XXXVI

/****** 
Object:  Table [dbo].[RESUMEN]
Script Date: 10/19/2015
Description: Re create RESUMEN table, in order to add columns: 
			 Mondep, BancoPag, Fecha_eje, user_eje, efecDep, kper, kfal.
******/

-- Deleting table first.
IF EXISTS (SELECT 1 
           FROM INFORMATION_SCHEMA.TABLES 
           WHERE TABLE_NAME='RESUMEN')
	drop table RESUMEN;

/****** Object:  Table [dbo].[RESUMEN]    Script Date: 10/19/2015 10:35:10 ******/
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
	[Mondep] [money] NOT NULL,
	[BancoPag] [int] NOT NULL,
	[Fecha_eje] [datetime] NOT NULL,
	[user_eje] [char](12) NOT NULL,
	[efecDep] [char](1) NOT NULL,
	[kper] [numeric](4, 1) NOT NULL,
	[kfal] [numeric](4, 1) NOT NULL,
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

-- XXXVII

/****** 
Object:  Table [dbo].[RESQUEMA]
Script Date: 10/19/2015
Description: Re create RESQUEMA table, in order to add columns: 
			 Separador, Cdesde, Chasta, ReemVacio, Trimear, Separdeci.
******/

-- Deleting table first.
IF EXISTS (SELECT 1 
           FROM INFORMATION_SCHEMA.TABLES 
           WHERE TABLE_NAME='RESQUEMA')
	drop table RESQUEMA;

/****** Object:  Table [dbo].[RESQUEMA]    Script Date: 10/19/2015 10:35:10 ******/
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
	[Separador] [char](1) NOT NULL,
	[Cdesde] [int] NOT NULL,
	[Chasta] [int] NOT NULL,
	[ReemVacio] [char](1) NOT NULL,
	[Trimear] [char](1) NOT NULL,
	[Separdeci] [char](1) NOT NULL,
 CONSTRAINT [PK_RESQUEMA] PRIMARY KEY CLUSTERED 
(
	[Esquema] ASC,
	[Parte] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO

-- XXXVIII

/****** Object:  Table [dbo].[Rerrvalida]    Script Date: 10/19/2015 10:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Rerrvalida](
	[IDerror] [int] IDENTITY(1,1) NOT NULL,
	[Fecha_val] [datetime] NOT NULL,
	[Codigo] [char](12) NOT NULL,
	[Nombre] [char](40) NOT NULL,
	[Origen] [char](16) NOT NULL,
	[Descrip] [char](254) NOT NULL,
	[Fecha_pro] [datetime] NOT NULL,
	[Jdd] [int] NOT NULL,
 CONSTRAINT [PK_Rerrvalida] PRIMARY KEY CLUSTERED 
(
	[IDerror] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ReportesAdp]    Script Date: 10/19/2015 10:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ReportesAdp](
	[IDReporte] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [char](250) NOT NULL,
	[LocalName] [char](100) NOT NULL,
	[Tipo] [char](3) NOT NULL,
	[Ames] [char](6) NOT NULL,
	[Archivo] [image] NOT NULL,
	[Usu_cre] [char](12) NOT NULL,
	[Fecha_cre] [datetime] NOT NULL,
	[Usu_envio] [char](12) NOT NULL,
	[Fecha_env] [datetime] NOT NULL,
	[Jdd] [int] NOT NULL,
 CONSTRAINT [PK_ReportesAdp] PRIMARY KEY CLUSTERED 
(
	[IDReporte] ASC,
	[Jdd] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO

-- XXXIX

/****** 
Object:  Table [dbo].[REMPRESA]
Script Date: 10/19/2015
Description: Re create REMPRESA table, in order to add columns: 
			 ApvcPL, ApvcPR, Nroresrd.
******/

-- Deleting table first.
IF EXISTS (SELECT 1 
           FROM INFORMATION_SCHEMA.TABLES 
           WHERE TABLE_NAME='REMPRESA')
	drop table REMPRESA;

/****** Object:  Table [dbo].[REMPRESA]    Script Date: 10/19/2015 10:35:10 ******/
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
	[ApvcPL] [money] NOT NULL,
	[ApvcPR] [money] NOT NULL,
	[Nroresrd] [char](12) NOT NULL,
 CONSTRAINT [PK_REMPRESA] PRIMARY KEY CLUSTERED 
(
	[Empresa] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO

--- 40

/****** 
Object:  Table [dbo].[REMPLESH]
Script Date: 10/19/2015
Description: Re create REMPLESH table, in order to add columns: 
			 PingSt, Srsicoss, Ccsicoss.
******/

-- Deleting table first.
IF EXISTS (SELECT 1 
           FROM INFORMATION_SCHEMA.TABLES 
           WHERE TABLE_NAME='REMPLESH')
	drop table REMPLESH;

/****** Object:  Table [dbo].[REMPLESH]    Script Date: 10/19/2015 10:35:10 ******/
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
	[Sdato] [char](30) NOT NULL,
	[PingSt] [char](1) NOT NULL,
	[Srsicoss] [int] NOT NULL,
	[Ccsicoss] [int] NOT NULL
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

-- 41

/****** 
Object:  Table [dbo].[REMPLES]
Script Date: 10/19/2015
Description: Re create REMPLES table, in order to add columns: 
			 PingSt, Cargo_est, Srsicoss, Ccsicoss.
******/

-- Deleting table first.
IF EXISTS (SELECT 1 
           FROM INFORMATION_SCHEMA.TABLES 
           WHERE TABLE_NAME='REMPLES')
	drop table REMPLES;

/****** Object:  Table [dbo].[REMPLES]    Script Date: 10/19/2015 10:35:10 ******/
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
	[PingSt] [char](1) NOT NULL,
	[Cargo_est] [int] NOT NULL,
	[Srsicoss] [int] NOT NULL,
	[Ccsicoss] [int] NOT NULL,
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

-- 42

/****** Object:  Table [dbo].[remplech]    Script Date: 10/19/2015 10:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[remplech](
	[Codigo] [char](12) NOT NULL,
	[Ames] [char](6) NOT NULL,
	[Codcam] [int] NOT NULL,
	[ValorN] [money] NOT NULL,
	[ValorF] [datetime] NOT NULL,
	[ValorC] [char](30) NOT NULL,
	[ValorM] [varchar](2000) NOT NULL,
	[Jdd] [int] NOT NULL,
 CONSTRAINT [PK_remplech] PRIMARY KEY CLUSTERED 
(
	[Jdd] ASC,
	[Codigo] ASC,
	[Ames] ASC,
	[Codcam] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO

-- 43

/****** 
Object:  Table [dbo].[REMPLAN]
Script Date: 10/19/2015
Description: Re create REMPLAN table, in order to add columns: 
			 Detalle.
******/

-- Deleting table first.
IF EXISTS (SELECT 1 
           FROM INFORMATION_SCHEMA.TABLES 
           WHERE TABLE_NAME='REMPLAN')
	drop table REMPLAN;

/****** Object:  Table [dbo].[REMPLAN]    Script Date: 10/19/2015 10:35:10 ******/
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
	[Detalle] [varchar](500) NOT NULL,
 CONSTRAINT [PK_REMPLAN] PRIMARY KEY CLUSTERED 
(
	[Codigo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO

-- 44

/****** Object:  Table [dbo].[Rdonatario]    Script Date: 10/19/2015 10:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Rdonatario](
	[Iddonat] [int] IDENTITY(1,1) NOT NULL,
	[Cuit] [char](12) NOT NULL,
	[Denominac] [char](25) NOT NULL,
	[Tipodom] [int] NOT NULL,
	[Calle] [char](30) NOT NULL,
	[Nropuerta] [char](6) NOT NULL,
	[Piso] [char](5) NOT NULL,
	[Depto] [char](5) NOT NULL,
	[Sector] [char](5) NOT NULL,
	[Torre] [char](5) NOT NULL,
	[Manzana] [char](5) NOT NULL,
	[Codpostal] [char](8) NOT NULL,
	[Localidad] [char](30) NOT NULL,
	[Codprov] [int] NOT NULL,
	[Jdd] [int] NOT NULL,
	[Cbu] [char](22) NOT NULL,
 CONSTRAINT [PK_Rdonatario] PRIMARY KEY CLUSTERED 
(
	[Jdd] ASC,
	[Iddonat] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO

-- 45

/****** Object:  Table [dbo].[Rdocfirma]    Script Date: 10/19/2015 10:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Rdocfirma](
	[Jdd] [int] NOT NULL,
	[Codigo] [char](40) NOT NULL,
	[Nombredoc] [char](40) NOT NULL,
	[Documento] [varbinary](max) NOT NULL,
	[Tipodoc] [int] NOT NULL,
	[Descrip] [char](330) NOT NULL,
	[Usuar_car] [char](12) NOT NULL,
	[Fecha_car] [datetime] NOT NULL,
	[Rutempl] [char](12) NOT NULL,
	[Rutrepr] [char](12) NOT NULL,
	[IDdoc] [int] IDENTITY(1,1) NOT NULL,
	[Firmoempl] [char](1) NOT NULL,
	[Firmorepr] [char](1) NOT NULL,
	[Auditempl] [char](30) NOT NULL,
	[Auditrepr] [char](30) NOT NULL,
 CONSTRAINT [PK_Rdocfirma] PRIMARY KEY CLUSTERED 
(
	[Jdd] ASC,
	[IDdoc] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE NONCLUSTERED INDEX [llave1] ON [dbo].[Rdocfirma] 
(
	[Jdd] ASC,
	[Codigo] ASC,
	[Tipodoc] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rdocempre]    Script Date: 10/19/2015 10:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Rdocempre](
	[Jdd] [int] NOT NULL,
	[Empresa] [char](3) NOT NULL,
	[Nombredoc] [char](40) NOT NULL,
	[Documento] [varbinary](max) NOT NULL,
	[Tipodoc] [int] NOT NULL,
	[Descrip] [char](20) NOT NULL,
	[Usuar_car] [char](12) NOT NULL,
	[Fecha_car] [datetime] NOT NULL,
	[IDdoc] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_Rdocempre] PRIMARY KEY CLUSTERED 
(
	[Jdd] ASC,
	[IDdoc] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE NONCLUSTERED INDEX [llave1] ON [dbo].[Rdocempre] 
(
	[Jdd] ASC,
	[Empresa] ASC,
	[Tipodoc] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rdocemple]    Script Date: 10/19/2015 10:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Rdocemple](
	[Jdd] [int] NOT NULL,
	[Codigo] [char](12) NOT NULL,
	[Nombredoc] [char](40) NOT NULL,
	[Documento] [varbinary](max) NOT NULL,
	[Tipodoc] [int] NOT NULL,
	[Descrip] [char](330) NOT NULL,
	[Usuar_car] [char](12) NOT NULL,
	[Fecha_car] [datetime] NOT NULL,
	[IDdoc] [int] IDENTITY(1,1) NOT NULL,
	[mimetype] [varchar](100) NOT NULL,
 CONSTRAINT [PK_Rdocemple] PRIMARY KEY CLUSTERED 
(
	[Jdd] ASC,
	[IDdoc] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE NONCLUSTERED INDEX [llave1] ON [dbo].[Rdocemple] 
(
	[Jdd] ASC,
	[Codigo] ASC,
	[Tipodoc] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO

-- 46

/****** Object:  Table [dbo].[RDetEsquema]    Script Date: 10/19/2015 10:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RDetEsquema](
	[IdDetalle] [int] IDENTITY(1,1) NOT NULL,
	[IdEsquema] [int] NOT NULL,
	[TipDet] [char](1) NOT NULL,
	[Fila] [int] NOT NULL,
	[Descr] [varchar](50) NOT NULL,
	[TipoDato] [varchar](1) NOT NULL,
	[Largo] [int] NOT NULL,
	[Alineacion] [int] NOT NULL,
	[Relleno] [varchar](1) NOT NULL,
	[Desde] [varchar](3) NOT NULL,
	[Hasta] [varchar](3) NOT NULL,
	[MayMin] [int] NOT NULL,
	[TipValor] [int] NOT NULL,
	[Valor] [varchar](100) NOT NULL,
	[Tabla] [varchar](50) NOT NULL,
	[FormatDate] [varchar](50) NOT NULL,
	[FormatHour] [varchar](50) NOT NULL,
	[EsValorAbs] [int] NOT NULL,
	[Redondeo] [int] NOT NULL,
	[CantDeci] [int] NOT NULL,
	[SepMiles] [int] NOT NULL,
	[SepDeci] [int] NOT NULL,
	[EsDesdePan] [int] NOT NULL,
	[Item] [char](6) NOT NULL,
	[TipoMonto] [int] NOT NULL,
	[Orden] [int] NOT NULL,
 CONSTRAINT [PK_RDetEsquema] PRIMARY KEY CLUSTERED 
(
	[IdDetalle] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO

-- 47

/****** Object:  Table [dbo].[RCubos]    Script Date: 10/19/2015 10:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RCubos](
	[IDcubo] [char](40) NOT NULL,
	[Descrip] [char](80) NOT NULL,
	[Clasif] [int] NOT NULL,
	[Esquema] [varbinary](max) NOT NULL,
	[SQL] [varchar](max) NOT NULL,
	[Jdd] [int] NOT NULL,
 CONSTRAINT [PK_RCubos] PRIMARY KEY CLUSTERED 
(
	[Jdd] ASC,
	[IDcubo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO

-- 48

/****** Object:  Table [dbo].[Rcontenidos]    Script Date: 10/19/2015 10:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Rcontenidos](
	[jdd] [int] NOT NULL,
	[Numero] [int] IDENTITY(1,1) NOT NULL,
	[fecha_cre] [datetime] NOT NULL,
	[Tipo] [char](1) NOT NULL,
	[fecha_mod] [datetime] NOT NULL,
	[fecha_ven] [datetime] NOT NULL,
	[Clase] [char](1) NOT NULL,
	[Usermod] [char](12) NOT NULL,
	[Titulo] [varchar](100) NOT NULL,
	[Resumen] [varchar](250) NOT NULL,
	[Archivo] [varchar](100) NOT NULL,
	[Detalle] [varchar](max) NOT NULL,
	[Formato] [char](1) NOT NULL,
	[codigo] [char](12) NOT NULL,
 CONSTRAINT [PK_Rcontenidos] PRIMARY KEY CLUSTERED 
(
	[jdd] ASC,
	[Numero] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO

-- 49

/****** 
Object:  Table [dbo].[RCONGSEM]
Script Date: 10/19/2015
Description: Re create RCONGSEM table, in order to add columns: 
			 Jdd.
******/

-- Deleting table first.
IF EXISTS (SELECT 1 
           FROM INFORMATION_SCHEMA.TABLES 
           WHERE TABLE_NAME='RCONGSEM')
	drop table RCONGSEM;

/****** Object:  Table [dbo].[RCONGSEM]    Script Date: 10/19/2015 10:35:10 ******/
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
	[Jdd] [int] NOT NULL,
 CONSTRAINT [PK_RCONGSEM] PRIMARY KEY CLUSTERED 
(
	[RUT] ASC,
	[fecha] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO

-- 50

/****** Object:  Table [dbo].[RConfigTransf]    Script Date: 10/19/2015 10:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RConfigTransf](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nom_conf] [char](15) NOT NULL,
	[periodo] [char](1) NOT NULL,
	[banco] [int] NOT NULL,
	[fec_pago] [datetime] NOT NULL,
	[item] [char](6) NOT NULL,
	[nro_cheq] [char](30) NOT NULL,
	[condicion] [char](40) NOT NULL,
	[nom_archi] [char](30) NOT NULL,
	[opciones] [char](6) NOT NULL,
	[otros] [char](20) NOT NULL,
	[hbancos] [int] NOT NULL,
	[hfpagos] [int] NOT NULL,
	[Jdd] [int] NOT NULL,
 CONSTRAINT [PK_RConfigTransf] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RConfigCen]    Script Date: 10/19/2015 10:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RConfigCen](
	[nom_conf] [char](40) NOT NULL,
	[plan_cta] [int] NOT NULL,
	[cond_emp] [char](40) NOT NULL,
	[periodos] [char](20) NOT NULL,
	[opciones] [char](20) NOT NULL,
	[habilita] [bit] NOT NULL,
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Jdd] [int] NOT NULL,
 CONSTRAINT [PK_RConfigCen] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RConfEsquemas]    Script Date: 10/19/2015 10:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RConfEsquemas](
	[IdEsquema] [int] IDENTITY(1,1) NOT NULL,
	[Descr] [varchar](50) NOT NULL,
	[TipEsq] [char](1) NOT NULL,
	[TipArch] [varchar](4) NOT NULL,
	[NArchivo] [varchar](40) NOT NULL,
	[FCreacion] [datetime] NOT NULL,
	[BancoAsoc] [char](10) NOT NULL,
	[Jdd] [int] NOT NULL,
 CONSTRAINT [PK_RConfEsquemas] PRIMARY KEY CLUSTERED 
(
	[IdEsquema] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO

-- 51

/****** Object:  Table [dbo].[Rcomisii]    Script Date: 10/19/2015 10:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Rcomisii](
	[Codigo] [char](12) NOT NULL,
	[Ames] [char](6) NOT NULL,
	[Peri] [char](1) NOT NULL,
	[Cohade] [char](6) NOT NULL,
	[Numero] [int] NOT NULL,
	[M_comisi] [money] NOT NULL,
	[Descrip] [varchar](2000) NOT NULL,
	[JDD] [int] NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO

-- 52

/****** Object:  Table [dbo].[RCLIPROD]    Script Date: 10/19/2015 10:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RCLIPROD](
	[IDprodcli] [int] IDENTITY(1,1) NOT NULL,
	[IDproducto] [int] NOT NULL,
	[IDcliente] [int] NOT NULL,
	[Cantidad] [int] NOT NULL,
	[Activo] [char](1) NOT NULL,
	[UsuarAlta] [char](12) NOT NULL,
	[FechaAlta] [datetime] NOT NULL,
	[UsuarUltM] [char](12) NOT NULL,
	[FechaUltM] [datetime] NOT NULL,
	[Desde] [datetime] NOT NULL,
	[Hasta] [datetime] NOT NULL,
	[Observ] [varchar](100) NOT NULL,
	[Fpago] [int] NOT NULL,
	[Jdd] [int] NOT NULL,
 CONSTRAINT [PK_RCLIPROD] PRIMARY KEY CLUSTERED 
(
	[IDprodcli] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RClientes]    Script Date: 10/19/2015 10:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RClientes](
	[Cliente] [char](15) NOT NULL,
	[Rut] [char](12) NOT NULL,
	[Nombre] [char](40) NOT NULL,
	[Estado] [char](1) NOT NULL,
	[Direccion] [char](70) NOT NULL,
	[Tipo] [char](1) NOT NULL,
	[Origen] [int] NOT NULL,
	[Rubro] [int] NOT NULL,
	[nrotra] [int] NOT NULL,
	[Fecha_ini] [datetime] NOT NULL,
	[Jdd] [int] NOT NULL,
	[IDCliente] [int] IDENTITY(1,1) NOT NULL,
	[IDPadre] [int] NOT NULL,
	[NomFan] [varchar](100) NOT NULL,
	[SistCont] [varchar](100) NOT NULL,
	[CodSII] [varchar](150) NOT NULL,
	[Fono] [varchar](50) NOT NULL,
	[HsAdic] [int] NOT NULL,
	[NombreR] [varchar](100) NOT NULL,
	[RutR] [char](12) NOT NULL,
	[MailR] [varchar](50) NOT NULL,
	[Fpago] [int] NOT NULL,
	[FuncionC] [varchar](100) NOT NULL,
	[PassR] [varchar](max) NOT NULL,
	[UsuarioA] [char](12) NOT NULL,
	[FechaA] [datetime] NOT NULL,
	[Grupo] [int] NOT NULL,
 CONSTRAINT [PK_RClientes] PRIMARY KEY CLUSTERED 
(
	[IDCliente] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RclaremH]    Script Date: 10/19/2015 10:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RclaremH](
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
	[Formula] [char](40) NOT NULL,
	[Coinst] [int] NOT NULL,
	[Pone] [char](1) NOT NULL,
	[Grupo] [int] NOT NULL,
	[Condi] [char](120) NOT NULL,
	[Simes] [char](1) NOT NULL,
	[QuePeri] [char](7) NOT NULL,
	[ndecimon] [int] NOT NULL,
	[Jdd] [int] NOT NULL,
	[Ames] [char](6) NOT NULL,
 CONSTRAINT [PK_RclaremH] PRIMARY KEY CLUSTERED 
(
	[Jdd] ASC,
	[Ames] ASC,
	[Codigo] ASC,
	[Cohade] ASC,
	[Periodo] ASC,
	[Nro] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE NONCLUSTERED INDEX [llave1] ON [dbo].[RclaremH] 
(
	[Jdd] ASC,
	[Ames] ASC,
	[Codigo] ASC,
	[Tipo] ASC,
	[Orden] ASC,
	[Cohade] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO

-- 53

/****** 
Object:  Table [dbo].[RCLAREM]
Script Date: 10/19/2015
Description: Re create RCLAREM table, in order to add columns: 
			 Ndecimon.
******/

-- Deleting table first.
IF EXISTS (SELECT 1 
           FROM INFORMATION_SCHEMA.TABLES 
           WHERE TABLE_NAME='RCLAREM')
	drop table RCLAREM;

/****** Object:  Table [dbo].[RCLAREM]    Script Date: 10/19/2015 10:35:10 ******/
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
	[Ndecimon] [int] NOT NULL,
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

-- 54

/****** Object:  Table [dbo].[RclaencH]    Script Date: 10/19/2015 10:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RclaencH](
	[Codigo] [char](12) NOT NULL,
	[Descrip] [char](30) NOT NULL,
	[Codemp] [char](12) NOT NULL,
	[Funda] [varchar](max) NOT NULL,
	[Jdd] [int] NOT NULL,
	[Ames] [char](6) NOT NULL,
 CONSTRAINT [PK_RclaencH] PRIMARY KEY CLUSTERED 
(
	[Jdd] ASC,
	[Ames] ASC,
	[Codigo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO

-- 55

/****** Object:  Table [dbo].[Rcertis]    Script Date: 10/19/2015 10:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Rcertis](
	[jdd] [int] NOT NULL,
	[Rut] [char](12) NOT NULL,
	[Empresa] [char](3) NOT NULL,
	[Ames] [char](6) NOT NULL,
	[Nombre] [char](40) NOT NULL,
	[RemBru] [money] NOT NULL,
	[Remimp] [money] NOT NULL,
	[Cotiza] [money] NOT NULL,
	[Impues] [money] NOT NULL,
	[Ppm] [money] NOT NULL,
	[impf29] [money] NOT NULL,
	[Impues14] [money] NOT NULL,
	[impues14A] [money] NOT NULL,
	[exento] [money] NOT NULL,
	[zonafa] [money] NOT NULL,
 CONSTRAINT [PK_Rcertis] PRIMARY KEY CLUSTERED 
(
	[jdd] ASC,
	[Empresa] ASC,
	[Rut] ASC,
	[Ames] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO

-- 56

/****** Object:  Table [dbo].[Rbloq]    Script Date: 10/19/2015 10:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Rbloq](
	[codigo] [char](12) NOT NULL,
	[id] [char](254) NOT NULL,
	[id_cola] [char](254) NOT NULL,
	[Fecha_exp] [datetime] NOT NULL,
	[Jdd] [int] NOT NULL,
 CONSTRAINT [PK_Rbloq] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE NONCLUSTERED INDEX [llave1] ON [dbo].[Rbloq] 
(
	[id_cola] ASC,
	[Fecha_exp] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO

-- 57

/****** 
Object:  Table [dbo].[RBECAS]
Script Date: 10/19/2015
Description: Re create RBECAS table, in order to add columns: 
			 Jdd.
******/

-- Deleting table first.
IF EXISTS (SELECT 1 
           FROM INFORMATION_SCHEMA.TABLES 
           WHERE TABLE_NAME='RBECAS')
	drop table RBECAS;

/****** Object:  Table [dbo].[RBECAS]    Script Date: 10/19/2015 10:35:10 ******/
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
	[Jdd] [int] NOT NULL,
 CONSTRAINT [PK_RBECAS] PRIMARY KEY CLUSTERED 
(
	[RUT] ASC,
	[fecha] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO

-- 58

/****** Object:  Table [dbo].[rbatchvisto]    Script Date: 10/19/2015 10:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[rbatchvisto](
	[Idbatch] [int] NOT NULL,
	[Extension] [char](4) NOT NULL,
	[Descarga] [int] NOT NULL,
	[Jdd] [int] NOT NULL,
 CONSTRAINT [PK_rbatchvisto] PRIMARY KEY CLUSTERED 
(
	[Idbatch] ASC,
	[Descarga] ASC,
	[Extension] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[rbatchst]    Script Date: 10/19/2015 10:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[rbatchst](
	[Idbatch] [int] NOT NULL,
	[Fecha] [datetime] NOT NULL,
	[Estado] [char](1) NOT NULL,
	[Jdd] [int] NOT NULL,
 CONSTRAINT [PK_rbatchst] PRIMARY KEY CLUSTERED 
(
	[Jdd] ASC,
	[Idbatch] ASC,
	[Estado] ASC,
	[Fecha] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[rbatchqf]    Script Date: 10/19/2015 10:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[rbatchqf](
	[Idbatch] [int] NOT NULL,
	[Codigo] [char](12) NOT NULL,
	[Jdd] [int] NOT NULL,
 CONSTRAINT [PK_rbatchqf] PRIMARY KEY CLUSTERED 
(
	[Jdd] ASC,
	[Idbatch] ASC,
	[Codigo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[rbatchliq]    Script Date: 10/19/2015 10:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[rbatchliq](
	[Idbatch] [int] NOT NULL,
	[Codigo] [char](12) NOT NULL,
	[Tipo] [int] NOT NULL,
	[Orden] [int] NOT NULL,
	[Cohade] [char](6) NOT NULL,
	[Descitm] [char](72) NOT NULL,
	[Monto] [money] NOT NULL,
	[MontoO] [money] NOT NULL,
	[MontoA] [money] NOT NULL,
	[Cencos] [int] NOT NULL,
	[Coprev] [int] NOT NULL,
	[Origen] [char](1) NOT NULL,
	[Cmapa] [char](14) NOT NULL,
	[Cod_reg] [int] NOT NULL,
	[Empresa] [char](3) NOT NULL,
	[Dato] [char](10) NOT NULL,
	[Codpres] [int] NOT NULL,
	[PerImp] [int] NOT NULL,
	[Inform] [char](1) NOT NULL,
	[Nro] [int] NOT NULL,
	[Vo] [money] NOT NULL,
	[Nombre] [char](60) NOT NULL,
	[Feliq] [datetime] NOT NULL,
	[Rut] [char](12) NOT NULL,
	[Cargo] [varchar](50) NOT NULL,
	[Fecha_ing] [datetime] NOT NULL,
	[erut] [char](12) NOT NULL,
	[Coform] [char](4) NOT NULL,
	[hab] [money] NOT NULL,
	[des] [money] NOT NULL,
	[otr] [money] NOT NULL,
	[Dias] [numeric](4, 1) NOT NULL,
	[d15] [char](1) NOT NULL,
	[vl] [bit] NOT NULL,
	[tktdlo] [int] NOT NULL,
	[Pone] [char](1) NOT NULL,
	[Jdd] [int] NOT NULL,
	[dias3pd] [numeric](4, 1) NOT NULL,
	[licmd1] [numeric](2, 0) NOT NULL,
	[licmd2] [numeric](2, 0) NOT NULL,
	[licmd3] [numeric](2, 0) NOT NULL,
	[licmd4] [numeric](2, 0) NOT NULL,
	[licmd5] [numeric](2, 0) NOT NULL,
	[licmd6] [numeric](2, 0) NOT NULL,
 CONSTRAINT [PK_rbatchliq] PRIMARY KEY CLUSTERED 
(
	[Idbatch] ASC,
	[Nro] ASC,
	[Codigo] ASC,
	[Cohade] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[rbatchfiniq]    Script Date: 10/19/2015 10:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[rbatchfiniq](
	[Idbatch] [int] NOT NULL,
	[Params] [varchar](2000) NOT NULL,
	[Codigo] [char](12) NOT NULL,
	[ParamsRes] [varchar](2000) NOT NULL,
	[Jdd] [int] NOT NULL,
 CONSTRAINT [PK_rbatchfiniq] PRIMARY KEY CLUSTERED 
(
	[Codigo] ASC,
	[Idbatch] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[rbatchdesc]    Script Date: 10/19/2015 10:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[rbatchdesc](
	[Nombre] [varchar](20) NOT NULL,
	[Extension] [char](4) NOT NULL,
	[Descrip] [varchar](50) NOT NULL,
	[Jdd] [int] NOT NULL,
 CONSTRAINT [PK_rbatchdesc] PRIMARY KEY CLUSTERED 
(
	[Nombre] ASC,
	[Descrip] ASC,
	[Extension] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[rbatch]    Script Date: 10/19/2015 10:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[rbatch](
	[Idbatch] [int] IDENTITY(1,1) NOT NULL,
	[Estado] [char](1) NOT NULL,
	[JuegoDatos] [char](16) NOT NULL,
	[Usuario] [char](12) NOT NULL,
	[Path] [varchar](100) NOT NULL,
	[Llamador] [varchar](16) NOT NULL,
	[Llamado] [varchar](16) NOT NULL,
	[Fecha] [datetime] NOT NULL,
	[Params] [varchar](max) NOT NULL,
	[Jdd] [int] NOT NULL,
	[IdLauncher] [varchar](50) NOT NULL,
	[ProcessId] [int] NOT NULL,
	[JobId] [int] NOT NULL,
 CONSTRAINT [PK_rbatch] PRIMARY KEY CLUSTERED 
(
	[Jdd] ASC,
	[Idbatch] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Rbases]    Script Date: 10/19/2015 10:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Rbases](
	[Jdd] [int] NOT NULL,
	[Cliente] [char](15) NOT NULL,
	[idJdd] [char](15) NOT NULL,
	[IdCliente] [int] NOT NULL,
	[Descrip] [char](50) NOT NULL,
	[stringco] [varchar](max) NOT NULL,
	[Pay] [char](1) NOT NULL,
	[Eva] [char](1) NOT NULL,
	[Sel] [char](1) NOT NULL,
	[Dcg] [char](1) NOT NULL,
	[Cap] [char](1) NOT NULL,
	[Cas] [char](1) NOT NULL,
	[Bie] [char](1) NOT NULL,
	[Ben] [char](1) NOT NULL,
	[Mad] [char](1) NOT NULL,
	[cola] [char](250) NOT NULL,
	[grupo_out] [int] NOT NULL,
	[Quincena] [char](1) NOT NULL,
	[Alarma] [char](1) NOT NULL,
	[IdAdp] [char](12) NOT NULL,
	[Estado] [char](1) NOT NULL,
	[BaseE] [char](80) NOT NULL,
	[ServerE] [char](80) NOT NULL,
	[ODBC] [char](16) NOT NULL,
	[Streamline] [char](1) NOT NULL,
	[BatchMode] [char](1) NOT NULL,
	[BatchPath] [char](100) NOT NULL,
 CONSTRAINT [PK_Rbases] PRIMARY KEY CLUSTERED 
(
	[Jdd] ASC,
	[idJdd] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE NONCLUSTERED INDEX [llave1] ON [dbo].[Rbases] 
(
	[Jdd] ASC,
	[Cliente] ASC,
	[idJdd] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO

-- 59

/****** 
Object:  Table [dbo].[RAUSENT]
Script Date: 10/19/2015
Description: Re create RAUSENT table, in order to add columns: 
			 Lscan.
******/

-- Deleting table first.
IF EXISTS (SELECT 1 
           FROM INFORMATION_SCHEMA.TABLES 
           WHERE TABLE_NAME='RAUSENT')
	drop table RAUSENT;

/****** Object:  Table [dbo].[RAUSENT]    Script Date: 10/19/2015 10:35:10 ******/
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
	[Lscan] [varbinary](max) NOT NULL,
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

-- 60

/****** Object:  Table [dbo].[RAlertasEnvio]    Script Date: 10/19/2015 10:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RAlertasEnvio](
	[Nro] [int] IDENTITY(1,1) NOT NULL,
	[Id] [int] NOT NULL,
	[FechaEnvio] [datetime] NOT NULL,
	[Estado] [char](255) NOT NULL,
	[Usuario1] [char](12) NOT NULL,
	[Visto] [char](1) NOT NULL,
	[Usuario2] [char](12) NOT NULL,
	[Usuario3] [char](12) NOT NULL,
	[Texto] [varchar](max) NOT NULL,
 CONSTRAINT [PK_RAlertasEnvio] PRIMARY KEY CLUSTERED 
(
	[Id] ASC,
	[FechaEnvio] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RALERTAS5]    Script Date: 10/19/2015 10:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RALERTAS5](
	[Id] [int] NOT NULL,
	[Ubica] [char](1) NOT NULL,
	[Descrip] [char](40) NOT NULL,
	[Proce] [char](15) NOT NULL,
	[Estado] [char](1) NOT NULL,
	[Params] [char](100) NOT NULL,
	[Explica] [char](2000) NOT NULL,
	[Jdd] [int] NOT NULL,
	[Usuario1] [char](12) NOT NULL,
	[Campo] [char](20) NOT NULL,
	[Dias] [int] NOT NULL,
	[Hora] [int] NOT NULL,
	[Template] [char](20) NOT NULL,
	[FechaEnvio] [datetime] NOT NULL,
	[EnviaSMS] [char](1) NOT NULL,
	[EnviaMail] [char](1) NOT NULL,
	[Usuario2] [char](12) NOT NULL,
	[Usuario3] [char](12) NOT NULL,
 CONSTRAINT [PK_RALERTAS5] PRIMARY KEY CLUSTERED 
(
	[Jdd] ASC,
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO

-- 61

/****** 
Object:  Table [dbo].[RALERTAS]
Script Date: 10/19/2015
Description: Re create RALERTAS table, in order to add columns: 
			 Usuario1, Campo, Dias, Hora, Template, FechaEnvio, 
			 EnviaSMS, EnviaMail, Usuario2, Usuario3.
******/

-- Deleting table first.
IF EXISTS (SELECT 1 
           FROM INFORMATION_SCHEMA.TABLES 
           WHERE TABLE_NAME='RALERTAS')
	drop table RALERTAS;

/****** Object:  Table [dbo].[RALERTAS]    Script Date: 10/19/2015 10:35:10 ******/
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
	[Usuario1] [char](12) NOT NULL,
	[Campo] [varchar](20) NOT NULL,
	[Dias] [int] NOT NULL,
	[Hora] [int] NOT NULL,
	[Template] [char](20) NOT NULL,
	[FechaEnvio] [datetime] NOT NULL,
	[EnviaSMS] [char](1) NOT NULL,
	[EnviaMail] [char](1) NOT NULL,
	[Usuario2] [char](12) NOT NULL,
	[Usuario3] [char](12) NOT NULL,
 CONSTRAINT [PK_RALERTAS] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO

-- 62
-- Stored Procedures.

/****** Object:  StoredProcedure [dbo].[PonerSemaforoSQL]    Script Date: 10/19/2015 10:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PonerSemaforoSQL] @sema Char(15), 
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

-- 63

/****** Object:  StoredProcedure [dbo].[sp_ww_NewId]    Script Date: 10/19/2015 10:35:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_ww_NewId] @PTabla Char(15), @pnID  Int output 
 AS 
 If Not Exists(Select Tabla From TBRHUIDS Where Tabla = @PTabla) 
   Begin  
     Insert Into TBRHUIDS(Tabla, LastID)  Values (@PTabla, 1) 
     Select @pnID = 1  
   End 
 Else  
   Update TBRHUIDS Set LastID = LastID + 1, @pnID = LastID + 1 Where Tabla = @PTabla
GO

-- 64

/****** Object:  StoredProcedure [dbo].[LiberarSemaforoSQL]    Script Date: 10/19/2015 10:35:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LiberarSemaforoSQL] @sema Char(15) 
 AS 
 Update rparams Set param = 'N' Where copar = @sema
GO

-- 65

--/****** Object:  StoredProcedure [rionapo].[InsertarEntrada]    Script Date: 10/19/2015 10:35:11 ******/
--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO
--create procedure [rionapo].[InsertarEntrada]
--(@legajo char(12),@dia datetime, @hora char(5),@reloj char(16),@horamin char(5),@horamax char(5)) 
--as
--begin
--if not exists (select * from tbcasapa where apalegajo=@legajo and apafecha =@dia and  apahorae between @horamin and @horamax)
-- insert into tbcasapa 
--(apacodigo,apalegajo, apafecha,apahorae,apaestado,aparele,apatipo)
--select max(apacodigo)+1, @legajo,@dia,@hora,2,@reloj,'A' from tbcasapa
--end
--GO

-- 66

/****** Object:  StoredProcedure [dbo].[insertarmarca]    Script Date: 10/19/2015 10:35:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[insertarmarca] @legajo char(12), @dia datetime, @hora char(5),  @reloj char(16),@tipo char(1), @toleran int 
as 
begin 
  declare @existe int, @exists int, @codigo int,@estado char(1),@pnid int,@horamin char(5),@horamax char(5),@hormin int, @hormax int 
  declare @horx varchar(5), @minx varchar(5) 
  select @hormin =  convert(int,substring(@hora,1,2))*60 + convert(int,substring(@hora,4,2)) - @toleran 
  if @hormin > 0 
  begin 
    select @horx= convert(varchar(5),@hormin/60) 
    select @horx= rtrim(ltrim(@horx)) 
    select @minx = convert(varchar(5),@hormin%60) 
    select @minx = rtrim(ltrim(@minx)) 
    select @horamin = REPLICATE('0',2-LEN(@horx)) + @horx + ':' + REPLICATE('0',2-LEN(@minx)) + @minx 
  end 
  else 
    SELECT @horamin = '00:00' 
 
  select @hormax =  convert(int,substring(@hora,1,2))*60 + convert(int,substring(@hora,4,2)) + @toleran 
  if @hormax < 1440 
  begin 
    select @horx = convert(char,@hormax/60) 
    select @horx = rtrim(ltrim(@horx)) 
    select @minx = convert(char,@hormax%60) 
    select @minx = rtrim(ltrim(@minx)) 
    select @horamax = REPLICATE('0',2 - LEN(@horx)) + @horx + ':' + REPLICATE('0',2 - LEN(@minx)) + @minx 
    end 
  else 
    SELECT @horamax = '23:59' 
  if @tipo = 'E' 
      begin 
    if not exists (select * from tbcasapa where apalegajo = @legajo 
     and apafecha = @dia 
     and apahorae between @horamin and @horamax) 
    begin 
      select @exists = min(apacodigo) from tbcasapa 
      where apalegajo =@legajo 
      and apafecha = @dia 
      and apaestado = 1 
      and apahoras >= @hora 
      OR 
      apalegajo = @legajo 
      and apafecha = dateadd(day,1,@dia) 
      and apaestado = 1 
      and apahoras < @hora 
    if @exists is null 
    begin 
      select @pnid = 0 
      exec sp_ww_newid 'tbcasapa',@pnid output 
      insert into tbcasapa (apacodigo,apalegajo,apafecha,apahorae,apaestado,aparele,apatipo) 
        values(@pnid,@legajo,@dia,@hora,2,@reloj,'A') 
    end 
    else 
    begin 
        update tbcasapa set apahorae = @hora, apaestado=0, aparele=@reloj  
        where apacodigo = @exists 
    end 
   end 
    end 
  else 
  begin 
    -- es una salida  buscar ultima entrada antes de esta salida en mismo dia o anterior 
    select @codigo = max(apacodigo) from tbcasapa 
      where apalegajo=@legajo and apahorae >='00:00' 
      and (apafecha=@dia and apahorae <= @hora or apafecha = dateadd(day,-1,@dia) and apahorae > @hora) 
      -- se encontro ultima entrada antes de esta salida. Le falta salida 
    if @codigo is not null 
    begin 
      select @estado=apaestado from tbcasapa where apacodigo=@codigo 
      if @estado = 2  
        update tbcasapa set apahoras =@hora, apaestado = 0, aparels = @reloj where apacodigo=@codigo 
      else 
        if not exists(select apacodigo from tbcasapa where apalegajo =@legajo and 
          (apafecha=@dia and apahoras between @horamin and @horamax or 
          apafecha = dateadd(day,-1,@dia) and apahoras between @horamin and @horamax and apahorae > @hora)) 
        begin 
          select @pnid = 0 
          exec sp_ww_newid 'tbcasapa',@pnid output 
          insert into tbcasapa (apacodigo,apalegajo,apafecha,apahoras,apaestado,aparels,apatipo) 
            values(@pnid,@legajo,@dia,@hora,1,@reloj,'A') 
        end 
    end 
 
    -- no hay ninguna otra entrada, insertar la salida derechosi asi funco 
    else 
      if not exists(select apacodigo from tbcasapa where apalegajo =@legajo and  
        (apafecha=@dia AND apahoras BETWEEN @horamin AND @horamax 
                 or 
        apafecha = dateadd(day,-1,@dia) AND apahoras BETWEEN @horamin AND @horamax and apahorae >@hora)) 
      BEGIN 
        exec sp_ww_newid 'tbcasapa',@pnid output 
        INSERT INTO tbcasapa 
          (apacodigo, apalegajo, apafecha, apahoras, apaestado, aparels, apatipo) 
          VALUES (@pnid, @legajo, @dia, @hora, 1, @reloj, 'A') 
      end 
  -- HASTA ACA ES UNA SALIDA 
  END 
END
GO

-- 67

/****** Object:  StoredProcedure [dbo].[aparear]    Script Date: 10/19/2015 10:35:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[aparear] @toleran int as 
begin 
  declare casrel cursor for select r.relcodigo,r.rellegajo,r.relfecha,r.relhora,r.reltipomov,r.relreloj from tbcasrel r 
  inner join remples s on r.rellegajo = s.codigo 
  order by relcodigo 
 
  declare @codigo int 
  declare @legajo char(12) 
  declare @fecha datetime 
  declare @hora char(5) 
  declare @reloj char(5) 
  declare @cuenta int 
  declare @tipomov char(1) 
 
  begin transaction 
  open casrel 
  fetch next from casrel into @codigo,@legajo,@fecha,@hora,@tipomov,@reloj 
  
  while @@fetch_status = 0 
  begin 
    exec insertarmarca @legajo,@fecha,@hora,@reloj,@tipomov,@toleran 
    delete from tbcasrel where relcodigo = @codigo 
    fetch next from casrel into @codigo,@legajo,@fecha,@hora,@tipomov,@reloj 
  end 
 
  close casrel 
  deallocate casrel 
 
  delete from tbcasrel where relcodigo in 
  (select relcodigo from tbcasrel left outer join remples on rellegajo = codigo where codigo is null) 
  commit tran 
end
GO

-- 68
-- Add default values.

GO
/****** Object:  Default [DF__LaunchSer__UrlSe__38AF44A5]    Script Date: 10/19/2015 10:35:09 ******/
ALTER TABLE [dbo].[LaunchServers] ADD  DEFAULT (' ') FOR [UrlServ]
GO
/****** Object:  Default [DF__LaunchSer__ServN__39A368DE]    Script Date: 10/19/2015 10:35:09 ******/
ALTER TABLE [dbo].[LaunchServers] ADD  DEFAULT (' ') FOR [ServName]
GO
/****** Object:  Default [DF__LaunchServe__CPU__3A978D17]    Script Date: 10/19/2015 10:35:09 ******/
ALTER TABLE [dbo].[LaunchServers] ADD  DEFAULT ((0)) FOR [CPU]
GO
/****** Object:  Default [DF__LaunchSer__SrvSt__3B8BB150]    Script Date: 10/19/2015 10:35:09 ******/
ALTER TABLE [dbo].[LaunchServers] ADD  DEFAULT (' ') FOR [SrvState]
GO
/****** Object:  Default [DF__LaunchSer__LastR__3C7FD589]    Script Date: 10/19/2015 10:35:09 ******/
ALTER TABLE [dbo].[LaunchServers] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [LastRun]
GO
/****** Object:  Default [DF__PCPwrkusr__idWrk__3104013C]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPwrkusr] ADD  DEFAULT ((0)) FOR [idWrkflw]
GO
/****** Object:  Default [DF__PCPwrkusr__Usuar__31F82575]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPwrkusr] ADD  DEFAULT (' ') FOR [Usuario]
GO
/****** Object:  Default [DF__PCPwrkusr__Modif__32EC49AE]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPwrkusr] ADD  DEFAULT (' ') FOR [Modifica]
GO
/****** Object:  Default [DF__PCPwrkusr__Jdd__33E06DE7]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPwrkusr] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__PCPwrkflw__Tipo__2962DF74]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPwrkflw] ADD  DEFAULT ((0)) FOR [Tipo]
GO
/****** Object:  Default [DF__PCPwrkflw__Etapa__2A5703AD]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPwrkflw] ADD  DEFAULT ((0)) FOR [Etapa]
GO
/****** Object:  Default [DF__PCPwrkflw__Etapa__2B4B27E6]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPwrkflw] ADD  DEFAULT ((0)) FOR [Etapasig]
GO
/****** Object:  Default [DF__PCPwrkflw__idIte__2C3F4C1F]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPwrkflw] ADD  DEFAULT ((0)) FOR [idItems]
GO
/****** Object:  Default [DF__PCPwrkflw__Tipo___2D337058]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPwrkflw] ADD  DEFAULT ((0)) FOR [Tipo_nodo]
GO
/****** Object:  Default [DF__PCPwrkflw__Jdd__2E279491]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPwrkflw] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__PCPRvacac__Codig__548247A3]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRvacaci] ADD  DEFAULT (' ') FOR [Codigo]
GO
/****** Object:  Default [DF__PCPRvacac__Nombr__55766BDC]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRvacaci] ADD  DEFAULT (' ') FOR [Nombre]
GO
/****** Object:  Default [DF__PCPRvacac__Feini__566A9015]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRvacaci] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [Feini]
GO
/****** Object:  Default [DF__PCPRvacaci__Dias__575EB44E]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRvacaci] ADD  DEFAULT ((0)) FOR [Dias]
GO
/****** Object:  Default [DF__PCPRvacac__Statu__5852D887]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRvacaci] ADD  DEFAULT (' ') FOR [Status]
GO
/****** Object:  Default [DF__PCPRvacaci__Opd__5946FCC0]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRvacaci] ADD  DEFAULT ((0)) FOR [Opd]
GO
/****** Object:  Default [DF__PCPRvacac__DiasI__5A3B20F9]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRvacaci] ADD  DEFAULT ((0)) FOR [DiasI]
GO
/****** Object:  Default [DF__PCPRvacac__Fefin__5B2F4532]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRvacaci] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [Fefin]
GO
/****** Object:  Default [DF__PCPRvacac__Fecha__5C23696B]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRvacaci] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [Fecha_ret]
GO
/****** Object:  Default [DF__PCPRvacaci__Dmi__5D178DA4]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRvacaci] ADD  DEFAULT ((0)) FOR [Dmi]
GO
/****** Object:  Default [DF__PCPRvacaci__Dmf__5E0BB1DD]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRvacaci] ADD  DEFAULT ((0)) FOR [Dmf]
GO
/****** Object:  Default [DF__PCPRvacac__Numre__5EFFD616]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRvacaci] ADD  DEFAULT ((0)) FOR [Numrem]
GO
/****** Object:  Default [DF__PCPRvacac__Numdo__5FF3FA4F]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRvacaci] ADD  DEFAULT ((0)) FOR [Numdoc]
GO
/****** Object:  Default [DF__PCPRvacaci__Ampm__60E81E88]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRvacaci] ADD  DEFAULT ((0)) FOR [Ampm]
GO
/****** Object:  Default [DF__PCPRvacac__Motan__61DC42C1]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRvacaci] ADD  DEFAULT (' ') FOR [Motanul]
GO
/****** Object:  Default [DF__PCPRvacac__Perto__62D066FA]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRvacaci] ADD  DEFAULT (' ') FOR [Pertom]
GO
/****** Object:  Default [DF__PCPRvacaci__Jdd__63C48B33]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRvacaci] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__PCPRvacaci__IDOT__64B8AF6C]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRvacaci] ADD  DEFAULT ((0)) FOR [IDOT]
GO
/****** Object:  Default [DF__PCPRvacac__PCPEs__65ACD3A5]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRvacaci] ADD  DEFAULT ((0)) FOR [PCPEstado]
GO
/****** Object:  Default [DF__PCPRvacac__PCPEr__66A0F7DE]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRvacaci] ADD  DEFAULT (' ') FOR [PCPErrores]
GO
/****** Object:  Default [DF__PCPRvacac__Linea__67951C17]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRvacaci] ADD  DEFAULT ((0)) FOR [Linea_wfl]
GO
/****** Object:  Default [DF__PCPRvacac__Etapa__68894050]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRvacaci] ADD  DEFAULT ((0)) FOR [Etapa_wfl]
GO
/****** Object:  Default [DF__PCPRvacac__Etasi__697D6489]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRvacaci] ADD  DEFAULT ((0)) FOR [Etasig_wfl]
GO
/****** Object:  Default [DF__PCPRvacac__Orden__6A7188C2]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRvacaci] ADD  DEFAULT ((0)) FOR [Orden_wfl]
GO
/****** Object:  Default [DF__PCPRvacac__Estad__6B65ACFB]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRvacaci] ADD  DEFAULT ((0)) FOR [Estado_wfl]
GO
/****** Object:  Default [DF__PCPRvacac__User___6C59D134]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRvacaci] ADD  DEFAULT (' ') FOR [User_wfl]
GO
/****** Object:  Default [DF__PCPRvacac__Fecha__6D4DF56D]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRvacaci] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [Fecha_wfl]
GO
/****** Object:  Default [DF__PCPRvacac__Obser__6E4219A6]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRvacaci] ADD  DEFAULT (' ') FOR [Obser_wfl]
GO
/****** Object:  Default [DF__PCPRmapit__Codig__68543626]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRmapitm] ADD  DEFAULT (' ') FOR [Codigo]
GO
/****** Object:  Default [DF__PCPRmapit__Cohad__69485A5F]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRmapitm] ADD  DEFAULT (' ') FOR [Cohade]
GO
/****** Object:  Default [DF__PCPRmapitm__Nro__6A3C7E98]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRmapitm] ADD  DEFAULT ((0)) FOR [Nro]
GO
/****** Object:  Default [DF__PCPRmapitm__Tipo__6B30A2D1]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRmapitm] ADD  DEFAULT ((0)) FOR [Tipo]
GO
/****** Object:  Default [DF__PCPRmapit__Orden__6C24C70A]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRmapitm] ADD  DEFAULT ((0)) FOR [Orden]
GO
/****** Object:  Default [DF__PCPRmapit__Perio__6D18EB43]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRmapitm] ADD  DEFAULT (' ') FOR [Periodo]
GO
/****** Object:  Default [DF__PCPRmapit__COFOR__6E0D0F7C]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRmapitm] ADD  DEFAULT (' ') FOR [COFORM]
GO
/****** Object:  Default [DF__PCPRmapit__CUOTO__6F0133B5]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRmapitm] ADD  DEFAULT ((0)) FOR [CUOTOT]
GO
/****** Object:  Default [DF__PCPRmapit__CUOPA__6FF557EE]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRmapitm] ADD  DEFAULT ((0)) FOR [CUOPAR]
GO
/****** Object:  Default [DF__PCPRmapit__Monto__70E97C27]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRmapitm] ADD  DEFAULT ((0)) FOR [Monto]
GO
/****** Object:  Default [DF__PCPRmapit__Fecha__71DDA060]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRmapitm] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [Fecha_cre]
GO
/****** Object:  Default [DF__PCPRmapit__Fecha__72D1C499]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRmapitm] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [Fecha_ini]
GO
/****** Object:  Default [DF__PCPRmapit__Fecha__73C5E8D2]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRmapitm] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [Fecha_fin]
GO
/****** Object:  Default [DF__PCPRmapit__Cenco__74BA0D0B]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRmapitm] ADD  DEFAULT ((0)) FOR [Cencos]
GO
/****** Object:  Default [DF__PCPRmapit__Cuent__75AE3144]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRmapitm] ADD  DEFAULT (' ') FOR [Cuenta]
GO
/****** Object:  Default [DF__PCPRmapit__Ticen__76A2557D]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRmapitm] ADD  DEFAULT (' ') FOR [Ticen]
GO
/****** Object:  Default [DF__PCPRmapit__Fepro__779679B6]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRmapitm] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [Fepro]
GO
/****** Object:  Default [DF__PCPRmapit__Codpr__788A9DEF]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRmapitm] ADD  DEFAULT ((0)) FOR [Codpres]
GO
/****** Object:  Default [DF__PCPRmapitm__Obs__797EC228]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRmapitm] ADD  DEFAULT (' ') FOR [Obs]
GO
/****** Object:  Default [DF__PCPRmapit__Formu__7A72E661]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRmapitm] ADD  DEFAULT (' ') FOR [Formula]
GO
/****** Object:  Default [DF__PCPRmapit__Proce__7B670A9A]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRmapitm] ADD  DEFAULT (' ') FOR [Procede]
GO
/****** Object:  Default [DF__PCPRmapit__Estad__7C5B2ED3]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRmapitm] ADD  DEFAULT (' ') FOR [Estado]
GO
/****** Object:  Default [DF__PCPRmapit__Coins__7D4F530C]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRmapitm] ADD  DEFAULT ((0)) FOR [Coinst]
GO
/****** Object:  Default [DF__PCPRmapit__PerIm__7E437745]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRmapitm] ADD  DEFAULT ((0)) FOR [PerImp]
GO
/****** Object:  Default [DF__PCPRmapitm__Pone__7F379B7E]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRmapitm] ADD  DEFAULT (' ') FOR [Pone]
GO
/****** Object:  Default [DF__PCPRmapit__Acumu__002BBFB7]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRmapitm] ADD  DEFAULT ((0)) FOR [Acumu]
GO
/****** Object:  Default [DF__PCPRmapit__Tiacu__011FE3F0]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRmapitm] ADD  DEFAULT (' ') FOR [Tiacu]
GO
/****** Object:  Default [DF__PCPRmapit__Monto__02140829]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRmapitm] ADD  DEFAULT ((0)) FOR [MontoC]
GO
/****** Object:  Default [DF__PCPRmapit__Monto__03082C62]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRmapitm] ADD  DEFAULT ((0)) FOR [MontoP]
GO
/****** Object:  Default [DF__PCPRmapit__Propo__03FC509B]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRmapitm] ADD  DEFAULT (' ') FOR [Propor]
GO
/****** Object:  Default [DF__PCPRmapit__Grupo__04F074D4]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRmapitm] ADD  DEFAULT ((0)) FOR [Grupo]
GO
/****** Object:  Default [DF__PCPRmapit__Condi__05E4990D]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRmapitm] ADD  DEFAULT (' ') FOR [Condi]
GO
/****** Object:  Default [DF__PCPRmapit__Simes__06D8BD46]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRmapitm] ADD  DEFAULT (' ') FOR [Simes]
GO
/****** Object:  Default [DF__PCPRmapit__Quepe__07CCE17F]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRmapitm] ADD  DEFAULT (' ') FOR [Queperi]
GO
/****** Object:  Default [DF__PCPRmapit__Fecha__08C105B8]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRmapitm] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [Fecha_ing]
GO
/****** Object:  Default [DF__PCPRmapit__Fecha__09B529F1]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRmapitm] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [Fecha_apr]
GO
/****** Object:  Default [DF__PCPRmapit__Codig__0AA94E2A]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRmapitm] ADD  DEFAULT (' ') FOR [Codigo_in]
GO
/****** Object:  Default [DF__PCPRmapit__Codig__0B9D7263]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRmapitm] ADD  DEFAULT (' ') FOR [Codigo_ap]
GO
/****** Object:  Default [DF__PCPRmapit__Plant__0C91969C]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRmapitm] ADD  DEFAULT (' ') FOR [Plantilla]
GO
/****** Object:  Default [DF__PCPRmapitm__Ames__0D85BAD5]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRmapitm] ADD  DEFAULT (' ') FOR [Ames]
GO
/****** Object:  Default [DF__PCPRmapitm__Jdd__0E79DF0E]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRmapitm] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__PCPRmapitm__IDOT__0F6E0347]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRmapitm] ADD  DEFAULT ((0)) FOR [IDOT]
GO
/****** Object:  Default [DF__PCPRmapit__PCPEs__10622780]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRmapitm] ADD  DEFAULT ((0)) FOR [PCPEstado]
GO
/****** Object:  Default [DF__PCPRmapit__PCPEr__11564BB9]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRmapitm] ADD  DEFAULT (' ') FOR [PCPErrores]
GO
/****** Object:  Default [DF__PCPRmapit__Iddon__124A6FF2]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRmapitm] ADD  DEFAULT ((0)) FOR [Iddonat]
GO
/****** Object:  Default [DF__PCPRmapit__Linea__133E942B]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRmapitm] ADD  DEFAULT ((0)) FOR [Linea_wfl]
GO
/****** Object:  Default [DF__PCPRmapit__Etapa__1432B864]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRmapitm] ADD  DEFAULT ((0)) FOR [Etapa_wfl]
GO
/****** Object:  Default [DF__PCPRmapit__Etasi__1526DC9D]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRmapitm] ADD  DEFAULT ((0)) FOR [Etasig_wfl]
GO
/****** Object:  Default [DF__PCPRmapit__Orden__161B00D6]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRmapitm] ADD  DEFAULT ((0)) FOR [Orden_wfl]
GO
/****** Object:  Default [DF__PCPRmapit__Estad__170F250F]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRmapitm] ADD  DEFAULT ((0)) FOR [Estado_wfl]
GO
/****** Object:  Default [DF__PCPRmapit__User___18034948]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRmapitm] ADD  DEFAULT (' ') FOR [User_wfl]
GO
/****** Object:  Default [DF__PCPRmapit__Fecha__18F76D81]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRmapitm] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [Fecha_wfl]
GO
/****** Object:  Default [DF__PCPRmapit__Obser__19EB91BA]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRmapitm] ADD  DEFAULT (' ') FOR [Obser_wfl]
GO
/****** Object:  Default [DF__PCPRgrupfa__Jdd__1CC7FE65]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRgrupfa] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__PCPRgrupf__Codig__1DBC229E]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRgrupfa] ADD  DEFAULT (' ') FOR [Codigo]
GO
/****** Object:  Default [DF__PCPRgrupf__Nombr__1EB046D7]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRgrupfa] ADD  DEFAULT (' ') FOR [Nombre]
GO
/****** Object:  Default [DF__PCPRgrupf__Rut_C__1FA46B10]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRgrupfa] ADD  DEFAULT (' ') FOR [Rut_Carga]
GO
/****** Object:  Default [DF__PCPRgrupf__Ident__20988F49]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRgrupfa] ADD  DEFAULT ((0)) FOR [Identidad]
GO
/****** Object:  Default [DF__PCPRgrupf__Nom_C__218CB382]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRgrupfa] ADD  DEFAULT (' ') FOR [Nom_Carga]
GO
/****** Object:  Default [DF__PCPRgrupf__Ape_C__2280D7BB]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRgrupfa] ADD  DEFAULT (' ') FOR [Ape_Carga]
GO
/****** Object:  Default [DF__PCPRgrupf__Mat_C__2374FBF4]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRgrupfa] ADD  DEFAULT (' ') FOR [Mat_Carga]
GO
/****** Object:  Default [DF__PCPRgrupfa__Apc__2469202D]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRgrupfa] ADD  DEFAULT (' ') FOR [Apc]
GO
/****** Object:  Default [DF__PCPRgrupf__Parie__255D4466]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRgrupfa] ADD  DEFAULT ((0)) FOR [Pariente]
GO
/****** Object:  Default [DF__PCPRgrupf__Desc___2651689F]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRgrupfa] ADD  DEFAULT (' ') FOR [Desc_par]
GO
/****** Object:  Default [DF__PCPRgrupfa__Sexo__27458CD8]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRgrupfa] ADD  DEFAULT (' ') FOR [Sexo]
GO
/****** Object:  Default [DF__PCPRgrupf__Fecha__2839B111]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRgrupfa] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(120)),(120))) FOR [Fecha_nac]
GO
/****** Object:  Default [DF__PCPRgrupf__Tipo___292DD54A]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRgrupfa] ADD  DEFAULT ((0)) FOR [Tipo_doc]
GO
/****** Object:  Default [DF__PCPRgrupf__Numdo__2A21F983]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRgrupfa] ADD  DEFAULT (' ') FOR [Numdoc]
GO
/****** Object:  Default [DF__PCPRgrupf__Gensa__2B161DBC]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRgrupfa] ADD  DEFAULT (' ') FOR [Gensal]
GO
/****** Object:  Default [DF__PCPRgrupf__Rebim__2C0A41F5]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRgrupfa] ADD  DEFAULT ((0)) FOR [Rebimp]
GO
/****** Object:  Default [DF__PCPRgrupf__Estud__2CFE662E]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRgrupfa] ADD  DEFAULT ((0)) FOR [Estudios]
GO
/****** Object:  Default [DF__PCPRgrupf__Desc___2DF28A67]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRgrupfa] ADD  DEFAULT (' ') FOR [Desc_est]
GO
/****** Object:  Default [DF__PCPRgrupf__Fecha__2EE6AEA0]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRgrupfa] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(120)),(120))) FOR [Fecha_alt]
GO
/****** Object:  Default [DF__PCPRgrupf__Fecha__2FDAD2D9]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRgrupfa] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(120)),(120))) FOR [Fecha_baj]
GO
/****** Object:  Default [DF__PCPRgrupf__Inval__30CEF712]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRgrupfa] ADD  DEFAULT ((0)) FOR [Invalid]
GO
/****** Object:  Default [DF__PCPRgrupf__Preex__31C31B4B]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRgrupfa] ADD  DEFAULT (' ') FOR [Preexis]
GO
/****** Object:  Default [DF__PCPRgrupf__Relac__32B73F84]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRgrupfa] ADD  DEFAULT ((0)) FOR [Relacion]
GO
/****** Object:  Default [DF__PCPRgrupf__Curso__33AB63BD]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRgrupfa] ADD  DEFAULT ((0)) FOR [Curso]
GO
/****** Object:  Default [DF__PCPRgrupf__RetJu__349F87F6]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRgrupfa] ADD  DEFAULT (' ') FOR [RetJud]
GO
/****** Object:  Default [DF__PCPRgrupf__Carsa__3593AC2F]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRgrupfa] ADD  DEFAULT (' ') FOR [Carsal]
GO
/****** Object:  Default [DF__PCPRgrupf__Matri__3687D068]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRgrupfa] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [Matri_fec]
GO
/****** Object:  Default [DF__PCPRgrupf__Matri__377BF4A1]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRgrupfa] ADD  DEFAULT ((0)) FOR [Matri_cer]
GO
/****** Object:  Default [DF__PCPRgrupf__Naci___387018DA]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRgrupfa] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [Naci_fec]
GO
/****** Object:  Default [DF__PCPRgrupf__Naci___39643D13]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRgrupfa] ADD  DEFAULT ((0)) FOR [Naci_cer]
GO
/****** Object:  Default [DF__PCPRgrupf__Prena__3A58614C]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRgrupfa] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [Prena_fec]
GO
/****** Object:  Default [DF__PCPRgrupf__Prena__3B4C8585]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRgrupfa] ADD  DEFAULT ((0)) FOR [Prena_cer]
GO
/****** Object:  Default [DF__PCPRgrupf__Estu___3C40A9BE]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRgrupfa] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [Estu_fec]
GO
/****** Object:  Default [DF__PCPRgrupf__Estu___3D34CDF7]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRgrupfa] ADD  DEFAULT ((0)) FOR [Estu_cer]
GO
/****** Object:  Default [DF__PCPRgrupf__Fecha__3E28F230]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRgrupfa] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [Fecha_aig]
GO
/****** Object:  Default [DF__PCPRgrupf__Fecha__3F1D1669]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRgrupfa] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [Fecha_big]
GO
/****** Object:  Default [DF__PCPRgrupf__AfpVo__40113AA2]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRgrupfa] ADD  DEFAULT (' ') FOR [AfpVol]
GO
/****** Object:  Default [DF__PCPRgrupf__AfpCo__41055EDB]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRgrupfa] ADD  DEFAULT ((0)) FOR [AfpCod]
GO
/****** Object:  Default [DF__PCPRgrupf__AfpNp__41F98314]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRgrupfa] ADD  DEFAULT ((0)) FOR [AfpNper]
GO
/****** Object:  Default [DF__PCPRgrupf__AfpMo__42EDA74D]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRgrupfa] ADD  DEFAULT ((0)) FOR [AfpMonto]
GO
/****** Object:  Default [DF__PCPRgrupf__AfpCo__43E1CB86]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRgrupfa] ADD  DEFAULT (' ') FOR [AfpCoform]
GO
/****** Object:  Default [DF__PCPRgrupf__AfpDe__44D5EFBF]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRgrupfa] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [AfpDesde]
GO
/****** Object:  Default [DF__PCPRgrupf__AfpHa__45CA13F8]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRgrupfa] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [AfpHasta]
GO
/****** Object:  Default [DF__PCPRgrupf__AhoVo__46BE3831]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRgrupfa] ADD  DEFAULT (' ') FOR [AhoVol]
GO
/****** Object:  Default [DF__PCPRgrupf__AhoMo__47B25C6A]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRgrupfa] ADD  DEFAULT ((0)) FOR [AhoMonto]
GO
/****** Object:  Default [DF__PCPRgrupf__AhoCo__48A680A3]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRgrupfa] ADD  DEFAULT (' ') FOR [AhoCoform]
GO
/****** Object:  Default [DF__PCPRgrupfa__IDOT__499AA4DC]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRgrupfa] ADD  DEFAULT ((0)) FOR [IDOT]
GO
/****** Object:  Default [DF__PCPRgrupf__PCPEs__4A8EC915]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRgrupfa] ADD  DEFAULT ((0)) FOR [PCPEstado]
GO
/****** Object:  Default [DF__PCPRgrupf__PCPEr__4B82ED4E]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRgrupfa] ADD  DEFAULT (' ') FOR [PCPErrores]
GO
/****** Object:  Default [DF__PCPRgrupf__Linea__4C771187]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRgrupfa] ADD  DEFAULT ((0)) FOR [Linea_wfl]
GO
/****** Object:  Default [DF__PCPRgrupf__Etapa__4D6B35C0]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRgrupfa] ADD  DEFAULT ((0)) FOR [Etapa_wfl]
GO
/****** Object:  Default [DF__PCPRgrupf__Etasi__4E5F59F9]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRgrupfa] ADD  DEFAULT ((0)) FOR [Etasig_wfl]
GO
/****** Object:  Default [DF__PCPRgrupf__Orden__4F537E32]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRgrupfa] ADD  DEFAULT ((0)) FOR [Orden_wfl]
GO
/****** Object:  Default [DF__PCPRgrupf__Estad__5047A26B]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRgrupfa] ADD  DEFAULT ((0)) FOR [Estado_wfl]
GO
/****** Object:  Default [DF__PCPRgrupf__User___513BC6A4]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRgrupfa] ADD  DEFAULT (' ') FOR [User_wfl]
GO
/****** Object:  Default [DF__PCPRgrupf__Fecha__522FEADD]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRgrupfa] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [Fecha_wfl]
GO
/****** Object:  Default [DF__PCPRgrupf__Obser__53240F16]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRgrupfa] ADD  DEFAULT (' ') FOR [Obser_wfl]
GO
/****** Object:  Default [DF__PCPRemples__Jdd__086BFFFD]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__PCPRemple__Codig__09602436]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT (' ') FOR [Codigo]
GO
/****** Object:  Default [DF__PCPRemple__Estad__0A54486F]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT (' ') FOR [Estado]
GO
/****** Object:  Default [DF__PCPRemple__NFich__0B486CA8]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT ((0)) FOR [NFicha]
GO
/****** Object:  Default [DF__PCPRemple__EsFpr__0C3C90E1]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT (' ') FOR [EsFpri]
GO
/****** Object:  Default [DF__PCPRemple__Tipre__0D30B51A]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT (' ') FOR [Tiprem]
GO
/****** Object:  Default [DF__PCPRemple__Empre__0E24D953]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT (' ') FOR [Empresa]
GO
/****** Object:  Default [DF__PCPRemple__Nombr__0F18FD8C]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT (' ') FOR [Nombre]
GO
/****** Object:  Default [DF__PCPRemples__Rut__100D21C5]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT (' ') FOR [Rut]
GO
/****** Object:  Default [DF__PCPRemples__Sexo__110145FE]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT (' ') FOR [Sexo]
GO
/****** Object:  Default [DF__PCPRemple__Direc__11F56A37]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT (' ') FOR [Direccion]
GO
/****** Object:  Default [DF__PCPRemples__Fono__12E98E70]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT (' ') FOR [Fono]
GO
/****** Object:  Default [DF__PCPRemple__Fecha__13DDB2A9]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [Fecha_nac]
GO
/****** Object:  Default [DF__PCPRemple__Nacio__14D1D6E2]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT ((0)) FOR [Nacion]
GO
/****** Object:  Default [DF__PCPRemple__Celul__15C5FB1B]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT (' ') FOR [Celular]
GO
/****** Object:  Default [DF__PCPRemple__Est_c__16BA1F54]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT (' ') FOR [Est_civil]
GO
/****** Object:  Default [DF__PCPRemple__Estud__17AE438D]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT ((0)) FOR [Estudios]
GO
/****** Object:  Default [DF__PCPRemple__Titul__18A267C6]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT ((0)) FOR [Titulo]
GO
/****** Object:  Default [DF__PCPRemple__Clase__19968BFF]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT ((0)) FOR [Clase]
GO
/****** Object:  Default [DF__PCPRemple__Idiom__1A8AB038]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT ((0)) FOR [Idiomas]
GO
/****** Object:  Default [DF__PCPRemple__Renma__1B7ED471]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT ((0)) FOR [Renmax]
GO
/****** Object:  Default [DF__PCPRemple__Autop__1C72F8AA]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT (' ') FOR [Autopas]
GO
/****** Object:  Default [DF__PCPRemple__pmail__1D671CE3]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT (' ') FOR [pmail]
GO
/****** Object:  Default [DF__PCPRemple__Fecha__1E5B411C]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [Fecha_ing]
GO
/****** Object:  Default [DF__PCPRemple__Tipo___1F4F6555]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT ((0)) FOR [Tipo_doc]
GO
/****** Object:  Default [DF__PCPRemple__Numdo__2043898E]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT (' ') FOR [Numdoc]
GO
/****** Object:  Default [DF__PCPRemples__Jefe__2137ADC7]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT (' ') FOR [Jefe]
GO
/****** Object:  Default [DF__PCPRemple__Autor__222BD200]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT (' ') FOR [Autoriza]
GO
/****** Object:  Default [DF__PCPRemple__Fecha__231FF639]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [Fecha_ret]
GO
/****** Object:  Default [DF__PCPRemple__Moti___24141A72]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT ((0)) FOR [Moti_ret]
GO
/****** Object:  Default [DF__PCPRemple__Fecha__25083EAB]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [Fecha_xtr]
GO
/****** Object:  Default [DF__PCPRemple__Cenco__25FC62E4]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT ((0)) FOR [Cencos]
GO
/****** Object:  Default [DF__PCPRemple__Ticen__26F0871D]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT (' ') FOR [Ticen]
GO
/****** Object:  Default [DF__PCPRemple__Categ__27E4AB56]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT ((0)) FOR [Catego]
GO
/****** Object:  Default [DF__PCPRemple__Clasi__28D8CF8F]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT ((0)) FOR [Clasif]
GO
/****** Object:  Default [DF__PCPRemple__Ubica__29CCF3C8]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT ((0)) FOR [Ubica]
GO
/****** Object:  Default [DF__PCPRemple__Lpago__2AC11801]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT ((0)) FOR [Lpago]
GO
/****** Object:  Default [DF__PCPRemple__Cargo__2BB53C3A]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT ((0)) FOR [Cargo]
GO
/****** Object:  Default [DF__PCPRemple__Ocupa__2CA96073]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT (' ') FOR [Ocupacion]
GO
/****** Object:  Default [DF__PCPRemple__CodOc__2D9D84AC]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT ((0)) FOR [CodOcupa]
GO
/****** Object:  Default [DF__PCPRemple__Grado__2E91A8E5]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT ((0)) FOR [Grado]
GO
/****** Object:  Default [DF__PCPRemple__Divis__2F85CD1E]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT ((0)) FOR [Division]
GO
/****** Object:  Default [DF__PCPRemple__Unida__3079F157]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT ((0)) FOR [Unidad]
GO
/****** Object:  Default [DF__PCPRemple__Horar__316E1590]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT ((0)) FOR [Horario]
GO
/****** Object:  Default [DF__PCPRemple__Conve__326239C9]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT ((0)) FOR [Convenio]
GO
/****** Object:  Default [DF__PCPRemple__Confi__33565E02]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT (' ') FOR [Confid]
GO
/****** Object:  Default [DF__PCPRemple__Secci__344A823B]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT ((0)) FOR [Seccion]
GO
/****** Object:  Default [DF__PCPRemple__Sit_l__353EA674]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT ((0)) FOR [Sit_lab]
GO
/****** Object:  Default [DF__PCPRemple__CARNE__3632CAAD]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT (' ') FOR [CARNET]
GO
/****** Object:  Default [DF__PCPRemple__Fpago__3726EEE6]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT ((0)) FOR [Fpago]
GO
/****** Object:  Default [DF__PCPRemple__Fpago__381B131F]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT ((0)) FOR [Fpago2]
GO
/****** Object:  Default [DF__PCPRemple__Banco__390F3758]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT ((0)) FOR [Banco]
GO
/****** Object:  Default [DF__PCPRemple__Banco__3A035B91]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT ((0)) FOR [Banco2]
GO
/****** Object:  Default [DF__PCPRemple__Cta_c__3AF77FCA]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT (' ') FOR [Cta_corr]
GO
/****** Object:  Default [DF__PCPRemple__Cta_c__3BEBA403]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT (' ') FOR [Cta_corr2]
GO
/****** Object:  Default [DF__PCPRemples__Ffp__3CDFC83C]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT ((0)) FOR [Ffp]
GO
/****** Object:  Default [DF__PCPRemples__Ffp2__3DD3EC75]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT ((0)) FOR [Ffp2]
GO
/****** Object:  Default [DF__PCPRemple__Ofiba__3EC810AE]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT ((0)) FOR [Ofiban]
GO
/****** Object:  Default [DF__PCPRemple__Ofiba__3FBC34E7]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT ((0)) FOR [Ofiban2]
GO
/****** Object:  Default [DF__PCPRemple__Talla__40B05920]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT (' ') FOR [Talla_r]
GO
/****** Object:  Default [DF__PCPRemple__Talla__41A47D59]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT (' ') FOR [Talla_z]
GO
/****** Object:  Default [DF__PCPRemple__Cod_a__4298A192]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT ((0)) FOR [Cod_afp]
GO
/****** Object:  Default [DF__PCPRemple__Numaf__438CC5CB]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT (' ') FOR [Numafp]
GO
/****** Object:  Default [DF__PCPRemple__Fecha__4480EA04]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [Fecha_afp]
GO
/****** Object:  Default [DF__PCPRemple__Cod_s__45750E3D]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT ((0)) FOR [Cod_sin]
GO
/****** Object:  Default [DF__PCPRemple__Cod_i__46693276]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT ((0)) FOR [Cod_isa]
GO
/****** Object:  Default [DF__PCPRemples__Fun__475D56AF]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT (' ') FOR [Fun]
GO
/****** Object:  Default [DF__PCPRemple__Fecha__48517AE8]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [Fecha_isa]
GO
/****** Object:  Default [DF__PCPRemple__Cod_i__49459F21]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT ((0)) FOR [Cod_ine]
GO
/****** Object:  Default [DF__PCPRemple__Cod_c__4A39C35A]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT ((0)) FOR [Cod_caj]
GO
/****** Object:  Default [DF__PCPRemple__Zonaf__4B2DE793]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT ((0)) FOR [Zonafa]
GO
/****** Object:  Default [DF__PCPRemple__Tramo__4C220BCC]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT ((0)) FOR [Tramo_car]
GO
/****** Object:  Default [DF__PCPRemple__Cod_r__4D163005]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT ((0)) FOR [Cod_reg]
GO
/****** Object:  Default [DF__PCPRemple__Jubil__4E0A543E]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT (' ') FOR [Jubila]
GO
/****** Object:  Default [DF__PCPRemple__Fecha__4EFE7877]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [Fecha_vac]
GO
/****** Object:  Default [DF__PCPRemple__Vac_f__4FF29CB0]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT (' ') FOR [Vac_form]
GO
/****** Object:  Default [DF__PCPRemple__Vac_a__50E6C0E9]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT ((0)) FOR [Vac_anre]
GO
/****** Object:  Default [DF__PCPRemple__Fecha__51DAE522]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [Fecha_rea]
GO
/****** Object:  Default [DF__PCPRemple__Vac_i__52CF095B]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT ((0)) FOR [Vac_ini]
GO
/****** Object:  Default [DF__PCPRemple__Vac_b__53C32D94]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT ((0)) FOR [Vac_base]
GO
/****** Object:  Default [DF__PCPRemple__Asigf__54B751CD]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT (' ') FOR [Asigfam]
GO
/****** Object:  Default [DF__PCPRemple__Fecha__55AB7606]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [Fecha_lic]
GO
/****** Object:  Default [DF__PCPRemple__Anexo__569F9A3F]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT ((0)) FOR [Anexo]
GO
/****** Object:  Default [DF__PCPRemples__Apc__5793BE78]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT (' ') FOR [Apc]
GO
/****** Object:  Default [DF__PCPRemple__SiAus__5887E2B1]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT (' ') FOR [SiAus]
GO
/****** Object:  Default [DF__PCPRemple__Monto__597C06EA]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT ((0)) FOR [Monto_red]
GO
/****** Object:  Default [DF__PCPRemple__Monto__5A702B23]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT ((0)) FOR [Monto_sgr]
GO
/****** Object:  Default [DF__PCPRemples__Ktim__5B644F5C]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT ((0)) FOR [Ktim]
GO
/****** Object:  Default [DF__PCPRemple__Antic__5C587395]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT ((0)) FOR [Antica]
GO
/****** Object:  Default [DF__PCPRemple__Diast__5D4C97CE]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT ((0)) FOR [Diastr]
GO
/****** Object:  Default [DF__PCPRemple__Diasl__5E40BC07]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT ((0)) FOR [Diasli]
GO
/****** Object:  Default [DF__PCPRemple__Sen_n__5F34E040]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT ((0)) FOR [Sen_niv]
GO
/****** Object:  Default [DF__PCPRemple__Sen_f__60290479]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT ((0)) FOR [Sen_fra]
GO
/****** Object:  Default [DF__PCPRemple__Bloqu__611D28B2]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT (' ') FOR [Bloques]
GO
/****** Object:  Default [DF__PCPRemple__TopeL__62114CEB]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT ((0)) FOR [TopeLey]
GO
/****** Object:  Default [DF__PCPRemple__Grado__63057124]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT ((0)) FOR [GradoC]
GO
/****** Object:  Default [DF__PCPRemple__Fecha__63F9955D]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [Fecha_gra]
GO
/****** Object:  Default [DF__PCPRemple__NumTa__64EDB996]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT ((0)) FOR [NumTar]
GO
/****** Object:  Default [DF__PCPRemple__L1856__65E1DDCF]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT (' ') FOR [L18566]
GO
/****** Object:  Default [DF__PCPRemple__Lpaco__66D60208]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT (' ') FOR [Lpacot]
GO
/****** Object:  Default [DF__PCPRemple__Cuent__67CA2641]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT ((0)) FOR [Cuenta]
GO
/****** Object:  Default [DF__PCPRemple__RegPa__68BE4A7A]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT (' ') FOR [RegPag]
GO
/****** Object:  Default [DF__PCPRemple__Trape__69B26EB3]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT ((0)) FOR [Trapes]
GO
/****** Object:  Default [DF__PCPRemple__Horas__6AA692EC]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT ((0)) FOR [Horas]
GO
/****** Object:  Default [DF__PCPRemple__Licme__6B9AB725]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT (' ') FOR [Licmed]
GO
/****** Object:  Default [DF__PCPRemple__Tresp__6C8EDB5E]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT (' ') FOR [Trespd]
GO
/****** Object:  Default [DF__PCPRemple__Subsi__6D82FF97]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT (' ') FOR [Subsil]
GO
/****** Object:  Default [DF__PCPRemple__rebli__6E7723D0]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT (' ') FOR [reblim]
GO
/****** Object:  Default [DF__PCPRemple__Manli__6F6B4809]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT (' ') FOR [Manliq]
GO
/****** Object:  Default [DF__PCPRemple__Fecha__705F6C42]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [Fecha_mod]
GO
/****** Object:  Default [DF__PCPRemples__Ames__7153907B]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT (' ') FOR [Ames]
GO
/****** Object:  Default [DF__PCPRemple__Sdato__7247B4B4]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT (' ') FOR [Sdato]
GO
/****** Object:  Default [DF__PCPRemple__Crede__733BD8ED]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT (' ') FOR [Credenc]
GO
/****** Object:  Default [DF__PCPRemple__Ticke__742FFD26]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT (' ') FOR [Ticket]
GO
/****** Object:  Default [DF__PCPRemple__Fecha__7524215F]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [Fecha_sec]
GO
/****** Object:  Default [DF__PCPRemple__Tipco__76184598]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT (' ') FOR [Tipcon]
GO
/****** Object:  Default [DF__PCPRemple__Chere__770C69D1]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT (' ') FOR [Cheres]
GO
/****** Object:  Default [DF__PCPRemple__Chenu__78008E0A]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT ((0)) FOR [Chenum]
GO
/****** Object:  Default [DF__PCPRemple__Cheva__78F4B243]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT ((0)) FOR [Cheval]
GO
/****** Object:  Default [DF__PCPRemples__Peri__79E8D67C]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT (' ') FOR [Peri]
GO
/****** Object:  Default [DF__PCPRemple__Sicon__7ADCFAB5]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT (' ') FOR [Sicontra]
GO
/****** Object:  Default [DF__PCPRemple__fecha__7BD11EEE]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [fecha_rct]
GO
/****** Object:  Default [DF__PCPRemple__Evalu__7CC54327]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT (' ') FOR [Evaluador]
GO
/****** Object:  Default [DF__PCPRemple__Esrec__7DB96760]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT (' ') FOR [Esrecon]
GO
/****** Object:  Default [DF__PCPRemple__IndMo__7EAD8B99]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT ((0)) FOR [IndMonto]
GO
/****** Object:  Default [DF__PCPRemple__IndDi__7FA1AFD2]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT ((0)) FOR [IndDias]
GO
/****** Object:  Default [DF__PCPRemple__Fecha__0095D40B]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [FechaApvc]
GO
/****** Object:  Default [DF__PCPRemple__EstAp__0189F844]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT (' ') FOR [EstApvc]
GO
/****** Object:  Default [DF__PCPRemple__UserA__027E1C7D]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT (' ') FOR [UserAD]
GO
/****** Object:  Default [DF__PCPRemple__Fecha__037240B6]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [FechaSjov]
GO
/****** Object:  Default [DF__PCPRemple__Jorna__046664EF]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT (' ') FOR [Jornada]
GO
/****** Object:  Default [DF__PCPRemple__Sdato__055A8928]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT (' ') FOR [Sdato2]
GO
/****** Object:  Default [DF__PCPRemple__JorCo__064EAD61]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT (' ') FOR [JorCont]
GO
/****** Object:  Default [DF__PCPRemple__Pjort__0742D19A]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT (' ') FOR [Pjortm]
GO
/****** Object:  Default [DF__PCPRemple__Psujh__0836F5D3]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT (' ') FOR [Psujhn]
GO
/****** Object:  Default [DF__PCPRemple__PingS__092B1A0C]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT (' ') FOR [PingSt]
GO
/****** Object:  Default [DF__PCPRemple__Pafis__0A1F3E45]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT (' ') FOR [Pafisp]
GO
/****** Object:  Default [DF__PCPRemple__Pdisc__0B13627E]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT (' ') FOR [Pdisca]
GO
/****** Object:  Default [DF__PCPRemple__P5tae__0C0786B7]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT (' ') FOR [P5taex]
GO
/****** Object:  Default [DF__PCPRemple__Pmadr__0CFBAAF0]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT (' ') FOR [Pmadres]
GO
/****** Object:  Default [DF__PCPRemple__Pindo__0DEFCF29]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT (' ') FOR [Pindom]
GO
/****** Object:  Default [DF__PCPRemple__cta_i__0EE3F362]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT (' ') FOR [cta_inter]
GO
/****** Object:  Default [DF__PCPRemple__cta_i__0FD8179B]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT (' ') FOR [cta_inte2]
GO
/****** Object:  Default [DF__PCPRemple__dir_t__10CC3BD4]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT ((0)) FOR [dir_trab]
GO
/****** Object:  Default [DF__PCPRemple__fp2be__11C0600D]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT ((0)) FOR [fp2benef]
GO
/****** Object:  Default [DF__PCPRemple__AutFi__12B48446]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT (' ') FOR [AutFirmar]
GO
/****** Object:  Default [DF__PCPRemple__Premi__13A8A87F]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT (' ') FOR [Premint]
GO
/****** Object:  Default [DF__PCPRemple__PorcU__149CCCB8]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT ((0)) FOR [PorcUnif]
GO
/****** Object:  Default [DF__PCPRemple__Cod_d__1590F0F1]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT ((0)) FOR [Cod_dni]
GO
/****** Object:  Default [DF__PCPRemple__Fecha__1685152A]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(120)),(120))) FOR [Fecha_ult]
GO
/****** Object:  Default [DF__PCPRemple__Cargo__17793963]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT ((0)) FOR [Cargo_est]
GO
/****** Object:  Default [DF__PCPRemple__Srsic__186D5D9C]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT ((0)) FOR [Srsicoss]
GO
/****** Object:  Default [DF__PCPRemple__Ccsic__196181D5]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT ((0)) FOR [Ccsicoss]
GO
/****** Object:  Default [DF__PCPRemples__IDOT__1A55A60E]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT ((0)) FOR [IDOT]
GO
/****** Object:  Default [DF__PCPRemple__PCPes__1B49CA47]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT ((0)) FOR [PCPestado]
GO
/****** Object:  Default [DF__PCPRemple__PCPEr__1C3DEE80]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT (' ') FOR [PCPErrores]
GO
/****** Object:  Default [DF__PCPRemple__Linea__1D3212B9]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT ((0)) FOR [Linea_wfl]
GO
/****** Object:  Default [DF__PCPRemple__Orden__1E2636F2]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT ((0)) FOR [Orden_wfl]
GO
/****** Object:  Default [DF__PCPRemple__Etapa__1F1A5B2B]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT ((0)) FOR [Etapa_wfl]
GO
/****** Object:  Default [DF__PCPRemple__Etasi__200E7F64]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT ((0)) FOR [Etasig_wfl]
GO
/****** Object:  Default [DF__PCPRemple__Estad__2102A39D]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT ((0)) FOR [Estado_wfl]
GO
/****** Object:  Default [DF__PCPRemple__User___21F6C7D6]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT (' ') FOR [User_wfl]
GO
/****** Object:  Default [DF__PCPRemple__Fecha__22EAEC0F]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [Fecha_wfl]
GO
/****** Object:  Default [DF__PCPRemple__Obser__23DF1048]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT (' ') FOR [Obser_wfl]
GO
/****** Object:  Default [DF__PCPRdomic__Jdd__56007BC1]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRdomic] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__PCPRdomic__Codig__56F49FFA]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRdomic] ADD  DEFAULT (' ') FOR [Codigo]
GO
/****** Object:  Default [DF__PCPRdomic__Nombr__57E8C433]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRdomic] ADD  DEFAULT (' ') FOR [Nombre]
GO
/****** Object:  Default [DF__PCPRdomic__Calle__58DCE86C]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRdomic] ADD  DEFAULT (' ') FOR [Calle]
GO
/****** Object:  Default [DF__PCPRdomic__Nro__59D10CA5]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRdomic] ADD  DEFAULT (' ') FOR [Nro]
GO
/****** Object:  Default [DF__PCPRdomic__Piso__5AC530DE]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRdomic] ADD  DEFAULT (' ') FOR [Piso]
GO
/****** Object:  Default [DF__PCPRdomic__Depto__5BB95517]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRdomic] ADD  DEFAULT (' ') FOR [Depto]
GO
/****** Object:  Default [DF__PCPRdomic__Comun__5CAD7950]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRdomic] ADD  DEFAULT ((0)) FOR [Comuna]
GO
/****** Object:  Default [DF__PCPRdomic__Ciuda__5DA19D89]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRdomic] ADD  DEFAULT (' ') FOR [Ciudad]
GO
/****** Object:  Default [DF__PCPRdomic__Regio__5E95C1C2]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRdomic] ADD  DEFAULT ((0)) FOR [Region]
GO
/****** Object:  Default [DF__PCPRdomic__IDOT__5F89E5FB]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRdomic] ADD  DEFAULT ((0)) FOR [IDOT]
GO
/****** Object:  Default [DF__PCPRdomic__PCPEs__607E0A34]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRdomic] ADD  DEFAULT ((0)) FOR [PCPEstado]
GO
/****** Object:  Default [DF__PCPRdomic__PCPEr__61722E6D]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRdomic] ADD  DEFAULT (' ') FOR [PCPErrores]
GO
/****** Object:  Default [DF__PCPRdomic__Codpo__626652A6]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRdomic] ADD  DEFAULT (' ') FOR [Codpostal]
GO
/****** Object:  Default [DF__PCPRdomic__Lote__635A76DF]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRdomic] ADD  DEFAULT (' ') FOR [Lote]
GO
/****** Object:  Default [DF__PCPRdomic__Km__644E9B18]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRdomic] ADD  DEFAULT (' ') FOR [Km]
GO
/****** Object:  Default [DF__PCPRdomic__Block__6542BF51]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRdomic] ADD  DEFAULT (' ') FOR [Block]
GO
/****** Object:  Default [DF__PCPRdomic__Etapa__6636E38A]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRdomic] ADD  DEFAULT (' ') FOR [Etapa]
GO
/****** Object:  Default [DF__PCPRdomic__Manza__672B07C3]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRdomic] ADD  DEFAULT (' ') FOR [Manzana]
GO
/****** Object:  Default [DF__PCPRdomic__Nombr__681F2BFC]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRdomic] ADD  DEFAULT (' ') FOR [NombreZona]
GO
/****** Object:  Default [DF__PCPRdomic__Refer__69135035]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRdomic] ADD  DEFAULT (' ') FOR [Referencia]
GO
/****** Object:  Default [DF__PCPRdomic__Ubige__6A07746E]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRdomic] ADD  DEFAULT (' ') FOR [Ubigeo]
GO
/****** Object:  Default [DF__PCPRdomic__Linea__6AFB98A7]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRdomic] ADD  DEFAULT ((0)) FOR [Linea_wfl]
GO
/****** Object:  Default [DF__PCPRdomic__Etapa__6BEFBCE0]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRdomic] ADD  DEFAULT ((0)) FOR [Etapa_wfl]
GO
/****** Object:  Default [DF__PCPRdomic__Etasi__6CE3E119]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRdomic] ADD  DEFAULT ((0)) FOR [Etasig_wfl]
GO
/****** Object:  Default [DF__PCPRdomic__Orden__6DD80552]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRdomic] ADD  DEFAULT ((0)) FOR [Orden_wfl]
GO
/****** Object:  Default [DF__PCPRdomic__Estad__6ECC298B]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRdomic] ADD  DEFAULT ((0)) FOR [Estado_wfl]
GO
/****** Object:  Default [DF__PCPRdomic__User___6FC04DC4]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRdomic] ADD  DEFAULT (' ') FOR [User_wfl]
GO
/****** Object:  Default [DF__PCPRdomic__Fecha__70B471FD]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRdomic] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [Fecha_wfl]
GO
/****** Object:  Default [DF__PCPRdomic__Obser__71A89636]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRdomic] ADD  DEFAULT (' ') FOR [Obser_wfl]
GO
/****** Object:  Default [DF__PCPRausen__Codig__26BB7CF3]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRausent] ADD  DEFAULT (' ') FOR [Codigo]
GO
/****** Object:  Default [DF__PCPRausen__Nombr__27AFA12C]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRausent] ADD  DEFAULT (' ') FOR [Nombre]
GO
/****** Object:  Default [DF__PCPRausen__Fecha__28A3C565]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRausent] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [Fecha_lic]
GO
/****** Object:  Default [DF__PCPRausent__Dias__2997E99E]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRausent] ADD  DEFAULT ((0)) FOR [Dias]
GO
/****** Object:  Default [DF__PCPRausen__Rebsa__2A8C0DD7]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRausent] ADD  DEFAULT ((0)) FOR [Rebsal]
GO
/****** Object:  Default [DF__PCPRausen__Escon__2B803210]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRausent] ADD  DEFAULT (' ') FOR [Escon]
GO
/****** Object:  Default [DF__PCPRausent__Tipo__2C745649]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRausent] ADD  DEFAULT ((0)) FOR [Tipo]
GO
/****** Object:  Default [DF__PCPRausen__Dtipo__2D687A82]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRausent] ADD  DEFAULT (' ') FOR [Dtipo]
GO
/****** Object:  Default [DF__PCPRausen__Causa__2E5C9EBB]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRausent] ADD  DEFAULT ((0)) FOR [Causal]
GO
/****** Object:  Default [DF__PCPRausen__Dcaus__2F50C2F4]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRausent] ADD  DEFAULT (' ') FOR [Dcausal]
GO
/****** Object:  Default [DF__PCPRausen__Detal__3044E72D]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRausent] ADD  DEFAULT (' ') FOR [Detalle]
GO
/****** Object:  Default [DF__PCPRausen__Rutpr__31390B66]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRausent] ADD  DEFAULT (' ') FOR [Rutpro]
GO
/****** Object:  Default [DF__PCPRausen__Medic__322D2F9F]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRausent] ADD  DEFAULT (' ') FOR [Medico]
GO
/****** Object:  Default [DF__PCPRausen__Espec__332153D8]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRausent] ADD  DEFAULT ((0)) FOR [Especia]
GO
/****** Object:  Default [DF__PCPRausen__Nulic__34157811]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRausent] ADD  DEFAULT ((0)) FOR [Nulic]
GO
/****** Object:  Default [DF__PCPRausen__DiasE__35099C4A]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRausent] ADD  DEFAULT ((0)) FOR [DiasE]
GO
/****** Object:  Default [DF__PCPRausen__Medio__35FDC083]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRausent] ADD  DEFAULT (' ') FOR [Medios]
GO
/****** Object:  Default [DF__PCPRausen__Diagn__36F1E4BC]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRausent] ADD  DEFAULT ((0)) FOR [Diagnos]
GO
/****** Object:  Default [DF__PCPRausen__Maile__37E608F5]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRausent] ADD  DEFAULT ((0)) FOR [Mailen]
GO
/****** Object:  Default [DF__PCPRausen__Monto__38DA2D2E]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRausent] ADD  DEFAULT ((0)) FOR [MontoAn]
GO
/****** Object:  Default [DF__PCPRausen__Monto__39CE5167]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRausent] ADD  DEFAULT ((0)) FOR [MontoRe]
GO
/****** Object:  Default [DF__PCPRausen__Monto__3AC275A0]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRausent] ADD  DEFAULT ((0)) FOR [MontoCo]
GO
/****** Object:  Default [DF__PCPRausen__Estad__3BB699D9]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRausent] ADD  DEFAULT (' ') FOR [Estado]
GO
/****** Object:  Default [DF__PCPRausen__Fecha__3CAABE12]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRausent] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [Fecha_env]
GO
/****** Object:  Default [DF__PCPRausen__Fecha__3D9EE24B]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRausent] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [Fecha_ico]
GO
/****** Object:  Default [DF__PCPRausen__CodSu__3E930684]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRausent] ADD  DEFAULT (' ') FOR [CodSub]
GO
/****** Object:  Default [DF__PCPRausen__Orige__3F872ABD]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRausent] ADD  DEFAULT (' ') FOR [Origen]
GO
/****** Object:  Default [DF__PCPRausen__Fecha__407B4EF6]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRausent] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(120)),(120))) FOR [Fecha_ing]
GO
/****** Object:  Default [DF__PCPRausen__Usuar__416F732F]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRausent] ADD  DEFAULT (' ') FOR [Usuario]
GO
/****** Object:  Default [DF__PCPRausen__Lscan__42639768]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRausent] ADD  DEFAULT ((0)) FOR [Lscan]
GO
/****** Object:  Default [DF__PCPRausen__Fecha__4357BBA1]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRausent] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [Fecha_ret]
GO
/****** Object:  Default [DF__PCPRausen__Fecha__444BDFDA]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRausent] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [Fecha_ini]
GO
/****** Object:  Default [DF__PCPRausen__Fecha__45400413]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRausent] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [Fecha_fin]
GO
/****** Object:  Default [DF__PCPRausent__Dv__4634284C]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRausent] ADD  DEFAULT (' ') FOR [Dv]
GO
/****** Object:  Default [DF__PCPRausent__Jdd__47284C85]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRausent] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__PCPRausent__IDOT__481C70BE]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRausent] ADD  DEFAULT ((0)) FOR [IDOT]
GO
/****** Object:  Default [DF__PCPRausen__PCPEs__491094F7]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRausent] ADD  DEFAULT ((0)) FOR [PCPEstado]
GO
/****** Object:  Default [DF__PCPRausen__PCPEr__4A04B930]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRausent] ADD  DEFAULT (' ') FOR [PCPErrores]
GO
/****** Object:  Default [DF__PCPRausen__Linea__4AF8DD69]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRausent] ADD  DEFAULT ((0)) FOR [Linea_wfl]
GO
/****** Object:  Default [DF__PCPRausen__Etapa__4BED01A2]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRausent] ADD  DEFAULT ((0)) FOR [Etapa_wfl]
GO
/****** Object:  Default [DF__PCPRausen__Etasi__4CE125DB]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRausent] ADD  DEFAULT ((0)) FOR [Etasig_wfl]
GO
/****** Object:  Default [DF__PCPRausen__Orden__4DD54A14]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRausent] ADD  DEFAULT ((0)) FOR [Orden_wfl]
GO
/****** Object:  Default [DF__PCPRausen__Estad__4EC96E4D]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRausent] ADD  DEFAULT ((0)) FOR [Estado_wfl]
GO
/****** Object:  Default [DF__PCPRausen__User___4FBD9286]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRausent] ADD  DEFAULT (' ') FOR [User_wfl]
GO
/****** Object:  Default [DF__PCPRausen__Fecha__50B1B6BF]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRausent] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [Fecha_wfl]
GO
/****** Object:  Default [DF__PCPRausen__Obser__51A5DAF8]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPRausent] ADD  DEFAULT (' ') FOR [Obser_wfl]
GO
/****** Object:  Default [DF__PCPPLANT__Titulo__1506E10C]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPPLANT] ADD  DEFAULT (' ') FOR [Titulo]
GO
/****** Object:  Default [DF__PCPPLANT__Descri__15FB0545]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPPLANT] ADD  DEFAULT (' ') FOR [Descrip]
GO
/****** Object:  Default [DF__PCPPLANT__Tipo__16EF297E]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPPLANT] ADD  DEFAULT ((0)) FOR [Tipo]
GO
/****** Object:  Default [DF__PCPPLANT__Nompla__17E34DB7]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPPLANT] ADD  DEFAULT (' ') FOR [Nomplant]
GO
/****** Object:  Default [DF__PCPPLANT__Extens__18D771F0]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPPLANT] ADD  DEFAULT (' ') FOR [Extension]
GO
/****** Object:  Default [DF__PCPPLANT__Planti__19CB9629]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPPLANT] ADD  DEFAULT ((0)) FOR [Plantilla]
GO
/****** Object:  Default [DF__PCPPLANT__Usuari__1ABFBA62]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPPLANT] ADD  DEFAULT (' ') FOR [Usuario]
GO
/****** Object:  Default [DF__PCPPLANT__Fecha__1BB3DE9B]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPPLANT] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [Fecha]
GO
/****** Object:  Default [DF__PCPPLANT__Jdd__1CA802D4]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPPLANT] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__PCPPLANT__TieneP__4A6ECD84]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPPLANT] ADD  DEFAULT (' ') FOR [TienePlant]
GO
/****** Object:  Default [DF__PCPOT__Tipo__2449249C]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPOT] ADD  DEFAULT ((0)) FOR [Tipo]
GO
/****** Object:  Default [DF__PCPOT__Fecha__253D48D5]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPOT] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [Fecha]
GO
/****** Object:  Default [DF__PCPOT__Resumen__26316D0E]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPOT] ADD  DEFAULT (' ') FOR [Resumen]
GO
/****** Object:  Default [DF__PCPOT__Usuario__27259147]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPOT] ADD  DEFAULT (' ') FOR [Usuario]
GO
/****** Object:  Default [DF__PCPOT__Jdd__2819B580]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPOT] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__PCPOT__Perfil__290DD9B9]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPOT] ADD  DEFAULT (' ') FOR [Perfil]
GO
/****** Object:  Default [DF__PCPOT__Fecha_Env__2A01FDF2]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPOT] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [Fecha_Env]
GO
/****** Object:  Default [DF__PCPOT__Fecha_Rec__2AF6222B]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPOT] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [Fecha_Rec]
GO
/****** Object:  Default [DF__PCPOT__idItems__2BEA4664]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPOT] ADD  DEFAULT ((0)) FOR [idItems]
GO
/****** Object:  Default [DF__PCPNovF__Codigo__711E8651]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPNovF] ADD  DEFAULT (' ') FOR [Codigo]
GO
/****** Object:  Default [DF__PCPNovF__Nombre__7212AA8A]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPNovF] ADD  DEFAULT (' ') FOR [Nombre]
GO
/****** Object:  Default [DF__PCPNovF__Campo1__7306CEC3]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPNovF] ADD  DEFAULT (' ') FOR [Campo1]
GO
/****** Object:  Default [DF__PCPNovF__Valor1__73FAF2FC]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPNovF] ADD  DEFAULT (' ') FOR [Valor1]
GO
/****** Object:  Default [DF__PCPNovF__Campo2__74EF1735]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPNovF] ADD  DEFAULT (' ') FOR [Campo2]
GO
/****** Object:  Default [DF__PCPNovF__Valor2__75E33B6E]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPNovF] ADD  DEFAULT (' ') FOR [Valor2]
GO
/****** Object:  Default [DF__PCPNovF__Campo3__76D75FA7]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPNovF] ADD  DEFAULT (' ') FOR [Campo3]
GO
/****** Object:  Default [DF__PCPNovF__Valor3__77CB83E0]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPNovF] ADD  DEFAULT (' ') FOR [Valor3]
GO
/****** Object:  Default [DF__PCPNovF__Campo4__78BFA819]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPNovF] ADD  DEFAULT (' ') FOR [Campo4]
GO
/****** Object:  Default [DF__PCPNovF__Valor4__79B3CC52]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPNovF] ADD  DEFAULT (' ') FOR [Valor4]
GO
/****** Object:  Default [DF__PCPNovF__rt1__7AA7F08B]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPNovF] ADD  DEFAULT ((0)) FOR [rt1]
GO
/****** Object:  Default [DF__PCPNovF__rt2__7B9C14C4]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPNovF] ADD  DEFAULT ((0)) FOR [rt2]
GO
/****** Object:  Default [DF__PCPNovF__rt3__7C9038FD]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPNovF] ADD  DEFAULT ((0)) FOR [rt3]
GO
/****** Object:  Default [DF__PCPNovF__rt4__7D845D36]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPNovF] ADD  DEFAULT ((0)) FOR [rt4]
GO
/****** Object:  Default [DF__PCPNovF__Porc__7E78816F]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPNovF] ADD  DEFAULT ((0)) FOR [Porc]
GO
/****** Object:  Default [DF__PCPNovF__Jdd__7F6CA5A8]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPNovF] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__PCPNovF__IDOT__0060C9E1]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPNovF] ADD  DEFAULT ((0)) FOR [IDOT]
GO
/****** Object:  Default [DF__PCPNovF__PCPEsta__0154EE1A]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPNovF] ADD  DEFAULT ((0)) FOR [PCPEstado]
GO
/****** Object:  Default [DF__PCPNovF__PCPErro__02491253]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPNovF] ADD  DEFAULT (' ') FOR [PCPErrores]
GO
/****** Object:  Default [DF__PCPNovF__Linea_w__033D368C]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPNovF] ADD  DEFAULT ((0)) FOR [Linea_wfl]
GO
/****** Object:  Default [DF__PCPNovF__Etapa_w__04315AC5]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPNovF] ADD  DEFAULT ((0)) FOR [Etapa_wfl]
GO
/****** Object:  Default [DF__PCPNovF__Etasig___05257EFE]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPNovF] ADD  DEFAULT ((0)) FOR [Etasig_wfl]
GO
/****** Object:  Default [DF__PCPNovF__Orden_w__0619A337]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPNovF] ADD  DEFAULT ((0)) FOR [Orden_wfl]
GO
/****** Object:  Default [DF__PCPNovF__Estado___070DC770]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPNovF] ADD  DEFAULT ((0)) FOR [Estado_wfl]
GO
/****** Object:  Default [DF__PCPNovF__User_wf__0801EBA9]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPNovF] ADD  DEFAULT (' ') FOR [User_wfl]
GO
/****** Object:  Default [DF__PCPNovF__Fecha_w__08F60FE2]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPNovF] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [Fecha_wfl]
GO
/****** Object:  Default [DF__PCPNovF__Obser_w__09EA341B]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPNovF] ADD  DEFAULT (' ') FOR [Obser_wfl]
GO
/****** Object:  Default [DF__PCPNOVED__fecha__0E59E37D]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPNOVED] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [fecha]
GO
/****** Object:  Default [DF__PCPNOVED__juegod__0F4E07B6]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPNOVED] ADD  DEFAULT (' ') FOR [juegodatos]
GO
/****** Object:  Default [DF__PCPNOVED__idJdd__10422BEF]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPNOVED] ADD  DEFAULT ((0)) FOR [idJdd]
GO
/****** Object:  Default [DF__PCPNOVED__Tipo__11365028]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPNOVED] ADD  DEFAULT (' ') FOR [Tipo]
GO
/****** Object:  Default [DF__PCPNOVED__Jdd__122A7461]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPNOVED] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__PCPMENSES__idMen__73A5ED41]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPMENSEST] ADD  DEFAULT ((0)) FOR [idMensaje]
GO
/****** Object:  Default [DF__PCPMENSES__estad__749A117A]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPMENSEST] ADD  DEFAULT (' ') FOR [estado]
GO
/****** Object:  Default [DF__PCPMENSES__fecha__758E35B3]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPMENSEST] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [fecha]
GO
/****** Object:  Default [DF__PCPMENSES__usuar__768259EC]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPMENSEST] ADD  DEFAULT (' ') FOR [usuario]
GO
/****** Object:  Default [DF__PCPMENSEST__Jdd__77767E25]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPMENSEST] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__PCPMENSDE__idMen__664BF223]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPMENSDET] ADD  DEFAULT ((0)) FOR [idMensaje]
GO
/****** Object:  Default [DF__PCPMENSDE__Fecha__6740165C]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPMENSDET] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [Fecha]
GO
/****** Object:  Default [DF__PCPMENSDE__Cuerp__68343A95]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPMENSDET] ADD  DEFAULT (' ') FOR [Cuerpo]
GO
/****** Object:  Default [DF__PCPMENSDE__Usuar__69285ECE]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPMENSDET] ADD  DEFAULT (' ') FOR [Usuario]
GO
/****** Object:  Default [DF__PCPMENSDET__Jdd__6A1C8307]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPMENSDET] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__PCPMENSAJ__Usuar__609318CD]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPMENSAJ] ADD  DEFAULT (' ') FOR [Usuario]
GO
/****** Object:  Default [DF__PCPMENSAJ__tipo___61873D06]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPMENSAJ] ADD  DEFAULT ((0)) FOR [tipo_mensa]
GO
/****** Object:  Default [DF__PCPMENSAJ__asunt__627B613F]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPMENSAJ] ADD  DEFAULT (' ') FOR [asunto_men]
GO
/****** Object:  Default [DF__PCPMENSAJ__Jdd__636F8578]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPMENSAJ] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__PCPMENSAD__Secue__6CF8EFB2]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPMENSADJUN] ADD  DEFAULT ((0)) FOR [Secuen_Det]
GO
/****** Object:  Default [DF__PCPMENSAD__Docum__6DED13EB]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPMENSADJUN] ADD  DEFAULT ((0)) FOR [Docum]
GO
/****** Object:  Default [DF__PCPMENSAD__TipoA__6EE13824]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPMENSADJUN] ADD  DEFAULT (' ') FOR [TipoArch]
GO
/****** Object:  Default [DF__PCPMENSAD__Nombr__6FD55C5D]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPMENSADJUN] ADD  DEFAULT (' ') FOR [NombreArch]
GO
/****** Object:  Default [DF__PCPMENSADJU__Jdd__70C98096]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPMENSADJUN] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__PCPItemsD__IDPCP__36BCDA92]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPItemsD] ADD  DEFAULT ((0)) FOR [IDPCPitems]
GO
/****** Object:  Default [DF__PCPItemsD__Cohad__37B0FECB]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPItemsD] ADD  DEFAULT (' ') FOR [Cohade]
GO
/****** Object:  Default [DF__PCPItemsD__Nro__38A52304]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPItemsD] ADD  DEFAULT ((0)) FOR [Nro]
GO
/****** Object:  Default [DF__PCPItemsD__Titul__3999473D]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPItemsD] ADD  DEFAULT (' ') FOR [Titulo]
GO
/****** Object:  Default [DF__PCPItemsD__Cofor__3A8D6B76]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPItemsD] ADD  DEFAULT (' ') FOR [Coform]
GO
/****** Object:  Default [DF__PCPItemsD__Cuoto__3B818FAF]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPItemsD] ADD  DEFAULT ((0)) FOR [Cuotot]
GO
/****** Object:  Default [DF__PCPItemsD__Cuopa__3C75B3E8]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPItemsD] ADD  DEFAULT ((0)) FOR [Cuopar]
GO
/****** Object:  Default [DF__PCPItemsD__Fecha__3D69D821]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPItemsD] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [Fecha_ini]
GO
/****** Object:  Default [DF__PCPItemsD__Fecha__3E5DFC5A]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPItemsD] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [Fecha_fin]
GO
/****** Object:  Default [DF__PCPItemsD__Cenco__3F522093]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPItemsD] ADD  DEFAULT ((0)) FOR [Cencos]
GO
/****** Object:  Default [DF__PCPItemsD__Cuent__404644CC]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPItemsD] ADD  DEFAULT (' ') FOR [Cuenta]
GO
/****** Object:  Default [DF__PCPItemsD__Ticen__413A6905]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPItemsD] ADD  DEFAULT (' ') FOR [Ticen]
GO
/****** Object:  Default [DF__PCPItemsD__Obs__422E8D3E]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPItemsD] ADD  DEFAULT (' ') FOR [Obs]
GO
/****** Object:  Default [DF__PCPItemsD__Grupo__4322B177]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPItemsD] ADD  DEFAULT ((0)) FOR [Grupo]
GO
/****** Object:  Default [DF__PCPItemsD__Simes__4416D5B0]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPItemsD] ADD  DEFAULT (' ') FOR [Simes]
GO
/****** Object:  Default [DF__PCPItemsD__Codpr__450AF9E9]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPItemsD] ADD  DEFAULT ((0)) FOR [Codpres]
GO
/****** Object:  Default [DF__PCPItemsD__Propo__45FF1E22]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPItemsD] ADD  DEFAULT (' ') FOR [Propor]
GO
/****** Object:  Default [DF__PCPItemsD__Coins__46F3425B]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPItemsD] ADD  DEFAULT ((0)) FOR [Coinst]
GO
/****** Object:  Default [DF__PCPItemsD__PerIm__47E76694]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPItemsD] ADD  DEFAULT ((0)) FOR [PerImp]
GO
/****** Object:  Default [DF__PCPItemsD__Acumu__48DB8ACD]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPItemsD] ADD  DEFAULT ((0)) FOR [Acumu]
GO
/****** Object:  Default [DF__PCPItemsD__Maxim__49CFAF06]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPItemsD] ADD  DEFAULT ((0)) FOR [Maximo]
GO
/****** Object:  Default [DF__PCPItemsD__Tiacu__4AC3D33F]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPItemsD] ADD  DEFAULT (' ') FOR [Tiacu]
GO
/****** Object:  Default [DF__PCPItemsD__HNro__4BB7F778]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPItemsD] ADD  DEFAULT ((0)) FOR [HNro]
GO
/****** Object:  Default [DF__PCPItemsD__HCofo__4CAC1BB1]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPItemsD] ADD  DEFAULT ((0)) FOR [HCoform]
GO
/****** Object:  Default [DF__PCPItemsD__HCuot__4DA03FEA]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPItemsD] ADD  DEFAULT ((0)) FOR [HCuotot]
GO
/****** Object:  Default [DF__PCPItemsD__HCuop__4E946423]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPItemsD] ADD  DEFAULT ((0)) FOR [HCuopar]
GO
/****** Object:  Default [DF__PCPItemsD__HFech__4F88885C]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPItemsD] ADD  DEFAULT ((0)) FOR [HFecha_ini]
GO
/****** Object:  Default [DF__PCPItemsD__HFech__507CAC95]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPItemsD] ADD  DEFAULT ((0)) FOR [HFecha_fin]
GO
/****** Object:  Default [DF__PCPItemsD__HCenc__5170D0CE]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPItemsD] ADD  DEFAULT ((0)) FOR [HCencos]
GO
/****** Object:  Default [DF__PCPItemsD__HCuen__5264F507]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPItemsD] ADD  DEFAULT ((0)) FOR [HCuenta]
GO
/****** Object:  Default [DF__PCPItemsD__HTice__53591940]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPItemsD] ADD  DEFAULT ((0)) FOR [HTicen]
GO
/****** Object:  Default [DF__PCPItemsD__HObs__544D3D79]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPItemsD] ADD  DEFAULT ((0)) FOR [HObs]
GO
/****** Object:  Default [DF__PCPItemsD__HGrup__554161B2]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPItemsD] ADD  DEFAULT ((0)) FOR [HGrupo]
GO
/****** Object:  Default [DF__PCPItemsD__HSime__563585EB]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPItemsD] ADD  DEFAULT ((0)) FOR [HSimes]
GO
/****** Object:  Default [DF__PCPItemsD__HCodp__5729AA24]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPItemsD] ADD  DEFAULT ((0)) FOR [HCodpres]
GO
/****** Object:  Default [DF__PCPItemsD__HProp__581DCE5D]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPItemsD] ADD  DEFAULT ((0)) FOR [HPropor]
GO
/****** Object:  Default [DF__PCPItemsD__HCoin__5911F296]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPItemsD] ADD  DEFAULT ((0)) FOR [HCoinst]
GO
/****** Object:  Default [DF__PCPItemsD__HPerI__5A0616CF]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPItemsD] ADD  DEFAULT ((0)) FOR [HPerImp]
GO
/****** Object:  Default [DF__PCPItemsD__HAcum__5AFA3B08]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPItemsD] ADD  DEFAULT ((0)) FOR [HAcumu]
GO
/****** Object:  Default [DF__PCPItemsD__HTiac__5BEE5F41]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPItemsD] ADD  DEFAULT ((0)) FOR [HTiacu]
GO
/****** Object:  Default [DF__PCPItemsD__Jdd__5CE2837A]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPItemsD] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__PCPItems__Descri__5FBEF025]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPItems] ADD  DEFAULT (' ') FOR [Descrip]
GO
/****** Object:  Default [DF__PCPItems__Jdd__60B3145E]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPItems] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__PCPItems__Usuari__61A73897]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPItems] ADD  DEFAULT (' ') FOR [UsuarioC]
GO
/****** Object:  Default [DF__PCPItems__FechaC__629B5CD0]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPItems] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [FechaC]
GO
/****** Object:  Default [DF__PCPItems__Usuari__638F8109]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPItems] ADD  DEFAULT (' ') FOR [UsuarioM]
GO
/****** Object:  Default [DF__PCPItems__FechaM__6483A542]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPItems] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [FechaM]
GO
/****** Object:  Default [DF__PCPItems__Perfil__6577C97B]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPItems] ADD  DEFAULT (' ') FOR [Perfiles]
GO
/****** Object:  Default [DF__pcpestad__Activi__3B61941E]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[pcpestad] ADD  DEFAULT ((0)) FOR [Actividad]
GO
/****** Object:  Default [DF__pcpestad__Fteori__3C55B857]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[pcpestad] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [Fteorica]
GO
/****** Object:  Default [DF__pcpestad__Act_de__3D49DC90]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[pcpestad] ADD  DEFAULT (' ') FOR [Act_desc]
GO
/****** Object:  Default [DF__pcpestad__Freal__3E3E00C9]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[pcpestad] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [Freal]
GO
/****** Object:  Default [DF__pcpestad__Atraso__3F322502]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[pcpestad] ADD  DEFAULT ((0)) FOR [Atraso]
GO
/****** Object:  Default [DF__pcpestad__Ames__4026493B]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[pcpestad] ADD  DEFAULT (' ') FOR [Ames]
GO
/****** Object:  Default [DF__pcpestad__status__411A6D74]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[pcpestad] ADD  DEFAULT ((0)) FOR [status]
GO
/****** Object:  Default [DF__pcpestad__Respon__420E91AD]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[pcpestad] ADD  DEFAULT (' ') FOR [Responsab]
GO
/****** Object:  Default [DF__pcpestad__Status__4302B5E6]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[pcpestad] ADD  DEFAULT (' ') FOR [Status1]
GO
/****** Object:  Default [DF__pcpestad__Status__43F6DA1F]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[pcpestad] ADD  DEFAULT (' ') FOR [Status2]
GO
/****** Object:  Default [DF__pcpestad__Grupo__44EAFE58]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[pcpestad] ADD  DEFAULT ((0)) FOR [Grupo]
GO
/****** Object:  Default [DF__pcpestad__Grupo___45DF2291]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[pcpestad] ADD  DEFAULT (' ') FOR [Grupo_desc]
GO
/****** Object:  Default [DF__pcpestad__Subger__46D346CA]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[pcpestad] ADD  DEFAULT (' ') FOR [Subgeren]
GO
/****** Object:  Default [DF__pcpestad__Gerenc__47C76B03]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[pcpestad] ADD  DEFAULT (' ') FOR [Gerencia]
GO
/****** Object:  Default [DF__pcpestad__Idjdd__48BB8F3C]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[pcpestad] ADD  DEFAULT (' ') FOR [Idjdd]
GO
/****** Object:  Default [DF__pcpestad__Idjdd___49AFB375]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[pcpestad] ADD  DEFAULT (' ') FOR [Idjdd_desc]
GO
/****** Object:  Default [DF__pcpestad__Idclie__4AA3D7AE]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[pcpestad] ADD  DEFAULT ((0)) FOR [Idcliente]
GO
/****** Object:  Default [DF__pcpestad__Client__4B97FBE7]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[pcpestad] ADD  DEFAULT (' ') FOR [Cliente]
GO
/****** Object:  Default [DF__pcpestad__jdd__4C8C2020]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[pcpestad] ADD  DEFAULT ((0)) FOR [jdd]
GO
/****** Object:  Default [DF__pcperrpro__Idest__1F846F7F]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[pcperrpro] ADD  DEFAULT ((0)) FOR [Idestado]
GO
/****** Object:  Default [DF__pcperrpro__Descr__207893B8]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[pcperrpro] ADD  DEFAULT (' ') FOR [Descrip]
GO
/****** Object:  Default [DF__pcperrpro__jdd__216CB7F1]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[pcperrpro] ADD  DEFAULT ((0)) FOR [jdd]
GO
/****** Object:  Default [DF__PCPComisi__Ames__0CC6A0C6]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPComisi] ADD  DEFAULT (' ') FOR [Ames]
GO
/****** Object:  Default [DF__PCPComisi__Peri__0DBAC4FF]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPComisi] ADD  DEFAULT (' ') FOR [Peri]
GO
/****** Object:  Default [DF__PCPComisi__Codig__0EAEE938]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPComisi] ADD  DEFAULT (' ') FOR [Codigo]
GO
/****** Object:  Default [DF__PCPComisi__Nombr__0FA30D71]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPComisi] ADD  DEFAULT (' ') FOR [Nombre]
GO
/****** Object:  Default [DF__PCPComisi__Cohad__109731AA]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPComisi] ADD  DEFAULT (' ') FOR [Cohade]
GO
/****** Object:  Default [DF__PCPComisi__Numer__118B55E3]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPComisi] ADD  DEFAULT ((0)) FOR [Numero]
GO
/****** Object:  Default [DF__PCPComisi__Valor__127F7A1C]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPComisi] ADD  DEFAULT ((0)) FOR [Valor1]
GO
/****** Object:  Default [DF__PCPComisi__Valor__13739E55]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPComisi] ADD  DEFAULT ((0)) FOR [Valor2]
GO
/****** Object:  Default [DF__PCPComisi__Valor__1467C28E]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPComisi] ADD  DEFAULT ((0)) FOR [Valor3]
GO
/****** Object:  Default [DF__PCPComisi__Valor__155BE6C7]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPComisi] ADD  DEFAULT ((0)) FOR [Valor4]
GO
/****** Object:  Default [DF__PCPComisi__Campo__16500B00]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPComisi] ADD  DEFAULT (' ') FOR [Campo1]
GO
/****** Object:  Default [DF__PCPComisi__Campo__17442F39]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPComisi] ADD  DEFAULT (' ') FOR [Campo2]
GO
/****** Object:  Default [DF__PCPComisi__Campo__18385372]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPComisi] ADD  DEFAULT (' ') FOR [Campo3]
GO
/****** Object:  Default [DF__PCPComisi__Campo__192C77AB]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPComisi] ADD  DEFAULT (' ') FOR [Campo4]
GO
/****** Object:  Default [DF__PCPComisi__Largo__1A209BE4]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPComisi] ADD  DEFAULT (' ') FOR [Largo1]
GO
/****** Object:  Default [DF__PCPComisi__Largo__1B14C01D]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPComisi] ADD  DEFAULT (' ') FOR [Largo2]
GO
/****** Object:  Default [DF__PCPComisi__Jdd__1C08E456]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPComisi] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__PCPComisi__IDOT__1CFD088F]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPComisi] ADD  DEFAULT ((0)) FOR [IDOT]
GO
/****** Object:  Default [DF__PCPComisi__PCPEs__1DF12CC8]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPComisi] ADD  DEFAULT ((0)) FOR [PCPEstado]
GO
/****** Object:  Default [DF__PCPComisi__PCPEr__1EE55101]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPComisi] ADD  DEFAULT (' ') FOR [PCPErrores]
GO
/****** Object:  Default [DF__PCPComisi__Linea__1FD9753A]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPComisi] ADD  DEFAULT ((0)) FOR [Linea_wfl]
GO
/****** Object:  Default [DF__PCPComisi__Etapa__20CD9973]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPComisi] ADD  DEFAULT ((0)) FOR [Etapa_wfl]
GO
/****** Object:  Default [DF__PCPComisi__Etasi__21C1BDAC]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPComisi] ADD  DEFAULT ((0)) FOR [Etasig_wfl]
GO
/****** Object:  Default [DF__PCPComisi__Orden__22B5E1E5]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPComisi] ADD  DEFAULT ((0)) FOR [Orden_wfl]
GO
/****** Object:  Default [DF__PCPComisi__Estad__23AA061E]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPComisi] ADD  DEFAULT ((0)) FOR [Estado_wfl]
GO
/****** Object:  Default [DF__PCPComisi__User___249E2A57]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPComisi] ADD  DEFAULT (' ') FOR [User_wfl]
GO
/****** Object:  Default [DF__PCPComisi__Fecha__25924E90]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPComisi] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [Fecha_wfl]
GO
/****** Object:  Default [DF__PCPComisi__Obser__268672C9]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPComisi] ADD  DEFAULT (' ') FOR [Obser_wfl]
GO
/****** Object:  Default [DF__PCPCARGES__idCar__59E61B3E]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPCARGEST] ADD  DEFAULT ((0)) FOR [idCarga]
GO
/****** Object:  Default [DF__PCPCARGES__Estad__5ADA3F77]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPCARGEST] ADD  DEFAULT ((0)) FOR [Estado]
GO
/****** Object:  Default [DF__PCPCARGES__Fecha__5BCE63B0]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPCARGEST] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [Fecha]
GO
/****** Object:  Default [DF__PCPCARGES__Usuar__5CC287E9]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPCARGEST] ADD  DEFAULT (' ') FOR [Usuario]
GO
/****** Object:  Default [DF__PCPCARGEST__Jdd__5DB6AC22]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPCARGEST] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__PCPCARGAS__fecha__4F688CCB]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPCARGAS] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [fecha]
GO
/****** Object:  Default [DF__PCPCARGAS__Usuar__505CB104]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPCARGAS] ADD  DEFAULT (' ') FOR [Usuario]
GO
/****** Object:  Default [DF__PCPCARGAS__Titul__5150D53D]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPCARGAS] ADD  DEFAULT (' ') FOR [Titulo]
GO
/****** Object:  Default [DF__PCPCARGAS__Descr__5244F976]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPCARGAS] ADD  DEFAULT (' ') FOR [Descrip]
GO
/****** Object:  Default [DF__PCPCARGAS__Tipo__53391DAF]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPCARGAS] ADD  DEFAULT ((0)) FOR [Tipo]
GO
/****** Object:  Default [DF__PCPCARGAS__Archi__542D41E8]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPCARGAS] ADD  DEFAULT ((0)) FOR [Archivo]
GO
/****** Object:  Default [DF__PCPCARGAS__nomAr__55216621]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPCARGAS] ADD  DEFAULT (' ') FOR [nomArch]
GO
/****** Object:  Default [DF__PCPCARGAS__extAr__56158A5A]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPCARGAS] ADD  DEFAULT (' ') FOR [extArch]
GO
/****** Object:  Default [DF__PCPCARGAS__Jdd__5709AE93]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPCARGAS] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__PCPCALHIS__activ__04D07943]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPCALHIST] ADD  DEFAULT ((0)) FOR [actividad]
GO
/****** Object:  Default [DF__PCPCALHIST__anio__05C49D7C]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPCALHIST] ADD  DEFAULT ((0)) FOR [anio]
GO
/****** Object:  Default [DF__PCPCALHIST__mes__06B8C1B5]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPCALHIST] ADD  DEFAULT ((0)) FOR [mes]
GO
/****** Object:  Default [DF__PCPCALHIS__fteor__07ACE5EE]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPCALHIST] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [fteorica]
GO
/****** Object:  Default [DF__PCPCALHIS__aprob__08A10A27]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPCALHIST] ADD  DEFAULT (' ') FOR [aprobada]
GO
/****** Object:  Default [DF__PCPCALHIS__usuar__09952E60]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPCALHIST] ADD  DEFAULT (' ') FOR [usuario]
GO
/****** Object:  Default [DF__PCPCALHIS__fecha__0A895299]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPCALHIST] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [fecha]
GO
/****** Object:  Default [DF__PCPCALHIST__Jdd__0B7D76D2]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPCALHIST] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__PCPCALEND__activ__7A52EAD0]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPCALENDAR] ADD  DEFAULT ((0)) FOR [actividad]
GO
/****** Object:  Default [DF__PCPCALEND__fteor__7B470F09]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPCALENDAR] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [fteorica]
GO
/****** Object:  Default [DF__PCPCALEND__freal__7C3B3342]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPCALENDAR] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [freal]
GO
/****** Object:  Default [DF__PCPCALENDA__anio__7D2F577B]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPCALENDAR] ADD  DEFAULT ((0)) FOR [anio]
GO
/****** Object:  Default [DF__PCPCALENDAR__mes__7E237BB4]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPCALENDAR] ADD  DEFAULT ((0)) FOR [mes]
GO
/****** Object:  Default [DF__PCPCALEND__termi__7F179FED]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPCALENDAR] ADD  DEFAULT (' ') FOR [terminada]
GO
/****** Object:  Default [DF__PCPCALEND__statu__000BC426]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPCALENDAR] ADD  DEFAULT (' ') FOR [status]
GO
/****** Object:  Default [DF__PCPCALENDAR__KPI__00FFE85F]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPCALENDAR] ADD  DEFAULT (' ') FOR [KPI]
GO
/****** Object:  Default [DF__PCPCALENDAR__Jdd__01F40C98]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[PCPCALENDAR] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__Tbrhuids__tabla__3064E2BE]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Tbrhuids] ADD  DEFAULT (' ') FOR [tabla]
GO
/****** Object:  Default [DF__Tbrhuids__LastID__315906F7]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Tbrhuids] ADD  DEFAULT ((0)) FOR [LastID]
GO
/****** Object:  Default [DF__Tbrhuids__Jdd__324D2B30]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Tbrhuids] ADD  DEFAULT ((0)) FOR [Jdd]
GO
--/****** Object:  Default [DF__tbrhucat__catmod__4944D3CA]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[tbrhucat] ADD  DEFAULT (' ') FOR [catmodulo]
--GO
--/****** Object:  Default [DF__tbrhucat__catnom__4A38F803]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[tbrhucat] ADD  DEFAULT (' ') FOR [catnombre]
--GO
--/****** Object:  Default [DF__tbrhucat__catcap__4B2D1C3C]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[tbrhucat] ADD  DEFAULT (' ') FOR [catcaption]
--GO
--/****** Object:  Default [DF__tbrhucat__catdes__4C214075]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[tbrhucat] ADD  DEFAULT (' ') FOR [catdescrip]
--GO
--/****** Object:  Default [DF__tbrhucat__catfor__4D1564AE]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[tbrhucat] ADD  DEFAULT (' ') FOR [catform]
--GO
--/****** Object:  Default [DF__tbrhucat__catori__4E0988E7]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[tbrhucat] ADD  DEFAULT (' ') FOR [catoricap]
--GO
--/****** Object:  Default [DF__tbrhucat__catori__4EFDAD20]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[tbrhucat] ADD  DEFAULT (' ') FOR [catorides]
--GO
/****** Object:  Default [DF__Tbporvdp__VDPCOD__4A59BEEB]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Tbporvdp] ADD  DEFAULT ((0)) FOR [VDPCODCGO]
GO
/****** Object:  Default [DF__Tbporvdp__VDPCOD__4B4DE324]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Tbporvdp] ADD  DEFAULT ((0)) FOR [VDPCODVDP]
GO
/****** Object:  Default [DF__Tbporvdp__VDPVAL__4C42075D]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Tbporvdp] ADD  DEFAULT ((0)) FOR [VDPVALOR]
GO
/****** Object:  Default [DF__Tbporvdp__VDPSEN__4D362B96]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Tbporvdp] ADD  DEFAULT ((0)) FOR [VDPSENSIB]
GO
/****** Object:  Default [DF__Tbporvdp__Jdd__4E2A4FCF]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Tbporvdp] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__Tbporrsa__ID__1D520E4A]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Tbporrsa] ADD  DEFAULT ((0)) FOR [ID]
GO
/****** Object:  Default [DF__Tbporrsa__CODCAT__1E463283]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Tbporrsa] ADD  DEFAULT ((0)) FOR [CODCAT]
GO
/****** Object:  Default [DF__Tbporrsa__perc25__1F3A56BC]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Tbporrsa] ADD  DEFAULT ((0)) FOR [perc25]
GO
/****** Object:  Default [DF__Tbporrsa__perc50__202E7AF5]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Tbporrsa] ADD  DEFAULT ((0)) FOR [perc50]
GO
/****** Object:  Default [DF__Tbporrsa__perc75__21229F2E]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Tbporrsa] ADD  DEFAULT ((0)) FOR [perc75]
GO
/****** Object:  Default [DF__Tbporrsa__fecha__2216C367]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Tbporrsa] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [fecha]
GO
/****** Object:  Default [DF__Tbporrsa__pmedio__230AE7A0]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Tbporrsa] ADD  DEFAULT ((0)) FOR [pmedio]
GO
/****** Object:  Default [DF__Tbporrsa__porcen__23FF0BD9]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Tbporrsa] ADD  DEFAULT ((0)) FOR [porcen1]
GO
/****** Object:  Default [DF__Tbporrsa__porcen__24F33012]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Tbporrsa] ADD  DEFAULT ((0)) FOR [porcen2]
GO
/****** Object:  Default [DF__Tbporrsa__CODCAT__25E7544B]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Tbporrsa] ADD  DEFAULT ((0)) FOR [CODCATANT]
GO
/****** Object:  Default [DF__Tbporrsa__Jdd__26DB7884]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Tbporrsa] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__Tbporrec__reccod__7CE53EB8]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Tbporrec] ADD  DEFAULT ((0)) FOR [reccodcgo]
GO
/****** Object:  Default [DF__Tbporrec__reccod__7DD962F1]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Tbporrec] ADD  DEFAULT ((0)) FOR [reccodigo]
GO
/****** Object:  Default [DF__Tbporrec__recpor__7ECD872A]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Tbporrec] ADD  DEFAULT ((0)) FOR [recporcent]
GO
/****** Object:  Default [DF__Tbporrec__rectex__7FC1AB63]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Tbporrec] ADD  DEFAULT ((0)) FOR [rectexclu]
GO
/****** Object:  Default [DF__Tbporrec__rechab__00B5CF9C]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Tbporrec] ADD  DEFAULT ((0)) FOR [rechabilit]
GO
/****** Object:  Default [DF__Tbporrec__recdes__01A9F3D5]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Tbporrec] ADD  DEFAULT (' ') FOR [recdescrip]
GO
/****** Object:  Default [DF__Tbporrec__reccon__029E180E]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Tbporrec] ADD  DEFAULT (' ') FOR [reccondic]
GO
/****** Object:  Default [DF__Tbporrec__recdes__03923C47]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Tbporrec] ADD  DEFAULT (' ') FOR [recdescad]
GO
/****** Object:  Default [DF__Tbporrec__rectip__04866080]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Tbporrec] ADD  DEFAULT ((0)) FOR [rectipo]
GO
/****** Object:  Default [DF__Tbporrec__recver__057A84B9]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Tbporrec] ADD  DEFAULT ((0)) FOR [recver]
GO
/****** Object:  Default [DF__Tbporrec__Jdd__066EA8F2]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Tbporrec] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__Tbporrdp__RDPCOD__42B89D23]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Tbporrdp] ADD  DEFAULT ((0)) FOR [RDPCODCGO]
GO
/****** Object:  Default [DF__Tbporrdp__RDPTIP__43ACC15C]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Tbporrdp] ADD  DEFAULT ((0)) FOR [RDPTIPOCON]
GO
/****** Object:  Default [DF__Tbporrdp__RDPPER__44A0E595]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Tbporrdp] ADD  DEFAULT ((0)) FOR [RDPPERIOD]
GO
/****** Object:  Default [DF__Tbporrdp__RDPARE__459509CE]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Tbporrdp] ADD  DEFAULT (' ') FOR [RDPAREA]
GO
/****** Object:  Default [DF__Tbporrdp__RDPMOT__46892E07]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Tbporrdp] ADD  DEFAULT (' ') FOR [RDPMOTIVO]
GO
/****** Object:  Default [DF__Tbporrdp__Jdd__477D5240]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Tbporrdp] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__Tbporrca__ID__16A510BB]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Tbporrca] ADD  DEFAULT ((0)) FOR [ID]
GO
/****** Object:  Default [DF__Tbporrca__CODCAT__179934F4]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Tbporrca] ADD  DEFAULT ((0)) FOR [CODCAT]
GO
/****** Object:  Default [DF__Tbporrca__MINIMO__188D592D]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Tbporrca] ADD  DEFAULT ((0)) FOR [MINIMO]
GO
/****** Object:  Default [DF__Tbporrca__MAXIMO__19817D66]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Tbporrca] ADD  DEFAULT ((0)) FOR [MAXIMO]
GO
/****** Object:  Default [DF__Tbporrca__Jdd__1A75A19F]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Tbporrca] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__Tbporpun__ID__29B7E52F]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Tbporpun] ADD  DEFAULT ((0)) FOR [ID]
GO
/****** Object:  Default [DF__Tbporpun__GRADO__2AAC0968]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Tbporpun] ADD  DEFAULT ((0)) FOR [GRADO]
GO
/****** Object:  Default [DF__Tbporpun__FACTOR__2BA02DA1]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Tbporpun] ADD  DEFAULT ((0)) FOR [FACTOR]
GO
/****** Object:  Default [DF__Tbporpun__PUNTAJ__2C9451DA]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Tbporpun] ADD  DEFAULT ((0)) FOR [PUNTAJE]
GO
/****** Object:  Default [DF__Tbporpun__Jdd__2D887613]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Tbporpun] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__Tbporexa__exacod__5C786F26]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Tbporexa] ADD  DEFAULT ((0)) FOR [exacodcgo]
GO
/****** Object:  Default [DF__Tbporexa__exacod__5D6C935F]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Tbporexa] ADD  DEFAULT ((0)) FOR [exacodigo]
GO
/****** Object:  Default [DF__Tbporexa__exaapl__5E60B798]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Tbporexa] ADD  DEFAULT ((0)) FOR [exaaplica]
GO
/****** Object:  Default [DF__Tbporexa__exapor__5F54DBD1]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Tbporexa] ADD  DEFAULT ((0)) FOR [exaporcent]
GO
/****** Object:  Default [DF__Tbporexa__exafin__6049000A]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Tbporexa] ADD  DEFAULT ((0)) FOR [exafin]
GO
/****** Object:  Default [DF__Tbporexa__exaper__613D2443]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Tbporexa] ADD  DEFAULT ((0)) FOR [exaperio]
GO
/****** Object:  Default [DF__Tbporexa__exaord__6231487C]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Tbporexa] ADD  DEFAULT ((0)) FOR [exaorden]
GO
/****** Object:  Default [DF__Tbporexa__Jdd__63256CB5]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Tbporexa] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__Tbpordto__DTOCOD__383B0EB0]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Tbpordto] ADD  DEFAULT ((0)) FOR [DTOCODCGO]
GO
/****** Object:  Default [DF__Tbpordto__DTOID__392F32E9]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Tbpordto] ADD  DEFAULT ((0)) FOR [DTOID]
GO
/****** Object:  Default [DF__Tbpordto__DTOTAR__3A235722]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Tbpordto] ADD  DEFAULT (' ') FOR [DTOTAREA]
GO
/****** Object:  Default [DF__Tbpordto__DTOOBJ__3B177B5B]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Tbpordto] ADD  DEFAULT (' ') FOR [DTOOBJETI]
GO
/****** Object:  Default [DF__Tbpordto__DTONRO__3C0B9F94]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Tbpordto] ADD  DEFAULT ((0)) FOR [DTONRO]
GO
/****** Object:  Default [DF__Tbpordto__EVALUA__3CFFC3CD]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Tbpordto] ADD  DEFAULT ((0)) FOR [EVALUA]
GO
/****** Object:  Default [DF__Tbpordto__GRADOS__3DF3E806]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Tbpordto] ADD  DEFAULT ((0)) FOR [GRADOS]
GO
/****** Object:  Default [DF__Tbpordto__CALIFI__3EE80C3F]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Tbpordto] ADD  DEFAULT (' ') FOR [CALIFIC]
GO
/****** Object:  Default [DF__Tbpordto__Jdd__3FDC3078]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Tbpordto] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__Tbpordoc__CGOCOD__5106BC7A]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Tbpordoc] ADD  DEFAULT ((0)) FOR [CGOCODIGO]
GO
/****** Object:  Default [DF__Tbpordoc__Fecha___51FAE0B3]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Tbpordoc] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [Fecha_doc]
GO
/****** Object:  Default [DF__Tbpordoc__Tipo__52EF04EC]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Tbpordoc] ADD  DEFAULT ((0)) FOR [Tipo]
GO
/****** Object:  Default [DF__Tbpordoc__Descri__53E32925]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Tbpordoc] ADD  DEFAULT (' ') FOR [Descrip]
GO
/****** Object:  Default [DF__Tbpordoc__Nombre__54D74D5E]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Tbpordoc] ADD  DEFAULT (' ') FOR [Nombre]
GO
/****** Object:  Default [DF__Tbpordoc__Fecha___55CB7197]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Tbpordoc] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [Fecha_car]
GO
/****** Object:  Default [DF__Tbpordoc__Elemen__56BF95D0]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Tbpordoc] ADD  DEFAULT ((0)) FOR [Elemento]
GO
/****** Object:  Default [DF__Tbpordoc__Dire__57B3BA09]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Tbpordoc] ADD  DEFAULT (' ') FOR [Dire]
GO
/****** Object:  Default [DF__Tbpordoc__Dtipo__58A7DE42]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Tbpordoc] ADD  DEFAULT (' ') FOR [Dtipo]
GO
/****** Object:  Default [DF__Tbpordoc__Jdd__599C027B]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Tbpordoc] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__Tbpordmp__DMPCOD__10EC3765]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Tbpordmp] ADD  DEFAULT ((0)) FOR [DMPCODCGO]
GO
/****** Object:  Default [DF__Tbpordmp__DMPCAR__11E05B9E]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Tbpordmp] ADD  DEFAULT ((0)) FOR [DMPCAREXT]
GO
/****** Object:  Default [DF__Tbpordmp__DMPREM__12D47FD7]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Tbpordmp] ADD  DEFAULT ((0)) FOR [DMPREMEMP]
GO
/****** Object:  Default [DF__Tbpordmp__Jdd__13C8A410]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Tbpordmp] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__Tbporcom__comcar__7267B045]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Tbporcom] ADD  DEFAULT ((0)) FOR [comcargo]
GO
/****** Object:  Default [DF__Tbporcom__comcod__735BD47E]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Tbporcom] ADD  DEFAULT (' ') FOR [comcodfac]
GO
/****** Object:  Default [DF__Tbporcom__comcod__744FF8B7]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Tbporcom] ADD  DEFAULT (' ') FOR [comcodsfa]
GO
/****** Object:  Default [DF__Tbporcom__comcod__75441CF0]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Tbporcom] ADD  DEFAULT ((0)) FOR [comcodgrd]
GO
/****** Object:  Default [DF__Tbporcom__comdes__76384129]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Tbporcom] ADD  DEFAULT (' ') FOR [comdescrip]
GO
/****** Object:  Default [DF__Tbporcom__comhab__772C6562]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Tbporcom] ADD  DEFAULT ((0)) FOR [comhabilit]
GO
/****** Object:  Default [DF__Tbporcom__comexc__7820899B]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Tbporcom] ADD  DEFAULT ((0)) FOR [comexclu]
GO
/****** Object:  Default [DF__Tbporcom__compes__7914ADD4]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Tbporcom] ADD  DEFAULT ((0)) FOR [compesorel]
GO
/****** Object:  Default [DF__Tbporcom__Jdd__7A08D20D]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Tbporcom] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__Tbporcgo__cgocod__06A3B31C]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Tbporcgo] ADD  DEFAULT ((0)) FOR [cgocodigo]
GO
/****** Object:  Default [DF__Tbporcgo__cgoniv__0797D755]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Tbporcgo] ADD  DEFAULT ((0)) FOR [cgonivjer]
GO
/****** Object:  Default [DF__Tbporcgo__cgoesc__088BFB8E]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Tbporcgo] ADD  DEFAULT ((0)) FOR [cgoescalaf]
GO
/****** Object:  Default [DF__Tbporcgo__cgopje__09801FC7]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Tbporcgo] ADD  DEFAULT ((0)) FOR [cgopjeeval]
GO
/****** Object:  Default [DF__Tbporcgo__cgogra__0A744400]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Tbporcgo] ADD  DEFAULT (' ') FOR [cgogrado]
GO
/****** Object:  Default [DF__Tbporcgo__cgosta__0B686839]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Tbporcgo] ADD  DEFAULT ((0)) FOR [cgostaff]
GO
/****** Object:  Default [DF__Tbporcgo__cgosup__0C5C8C72]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Tbporcgo] ADD  DEFAULT ((0)) FOR [cgosuperv]
GO
/****** Object:  Default [DF__Tbporcgo__cgofmt__0D50B0AB]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Tbporcgo] ADD  DEFAULT (' ') FOR [cgofmteval]
GO
/****** Object:  Default [DF__Tbporcgo__cgocar__0E44D4E4]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Tbporcgo] ADD  DEFAULT ((0)) FOR [cgocardes]
GO
/****** Object:  Default [DF__Tbporcgo__cgotip__0F38F91D]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Tbporcgo] ADD  DEFAULT ((0)) FOR [cgotipodes]
GO
/****** Object:  Default [DF__Tbporcgo__cgofec__102D1D56]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Tbporcgo] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [cgofecdesc]
GO
/****** Object:  Default [DF__Tbporcgo__cgotip__1121418F]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Tbporcgo] ADD  DEFAULT ((0)) FOR [cgotipo]
GO
/****** Object:  Default [DF__Tbporcgo__cgodes__121565C8]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Tbporcgo] ADD  DEFAULT ((0)) FOR [cgodesctor]
GO
/****** Object:  Default [DF__Tbporcgo__cgoobj__13098A01]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Tbporcgo] ADD  DEFAULT (' ') FOR [cgoobjetiv]
GO
/****** Object:  Default [DF__Tbporcgo__cgoptj__13FDAE3A]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Tbporcgo] ADD  DEFAULT ((0)) FOR [cgoptjeval]
GO
/****** Object:  Default [DF__Tbporcgo__cgotip__14F1D273]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Tbporcgo] ADD  DEFAULT ((0)) FOR [cgotipctr]
GO
/****** Object:  Default [DF__Tbporcgo__cgodur__15E5F6AC]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Tbporcgo] ADD  DEFAULT ((0)) FOR [cgodurctr]
GO
/****** Object:  Default [DF__Tbporcgo__cgotip__16DA1AE5]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Tbporcgo] ADD  DEFAULT ((0)) FOR [cgotiprem]
GO
/****** Object:  Default [DF__Tbporcgo__cgohor__17CE3F1E]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Tbporcgo] ADD  DEFAULT ((0)) FOR [cgohorario]
GO
/****** Object:  Default [DF__Tbporcgo__cgomer__18C26357]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Tbporcgo] ADD  DEFAULT ((0)) FOR [cgomercado]
GO
/****** Object:  Default [DF__Tbporcgo__cgofac__19B68790]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Tbporcgo] ADD  DEFAULT ((0)) FOR [cgofactor]
GO
/****** Object:  Default [DF__Tbporcgo__cgofun__1AAAABC9]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Tbporcgo] ADD  DEFAULT (' ') FOR [cgofuncion]
GO
/****** Object:  Default [DF__Tbporcgo__cgogrd__1B9ED002]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Tbporcgo] ADD  DEFAULT ((0)) FOR [cgogrd]
GO
/****** Object:  Default [DF__Tbporcgo__cgocla__1C92F43B]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Tbporcgo] ADD  DEFAULT ((0)) FOR [cgoclase]
GO
/****** Object:  Default [DF__Tbporcgo__cgoamb__1D871874]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Tbporcgo] ADD  DEFAULT (' ') FOR [cgoamb_la]
GO
/****** Object:  Default [DF__Tbporcgo__cgodat__1E7B3CAD]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Tbporcgo] ADD  DEFAULT (' ') FOR [cgodatosad]
GO
/****** Object:  Default [DF__Tbporcgo__cgoben__1F6F60E6]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Tbporcgo] ADD  DEFAULT ((0)) FOR [cgobenefi1]
GO
/****** Object:  Default [DF__Tbporcgo__cgoben__2063851F]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Tbporcgo] ADD  DEFAULT ((0)) FOR [cgobenefi2]
GO
/****** Object:  Default [DF__Tbporcgo__cgoben__2157A958]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Tbporcgo] ADD  DEFAULT ((0)) FOR [cgobenefi3]
GO
/****** Object:  Default [DF__Tbporcgo__cgoben__224BCD91]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Tbporcgo] ADD  DEFAULT ((0)) FOR [cgobenefi4]
GO
/****** Object:  Default [DF__Tbporcgo__cgoben__233FF1CA]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Tbporcgo] ADD  DEFAULT ((0)) FOR [cgobenefi5]
GO
/****** Object:  Default [DF__Tbporcgo__cgoinc__24341603]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Tbporcgo] ADD  DEFAULT ((0)) FOR [cgoincon]
GO
/****** Object:  Default [DF__Tbporcgo__cgocen__25283A3C]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Tbporcgo] ADD  DEFAULT ((0)) FOR [cgocencos]
GO
/****** Object:  Default [DF__Tbporcgo__cgosec__261C5E75]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Tbporcgo] ADD  DEFAULT ((0)) FOR [cgosector]
GO
/****** Object:  Default [DF__Tbporcgo__cgoper__271082AE]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Tbporcgo] ADD  DEFAULT ((0)) FOR [cgoperiod]
GO
/****** Object:  Default [DF__Tbporcgo__CGOTIP__2804A6E7]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Tbporcgo] ADD  DEFAULT ((0)) FOR [CGOTIPOCON]
GO
/****** Object:  Default [DF__Tbporcgo__CGOARE__28F8CB20]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Tbporcgo] ADD  DEFAULT ((0)) FOR [CGOAREARP]
GO
/****** Object:  Default [DF__Tbporcgo__CGOMOT__29ECEF59]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Tbporcgo] ADD  DEFAULT ((0)) FOR [CGOMOTRP]
GO
/****** Object:  Default [DF__Tbporcgo__cgoobj__2AE11392]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Tbporcgo] ADD  DEFAULT (' ') FOR [cgoobjtar]
GO
/****** Object:  Default [DF__Tbporcgo__cgomer__2BD537CB]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Tbporcgo] ADD  DEFAULT ((0)) FOR [cgomerc]
GO
/****** Object:  Default [DF__Tbporcgo__cgoapr__2CC95C04]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Tbporcgo] ADD  DEFAULT ((0)) FOR [cgoaprob]
GO
/****** Object:  Default [DF__Tbporcgo__Jdd__2DBD803D]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Tbporcgo] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__Tbporcgo__cgodes__2EB1A476]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Tbporcgo] ADD  DEFAULT (' ') FOR [cgodescrip]
GO
/****** Object:  Default [DF__Tbporbdp__BDPCOD__318E1121]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Tbporbdp] ADD  DEFAULT ((0)) FOR [BDPCODCGO]
GO
/****** Object:  Default [DF__Tbporbdp__BDPCOD__3282355A]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Tbporbdp] ADD  DEFAULT ((0)) FOR [BDPCODBdp]
GO
/****** Object:  Default [DF__Tbporbdp__BDPVAL__33765993]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Tbporbdp] ADD  DEFAULT ((0)) FOR [BDPVALOR]
GO
/****** Object:  Default [DF__Tbporbdp__BDPTEX__346A7DCC]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Tbporbdp] ADD  DEFAULT (' ') FOR [BDPTEXLIB]
GO
/****** Object:  Default [DF__Tbporbdp__Jdd__355EA205]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Tbporbdp] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__Tbporadi__codigo__094B159D]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Tbporadi] ADD  DEFAULT ((0)) FOR [codigo]
GO
/****** Object:  Default [DF__Tbporadi__codcam__0A3F39D6]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Tbporadi] ADD  DEFAULT ((0)) FOR [codcam]
GO
/****** Object:  Default [DF__Tbporadi__valorn__0B335E0F]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Tbporadi] ADD  DEFAULT ((0)) FOR [valorn]
GO
/****** Object:  Default [DF__Tbporadi__valorf__0C278248]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Tbporadi] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(120)),(120))) FOR [valorf]
GO
/****** Object:  Default [DF__Tbporadi__valorc__0D1BA681]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Tbporadi] ADD  DEFAULT (' ') FOR [valorc]
GO
/****** Object:  Default [DF__Tbporadi__Jdd__0E0FCABA]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Tbporadi] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__Tbporact__actcod__6601D960]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Tbporact] ADD  DEFAULT ((0)) FOR [actcodcgo]
GO
/****** Object:  Default [DF__Tbporact__actcod__66F5FD99]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Tbporact] ADD  DEFAULT ((0)) FOR [actcodigo]
GO
/****** Object:  Default [DF__Tbporact__actpor__67EA21D2]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Tbporact] ADD  DEFAULT ((0)) FOR [actporcent]
GO
/****** Object:  Default [DF__Tbporact__acttex__68DE460B]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Tbporact] ADD  DEFAULT ((0)) FOR [acttexclu]
GO
/****** Object:  Default [DF__Tbporact__acthab__69D26A44]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Tbporact] ADD  DEFAULT ((0)) FOR [acthabilit]
GO
/****** Object:  Default [DF__Tbporact__actdes__6AC68E7D]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Tbporact] ADD  DEFAULT (' ') FOR [actdescrip]
GO
/****** Object:  Default [DF__Tbporact__actcon__6BBAB2B6]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Tbporact] ADD  DEFAULT (' ') FOR [actcondic]
GO
/****** Object:  Default [DF__Tbporact__actdes__6CAED6EF]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Tbporact] ADD  DEFAULT (' ') FOR [actdescad]
GO
/****** Object:  Default [DF__Tbporact__acttip__6DA2FB28]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Tbporact] ADD  DEFAULT ((0)) FOR [acttipo]
GO
/****** Object:  Default [DF__Tbporact__actver__6E971F61]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Tbporact] ADD  DEFAULT ((0)) FOR [actver]
GO
/****** Object:  Default [DF__Tbporact__Jdd__6F8B439A]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Tbporact] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__TBEVAVOT__votcod__36B1ED9A]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAVOT] ADD  DEFAULT ((0)) FOR [votcodigo]
GO
/****** Object:  Default [DF__TBEVAVOT__votgru__37A611D3]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAVOT] ADD  DEFAULT ((0)) FOR [votgrupo]
GO
/****** Object:  Default [DF__TBEVAVOT__votvot__389A360C]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAVOT] ADD  DEFAULT ((0)) FOR [votvotante]
GO
/****** Object:  Default [DF__TBEVAVOT__vottip__398E5A45]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAVOT] ADD  DEFAULT ((0)) FOR [vottipo]
GO
/****** Object:  Default [DF__TBEVAVOT__votleg__3A827E7E]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAVOT] ADD  DEFAULT (' ') FOR [votlegajo]
GO
/****** Object:  Default [DF__TBEVAVOT__votnom__3B76A2B7]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAVOT] ADD  DEFAULT (' ') FOR [votnombre]
GO
/****** Object:  Default [DF__TBEVAVOT__votcla__3C6AC6F0]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAVOT] ADD  DEFAULT (' ') FOR [votclave]
GO
/****** Object:  Default [DF__TBEVAVOT__votcla__3D5EEB29]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAVOT] ADD  DEFAULT (' ') FOR [votclave2]
GO
/****** Object:  Default [DF__TBEVAVOT__votest__3E530F62]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAVOT] ADD  DEFAULT ((0)) FOR [votestado]
GO
/****** Object:  Default [DF__TBEVAVOT__votcan__3F47339B]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAVOT] ADD  DEFAULT ((0)) FOR [votcantap]
GO
/****** Object:  Default [DF__TBEVAVOT__votcod__403B57D4]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAVOT] ADD  DEFAULT ((0)) FOR [votcodeva]
GO
/****** Object:  Default [DF__TBEVAVOT__votfec__412F7C0D]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAVOT] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [votfecent]
GO
/****** Object:  Default [DF__TBEVAVOT__votfor__4223A046]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAVOT] ADD  DEFAULT (' ') FOR [votfortale]
GO
/****** Object:  Default [DF__TBEVAVOT__votasp__4317C47F]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAVOT] ADD  DEFAULT (' ') FOR [votaspecto]
GO
/****** Object:  Default [DF__TBEVAVOT__votsuc__440BE8B8]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAVOT] ADD  DEFAULT ((0)) FOR [votsuceci]
GO
/****** Object:  Default [DF__TBEVAVOT__votfun__45000CF1]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAVOT] ADD  DEFAULT ((0)) FOR [votfuncio]
GO
/****** Object:  Default [DF__TBEVAVOT__vot_ti__45F4312A]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAVOT] ADD  DEFAULT ((0)) FOR [vot_tipo]
GO
/****** Object:  Default [DF__TBEVAVOT__vot_ni__46E85563]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAVOT] ADD  DEFAULT ((0)) FOR [vot_nivel]
GO
/****** Object:  Default [DF__TBEVAVOT__votare__47DC799C]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAVOT] ADD  DEFAULT (' ') FOR [votarea]
GO
/****** Object:  Default [DF__TBEVAVOT__Jdd__48D09DD5]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAVOT] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__TBEVATDM__tdmcod__03F163A3]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVATDM] ADD  DEFAULT (' ') FOR [tdmcodigo]
GO
/****** Object:  Default [DF__TBEVATDM__tdmdes__04E587DC]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVATDM] ADD  DEFAULT (' ') FOR [tdmdescrip]
GO
/****** Object:  Default [DF__TBEVATDM__tdmpor__05D9AC15]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVATDM] ADD  DEFAULT ((0)) FOR [tdmporc]
GO
/****** Object:  Default [DF__TBEVATDM__Jdd__06CDD04E]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVATDM] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__TBEVASUC__SUCCAR__793ECB06]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVASUC] ADD  DEFAULT ((0)) FOR [SUCCARGOE]
GO
/****** Object:  Default [DF__TBEVASUC__SUCOPC__7A32EF3F]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVASUC] ADD  DEFAULT ((0)) FOR [SUCOPCION]
GO
/****** Object:  Default [DF__TBEVASUC__SUCCAR__7B271378]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVASUC] ADD  DEFAULT ((0)) FOR [SUCCARGOS]
GO
/****** Object:  Default [DF__TBEVASUC__Jdd__7C1B37B1]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVASUC] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__TBEVASFD__SFDCOD__2003926C]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVASFD] ADD  DEFAULT (' ') FOR [SFDCODFAC]
GO
/****** Object:  Default [DF__TBEVASFD__SFDCOD__20F7B6A5]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVASFD] ADD  DEFAULT (' ') FOR [SFDCODIGO]
GO
/****** Object:  Default [DF__TBEVASFD__ID__21EBDADE]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVASFD] ADD  DEFAULT ((0)) FOR [ID]
GO
/****** Object:  Default [DF__TBEVASFD__DESCRI__22DFFF17]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVASFD] ADD  DEFAULT (' ') FOR [DESCRIP]
GO
/****** Object:  Default [DF__TBEVASFD__Jdd__23D42350]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVASFD] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__TBEVASFA__SFAFAC__167A2832]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVASFA] ADD  DEFAULT (' ') FOR [SFAFACCOD]
GO
/****** Object:  Default [DF__TBEVASFA__SFACOD__176E4C6B]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVASFA] ADD  DEFAULT (' ') FOR [SFACODIGO]
GO
/****** Object:  Default [DF__TBEVASFA__SFADES__186270A4]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVASFA] ADD  DEFAULT (' ') FOR [SFADESCRIP]
GO
/****** Object:  Default [DF__TBEVASFA__SFADES__195694DD]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVASFA] ADD  DEFAULT (' ') FOR [SFADESADI]
GO
/****** Object:  Default [DF__TBEVASFA__SFAPOR__1A4AB916]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVASFA] ADD  DEFAULT ((0)) FOR [SFAPORCENT]
GO
/****** Object:  Default [DF__TBEVASFA__SFADES__1B3EDD4F]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVASFA] ADD  DEFAULT (' ') FOR [SFADESCAPL]
GO
/****** Object:  Default [DF__TBEVASFA__SFAOPC__1C330188]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVASFA] ADD  DEFAULT ((0)) FOR [SFAOPCION]
GO
/****** Object:  Default [DF__TBEVASFA__Jdd__1D2725C1]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVASFA] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__TBEVARDF__rdfnum__33A076C5]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVARDF] ADD  DEFAULT ((0)) FOR [rdfnumero]
GO
/****** Object:  Default [DF__TBEVARDF__rdfleg__34949AFE]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVARDF] ADD  DEFAULT (' ') FOR [rdflegajo]
GO
/****** Object:  Default [DF__TBEVARDF__rdfeva__3588BF37]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVARDF] ADD  DEFAULT ((0)) FOR [rdfevaluac]
GO
/****** Object:  Default [DF__TBEVARDF__rdfleg__367CE370]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVARDF] ADD  DEFAULT (' ') FOR [rdflegvot]
GO
/****** Object:  Default [DF__TBEVARDF__rdfgru__377107A9]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVARDF] ADD  DEFAULT ((0)) FOR [rdfgrupo]
GO
/****** Object:  Default [DF__TBEVARDF__rdfreg__38652BE2]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVARDF] ADD  DEFAULT (' ') FOR [rdfregist]
GO
/****** Object:  Default [DF__TBEVARDF__rdfcom__3959501B]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVARDF] ADD  DEFAULT (' ') FOR [rdfcoment]
GO
/****** Object:  Default [DF__TBEVARDF__rdffec__3A4D7454]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVARDF] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [rdffecha]
GO
/****** Object:  Default [DF__TBEVARDF__rdfest__3B41988D]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVARDF] ADD  DEFAULT ((0)) FOR [rdfestado]
GO
/****** Object:  Default [DF__TBEVARDF__rdfusu__3C35BCC6]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVARDF] ADD  DEFAULT (' ') FOR [rdfusuario]
GO
/****** Object:  Default [DF__TBEVARDF__Jdd__3D29E0FF]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVARDF] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__TBEVAPSF__PSFFMT__6FEA6AF6]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAPSF] ADD  DEFAULT (' ') FOR [PSFFMT]
GO
/****** Object:  Default [DF__TBEVAPSF__PSFFAC__70DE8F2F]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAPSF] ADD  DEFAULT (' ') FOR [PSFFACTOR]
GO
/****** Object:  Default [DF__TBEVAPSF__PSFSUB__71D2B368]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAPSF] ADD  DEFAULT (' ') FOR [PSFSUBFAC]
GO
/****** Object:  Default [DF__TBEVAPSF__SFAP1__72C6D7A1]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAPSF] ADD  DEFAULT ((0)) FOR [SFAP1]
GO
/****** Object:  Default [DF__TBEVAPSF__SFAP2__73BAFBDA]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAPSF] ADD  DEFAULT ((0)) FOR [SFAP2]
GO
/****** Object:  Default [DF__TBEVAPSF__SFAP3__74AF2013]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAPSF] ADD  DEFAULT ((0)) FOR [SFAP3]
GO
/****** Object:  Default [DF__TBEVAPSF__SFAP4__75A3444C]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAPSF] ADD  DEFAULT ((0)) FOR [SFAP4]
GO
/****** Object:  Default [DF__TBEVAPSF__SFAP5__76976885]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAPSF] ADD  DEFAULT ((0)) FOR [SFAP5]
GO
/****** Object:  Default [DF__TBEVAPSF__SFAP6__778B8CBE]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAPSF] ADD  DEFAULT ((0)) FOR [SFAP6]
GO
/****** Object:  Default [DF__TBEVAPSF__SFAP7__787FB0F7]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAPSF] ADD  DEFAULT ((0)) FOR [SFAP7]
GO
/****** Object:  Default [DF__TBEVAPSF__SFAP8__7973D530]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAPSF] ADD  DEFAULT ((0)) FOR [SFAP8]
GO
/****** Object:  Default [DF__TBEVAPSF__SFAP9__7A67F969]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAPSF] ADD  DEFAULT ((0)) FOR [SFAP9]
GO
/****** Object:  Default [DF__TBEVAPSF__SFAP10__7B5C1DA2]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAPSF] ADD  DEFAULT ((0)) FOR [SFAP10]
GO
/****** Object:  Default [DF__TBEVAPSF__SFAP11__7C5041DB]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAPSF] ADD  DEFAULT ((0)) FOR [SFAP11]
GO
/****** Object:  Default [DF__TBEVAPSF__SFAP12__7D446614]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAPSF] ADD  DEFAULT ((0)) FOR [SFAP12]
GO
/****** Object:  Default [DF__TBEVAPSF__SFAP13__7E388A4D]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAPSF] ADD  DEFAULT ((0)) FOR [SFAP13]
GO
/****** Object:  Default [DF__TBEVAPSF__SFAP14__7F2CAE86]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAPSF] ADD  DEFAULT ((0)) FOR [SFAP14]
GO
/****** Object:  Default [DF__TBEVAPSF__SFAP15__0020D2BF]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAPSF] ADD  DEFAULT ((0)) FOR [SFAP15]
GO
/****** Object:  Default [DF__TBEVAPSF__Jdd__0114F6F8]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAPSF] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__TBEVAOBJ__objcod__123F82FA]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAOBJ] ADD  DEFAULT (' ') FOR [objcodmta]
GO
/****** Object:  Default [DF__TBEVAOBJ__objcod__1333A733]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAOBJ] ADD  DEFAULT ((0)) FOR [objcodobj]
GO
/****** Object:  Default [DF__TBEVAOBJ__objcod__1427CB6C]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAOBJ] ADD  DEFAULT (' ') FOR [objcodper]
GO
/****** Object:  Default [DF__TBEVAOBJ__objpor__151BEFA5]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAOBJ] ADD  DEFAULT ((0)) FOR [objporce]
GO
/****** Object:  Default [DF__TBEVAOBJ__objest__161013DE]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAOBJ] ADD  DEFAULT ((0)) FOR [objestado]
GO
/****** Object:  Default [DF__TBEVAOBJ__Jdd__17043817]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAOBJ] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__TBEVANOT__NOTLEG__0FCD2AA3]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVANOT] ADD  DEFAULT (' ') FOR [NOTLEGAJO]
GO
/****** Object:  Default [DF__TBEVANOT__NOTFEC__10C14EDC]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVANOT] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [NOTFECHA]
GO
/****** Object:  Default [DF__TBEVANOT__NOTNOT__11B57315]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVANOT] ADD  DEFAULT (' ') FOR [NOTNOTAPOS]
GO
/****** Object:  Default [DF__TBEVANOT__NOTNOT__12A9974E]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVANOT] ADD  DEFAULT (' ') FOR [NOTNOTANEG]
GO
/****** Object:  Default [DF__TBEVANOT__Jdd__139DBB87]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVANOT] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__TBEVAMTA__mtatip__09AA3CF9]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAMTA] ADD  DEFAULT (' ') FOR [mtatipcod]
GO
/****** Object:  Default [DF__TBEVAMTA__mtacod__0A9E6132]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAMTA] ADD  DEFAULT (' ') FOR [mtacodigo]
GO
/****** Object:  Default [DF__TBEVAMTA__mtapor__0B92856B]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAMTA] ADD  DEFAULT ((0)) FOR [mtaporc]
GO
/****** Object:  Default [DF__TBEVAMTA__mtades__0C86A9A4]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAMTA] ADD  DEFAULT (' ') FOR [mtadescrip]
GO
/****** Object:  Default [DF__TBEVAMTA__mtacon__0D7ACDDD]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAMTA] ADD  DEFAULT (' ') FOR [mtaconsat]
GO
/****** Object:  Default [DF__TBEVAMTA__mtafcu__0E6EF216]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAMTA] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [mtafcumpli]
GO
/****** Object:  Default [DF__TBEVAMTA__Jdd__0F63164F]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAMTA] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__TBEVAMGR__MGRCOD__4D6048C8]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAMGR] ADD  DEFAULT ((0)) FOR [MGRCODEVD]
GO
/****** Object:  Default [DF__TBEVAMGR__MGRLEG__4E546D01]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAMGR] ADD  DEFAULT (' ') FOR [MGRLEGAJO]
GO
/****** Object:  Default [DF__TBEVAMGR__MGRCOD__4F48913A]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAMGR] ADD  DEFAULT ((0)) FOR [MGRCODMET]
GO
/****** Object:  Default [DF__TBEVAMGR__MGRCOD__503CB573]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAMGR] ADD  DEFAULT ((0)) FOR [MGRCODIGO]
GO
/****** Object:  Default [DF__TBEVAMGR__Jdd__5130D9AC]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAMGR] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__TBEVAMET__METCOD__6C83EE66]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAMET] ADD  DEFAULT ((0)) FOR [METCODEVD]
GO
/****** Object:  Default [DF__TBEVAMET__METLEG__6D78129F]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAMET] ADD  DEFAULT (' ') FOR [METLEGAJO]
GO
/****** Object:  Default [DF__TBEVAMET__METCOD__6E6C36D8]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAMET] ADD  DEFAULT ((0)) FOR [METCODIGO]
GO
/****** Object:  Default [DF__TBEVAMET__METMET__6F605B11]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAMET] ADD  DEFAULT (' ') FOR [METMETAPER]
GO
/****** Object:  Default [DF__TBEVAMET__METSAT__70547F4A]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAMET] ADD  DEFAULT (' ') FOR [METSATPER]
GO
/****** Object:  Default [DF__TBEVAMET__METNOT__7148A383]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAMET] ADD  DEFAULT ((0)) FOR [METNOTSUP]
GO
/****** Object:  Default [DF__TBEVAMET__METNOT__723CC7BC]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAMET] ADD  DEFAULT ((0)) FOR [METNOTAUT]
GO
/****** Object:  Default [DF__TBEVAMET__METNOT__7330EBF5]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAMET] ADD  DEFAULT ((0)) FOR [METNOTPAR]
GO
/****** Object:  Default [DF__TBEVAMET__METNOT__7425102E]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAMET] ADD  DEFAULT ((0)) FOR [METNOTCOL]
GO
/****** Object:  Default [DF__TBEVAMET__METNOT__75193467]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAMET] ADD  DEFAULT ((0)) FOR [METNOTCLI]
GO
/****** Object:  Default [DF__TBEVAMET__METNOT__760D58A0]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAMET] ADD  DEFAULT ((0)) FOR [METNOTJSU]
GO
/****** Object:  Default [DF__TBEVAMET__METNOT__77017CD9]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAMET] ADD  DEFAULT ((0)) FOR [METNOTOTR]
GO
/****** Object:  Default [DF__TBEVAMET__METNOT__77F5A112]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAMET] ADD  DEFAULT ((0)) FOR [METNOTCLE]
GO
/****** Object:  Default [DF__TBEVAMET__METNOT__78E9C54B]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAMET] ADD  DEFAULT ((0)) FOR [METNOTPRO]
GO
/****** Object:  Default [DF__TBEVAMET__METMCG__79DDE984]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAMET] ADD  DEFAULT ((0)) FOR [METMCGORI]
GO
/****** Object:  Default [DF__TBEVAMET__METMCG__7AD20DBD]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAMET] ADD  DEFAULT (' ') FOR [METMCGLEG]
GO
/****** Object:  Default [DF__TBEVAMET__METNOT__7BC631F6]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAMET] ADD  DEFAULT ((0)) FOR [METNOTFIN]
GO
/****** Object:  Default [DF__TBEVAMET__METTIP__7CBA562F]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAMET] ADD  DEFAULT ((0)) FOR [METTIPO]
GO
/****** Object:  Default [DF__TBEVAMET__METOBS__7DAE7A68]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAMET] ADD  DEFAULT (' ') FOR [METOBSSUP]
GO
/****** Object:  Default [DF__TBEVAMET__METOBS__7EA29EA1]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAMET] ADD  DEFAULT (' ') FOR [METOBSAUT]
GO
/****** Object:  Default [DF__TBEVAMET__METOBS__7F96C2DA]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAMET] ADD  DEFAULT (' ') FOR [METOBSPAR]
GO
/****** Object:  Default [DF__TBEVAMET__METOBS__008AE713]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAMET] ADD  DEFAULT (' ') FOR [METOBSCOL]
GO
/****** Object:  Default [DF__TBEVAMET__METOBS__017F0B4C]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAMET] ADD  DEFAULT (' ') FOR [METOBSCLI]
GO
/****** Object:  Default [DF__TBEVAMET__METOBS__02732F85]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAMET] ADD  DEFAULT (' ') FOR [METOBSJSU]
GO
/****** Object:  Default [DF__TBEVAMET__METOBS__036753BE]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAMET] ADD  DEFAULT (' ') FOR [METOBSOTR]
GO
/****** Object:  Default [DF__TBEVAMET__METOBS__045B77F7]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAMET] ADD  DEFAULT (' ') FOR [METOBSPRO]
GO
/****** Object:  Default [DF__TBEVAMET__METOBS__054F9C30]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAMET] ADD  DEFAULT (' ') FOR [METOBSCLE]
GO
/****** Object:  Default [DF__TBEVAMET__METOBJ__0643C069]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAMET] ADD  DEFAULT ((0)) FOR [METOBJETI]
GO
/****** Object:  Default [DF__TBEVAMET__METOTR__0737E4A2]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAMET] ADD  DEFAULT (' ') FOR [METOTROOBJ]
GO
/****** Object:  Default [DF__TBEVAMET__METTEM__082C08DB]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAMET] ADD  DEFAULT (' ') FOR [METTEMA]
GO
/****** Object:  Default [DF__TBEVAMET__METPON__09202D14]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAMET] ADD  DEFAULT ((0)) FOR [METPOND]
GO
/****** Object:  Default [DF__TBEVAMET__METNOT__0A14514D]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAMET] ADD  DEFAULT ((0)) FOR [METNOTAPON]
GO
/****** Object:  Default [DF__TBEVAMET__METAFE__0B087586]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAMET] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [METAFECHA]
GO
/****** Object:  Default [DF__TBEVAMET__METFEC__0BFC99BF]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAMET] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [METFECUM]
GO
/****** Object:  Default [DF__TBEVAMET__Jdd__0CF0BDF8]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAMET] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__TBEVAMCG__MCGCOD__540D4657]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAMCG] ADD  DEFAULT ((0)) FOR [MCGCODEVD]
GO
/****** Object:  Default [DF__TBEVAMCG__MCGLEG__55016A90]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAMCG] ADD  DEFAULT (' ') FOR [MCGLEGAJO]
GO
/****** Object:  Default [DF__TBEVAMCG__MCGCOD__55F58EC9]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAMCG] ADD  DEFAULT ((0)) FOR [MCGCODIGO]
GO
/****** Object:  Default [DF__TBEVAMCG__MCGCLA__56E9B302]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAMCG] ADD  DEFAULT ((0)) FOR [MCGCLASE]
GO
/****** Object:  Default [DF__TBEVAMCG__MCGCON__57DDD73B]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAMCG] ADD  DEFAULT ((0)) FOR [MCGCONSEC]
GO
/****** Object:  Default [DF__TBEVAMCG__MCGLEG__58D1FB74]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAMCG] ADD  DEFAULT (' ') FOR [MCGLEGORI]
GO
/****** Object:  Default [DF__TBEVAMCG__MCGCOD__59C61FAD]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAMCG] ADD  DEFAULT ((0)) FOR [MCGCODORI]
GO
/****** Object:  Default [DF__TBEVAMCG__MCGMET__5ABA43E6]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAMCG] ADD  DEFAULT (' ') FOR [MCGMETAPER]
GO
/****** Object:  Default [DF__TBEVAMCG__MCGSAT__5BAE681F]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAMCG] ADD  DEFAULT (' ') FOR [MCGSATPER]
GO
/****** Object:  Default [DF__TBEVAMCG__MCGNOT__5CA28C58]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAMCG] ADD  DEFAULT ((0)) FOR [MCGNOTSUP]
GO
/****** Object:  Default [DF__TBEVAMCG__MCGNOT__5D96B091]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAMCG] ADD  DEFAULT ((0)) FOR [MCGNOTAUT]
GO
/****** Object:  Default [DF__TBEVAMCG__MCGNOT__5E8AD4CA]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAMCG] ADD  DEFAULT ((0)) FOR [MCGNOTPAR]
GO
/****** Object:  Default [DF__TBEVAMCG__MCGNOT__5F7EF903]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAMCG] ADD  DEFAULT ((0)) FOR [MCGNOTCOL]
GO
/****** Object:  Default [DF__TBEVAMCG__MCGNOT__60731D3C]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAMCG] ADD  DEFAULT ((0)) FOR [MCGNOTCLI]
GO
/****** Object:  Default [DF__TBEVAMCG__MCGNOT__61674175]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAMCG] ADD  DEFAULT ((0)) FOR [MCGNOTJSU]
GO
/****** Object:  Default [DF__TBEVAMCG__MCGNOT__625B65AE]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAMCG] ADD  DEFAULT ((0)) FOR [MCGNOTOTR]
GO
/****** Object:  Default [DF__TBEVAMCG__MCGNOT__634F89E7]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAMCG] ADD  DEFAULT ((0)) FOR [MCGNOTCLE]
GO
/****** Object:  Default [DF__TBEVAMCG__MCGNOT__6443AE20]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAMCG] ADD  DEFAULT ((0)) FOR [MCGNOTPRO]
GO
/****** Object:  Default [DF__TBEVAMCG__MCGNOT__6537D259]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAMCG] ADD  DEFAULT ((0)) FOR [MCGNOTFIN]
GO
/****** Object:  Default [DF__TBEVAMCG__MCGTIP__662BF692]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAMCG] ADD  DEFAULT ((0)) FOR [MCGTIPO]
GO
/****** Object:  Default [DF__TBEVAMCG__MCGOBS__67201ACB]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAMCG] ADD  DEFAULT (' ') FOR [MCGOBSSUP]
GO
/****** Object:  Default [DF__TBEVAMCG__MCGOBS__68143F04]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAMCG] ADD  DEFAULT (' ') FOR [MCGOBSAUT]
GO
/****** Object:  Default [DF__TBEVAMCG__MCGOBS__6908633D]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAMCG] ADD  DEFAULT (' ') FOR [MCGOBSPAR]
GO
/****** Object:  Default [DF__TBEVAMCG__MCGOBS__69FC8776]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAMCG] ADD  DEFAULT (' ') FOR [MCGOBSCOL]
GO
/****** Object:  Default [DF__TBEVAMCG__MCGOBS__6AF0ABAF]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAMCG] ADD  DEFAULT (' ') FOR [MCGOBSCLI]
GO
/****** Object:  Default [DF__TBEVAMCG__MCGOBS__6BE4CFE8]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAMCG] ADD  DEFAULT (' ') FOR [MCGOBSJSU]
GO
/****** Object:  Default [DF__TBEVAMCG__MCGOBS__6CD8F421]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAMCG] ADD  DEFAULT (' ') FOR [MCGOBSOTR]
GO
/****** Object:  Default [DF__TBEVAMCG__MCGOBS__6DCD185A]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAMCG] ADD  DEFAULT (' ') FOR [MCGOBSPRO]
GO
/****** Object:  Default [DF__TBEVAMCG__MCGOBS__6EC13C93]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAMCG] ADD  DEFAULT (' ') FOR [MCGOBSCLE]
GO
/****** Object:  Default [DF__TBEVAMCG__MCGOBJ__6FB560CC]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAMCG] ADD  DEFAULT ((0)) FOR [MCGOBJETI]
GO
/****** Object:  Default [DF__TBEVAMCG__MCGOTR__70A98505]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAMCG] ADD  DEFAULT (' ') FOR [MCGOTROOBJ]
GO
/****** Object:  Default [DF__TBEVAMCG__MCGTEM__719DA93E]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAMCG] ADD  DEFAULT (' ') FOR [MCGTEMA]
GO
/****** Object:  Default [DF__TBEVAMCG__MCGPON__7291CD77]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAMCG] ADD  DEFAULT ((0)) FOR [MCGPOND]
GO
/****** Object:  Default [DF__TBEVAMCG__MCGNOT__7385F1B0]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAMCG] ADD  DEFAULT ((0)) FOR [MCGNOTAPON]
GO
/****** Object:  Default [DF__TBEVAMCG__MCGAFE__747A15E9]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAMCG] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [MCGAFECHA]
GO
/****** Object:  Default [DF__TBEVAMCG__MCGFEC__756E3A22]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAMCG] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [MCGFECUM]
GO
/****** Object:  Default [DF__TBEVAMCG__Jdd__76625E5B]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAMCG] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__TBEVAIRE__irecod__79A8DF5A]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAIRE] ADD  DEFAULT ((0)) FOR [irecodigo]
GO
/****** Object:  Default [DF__TBEVAIRE__ireevd__7A9D0393]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAIRE] ADD  DEFAULT ((0)) FOR [ireevdcod]
GO
/****** Object:  Default [DF__TBEVAIRE__iretip__7B9127CC]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAIRE] ADD  DEFAULT ((0)) FOR [iretipo]
GO
/****** Object:  Default [DF__TBEVAIRE__ireran__7C854C05]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAIRE] ADD  DEFAULT ((0)) FOR [irerangode]
GO
/****** Object:  Default [DF__TBEVAIRE__ireran__7D79703E]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAIRE] ADD  DEFAULT ((0)) FOR [irerangoha]
GO
/****** Object:  Default [DF__TBEVAIRE__iredes__7E6D9477]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAIRE] ADD  DEFAULT (' ') FOR [iredescrip]
GO
/****** Object:  Default [DF__TBEVAIRE__iredia__7F61B8B0]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAIRE] ADD  DEFAULT (' ') FOR [irediagnos]
GO
/****** Object:  Default [DF__TBEVAIRE__ireacc__0055DCE9]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAIRE] ADD  DEFAULT (' ') FOR [ireaccrec]
GO
/****** Object:  Default [DF__TBEVAIRE__irecol__014A0122]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAIRE] ADD  DEFAULT ((0)) FOR [irecolor]
GO
/****** Object:  Default [DF__TBEVAIRE__Jdd__023E255B]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAIRE] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__TBEVAINP__INPCOD__63B99E3B]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAINP] ADD  DEFAULT ((0)) FOR [INPCODINC]
GO
/****** Object:  Default [DF__TBEVAINP__INPLEG__64ADC274]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAINP] ADD  DEFAULT (' ') FOR [INPLEGAJO]
GO
/****** Object:  Default [DF__TBEVAINP__INPCOD__65A1E6AD]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAINP] ADD  DEFAULT ((0)) FOR [INPCODEVA]
GO
/****** Object:  Default [DF__TBEVAINP__INPFEC__66960AE6]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAINP] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [INPFECHA]
GO
/****** Object:  Default [DF__TBEVAINP__INPPUN__678A2F1F]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAINP] ADD  DEFAULT ((0)) FOR [INPPUNTOS]
GO
/****** Object:  Default [DF__TBEVAINP__INPEST__687E5358]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAINP] ADD  DEFAULT ((0)) FOR [INPESTADO]
GO
/****** Object:  Default [DF__TBEVAINP__INPFEC__69727791]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAINP] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [INPFECASIG]
GO
/****** Object:  Default [DF__TBEVAINP__INPCAN__6A669BCA]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAINP] ADD  DEFAULT ((0)) FOR [INPCANTI]
GO
/****** Object:  Default [DF__TBEVAINP__Jdd__6B5AC003]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAINP] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__TBEVAINC__INCCOD__26B08FFB]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAINC] ADD  DEFAULT ((0)) FOR [INCCODIGO]
GO
/****** Object:  Default [DF__TBEVAINC__INCTIP__27A4B434]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAINC] ADD  DEFAULT ((0)) FOR [INCTIPO]
GO
/****** Object:  Default [DF__TBEVAINC__INCCAN__2898D86D]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAINC] ADD  DEFAULT ((0)) FOR [INCCANTID]
GO
/****** Object:  Default [DF__TBEVAINC__INCFEC__298CFCA6]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAINC] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [INCFECHA]
GO
/****** Object:  Default [DF__TBEVAINC__INCDES__2A8120DF]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAINC] ADD  DEFAULT (' ') FOR [INCDESCRIP]
GO
/****** Object:  Default [DF__TBEVAINC__INCFEC__2B754518]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAINC] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [INCFECVEN]
GO
/****** Object:  Default [DF__TBEVAINC__INCVAL__2C696951]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAINC] ADD  DEFAULT ((0)) FOR [INCVALITEM]
GO
/****** Object:  Default [DF__TBEVAINC__INCITE__2D5D8D8A]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAINC] ADD  DEFAULT (' ') FOR [INCITEM]
GO
/****** Object:  Default [DF__TBEVAINC__Jdd__2E51B1C3]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAINC] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__TBEVAFPO__FPOFMT__73F00604]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAFPO] ADD  DEFAULT (' ') FOR [FPOFMTCOD]
GO
/****** Object:  Default [DF__TBEVAFPO__FPOPON__74E42A3D]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAFPO] ADD  DEFAULT ((0)) FOR [FPOPONDERA]
GO
/****** Object:  Default [DF__TBEVAFPO__FPODES__75D84E76]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAFPO] ADD  DEFAULT (' ') FOR [FPODESCRIP]
GO
/****** Object:  Default [DF__TBEVAFPO__Jdd__76CC72AF]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAFPO] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__TBEVAFMT__FMTCOD__5D41AAD6]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAFMT] ADD  DEFAULT (' ') FOR [FMTCODIGO]
GO
/****** Object:  Default [DF__TBEVAFMT__FMTDES__5E35CF0F]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAFMT] ADD  DEFAULT (' ') FOR [FMTDESCRIP]
GO
/****** Object:  Default [DF__TBEVAFMT__FMTAPL__5F29F348]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAFMT] ADD  DEFAULT ((0)) FOR [FMTAPLICA]
GO
/****** Object:  Default [DF__TBEVAFMT__FMTTIP__601E1781]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAFMT] ADD  DEFAULT ((0)) FOR [FMTTIPO]
GO
/****** Object:  Default [DF__TBEVAFMT__FMTFEC__61123BBA]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAFMT] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [FMTFECHA]
GO
/****** Object:  Default [DF__TBEVAFMT__FMTCON__62065FF3]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAFMT] ADD  DEFAULT ((0)) FOR [FMTCONVENI]
GO
/****** Object:  Default [DF__TBEVAFMT__FMTNOT__62FA842C]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAFMT] ADD  DEFAULT ((0)) FOR [FMTNOTA]
GO
/****** Object:  Default [DF__TBEVAFMT__FMTNIV__63EEA865]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAFMT] ADD  DEFAULT ((0)) FOR [FMTNIVEL]
GO
/****** Object:  Default [DF__TBEVAFMT__FMTOBS__64E2CC9E]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAFMT] ADD  DEFAULT (' ') FOR [FMTOBSAPLI]
GO
/****** Object:  Default [DF__TBEVAFMT__FMTTIP__65D6F0D7]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAFMT] ADD  DEFAULT ((0)) FOR [FMTTIPFAC]
GO
/****** Object:  Default [DF__TBEVAFMT__FMTFAC__66CB1510]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAFMT] ADD  DEFAULT ((0)) FOR [FMTFACPOND]
GO
/****** Object:  Default [DF__TBEVAFMT__FMTSFC__67BF3949]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAFMT] ADD  DEFAULT ((0)) FOR [FMTSFCPOND]
GO
/****** Object:  Default [DF__TBEVAFMT__FMTEST__68B35D82]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAFMT] ADD  DEFAULT ((0)) FOR [FMTESTADO]
GO
/****** Object:  Default [DF__TBEVAFMT__Jdd__69A781BB]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAFMT] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__TBEVAFMD__FMDCOD__5165E3D6]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAFMD] ADD  DEFAULT (' ') FOR [FMDCODIGO]
GO
/****** Object:  Default [DF__TBEVAFMD__ID__525A080F]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAFMD] ADD  DEFAULT ((0)) FOR [ID]
GO
/****** Object:  Default [DF__TBEVAFMD__DESCRI__534E2C48]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAFMD] ADD  DEFAULT (' ') FOR [DESCRIP]
GO
/****** Object:  Default [DF__TBEVAFMD__Jdd__54425081]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAFMD] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__TBEVAFGR__FGRFAC__53B8409C]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAFGR] ADD  DEFAULT (' ') FOR [FGRFACTOR]
GO
/****** Object:  Default [DF__TBEVAFGR__FGRSUB__54AC64D5]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAFGR] ADD  DEFAULT (' ') FOR [FGRSUBFAC]
GO
/****** Object:  Default [DF__TBEVAFGR__FGRNUM__55A0890E]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAFGR] ADD  DEFAULT ((0)) FOR [FGRNUMERO]
GO
/****** Object:  Default [DF__TBEVAFGR__FGRDES__5694AD47]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAFGR] ADD  DEFAULT (' ') FOR [FGRDESADI]
GO
/****** Object:  Default [DF__TBEVAFGR__fgrcod__5788D180]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAFGR] ADD  DEFAULT ((0)) FOR [fgrcodigo]
GO
/****** Object:  Default [DF__TBEVAFGR__fgrcod__587CF5B9]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAFGR] ADD  DEFAULT (' ') FOR [fgrcodfac]
GO
/****** Object:  Default [DF__TBEVAFGR__fgruso__597119F2]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAFGR] ADD  DEFAULT ((0)) FOR [fgruso]
GO
/****** Object:  Default [DF__TBEVAFGR__Jdd__5A653E2B]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAFGR] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__TBEVAFFA__FFAFMT__3EBD23B6]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAFFA] ADD  DEFAULT (' ') FOR [FFAFMTCOD]
GO
/****** Object:  Default [DF__TBEVAFFA__FFAFAC__3FB147EF]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAFFA] ADD  DEFAULT (' ') FOR [FFAFACCOD]
GO
/****** Object:  Default [DF__TBEVAFFA__FFAP1__40A56C28]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAFFA] ADD  DEFAULT ((0)) FOR [FFAP1]
GO
/****** Object:  Default [DF__TBEVAFFA__FFAP2__41999061]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAFFA] ADD  DEFAULT ((0)) FOR [FFAP2]
GO
/****** Object:  Default [DF__TBEVAFFA__FFAP3__428DB49A]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAFFA] ADD  DEFAULT ((0)) FOR [FFAP3]
GO
/****** Object:  Default [DF__TBEVAFFA__FFAP4__4381D8D3]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAFFA] ADD  DEFAULT ((0)) FOR [FFAP4]
GO
/****** Object:  Default [DF__TBEVAFFA__FFAP5__4475FD0C]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAFFA] ADD  DEFAULT ((0)) FOR [FFAP5]
GO
/****** Object:  Default [DF__TBEVAFFA__FFAP6__456A2145]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAFFA] ADD  DEFAULT ((0)) FOR [FFAP6]
GO
/****** Object:  Default [DF__TBEVAFFA__FFAP7__465E457E]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAFFA] ADD  DEFAULT ((0)) FOR [FFAP7]
GO
/****** Object:  Default [DF__TBEVAFFA__FFAP8__475269B7]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAFFA] ADD  DEFAULT ((0)) FOR [FFAP8]
GO
/****** Object:  Default [DF__TBEVAFFA__FFAP9__48468DF0]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAFFA] ADD  DEFAULT ((0)) FOR [FFAP9]
GO
/****** Object:  Default [DF__TBEVAFFA__FFAP10__493AB229]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAFFA] ADD  DEFAULT ((0)) FOR [FFAP10]
GO
/****** Object:  Default [DF__TBEVAFFA__FFAP11__4A2ED662]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAFFA] ADD  DEFAULT ((0)) FOR [FFAP11]
GO
/****** Object:  Default [DF__TBEVAFFA__FFAP12__4B22FA9B]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAFFA] ADD  DEFAULT ((0)) FOR [FFAP12]
GO
/****** Object:  Default [DF__TBEVAFFA__FFAP13__4C171ED4]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAFFA] ADD  DEFAULT ((0)) FOR [FFAP13]
GO
/****** Object:  Default [DF__TBEVAFFA__FFAP14__4D0B430D]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAFFA] ADD  DEFAULT ((0)) FOR [FFAP14]
GO
/****** Object:  Default [DF__TBEVAFFA__FFAP15__4DFF6746]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAFFA] ADD  DEFAULT ((0)) FOR [FFAP15]
GO
/****** Object:  Default [DF__TBEVAFFA__FFapor__4EF38B7F]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAFFA] ADD  DEFAULT ((0)) FOR [FFaporcent]
GO
/****** Object:  Default [DF__TBEVAFFA__ffapje__4FE7AFB8]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAFFA] ADD  DEFAULT ((0)) FOR [ffapjemin]
GO
/****** Object:  Default [DF__TBEVAFFA__Jdd__50DBD3F1]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAFFA] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__TBEVAFCT__FCTCOD__334B710A]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAFCT] ADD  DEFAULT (' ') FOR [FCTCODIGO]
GO
/****** Object:  Default [DF__TBEVAFCT__FCTDES__343F9543]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAFCT] ADD  DEFAULT (' ') FOR [FCTDESCRIP]
GO
/****** Object:  Default [DF__TBEVAFCT__FCTDES__3533B97C]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAFCT] ADD  DEFAULT (' ') FOR [FCTDESADI]
GO
/****** Object:  Default [DF__TBEVAFCT__FCTTIP__3627DDB5]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAFCT] ADD  DEFAULT ((0)) FOR [FCTTIPO]
GO
/****** Object:  Default [DF__TBEVAFCT__FCTPOR__371C01EE]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAFCT] ADD  DEFAULT ((0)) FOR [FCTPORCENT]
GO
/****** Object:  Default [DF__TBEVAFCT__FCTPJE__38102627]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAFCT] ADD  DEFAULT ((0)) FOR [FCTPJEMIN]
GO
/****** Object:  Default [DF__TBEVAFCT__FCTCOM__39044A60]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAFCT] ADD  DEFAULT ((0)) FOR [FCTCOMP]
GO
/****** Object:  Default [DF__TBEVAFCT__FCTMOD__39F86E99]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAFCT] ADD  DEFAULT ((0)) FOR [FCTMODO]
GO
/****** Object:  Default [DF__TBEVAFCT__FCTTIP__3AEC92D2]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAFCT] ADD  DEFAULT ((0)) FOR [FCTTIPCAL]
GO
/****** Object:  Default [DF__TBEVAFCT__Jdd__3BE0B70B]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAFCT] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__TBEVAFCP__FCPFAC__6E372CAE]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAFCP] ADD  DEFAULT (' ') FOR [FCPFACCOD]
GO
/****** Object:  Default [DF__TBEVAFCP__FCPPON__6F2B50E7]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAFCP] ADD  DEFAULT ((0)) FOR [FCPPONDERA]
GO
/****** Object:  Default [DF__TBEVAFCP__FCPDES__701F7520]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAFCP] ADD  DEFAULT (' ') FOR [FCPDESCRIP]
GO
/****** Object:  Default [DF__TBEVAFCP__Jdd__71139959]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAFCP] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__TBEVAFCD__FCDCOD__4BAD0A80]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAFCD] ADD  DEFAULT (' ') FOR [FCDCODFAC]
GO
/****** Object:  Default [DF__TBEVAFCD__FCDPOS__4CA12EB9]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAFCD] ADD  DEFAULT ((0)) FOR [FCDPOSICIO]
GO
/****** Object:  Default [DF__TBEVAFCD__FCDTEX__4D9552F2]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAFCD] ADD  DEFAULT (' ') FOR [FCDTEXTO]
GO
/****** Object:  Default [DF__TBEVAFCD__Jdd__4E89772B]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAFCD] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__TBEVAEVP__EVPCOD__1D5C2FEB]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAEVP] ADD  DEFAULT ((0)) FOR [EVPCODIGO]
GO
/****** Object:  Default [DF__TBEVAEVP__EVPLEG__1E505424]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAEVP] ADD  DEFAULT (' ') FOR [EVPLEGAJO]
GO
/****** Object:  Default [DF__TBEVAEVP__EVPCOD__1F44785D]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAEVP] ADD  DEFAULT (' ') FOR [EVPCODFMT]
GO
/****** Object:  Default [DF__TBEVAEVP__EVPFEC__20389C96]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAEVP] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [EVPFECHA]
GO
/****** Object:  Default [DF__TBEVAEVP__EVPOBS__212CC0CF]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAEVP] ADD  DEFAULT (' ') FOR [EVPOBSERV]
GO
/****** Object:  Default [DF__TBEVAEVP__EVPHEC__2220E508]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAEVP] ADD  DEFAULT (' ') FOR [EVPHECSOB]
GO
/****** Object:  Default [DF__TBEVAEVP__EVPPLA__23150941]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAEVP] ADD  DEFAULT (' ') FOR [EVPPLAFUT]
GO
/****** Object:  Default [DF__TBEVAEVP__EVPCOM__24092D7A]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAEVP] ADD  DEFAULT (' ') FOR [EVPCOMEVA]
GO
/****** Object:  Default [DF__TBEVAEVP__EVPCOM__24FD51B3]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAEVP] ADD  DEFAULT (' ') FOR [EVPCOMEVO]
GO
/****** Object:  Default [DF__TBEVAEVP__EVPEST__25F175EC]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAEVP] ADD  DEFAULT ((0)) FOR [EVPESTADO]
GO
/****** Object:  Default [DF__TBEVAEVP__EVPTOT__26E59A25]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAEVP] ADD  DEFAULT ((0)) FOR [EVPTOTALA]
GO
/****** Object:  Default [DF__TBEVAEVP__EVPTOT__27D9BE5E]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAEVP] ADD  DEFAULT ((0)) FOR [EVPTOTALE]
GO
/****** Object:  Default [DF__TBEVAEVP__EVPTOT__28CDE297]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAEVP] ADD  DEFAULT ((0)) FOR [EVPTOTALC]
GO
/****** Object:  Default [DF__TBEVAEVP__EVPTOT__29C206D0]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAEVP] ADD  DEFAULT ((0)) FOR [EVPTOTALPA]
GO
/****** Object:  Default [DF__TBEVAEVP__EVPTOT__2AB62B09]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAEVP] ADD  DEFAULT ((0)) FOR [EVPTOTALSU]
GO
/****** Object:  Default [DF__TBEVAEVP__EVPTOT__2BAA4F42]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAEVP] ADD  DEFAULT ((0)) FOR [EVPTOTALES]
GO
/****** Object:  Default [DF__TBEVAEVP__EVPTOT__2C9E737B]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAEVP] ADD  DEFAULT ((0)) FOR [EVPTOTALCL]
GO
/****** Object:  Default [DF__TBEVAEVP__EVPTOT__2D9297B4]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAEVP] ADD  DEFAULT ((0)) FOR [EVPTOTALPR]
GO
/****** Object:  Default [DF__TBEVAEVP__EVPTOT__2E86BBED]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAEVP] ADD  DEFAULT ((0)) FOR [EVPTOTALFI]
GO
/****** Object:  Default [DF__TBEVAEVP__EVPTOT__2F7AE026]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAEVP] ADD  DEFAULT ((0)) FOR [EVPTOTALot]
GO
/****** Object:  Default [DF__TBEVAEVP__Jdd__306F045F]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAEVP] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__TBEVAEVD__EVDCOD__57BDDBAA]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAEVD] ADD  DEFAULT ((0)) FOR [EVDCODIGO]
GO
/****** Object:  Default [DF__TBEVAEVD__EVDFEC__58B1FFE3]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAEVD] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [EVDFECHA]
GO
/****** Object:  Default [DF__TBEVAEVD__EVDTIP__59A6241C]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAEVD] ADD  DEFAULT ((0)) FOR [EVDTIPO]
GO
/****** Object:  Default [DF__TBEVAEVD__EVDCAR__5A9A4855]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAEVD] ADD  DEFAULT ((0)) FOR [EVDCARGO]
GO
/****** Object:  Default [DF__TBEVAEVD__EVDDES__5B8E6C8E]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAEVD] ADD  DEFAULT (' ') FOR [EVDDESCAD]
GO
/****** Object:  Default [DF__TBEVAEVD__EVDEVA__5C8290C7]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAEVD] ADD  DEFAULT ((0)) FOR [EVDEVAANT]
GO
/****** Object:  Default [DF__TBEVAEVD__EVDPFM__5D76B500]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAEVD] ADD  DEFAULT ((0)) FOR [EVDPFMT]
GO
/****** Object:  Default [DF__TBEVAEVD__EVDPME__5E6AD939]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAEVD] ADD  DEFAULT ((0)) FOR [EVDPMETA]
GO
/****** Object:  Default [DF__TBEVAEVD__EVDPON__5F5EFD72]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAEVD] ADD  DEFAULT ((0)) FOR [EVDPONSUP]
GO
/****** Object:  Default [DF__TBEVAEVD__EVDPON__605321AB]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAEVD] ADD  DEFAULT ((0)) FOR [EVDPONAUT]
GO
/****** Object:  Default [DF__TBEVAEVD__EVDPON__614745E4]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAEVD] ADD  DEFAULT ((0)) FOR [EVDPONPAR]
GO
/****** Object:  Default [DF__TBEVAEVD__EVDPON__623B6A1D]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAEVD] ADD  DEFAULT ((0)) FOR [EVDPONCOL]
GO
/****** Object:  Default [DF__TBEVAEVD__EVDPON__632F8E56]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAEVD] ADD  DEFAULT ((0)) FOR [EVDPONCLI]
GO
/****** Object:  Default [DF__TBEVAEVD__EVDPON__6423B28F]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAEVD] ADD  DEFAULT ((0)) FOR [EVDPONJSU]
GO
/****** Object:  Default [DF__TBEVAEVD__EVDPON__6517D6C8]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAEVD] ADD  DEFAULT ((0)) FOR [EVDPONOTR]
GO
/****** Object:  Default [DF__TBEVAEVD__EVDPON__660BFB01]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAEVD] ADD  DEFAULT ((0)) FOR [EVDPONCLE]
GO
/****** Object:  Default [DF__TBEVAEVD__EVDPON__67001F3A]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAEVD] ADD  DEFAULT ((0)) FOR [EVDPONPRO]
GO
/****** Object:  Default [DF__TBEVAEVD__EVDVER__67F44373]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAEVD] ADD  DEFAULT ((0)) FOR [EVDVERAUT]
GO
/****** Object:  Default [DF__TBEVAEVD__EVDVER__68E867AC]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAEVD] ADD  DEFAULT ((0)) FOR [EVDVERjsu]
GO
/****** Object:  Default [DF__TBEVAEVD__EVDVER__69DC8BE5]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAEVD] ADD  DEFAULT ((0)) FOR [EVDVERotr]
GO
/****** Object:  Default [DF__TBEVAEVD__EVDVER__6AD0B01E]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAEVD] ADD  DEFAULT ((0)) FOR [EVDVERPAR]
GO
/****** Object:  Default [DF__TBEVAEVD__EVDVER__6BC4D457]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAEVD] ADD  DEFAULT ((0)) FOR [EVDVERSUP]
GO
/****** Object:  Default [DF__TBEVAEVD__EVDVER__6CB8F890]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAEVD] ADD  DEFAULT ((0)) FOR [EVDVERcol]
GO
/****** Object:  Default [DF__TBEVAEVD__EVDVER__6DAD1CC9]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAEVD] ADD  DEFAULT ((0)) FOR [EVDVERCLI]
GO
/****** Object:  Default [DF__TBEVAEVD__EVDVER__6EA14102]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAEVD] ADD  DEFAULT ((0)) FOR [EVDVERPRO]
GO
/****** Object:  Default [DF__TBEVAEVD__EVDVER__6F95653B]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAEVD] ADD  DEFAULT ((0)) FOR [EVDVERcle]
GO
/****** Object:  Default [DF__TBEVAEVD__EVDUSO__70898974]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAEVD] ADD  DEFAULT ((0)) FOR [EVDUSOSUP]
GO
/****** Object:  Default [DF__TBEVAEVD__EVDUSO__717DADAD]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAEVD] ADD  DEFAULT ((0)) FOR [EVDUSOAUT]
GO
/****** Object:  Default [DF__TBEVAEVD__EVDUSO__7271D1E6]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAEVD] ADD  DEFAULT ((0)) FOR [EVDUSOPAR]
GO
/****** Object:  Default [DF__TBEVAEVD__EVDUSO__7365F61F]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAEVD] ADD  DEFAULT ((0)) FOR [EVDUSOCOL]
GO
/****** Object:  Default [DF__TBEVAEVD__EVDUSO__745A1A58]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAEVD] ADD  DEFAULT ((0)) FOR [EVDUSOCLI]
GO
/****** Object:  Default [DF__TBEVAEVD__EVDUSO__754E3E91]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAEVD] ADD  DEFAULT ((0)) FOR [EVDUSOJSU]
GO
/****** Object:  Default [DF__TBEVAEVD__EVDUSO__764262CA]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAEVD] ADD  DEFAULT ((0)) FOR [EVDUSOOTR]
GO
/****** Object:  Default [DF__TBEVAEVD__EVDUSO__77368703]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAEVD] ADD  DEFAULT ((0)) FOR [EVDUSOCLE]
GO
/****** Object:  Default [DF__TBEVAEVD__EVDUSO__782AAB3C]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAEVD] ADD  DEFAULT ((0)) FOR [EVDUSOPRO]
GO
/****** Object:  Default [DF__TBEVAEVD__evdfch__791ECF75]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAEVD] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [evdfchter]
GO
/****** Object:  Default [DF__TBEVAEVD__evdfch__7A12F3AE]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAEVD] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [evdfchlim]
GO
/****** Object:  Default [DF__TBEVAEVD__evdfch__7B0717E7]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAEVD] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [evdfchpin]
GO
/****** Object:  Default [DF__TBEVAEVD__evdfch__7BFB3C20]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAEVD] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [evdfchpfn]
GO
/****** Object:  Default [DF__TBEVAEVD__evdtit__7CEF6059]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAEVD] ADD  DEFAULT (' ') FOR [evdtitulo]
GO
/****** Object:  Default [DF__TBEVAEVD__evdest__7DE38492]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAEVD] ADD  DEFAULT ((0)) FOR [evdestado]
GO
/****** Object:  Default [DF__TBEVAEVD__EVDHAB__7ED7A8CB]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAEVD] ADD  DEFAULT ((0)) FOR [EVDHABCIC]
GO
/****** Object:  Default [DF__TBEVAEVD__EVDHAB__7FCBCD04]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAEVD] ADD  DEFAULT ((0)) FOR [EVDHABMAIL]
GO
/****** Object:  Default [DF__TBEVAEVD__EVDHAB__00BFF13D]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAEVD] ADD  DEFAULT ((0)) FOR [EVDHABGAC]
GO
/****** Object:  Default [DF__TBEVAEVD__EVDOCU__01B41576]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAEVD] ADD  DEFAULT ((0)) FOR [EVDOCUCG]
GO
/****** Object:  Default [DF__TBEVAEVD__EVDHAM__02A839AF]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAEVD] ADD  DEFAULT ((0)) FOR [EVDHAMEPA]
GO
/****** Object:  Default [DF__TBEVAEVD__EVDMOD__039C5DE8]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAEVD] ADD  DEFAULT ((0)) FOR [EVDMODOBS]
GO
/****** Object:  Default [DF__TBEVAEVD__EVDOCP__04908221]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAEVD] ADD  DEFAULT ((0)) FOR [EVDOCPONAC]
GO
/****** Object:  Default [DF__TBEVAEVD__EVDAAS__0584A65A]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAEVD] ADD  DEFAULT ((0)) FOR [EVDAASS]
GO
/****** Object:  Default [DF__TBEVAEVD__EVDPME__0678CA93]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAEVD] ADD  DEFAULT ((0)) FOR [EVDPMETCR]
GO
/****** Object:  Default [DF__TBEVAEVD__EVDPME__076CEECC]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAEVD] ADD  DEFAULT ((0)) FOR [EVDPMETCO]
GO
/****** Object:  Default [DF__TBEVAEVD__EVDORA__08611305]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAEVD] ADD  DEFAULT ((0)) FOR [EVDORAP]
GO
/****** Object:  Default [DF__TBEVAEVD__EVDCFA__0955373E]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAEVD] ADD  DEFAULT ((0)) FOR [EVDCFAENT]
GO
/****** Object:  Default [DF__TBEVAEVD__EVDCAM__0A495B77]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAEVD] ADD  DEFAULT ((0)) FOR [EVDCAMEVA]
GO
/****** Object:  Default [DF__TBEVAEVD__EVDSUC__0B3D7FB0]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAEVD] ADD  DEFAULT ((0)) FOR [EVDSUCESI]
GO
/****** Object:  Default [DF__TBEVAEVD__EVDREQ__0C31A3E9]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAEVD] ADD  DEFAULT ((0)) FOR [EVDREQAUT]
GO
/****** Object:  Default [DF__TBEVAEVD__EVDREQ__0D25C822]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAEVD] ADD  DEFAULT ((0)) FOR [EVDREQAU2]
GO
/****** Object:  Default [DF__TBEVAEVD__EVDREV__0E19EC5B]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAEVD] ADD  DEFAULT ((0)) FOR [EVDREVIS1]
GO
/****** Object:  Default [DF__TBEVAEVD__EVDRE1__0F0E1094]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAEVD] ADD  DEFAULT (' ') FOR [EVDRE1OTR]
GO
/****** Object:  Default [DF__TBEVAEVD__EVDRE1__100234CD]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAEVD] ADD  DEFAULT ((0)) FOR [EVDRE1TIP]
GO
/****** Object:  Default [DF__TBEVAEVD__EVDREV__10F65906]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAEVD] ADD  DEFAULT ((0)) FOR [EVDREVIS2]
GO
/****** Object:  Default [DF__TBEVAEVD__EVDRE2__11EA7D3F]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAEVD] ADD  DEFAULT (' ') FOR [EVDRE2OTR]
GO
/****** Object:  Default [DF__TBEVAEVD__EVDRE2__12DEA178]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAEVD] ADD  DEFAULT ((0)) FOR [EVDRE2TIP]
GO
/****** Object:  Default [DF__TBEVAEVD__EVDRE2__13D2C5B1]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAEVD] ADD  DEFAULT (' ') FOR [EVDRE2MAI]
GO
/****** Object:  Default [DF__TBEVAEVD__EVDRE1__14C6E9EA]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAEVD] ADD  DEFAULT (' ') FOR [EVDRE1MAI]
GO
/****** Object:  Default [DF__TBEVAEVD__EVDRER__15BB0E23]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAEVD] ADD  DEFAULT ((0)) FOR [EVDRERRHH]
GO
/****** Object:  Default [DF__TBEVAEVD__EVDINF__16AF325C]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAEVD] ADD  DEFAULT ((0)) FOR [EVDINFEEN]
GO
/****** Object:  Default [DF__TBEVAEVD__EVDFEE__17A35695]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAEVD] ADD  DEFAULT ((0)) FOR [EVDFEENFU]
GO
/****** Object:  Default [DF__TBEVAEVD__EVDOCU__18977ACE]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAEVD] ADD  DEFAULT ((0)) FOR [EVDOCUSUC]
GO
/****** Object:  Default [DF__TBEVAEVD__EVDOCU__198B9F07]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAEVD] ADD  DEFAULT ((0)) FOR [EVDOCUFOR]
GO
/****** Object:  Default [DF__TBEVAEVD__Jdd__1A7FC340]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAEVD] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__TBEVAEMP__EMPCOD__0C66AE13]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAEMP] ADD  DEFAULT ((0)) FOR [EMPCODEVA]
GO
/****** Object:  Default [DF__TBEVAEMP__CODIGO__0D5AD24C]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAEMP] ADD  DEFAULT (' ') FOR [CODIGO]
GO
/****** Object:  Default [DF__TBEVAEMP__EMPLEG__0E4EF685]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAEMP] ADD  DEFAULT (' ') FOR [EMPLEGAJOS]
GO
/****** Object:  Default [DF__TBEVAEMP__EMPLEG__0F431ABE]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAEMP] ADD  DEFAULT (' ') FOR [EMPLEGAJOE]
GO
/****** Object:  Default [DF__TBEVAEMP__EMPCOD__10373EF7]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAEMP] ADD  DEFAULT (' ') FOR [EMPCODPER]
GO
/****** Object:  Default [DF__TBEVAEMP__EMPCOD__112B6330]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAEMP] ADD  DEFAULT (' ') FOR [EMPCODFMT]
GO
/****** Object:  Default [DF__TBEVAEMP__EMPFEC__121F8769]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAEMP] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [EMPFECENV]
GO
/****** Object:  Default [DF__TBEVAEMP__EMPFEC__1313ABA2]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAEMP] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [EMPFECREC]
GO
/****** Object:  Default [DF__TBEVAEMP__EMPEST__1407CFDB]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAEMP] ADD  DEFAULT ((0)) FOR [EMPESTADO]
GO
/****** Object:  Default [DF__TBEVAEMP__EMPOBS__14FBF414]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAEMP] ADD  DEFAULT (' ') FOR [EMPOBSAPE]
GO
/****** Object:  Default [DF__TBEVAEMP__EMPNOR__15F0184D]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAEMP] ADD  DEFAULT ((0)) FOR [EMPNORMAL]
GO
/****** Object:  Default [DF__TBEVAEMP__EMPFOR__16E43C86]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAEMP] ADD  DEFAULT ((0)) FOR [EMPFORZADA]
GO
/****** Object:  Default [DF__TBEVAEMP__EMPCOM__17D860BF]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAEMP] ADD  DEFAULT (' ') FOR [EMPCOMLEG1]
GO
/****** Object:  Default [DF__TBEVAEMP__EMPCOM__18CC84F8]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAEMP] ADD  DEFAULT (' ') FOR [EMPCOMLEG2]
GO
/****** Object:  Default [DF__TBEVAEMP__EMPEVA__19C0A931]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAEMP] ADD  DEFAULT ((0)) FOR [EMPEVALUAC]
GO
/****** Object:  Default [DF__TBEVAEMP__EMPMET__1AB4CD6A]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAEMP] ADD  DEFAULT ((0)) FOR [EMPMETA]
GO
/****** Object:  Default [DF__TBEVAEMP__EMPPON__1BA8F1A3]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAEMP] ADD  DEFAULT ((0)) FOR [EMPPONDERA]
GO
/****** Object:  Default [DF__TBEVAEMP__EMPRES__1C9D15DC]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAEMP] ADD  DEFAULT (' ') FOR [EMPRESA]
GO
/****** Object:  Default [DF__TBEVAEMP__CARGO__1D913A15]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAEMP] ADD  DEFAULT ((0)) FOR [CARGO]
GO
/****** Object:  Default [DF__TBEVAEMP__OFICIN__1E855E4E]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAEMP] ADD  DEFAULT ((0)) FOR [OFICINA]
GO
/****** Object:  Default [DF__TBEVAEMP__CENCOS__1F798287]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAEMP] ADD  DEFAULT ((0)) FOR [CENCOS]
GO
/****** Object:  Default [DF__TBEVAEMP__UNIDAD__206DA6C0]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAEMP] ADD  DEFAULT ((0)) FOR [UNIDAD]
GO
/****** Object:  Default [DF__TBEVAEMP__EMPCOD__2161CAF9]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAEMP] ADD  DEFAULT ((0)) FOR [EMPCODIREA]
GO
/****** Object:  Default [DF__TBEVAEMP__EMPCOD__2255EF32]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAEMP] ADD  DEFAULT ((0)) FOR [EMPCODIREE]
GO
/****** Object:  Default [DF__TBEVAEMP__EMPCOD__234A136B]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAEMP] ADD  DEFAULT ((0)) FOR [EMPCODIREC]
GO
/****** Object:  Default [DF__TBEVAEMP__EMPIRE__243E37A4]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAEMP] ADD  DEFAULT ((0)) FOR [EMPIREPAR]
GO
/****** Object:  Default [DF__TBEVAEMP__EMPIRE__25325BDD]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAEMP] ADD  DEFAULT ((0)) FOR [EMPIREEMP]
GO
/****** Object:  Default [DF__TBEVAEMP__EMPIRE__26268016]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAEMP] ADD  DEFAULT ((0)) FOR [EMPIRECLI]
GO
/****** Object:  Default [DF__TBEVAEMP__EMPIRE__271AA44F]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAEMP] ADD  DEFAULT ((0)) FOR [EMPIREPRO]
GO
/****** Object:  Default [DF__TBEVAEMP__EMPIRE__280EC888]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAEMP] ADD  DEFAULT ((0)) FOR [EMPIREotr]
GO
/****** Object:  Default [DF__TBEVAEMP__EMPIRE__2902ECC1]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAEMP] ADD  DEFAULT ((0)) FOR [EMPIRESUP]
GO
/****** Object:  Default [DF__TBEVAEMP__EMPIRE__29F710FA]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAEMP] ADD  DEFAULT ((0)) FOR [EMPIRERES]
GO
/****** Object:  Default [DF__TBEVAEMP__EMPCER__2AEB3533]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAEMP] ADD  DEFAULT ((0)) FOR [EMPCERRAR]
GO
/****** Object:  Default [DF__TBEVAEMP__EMP_WE__2BDF596C]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAEMP] ADD  DEFAULT ((0)) FOR [EMP_WEB]
GO
/****** Object:  Default [DF__TBEVAEMP__EMPNOT__2CD37DA5]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAEMP] ADD  DEFAULT ((0)) FOR [EMPNOTTSUP]
GO
/****** Object:  Default [DF__TBEVAEMP__EMPNOT__2DC7A1DE]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAEMP] ADD  DEFAULT ((0)) FOR [EMPNOTTAUT]
GO
/****** Object:  Default [DF__TBEVAEMP__EMPNOT__2EBBC617]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAEMP] ADD  DEFAULT ((0)) FOR [EMPNOTTPAR]
GO
/****** Object:  Default [DF__TBEVAEMP__EMPNOT__2FAFEA50]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAEMP] ADD  DEFAULT ((0)) FOR [EMPNOTTCOL]
GO
/****** Object:  Default [DF__TBEVAEMP__EMPNOT__30A40E89]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAEMP] ADD  DEFAULT ((0)) FOR [EMPNOTTCLI]
GO
/****** Object:  Default [DF__TBEVAEMP__EMPNOT__319832C2]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAEMP] ADD  DEFAULT ((0)) FOR [EMPNOTTJSU]
GO
/****** Object:  Default [DF__TBEVAEMP__EMPNOT__328C56FB]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAEMP] ADD  DEFAULT ((0)) FOR [EMPNOTTCLE]
GO
/****** Object:  Default [DF__TBEVAEMP__EMPNOT__33807B34]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAEMP] ADD  DEFAULT ((0)) FOR [EMPNOTTPRO]
GO
/****** Object:  Default [DF__TBEVAEMP__EMPNOT__34749F6D]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAEMP] ADD  DEFAULT ((0)) FOR [EMPNOTTotr]
GO
/****** Object:  Default [DF__TBEVAEMP__EMPNOT__3568C3A6]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAEMP] ADD  DEFAULT ((0)) FOR [EMPNOTTFIN]
GO
/****** Object:  Default [DF__TBEVAEMP__EMPNOT__365CE7DF]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAEMP] ADD  DEFAULT ((0)) FOR [EMPNOTFSUP]
GO
/****** Object:  Default [DF__TBEVAEMP__EMPNOT__37510C18]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAEMP] ADD  DEFAULT ((0)) FOR [EMPNOTFAUT]
GO
/****** Object:  Default [DF__TBEVAEMP__EMPNOT__38453051]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAEMP] ADD  DEFAULT ((0)) FOR [EMPNOTFPAR]
GO
/****** Object:  Default [DF__TBEVAEMP__EMPNOT__3939548A]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAEMP] ADD  DEFAULT ((0)) FOR [EMPNOTFCOL]
GO
/****** Object:  Default [DF__TBEVAEMP__EMPNOT__3A2D78C3]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAEMP] ADD  DEFAULT ((0)) FOR [EMPNOTFCLI]
GO
/****** Object:  Default [DF__TBEVAEMP__EMPNOT__3B219CFC]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAEMP] ADD  DEFAULT ((0)) FOR [EMPNOTFSJU]
GO
/****** Object:  Default [DF__TBEVAEMP__EMPNOT__3C15C135]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAEMP] ADD  DEFAULT ((0)) FOR [EMPNOTFOTR]
GO
/****** Object:  Default [DF__TBEVAEMP__EMPNOT__3D09E56E]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAEMP] ADD  DEFAULT ((0)) FOR [EMPNOTFCLE]
GO
/****** Object:  Default [DF__TBEVAEMP__EMPNOT__3DFE09A7]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAEMP] ADD  DEFAULT ((0)) FOR [EMPNOTFPRO]
GO
/****** Object:  Default [DF__TBEVAEMP__EMPNOT__3EF22DE0]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAEMP] ADD  DEFAULT ((0)) FOR [EMPNOTFFIN]
GO
/****** Object:  Default [DF__TBEVAEMP__EMPNOT__3FE65219]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAEMP] ADD  DEFAULT ((0)) FOR [EMPNOTMSUP]
GO
/****** Object:  Default [DF__TBEVAEMP__EMPNOT__40DA7652]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAEMP] ADD  DEFAULT ((0)) FOR [EMPNOTCAUT]
GO
/****** Object:  Default [DF__TBEVAEMP__EMPNOT__41CE9A8B]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAEMP] ADD  DEFAULT ((0)) FOR [EMPNOTCPAR]
GO
/****** Object:  Default [DF__TBEVAEMP__EMPNOT__42C2BEC4]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAEMP] ADD  DEFAULT ((0)) FOR [EMPNOTCSUP]
GO
/****** Object:  Default [DF__TBEVAEMP__EMPNOT__43B6E2FD]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAEMP] ADD  DEFAULT ((0)) FOR [EMPNOTCCOL]
GO
/****** Object:  Default [DF__TBEVAEMP__EMPNOT__44AB0736]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAEMP] ADD  DEFAULT ((0)) FOR [EMPNOTCCLI]
GO
/****** Object:  Default [DF__TBEVAEMP__EMPNOT__459F2B6F]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAEMP] ADD  DEFAULT ((0)) FOR [EMPNOTCJSU]
GO
/****** Object:  Default [DF__TBEVAEMP__EMPNOT__46934FA8]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAEMP] ADD  DEFAULT ((0)) FOR [EMPNOTCOTR]
GO
/****** Object:  Default [DF__TBEVAEMP__EMPNOT__478773E1]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAEMP] ADD  DEFAULT ((0)) FOR [EMPNOTCCLE]
GO
/****** Object:  Default [DF__TBEVAEMP__EMPNOT__487B981A]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAEMP] ADD  DEFAULT ((0)) FOR [EMPNOTCPRO]
GO
/****** Object:  Default [DF__TBEVAEMP__EMPNOT__496FBC53]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAEMP] ADD  DEFAULT ((0)) FOR [EMPNOTCFIN]
GO
/****** Object:  Default [DF__TBEVAEMP__EMPNOT__4A63E08C]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAEMP] ADD  DEFAULT ((0)) FOR [EMPNOTMAUT]
GO
/****** Object:  Default [DF__TBEVAEMP__EMPNOT__4B5804C5]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAEMP] ADD  DEFAULT ((0)) FOR [EMPNOTMPAR]
GO
/****** Object:  Default [DF__TBEVAEMP__EMPNOT__4C4C28FE]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAEMP] ADD  DEFAULT ((0)) FOR [EMPNOTMCOL]
GO
/****** Object:  Default [DF__TBEVAEMP__EMPNOT__4D404D37]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAEMP] ADD  DEFAULT ((0)) FOR [EMPNOTMCLI]
GO
/****** Object:  Default [DF__TBEVAEMP__EMPNOT__4E347170]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAEMP] ADD  DEFAULT ((0)) FOR [EMPNOTMJSU]
GO
/****** Object:  Default [DF__TBEVAEMP__EMPNOT__4F2895A9]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAEMP] ADD  DEFAULT ((0)) FOR [EMPNOTMOTR]
GO
/****** Object:  Default [DF__TBEVAEMP__EMPNOT__501CB9E2]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAEMP] ADD  DEFAULT ((0)) FOR [EMPNOTMCLE]
GO
/****** Object:  Default [DF__TBEVAEMP__EMPNOT__5110DE1B]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAEMP] ADD  DEFAULT ((0)) FOR [EMPNOTMPRO]
GO
/****** Object:  Default [DF__TBEVAEMP__EMPNOT__52050254]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAEMP] ADD  DEFAULT ((0)) FOR [EMPNOTMFIN]
GO
/****** Object:  Default [DF__TBEVAEMP__empfec__52F9268D]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAEMP] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [empfeccer]
GO
/****** Object:  Default [DF__TBEVAEMP__EMPCOM__53ED4AC6]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAEMP] ADD  DEFAULT (' ') FOR [EMPCOMENT]
GO
/****** Object:  Default [DF__TBEVAEMP__Jdd__54E16EFF]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAEMP] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__TBEVADPR__dprcod__2B403AEE]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVADPR] ADD  DEFAULT ((0)) FOR [dprcodigo]
GO
/****** Object:  Default [DF__TBEVADPR__dprcod__2C345F27]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVADPR] ADD  DEFAULT (' ') FOR [dprcodfac]
GO
/****** Object:  Default [DF__TBEVADPR__dprcod__2D288360]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVADPR] ADD  DEFAULT (' ') FOR [dprcodsfa]
GO
/****** Object:  Default [DF__TBEVADPR__dprgru__2E1CA799]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVADPR] ADD  DEFAULT ((0)) FOR [dprgrupo]
GO
/****** Object:  Default [DF__TBEVADPR__dprsub__2F10CBD2]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVADPR] ADD  DEFAULT ((0)) FOR [dprsubcod]
GO
/****** Object:  Default [DF__TBEVADPR__dprcod__3004F00B]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVADPR] ADD  DEFAULT ((0)) FOR [dprcodgrd]
GO
/****** Object:  Default [DF__TBEVADPR__dprcod__30F91444]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVADPR] ADD  DEFAULT (' ') FOR [dprcodfac2]
GO
/****** Object:  Default [DF__TBEVADPR__dprcod__31ED387D]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVADPR] ADD  DEFAULT (' ') FOR [dprcodsfa2]
GO
/****** Object:  Default [DF__TBEVADPR__dpropc__32E15CB6]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVADPR] ADD  DEFAULT ((0)) FOR [dpropcion]
GO
/****** Object:  Default [DF__TBEVADPR__Jdd__33D580EF]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVADPR] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__TBEVADEP__DEPCOD__6A11960F]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVADEP] ADD  DEFAULT ((0)) FOR [DEPCODIGO]
GO
/****** Object:  Default [DF__TBEVADEP__DEPCOD__6B05BA48]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVADEP] ADD  DEFAULT (' ') FOR [DEPCODFMT]
GO
/****** Object:  Default [DF__TBEVADEP__DEPCOD__6BF9DE81]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVADEP] ADD  DEFAULT (' ') FOR [DEPCODFAC]
GO
/****** Object:  Default [DF__TBEVADEP__DEPCOD__6CEE02BA]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVADEP] ADD  DEFAULT (' ') FOR [DEPCODSFA]
GO
/****** Object:  Default [DF__TBEVADEP__DEPLEG__6DE226F3]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVADEP] ADD  DEFAULT (' ') FOR [DEPLEGAJO]
GO
/****** Object:  Default [DF__TBEVADEP__DEPPUN__6ED64B2C]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVADEP] ADD  DEFAULT ((0)) FOR [DEPPUNSUP]
GO
/****** Object:  Default [DF__TBEVADEP__DEPPUN__6FCA6F65]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVADEP] ADD  DEFAULT ((0)) FOR [DEPPUNAUT]
GO
/****** Object:  Default [DF__TBEVADEP__DEPPUN__70BE939E]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVADEP] ADD  DEFAULT ((0)) FOR [DEPPUNPAR]
GO
/****** Object:  Default [DF__TBEVADEP__DEPPUN__71B2B7D7]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVADEP] ADD  DEFAULT ((0)) FOR [DEPPUNCOL]
GO
/****** Object:  Default [DF__TBEVADEP__DEPPUN__72A6DC10]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVADEP] ADD  DEFAULT ((0)) FOR [DEPPUNCLI]
GO
/****** Object:  Default [DF__TBEVADEP__DEPPUN__739B0049]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVADEP] ADD  DEFAULT ((0)) FOR [DEPPUNJSU]
GO
/****** Object:  Default [DF__TBEVADEP__DEPPUN__748F2482]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVADEP] ADD  DEFAULT ((0)) FOR [DEPPUNOTR]
GO
/****** Object:  Default [DF__TBEVADEP__DEPPUN__758348BB]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVADEP] ADD  DEFAULT ((0)) FOR [DEPPUNCLE]
GO
/****** Object:  Default [DF__TBEVADEP__DEPPUN__76776CF4]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVADEP] ADD  DEFAULT ((0)) FOR [DEPPUNPRO]
GO
/****** Object:  Default [DF__TBEVADEP__DEPOBS__776B912D]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVADEP] ADD  DEFAULT (' ') FOR [DEPOBSERVA]
GO
/****** Object:  Default [DF__TBEVADEP__DEPOBS__785FB566]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVADEP] ADD  DEFAULT (' ') FOR [DEPOBSERVE]
GO
/****** Object:  Default [DF__TBEVADEP__DEPOBS__7953D99F]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVADEP] ADD  DEFAULT (' ') FOR [DEPOBSERVC]
GO
/****** Object:  Default [DF__TBEVADEP__DEPOBS__7A47FDD8]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVADEP] ADD  DEFAULT (' ') FOR [DEPOBSPAR]
GO
/****** Object:  Default [DF__TBEVADEP__DEPOBS__7B3C2211]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVADEP] ADD  DEFAULT (' ') FOR [DEPOBSSUP]
GO
/****** Object:  Default [DF__TBEVADEP__DEPOBS__7C30464A]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVADEP] ADD  DEFAULT (' ') FOR [DEPOBSEMS]
GO
/****** Object:  Default [DF__TBEVADEP__DEPOBS__7D246A83]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVADEP] ADD  DEFAULT (' ') FOR [DEPOBSCLI]
GO
/****** Object:  Default [DF__TBEVADEP__DEPOBS__7E188EBC]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVADEP] ADD  DEFAULT (' ') FOR [DEPOBSPRO]
GO
/****** Object:  Default [DF__TBEVADEP__DEPOBS__7F0CB2F5]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVADEP] ADD  DEFAULT (' ') FOR [DEPOBSotr]
GO
/****** Object:  Default [DF__TBEVADEP__DEPCOM__0000D72E]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVADEP] ADD  DEFAULT (' ') FOR [DEPCOMENTA]
GO
/****** Object:  Default [DF__TBEVADEP__DEPCOM__00F4FB67]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVADEP] ADD  DEFAULT (' ') FOR [DEPCOMENTE]
GO
/****** Object:  Default [DF__TBEVADEP__DEPCOM__01E91FA0]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVADEP] ADD  DEFAULT (' ') FOR [DEPCOMENTC]
GO
/****** Object:  Default [DF__TBEVADEP__DEPCOM__02DD43D9]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVADEP] ADD  DEFAULT (' ') FOR [DEPCOMPAR]
GO
/****** Object:  Default [DF__TBEVADEP__DEPCOM__03D16812]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVADEP] ADD  DEFAULT (' ') FOR [DEPCOMSUP]
GO
/****** Object:  Default [DF__TBEVADEP__DEPCOM__04C58C4B]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVADEP] ADD  DEFAULT (' ') FOR [DEPCOMEMS]
GO
/****** Object:  Default [DF__TBEVADEP__DEPCOM__05B9B084]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVADEP] ADD  DEFAULT (' ') FOR [DEPCOMCLI]
GO
/****** Object:  Default [DF__TBEVADEP__DEPCOM__06ADD4BD]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVADEP] ADD  DEFAULT (' ') FOR [DEPCOMPRO]
GO
/****** Object:  Default [DF__TBEVADEP__DEPCOM__07A1F8F6]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVADEP] ADD  DEFAULT (' ') FOR [DEPCOMotr]
GO
/****** Object:  Default [DF__TBEVADEP__DEPPTS__08961D2F]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVADEP] ADD  DEFAULT ((0)) FOR [DEPPTSRFIN]
GO
/****** Object:  Default [DF__TBEVADEP__Jdd__098A4168]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVADEP] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__TBEVADEF__DEFCOD__1CF21B97]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVADEF] ADD  DEFAULT ((0)) FOR [DEFCODIGO]
GO
/****** Object:  Default [DF__TBEVADEF__DEFCOD__1DE63FD0]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVADEF] ADD  DEFAULT (' ') FOR [DEFCODFMT]
GO
/****** Object:  Default [DF__TBEVADEF__DEFCOD__1EDA6409]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVADEF] ADD  DEFAULT (' ') FOR [DEFCODFAC]
GO
/****** Object:  Default [DF__TBEVADEF__DEFPUN__1FCE8842]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVADEF] ADD  DEFAULT ((0)) FOR [DEFPUNTOSA]
GO
/****** Object:  Default [DF__TBEVADEF__DEFPUN__20C2AC7B]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVADEF] ADD  DEFAULT ((0)) FOR [DEFPUNTOSE]
GO
/****** Object:  Default [DF__TBEVADEF__DEFPUN__21B6D0B4]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVADEF] ADD  DEFAULT ((0)) FOR [DEFPUNTOSC]
GO
/****** Object:  Default [DF__TBEVADEF__DEFPTS__22AAF4ED]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVADEF] ADD  DEFAULT ((0)) FOR [DEFPTSPAR]
GO
/****** Object:  Default [DF__TBEVADEF__DEFPTS__239F1926]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVADEF] ADD  DEFAULT ((0)) FOR [DEFPTSSUP]
GO
/****** Object:  Default [DF__TBEVADEF__DEFPTS__24933D5F]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVADEF] ADD  DEFAULT ((0)) FOR [DEFPTSEMS]
GO
/****** Object:  Default [DF__TBEVADEF__DEFPTS__25876198]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVADEF] ADD  DEFAULT ((0)) FOR [DEFPTSCLI]
GO
/****** Object:  Default [DF__TBEVADEF__DEFPTS__267B85D1]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVADEF] ADD  DEFAULT ((0)) FOR [DEFPTSPRO]
GO
/****** Object:  Default [DF__TBEVADEF__defpts__276FAA0A]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVADEF] ADD  DEFAULT ((0)) FOR [defptsotr]
GO
/****** Object:  Default [DF__TBEVADEF__Jdd__2863CE43]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVADEF] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__TBEVACON__CONCOD__36E6F7C4]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVACON] ADD  DEFAULT ((0)) FOR [CONCODINC]
GO
/****** Object:  Default [DF__TBEVACON__CONCOD__37DB1BFD]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVACON] ADD  DEFAULT ((0)) FOR [CONCODIGO]
GO
/****** Object:  Default [DF__TBEVACON__CONPOR__38CF4036]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVACON] ADD  DEFAULT ((0)) FOR [CONPORCENT]
GO
/****** Object:  Default [DF__TBEVACON__CONPRO__39C3646F]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVACON] ADD  DEFAULT (' ') FOR [CONPROCED]
GO
/****** Object:  Default [DF__TBEVACON__CONAPL__3AB788A8]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVACON] ADD  DEFAULT ((0)) FOR [CONAPLICA]
GO
/****** Object:  Default [DF__TBEVACON__CONTEX__3BABACE1]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVACON] ADD  DEFAULT ((0)) FOR [CONTEXCLU]
GO
/****** Object:  Default [DF__TBEVACON__CONHAB__3C9FD11A]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVACON] ADD  DEFAULT ((0)) FOR [CONHABILIT]
GO
/****** Object:  Default [DF__TBEVACON__CONDES__3D93F553]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVACON] ADD  DEFAULT (' ') FOR [CONDESCRIP]
GO
/****** Object:  Default [DF__TBEVACON__CONCON__3E88198C]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVACON] ADD  DEFAULT (' ') FOR [CONCONDIC]
GO
/****** Object:  Default [DF__TBEVACON__CONDES__3F7C3DC5]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVACON] ADD  DEFAULT (' ') FOR [CONDESCAD]
GO
/****** Object:  Default [DF__TBEVACON__CONVER__407061FE]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVACON] ADD  DEFAULT ((0)) FOR [CONVER]
GO
/****** Object:  Default [DF__TBEVACON__CONT1E__41648637]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVACON] ADD  DEFAULT ((0)) FOR [CONT1E]
GO
/****** Object:  Default [DF__TBEVACON__CONT1A__4258AA70]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVACON] ADD  DEFAULT ((0)) FOR [CONT1A]
GO
/****** Object:  Default [DF__TBEVACON__CONT2E__434CCEA9]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVACON] ADD  DEFAULT ((0)) FOR [CONT2E]
GO
/****** Object:  Default [DF__TBEVACON__CONT2A__4440F2E2]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVACON] ADD  DEFAULT ((0)) FOR [CONT2A]
GO
/****** Object:  Default [DF__TBEVACON__CONT3E__4535171B]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVACON] ADD  DEFAULT ((0)) FOR [CONT3E]
GO
/****** Object:  Default [DF__TBEVACON__CONT3A__46293B54]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVACON] ADD  DEFAULT ((0)) FOR [CONT3A]
GO
/****** Object:  Default [DF__TBEVACON__CONT4E__471D5F8D]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVACON] ADD  DEFAULT ((0)) FOR [CONT4E]
GO
/****** Object:  Default [DF__TBEVACON__CONT4A__481183C6]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVACON] ADD  DEFAULT ((0)) FOR [CONT4A]
GO
/****** Object:  Default [DF__TBEVACON__CONT5E__4905A7FF]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVACON] ADD  DEFAULT ((0)) FOR [CONT5E]
GO
/****** Object:  Default [DF__TBEVACON__CONT5A__49F9CC38]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVACON] ADD  DEFAULT ((0)) FOR [CONT5A]
GO
/****** Object:  Default [DF__TBEVACON__CONT6E__4AEDF071]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVACON] ADD  DEFAULT ((0)) FOR [CONT6E]
GO
/****** Object:  Default [DF__TBEVACON__CONT6A__4BE214AA]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVACON] ADD  DEFAULT ((0)) FOR [CONT6A]
GO
/****** Object:  Default [DF__TBEVACON__CONT7E__4CD638E3]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVACON] ADD  DEFAULT ((0)) FOR [CONT7E]
GO
/****** Object:  Default [DF__TBEVACON__CONT7A__4DCA5D1C]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVACON] ADD  DEFAULT ((0)) FOR [CONT7A]
GO
/****** Object:  Default [DF__TBEVACON__CONT8E__4EBE8155]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVACON] ADD  DEFAULT ((0)) FOR [CONT8E]
GO
/****** Object:  Default [DF__TBEVACON__CONT8A__4FB2A58E]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVACON] ADD  DEFAULT ((0)) FOR [CONT8A]
GO
/****** Object:  Default [DF__TBEVACON__CONT9E__50A6C9C7]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVACON] ADD  DEFAULT ((0)) FOR [CONT9E]
GO
/****** Object:  Default [DF__TBEVACON__CONT9A__519AEE00]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVACON] ADD  DEFAULT ((0)) FOR [CONT9A]
GO
/****** Object:  Default [DF__TBEVACON__CONT10__528F1239]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVACON] ADD  DEFAULT ((0)) FOR [CONT10E]
GO
/****** Object:  Default [DF__TBEVACON__CONT10__53833672]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVACON] ADD  DEFAULT ((0)) FOR [CONT10A]
GO
/****** Object:  Default [DF__TBEVACON__CONT11__54775AAB]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVACON] ADD  DEFAULT ((0)) FOR [CONT11E]
GO
/****** Object:  Default [DF__TBEVACON__CONT11__556B7EE4]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVACON] ADD  DEFAULT ((0)) FOR [CONT11A]
GO
/****** Object:  Default [DF__TBEVACON__CONT12__565FA31D]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVACON] ADD  DEFAULT ((0)) FOR [CONT12E]
GO
/****** Object:  Default [DF__TBEVACON__CONT12__5753C756]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVACON] ADD  DEFAULT ((0)) FOR [CONT12A]
GO
/****** Object:  Default [DF__TBEVACON__CONT13__5847EB8F]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVACON] ADD  DEFAULT ((0)) FOR [CONT13E]
GO
/****** Object:  Default [DF__TBEVACON__CONT13__593C0FC8]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVACON] ADD  DEFAULT ((0)) FOR [CONT13A]
GO
/****** Object:  Default [DF__TBEVACON__CONT14__5A303401]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVACON] ADD  DEFAULT ((0)) FOR [CONT14E]
GO
/****** Object:  Default [DF__TBEVACON__CONT14__5B24583A]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVACON] ADD  DEFAULT ((0)) FOR [CONT14A]
GO
/****** Object:  Default [DF__TBEVACON__CONT15__5C187C73]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVACON] ADD  DEFAULT ((0)) FOR [CONT15E]
GO
/****** Object:  Default [DF__TBEVACON__CONT15__5D0CA0AC]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVACON] ADD  DEFAULT ((0)) FOR [CONT15A]
GO
/****** Object:  Default [DF__TBEVACON__CONTIP__5E00C4E5]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVACON] ADD  DEFAULT ((0)) FOR [CONTIPO]
GO
/****** Object:  Default [DF__TBEVACON__CONTIP__5EF4E91E]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVACON] ADD  DEFAULT ((0)) FOR [CONTIPOCAL]
GO
/****** Object:  Default [DF__TBEVACON__CONCOD__5FE90D57]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVACON] ADD  DEFAULT ((0)) FOR [CONCODEVA]
GO
/****** Object:  Default [DF__TBEVACON__Jdd__60DD3190]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVACON] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__TBEVACGR__cgrnum__19E0A4C2]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVACGR] ADD  DEFAULT ((0)) FOR [cgrnumero]
GO
/****** Object:  Default [DF__TBEVACGR__cgreva__1AD4C8FB]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVACGR] ADD  DEFAULT ((0)) FOR [cgrevaluac]
GO
/****** Object:  Default [DF__TBEVACGR__cgrgru__1BC8ED34]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVACGR] ADD  DEFAULT ((0)) FOR [cgrgrupo]
GO
/****** Object:  Default [DF__TBEVACGR__cgrvot__1CBD116D]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVACGR] ADD  DEFAULT ((0)) FOR [cgrvotante]
GO
/****** Object:  Default [DF__TBEVACGR__cgrtip__1DB135A6]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVACGR] ADD  DEFAULT ((0)) FOR [cgrtipovot]
GO
/****** Object:  Default [DF__TBEVACGR__cgrfec__1EA559DF]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVACGR] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [cgrfecha]
GO
/****** Object:  Default [DF__TBEVACGR__cgrano__1F997E18]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVACGR] ADD  DEFAULT (' ') FOR [cgranot]
GO
/****** Object:  Default [DF__TBEVACGR__cgrcom__208DA251]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVACGR] ADD  DEFAULT (' ') FOR [cgrcoment]
GO
/****** Object:  Default [DF__TBEVACGR__Jdd__2181C68A]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVACGR] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__TBEVACFG__CFGFOR__312E1E6E]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVACFG] ADD  DEFAULT (' ') FOR [CFGFORM]
GO
/****** Object:  Default [DF__TBEVACFG__CFGVAL__322242A7]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVACFG] ADD  DEFAULT ((0)) FOR [CFGVALOR]
GO
/****** Object:  Default [DF__TBEVACFG__CFGVAL__331666E0]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVACFG] ADD  DEFAULT (' ') FOR [CFGVALOR2]
GO
/****** Object:  Default [DF__TBEVACFG__Jdd__340A8B19]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVACFG] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__TBEVACES__cesnum__245E3335]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVACES] ADD  DEFAULT ((0)) FOR [cesnumero]
GO
/****** Object:  Default [DF__TBEVACES__ceseva__2552576E]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVACES] ADD  DEFAULT ((0)) FOR [cesevaluac]
GO
/****** Object:  Default [DF__TBEVACES__cesgru__26467BA7]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVACES] ADD  DEFAULT ((0)) FOR [cesgrupo]
GO
/****** Object:  Default [DF__TBEVACES__cesvot__273A9FE0]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVACES] ADD  DEFAULT ((0)) FOR [cesvotante]
GO
/****** Object:  Default [DF__TBEVACES__cestip__282EC419]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVACES] ADD  DEFAULT ((0)) FOR [cestipovot]
GO
/****** Object:  Default [DF__TBEVACES__cesfac__2922E852]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVACES] ADD  DEFAULT (' ') FOR [cesfactor]
GO
/****** Object:  Default [DF__TBEVACES__cessub__2A170C8B]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVACES] ADD  DEFAULT (' ') FOR [cessubfac]
GO
/****** Object:  Default [DF__TBEVACES__cesfec__2B0B30C4]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVACES] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [cesfecha]
GO
/****** Object:  Default [DF__TBEVACES__cesano__2BFF54FD]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVACES] ADD  DEFAULT (' ') FOR [cesanot]
GO
/****** Object:  Default [DF__TBEVACES__cescom__2CF37936]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVACES] ADD  DEFAULT (' ') FOR [cescoment]
GO
/****** Object:  Default [DF__TBEVACES__cespos__2DE79D6F]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVACES] ADD  DEFAULT (' ') FOR [cesposneg]
GO
/****** Object:  Default [DF__TBEVACES__cesreq__2EDBC1A8]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVACES] ADD  DEFAULT ((0)) FOR [cesreqcap]
GO
/****** Object:  Default [DF__TBEVACES__cespos__2FCFE5E1]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVACES] ADD  DEFAULT ((0)) FOR [cesposneg2]
GO
/****** Object:  Default [DF__TBEVACES__Jdd__30C40A1A]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVACES] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__TBEVACEM__cemCOD__40064DAA]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVACEM] ADD  DEFAULT ((0)) FOR [cemCODEVD]
GO
/****** Object:  Default [DF__TBEVACEM__cemLEG__40FA71E3]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVACEM] ADD  DEFAULT (' ') FOR [cemLEGAJO]
GO
/****** Object:  Default [DF__TBEVACEM__cemMET__41EE961C]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVACEM] ADD  DEFAULT ((0)) FOR [cemMETCOD]
GO
/****** Object:  Default [DF__TBEVACEM__cemGRU__42E2BA55]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVACEM] ADD  DEFAULT ((0)) FOR [cemGRUPO]
GO
/****** Object:  Default [DF__TBEVACEM__cemCOD__43D6DE8E]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVACEM] ADD  DEFAULT ((0)) FOR [cemCODIGO]
GO
/****** Object:  Default [DF__TBEVACEM__cemFEC__44CB02C7]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVACEM] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [cemFECHA]
GO
/****** Object:  Default [DF__TBEVACEM__cemCOM__45BF2700]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVACEM] ADD  DEFAULT (' ') FOR [cemCOMENT]
GO
/****** Object:  Default [DF__TBEVACEM__cemANO__46B34B39]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVACEM] ADD  DEFAULT (' ') FOR [cemANOT]
GO
/****** Object:  Default [DF__TBEVACEM__cemPOS__47A76F72]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVACEM] ADD  DEFAULT (' ') FOR [cemPOSNEG]
GO
/****** Object:  Default [DF__TBEVACEM__cemREQ__489B93AB]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVACEM] ADD  DEFAULT ((0)) FOR [cemREQCAP]
GO
/****** Object:  Default [DF__TBEVACEM__cemPOR__498FB7E4]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVACEM] ADD  DEFAULT ((0)) FOR [cemPORC]
GO
/****** Object:  Default [DF__TBEVACEM__Jdd__4A83DC1D]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVACEM] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__TBEVACAT__codigo__051A9206]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVACAT] ADD  DEFAULT ((0)) FOR [codigo]
GO
/****** Object:  Default [DF__TBEVACAT__codvar__060EB63F]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVACAT] ADD  DEFAULT (' ') FOR [codvar]
GO
/****** Object:  Default [DF__TBEVACAT__archiv__0702DA78]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVACAT] ADD  DEFAULT (' ') FOR [archivo]
GO
/****** Object:  Default [DF__TBEVACAT__clasif__07F6FEB1]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVACAT] ADD  DEFAULT (' ') FOR [clasif]
GO
/****** Object:  Default [DF__TBEVACAT__campo__08EB22EA]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVACAT] ADD  DEFAULT (' ') FOR [campo]
GO
/****** Object:  Default [DF__TBEVACAT__captio__09DF4723]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVACAT] ADD  DEFAULT (' ') FOR [caption]
GO
/****** Object:  Default [DF__TBEVACAT__descri__0AD36B5C]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVACAT] ADD  DEFAULT (' ') FOR [descrip]
GO
/****** Object:  Default [DF__TBEVACAT__alias__0BC78F95]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVACAT] ADD  DEFAULT (' ') FOR [alias]
GO
/****** Object:  Default [DF__TBEVACAT__tabla__0CBBB3CE]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVACAT] ADD  DEFAULT ((0)) FOR [tabla]
GO
/****** Object:  Default [DF__TBEVACAT__rtcodi__0DAFD807]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVACAT] ADD  DEFAULT ((0)) FOR [rtcodigo]
GO
/****** Object:  Default [DF__TBEVACAT__contab__0EA3FC40]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVACAT] ADD  DEFAULT (' ') FOR [contab]
GO
/****** Object:  Default [DF__TBEVACAT__calcul__0F982079]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVACAT] ADD  DEFAULT (' ') FOR [calculo]
GO
/****** Object:  Default [DF__TBEVACAT__tipo__108C44B2]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVACAT] ADD  DEFAULT (' ') FOR [tipo]
GO
/****** Object:  Default [DF__TBEVACAT__largo__118068EB]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVACAT] ADD  DEFAULT ((0)) FOR [largo]
GO
/****** Object:  Default [DF__TBEVACAT__deci__12748D24]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVACAT] ADD  DEFAULT ((0)) FOR [deci]
GO
/****** Object:  Default [DF__TBEVACAT__format__1368B15D]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVACAT] ADD  DEFAULT (' ') FOR [format]
GO
/****** Object:  Default [DF__TBEVACAT__pic__145CD596]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVACAT] ADD  DEFAULT (' ') FOR [pic]
GO
/****** Object:  Default [DF__TBEVACAT__valida__1550F9CF]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVACAT] ADD  DEFAULT (' ') FOR [valida]
GO
/****** Object:  Default [DF__TBEVACAT__busca__16451E08]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVACAT] ADD  DEFAULT (' ') FOR [busca]
GO
/****** Object:  Default [DF__TBEVACAT__modi__17394241]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVACAT] ADD  DEFAULT (' ') FOR [modi]
GO
/****** Object:  Default [DF__TBEVACAT__histor__182D667A]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVACAT] ADD  DEFAULT (' ') FOR [histor]
GO
/****** Object:  Default [DF__TBEVACAT__lisord__19218AB3]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVACAT] ADD  DEFAULT (' ') FOR [lisord]
GO
/****** Object:  Default [DF__TBEVACAT__Jdd__1A15AEEC]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVACAT] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__TBEVAAPM__APMGRU__7EF7A45C]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAAPM] ADD  DEFAULT ((0)) FOR [APMGRUPO]
GO
/****** Object:  Default [DF__TBEVAAPM__APMEST__7FEBC895]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAAPM] ADD  DEFAULT ((0)) FOR [APMESTADO]
GO
/****** Object:  Default [DF__TBEVAAPM__APMEVA__00DFECCE]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAAPM] ADD  DEFAULT ((0)) FOR [APMEVALUA]
GO
/****** Object:  Default [DF__TBEVAAPM__APMSUP__01D41107]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAAPM] ADD  DEFAULT ((0)) FOR [APMSUPERI]
GO
/****** Object:  Default [DF__TBEVAAPM__APMREV__02C83540]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAAPM] ADD  DEFAULT ((0)) FOR [APMREVIS1]
GO
/****** Object:  Default [DF__TBEVAAPM__APMREV__03BC5979]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAAPM] ADD  DEFAULT ((0)) FOR [APMREVIS2]
GO
/****** Object:  Default [DF__TBEVAAPM__APMRRH__04B07DB2]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAAPM] ADD  DEFAULT ((0)) FOR [APMRRHH]
GO
/****** Object:  Default [DF__TBEVAAPM__APMEVD__05A4A1EB]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAAPM] ADD  DEFAULT ((0)) FOR [APMEVDCOD]
GO
/****** Object:  Default [DF__TBEVAAPM__Jdd__0698C624]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVAAPM] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__TBEVA_RHU__Modul__571EBD2C]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVA_RHU] ADD  DEFAULT (' ') FOR [Modulo]
GO
/****** Object:  Default [DF__TBEVA_RHU__Descr__5812E165]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVA_RHU] ADD  DEFAULT (' ') FOR [Descrip]
GO
/****** Object:  Default [DF__TBEVA_RHU__Tipo__5907059E]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVA_RHU] ADD  DEFAULT (' ') FOR [Tipo]
GO
/****** Object:  Default [DF__TBEVA_RHU__Campo__59FB29D7]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVA_RHU] ADD  DEFAULT (' ') FOR [Campos]
GO
/****** Object:  Default [DF__TBEVA_RHU__Desde__5AEF4E10]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVA_RHU] ADD  DEFAULT (' ') FOR [Desde]
GO
/****** Object:  Default [DF__TBEVA_RHU__Filtr__5BE37249]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVA_RHU] ADD  DEFAULT (' ') FOR [Filtro]
GO
/****** Object:  Default [DF__TBEVA_RHU__Agrup__5CD79682]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVA_RHU] ADD  DEFAULT (' ') FOR [Agrupa]
GO
/****** Object:  Default [DF__TBEVA_RHU__Orden__5DCBBABB]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVA_RHU] ADD  DEFAULT (' ') FOR [Orden]
GO
/****** Object:  Default [DF__TBEVA_RHU__Tippe__5EBFDEF4]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVA_RHU] ADD  DEFAULT ((0)) FOR [Tipper]
GO
/****** Object:  Default [DF__TBEVA_RHU__Cohad__5FB4032D]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVA_RHU] ADD  DEFAULT (' ') FOR [Cohades]
GO
/****** Object:  Default [DF__TBEVA_RHU__Usuar__60A82766]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVA_RHU] ADD  DEFAULT (' ') FOR [Usuario]
GO
/****** Object:  Default [DF__TBEVA_RHU__Indir__619C4B9F]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVA_RHU] ADD  DEFAULT ((0)) FOR [Indir]
GO
/****** Object:  Default [DF__TBEVA_RHU__Direc__62906FD8]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVA_RHU] ADD  DEFAULT (' ') FOR [Directa]
GO
/****** Object:  Default [DF__TBEVA_RHU__Swher__63849411]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVA_RHU] ADD  DEFAULT (' ') FOR [Swhere]
GO
/****** Object:  Default [DF__TBEVA_RHU__Pwher__6478B84A]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVA_RHU] ADD  DEFAULT (' ') FOR [Pwhere]
GO
/****** Object:  Default [DF__TBEVA_RHU__org__656CDC83]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVA_RHU] ADD  DEFAULT (' ') FOR [org]
GO
/****** Object:  Default [DF__TBEVA_RHU__cabec__666100BC]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVA_RHU] ADD  DEFAULT (' ') FOR [cabecera]
GO
/****** Object:  Default [DF__TBEVA_RHU__visib__675524F5]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVA_RHU] ADD  DEFAULT (' ') FOR [visibles]
GO
/****** Object:  Default [DF__TBEVA_RHU__nperi__6849492E]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVA_RHU] ADD  DEFAULT ((0)) FOR [nperiodo]
GO
/****** Object:  Default [DF__TBEVA_RHU__Pexpr__693D6D67]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVA_RHU] ADD  DEFAULT (' ') FOR [Pexpre]
GO
/****** Object:  Default [DF__TBEVA_RHU__Clasi__6A3191A0]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVA_RHU] ADD  DEFAULT ((0)) FOR [Clasif]
GO
/****** Object:  Default [DF__TBEVA_RHU__grupo__6B25B5D9]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVA_RHU] ADD  DEFAULT (' ') FOR [grupos]
GO
/****** Object:  Default [DF__TBEVA_RHU__dueno__6C19DA12]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVA_RHU] ADD  DEFAULT (' ') FOR [dueno]
GO
/****** Object:  Default [DF__TBEVA_RHU__Jdd__6D0DFE4B]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBEVA_RHU] ADD  DEFAULT ((0)) FOR [Jdd]
GO
--/****** Object:  Default [DF__tbdocemp__empleg__4297D63B]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[tbdocemp] ADD  DEFAULT (' ') FOR [emplegajo]
--GO
--/****** Object:  Default [DF__tbdocemp__emptip__438BFA74]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[tbdocemp] ADD  DEFAULT (0) FOR [emptipodoc]
--GO
--/****** Object:  Default [DF__tbdocemp__empfec__44801EAD]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[tbdocemp] ADD  DEFAULT (getdate()) FOR [empfecha]
--GO
--/****** Object:  Default [DF__tbdocemp__emparc__457442E6]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[tbdocemp] ADD  DEFAULT (' ') FOR [emparchivo]
--GO
--/****** Object:  Default [DF__tbdocemp__empcom__4668671F]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[tbdocemp] ADD  DEFAULT (' ') FOR [empcomenta]
--GO
/****** Object:  Default [DF__TBCASTRA__tracod__2DB29345]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBCASTRA] ADD  DEFAULT (' ') FOR [tracodigo]
GO
/****** Object:  Default [DF__TBCASTRA__trades__2EA6B77E]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBCASTRA] ADD  DEFAULT (' ') FOR [tradescrip]
GO
/****** Object:  Default [DF__TBCASTRA__trahor__2F9ADBB7]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBCASTRA] ADD  DEFAULT (' ') FOR [trahoraini]
GO
/****** Object:  Default [DF__TBCASTRA__trahor__308EFFF0]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBCASTRA] ADD  DEFAULT (' ') FOR [trahorafin]
GO
/****** Object:  Default [DF__TBCASTRA__tratip__31832429]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBCASTRA] ADD  DEFAULT (' ') FOR [tratipo]
GO
/****** Object:  Default [DF__TBCASTRA__tratol__32774862]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBCASTRA] ADD  DEFAULT (' ') FOR [tratolesat]
GO
/****** Object:  Default [DF__TBCASTRA__tratol__336B6C9B]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBCASTRA] ADD  DEFAULT (' ') FOR [tratoleshe]
GO
/****** Object:  Default [DF__TBCASTRA__tratol__345F90D4]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBCASTRA] ADD  DEFAULT (' ') FOR [tratolssin]
GO
/****** Object:  Default [DF__TBCASTRA__tratol__3553B50D]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBCASTRA] ADD  DEFAULT (' ') FOR [tratolsshe]
GO
/****** Object:  Default [DF__TBCASTRA__tracol__3647D946]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBCASTRA] ADD  DEFAULT ((0)) FOR [tracolor]
GO
/****** Object:  Default [DF__TBCASTRA__traint__373BFD7F]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBCASTRA] ADD  DEFAULT (' ') FOR [traintini]
GO
/****** Object:  Default [DF__TBCASTRA__traint__383021B8]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBCASTRA] ADD  DEFAULT (' ') FOR [traintfin]
GO
/****** Object:  Default [DF__TBCASTRA__trafla__392445F1]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBCASTRA] ADD  DEFAULT ((0)) FOR [traflags]
GO
/****** Object:  Default [DF__TBCASTRA__traent__3A186A2A]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBCASTRA] ADD  DEFAULT (' ') FOR [traentmax]
GO
/****** Object:  Default [DF__TBCASTRA__traent__3B0C8E63]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBCASTRA] ADD  DEFAULT (' ') FOR [traentsup]
GO
/****** Object:  Default [DF__TBCASTRA__tratol__3C00B29C]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBCASTRA] ADD  DEFAULT (' ') FOR [tratolent]
GO
/****** Object:  Default [DF__TBCASTRA__tratot__3CF4D6D5]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBCASTRA] ADD  DEFAULT (' ') FOR [tratotnor]
GO
/****** Object:  Default [DF__TBCASTRA__tratol__3DE8FB0E]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBCASTRA] ADD  DEFAULT (' ') FOR [tratolcol]
GO
/****** Object:  Default [DF__TBCASTRA__traent__3EDD1F47]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBCASTRA] ADD  DEFAULT (' ') FOR [traentlim]
GO
/****** Object:  Default [DF__TBCASTRA__tragru__3FD14380]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBCASTRA] ADD  DEFAULT ((0)) FOR [tragrupo]
GO
/****** Object:  Default [DF__TBCASTRA__tracon__40C567B9]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBCASTRA] ADD  DEFAULT (' ') FOR [traconjun]
GO
/****** Object:  Default [DF__TBCASTRA__Jdd__41B98BF2]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBCASTRA] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__tbcastnn__tnncod__4EDE7CE6]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[tbcastnn] ADD  DEFAULT ((0)) FOR [tnncodigo]
GO
/****** Object:  Default [DF__tbcastnn__tnndes__4FD2A11F]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[tbcastnn] ADD  DEFAULT (' ') FOR [tnndescrip]
GO
/****** Object:  Default [DF__tbcastnn__tnnord__50C6C558]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[tbcastnn] ADD  DEFAULT ((0)) FOR [tnnorden]
GO
/****** Object:  Default [DF__tbcastnn__tnnmen__51BAE991]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[tbcastnn] ADD  DEFAULT (' ') FOR [tnnmenu]
GO
/****** Object:  Default [DF__tbcastnn__tnn_lb__52AF0DCA]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[tbcastnn] ADD  DEFAULT (' ') FOR [tnn_lbl1]
GO
/****** Object:  Default [DF__tbcastnn__tnn_lb__53A33203]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[tbcastnn] ADD  DEFAULT (' ') FOR [tnn_lbl2]
GO
/****** Object:  Default [DF__tbcastnn__tnn_co__5497563C]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[tbcastnn] ADD  DEFAULT ((0)) FOR [tnn_cotab]
GO
/****** Object:  Default [DF__tbcastnn__tnn_ot__558B7A75]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[tbcastnn] ADD  DEFAULT ((0)) FOR [tnn_otros]
GO
/****** Object:  Default [DF__tbcastnn__tnnhab__567F9EAE]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[tbcastnn] ADD  DEFAULT ((0)) FOR [tnnhabilit]
GO
/****** Object:  Default [DF__tbcastnn__tnn_va__5773C2E7]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[tbcastnn] ADD  DEFAULT ((0)) FOR [tnn_valid]
GO
/****** Object:  Default [DF__tbcastnn__tnn_fr__5867E720]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[tbcastnn] ADD  DEFAULT (' ') FOR [tnn_frmext]
GO
/****** Object:  Default [DF__tbcastnn__tnn_co__595C0B59]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[tbcastnn] ADD  DEFAULT (' ') FOR [tnn_cols]
GO
/****** Object:  Default [DF__tbcastnn__Jdd__5A502F92]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[tbcastnn] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__tbcastnm__tnmcod__470850F4]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[tbcastnm] ADD  DEFAULT ((0)) FOR [tnmcodigo]
GO
/****** Object:  Default [DF__tbcastnm__tnmord__47FC752D]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[tbcastnm] ADD  DEFAULT ((0)) FOR [tnmorden]
GO
/****** Object:  Default [DF__tbcastnm__tnm_le__48F09966]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[tbcastnm] ADD  DEFAULT (' ') FOR [tnm_legaj]
GO
/****** Object:  Default [DF__tbcastnm__tnm_fe__49E4BD9F]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[tbcastnm] ADD  DEFAULT (' ') FOR [tnm_fecha]
GO
/****** Object:  Default [DF__tbcastnm__tnm_hi__4AD8E1D8]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[tbcastnm] ADD  DEFAULT (' ') FOR [tnm_hini]
GO
/****** Object:  Default [DF__tbcastnm__tnm_hf__4BCD0611]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[tbcastnm] ADD  DEFAULT (' ') FOR [tnm_hfin]
GO
/****** Object:  Default [DF__tbcastnm__tnm_ti__4CC12A4A]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[tbcastnm] ADD  DEFAULT (' ') FOR [tnm_tipo]
GO
/****** Object:  Default [DF__tbcastnm__tnm_ca__4DB54E83]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[tbcastnm] ADD  DEFAULT ((0)) FOR [tnm_cam]
GO
/****** Object:  Default [DF__tbcastnm__tnm_ce__4EA972BC]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[tbcastnm] ADD  DEFAULT (' ') FOR [tnm_cext]
GO
/****** Object:  Default [DF__tbcastnm__tnm_ex__4F9D96F5]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[tbcastnm] ADD  DEFAULT ((0)) FOR [tnm_excl]
GO
/****** Object:  Default [DF__tbcastnm__tnm_vt__5091BB2E]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[tbcastnm] ADD  DEFAULT ((0)) FOR [tnm_vteo]
GO
/****** Object:  Default [DF__tbcastnm__tnm_vn__5185DF67]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[tbcastnm] ADD  DEFAULT ((0)) FOR [tnm_vnov]
GO
/****** Object:  Default [DF__tbcastnm__tnm_td__527A03A0]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[tbcastnm] ADD  DEFAULT ((0)) FOR [tnm_tdia]
GO
/****** Object:  Default [DF__tbcastnm__Jdd__536E27D9]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[tbcastnm] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__TbCasTar__TarCod__6E221E15]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TbCasTar] ADD  DEFAULT (' ') FOR [TarCodigo]
GO
/****** Object:  Default [DF__TbCasTar__TarFec__6F16424E]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TbCasTar] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [TarFecha]
GO
/****** Object:  Default [DF__TbCasTar__TarUni__700A6687]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TbCasTar] ADD  DEFAULT ((0)) FOR [TarUnidad]
GO
/****** Object:  Default [DF__TbCasTar__TarHor__70FE8AC0]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TbCasTar] ADD  DEFAULT ((0)) FOR [TarHorasP]
GO
/****** Object:  Default [DF__TbCasTar__TarHor__71F2AEF9]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TbCasTar] ADD  DEFAULT ((0)) FOR [TarHorasR]
GO
/****** Object:  Default [DF__TbCasTar__TarTip__72E6D332]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TbCasTar] ADD  DEFAULT ((0)) FOR [TarTipAsiP]
GO
/****** Object:  Default [DF__TbCasTar__TarTip__73DAF76B]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TbCasTar] ADD  DEFAULT ((0)) FOR [TarTipAsiR]
GO
/****** Object:  Default [DF__TbCasTad__TadAme__21A1C21B]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TbCasTad] ADD  DEFAULT (' ') FOR [TadAmes]
GO
/****** Object:  Default [DF__TbCasTad__TadUni__2295E654]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TbCasTad] ADD  DEFAULT ((0)) FOR [TadUnidad]
GO
/****** Object:  Default [DF__TbCasTad__TadFec__238A0A8D]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TbCasTad] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [TadFecha]
GO
/****** Object:  Default [DF__TbCasTad__TadFec__247E2EC6]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TbCasTad] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [TadFecIni]
GO
/****** Object:  Default [DF__TbCasTad__TadFec__257252FF]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TbCasTad] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [TadFecFin]
GO
/****** Object:  Default [DF__TbCasTad__TadEst__26667738]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TbCasTad] ADD  DEFAULT (' ') FOR [TadEstadop]
GO
/****** Object:  Default [DF__TbCasTad__TadEst__275A9B71]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TbCasTad] ADD  DEFAULT (' ') FOR [TadEstador]
GO
/****** Object:  Default [DF__TbCasTad__TadUsu__284EBFAA]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TbCasTad] ADD  DEFAULT (' ') FOR [TadUsuMod]
GO
/****** Object:  Default [DF__TbCasTad__TadFec__2942E3E3]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TbCasTad] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [TadFecMod]
GO
/****** Object:  Default [DF__TbCasTad__TadUsu__2A37081C]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TbCasTad] ADD  DEFAULT (' ') FOR [TadUsuSup]
GO
/****** Object:  Default [DF__TbCasTad__TadFec__2B2B2C55]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TbCasTad] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [TadFecSup]
GO
/****** Object:  Default [DF__TbCasTad__TadUsu__2C1F508E]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TbCasTad] ADD  DEFAULT (' ') FOR [TadUsuApr1]
GO
/****** Object:  Default [DF__TbCasTad__TadFec__2D1374C7]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TbCasTad] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [TadFecaPr1]
GO
/****** Object:  Default [DF__TbCasTad__TadUsu__2E079900]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TbCasTad] ADD  DEFAULT (' ') FOR [TadUsuApr2]
GO
/****** Object:  Default [DF__TbCasTad__TadFec__2EFBBD39]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TbCasTad] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [TadFecApr2]
GO
/****** Object:  Default [DF__TbCasTad__TadUsu__2FEFE172]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TbCasTad] ADD  DEFAULT (' ') FOR [TadUsuRrhh]
GO
/****** Object:  Default [DF__TbCasTad__TadFec__30E405AB]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TbCasTad] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [TadFecRrhh]
GO
/****** Object:  Default [DF__TbCasTad__TadEst__31D829E4]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TbCasTad] ADD  DEFAULT (' ') FOR [TadEstadoE]
GO
/****** Object:  Default [DF__TbCasStr__StrFec__0505836D]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TbCasStr] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [StrFecha]
GO
/****** Object:  Default [DF__TbCasStr__StrUni__05F9A7A6]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TbCasStr] ADD  DEFAULT ((0)) FOR [StrUnidadO]
GO
/****** Object:  Default [DF__TbCasStr__StrUni__06EDCBDF]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TbCasStr] ADD  DEFAULT ((0)) FOR [StrUnidadD]
GO
/****** Object:  Default [DF__TbCasStr__StrCod__07E1F018]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TbCasStr] ADD  DEFAULT (' ') FOR [StrCodigo]
GO
/****** Object:  Default [DF__TbCasStr__StrEst__08D61451]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TbCasStr] ADD  DEFAULT (' ') FOR [StrEstado]
GO
/****** Object:  Default [DF__TbCasStr__StrFec__09CA388A]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TbCasStr] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [StrFecTra]
GO
/****** Object:  Default [DF__TbCasStr__StrFec__0ABE5CC3]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TbCasStr] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [StrFecApr]
GO
/****** Object:  Default [DF__TbCasStr__StrFec__0BB280FC]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TbCasStr] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [StrFecRec]
GO
/****** Object:  Default [DF__TbCasStr__StrUsu__0CA6A535]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TbCasStr] ADD  DEFAULT (' ') FOR [StrUsuario]
GO
/****** Object:  Default [DF__TbCasStr__StrUsu__0D9AC96E]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TbCasStr] ADD  DEFAULT (' ') FOR [StrUsuApr]
GO
/****** Object:  Default [DF__TbCasStr__StrUsu__0E8EEDA7]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TbCasStr] ADD  DEFAULT (' ') FOR [StrUsuRec]
GO
/****** Object:  Default [DF__TbCasStr__StrObs__0F8311E0]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TbCasStr] ADD  DEFAULT (' ') FOR [StrObserv]
GO
/****** Object:  Default [DF__TbCasStr__Jdd__10773619]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TbCasStr] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__TbCasSrA__SraFec__1353A2C4]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TbCasSrA] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [SraFecha]
GO
/****** Object:  Default [DF__TbCasSrA__SraUni__1447C6FD]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TbCasSrA] ADD  DEFAULT ((0)) FOR [SraUnidad]
GO
/****** Object:  Default [DF__TbCasSrA__SraAme__153BEB36]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TbCasSrA] ADD  DEFAULT (' ') FOR [SraAmes]
GO
/****** Object:  Default [DF__TbCasSrA__SraFec__16300F6F]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TbCasSrA] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [SraFecini]
GO
/****** Object:  Default [DF__TbCasSrA__SraFef__172433A8]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TbCasSrA] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [SraFefini]
GO
/****** Object:  Default [DF__TbCasSrA__SraEst__181857E1]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TbCasSrA] ADD  DEFAULT (' ') FOR [SraEstado]
GO
/****** Object:  Default [DF__TbCasSrA__SraFec__190C7C1A]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TbCasSrA] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [SraFecapr]
GO
/****** Object:  Default [DF__TbCasSrA__SraFec__1A00A053]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TbCasSrA] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [SraFecrec]
GO
/****** Object:  Default [DF__TbCasSrA__SraUsu__1AF4C48C]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TbCasSrA] ADD  DEFAULT (' ') FOR [SraUsuario]
GO
/****** Object:  Default [DF__TbCasSrA__SraUsu__1BE8E8C5]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TbCasSrA] ADD  DEFAULT (' ') FOR [SraUsuapr]
GO
/****** Object:  Default [DF__TbCasSrA__SraUsu__1CDD0CFE]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TbCasSrA] ADD  DEFAULT (' ') FOR [SraUsurec]
GO
/****** Object:  Default [DF__TbCasSrA__SraObs__1DD13137]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TbCasSrA] ADD  DEFAULT (' ') FOR [SraObserv]
GO
/****** Object:  Default [DF__TbCasSrA__Jdd__1EC55570]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TbCasSrA] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__tbcasrel__relcod__25A75D29]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[tbcasrel] ADD  DEFAULT ((0)) FOR [relcodigo]
GO
/****** Object:  Default [DF__tbcasrel__relleg__269B8162]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[tbcasrel] ADD  DEFAULT (' ') FOR [rellegajo]
GO
/****** Object:  Default [DF__tbcasrel__relfec__278FA59B]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[tbcasrel] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [relfecha]
GO
/****** Object:  Default [DF__tbcasrel__relhor__2883C9D4]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[tbcasrel] ADD  DEFAULT (' ') FOR [relhora]
GO
/****** Object:  Default [DF__tbcasrel__reltip__2977EE0D]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[tbcasrel] ADD  DEFAULT (' ') FOR [reltipomov]
GO
/****** Object:  Default [DF__tbcasrel__relrel__2A6C1246]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[tbcasrel] ADD  DEFAULT (' ') FOR [relreloj]
GO
/****** Object:  Default [DF__tbcasrel__Jdd__2B60367F]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[tbcasrel] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__TBCASRAC__codigo__5A8539BC]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBCASRAC] ADD  DEFAULT ((0)) FOR [codigo]
GO
/****** Object:  Default [DF__TBCASRAC__descri__5B795DF5]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBCASRAC] ADD  DEFAULT (' ') FOR [descrip]
GO
/****** Object:  Default [DF__TBCASRAC__horari__5C6D822E]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBCASRAC] ADD  DEFAULT (' ') FOR [horario1e]
GO
/****** Object:  Default [DF__TBCASRAC__horari__5D61A667]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBCASRAC] ADD  DEFAULT (' ') FOR [horario1s]
GO
/****** Object:  Default [DF__TBCASRAC__horari__5E55CAA0]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBCASRAC] ADD  DEFAULT (' ') FOR [horario2e]
GO
/****** Object:  Default [DF__TBCASRAC__horari__5F49EED9]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBCASRAC] ADD  DEFAULT (' ') FOR [horario2s]
GO
/****** Object:  Default [DF__TBCASRAC__horari__603E1312]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBCASRAC] ADD  DEFAULT (' ') FOR [horario3e]
GO
/****** Object:  Default [DF__TBCASRAC__horari__6132374B]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBCASRAC] ADD  DEFAULT (' ') FOR [horario3s]
GO
/****** Object:  Default [DF__TBCASRAC__horari__62265B84]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBCASRAC] ADD  DEFAULT (' ') FOR [horario4e]
GO
/****** Object:  Default [DF__TBCASRAC__horari__631A7FBD]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBCASRAC] ADD  DEFAULT (' ') FOR [horario4s]
GO
/****** Object:  Default [DF__TBCASRAC__valor__640EA3F6]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBCASRAC] ADD  DEFAULT ((0)) FOR [valor]
GO
/****** Object:  Default [DF__TBCASRAC__ant1__6502C82F]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBCASRAC] ADD  DEFAULT ((0)) FOR [ant1]
GO
/****** Object:  Default [DF__TBCASRAC__ant2__65F6EC68]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBCASRAC] ADD  DEFAULT ((0)) FOR [ant2]
GO
/****** Object:  Default [DF__TBCASRAC__ant3__66EB10A1]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBCASRAC] ADD  DEFAULT ((0)) FOR [ant3]
GO
/****** Object:  Default [DF__TBCASRAC__ant4__67DF34DA]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBCASRAC] ADD  DEFAULT ((0)) FOR [ant4]
GO
/****** Object:  Default [DF__TBCASRAC__reloje__68D35913]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBCASRAC] ADD  DEFAULT (' ') FOR [relojes]
GO
/****** Object:  Default [DF__TBCASRAC__Jdd__69C77D4C]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBCASRAC] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__tbcasper__fecha___1EFA5F9A]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[tbcasper] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [fecha_ini]
GO
/****** Object:  Default [DF__tbcasper__fecha___1FEE83D3]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[tbcasper] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [fecha_fin]
GO
/****** Object:  Default [DF__tbcasper__fecha___20E2A80C]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[tbcasper] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [fecha_cie]
GO
/****** Object:  Default [DF__tbcasper__usuari__21D6CC45]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[tbcasper] ADD  DEFAULT (' ') FOR [usuario]
GO
/****** Object:  Default [DF__tbcasper__Jdd__22CAF07E]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[tbcasper] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__tbcaspen__codigo__184D620B]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[tbcaspen] ADD  DEFAULT (' ') FOR [codigo]
GO
/****** Object:  Default [DF__tbcaspen__fecha__19418644]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[tbcaspen] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [fecha]
GO
/****** Object:  Default [DF__tbcaspen__estado__1A35AA7D]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[tbcaspen] ADD  DEFAULT (' ') FOR [estado]
GO
/****** Object:  Default [DF__tbcaspen__cr__1B29CEB6]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[tbcaspen] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [cr]
GO
/****** Object:  Default [DF__tbcaspen__Jdd__1C1DF2EF]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[tbcaspen] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__TbCasPdo__PdoAme__76B76416]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TbCasPdo] ADD  DEFAULT (' ') FOR [PdoAmes]
GO
/****** Object:  Default [DF__TbCasPdo__PdoUni__77AB884F]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TbCasPdo] ADD  DEFAULT ((0)) FOR [PdoUnidad]
GO
/****** Object:  Default [DF__TbCasPdo__PdoEst__789FAC88]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TbCasPdo] ADD  DEFAULT (' ') FOR [PdoEstado]
GO
/****** Object:  Default [DF__TbCasPdo__PdoEmp__7993D0C1]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TbCasPdo] ADD  DEFAULT (' ') FOR [PdoEmpMod]
GO
/****** Object:  Default [DF__TbCasPdo__PdoFec__7A87F4FA]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TbCasPdo] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [PdoFecMod]
GO
/****** Object:  Default [DF__TbCasPdo__PdoEmp__7B7C1933]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TbCasPdo] ADD  DEFAULT (' ') FOR [PdoEmpSup]
GO
/****** Object:  Default [DF__TbCasPdo__PdoFec__7C703D6C]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TbCasPdo] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [PdoFecSup]
GO
/****** Object:  Default [DF__TbCasPdo__PdoEmp__7D6461A5]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TbCasPdo] ADD  DEFAULT (' ') FOR [PdoEmpApr1]
GO
/****** Object:  Default [DF__TbCasPdo__PdoFec__7E5885DE]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TbCasPdo] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [PdoFecApr1]
GO
/****** Object:  Default [DF__TbCasPdo__PdoEmp__7F4CAA17]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TbCasPdo] ADD  DEFAULT (' ') FOR [PdoEmpApr2]
GO
/****** Object:  Default [DF__TbCasPdo__PdoFec__0040CE50]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TbCasPdo] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [PdoFecApr2]
GO
/****** Object:  Default [DF__TbCasPdo__PdoEmp__0134F289]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TbCasPdo] ADD  DEFAULT (' ') FOR [PdoEmpRRHH]
GO
/****** Object:  Default [DF__TbCasPdo__PdoFec__022916C2]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TbCasPdo] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [PdoFecRRHH]
GO
/****** Object:  Default [DF__tbcaspac__codigo__062EB1D0]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[tbcaspac] ADD  DEFAULT ((0)) FOR [codigo]
GO
/****** Object:  Default [DF__tbcaspac__descri__0722D609]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[tbcaspac] ADD  DEFAULT (' ') FOR [descrip]
GO
/****** Object:  Default [DF__tbcaspac__lector__0816FA42]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[tbcaspac] ADD  DEFAULT ((0)) FOR [lector]
GO
/****** Object:  Default [DF__tbcaspac__tipo__090B1E7B]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[tbcaspac] ADD  DEFAULT (' ') FOR [tipo]
GO
/****** Object:  Default [DF__tbcaspac__estado__09FF42B4]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[tbcaspac] ADD  DEFAULT (' ') FOR [estado]
GO
/****** Object:  Default [DF__tbcaspac__obs__0AF366ED]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[tbcaspac] ADD  DEFAULT (' ') FOR [obs]
GO
/****** Object:  Default [DF__tbcaspac__Jdd__0BE78B26]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[tbcaspac] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__tbcasnov__novcod__24E8431A]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[tbcasnov] ADD  DEFAULT ((0)) FOR [novcodigo]
GO
/****** Object:  Default [DF__tbcasnov__novtip__25DC6753]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[tbcasnov] ADD  DEFAULT ((0)) FOR [novtipo]
GO
/****** Object:  Default [DF__tbcasnov__novcre__26D08B8C]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[tbcasnov] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(120)),(120))) FOR [novcrefech]
GO
/****** Object:  Default [DF__tbcasnov__novcre__27C4AFC5]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[tbcasnov] ADD  DEFAULT (' ') FOR [novcreusr]
GO
/****** Object:  Default [DF__tbcasnov__novmot__28B8D3FE]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[tbcasnov] ADD  DEFAULT ((0)) FOR [novmotivo]
GO
/****** Object:  Default [DF__tbcasnov__novobs__29ACF837]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[tbcasnov] ADD  DEFAULT (' ') FOR [novobs]
GO
/****** Object:  Default [DF__tbcasnov__novtdi__2AA11C70]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[tbcasnov] ADD  DEFAULT ((0)) FOR [novtdia]
GO
/****** Object:  Default [DF__tbcasnov__novotr__2B9540A9]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[tbcasnov] ADD  DEFAULT ((0)) FOR [novotros]
GO
/****** Object:  Default [DF__tbcasnov__novnoc__2C8964E2]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[tbcasnov] ADD  DEFAULT (' ') FOR [novnocas]
GO
/****** Object:  Default [DF__tbcasnov__Jdd__2D7D891B]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[tbcasnov] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__tbcasnoh__nohcod__3059F5C6]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[tbcasnoh] ADD  DEFAULT ((0)) FOR [nohcodigo]
GO
/****** Object:  Default [DF__tbcasnoh__nohtip__314E19FF]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[tbcasnoh] ADD  DEFAULT ((0)) FOR [nohtipo]
GO
/****** Object:  Default [DF__tbcasnoh__nohcre__32423E38]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[tbcasnoh] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(120)),(120))) FOR [nohcrefech]
GO
/****** Object:  Default [DF__tbcasnoh__nohcre__33366271]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[tbcasnoh] ADD  DEFAULT (' ') FOR [nohcreusr]
GO
/****** Object:  Default [DF__tbcasnoh__nohmot__342A86AA]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[tbcasnoh] ADD  DEFAULT ((0)) FOR [nohmotivo]
GO
/****** Object:  Default [DF__tbcasnoh__nohobs__351EAAE3]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[tbcasnoh] ADD  DEFAULT (' ') FOR [nohobs]
GO
/****** Object:  Default [DF__tbcasnoh__nohtdi__3612CF1C]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[tbcasnoh] ADD  DEFAULT ((0)) FOR [nohtdia]
GO
/****** Object:  Default [DF__tbcasnoh__nohotr__3706F355]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[tbcasnoh] ADD  DEFAULT ((0)) FOR [nohotros]
GO
/****** Object:  Default [DF__tbcasnoh__nohnoc__37FB178E]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[tbcasnoh] ADD  DEFAULT (' ') FOR [nohnocas]
GO
/****** Object:  Default [DF__tbcasnoh__Jdd__38EF3BC7]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[tbcasnoh] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__tbcasnoh__novnoc__69E778DD]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[tbcasnoh] ADD  DEFAULT (' ') FOR [novnocas]
GO
/****** Object:  Default [DF__tbcasnmo__nmonov__11D56EA6]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[tbcasnmo] ADD  DEFAULT ((0)) FOR [nmonovedad]
GO
/****** Object:  Default [DF__tbcasnmo__nmoord__12C992DF]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[tbcasnmo] ADD  DEFAULT ((0)) FOR [nmoordenpr]
GO
/****** Object:  Default [DF__tbcasnmo__nmofec__13BDB718]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[tbcasnmo] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [nmofecha]
GO
/****** Object:  Default [DF__tbcasnmo__nmoleg__14B1DB51]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[tbcasnmo] ADD  DEFAULT (' ') FOR [nmolegajo]
GO
/****** Object:  Default [DF__tbcasnmo__nmohor__15A5FF8A]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[tbcasnmo] ADD  DEFAULT (' ') FOR [nmohoraini]
GO
/****** Object:  Default [DF__tbcasnmo__nmohor__169A23C3]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[tbcasnmo] ADD  DEFAULT (' ') FOR [nmohorafin]
GO
/****** Object:  Default [DF__tbcasnmo__nmotip__178E47FC]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[tbcasnmo] ADD  DEFAULT (' ') FOR [nmotipo]
GO
/****** Object:  Default [DF__tbcasnmo__nmoult__18826C35]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[tbcasnmo] ADD  DEFAULT ((0)) FOR [nmoultimo]
GO
/****** Object:  Default [DF__tbcasnmo__nmocex__1976906E]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[tbcasnmo] ADD  DEFAULT (' ') FOR [nmocex]
GO
/****** Object:  Default [DF__tbcasnmo__nmoaut__1A6AB4A7]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[tbcasnmo] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(120)),(120))) FOR [nmoautfech]
GO
/****** Object:  Default [DF__tbcasnmo__nmoaut__1B5ED8E0]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[tbcasnmo] ADD  DEFAULT (' ') FOR [nmoautusr]
GO
/****** Object:  Default [DF__tbcasnmo__nmoapr__1C52FD19]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[tbcasnmo] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(120)),(120))) FOR [nmoaprfech]
GO
/****** Object:  Default [DF__tbcasnmo__nmoapr__1D472152]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[tbcasnmo] ADD  DEFAULT (' ') FOR [nmoaprusr]
GO
/****** Object:  Default [DF__tbcasnmo__nmocen__1E3B458B]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[tbcasnmo] ADD  DEFAULT ((0)) FOR [nmocencos]
GO
/****** Object:  Default [DF__tbcasnmo__nmorec__1F2F69C4]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[tbcasnmo] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(120)),(120))) FOR [nmorecfech]
GO
/****** Object:  Default [DF__tbcasnmo__nmorec__20238DFD]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[tbcasnmo] ADD  DEFAULT (' ') FOR [nmorecusr]
GO
/****** Object:  Default [DF__tbcasnmo__nmoaut__2117B236]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[tbcasnmo] ADD  DEFAULT (' ') FOR [nmoautoriz]
GO
/****** Object:  Default [DF__tbcasnmo__Jdd__220BD66F]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[tbcasnmo] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__tbcasnmh__nmhnov__3BCBA872]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[tbcasnmh] ADD  DEFAULT ((0)) FOR [nmhnovedad]
GO
/****** Object:  Default [DF__tbcasnmh__nmhord__3CBFCCAB]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[tbcasnmh] ADD  DEFAULT ((0)) FOR [nmhordenpr]
GO
/****** Object:  Default [DF__tbcasnmh__nmhfec__3DB3F0E4]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[tbcasnmh] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [nmhfecha]
GO
/****** Object:  Default [DF__tbcasnmh__nmhleg__3EA8151D]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[tbcasnmh] ADD  DEFAULT (' ') FOR [nmhlegajo]
GO
/****** Object:  Default [DF__tbcasnmh__nmhhor__3F9C3956]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[tbcasnmh] ADD  DEFAULT (' ') FOR [nmhhoraini]
GO
/****** Object:  Default [DF__tbcasnmh__nmhhor__40905D8F]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[tbcasnmh] ADD  DEFAULT (' ') FOR [nmhhorafin]
GO
/****** Object:  Default [DF__tbcasnmh__nmhtip__418481C8]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[tbcasnmh] ADD  DEFAULT (' ') FOR [nmhtipo]
GO
/****** Object:  Default [DF__tbcasnmh__nmhult__4278A601]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[tbcasnmh] ADD  DEFAULT ((0)) FOR [nmhultimo]
GO
/****** Object:  Default [DF__tbcasnmh__nmhcex__436CCA3A]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[tbcasnmh] ADD  DEFAULT (' ') FOR [nmhcex]
GO
/****** Object:  Default [DF__tbcasnmh__nmhaut__4460EE73]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[tbcasnmh] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(120)),(120))) FOR [nmhautfech]
GO
/****** Object:  Default [DF__tbcasnmh__nmhaut__455512AC]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[tbcasnmh] ADD  DEFAULT (' ') FOR [nmhautusr]
GO
/****** Object:  Default [DF__tbcasnmh__nmhapr__464936E5]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[tbcasnmh] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(120)),(120))) FOR [nmhaprfech]
GO
/****** Object:  Default [DF__tbcasnmh__nmhapr__473D5B1E]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[tbcasnmh] ADD  DEFAULT (' ') FOR [nmhaprusr]
GO
/****** Object:  Default [DF__tbcasnmh__nmhcen__48317F57]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[tbcasnmh] ADD  DEFAULT ((0)) FOR [nmhcencos]
GO
/****** Object:  Default [DF__tbcasnmh__nmhrec__4925A390]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[tbcasnmh] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(120)),(120))) FOR [nmhrecfech]
GO
/****** Object:  Default [DF__tbcasnmh__nmhrec__4A19C7C9]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[tbcasnmh] ADD  DEFAULT (' ') FOR [nmhrecusr]
GO
/****** Object:  Default [DF__tbcasnmh__nmhaut__4B0DEC02]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[tbcasnmh] ADD  DEFAULT (' ') FOR [nmhautoriz]
GO
/****** Object:  Default [DF__tbcasnmh__Jdd__4C02103B]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[tbcasnmh] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__tbcasneg__codigo__1388ACEE]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[tbcasneg] ADD  DEFAULT (' ') FOR [codigo]
GO
/****** Object:  Default [DF__tbcasneg__punto__147CD127]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[tbcasneg] ADD  DEFAULT ((0)) FOR [punto]
GO
/****** Object:  Default [DF__tbcasneg__Jdd__1570F560]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[tbcasneg] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__TBCASLIQ__codigo__0757E033]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBCASLIQ] ADD  DEFAULT (' ') FOR [codigo]
GO
/****** Object:  Default [DF__TBCASLIQ__dia__084C046C]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBCASLIQ] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [dia]
GO
/****** Object:  Default [DF__TBCASLIQ__cohade__094028A5]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBCASLIQ] ADD  DEFAULT (' ') FOR [cohade]
GO
/****** Object:  Default [DF__TBCASLIQ__horas__0A344CDE]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBCASLIQ] ADD  DEFAULT ((0)) FOR [horas]
GO
/****** Object:  Default [DF__TBCASLIQ__tipo__0B287117]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBCASLIQ] ADD  DEFAULT (' ') FOR [tipo]
GO
/****** Object:  Default [DF__TBCASLIQ__cencos__0C1C9550]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBCASLIQ] ADD  DEFAULT ((0)) FOR [cencos]
GO
/****** Object:  Default [DF__TBCASLIQ__cerrad__0D10B989]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBCASLIQ] ADD  DEFAULT (' ') FOR [cerrado]
GO
/****** Object:  Default [DF__TBCASLIQ__modifi__0E04DDC2]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBCASLIQ] ADD  DEFAULT ((0)) FOR [modificado]
GO
/****** Object:  Default [DF__TBCASLIQ__Jdd__0EF901FB]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBCASLIQ] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__TbCasEva__EvaTar__33C07256]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TbCasEva] ADD  DEFAULT ((0)) FOR [EvaTareo]
GO
/****** Object:  Default [DF__TbCasEva__EvaFec__34B4968F]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TbCasEva] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [EvaFecha]
GO
/****** Object:  Default [DF__TbCasEva__EvaUsu__35A8BAC8]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TbCasEva] ADD  DEFAULT (' ') FOR [EvaUsuario]
GO
/****** Object:  Default [DF__TbCasEva__EvaEst__369CDF01]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TbCasEva] ADD  DEFAULT (' ') FOR [EvaEstado]
GO
/****** Object:  Default [DF__TbCasEva__EvaObs__3791033A]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TbCasEva] ADD  DEFAULT (' ') FOR [EvaObserv]
GO
/****** Object:  Default [DF__TbCasEva__Jdd__38852773]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TbCasEva] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__TBCASETU__etucod__251D4D44]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBCASETU] ADD  DEFAULT (' ') FOR [etucodigo]
GO
/****** Object:  Default [DF__TBCASETU__etudes__2611717D]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBCASETU] ADD  DEFAULT (' ') FOR [etudescrip]
GO
/****** Object:  Default [DF__TBCASETU__etuini__270595B6]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBCASETU] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [etuinicio]
GO
/****** Object:  Default [DF__TBCASETU__etuesq__27F9B9EF]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBCASETU] ADD  DEFAULT (' ') FOR [etuesqrot]
GO
/****** Object:  Default [DF__TBCASETU__etusec__28EDDE28]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBCASETU] ADD  DEFAULT ((0)) FOR [etusecini]
GO
/****** Object:  Default [DF__TBCASETU__etudia__29E20261]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBCASETU] ADD  DEFAULT ((0)) FOR [etudiaini]
GO
/****** Object:  Default [DF__TBCASETU__Jdd__2AD6269A]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBCASETU] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__TBCASETR__etrleg__1A9FBED1]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBCASETR] ADD  DEFAULT (' ') FOR [etrlegajo]
GO
/****** Object:  Default [DF__TBCASETR__etrfec__1B93E30A]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBCASETR] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [etrfecha]
GO
/****** Object:  Default [DF__TBCASETR__etrtra__1C880743]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBCASETR] ADD  DEFAULT (' ') FOR [etrtramo]
GO
/****** Object:  Default [DF__TBCASETR__etresq__1D7C2B7C]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBCASETR] ADD  DEFAULT (' ') FOR [etresqtur]
GO
/****** Object:  Default [DF__TBCASETR__etrent__1E704FB5]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBCASETR] ADD  DEFAULT (' ') FOR [etrent]
GO
/****** Object:  Default [DF__TBCASETR__etrsal__1F6473EE]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBCASETR] ADD  DEFAULT (' ') FOR [etrsal]
GO
/****** Object:  Default [DF__TBCASETR__etrent__20589827]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBCASETR] ADD  DEFAULT (' ') FOR [etrent1]
GO
/****** Object:  Default [DF__TBCASETR__etrsal__214CBC60]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBCASETR] ADD  DEFAULT (' ') FOR [etrsal1]
GO
/****** Object:  Default [DF__TBCASETR__Jdd__2240E099]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBCASETR] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__TBCASERT__ertesq__13F2C142]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBCASERT] ADD  DEFAULT (' ') FOR [ertesqrot]
GO
/****** Object:  Default [DF__TBCASERT__erttra__14E6E57B]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBCASERT] ADD  DEFAULT (' ') FOR [erttramo]
GO
/****** Object:  Default [DF__TBCASERT__ertsec__15DB09B4]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBCASERT] ADD  DEFAULT ((0)) FOR [ertsecuenc]
GO
/****** Object:  Default [DF__TBCASERT__ertdia__16CF2DED]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBCASERT] ADD  DEFAULT ((0)) FOR [ertdias]
GO
/****** Object:  Default [DF__TBCASERT__Jdd__17C35226]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBCASERT] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__TBCASERO__erocod__0F2E0C25]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBCASERO] ADD  DEFAULT (' ') FOR [erocodigo]
GO
/****** Object:  Default [DF__TBCASERO__erodes__1022305E]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBCASERO] ADD  DEFAULT (' ') FOR [erodescrip]
GO
/****** Object:  Default [DF__TBCASERO__Jdd__11165497]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBCASERO] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__tbcasera__codigo__37C60D64]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[tbcasera] ADD  DEFAULT (' ') FOR [codigo]
GO
/****** Object:  Default [DF__tbcasera__racion__38BA319D]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[tbcasera] ADD  DEFAULT ((0)) FOR [racion]
GO
/****** Object:  Default [DF__tbcasera__multip__39AE55D6]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[tbcasera] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(120)),(120))) FOR [multiples]
GO
/****** Object:  Default [DF__tbcasera__Jdd__3AA27A0F]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[tbcasera] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__tbcaselm__elmnov__5CF79213]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[tbcaselm] ADD  DEFAULT ((0)) FOR [elmnovedad]
GO
/****** Object:  Default [DF__tbcaselm__elmord__5DEBB64C]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[tbcaselm] ADD  DEFAULT ((0)) FOR [elmorden]
GO
/****** Object:  Default [DF__tbcaselm__elmval__5EDFDA85]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[tbcaselm] ADD  DEFAULT (' ') FOR [elmvalor]
GO
/****** Object:  Default [DF__tbcaselm__Jdd__5FD3FEBE]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[tbcaselm] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__tbcascre__crecod__3D7EE6BA]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[tbcascre] ADD  DEFAULT ((0)) FOR [crecodigo]
GO
/****** Object:  Default [DF__tbcascre__cretar__3E730AF3]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[tbcascre] ADD  DEFAULT (' ') FOR [cretarjeta]
GO
/****** Object:  Default [DF__tbcascre__crefec__3F672F2C]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[tbcascre] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [crefecha]
GO
/****** Object:  Default [DF__tbcascre__crehor__405B5365]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[tbcascre] ADD  DEFAULT (' ') FOR [crehora]
GO
/****** Object:  Default [DF__tbcascre__cretip__414F779E]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[tbcascre] ADD  DEFAULT (' ') FOR [cretipomov]
GO
/****** Object:  Default [DF__tbcascre__crerel__42439BD7]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[tbcascre] ADD  DEFAULT (' ') FOR [crereloj]
GO
/****** Object:  Default [DF__tbcascre__crenoa__4337C010]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[tbcascre] ADD  DEFAULT ((0)) FOR [crenoapa]
GO
/****** Object:  Default [DF__tbcascre__Jdd__442BE449]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[tbcascre] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__tbcascom__comcod__6D630406]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[tbcascom] ADD  DEFAULT ((0)) FOR [comcodigo]
GO
/****** Object:  Default [DF__tbcascom__comleg__6E57283F]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[tbcascom] ADD  DEFAULT (' ') FOR [comlegajo]
GO
/****** Object:  Default [DF__tbcascom__comfec__6F4B4C78]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[tbcascom] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(120)),(120))) FOR [comfecha]
GO
/****** Object:  Default [DF__tbcascom__comhor__703F70B1]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[tbcascom] ADD  DEFAULT (' ') FOR [comhora]
GO
/****** Object:  Default [DF__tbcascom__comtip__713394EA]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[tbcascom] ADD  DEFAULT (' ') FOR [comtipomov]
GO
/****** Object:  Default [DF__tbcascom__comrac__7227B923]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[tbcascom] ADD  DEFAULT ((0)) FOR [comracion]
GO
/****** Object:  Default [DF__tbcascom__comdia__731BDD5C]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[tbcascom] ADD  DEFAULT ((0)) FOR [comdiaan]
GO
/****** Object:  Default [DF__tbcascom__comtic__74100195]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[tbcascom] ADD  DEFAULT ((0)) FOR [comticket]
GO
/****** Object:  Default [DF__tbcascom__comman__750425CE]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[tbcascom] ADD  DEFAULT (' ') FOR [commanaut]
GO
/****** Object:  Default [DF__tbcascom__comrel__75F84A07]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[tbcascom] ADD  DEFAULT (' ') FOR [comreloj]
GO
/****** Object:  Default [DF__tbcascom__Jdd__76EC6E40]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[tbcascom] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__tbcascoh__cohcod__79C8DAEB]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[tbcascoh] ADD  DEFAULT ((0)) FOR [cohcodigo]
GO
/****** Object:  Default [DF__tbcascoh__cohleg__7ABCFF24]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[tbcascoh] ADD  DEFAULT (' ') FOR [cohlegajo]
GO
/****** Object:  Default [DF__tbcascoh__cohfec__7BB1235D]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[tbcascoh] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(120)),(120))) FOR [cohfecha]
GO
/****** Object:  Default [DF__tbcascoh__cohhor__7CA54796]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[tbcascoh] ADD  DEFAULT (' ') FOR [cohhora]
GO
/****** Object:  Default [DF__tbcascoh__cohtip__7D996BCF]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[tbcascoh] ADD  DEFAULT (' ') FOR [cohtipomov]
GO
/****** Object:  Default [DF__tbcascoh__cohrac__7E8D9008]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[tbcascoh] ADD  DEFAULT ((0)) FOR [cohracion]
GO
/****** Object:  Default [DF__tbcascoh__cohdia__7F81B441]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[tbcascoh] ADD  DEFAULT ((0)) FOR [cohdiaan]
GO
/****** Object:  Default [DF__tbcascoh__cohtic__0075D87A]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[tbcascoh] ADD  DEFAULT ((0)) FOR [cohticket]
GO
/****** Object:  Default [DF__tbcascoh__cohman__0169FCB3]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[tbcascoh] ADD  DEFAULT (' ') FOR [cohmanaut]
GO
/****** Object:  Default [DF__tbcascoh__cohrel__025E20EC]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[tbcascoh] ADD  DEFAULT (' ') FOR [cohreloj]
GO
/****** Object:  Default [DF__tbcascoh__Jdd__03524525]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[tbcascoh] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__TBCASCLK__clkcod__4495F89D]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBCASCLK] ADD  DEFAULT (' ') FOR [clkcodigo]
GO
/****** Object:  Default [DF__TBCASCLK__clkdes__458A1CD6]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBCASCLK] ADD  DEFAULT (' ') FOR [clkdescrip]
GO
/****** Object:  Default [DF__TBCASCLK__clktip__467E410F]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBCASCLK] ADD  DEFAULT ((0)) FOR [clktipocom]
GO
/****** Object:  Default [DF__TBCASCLK__clkpor__47726548]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBCASCLK] ADD  DEFAULT (' ') FOR [clkportcom]
GO
/****** Object:  Default [DF__TBCASCLK__clkdir__48668981]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBCASCLK] ADD  DEFAULT (' ') FOR [clkdirec]
GO
/****** Object:  Default [DF__TBCASCLK__clkcon__495AADBA]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBCASCLK] ADD  DEFAULT (' ') FOR [clkconect]
GO
/****** Object:  Default [DF__TBCASCLK__clkcen__4A4ED1F3]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBCASCLK] ADD  DEFAULT (' ') FOR [clkcencos]
GO
/****** Object:  Default [DF__TBCASCLK__clkmod__4B42F62C]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBCASCLK] ADD  DEFAULT ((0)) FOR [clkmodelo]
GO
/****** Object:  Default [DF__TBCASCLK__clkhab__4C371A65]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBCASCLK] ADD  DEFAULT ((0)) FOR [clkhabilit]
GO
/****** Object:  Default [DF__TBCASCLK__clkufe__4D2B3E9E]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBCASCLK] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [clkufecha]
GO
/****** Object:  Default [DF__TBCASCLK__clkuho__4E1F62D7]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBCASCLK] ADD  DEFAULT (' ') FOR [clkuhor]
GO
/****** Object:  Default [DF__TBCASCLK__clkmai__4F138710]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBCASCLK] ADD  DEFAULT (' ') FOR [clkmail]
GO
/****** Object:  Default [DF__TBCASCLK__clktip__5007AB49]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBCASCLK] ADD  DEFAULT (' ') FOR [clktipo]
GO
/****** Object:  Default [DF__TBCASCLK__clkcon__50FBCF82]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBCASCLK] ADD  DEFAULT (' ') FOR [clkcondic]
GO
/****** Object:  Default [DF__TBCASCLK__Jdd__51EFF3BB]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBCASCLK] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__TBCASCFG__clave__54CC6066]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBCASCFG] ADD  DEFAULT ((0)) FOR [clave]
GO
/****** Object:  Default [DF__TBCASCFG__valor__55C0849F]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBCASCFG] ADD  DEFAULT (' ') FOR [valor]
GO
/****** Object:  Default [DF__TBCASCFG__valor2__56B4A8D8]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBCASCFG] ADD  DEFAULT (' ') FOR [valor2]
GO
/****** Object:  Default [DF__TBCASCFG__Jdd__57A8CD11]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBCASCFG] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__tbcascex__cexcod__564A9484]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[tbcascex] ADD  DEFAULT ((0)) FOR [cexcodnov]
GO
/****** Object:  Default [DF__tbcascex__cexord__573EB8BD]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[tbcascex] ADD  DEFAULT ((0)) FOR [cexorden]
GO
/****** Object:  Default [DF__tbcascex__cexmot__5832DCF6]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[tbcascex] ADD  DEFAULT ((0)) FOR [cexmotivo]
GO
/****** Object:  Default [DF__tbcascex__cexcod__5927012F]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[tbcascex] ADD  DEFAULT (' ') FOR [cexcodigo]
GO
/****** Object:  Default [DF__tbcascex__Jdd__5A1B2568]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[tbcascex] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__tbcascco__ccoleg__5D2C9C3D]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[tbcascco] ADD  DEFAULT (' ') FOR [ccolegajo]
GO
/****** Object:  Default [DF__tbcascco__ccofec__5E20C076]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[tbcascco] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [ccofecha]
GO
/****** Object:  Default [DF__tbcascco__ccocch__5F14E4AF]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[tbcascco] ADD  DEFAULT ((0)) FOR [ccocch1]
GO
/****** Object:  Default [DF__tbcascco__ccocch__600908E8]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[tbcascco] ADD  DEFAULT ((0)) FOR [ccocch2]
GO
/****** Object:  Default [DF__tbcascco__ccocch__60FD2D21]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[tbcascco] ADD  DEFAULT ((0)) FOR [ccocch3]
GO
/****** Object:  Default [DF__tbcascco__ccocch__61F1515A]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[tbcascco] ADD  DEFAULT ((0)) FOR [ccocch4]
GO
/****** Object:  Default [DF__tbcascco__ccocch__62E57593]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[tbcascco] ADD  DEFAULT ((0)) FOR [ccocch5]
GO
/****** Object:  Default [DF__tbcascco__ccocch__63D999CC]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[tbcascco] ADD  DEFAULT ((0)) FOR [ccocch6]
GO
/****** Object:  Default [DF__tbcascco__ccocch__64CDBE05]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[tbcascco] ADD  DEFAULT ((0)) FOR [ccocch7]
GO
/****** Object:  Default [DF__tbcascco__ccocch__65C1E23E]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[tbcascco] ADD  DEFAULT ((0)) FOR [ccocch8]
GO
/****** Object:  Default [DF__tbcascco__ccocch__66B60677]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[tbcascco] ADD  DEFAULT ((0)) FOR [ccocch9]
GO
/****** Object:  Default [DF__tbcascco__ccocch__67AA2AB0]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[tbcascco] ADD  DEFAULT ((0)) FOR [ccocch10]
GO
/****** Object:  Default [DF__tbcascco__ccotip__689E4EE9]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[tbcascco] ADD  DEFAULT (' ') FOR [ccotipo]
GO
/****** Object:  Default [DF__tbcascco__ccoobs__69927322]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[tbcascco] ADD  DEFAULT (' ') FOR [ccoobs]
GO
/****** Object:  Default [DF__tbcascco__Jdd__6A86975B]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[tbcascco] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__TBCASCAT__catfec__097532CF]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBCASCAT] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [catfecha]
GO
/****** Object:  Default [DF__TBCASCAT__catesq__0A695708]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBCASCAT] ADD  DEFAULT (' ') FOR [catesqtur]
GO
/****** Object:  Default [DF__TBCASCAT__cattra__0B5D7B41]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBCASCAT] ADD  DEFAULT (' ') FOR [cattramo]
GO
/****** Object:  Default [DF__TBCASCAT__Jdd__0C519F7A]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBCASCAT] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__tbcasbla__codigo__0EC3F7D1]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[tbcasbla] ADD  DEFAULT (' ') FOR [codigo]
GO
/****** Object:  Default [DF__tbcasbla__punto__0FB81C0A]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[tbcasbla] ADD  DEFAULT ((0)) FOR [punto]
GO
/****** Object:  Default [DF__tbcasbla__Jdd__10AC4043]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[tbcasbla] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__TBCASAPH__aphcod__79FDE515]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBCASAPH] ADD  DEFAULT ((0)) FOR [aphcodigo]
GO
/****** Object:  Default [DF__TBCASAPH__aphleg__7AF2094E]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBCASAPH] ADD  DEFAULT (' ') FOR [aphlegajo]
GO
/****** Object:  Default [DF__TBCASAPH__aphfec__7BE62D87]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBCASAPH] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [aphfecha]
GO
/****** Object:  Default [DF__TBCASAPH__aphhor__7CDA51C0]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBCASAPH] ADD  DEFAULT (' ') FOR [aphhorae]
GO
/****** Object:  Default [DF__TBCASAPH__aphhor__7DCE75F9]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBCASAPH] ADD  DEFAULT (' ') FOR [aphhoras]
GO
/****** Object:  Default [DF__TBCASAPH__aphest__7EC29A32]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBCASAPH] ADD  DEFAULT ((0)) FOR [aphestado]
GO
/****** Object:  Default [DF__TBCASAPH__aphcen__7FB6BE6B]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBCASAPH] ADD  DEFAULT ((0)) FOR [aphcencos]
GO
/****** Object:  Default [DF__TBCASAPH__aphobs__00AAE2A4]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBCASAPH] ADD  DEFAULT (' ') FOR [aphobserv]
GO
/****** Object:  Default [DF__TBCASAPH__aphtip__019F06DD]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBCASAPH] ADD  DEFAULT (' ') FOR [aphtipo]
GO
/****** Object:  Default [DF__TBCASAPH__aphrel__02932B16]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBCASAPH] ADD  DEFAULT (' ') FOR [aphrelE]
GO
/****** Object:  Default [DF__TBCASAPH__aphrel__03874F4F]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBCASAPH] ADD  DEFAULT (' ') FOR [aphrelS]
GO
/****** Object:  Default [DF__TBCASAPH__Jdd__047B7388]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBCASAPH] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__TBCASAPA__apacod__6CA3E9F7]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBCASAPA] ADD  DEFAULT ((0)) FOR [apacodigo]
GO
/****** Object:  Default [DF__TBCASAPA__apaleg__6D980E30]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBCASAPA] ADD  DEFAULT (' ') FOR [apalegajo]
GO
/****** Object:  Default [DF__TBCASAPA__apafec__6E8C3269]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBCASAPA] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [apafecha]
GO
/****** Object:  Default [DF__TBCASAPA__apahor__6F8056A2]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBCASAPA] ADD  DEFAULT (' ') FOR [apahorae]
GO
/****** Object:  Default [DF__TBCASAPA__apahor__70747ADB]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBCASAPA] ADD  DEFAULT (' ') FOR [apahoras]
GO
/****** Object:  Default [DF__TBCASAPA__apaest__71689F14]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBCASAPA] ADD  DEFAULT ((0)) FOR [apaestado]
GO
/****** Object:  Default [DF__TBCASAPA__apacen__725CC34D]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBCASAPA] ADD  DEFAULT ((0)) FOR [apacencos]
GO
/****** Object:  Default [DF__TBCASAPA__apaobs__7350E786]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBCASAPA] ADD  DEFAULT (' ') FOR [apaobserv]
GO
/****** Object:  Default [DF__TBCASAPA__apatip__74450BBF]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBCASAPA] ADD  DEFAULT (' ') FOR [apatipo]
GO
/****** Object:  Default [DF__TBCASAPA__aparel__75392FF8]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBCASAPA] ADD  DEFAULT (' ') FOR [aparelE]
GO
/****** Object:  Default [DF__TBCASAPA__aparel__762D5431]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBCASAPA] ADD  DEFAULT (' ') FOR [aparelS]
GO
/****** Object:  Default [DF__TBCASAPA__Jdd__7721786A]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[TBCASAPA] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__tbcasacc__codigo__2E3CA32A]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[tbcasacc] ADD  DEFAULT (' ') FOR [codigo]
GO
/****** Object:  Default [DF__tbcasacc__fecha__2F30C763]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[tbcasacc] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [fecha]
GO
/****** Object:  Default [DF__tbcasacc__hora__3024EB9C]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[tbcasacc] ADD  DEFAULT (' ') FOR [hora]
GO
/****** Object:  Default [DF__tbcasacc__punto__31190FD5]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[tbcasacc] ADD  DEFAULT ((0)) FOR [punto]
GO
/****** Object:  Default [DF__tbcasacc__result__320D340E]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[tbcasacc] ADD  DEFAULT (' ') FOR [resultado]
GO
/****** Object:  Default [DF__tbcasacc__creden__33015847]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[tbcasacc] ADD  DEFAULT (' ') FOR [credencial]
GO
/****** Object:  Default [DF__tbcasacc__clave__33F57C80]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[tbcasacc] ADD  DEFAULT (' ') FOR [clave]
GO
/****** Object:  Default [DF__tbcasacc__Jdd__34E9A0B9]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[tbcasacc] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__Sindices__Jdd__44F51FF9]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Sindices] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__Sindices__Ames__45E94432]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Sindices] ADD  DEFAULT (' ') FOR [Ames]
GO
/****** Object:  Default [DF__Sindices__Uf__46DD686B]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Sindices] ADD  DEFAULT ((0)) FOR [Uf]
GO
/****** Object:  Default [DF__Sindices__Utm__47D18CA4]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Sindices] ADD  DEFAULT ((0)) FOR [Utm]
GO
/****** Object:  Default [DF__Sindices__Sueldo__48C5B0DD]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Sindices] ADD  DEFAULT ((0)) FOR [SueldoMin]
GO
/****** Object:  Default [DF__RVerRep__reg_rep__65B6F546]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RVerRep] ADD  DEFAULT (' ') FOR [reg_rep]
GO
/****** Object:  Default [DF__RVerRep__ver_rep__66AB197F]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RVerRep] ADD  DEFAULT ((0)) FOR [ver_rep]
GO
/****** Object:  Default [DF__RVerRep__fecha_e__679F3DB8]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RVerRep] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [fecha_eje]
GO
/****** Object:  Default [DF__RVerRep__usuario__689361F1]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RVerRep] ADD  DEFAULT (' ') FOR [usuario]
GO
/****** Object:  Default [DF__RVerRep__Jdd__6987862A]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RVerRep] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__RValidac__Jdd__748502E1]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RValidac] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__RValidac__Usuari__7579271A]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RValidac] ADD  DEFAULT (' ') FOR [Usuario]
GO
/****** Object:  Default [DF__RValidac__Descri__766D4B53]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RValidac] ADD  DEFAULT (' ') FOR [Descrip]
GO
/****** Object:  Default [DF__RValidac__Condic__77616F8C]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RValidac] ADD  DEFAULT (' ') FOR [Condicion]
GO
/****** Object:  Default [DF__RValidac__Valida__785593C5]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RValidac] ADD  DEFAULT (' ') FOR [Validacion]
GO
/****** Object:  Default [DF__RValidac__Mens_e__7949B7FE]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RValidac] ADD  DEFAULT (' ') FOR [Mens_error]
GO
/****** Object:  Default [DF__RValidac__Tipo__7A3DDC37]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RValidac] ADD  DEFAULT (' ') FOR [Tipo]
GO
--/****** Object:  Default [DF__RVACDET__Codigo__407A839F]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RVACDET] ADD  DEFAULT (' ') FOR [Codigo]
--GO
--/****** Object:  Default [DF__RVACDET__Fecha_a__416EA7D8]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RVACDET] ADD  DEFAULT (getdate()) FOR [Fecha_act]
--GO
--/****** Object:  Default [DF__RVACDET__Totpen__4262CC11]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RVACDET] ADD  DEFAULT (0) FOR [Totpen]
--GO
--/****** Object:  Default [DF__RVACDET__PeriPen__4356F04A]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RVACDET] ADD  DEFAULT (' ') FOR [PeriPen]
--GO
--/****** Object:  Default [DF__RVACDET__Normdev__444B1483]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RVACDET] ADD  DEFAULT (0) FOR [Normdev]
--GO
--/****** Object:  Default [DF__RVACDET__Normtom__453F38BC]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RVACDET] ADD  DEFAULT (0) FOR [Normtom]
--GO
--/****** Object:  Default [DF__RVACDET__Propdev__46335CF5]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RVACDET] ADD  DEFAULT (0) FOR [Propdev]
--GO
--/****** Object:  Default [DF__RVACDET__Proptom__4727812E]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RVACDET] ADD  DEFAULT (0) FOR [Proptom]
--GO
--/****** Object:  Default [DF__RVACDET__Prgrdev__481BA567]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RVACDET] ADD  DEFAULT (0) FOR [Prgrdev]
--GO
--/****** Object:  Default [DF__RVACDET__Prgrtom__490FC9A0]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RVACDET] ADD  DEFAULT (0) FOR [Prgrtom]
--GO
--/****** Object:  Default [DF__RVACDET__Adicdev__4A03EDD9]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RVACDET] ADD  DEFAULT (0) FOR [Adicdev]
--GO
--/****** Object:  Default [DF__RVACDET__Adictom__4AF81212]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RVACDET] ADD  DEFAULT (0) FOR [Adictom]
--GO
--/****** Object:  Default [DF__RVACDET__Jdd__4BEC364B]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RVACDET] ADD  DEFAULT (0) FOR [Jdd]
--GO
--/****** Object:  Default [DF__RVACDET__Dulper__3A8CA01F]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RVACDET] ADD  DEFAULT (0) FOR [Dulper]
--GO
--/****** Object:  Default [DF__RVACACIG__Numdoc__3F51553C]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RVACACIG] ADD  DEFAULT (0) FOR [Numdoc]
--GO
--/****** Object:  Default [DF__RVACACIG__Codigo__40457975]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RVACACIG] ADD  DEFAULT (' ') FOR [Codigo]
--GO
--/****** Object:  Default [DF__RVACACIG__Feini__41399DAE]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RVACACIG] ADD  DEFAULT (getdate()) FOR [Feini]
--GO
--/****** Object:  Default [DF__RVACACIG__Fefin__422DC1E7]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RVACACIG] ADD  DEFAULT (getdate()) FOR [Fefin]
--GO
--/****** Object:  Default [DF__RVACACIG__Dias__4321E620]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RVACACIG] ADD  DEFAULT (0) FOR [Dias]
--GO
--/****** Object:  Default [DF__RVACACIG__Status__44160A59]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RVACACIG] ADD  DEFAULT (' ') FOR [Status]
--GO
--/****** Object:  Default [DF__RVACACIG__Numrem__450A2E92]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RVACACIG] ADD  DEFAULT (0) FOR [Numrem]
--GO
--/****** Object:  Default [DF__RVACACIG__Opd__45FE52CB]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RVACACIG] ADD  DEFAULT (0) FOR [Opd]
--GO
--/****** Object:  Default [DF__RVACACIG__Dmi__46F27704]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RVACACIG] ADD  DEFAULT (0) FOR [Dmi]
--GO
--/****** Object:  Default [DF__RVACACIG__Dmf__47E69B3D]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RVACACIG] ADD  DEFAULT (0) FOR [Dmf]
--GO
--/****** Object:  Default [DF__RVACACIG__Ampm__48DABF76]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RVACACIG] ADD  DEFAULT (0) FOR [Ampm]
--GO
--/****** Object:  Default [DF__RVACACIG__Fecha___49CEE3AF]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RVACACIG] ADD  DEFAULT (getdate()) FOR [Fecha_ret]
--GO
--/****** Object:  Default [DF__RVACACIG__Motanu__4AC307E8]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RVACACIG] ADD  DEFAULT (' ') FOR [Motanul]
--GO
--/****** Object:  Default [DF__RVACACIG__Pertom__4BB72C21]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RVACACIG] ADD  DEFAULT (' ') FOR [Pertom]
--GO
--/****** Object:  Default [DF__RVACACIG__Jdd__4CAB505A]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RVACACIG] ADD  DEFAULT (0) FOR [Jdd]
--GO
--/****** Object:  Default [DF__RVACACID__Codigo__4F87BD05]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RVACACID] ADD  DEFAULT (' ') FOR [Codigo]
--GO
--/****** Object:  Default [DF__RVACACID__Dias__507BE13E]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RVACACID] ADD  DEFAULT (0) FOR [Dias]
--GO
--/****** Object:  Default [DF__RVACACID__Fecha___51700577]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RVACACID] ADD  DEFAULT (getdate()) FOR [Fecha_ini]
--GO
--/****** Object:  Default [DF__RVACACID__Fecha___526429B0]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RVACACID] ADD  DEFAULT (getdate()) FOR [Fecha_fin]
--GO
--/****** Object:  Default [DF__RVACACID__Tipo__53584DE9]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RVACACID] ADD  DEFAULT (' ') FOR [Tipo]
--GO
--/****** Object:  Default [DF__RVACACID__Descri__544C7222]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RVACACID] ADD  DEFAULT (' ') FOR [Descrip]
--GO
--/****** Object:  Default [DF__RVACACID__Nro__5540965B]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RVACACID] ADD  DEFAULT (0) FOR [Nro]
--GO
--/****** Object:  Default [DF__RVACACID__Jdd__5634BA94]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RVACACID] ADD  DEFAULT (0) FOR [Jdd]
--GO
--/****** Object:  Default [DF__RVACACI__Numdoc__00AA174D]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RVACACI] ADD  DEFAULT (0) FOR [Numdoc]
--GO
--/****** Object:  Default [DF__RVACACI__Codigo__019E3B86]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RVACACI] ADD  DEFAULT (' ') FOR [Codigo]
--GO
--/****** Object:  Default [DF__RVACACI__Feini__02925FBF]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RVACACI] ADD  DEFAULT (getdate()) FOR [Feini]
--GO
--/****** Object:  Default [DF__RVACACI__Fefin__038683F8]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RVACACI] ADD  DEFAULT (getdate()) FOR [Fefin]
--GO
--/****** Object:  Default [DF__RVACACI__Dias__047AA831]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RVACACI] ADD  DEFAULT (0) FOR [Dias]
--GO
--/****** Object:  Default [DF__RVACACI__Status__056ECC6A]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RVACACI] ADD  DEFAULT (' ') FOR [Status]
--GO
--/****** Object:  Default [DF__RVACACI__Numrem__0662F0A3]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RVACACI] ADD  DEFAULT (0) FOR [Numrem]
--GO
--/****** Object:  Default [DF__RVACACI__Opd__075714DC]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RVACACI] ADD  DEFAULT (0) FOR [Opd]
--GO
--/****** Object:  Default [DF__RVACACI__Dmi__084B3915]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RVACACI] ADD  DEFAULT (0) FOR [Dmi]
--GO
--/****** Object:  Default [DF__RVACACI__Dmf__093F5D4E]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RVACACI] ADD  DEFAULT (0) FOR [Dmf]
--GO
--/****** Object:  Default [DF__RVACACI__Ampm__0A338187]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RVACACI] ADD  DEFAULT (0) FOR [Ampm]
--GO
--/****** Object:  Default [DF__RVACACI__Jdd__0B27A5C0]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RVACACI] ADD  DEFAULT (0) FOR [Jdd]
--GO
--/****** Object:  Default [DF__RVACACI__Motanul__3CDEFCE5]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RVACACI] ADD  DEFAULT (' ') FOR [Motanul]
--GO
--/****** Object:  Default [DF__RVACACI__fecha_r__3DD3211E]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RVACACI] ADD  DEFAULT (' ') FOR [fecha_ret]
--GO
--/****** Object:  Default [DF__RVACACI__Pertom__3EC74557]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RVACACI] ADD  DEFAULT (' ') FOR [Pertom]
--GO
--/****** Object:  Default [DF__RVACACI__fecha_d__5B4E756C]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RVACACI] ADD  DEFAULT (' ') FOR [fecha_dat]
--GO
--/****** Object:  Default [DF__RVACACI__usuario__5C4299A5]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RVACACI] ADD  DEFAULT (' ') FOR [usuario]
--GO
--/****** Object:  Default [DF__RVACACI__Fecha_u__5D36BDDE]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RVACACI] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(120)),(120))) FOR [Fecha_ult]
--GO
/****** Object:  Default [DF__RUSUARIOS__jdd__1C0818FF]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RUSUARIOS] ADD  DEFAULT (0) FOR [jdd]
GO
/****** Object:  Default [DF__RUSUARIOS__Usuar__1CFC3D38]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RUSUARIOS] ADD  DEFAULT (' ') FOR [Usuario]
GO
/****** Object:  Default [DF__RUSUARIOS__Estad__1DF06171]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RUSUARIOS] ADD  DEFAULT (' ') FOR [Estado]
GO
/****** Object:  Default [DF__RUSUARIOS__Descr__1EE485AA]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RUSUARIOS] ADD  DEFAULT (' ') FOR [Descrip]
GO
/****** Object:  Default [DF__RUSUARIOS__Dato__1FD8A9E3]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RUSUARIOS] ADD  DEFAULT (' ') FOR [Dato]
GO
/****** Object:  Default [DF__RUSUARIOS__Histo__20CCCE1C]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RUSUARIOS] ADD  DEFAULT (' ') FOR [Historia]
GO
/****** Object:  Default [DF__RUSUARIOS__Fecha__21C0F255]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RUSUARIOS] ADD  DEFAULT (getdate()) FOR [Fecha_exp]
GO
/****** Object:  Default [DF__RUSUARIOS__perfi__22B5168E]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RUSUARIOS] ADD  DEFAULT (' ') FOR [perfil]
GO
/****** Object:  Default [DF__RUSUARIOS__mail__23A93AC7]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RUSUARIOS] ADD  DEFAULT (' ') FOR [mail]
GO
/****** Object:  Default [DF__RUSUARIOS__Empre__249D5F00]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RUSUARIOS] ADD  DEFAULT (' ') FOR [Empresa]
GO
/****** Object:  Default [DF__RUSUARIOS__Ubica__25918339]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RUSUARIOS] ADD  DEFAULT (0) FOR [Ubica]
GO
/****** Object:  Default [DF__RUSUARIOS__Inten__7B313519]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RUSUARIOS] ADD  DEFAULT (0) FOR [Intentos]
GO
/****** Object:  Default [DF__RUSUARIOS__Sele__7C255952]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RUSUARIOS] ADD  DEFAULT (' ') FOR [Sele]
GO
/****** Object:  Default [DF__RUSUARIOS__Antig__7D197D8B]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RUSUARIOS] ADD  DEFAULT (' ') FOR [Antig]
GO
/****** Object:  Default [DF__RUSUARIOS__fono__2DD28ED6]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RUSUARIOS] ADD  DEFAULT (' ') FOR [fono]
GO
/****** Object:  Default [DF__RUSUARIOS__cont___48868512]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RUSUARIOS] ADD  DEFAULT (' ') FOR [cont_princ]
GO
/****** Object:  Default [DF__RUSUARIOS__ej_pa__497AA94B]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RUSUARIOS] ADD  DEFAULT (' ') FOR [ej_payroll]
GO
/****** Object:  Default [DF__RUSUARIOS__ger_o__5D81A1F8]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RUSUARIOS] ADD  DEFAULT ((0)) FOR [ger_out]
GO
/****** Object:  Default [DF__RUSUARIOS__subge__5E75C631]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RUSUARIOS] ADD  DEFAULT ((0)) FOR [subge_out]
GO
/****** Object:  Default [DF__RUSUARIOS__jefe___5F69EA6A]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RUSUARIOS] ADD  DEFAULT ((0)) FOR [jefe_out]
GO
/****** Object:  Default [DF__RUSUARIOS__grupo__605E0EA3]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RUSUARIOS] ADD  DEFAULT ((0)) FOR [grupo_out]
GO
/****** Object:  Default [DF__RUSUARIOS__idAre__615232DC]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RUSUARIOS] ADD  DEFAULT ((0)) FOR [idArea]
GO
/****** Object:  Default [DF__RUSUARIOS__super__62465715]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RUSUARIOS] ADD  DEFAULT ((0)) FOR [supervisor]
GO
--/****** Object:  Default [DF__RUSUARIOI__jdd__286DEFE4]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RUSUARIOI] ADD  DEFAULT (0) FOR [jdd]
--GO
--/****** Object:  Default [DF__RUSUARIOI__Usuar__2962141D]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RUSUARIOI] ADD  DEFAULT (' ') FOR [Usuario]
--GO
--/****** Object:  Default [DF__RUSUARIOI__Inten__2A563856]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RUSUARIOI] ADD  DEFAULT (0) FOR [Intentos]
--GO
--/****** Object:  Default [DF__RUSUARIO__Usuari__4CF5691D]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RUSUARIO] ADD  DEFAULT (' ') FOR [Usuario]
--GO
--/****** Object:  Default [DF__RUSUARIO__Descri__4DE98D56]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RUSUARIO] ADD  DEFAULT (' ') FOR [Descrip]
--GO
--/****** Object:  Default [DF__RUSUARIO__Dato__4EDDB18F]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RUSUARIO] ADD  DEFAULT (' ') FOR [Dato]
--GO
--/****** Object:  Default [DF__RUSUARIO__Condic__4FD1D5C8]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RUSUARIO] ADD  DEFAULT (' ') FOR [Condicion]
--GO
--/****** Object:  Default [DF__RUSUARIO__Estado__50C5FA01]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RUSUARIO] ADD  DEFAULT (' ') FOR [Estado]
--GO
--/****** Object:  Default [DF__RUSUARIO__DescCo__51BA1E3A]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RUSUARIO] ADD  DEFAULT (' ') FOR [DescCond]
--GO
--/****** Object:  Default [DF__RUSUARIO__Codigo__52AE4273]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RUSUARIO] ADD  DEFAULT (' ') FOR [Codigo]
--GO
--/****** Object:  Default [DF__RUSUARIO__Dato2__53A266AC]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RUSUARIO] ADD  DEFAULT (' ') FOR [Dato2]
--GO
--/****** Object:  Default [DF__RUSUARIO__Histor__54968AE5]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RUSUARIO] ADD  DEFAULT (' ') FOR [Histori]
--GO
--/****** Object:  Default [DF__RUSUARIO__Ngrab__558AAF1E]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RUSUARIO] ADD  DEFAULT (0) FOR [Ngrab]
--GO
--/****** Object:  Default [DF__RUSUARIO__Tie__567ED357]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RUSUARIO] ADD  DEFAULT (' ') FOR [Tie]
--GO
--/****** Object:  Default [DF__RUSUARIO__Jdd__5772F790]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RUSUARIO] ADD  DEFAULT (0) FOR [Jdd]
--GO
--/****** Object:  Default [DF__RUNICAR__Empresa__43F60EC8]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RUNICAR] ADD  DEFAULT (' ') FOR [Empresa]
--GO
--/****** Object:  Default [DF__RUNICAR__Unidad__44EA3301]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RUNICAR] ADD  DEFAULT (0) FOR [Unidad]
--GO
--/****** Object:  Default [DF__RUNICAR__Cargo__45DE573A]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RUNICAR] ADD  DEFAULT (0) FOR [Cargo]
--GO
--/****** Object:  Default [DF__RUNICAR__vacan__46D27B73]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RUNICAR] ADD  DEFAULT (0) FOR [vacan]
--GO
--/****** Object:  Default [DF__RUNICAR__Dotacio__47C69FAC]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RUNICAR] ADD  DEFAULT (0) FOR [Dotacion]
--GO
--/****** Object:  Default [DF__RUNICAR__Jdd__48BAC3E5]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RUNICAR] ADD  DEFAULT (0) FOR [Jdd]
--GO
/****** Object:  Default [DF__RultseleD__Jdd__0A5E6A10]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RultseleD] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__RultseleD__Sele__0B528E49]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RultseleD] ADD  DEFAULT ((0)) FOR [Sele]
GO
/****** Object:  Default [DF__RultseleD__descr__0C46B282]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RultseleD] ADD  DEFAULT (' ') FOR [descrip]
GO
/****** Object:  Default [DF__Rultsele__Jdd__02BD4848]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Rultsele] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__Rultsele__jdato__03B16C81]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Rultsele] ADD  DEFAULT (' ') FOR [jdato]
GO
/****** Object:  Default [DF__Rultsele__Sele__04A590BA]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Rultsele] ADD  DEFAULT ((0)) FOR [Sele]
GO
/****** Object:  Default [DF__Rultsele__Usuari__0599B4F3]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Rultsele] ADD  DEFAULT (' ') FOR [Usuario]
GO
/****** Object:  Default [DF__Rultsele__Codigo__068DD92C]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Rultsele] ADD  DEFAULT (' ') FOR [Codigo]
GO
/****** Object:  Default [DF__Rultsele__rut__0781FD65]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Rultsele] ADD  DEFAULT (' ') FOR [rut]
GO
--/****** Object:  Default [DF__RULTSEL__Jdd__5B988E2F]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RULTSEL] ADD  DEFAULT (0) FOR [Jdd]
--GO
--/****** Object:  Default [DF__RULTSEL__jdato__5C8CB268]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RULTSEL] ADD  DEFAULT (' ') FOR [jdato]
--GO
--/****** Object:  Default [DF__RULTSEL__Usuario__5D80D6A1]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RULTSEL] ADD  DEFAULT (' ') FOR [Usuario]
--GO
--/****** Object:  Default [DF__RULTSEL__Codigo__5E74FADA]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RULTSEL] ADD  DEFAULT (' ') FOR [Codigo]
--GO
--/****** Object:  Default [DF__RULTSEL__rut__7A3D10E0]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RULTSEL] ADD  DEFAULT (' ') FOR [rut]
--GO
--/****** Object:  Default [DF__RULTIMOS__Copar__4E298478]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RULTIMOS] ADD  DEFAULT (' ') FOR [Copar]
--GO
--/****** Object:  Default [DF__RULTIMOS__Descri__4F1DA8B1]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RULTIMOS] ADD  DEFAULT (' ') FOR [Descrip]
--GO
--/****** Object:  Default [DF__RULTIMOS__Param__5011CCEA]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RULTIMOS] ADD  DEFAULT (' ') FOR [Param]
--GO
--/****** Object:  Default [DF__RULTIMOS__Ngrab__5105F123]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RULTIMOS] ADD  DEFAULT (0) FOR [Ngrab]
--GO
--/****** Object:  Default [DF__RULTIMOS__Paradi__51FA155C]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RULTIMOS] ADD  DEFAULT (' ') FOR [Paradi]
--GO
--/****** Object:  Default [DF__RTRAPRO__Cod_pro__2724C5F0]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RTRAPRO] ADD  DEFAULT (0) FOR [Cod_pro]
--GO
--/****** Object:  Default [DF__RTRAPRO__Descrip__2818EA29]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RTRAPRO] ADD  DEFAULT (' ') FOR [Descrip]
--GO
--/****** Object:  Default [DF__RTRAPRO__Valor__290D0E62]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RTRAPRO] ADD  DEFAULT (0) FOR [Valor]
--GO
--/****** Object:  Default [DF__RTRAPRO__Unidad__2A01329B]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RTRAPRO] ADD  DEFAULT (' ') FOR [Unidad]
--GO
--/****** Object:  Default [DF__RTRAPRO__Cohade__2AF556D4]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RTRAPRO] ADD  DEFAULT (' ') FOR [Cohade]
--GO
--/****** Object:  Default [DF__RTRAPRO__Jdd__2BE97B0D]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RTRAPRO] ADD  DEFAULT (0) FOR [Jdd]
--GO
--/****** Object:  Default [DF__RTRAMOV__Codigo__2EC5E7B8]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RTRAMOV] ADD  DEFAULT (' ') FOR [Codigo]
--GO
--/****** Object:  Default [DF__RTRAMOV__Numcom__2FBA0BF1]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RTRAMOV] ADD  DEFAULT (0) FOR [Numcom]
--GO
--/****** Object:  Default [DF__RTRAMOV__Ames__30AE302A]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RTRAMOV] ADD  DEFAULT (' ') FOR [Ames]
--GO
--/****** Object:  Default [DF__RTRAMOV__fecha_t__31A25463]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RTRAMOV] ADD  DEFAULT (getdate()) FOR [fecha_tra]
--GO
--/****** Object:  Default [DF__RTRAMOV__Cod_pro__3296789C]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RTRAMOV] ADD  DEFAULT (0) FOR [Cod_pro]
--GO
--/****** Object:  Default [DF__RTRAMOV__Cantid__338A9CD5]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RTRAMOV] ADD  DEFAULT (0) FOR [Cantid]
--GO
--/****** Object:  Default [DF__RTRAMOV__ValUni__347EC10E]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RTRAMOV] ADD  DEFAULT (0) FOR [ValUni]
--GO
--/****** Object:  Default [DF__RTRAMOV__Cohade__3572E547]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RTRAMOV] ADD  DEFAULT (' ') FOR [Cohade]
--GO
--/****** Object:  Default [DF__RTRAMOV__Cencos__36670980]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RTRAMOV] ADD  DEFAULT (0) FOR [Cencos]
--GO
--/****** Object:  Default [DF__RTRAMOV__Jdd__375B2DB9]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RTRAMOV] ADD  DEFAULT (0) FOR [Jdd]
--GO
/****** Object:  Default [DF__Rtiposeg__Tipo__332B7579]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Rtiposeg] ADD  DEFAULT (' ') FOR [Tipo]
GO
/****** Object:  Default [DF__Rtiposeg__Descri__341F99B2]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Rtiposeg] ADD  DEFAULT (' ') FOR [Descrip]
GO
/****** Object:  Default [DF__Rtiposeg__Jdd__3513BDEB]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Rtiposeg] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__RTEMPLATE__Codig__5FF32EF8]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RTEMPLATES] ADD  DEFAULT (' ') FOR [Codigo]
GO
/****** Object:  Default [DF__RTEMPLATES__Tipo__60E75331]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RTEMPLATES] ADD  DEFAULT (0) FOR [Tipo]
GO
/****** Object:  Default [DF__RTEMPLATE__Fecha__61DB776A]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RTEMPLATES] ADD  DEFAULT (getdate()) FOR [Fecha_cre]
GO
/****** Object:  Default [DF__RTEMPLATE__Fecha__62CF9BA3]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RTEMPLATES] ADD  DEFAULT (getdate()) FOR [Fecha_mod]
GO
/****** Object:  Default [DF__RTEMPLATE__Descr__63C3BFDC]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RTEMPLATES] ADD  DEFAULT (' ') FOR [Descrip]
GO
/****** Object:  Default [DF__RTEMPLATE__Templ__64B7E415]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RTEMPLATES] ADD  DEFAULT (' ') FOR [Template]
GO
/****** Object:  Default [DF__RTEMPLATES__Jdd__65AC084E]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RTEMPLATES] ADD  DEFAULT (0) FOR [Jdd]
GO
/****** Object:  Default [DF__RTEMPLATE__Forma__74B941B4]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RTEMPLATES] ADD  DEFAULT ('H') FOR [Formato]
GO
/****** Object:  Default [DF__RTEMPLATE__item1__2EC6B30F]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RTEMPLATES] ADD  DEFAULT (' ') FOR [item1]
GO
/****** Object:  Default [DF__RTEMPLATE__item2__2FBAD748]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RTEMPLATES] ADD  DEFAULT (' ') FOR [item2]
GO
/****** Object:  Default [DF__RTEMPLATE__item3__30AEFB81]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RTEMPLATES] ADD  DEFAULT (' ') FOR [item3]
GO
/****** Object:  Default [DF__RTEMPLATE__item4__31A31FBA]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RTEMPLATES] ADD  DEFAULT (' ') FOR [item4]
GO
/****** Object:  Default [DF__RTEMPLATE__item5__329743F3]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RTEMPLATES] ADD  DEFAULT (' ') FOR [item5]
GO
/****** Object:  Default [DF__RTEMPLATE__item6__338B682C]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RTEMPLATES] ADD  DEFAULT (' ') FOR [item6]
GO
/****** Object:  Default [DF__RTEMPLATE__item7__347F8C65]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RTEMPLATES] ADD  DEFAULT (' ') FOR [item7]
GO
/****** Object:  Default [DF__RTEMPLATE__item8__3573B09E]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RTEMPLATES] ADD  DEFAULT (' ') FOR [item8]
GO
/****** Object:  Default [DF__RTEMPLATE__item9__3667D4D7]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RTEMPLATES] ADD  DEFAULT (' ') FOR [item9]
GO
/****** Object:  Default [DF__RTEMPLATE__item1__375BF910]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RTEMPLATES] ADD  DEFAULT (' ') FOR [item10]
GO
/****** Object:  Default [DF__RTEMPLATE__valor__38501D49]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RTEMPLATES] ADD  DEFAULT ('0') FOR [valor1]
GO
/****** Object:  Default [DF__RTEMPLATE__valor__39444182]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RTEMPLATES] ADD  DEFAULT ('0') FOR [valor2]
GO
/****** Object:  Default [DF__RTEMPLATE__valor__3A3865BB]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RTEMPLATES] ADD  DEFAULT ('0') FOR [valor3]
GO
/****** Object:  Default [DF__RTEMPLATE__valor__3B2C89F4]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RTEMPLATES] ADD  DEFAULT ('0') FOR [valor4]
GO
/****** Object:  Default [DF__RTEMPLATE__valor__3C20AE2D]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RTEMPLATES] ADD  DEFAULT ('0') FOR [valor5]
GO
/****** Object:  Default [DF__RTEMPLATE__valor__3D14D266]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RTEMPLATES] ADD  DEFAULT ('0') FOR [valor6]
GO
/****** Object:  Default [DF__RTEMPLATE__valor__3E08F69F]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RTEMPLATES] ADD  DEFAULT ('0') FOR [valor7]
GO
/****** Object:  Default [DF__RTEMPLATE__valor__3EFD1AD8]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RTEMPLATES] ADD  DEFAULT ('0') FOR [valor8]
GO
/****** Object:  Default [DF__RTEMPLATE__valor__3FF13F11]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RTEMPLATES] ADD  DEFAULT ('0') FOR [valor9]
GO
/****** Object:  Default [DF__RTEMPLATE__valor__40E5634A]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RTEMPLATES] ADD  DEFAULT ('0') FOR [valor10]
GO
/****** Object:  Default [DF__RTEMPLATE__firma__41D98783]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RTEMPLATES] ADD  DEFAULT (' ') FOR [firmacod]
GO
/****** Object:  Default [DF__RTEMPLATE__veaut__479260D9]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RTEMPLATES] ADD  DEFAULT (' ') FOR [veautoc]
GO
/****** Object:  Default [DF__RtablasH__Jdd__4A78EF25]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RtablasH] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__RtablasH__Ames__4B6D135E]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RtablasH] ADD  DEFAULT (' ') FOR [Ames]
GO
/****** Object:  Default [DF__RtablasH__Tipo__4C613797]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RtablasH] ADD  DEFAULT (' ') FOR [Tipo]
GO
/****** Object:  Default [DF__RtablasH__Cotab__4D555BD0]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RtablasH] ADD  DEFAULT ((0)) FOR [Cotab]
GO
/****** Object:  Default [DF__RtablasH__Codigo__4E498009]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RtablasH] ADD  DEFAULT ((0)) FOR [Codigo]
GO
/****** Object:  Default [DF__RtablasH__Descri__4F3DA442]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RtablasH] ADD  DEFAULT (' ') FOR [Descrip]
GO
/****** Object:  Default [DF__RtablasH__Valor__5031C87B]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RtablasH] ADD  DEFAULT ((0)) FOR [Valor]
GO
/****** Object:  Default [DF__RtablasH__Valor2__5125ECB4]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RtablasH] ADD  DEFAULT ((0)) FOR [Valor2]
GO
/****** Object:  Default [DF__RtablasH__ValorC__521A10ED]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RtablasH] ADD  DEFAULT (' ') FOR [ValorC]
GO
/****** Object:  Default [DF__RtablasH__Valor4__530E3526]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RtablasH] ADD  DEFAULT (' ') FOR [Valor4]
GO
/****** Object:  Default [DF__RtablasH__CodAl__5402595F]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RtablasH] ADD  DEFAULT (' ') FOR [CodAl]
GO
/****** Object:  Default [DF__RtablasH__ValorG__54F67D98]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RtablasH] ADD  DEFAULT (' ') FOR [ValorG]
GO
--/****** Object:  Default [DF__RTABLAS__Tipo__47DBAE45]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RTABLAS] ADD  DEFAULT (' ') FOR [Tipo]
--GO
--/****** Object:  Default [DF__RTABLAS__Cotab__48CFD27E]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RTABLAS] ADD  DEFAULT (0) FOR [Cotab]
--GO
--/****** Object:  Default [DF__RTABLAS__Codigo__49C3F6B7]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RTABLAS] ADD  DEFAULT (0) FOR [Codigo]
--GO
--/****** Object:  Default [DF__RTABLAS__Descrip__4AB81AF0]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RTABLAS] ADD  DEFAULT (' ') FOR [Descrip]
--GO
--/****** Object:  Default [DF__RTABLAS__Valor__4BAC3F29]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RTABLAS] ADD  DEFAULT (0) FOR [Valor]
--GO
--/****** Object:  Default [DF__RTABLAS__Valor2__4CA06362]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RTABLAS] ADD  DEFAULT (0) FOR [Valor2]
--GO
--/****** Object:  Default [DF__RTABLAS__ValorC__4D94879B]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RTABLAS] ADD  DEFAULT (' ') FOR [ValorC]
--GO
--/****** Object:  Default [DF__RTABLAS__Valor4__4E88ABD4]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RTABLAS] ADD  DEFAULT (' ') FOR [Valor4]
--GO
--/****** Object:  Default [DF__RTABLAS__CodAl__4F7CD00D]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RTABLAS] ADD  DEFAULT (' ') FOR [CodAl]
--GO
--/****** Object:  Default [DF__RTABLAS__Jdd__5070F446]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RTABLAS] ADD  DEFAULT (0) FOR [Jdd]
--GO
--/****** Object:  Default [DF__RTABLAS__ValorG__37B03374]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RTABLAS] ADD  DEFAULT ('') FOR [ValorG]
--GO
--/****** Object:  Default [DF__RSOLPEN__Codigo__17786E0C]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RSOLPEN] ADD  DEFAULT (' ') FOR [Codigo]
--GO
--/****** Object:  Default [DF__RSOLPEN__Tipo__186C9245]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RSOLPEN] ADD  DEFAULT (0) FOR [Tipo]
--GO
--/****** Object:  Default [DF__RSOLPEN__Nusol__1960B67E]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RSOLPEN] ADD  DEFAULT (0) FOR [Nusol]
--GO
--/****** Object:  Default [DF__RSOLPEN__Fecha_s__1A54DAB7]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RSOLPEN] ADD  DEFAULT (getdate()) FOR [Fecha_sol]
--GO
--/****** Object:  Default [DF__RSOLPEN__Estado__1B48FEF0]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RSOLPEN] ADD  DEFAULT (0) FOR [Estado]
--GO
--/****** Object:  Default [DF__RSOLPEN__Fecha_t__1C3D2329]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RSOLPEN] ADD  DEFAULT (getdate()) FOR [Fecha_ter]
--GO
--/****** Object:  Default [DF__RSOLPEN__Detalle__1D314762]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RSOLPEN] ADD  DEFAULT (' ') FOR [Detalle]
--GO
--/****** Object:  Default [DF__RSOLPEN__Params__1E256B9B]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RSOLPEN] ADD  DEFAULT (' ') FOR [Params]
--GO
--/****** Object:  Default [DF__RSOLPEN__Priori__1F198FD4]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RSOLPEN] ADD  DEFAULT (' ') FOR [Priori]
--GO
--/****** Object:  Default [DF__RSOLPEN__Jefe__200DB40D]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RSOLPEN] ADD  DEFAULT (' ') FOR [Jefe]
--GO
--/****** Object:  Default [DF__RSOLPEN__Obs__2101D846]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RSOLPEN] ADD  DEFAULT (' ') FOR [Obs]
--GO
--/****** Object:  Default [DF__RSOLPEN__Jdd__21F5FC7F]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RSOLPEN] ADD  DEFAULT (0) FOR [Jdd]
--GO
--/****** Object:  Default [DF__RSOLICI__Codigo__76818E95]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RSOLICI] ADD  DEFAULT (' ') FOR [Codigo]
--GO
--/****** Object:  Default [DF__RSOLICI__Tipo__7775B2CE]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RSOLICI] ADD  DEFAULT (0) FOR [Tipo]
--GO
--/****** Object:  Default [DF__RSOLICI__Fecha_i__7869D707]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RSOLICI] ADD  DEFAULT (getdate()) FOR [Fecha_ini]
--GO
--/****** Object:  Default [DF__RSOLICI__Estado__795DFB40]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RSOLICI] ADD  DEFAULT (0) FOR [Estado]
--GO
--/****** Object:  Default [DF__RSOLICI__Fecha_t__7A521F79]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RSOLICI] ADD  DEFAULT (getdate()) FOR [Fecha_ter]
--GO
--/****** Object:  Default [DF__RSOLICI__Detalle__7B4643B2]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RSOLICI] ADD  DEFAULT (' ') FOR [Detalle]
--GO
--/****** Object:  Default [DF__RSOLICI__Jdd__7C3A67EB]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RSOLICI] ADD  DEFAULT (0) FOR [Jdd]
--GO
/****** Object:  Default [DF__Rsercola__usuari__40857097]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Rsercola] ADD  DEFAULT (' ') FOR [usuario]
GO
/****** Object:  Default [DF__Rsercola__id__417994D0]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Rsercola] ADD  DEFAULT (' ') FOR [id]
GO
/****** Object:  Default [DF__Rsercola__docume__426DB909]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Rsercola] ADD  DEFAULT ((0)) FOR [documento]
GO
/****** Object:  Default [DF__Rsercola__IDRepo__4361DD42]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Rsercola] ADD  DEFAULT (' ') FOR [IDReporte]
GO
/****** Object:  Default [DF__Rsercola__Finali__4456017B]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Rsercola] ADD  DEFAULT ((0)) FOR [Finalizo]
GO
/****** Object:  Default [DF__Rsercola__Fecha___454A25B4]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Rsercola] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [Fecha_ini]
GO
/****** Object:  Default [DF__Rsercola__Fecha___463E49ED]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Rsercola] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [Fecha_in2]
GO
/****** Object:  Default [DF__Rsercola__Fecha___47326E26]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Rsercola] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [Fecha_fin]
GO
/****** Object:  Default [DF__Rsercola__cantid__4826925F]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Rsercola] ADD  DEFAULT ((0)) FOR [cantidad]
GO
/****** Object:  Default [DF__Rsercola__comple__491AB698]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Rsercola] ADD  DEFAULT ((0)) FOR [completo]
GO
/****** Object:  Default [DF__Rsercola__descri__4A0EDAD1]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Rsercola] ADD  DEFAULT (' ') FOR [descrip]
GO
/****** Object:  Default [DF__Rsercola__feliq__4B02FF0A]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Rsercola] ADD  DEFAULT (' ') FOR [feliq]
GO
/****** Object:  Default [DF__Rsercola__peri__4BF72343]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Rsercola] ADD  DEFAULT (' ') FOR [peri]
GO
/****** Object:  Default [DF__Rsercola__Jdd__4CEB477C]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Rsercola] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__Rsercola__tipo__4DDF6BB5]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Rsercola] ADD  DEFAULT ((0)) FOR [tipo]
GO
/****** Object:  Default [DF__Rsercola__Idbatc__7094766C]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Rsercola] ADD  DEFAULT ((0)) FOR [Idbatch]
GO
/****** Object:  Default [DF__RSeguros__Codigo__0AB36FCB]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RSeguros] ADD  DEFAULT (' ') FOR [Codigo]
GO
/****** Object:  Default [DF__RSeguros__Seguro__0BA79404]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RSeguros] ADD  DEFAULT ((0)) FOR [Seguro]
GO
/****** Object:  Default [DF__RSeguros__Instit__0C9BB83D]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RSeguros] ADD  DEFAULT ((0)) FOR [Institu]
GO
/****** Object:  Default [DF__RSeguros__NroPol__0D8FDC76]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RSeguros] ADD  DEFAULT (' ') FOR [NroPoliza]
GO
/****** Object:  Default [DF__RSeguros__MontoE__0E8400AF]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RSeguros] ADD  DEFAULT ((0)) FOR [MontoEmpr]
GO
/****** Object:  Default [DF__RSeguros__MonEmp__0F7824E8]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RSeguros] ADD  DEFAULT ((0)) FOR [MonEmpr]
GO
/****** Object:  Default [DF__RSeguros__MontoE__106C4921]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RSeguros] ADD  DEFAULT ((0)) FOR [MontoEmpl]
GO
/****** Object:  Default [DF__RSeguros__MonEmp__11606D5A]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RSeguros] ADD  DEFAULT ((0)) FOR [MonEmpl]
GO
/****** Object:  Default [DF__RSeguros__Fecha___12549193]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RSeguros] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [Fecha_ini]
GO
/****** Object:  Default [DF__RSeguros__Fecha___1348B5CC]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RSeguros] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [Fecha_fin]
GO
/****** Object:  Default [DF__RSeguros__Jdd__143CDA05]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RSeguros] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__RSeguros__Estado__1530FE3E]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RSeguros] ADD  DEFAULT ((0)) FOR [Estado]
GO
--/****** Object:  Default [DF__RSEGGRUP__Grupo__46486B8E]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RSEGGRUP] ADD  DEFAULT (' ') FOR [Grupo]
--GO
--/****** Object:  Default [DF__RSEGGRUP__Nombre__473C8FC7]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RSEGGRUP] ADD  DEFAULT (' ') FOR [Nombre]
--GO
--/****** Object:  Default [DF__RSEGGRUP__Empres__4830B400]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RSEGGRUP] ADD  DEFAULT (' ') FOR [Empresas]
--GO
--/****** Object:  Default [DF__RSEGGRUP__Ngrab__4924D839]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RSEGGRUP] ADD  DEFAULT (0) FOR [Ngrab]
--GO
--/****** Object:  Default [DF__RSEGGRUP__Jdd__4A18FC72]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RSEGGRUP] ADD  DEFAULT (0) FOR [Jdd]
--GO
--/****** Object:  Default [DF__RSEGDER__Codseg__3CBF0154]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RSEGDER] ADD  DEFAULT (' ') FOR [Codseg]
--GO
--/****** Object:  Default [DF__RSEGDER__Item__3DB3258D]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RSEGDER] ADD  DEFAULT (' ') FOR [Item]
--GO
--/****** Object:  Default [DF__RSEGDER__Tipo__3EA749C6]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RSEGDER] ADD  DEFAULT (' ') FOR [Tipo]
--GO
--/****** Object:  Default [DF__RSEGDER__Stipo__3F9B6DFF]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RSEGDER] ADD  DEFAULT (' ') FOR [Stipo]
--GO
--/****** Object:  Default [DF__RSEGDER__Permiso__408F9238]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RSEGDER] ADD  DEFAULT (' ') FOR [Permisos]
--GO
--/****** Object:  Default [DF__RSEGDER__Ngrab__4183B671]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RSEGDER] ADD  DEFAULT (' ') FOR [Ngrab]
--GO
--/****** Object:  Default [DF__RSEGDER__Tie__4277DAAA]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RSEGDER] ADD  DEFAULT (' ') FOR [Tie]
--GO
--/****** Object:  Default [DF__RSEGDER__Jdd__436BFEE3]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RSEGDER] ADD  DEFAULT (0) FOR [Jdd]
--GO
/****** Object:  Default [DF__rrotupr5__campo__47127295]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[rrotupr5] ADD  DEFAULT (' ') FOR [campo]
GO
/****** Object:  Default [DF__rrotupr5__tabla__480696CE]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[rrotupr5] ADD  DEFAULT (' ') FOR [tabla]
GO
/****** Object:  Default [DF__rrotupr5__rotulo__48FABB07]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[rrotupr5] ADD  DEFAULT (' ') FOR [rotulo]
GO
/****** Object:  Default [DF__rrotupr5__descri__49EEDF40]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[rrotupr5] ADD  DEFAULT (' ') FOR [descrip]
GO
/****** Object:  Default [DF__rrotupr5__cambia__4AE30379]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[rrotupr5] ADD  DEFAULT (' ') FOR [cambiado]
GO
/****** Object:  Default [DF__rrotupr5__Jdd__4BD727B2]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[rrotupr5] ADD  DEFAULT ((0)) FOR [Jdd]
GO
--/****** Object:  Default [DF__RROTULOS__Campo__58520D30]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RROTULOS] ADD  DEFAULT (' ') FOR [Campo]
--GO
--/****** Object:  Default [DF__RROTULOS__Alias__59463169]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RROTULOS] ADD  DEFAULT (' ') FOR [Alias]
--GO
--/****** Object:  Default [DF__RROTULOS__Clasif__5A3A55A2]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RROTULOS] ADD  DEFAULT (' ') FOR [Clasif]
--GO
--/****** Object:  Default [DF__RROTULOS__Rotulo__5B2E79DB]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RROTULOS] ADD  DEFAULT (' ') FOR [Rotulo]
--GO
--/****** Object:  Default [DF__RROTULOS__Descri__5C229E14]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RROTULOS] ADD  DEFAULT (' ') FOR [Descrip]
--GO
--/****** Object:  Default [DF__RROTULOS__Jdd__5D16C24D]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RROTULOS] ADD  DEFAULT (0) FOR [Jdd]
--GO
/****** Object:  Default [DF__Rreportes__Jdd__0F231F2D]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Rreportes] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__Rreportes__IDRep__10174366]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Rreportes] ADD  DEFAULT (' ') FOR [IDReporte]
GO
/****** Object:  Default [DF__Rreportes__Descr__110B679F]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Rreportes] ADD  DEFAULT (' ') FOR [Descrip]
GO
/****** Object:  Default [DF__Rreportes__Repor__11FF8BD8]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Rreportes] ADD  DEFAULT ((0)) FOR [Reporte]
GO
/****** Object:  Default [DF__Rreportes__Autor__12F3B011]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Rreportes] ADD  DEFAULT (' ') FOR [Autor]
GO
/****** Object:  Default [DF__Rreportes__Fecha__13E7D44A]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Rreportes] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [Fecha_cre]
GO
/****** Object:  Default [DF__Rreportes__Fecha__14DBF883]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Rreportes] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [Fecha_rev]
GO
/****** Object:  Default [DF__Rreportes__Tipo__15D01CBC]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Rreportes] ADD  DEFAULT ((0)) FOR [Tipo]
GO
/****** Object:  Default [DF__RRECIBOS__Codigo__713DB68B]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RRECIBOS] ADD  DEFAULT (' ') FOR [Codigo]
GO
/****** Object:  Default [DF__RRECIBOS__Ames__7231DAC4]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RRECIBOS] ADD  DEFAULT (' ') FOR [Ames]
GO
/****** Object:  Default [DF__RRECIBOS__Peri__7325FEFD]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RRECIBOS] ADD  DEFAULT (' ') FOR [Peri]
GO
/****** Object:  Default [DF__RRECIBOS__Recibo__741A2336]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RRECIBOS] ADD  DEFAULT (0x00) FOR [Recibo]
GO
/****** Object:  Default [DF__RRECIBOS__Usu_cr__750E476F]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RRECIBOS] ADD  DEFAULT (' ') FOR [Usu_cre]
GO
/****** Object:  Default [DF__RRECIBOS__Fecha___76026BA8]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RRECIBOS] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [Fecha_cre]
GO
/****** Object:  Default [DF__RRECIBOS__Firman__76F68FE1]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RRECIBOS] ADD  DEFAULT (' ') FOR [Firmante]
GO
/****** Object:  Default [DF__RRECIBOS__Fecha___77EAB41A]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RRECIBOS] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [Fecha_fir]
GO
/****** Object:  Default [DF__RRECIBOS__Fecha___78DED853]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RRECIBOS] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [Fecha_epr]
GO
/****** Object:  Default [DF__RRECIBOS__IP_fir__79D2FC8C]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RRECIBOS] ADD  DEFAULT (' ') FOR [IP_fir]
GO
/****** Object:  Default [DF__RRECIBOS__Obs__7AC720C5]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RRECIBOS] ADD  DEFAULT (' ') FOR [Obs]
GO
/****** Object:  Default [DF__RRECIBOS__Jdd__7BBB44FE]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RRECIBOS] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__RRECIBOS__IdLote__78359834]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RRECIBOS] ADD  DEFAULT ((0)) FOR [IdLote]
GO
/****** Object:  Default [DF__RRECIBOS__Visto__7929BC6D]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RRECIBOS] ADD  DEFAULT ((0)) FOR [Visto]
GO
/****** Object:  Default [DF__RRECIBOS__Confor__7A1DE0A6]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RRECIBOS] ADD  DEFAULT ((0)) FOR [Conform]
GO
/****** Object:  Default [DF__RRECIBOS__Recibo__4B18D8FA]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RRECIBOS] ADD  DEFAULT ((0)) FOR [ReciboC]
GO
/****** Object:  Default [DF__RRECIBOS__Recibo__4C0CFD33]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RRECIBOS] ADD  DEFAULT ((0)) FOR [ReciboNC]
GO
/****** Object:  Default [DF__RPUBLICA__RUT__0E7913B7]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RPUBLICA] ADD  DEFAULT (' ') FOR [RUT]
GO
/****** Object:  Default [DF__RPUBLICA__titulo__0F6D37F0]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RPUBLICA] ADD  DEFAULT (' ') FOR [titulo]
GO
/****** Object:  Default [DF__RPUBLICA__autore__10615C29]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RPUBLICA] ADD  DEFAULT (' ') FOR [autores]
GO
/****** Object:  Default [DF__RPUBLICA__anhio__11558062]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RPUBLICA] ADD  DEFAULT (0) FOR [anhio]
GO
/****** Object:  Default [DF__RPUBLICA__fecha__1249A49B]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RPUBLICA] ADD  DEFAULT (getdate()) FOR [fecha]
GO
/****** Object:  Default [DF__RPUBLICA__revlib__133DC8D4]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RPUBLICA] ADD  DEFAULT (' ') FOR [revlibeve]
GO
/****** Object:  Default [DF__RPUBLICA__capitu__1431ED0D]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RPUBLICA] ADD  DEFAULT (' ') FOR [capitulo]
GO
/****** Object:  Default [DF__RPUBLICA__pagina__15261146]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RPUBLICA] ADD  DEFAULT (' ') FOR [paginas]
GO
/****** Object:  Default [DF__RPUBLICA__clave__161A357F]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RPUBLICA] ADD  DEFAULT (' ') FOR [clave]
GO
/****** Object:  Default [DF__RPUBLICA__isbn__170E59B8]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RPUBLICA] ADD  DEFAULT (' ') FOR [isbn]
GO
/****** Object:  Default [DF__RPUBLICA__editor__18027DF1]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RPUBLICA] ADD  DEFAULT (' ') FOR [editores]
GO
/****** Object:  Default [DF__RPUBLICA__editor__18F6A22A]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RPUBLICA] ADD  DEFAULT (' ') FOR [editorial]
GO
/****** Object:  Default [DF__RPUBLICA__lugar__19EAC663]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RPUBLICA] ADD  DEFAULT (' ') FOR [lugar]
GO
/****** Object:  Default [DF__RPUBLICA__tipo__1ADEEA9C]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RPUBLICA] ADD  DEFAULT (0) FOR [tipo]
GO
/****** Object:  Default [DF__RPUBLICA__Fecha___1BD30ED5]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RPUBLICA] ADD  DEFAULT (getdate()) FOR [Fecha_mod]
GO
/****** Object:  Default [DF__RPUBLICA__observ__1CC7330E]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RPUBLICA] ADD  DEFAULT (' ') FOR [observ]
GO
/****** Object:  Default [DF__RPUBLICA__vobo__1DBB5747]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RPUBLICA] ADD  DEFAULT (0) FOR [vobo]
GO
/****** Object:  Default [DF__RPUBLICA__usrvob__1EAF7B80]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RPUBLICA] ADD  DEFAULT (' ') FOR [usrvobo]
GO
/****** Object:  Default [DF__RPUBLICA__Jdd__57C8C8A2]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RPUBLICA] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__RPROGRL__Codigo__2E90DD8E]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RPROGRL] ADD  DEFAULT (' ') FOR [Codigo]
GO
/****** Object:  Default [DF__RPROGRL__Ames__2F8501C7]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RPROGRL] ADD  DEFAULT (' ') FOR [Ames]
GO
/****** Object:  Default [DF__RPROGRL__EMPRESA__30792600]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RPROGRL] ADD  DEFAULT (' ') FOR [EMPRESA]
GO
/****** Object:  Default [DF__RPROGRL__CENCOS__316D4A39]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RPROGRL] ADD  DEFAULT (0) FOR [CENCOS]
GO
/****** Object:  Default [DF__RPROGRL__DIAS__32616E72]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RPROGRL] ADD  DEFAULT (0) FOR [DIAS]
GO
/****** Object:  Default [DF__RPROGRL__MONTO__335592AB]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RPROGRL] ADD  DEFAULT (0) FOR [MONTO]
GO
/****** Object:  Default [DF__RPROGRL__BASE__3449B6E4]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RPROGRL] ADD  DEFAULT (0) FOR [BASE]
GO
/****** Object:  Default [DF__RPROGRL__DIASP__353DDB1D]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RPROGRL] ADD  DEFAULT (0) FOR [DIASP]
GO
/****** Object:  Default [DF__RPROGRL__PORCEN__3631FF56]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RPROGRL] ADD  DEFAULT (0) FOR [PORCEN]
GO
/****** Object:  Default [DF__RPROGRL__Jdd__75592B89]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RPROGRL] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__RPRODUCTO__Descr__15460CD7]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RPRODUCTOS] ADD  DEFAULT (' ') FOR [Descrip]
GO
/****** Object:  Default [DF__RPRODUCTO__Preci__163A3110]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RPRODUCTOS] ADD  DEFAULT ((0)) FOR [Precio]
GO
/****** Object:  Default [DF__RPRODUCTO__CantE__172E5549]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RPRODUCTOS] ADD  DEFAULT ((0)) FOR [CantEmple]
GO
/****** Object:  Default [DF__RPRODUCTO__Fecha__18227982]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RPRODUCTOS] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [Fechaini]
GO
/****** Object:  Default [DF__RPRODUCTO__Fecha__19169DBB]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RPRODUCTOS] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [Fechafin]
GO
/****** Object:  Default [DF__RPRODUCTO__Usuar__1A0AC1F4]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RPRODUCTOS] ADD  DEFAULT (' ') FOR [UsuarAlta]
GO
/****** Object:  Default [DF__RPRODUCTO__Fecha__1AFEE62D]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RPRODUCTOS] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [FechaAlta]
GO
/****** Object:  Default [DF__RPRODUCTO__Usuar__1BF30A66]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RPRODUCTOS] ADD  DEFAULT (' ') FOR [UsuarUltM]
GO
/****** Object:  Default [DF__RPRODUCTO__Fecha__1CE72E9F]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RPRODUCTOS] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [FechaUltM]
GO
/****** Object:  Default [DF__RPRODUCTO__Plata__1DDB52D8]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RPRODUCTOS] ADD  DEFAULT (' ') FOR [Plataforma]
GO
/****** Object:  Default [DF__RPRODUCTO__VencU__1ECF7711]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RPRODUCTOS] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [VencUpgr]
GO
/****** Object:  Default [DF__RPRODUCTO__Tipol__1FC39B4A]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RPRODUCTOS] ADD  DEFAULT (' ') FOR [Tipolic]
GO
/****** Object:  Default [DF__RPRODUCTO__Estup__20B7BF83]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RPRODUCTOS] ADD  DEFAULT ((0)) FOR [Estup]
GO
/****** Object:  Default [DF__RPRODUCTOS__Elim__21ABE3BC]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RPRODUCTOS] ADD  DEFAULT ((0)) FOR [Elim]
GO
/****** Object:  Default [DF__RPRODUCTO__Activ__22A007F5]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RPRODUCTOS] ADD  DEFAULT (' ') FOR [ActivoCRM]
GO
/****** Object:  Default [DF__RPRODUCTO__Activ__23942C2E]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RPRODUCTOS] ADD  DEFAULT (' ') FOR [ActivoASP]
GO
/****** Object:  Default [DF__RPRODUCTO__Versi__24885067]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RPRODUCTOS] ADD  DEFAULT (' ') FOR [Version]
GO
/****** Object:  Default [DF__RPRODUCTOS__Jdd__257C74A0]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RPRODUCTOS] ADD  DEFAULT ((0)) FOR [Jdd]
GO
--/****** Object:  Default [DF__RPREUNI__Empresa__3C54ED00]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RPREUNI] ADD  DEFAULT (' ') FOR [Empresa]
--GO
--/****** Object:  Default [DF__RPREUNI__Unidad__3D491139]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RPREUNI] ADD  DEFAULT (0) FOR [Unidad]
--GO
--/****** Object:  Default [DF__RPREUNI__Depe__3E3D3572]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RPREUNI] ADD  DEFAULT (' ') FOR [Depe]
--GO
--/****** Object:  Default [DF__RPREUNI__Codres__3F3159AB]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RPREUNI] ADD  DEFAULT (' ') FOR [Codres]
--GO
--/****** Object:  Default [DF__RPREUNI__nivel__40257DE4]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RPREUNI] ADD  DEFAULT (' ') FOR [nivel]
--GO
--/****** Object:  Default [DF__RPREUNI__Jdd__4119A21D]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RPREUNI] ADD  DEFAULT (0) FOR [Jdd]
--GO
--/****** Object:  Default [DF__RPLANCU__Codplan__0ABD916C]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RPLANCU] ADD  DEFAULT (0) FOR [Codplan]
--GO
--/****** Object:  Default [DF__RPLANCU__Cohade__0BB1B5A5]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RPLANCU] ADD  DEFAULT (' ') FOR [Cohade]
--GO
--/****** Object:  Default [DF__RPLANCU__PerEsqD__0CA5D9DE]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RPLANCU] ADD  DEFAULT (0) FOR [PerEsqD]
--GO
--/****** Object:  Default [DF__RPLANCU__PerEsqC__0D99FE17]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RPLANCU] ADD  DEFAULT (0) FOR [PerEsqC]
--GO
--/****** Object:  Default [DF__RPLANCU__PerDato__0E8E2250]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RPLANCU] ADD  DEFAULT (' ') FOR [PerDato]
--GO
--/****** Object:  Default [DF__RPLANCU__PerDato__0F824689]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RPLANCU] ADD  DEFAULT (' ') FOR [PerDato2]
--GO
--/****** Object:  Default [DF__RPLANCU__DiaEsqD__10766AC2]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RPLANCU] ADD  DEFAULT (0) FOR [DiaEsqD]
--GO
--/****** Object:  Default [DF__RPLANCU__DiaEsqC__116A8EFB]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RPLANCU] ADD  DEFAULT (0) FOR [DiaEsqC]
--GO
--/****** Object:  Default [DF__RPLANCU__DiaDato__125EB334]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RPLANCU] ADD  DEFAULT (' ') FOR [DiaDato]
--GO
--/****** Object:  Default [DF__RPLANCU__DiaDato__1352D76D]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RPLANCU] ADD  DEFAULT (' ') FOR [DiaDato2]
--GO
--/****** Object:  Default [DF__RPLANCU__Fuera__1446FBA6]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RPLANCU] ADD  DEFAULT (' ') FOR [Fuera]
--GO
--/****** Object:  Default [DF__RPLANCU__Jdd__153B1FDF]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RPLANCU] ADD  DEFAULT (0) FOR [Jdd]
--GO
--/****** Object:  Default [DF__RPLANCU__CUENTAS__7740A8A4]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RPLANCU] ADD  DEFAULT (' ') FOR [CUENTAS]
--GO
--/****** Object:  Default [DF__RPLAING__Usuario__3A379A64]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RPLAING] ADD  DEFAULT (' ') FOR [Usuario]
--GO
--/****** Object:  Default [DF__RPLAING__Fecha__3B2BBE9D]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RPLAING] ADD  DEFAULT (getdate()) FOR [Fecha]
--GO
--/****** Object:  Default [DF__RPLAING__Cencos__3C1FE2D6]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RPLAING] ADD  DEFAULT (0) FOR [Cencos]
--GO
--/****** Object:  Default [DF__RPLAING__Codigo__3D14070F]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RPLAING] ADD  DEFAULT (' ') FOR [Codigo]
--GO
--/****** Object:  Default [DF__RPLAING__Cohade__3E082B48]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RPLAING] ADD  DEFAULT (' ') FOR [Cohade]
--GO
--/****** Object:  Default [DF__RPLAING__Monto__3EFC4F81]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RPLAING] ADD  DEFAULT (0) FOR [Monto]
--GO
--/****** Object:  Default [DF__RPLAING__Jdd__3FF073BA]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RPLAING] ADD  DEFAULT (0) FOR [Jdd]
--GO
/****** Object:  Default [DF__Rpermisos__Grupo__43CBF196]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Rpermisos] ADD  DEFAULT (' ') FOR [Grupo]
GO
/****** Object:  Default [DF__Rpermisos__Item__44C015CF]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Rpermisos] ADD  DEFAULT (' ') FOR [Item]
GO
/****** Object:  Default [DF__Rpermisos__Permi__45B43A08]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Rpermisos] ADD  DEFAULT (' ') FOR [Permisos]
GO
/****** Object:  Default [DF__Rpermisos__Verif__46A85E41]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Rpermisos] ADD  DEFAULT (' ') FOR [Verif]
GO
/****** Object:  Default [DF__Rpermisos__Jdd__479C827A]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Rpermisos] ADD  DEFAULT ((0)) FOR [Jdd]
GO
--/****** Object:  Default [DF__RPERFILES__Jdd__5911273F]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RPERFILES] ADD  DEFAULT (0) FOR [Jdd]
--GO
--/****** Object:  Default [DF__RPERFILES__Perfi__5A054B78]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RPERFILES] ADD  DEFAULT (' ') FOR [Perfil]
--GO
--/****** Object:  Default [DF__RPERFILES__Descr__5AF96FB1]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RPERFILES] ADD  DEFAULT (' ') FOR [Descrip]
--GO
--/****** Object:  Default [DF__RPERFILES__Dato__5BED93EA]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RPERFILES] ADD  DEFAULT (' ') FOR [Dato]
--GO
/****** Object:  Default [DF__RPAUSER__Usuario__1BFD2C07]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RPAUSER] ADD  DEFAULT (' ') FOR [Usuario]
GO
/****** Object:  Default [DF__RPAUSER__Copar__1CF15040]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RPAUSER] ADD  DEFAULT (' ') FOR [Copar]
GO
/****** Object:  Default [DF__RPAUSER__Descrip__1DE57479]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RPAUSER] ADD  DEFAULT (' ') FOR [Descrip]
GO
/****** Object:  Default [DF__RPAUSER__Param__1ED998B2]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RPAUSER] ADD  DEFAULT (' ') FOR [Param]
GO
/****** Object:  Default [DF__RPAUSER__Jdd__1FCDBCEB]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RPAUSER] ADD  DEFAULT (0) FOR [Jdd]
GO
/****** Object:  Default [DF__RPAUSER__paradi__71889AA5]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RPAUSER] ADD  DEFAULT (' ') FOR [paradi]
GO
--/****** Object:  Default [DF__RPASREL__Codigo__28F7FFC9]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RPASREL] ADD  DEFAULT (' ') FOR [Codigo]
--GO
--/****** Object:  Default [DF__RPASREL__Ames__29EC2402]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RPASREL] ADD  DEFAULT (' ') FOR [Ames]
--GO
--/****** Object:  Default [DF__RPASREL__Empresa__2AE0483B]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RPASREL] ADD  DEFAULT (' ') FOR [Empresa]
--GO
--/****** Object:  Default [DF__RPASREL__Peri__2BD46C74]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RPASREL] ADD  DEFAULT (' ') FOR [Peri]
--GO
--/****** Object:  Default [DF__RPASREL__Afecto__2CC890AD]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RPASREL] ADD  DEFAULT (0) FOR [Afecto]
--GO
--/****** Object:  Default [DF__RPASREL__Impuest__2DBCB4E6]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RPASREL] ADD  DEFAULT (0) FOR [Impuesto]
--GO
--/****** Object:  Default [DF__RPASREL__Afp__2EB0D91F]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RPASREL] ADD  DEFAULT (0) FOR [Afp]
--GO
--/****** Object:  Default [DF__RPASREL__Isapre__2FA4FD58]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RPASREL] ADD  DEFAULT (0) FOR [Isapre]
--GO
--/****** Object:  Default [DF__RPASREL__Ktim__30992191]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RPASREL] ADD  DEFAULT (0) FOR [Ktim]
--GO
--/****** Object:  Default [DF__RPASREL__Factor__318D45CA]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RPASREL] ADD  DEFAULT (0) FOR [Factor]
--GO
--/****** Object:  Default [DF__RPASREL__ScTafe__32816A03]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RPASREL] ADD  DEFAULT (0) FOR [ScTafe]
--GO
--/****** Object:  Default [DF__RPASREL__ScTmon__33758E3C]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RPASREL] ADD  DEFAULT (0) FOR [ScTmon]
--GO
--/****** Object:  Default [DF__RPASREL__ScEafe__3469B275]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RPASREL] ADD  DEFAULT (0) FOR [ScEafe]
--GO
--/****** Object:  Default [DF__RPASREL__ScEmon__355DD6AE]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RPASREL] ADD  DEFAULT (0) FOR [ScEmon]
--GO
--/****** Object:  Default [DF__RPASREL__ScIafe__3651FAE7]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RPASREL] ADD  DEFAULT (0) FOR [ScIafe]
--GO
--/****** Object:  Default [DF__RPASREL__ScImon__37461F20]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RPASREL] ADD  DEFAULT (0) FOR [ScImon]
--GO
--/****** Object:  Default [DF__RPASREL__Jdd__383A4359]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RPASREL] ADD  DEFAULT (0) FOR [Jdd]
--GO
--/****** Object:  Default [DF__RPASREL__Traper__392E6792]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RPASREL] ADD  DEFAULT (0) FOR [Traper]
--GO
--/****** Object:  Default [DF__RPASREL__Ktimafp__3A228BCB]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RPASREL] ADD  DEFAULT (0) FOR [Ktimafp]
--GO
--/****** Object:  Default [DF__RPASREL__sisafp__468862B0]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RPASREL] ADD  DEFAULT (0) FOR [sisafp]
--GO
/****** Object:  Default [DF__RPASIGA__Codigo__71F1E3A2]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RPASIGA] ADD  DEFAULT (' ') FOR [Codigo]
GO
/****** Object:  Default [DF__RPASIGA__Peri__72E607DB]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RPASIGA] ADD  DEFAULT (' ') FOR [Peri]
GO
/****** Object:  Default [DF__RPASIGA__Concept__73DA2C14]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RPASIGA] ADD  DEFAULT (' ') FOR [Concepto]
GO
/****** Object:  Default [DF__RPASIGA__MontoM__74CE504D]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RPASIGA] ADD  DEFAULT (0) FOR [MontoM]
GO
/****** Object:  Default [DF__RPASIGA__MontoP__75C27486]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RPASIGA] ADD  DEFAULT (0) FOR [MontoP]
GO
/****** Object:  Default [DF__RPASIGA__MontoG__76B698BF]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RPASIGA] ADD  DEFAULT (0) FOR [MontoG]
GO
/****** Object:  Default [DF__RPASIGA__Fecha_p__77AABCF8]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RPASIGA] ADD  DEFAULT (getdate()) FOR [Fecha_pag]
GO
/****** Object:  Default [DF__RPASIGA__Jdd__511BCB13]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RPASIGA] ADD  DEFAULT ((0)) FOR [Jdd]
GO
--/****** Object:  Default [DF__RPARAMS__Copar__014935CB]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RPARAMS] ADD  DEFAULT (' ') FOR [Copar]
--GO
--/****** Object:  Default [DF__RPARAMS__Descrip__023D5A04]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RPARAMS] ADD  DEFAULT (' ') FOR [Descrip]
--GO
--/****** Object:  Default [DF__RPARAMS__Param__03317E3D]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RPARAMS] ADD  DEFAULT (' ') FOR [Param]
--GO
--/****** Object:  Default [DF__RPARAMS__Ngrab__0425A276]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RPARAMS] ADD  DEFAULT (0) FOR [Ngrab]
--GO
--/****** Object:  Default [DF__rparams__Paradi__24134F1B]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RPARAMS] ADD  DEFAULT (' ') FOR [Paradi]
--GO
--/****** Object:  Default [DF__RPARAMS__Jdd__5A8F5B5D]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RPARAMS] ADD  DEFAULT ((0)) FOR [Jdd]
--GO
/****** Object:  Default [DF__RORGFUN5__Idorga__686944BF]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RORGFUN5] ADD  DEFAULT ((0)) FOR [Idorgani]
GO
/****** Object:  Default [DF__RORGFUN5__Idnodo__695D68F8]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RORGFUN5] ADD  DEFAULT ((0)) FOR [Idnodo]
GO
/****** Object:  Default [DF__RORGFUN5__Codigo__6A518D31]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RORGFUN5] ADD  DEFAULT (' ') FOR [Codigo]
GO
/****** Object:  Default [DF__RORGFUN5__Funcio__6B45B16A]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RORGFUN5] ADD  DEFAULT ((0)) FOR [Funcion]
GO
/****** Object:  Default [DF__ROrgCar5__IdOrga__2843D2B2]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[ROrgCar5] ADD  DEFAULT ((0)) FOR [IdOrgani]
GO
/****** Object:  Default [DF__ROrgCar5__IdNodo__2937F6EB]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[ROrgCar5] ADD  DEFAULT ((0)) FOR [IdNodo]
GO
/****** Object:  Default [DF__ROrgCar5__Cargo__2A2C1B24]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[ROrgCar5] ADD  DEFAULT ((0)) FOR [Cargo]
GO
/****** Object:  Default [DF__ROrgCar5__Cantid__2B203F5D]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[ROrgCar5] ADD  DEFAULT ((0)) FOR [Cantidad]
GO
/****** Object:  Default [DF__ROrgCar5__Jdd__2C146396]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[ROrgCar5] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__ROrgani5__IdOrga__180D6AE9]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[ROrgani5] ADD  DEFAULT ((0)) FOR [IdOrgani]
GO
/****** Object:  Default [DF__ROrgani5__Descri__19018F22]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[ROrgani5] ADD  DEFAULT (' ') FOR [Descrip]
GO
/****** Object:  Default [DF__ROrgani5__Fecha___19F5B35B]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[ROrgani5] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [Fecha_ini]
GO
/****** Object:  Default [DF__ROrgani5__Fecha___1AE9D794]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[ROrgani5] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [Fecha_fin]
GO
/****** Object:  Default [DF__ROrgani5__Cotab__1BDDFBCD]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[ROrgani5] ADD  DEFAULT ((0)) FOR [Cotab]
GO
/****** Object:  Default [DF__ROrgani5__Jdd__1CD22006]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[ROrgani5] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__Rorgani__Nivel__7C104AB9]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Rorgani] ADD  DEFAULT (' ') FOR [Nivel]
GO
/****** Object:  Default [DF__Rorgani__Nroniv__7D046EF2]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Rorgani] ADD  DEFAULT ((0)) FOR [Nroniv]
GO
/****** Object:  Default [DF__Rorgani__Descrip__7DF8932B]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Rorgani] ADD  DEFAULT (' ') FOR [Descrip]
GO
/****** Object:  Default [DF__Rorgani__Nivsup__7EECB764]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Rorgani] ADD  DEFAULT (' ') FOR [Nivsup]
GO
/****** Object:  Default [DF__Rorgani__Jdd__7FE0DB9D]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Rorgani] ADD  DEFAULT ((0)) FOR [Jdd]
GO
--/****** Object:  Default [DF__RNUMCHE__Empresa__4B622666]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RNUMCHE] ADD  DEFAULT (' ') FOR [Empresa]
--GO
--/****** Object:  Default [DF__RNUMCHE__Banco__4C564A9F]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RNUMCHE] ADD  DEFAULT (0) FOR [Banco]
--GO
--/****** Object:  Default [DF__RNUMCHE__Numche__4D4A6ED8]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RNUMCHE] ADD  DEFAULT (0) FOR [Numche]
--GO
--/****** Object:  Default [DF__RNUMCHE__Codigo__4E3E9311]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RNUMCHE] ADD  DEFAULT (' ') FOR [Codigo]
--GO
--/****** Object:  Default [DF__RNUMCHE__Monto__4F32B74A]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RNUMCHE] ADD  DEFAULT (0) FOR [Monto]
--GO
--/****** Object:  Default [DF__RNUMCHE__fecha__5026DB83]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RNUMCHE] ADD  DEFAULT (getdate()) FOR [fecha]
--GO
--/****** Object:  Default [DF__RNUMCHE__Jdd__511AFFBC]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RNUMCHE] ADD  DEFAULT (0) FOR [Jdd]
--GO
--/****** Object:  Default [DF__RNOTICI__Tipo__7F16D496]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RNOTICI] ADD  DEFAULT (0) FOR [Tipo]
--GO
--/****** Object:  Default [DF__RNOTICI__Codigo__000AF8CF]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RNOTICI] ADD  DEFAULT (' ') FOR [Codigo]
--GO
--/****** Object:  Default [DF__RNOTICI__Fecha_n__00FF1D08]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RNOTICI] ADD  DEFAULT (getdate()) FOR [Fecha_not]
--GO
--/****** Object:  Default [DF__RNOTICI__Detalle__01F34141]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RNOTICI] ADD  DEFAULT (' ') FOR [Detalle]
--GO
--/****** Object:  Default [DF__RNOTICI__Nro__02E7657A]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RNOTICI] ADD  DEFAULT (0) FOR [Nro]
--GO
--/****** Object:  Default [DF__RNOTICI__Jdd__03DB89B3]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RNOTICI] ADD  DEFAULT (0) FOR [Jdd]
--GO
/****** Object:  Default [DF__rnotas__Jdd__37661AB1]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[rnotas] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__rnotas__Usuario__385A3EEA]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[rnotas] ADD  DEFAULT (' ') FOR [Usuario]
GO
/****** Object:  Default [DF__rnotas__Nro__394E6323]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[rnotas] ADD  DEFAULT ((0)) FOR [Nro]
GO
/****** Object:  Default [DF__rnotas__Fecha_cr__3A42875C]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[rnotas] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [Fecha_cre]
GO
/****** Object:  Default [DF__rnotas__Descrip__3B36AB95]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[rnotas] ADD  DEFAULT (' ') FOR [Descrip]
GO
/****** Object:  Default [DF__rnotas__Fecha_ve__3C2ACFCE]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[rnotas] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [Fecha_ven]
GO
/****** Object:  Default [DF__rnotas__Tipo__3D1EF407]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[rnotas] ADD  DEFAULT (' ') FOR [Tipo]
GO
/****** Object:  Default [DF__rnotas__Detalle__3E131840]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[rnotas] ADD  DEFAULT (' ') FOR [Detalle]
GO
/****** Object:  Default [DF__rnotas__FechaEnv__3F073C79]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[rnotas] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [FechaEnvio]
GO
/****** Object:  Default [DF__rnotas__EnviaSMS__3FFB60B2]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[rnotas] ADD  DEFAULT (' ') FOR [EnviaSMS]
GO
/****** Object:  Default [DF__rnotas__EnviaMai__40EF84EB]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[rnotas] ADD  DEFAULT (' ') FOR [EnviaMail]
GO
/****** Object:  Default [DF__rnotas__Visto__56D4A469]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[rnotas] ADD  DEFAULT ('N') FOR [Visto]
GO
/****** Object:  Default [DF__RnominaE__Jdd__2A0C1F93]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RnominaE] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__RnominaE__Nomina__2B0043CC]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RnominaE] ADD  DEFAULT ((0)) FOR [Nomina]
GO
/****** Object:  Default [DF__RnominaE__Fecha___2BF46805]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RnominaE] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [Fecha_ing]
GO
/****** Object:  Default [DF__RnominaE__Ames__2CE88C3E]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RnominaE] ADD  DEFAULT (' ') FOR [Ames]
GO
/****** Object:  Default [DF__RnominaE__Peri__2DDCB077]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RnominaE] ADD  DEFAULT (' ') FOR [Peri]
GO
/****** Object:  Default [DF__RnominaE__Ingres__2ED0D4B0]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RnominaE] ADD  DEFAULT (' ') FOR [Ingreso]
GO
/****** Object:  Default [DF__RnominaE__Revisa__2FC4F8E9]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RnominaE] ADD  DEFAULT (' ') FOR [Revisa]
GO
/****** Object:  Default [DF__RnominaE__Aprueb__30B91D22]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RnominaE] ADD  DEFAULT (' ') FOR [Aprueba]
GO
/****** Object:  Default [DF__RnominaE__Fecha___31AD415B]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RnominaE] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [Fecha_apr]
GO
/****** Object:  Default [DF__RnominaE__Descri__32A16594]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RnominaE] ADD  DEFAULT (' ') FOR [Descrip]
GO
/****** Object:  Default [DF__RnominaE__Estado__339589CD]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RnominaE] ADD  DEFAULT (' ') FOR [Estado]
GO
/****** Object:  Default [DF__RnominaE__Motivo__3489AE06]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RnominaE] ADD  DEFAULT (' ') FOR [Motivor]
GO
/****** Object:  Default [DF__RnominaD__Jdd__2082B559]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RnominaD] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__RnominaD__Nomina__2176D992]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RnominaD] ADD  DEFAULT ((0)) FOR [Nomina]
GO
/****** Object:  Default [DF__RnominaD__Linea__226AFDCB]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RnominaD] ADD  DEFAULT ((0)) FOR [Linea]
GO
/****** Object:  Default [DF__RnominaD__codigo__235F2204]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RnominaD] ADD  DEFAULT (' ') FOR [codigo]
GO
/****** Object:  Default [DF__RnominaD__Id__2453463D]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RnominaD] ADD  DEFAULT ((0)) FOR [Id]
GO
/****** Object:  Default [DF__RnominaD__Cohade__25476A76]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RnominaD] ADD  DEFAULT (' ') FOR [Cohade]
GO
/****** Object:  Default [DF__RnominaD__Monto__263B8EAF]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RnominaD] ADD  DEFAULT ((0)) FOR [Monto]
GO
/****** Object:  Default [DF__RnominaD__Cuotas__272FB2E8]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RnominaD] ADD  DEFAULT ((0)) FOR [Cuotas]
GO
/****** Object:  Default [DF__Rmsm__usuario__5768D5EF]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Rmsm] ADD  DEFAULT (' ') FOR [usuario]
GO
/****** Object:  Default [DF__Rmsm__id__585CFA28]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Rmsm] ADD  DEFAULT (' ') FOR [id]
GO
/****** Object:  Default [DF__Rmsm__message__59511E61]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Rmsm] ADD  DEFAULT (' ') FOR [message]
GO
/****** Object:  Default [DF__Rmsm__source__5A45429A]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Rmsm] ADD  DEFAULT (' ') FOR [source]
GO
/****** Object:  Default [DF__Rmsm__Fecha__5B3966D3]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Rmsm] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [Fecha]
GO
/****** Object:  Default [DF__Rmsm__number__5C2D8B0C]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Rmsm] ADD  DEFAULT (' ') FOR [number]
GO
/****** Object:  Default [DF__Rmsm__Jdd__5D21AF45]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Rmsm] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__RmodulosI__Jdd__457F2FDE]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RmodulosI] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__RmodulosI__Id__46735417]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RmodulosI] ADD  DEFAULT (' ') FOR [Id]
GO
/****** Object:  Default [DF__RmodulosI__Descr__47677850]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RmodulosI] ADD  DEFAULT (' ') FOR [Descrip]
GO
/****** Object:  Default [DF__RmodulosI__Clasi__485B9C89]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RmodulosI] ADD  DEFAULT ((0)) FOR [Clasif]
GO
/****** Object:  Default [DF__RmodulosI__Campo__494FC0C2]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RmodulosI] ADD  DEFAULT (' ') FOR [Campos]
GO
/****** Object:  Default [DF__RmodulosI__Total__4A43E4FB]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RmodulosI] ADD  DEFAULT (' ') FOR [Totales]
GO
/****** Object:  Default [DF__RmodulosI__Tabla__4B380934]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RmodulosI] ADD  DEFAULT (' ') FOR [Tablas]
GO
/****** Object:  Default [DF__RmodulosI__Filtr__4C2C2D6D]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RmodulosI] ADD  DEFAULT (' ') FOR [Filtro]
GO
/****** Object:  Default [DF__RmodulosI__Orden__4D2051A6]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RmodulosI] ADD  DEFAULT (' ') FOR [Orden]
GO
/****** Object:  Default [DF__RmodulosI__Agrup__4E1475DF]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RmodulosI] ADD  DEFAULT (' ') FOR [Agrupa]
GO
/****** Object:  Default [DF__RmodulosI__Peri__4F089A18]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RmodulosI] ADD  DEFAULT (' ') FOR [Peri]
GO
/****** Object:  Default [DF__RmodulosI__Dueno__4FFCBE51]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RmodulosI] ADD  DEFAULT (' ') FOR [Dueno]
GO
/****** Object:  Default [DF__RmodulosI__Grupo__50F0E28A]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RmodulosI] ADD  DEFAULT (' ') FOR [Grupos]
GO
/****** Object:  Default [DF__RmodulosI__fecha__51E506C3]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RmodulosI] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [fecha_cre]
GO
/****** Object:  Default [DF__Rmodulos5__IDMod__780AAFAB]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Rmodulos5] ADD  DEFAULT (' ') FOR [IDModulo]
GO
/****** Object:  Default [DF__Rmodulos5__Descr__78FED3E4]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Rmodulos5] ADD  DEFAULT (' ') FOR [Descrip]
GO
/****** Object:  Default [DF__Rmodulos5__Clasi__79F2F81D]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Rmodulos5] ADD  DEFAULT ((0)) FOR [Clasif]
GO
/****** Object:  Default [DF__Rmodulos5__Campo__7AE71C56]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Rmodulos5] ADD  DEFAULT (' ') FOR [Campos]
GO
/****** Object:  Default [DF__Rmodulos5__Desde__7BDB408F]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Rmodulos5] ADD  DEFAULT (' ') FOR [Desde]
GO
/****** Object:  Default [DF__Rmodulos5__Filtr__7CCF64C8]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Rmodulos5] ADD  DEFAULT (' ') FOR [Filtro]
GO
/****** Object:  Default [DF__Rmodulos5__Agrup__7DC38901]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Rmodulos5] ADD  DEFAULT (' ') FOR [Agrupa]
GO
/****** Object:  Default [DF__Rmodulos5__Orden__7EB7AD3A]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Rmodulos5] ADD  DEFAULT (' ') FOR [Orden]
GO
/****** Object:  Default [DF__Rmodulos5__Tippe__7FABD173]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Rmodulos5] ADD  DEFAULT ((0)) FOR [Tipper]
GO
/****** Object:  Default [DF__Rmodulos5__Cohad__009FF5AC]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Rmodulos5] ADD  DEFAULT (' ') FOR [Cohades]
GO
/****** Object:  Default [DF__Rmodulos5__Indir__019419E5]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Rmodulos5] ADD  DEFAULT ((0)) FOR [Indir]
GO
/****** Object:  Default [DF__Rmodulos5__Grupo__02883E1E]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Rmodulos5] ADD  DEFAULT (' ') FOR [Grupos]
GO
/****** Object:  Default [DF__Rmodulos5__SQL__037C6257]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Rmodulos5] ADD  DEFAULT (' ') FOR [SQL]
GO
/****** Object:  Default [DF__Rmodulos5__Swher__04708690]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Rmodulos5] ADD  DEFAULT (' ') FOR [Swhere]
GO
/****** Object:  Default [DF__Rmodulos5__SQLDi__0564AAC9]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Rmodulos5] ADD  DEFAULT (' ') FOR [SQLDirecto]
GO
/****** Object:  Default [DF__Rmodulos5__FSQLD__0658CF02]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Rmodulos5] ADD  DEFAULT ((0)) FOR [FSQLDirect]
GO
/****** Object:  Default [DF__Rmodulos5__Nperi__074CF33B]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Rmodulos5] ADD  DEFAULT ((0)) FOR [Nperiodo]
GO
/****** Object:  Default [DF__Rmodulos5__varis__08411774]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Rmodulos5] ADD  DEFAULT (' ') FOR [varis]
GO
/****** Object:  Default [DF__Rmodulos5__ORDER__09353BAD]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Rmodulos5] ADD  DEFAULT (' ') FOR [ORDERBY]
GO
/****** Object:  Default [DF__Rmodulos5__Dueno__0A295FE6]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Rmodulos5] ADD  DEFAULT (' ') FOR [Dueno]
GO
/****** Object:  Default [DF__Rmodulos5__Jdd__0B1D841F]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Rmodulos5] ADD  DEFAULT ((0)) FOR [Jdd]
GO
--/****** Object:  Default [DF__RMODULOS__Modulo__0539C240]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RMODULOS] ADD  DEFAULT (' ') FOR [Modulo]
--GO
--/****** Object:  Default [DF__RMODULOS__Descri__062DE679]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RMODULOS] ADD  DEFAULT (' ') FOR [Descrip]
--GO
--/****** Object:  Default [DF__RMODULOS__Clasif__07220AB2]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RMODULOS] ADD  DEFAULT (0) FOR [Clasif]
--GO
--/****** Object:  Default [DF__RMODULOS__Campos__08162EEB]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RMODULOS] ADD  DEFAULT (' ') FOR [Campos]
--GO
--/****** Object:  Default [DF__RMODULOS__Desde__090A5324]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RMODULOS] ADD  DEFAULT (' ') FOR [Desde]
--GO
--/****** Object:  Default [DF__RMODULOS__Filtro__09FE775D]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RMODULOS] ADD  DEFAULT (' ') FOR [Filtro]
--GO
--/****** Object:  Default [DF__RMODULOS__Agrupa__0AF29B96]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RMODULOS] ADD  DEFAULT (' ') FOR [Agrupa]
--GO
--/****** Object:  Default [DF__RMODULOS__Orden__0BE6BFCF]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RMODULOS] ADD  DEFAULT (' ') FOR [Orden]
--GO
--/****** Object:  Default [DF__RMODULOS__Tipper__0CDAE408]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RMODULOS] ADD  DEFAULT (0) FOR [Tipper]
--GO
--/****** Object:  Default [DF__RMODULOS__Cohade__0DCF0841]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RMODULOS] ADD  DEFAULT (' ') FOR [Cohades]
--GO
--/****** Object:  Default [DF__RMODULOS__Indir__0EC32C7A]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RMODULOS] ADD  DEFAULT (0) FOR [Indir]
--GO
--/****** Object:  Default [DF__RMODULOS__Grupos__0FB750B3]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RMODULOS] ADD  DEFAULT (' ') FOR [Grupos]
--GO
--/****** Object:  Default [DF__RMODULOS__Direct__10AB74EC]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RMODULOS] ADD  DEFAULT (' ') FOR [Directa]
--GO
--/****** Object:  Default [DF__RMODULOS__Swhere__119F9925]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RMODULOS] ADD  DEFAULT (' ') FOR [Swhere]
--GO
--/****** Object:  Default [DF__RMODULOS__Nperio__1293BD5E]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RMODULOS] ADD  DEFAULT (0) FOR [Nperiodo]
--GO
--/****** Object:  Default [DF__RMODULOS__varis__1387E197]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RMODULOS] ADD  DEFAULT (' ') FOR [varis]
--GO
--/****** Object:  Default [DF__RMODULOS__Jdd__147C05D0]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RMODULOS] ADD  DEFAULT (0) FOR [Jdd]
--GO
--/****** Object:  Default [DF__RMODULOS__dueno__3FBB6990]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RMODULOS] ADD  DEFAULT (' ') FOR [dueno]
--GO
/****** Object:  Default [DF__RModRepOp__CodTa__5FFE1BF0]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RModRepOp] ADD  DEFAULT ((0)) FOR [CodTab80]
GO
/****** Object:  Default [DF__RModRepOp__CodTa__60F24029]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RModRepOp] ADD  DEFAULT ((0)) FOR [CodTab81]
GO
/****** Object:  Default [DF__RModRepOp__id__61E66462]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RModRepOp] ADD  DEFAULT ((0)) FOR [id]
GO
/****** Object:  Default [DF__RModRepOp__Jdd__62DA889B]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RModRepOp] ADD  DEFAULT ((0)) FOR [Jdd]
GO
--/****** Object:  Default [DF__RMODIFICAS__Id__6A3BB341]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RMODIFICAS] ADD  DEFAULT (0) FOR [Id]
--GO
--/****** Object:  Default [DF__RMODIFICA__Fecha__6B2FD77A]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RMODIFICAS] ADD  DEFAULT (getdate()) FOR [Fecha]
--GO
--/****** Object:  Default [DF__RMODIFICA__Conce__6C23FBB3]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RMODIFICAS] ADD  DEFAULT (' ') FOR [Concepto]
--GO
--/****** Object:  Default [DF__RMODIFICA__Codig__6D181FEC]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RMODIFICAS] ADD  DEFAULT (' ') FOR [CodigoC]
--GO
--/****** Object:  Default [DF__RMODIFICAS__Acc__6E0C4425]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RMODIFICAS] ADD  DEFAULT (' ') FOR [Acc]
--GO
--/****** Object:  Default [DF__RMODIFICA__Codig__6F00685E]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RMODIFICAS] ADD  DEFAULT (' ') FOR [Codigo]
--GO
--/****** Object:  Default [DF__RMODIFICAS__Deta__6FF48C97]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RMODIFICAS] ADD  DEFAULT (' ') FOR [Deta]
--GO
--/****** Object:  Default [DF__RMODIFICA__Usuar__70E8B0D0]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RMODIFICAS] ADD  DEFAULT (' ') FOR [Usuario]
--GO
--/****** Object:  Default [DF__RMODIFICA__Wcomp__71DCD509]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RMODIFICAS] ADD  DEFAULT (' ') FOR [Wcompu]
--GO
--/****** Object:  Default [DF__RMODIFICAS__Jdd__72D0F942]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RMODIFICAS] ADD  DEFAULT (0) FOR [Jdd]
--GO
/****** Object:  Default [DF__RModgest__IDModu__1D3C345A]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RModgest] ADD  DEFAULT (' ') FOR [IDModulo]
GO
/****** Object:  Default [DF__RModgest__Descri__1E305893]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RModgest] ADD  DEFAULT (' ') FOR [Descrip]
GO
/****** Object:  Default [DF__RModgest__Clasif__1F247CCC]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RModgest] ADD  DEFAULT ((0)) FOR [Clasif]
GO
/****** Object:  Default [DF__RModgest__Planti__2018A105]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RModgest] ADD  DEFAULT ((0)) FOR [Plantilla]
GO
/****** Object:  Default [DF__RModgest__Fecha___210CC53E]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RModgest] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [Fecha_cre]
GO
/****** Object:  Default [DF__RModgest__idCubo__2200E977]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RModgest] ADD  DEFAULT (' ') FOR [idCubo]
GO
/****** Object:  Default [DF__RModgest__Seteo__22F50DB0]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RModgest] ADD  DEFAULT (' ') FOR [Seteo]
GO
/****** Object:  Default [DF__RModgest__Dueno__23E931E9]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RModgest] ADD  DEFAULT (' ') FOR [Dueno]
GO
/****** Object:  Default [DF__RModgest__Jdd__24DD5622]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RModgest] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__Rmodesp__IDmodes__0DF9F0CA]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Rmodesp] ADD  DEFAULT (' ') FOR [IDmodesp]
GO
/****** Object:  Default [DF__Rmodesp__Descrip__0EEE1503]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Rmodesp] ADD  DEFAULT (' ') FOR [Descrip]
GO
/****** Object:  Default [DF__Rmodesp__Fecha__0FE2393C]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Rmodesp] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [Fecha]
GO
/****** Object:  Default [DF__Rmodesp__Usuario__10D65D75]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Rmodesp] ADD  DEFAULT (' ') FOR [Usuario]
GO
/****** Object:  Default [DF__Rmodesp__Definic__11CA81AE]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Rmodesp] ADD  DEFAULT (' ') FOR [Definicion]
GO
/****** Object:  Default [DF__Rmodesp__Jdd__12BEA5E7]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Rmodesp] ADD  DEFAULT ((0)) FOR [Jdd]
GO
--/****** Object:  Default [DF__RMAPITMH__Codigo__6F6A7CB2]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RMAPITMH] ADD  DEFAULT (' ') FOR [Codigo]
--GO
--/****** Object:  Default [DF__RMAPITMH__Cohade__705EA0EB]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RMAPITMH] ADD  DEFAULT (' ') FOR [Cohade]
--GO
--/****** Object:  Default [DF__RMAPITMH__Nro__7152C524]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RMAPITMH] ADD  DEFAULT (0) FOR [Nro]
--GO
--/****** Object:  Default [DF__RMAPITMH__Tipo__7246E95D]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RMAPITMH] ADD  DEFAULT (0) FOR [Tipo]
--GO
--/****** Object:  Default [DF__RMAPITMH__Orden__733B0D96]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RMAPITMH] ADD  DEFAULT (0) FOR [Orden]
--GO
--/****** Object:  Default [DF__RMAPITMH__Period__742F31CF]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RMAPITMH] ADD  DEFAULT (' ') FOR [Periodo]
--GO
--/****** Object:  Default [DF__RMAPITMH__COFORM__75235608]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RMAPITMH] ADD  DEFAULT (' ') FOR [COFORM]
--GO
--/****** Object:  Default [DF__RMAPITMH__CUOTOT__76177A41]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RMAPITMH] ADD  DEFAULT (0) FOR [CUOTOT]
--GO
--/****** Object:  Default [DF__RMAPITMH__CUOPAR__770B9E7A]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RMAPITMH] ADD  DEFAULT (0) FOR [CUOPAR]
--GO
--/****** Object:  Default [DF__RMAPITMH__Monto__77FFC2B3]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RMAPITMH] ADD  DEFAULT (0) FOR [Monto]
--GO
--/****** Object:  Default [DF__RMAPITMH__Fecha___78F3E6EC]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RMAPITMH] ADD  DEFAULT (getdate()) FOR [Fecha_cre]
--GO
--/****** Object:  Default [DF__RMAPITMH__Fecha___79E80B25]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RMAPITMH] ADD  DEFAULT (getdate()) FOR [Fecha_ini]
--GO
--/****** Object:  Default [DF__RMAPITMH__Fecha___7ADC2F5E]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RMAPITMH] ADD  DEFAULT (getdate()) FOR [Fecha_fin]
--GO
--/****** Object:  Default [DF__RMAPITMH__Cencos__7BD05397]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RMAPITMH] ADD  DEFAULT (0) FOR [Cencos]
--GO
--/****** Object:  Default [DF__RMAPITMH__Cuenta__7CC477D0]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RMAPITMH] ADD  DEFAULT (' ') FOR [Cuenta]
--GO
--/****** Object:  Default [DF__RMAPITMH__Ticen__7DB89C09]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RMAPITMH] ADD  DEFAULT (' ') FOR [Ticen]
--GO
--/****** Object:  Default [DF__RMAPITMH__Fepro__7EACC042]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RMAPITMH] ADD  DEFAULT (getdate()) FOR [Fepro]
--GO
--/****** Object:  Default [DF__RMAPITMH__Codpre__7FA0E47B]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RMAPITMH] ADD  DEFAULT (0) FOR [Codpres]
--GO
--/****** Object:  Default [DF__RMAPITMH__Obs__009508B4]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RMAPITMH] ADD  DEFAULT (' ') FOR [Obs]
--GO
--/****** Object:  Default [DF__RMAPITMH__Formul__01892CED]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RMAPITMH] ADD  DEFAULT (' ') FOR [Formula]
--GO
--/****** Object:  Default [DF__RMAPITMH__Proced__027D5126]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RMAPITMH] ADD  DEFAULT (' ') FOR [Procede]
--GO
--/****** Object:  Default [DF__RMAPITMH__Estado__0371755F]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RMAPITMH] ADD  DEFAULT (' ') FOR [Estado]
--GO
--/****** Object:  Default [DF__RMAPITMH__Coinst__04659998]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RMAPITMH] ADD  DEFAULT (0) FOR [Coinst]
--GO
--/****** Object:  Default [DF__RMAPITMH__PerImp__0559BDD1]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RMAPITMH] ADD  DEFAULT (0) FOR [PerImp]
--GO
--/****** Object:  Default [DF__RMAPITMH__Pone__064DE20A]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RMAPITMH] ADD  DEFAULT (' ') FOR [Pone]
--GO
--/****** Object:  Default [DF__RMAPITMH__Acumu__07420643]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RMAPITMH] ADD  DEFAULT (0) FOR [Acumu]
--GO
--/****** Object:  Default [DF__RMAPITMH__Tiacu__08362A7C]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RMAPITMH] ADD  DEFAULT (' ') FOR [Tiacu]
--GO
--/****** Object:  Default [DF__RMAPITMH__MontoC__092A4EB5]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RMAPITMH] ADD  DEFAULT (0) FOR [MontoC]
--GO
--/****** Object:  Default [DF__RMAPITMH__MontoP__0A1E72EE]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RMAPITMH] ADD  DEFAULT (0) FOR [MontoP]
--GO
--/****** Object:  Default [DF__RMAPITMH__Propor__0B129727]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RMAPITMH] ADD  DEFAULT (' ') FOR [Propor]
--GO
--/****** Object:  Default [DF__RMAPITMH__Grupo__0C06BB60]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RMAPITMH] ADD  DEFAULT (0) FOR [Grupo]
--GO
--/****** Object:  Default [DF__RMAPITMH__Simes__0CFADF99]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RMAPITMH] ADD  DEFAULT (' ') FOR [Simes]
--GO
--/****** Object:  Default [DF__RMAPITMH__Queper__0DEF03D2]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RMAPITMH] ADD  DEFAULT (' ') FOR [Queperi]
--GO
--/****** Object:  Default [DF__RMAPITMH__Fecha___0EE3280B]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RMAPITMH] ADD  DEFAULT (getdate()) FOR [Fecha_ing]
--GO
--/****** Object:  Default [DF__RMAPITMH__Fecha___0FD74C44]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RMAPITMH] ADD  DEFAULT (getdate()) FOR [Fecha_apr]
--GO
--/****** Object:  Default [DF__RMAPITMH__Codigo__10CB707D]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RMAPITMH] ADD  DEFAULT (' ') FOR [Codigo_in]
--GO
--/****** Object:  Default [DF__RMAPITMH__Codigo__11BF94B6]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RMAPITMH] ADD  DEFAULT (' ') FOR [Codigo_ap]
--GO
--/****** Object:  Default [DF__RMAPITMH__Planti__12B3B8EF]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RMAPITMH] ADD  DEFAULT (' ') FOR [Plantilla]
--GO
--/****** Object:  Default [DF__RMAPITMH__Ames__13A7DD28]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RMAPITMH] ADD  DEFAULT (' ') FOR [Ames]
--GO
--/****** Object:  Default [DF__RMAPITMH__Jdd__149C0161]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RMAPITMH] ADD  DEFAULT (0) FOR [Jdd]
--GO
--/****** Object:  Default [DF__RMAPITMH__Fecha___587208C1]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RMAPITMH] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(120)),(120))) FOR [Fecha_ult]
--GO
--/****** Object:  Default [DF__RMAPITMH__Moti_m__59662CFA]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RMAPITMH] ADD  DEFAULT ((0)) FOR [Moti_mod]
--GO
--/****** Object:  Default [DF__RMAPITMH__Condi__5A5A5133]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RMAPITMH] ADD  DEFAULT (' ') FOR [Condi]
--GO
--/****** Object:  Default [DF__RMAPITM__Codigo__18B6AB08]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RMAPITM] ADD  DEFAULT (' ') FOR [Codigo]
--GO
--/****** Object:  Default [DF__RMAPITM__Cohade__19AACF41]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RMAPITM] ADD  DEFAULT (' ') FOR [Cohade]
--GO
--/****** Object:  Default [DF__RMAPITM__Nro__1A9EF37A]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RMAPITM] ADD  DEFAULT (0) FOR [Nro]
--GO
--/****** Object:  Default [DF__RMAPITM__Tipo__1B9317B3]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RMAPITM] ADD  DEFAULT (0) FOR [Tipo]
--GO
--/****** Object:  Default [DF__RMAPITM__Orden__1C873BEC]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RMAPITM] ADD  DEFAULT (0) FOR [Orden]
--GO
--/****** Object:  Default [DF__RMAPITM__Periodo__1D7B6025]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RMAPITM] ADD  DEFAULT (' ') FOR [Periodo]
--GO
--/****** Object:  Default [DF__RMAPITM__COFORM__1E6F845E]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RMAPITM] ADD  DEFAULT (' ') FOR [COFORM]
--GO
--/****** Object:  Default [DF__RMAPITM__CUOTOT__1F63A897]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RMAPITM] ADD  DEFAULT (0) FOR [CUOTOT]
--GO
--/****** Object:  Default [DF__RMAPITM__CUOPAR__2057CCD0]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RMAPITM] ADD  DEFAULT (0) FOR [CUOPAR]
--GO
--/****** Object:  Default [DF__RMAPITM__Monto__214BF109]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RMAPITM] ADD  DEFAULT (0) FOR [Monto]
--GO
--/****** Object:  Default [DF__RMAPITM__Fecha_c__22401542]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RMAPITM] ADD  DEFAULT (getdate()) FOR [Fecha_cre]
--GO
--/****** Object:  Default [DF__RMAPITM__Fecha_i__2334397B]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RMAPITM] ADD  DEFAULT (getdate()) FOR [Fecha_ini]
--GO
--/****** Object:  Default [DF__RMAPITM__Fecha_f__24285DB4]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RMAPITM] ADD  DEFAULT (getdate()) FOR [Fecha_fin]
--GO
--/****** Object:  Default [DF__RMAPITM__Cencos__251C81ED]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RMAPITM] ADD  DEFAULT (0) FOR [Cencos]
--GO
--/****** Object:  Default [DF__RMAPITM__Cuenta__2610A626]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RMAPITM] ADD  DEFAULT (' ') FOR [Cuenta]
--GO
--/****** Object:  Default [DF__RMAPITM__Ticen__2704CA5F]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RMAPITM] ADD  DEFAULT (' ') FOR [Ticen]
--GO
--/****** Object:  Default [DF__RMAPITM__Fepro__27F8EE98]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RMAPITM] ADD  DEFAULT (getdate()) FOR [Fepro]
--GO
--/****** Object:  Default [DF__RMAPITM__Codpres__28ED12D1]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RMAPITM] ADD  DEFAULT (0) FOR [Codpres]
--GO
--/****** Object:  Default [DF__RMAPITM__Obs__29E1370A]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RMAPITM] ADD  DEFAULT (' ') FOR [Obs]
--GO
--/****** Object:  Default [DF__RMAPITM__Formula__2AD55B43]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RMAPITM] ADD  DEFAULT (' ') FOR [Formula]
--GO
--/****** Object:  Default [DF__RMAPITM__Procede__2BC97F7C]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RMAPITM] ADD  DEFAULT (' ') FOR [Procede]
--GO
--/****** Object:  Default [DF__RMAPITM__Estado__2CBDA3B5]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RMAPITM] ADD  DEFAULT (' ') FOR [Estado]
--GO
--/****** Object:  Default [DF__RMAPITM__Coinst__2DB1C7EE]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RMAPITM] ADD  DEFAULT (0) FOR [Coinst]
--GO
--/****** Object:  Default [DF__RMAPITM__PerImp__2EA5EC27]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RMAPITM] ADD  DEFAULT (0) FOR [PerImp]
--GO
--/****** Object:  Default [DF__RMAPITM__Pone__2F9A1060]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RMAPITM] ADD  DEFAULT (' ') FOR [Pone]
--GO
--/****** Object:  Default [DF__RMAPITM__Acumu__308E3499]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RMAPITM] ADD  DEFAULT (0) FOR [Acumu]
--GO
--/****** Object:  Default [DF__RMAPITM__Tiacu__318258D2]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RMAPITM] ADD  DEFAULT (' ') FOR [Tiacu]
--GO
--/****** Object:  Default [DF__RMAPITM__MontoC__32767D0B]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RMAPITM] ADD  DEFAULT (0) FOR [MontoC]
--GO
--/****** Object:  Default [DF__RMAPITM__MontoP__336AA144]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RMAPITM] ADD  DEFAULT (0) FOR [MontoP]
--GO
--/****** Object:  Default [DF__RMAPITM__Propor__345EC57D]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RMAPITM] ADD  DEFAULT (' ') FOR [Propor]
--GO
--/****** Object:  Default [DF__RMAPITM__Grupo__3552E9B6]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RMAPITM] ADD  DEFAULT (0) FOR [Grupo]
--GO
--/****** Object:  Default [DF__RMAPITM__Condi__36470DEF]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RMAPITM] ADD  DEFAULT (' ') FOR [Condi]
--GO
--/****** Object:  Default [DF__RMAPITM__Simes__373B3228]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RMAPITM] ADD  DEFAULT (' ') FOR [Simes]
--GO
--/****** Object:  Default [DF__RMAPITM__Queperi__382F5661]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RMAPITM] ADD  DEFAULT (' ') FOR [Queperi]
--GO
--/****** Object:  Default [DF__RMAPITM__Jdd__39237A9A]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RMAPITM] ADD  DEFAULT (0) FOR [Jdd]
--GO
--/****** Object:  Default [DF__RMAPITM__Fecha_i__688874F9]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RMAPITM] ADD  DEFAULT (' ') FOR [Fecha_ing]
--GO
--/****** Object:  Default [DF__RMAPITM__Fecha_a__697C9932]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RMAPITM] ADD  DEFAULT (' ') FOR [Fecha_apr]
--GO
--/****** Object:  Default [DF__RMAPITM__Codigo___6A70BD6B]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RMAPITM] ADD  DEFAULT (' ') FOR [Codigo_in]
--GO
--/****** Object:  Default [DF__RMAPITM__Codigo___6B64E1A4]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RMAPITM] ADD  DEFAULT (' ') FOR [Codigo_ap]
--GO
--/****** Object:  Default [DF__RMAPITM__Plantil__6C5905DD]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RMAPITM] ADD  DEFAULT (' ') FOR [Plantilla]
--GO
--/****** Object:  Default [DF__RMAPITM__Ames__6D4D2A16]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RMAPITM] ADD  DEFAULT (' ') FOR [Ames]
--GO
--/****** Object:  Default [DF__RMAPITM__Fecha_u__5689C04F]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RMAPITM] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(120)),(120))) FOR [Fecha_ult]
--GO
--/****** Object:  Default [DF__RMAPITM__Moti_mo__577DE488]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RMAPITM] ADD  DEFAULT ((0)) FOR [Moti_mod]
--GO
/****** Object:  Default [DF__RLotes__Ames__2BBF5DDB]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RLotes] ADD  DEFAULT (' ') FOR [Ames]
GO
/****** Object:  Default [DF__RLotes__Peri__2CB38214]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RLotes] ADD  DEFAULT (' ') FOR [Peri]
GO
/****** Object:  Default [DF__RLotes__Fecha_cr__2DA7A64D]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RLotes] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [Fecha_cre]
GO
/****** Object:  Default [DF__RLotes__Usu_cre__2E9BCA86]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RLotes] ADD  DEFAULT (' ') FOR [Usu_cre]
GO
/****** Object:  Default [DF__RLotes__Obs_cre__2F8FEEBF]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RLotes] ADD  DEFAULT (' ') FOR [Obs_cre]
GO
/****** Object:  Default [DF__RLotes__Total_em__308412F8]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RLotes] ADD  DEFAULT ((0)) FOR [Total_emp]
GO
/****** Object:  Default [DF__RLotes__Fecha_ac__31783731]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RLotes] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [Fecha_acr]
GO
/****** Object:  Default [DF__RLotes__Fecha_pa__326C5B6A]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RLotes] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [Fecha_pag]
GO
/****** Object:  Default [DF__RLotes__Estado__33607FA3]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RLotes] ADD  DEFAULT ((0)) FOR [Estado]
GO
/****** Object:  Default [DF__RLotes__Fecha_mo__3454A3DC]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RLotes] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [Fecha_mod]
GO
/****** Object:  Default [DF__RLotes__Usu_mod__3548C815]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RLotes] ADD  DEFAULT (' ') FOR [Usu_mod]
GO
/****** Object:  Default [DF__RLotes__Obs_mod__363CEC4E]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RLotes] ADD  DEFAULT (' ') FOR [Obs_mod]
GO
/****** Object:  Default [DF__RLotes__Jdd__37311087]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RLotes] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__Rlogval__Jdd__7D1A48E2]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Rlogval] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__Rlogval__Proced__7E0E6D1B]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Rlogval] ADD  DEFAULT (' ') FOR [Proced]
GO
/****** Object:  Default [DF__Rlogval__Codigo__7F029154]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Rlogval] ADD  DEFAULT (' ') FOR [Codigo]
GO
/****** Object:  Default [DF__Rlogval__Tipo__7FF6B58D]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Rlogval] ADD  DEFAULT (' ') FOR [Tipo]
GO
/****** Object:  Default [DF__Rlogval__Mens_Er__00EAD9C6]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Rlogval] ADD  DEFAULT (' ') FOR [Mens_Error]
GO
/****** Object:  Default [DF__Rlogval__Fecha__01DEFDFF]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Rlogval] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [Fecha]
GO
/****** Object:  Default [DF__Rlogval__Usuario__02D32238]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Rlogval] ADD  DEFAULT (' ') FOR [Usuario]
GO
/****** Object:  Default [DF__Rlogval__Lote__03C74671]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Rlogval] ADD  DEFAULT (' ') FOR [Lote]
GO
/****** Object:  Default [DF__RlogMP__Fecha__361DBC14]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RlogMP] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [Fecha]
GO
/****** Object:  Default [DF__RlogMP__Jdatos__3711E04D]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RlogMP] ADD  DEFAULT (' ') FOR [Jdatos]
GO
/****** Object:  Default [DF__RlogMP__Servidor__38060486]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RlogMP] ADD  DEFAULT (' ') FOR [Servidor]
GO
/****** Object:  Default [DF__RlogMP__Base__38FA28BF]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RlogMP] ADD  DEFAULT (' ') FOR [Base]
GO
/****** Object:  Default [DF__RlogMP__UserPay__39EE4CF8]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RlogMP] ADD  DEFAULT (' ') FOR [UserPay]
GO
/****** Object:  Default [DF__RlogMP__UserWin__3AE27131]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RlogMP] ADD  DEFAULT (' ') FOR [UserWin]
GO
/****** Object:  Default [DF__RlogMP__Proced__3BD6956A]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RlogMP] ADD  DEFAULT (' ') FOR [Proced]
GO
/****** Object:  Default [DF__RlogMP__Ruta__3CCAB9A3]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RlogMP] ADD  DEFAULT (' ') FOR [Ruta]
GO
/****** Object:  Default [DF__RlogMP__Estado__3DBEDDDC]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RlogMP] ADD  DEFAULT (' ') FOR [Estado]
GO
/****** Object:  Default [DF__RlogMP__Jdd__3EB30215]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RlogMP] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__RlogClient__Tipo__0347582D]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RlogCliente] ADD  DEFAULT (' ') FOR [Tipo]
GO
/****** Object:  Default [DF__RlogClien__Desci__043B7C66]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RlogCliente] ADD  DEFAULT (' ') FOR [Descip]
GO
/****** Object:  Default [DF__RlogClien__Clien__052FA09F]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RlogCliente] ADD  DEFAULT (' ') FOR [Cliente]
GO
/****** Object:  Default [DF__RlogClien__Nombr__0623C4D8]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RlogCliente] ADD  DEFAULT (' ') FOR [NombreBase]
GO
/****** Object:  Default [DF__RlogClien__Fecha__0717E911]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RlogCliente] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [Fecha]
GO
/****** Object:  Default [DF__RlogAlertas__Jdd__1D072A30]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RlogAlertas] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__RlogAlertas__Nro__1DFB4E69]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RlogAlertas] ADD  DEFAULT ((0)) FOR [Nro]
GO
/****** Object:  Default [DF__RlogAlert__Detal__1EEF72A2]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RlogAlertas] ADD  DEFAULT (' ') FOR [Detalle]
GO
/****** Object:  Default [DF__RlogAlert__Estad__1FE396DB]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RlogAlertas] ADD  DEFAULT (' ') FOR [Estado]
GO
/****** Object:  Default [DF__RlogAlert__Usuar__20D7BB14]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RlogAlertas] ADD  DEFAULT (' ') FOR [Usuario]
GO
/****** Object:  Default [DF__RlogAlert__Fecha__21CBDF4D]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RlogAlertas] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [Fecha]
GO
/****** Object:  Default [DF__Rlog__Jdd__160526E6]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Rlog] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__Rlog__Proced__16F94B1F]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Rlog] ADD  DEFAULT (' ') FOR [Proced]
GO
/****** Object:  Default [DF__Rlog__codigoA__17ED6F58]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Rlog] ADD  DEFAULT (' ') FOR [codigoA]
GO
/****** Object:  Default [DF__Rlog__Concepto__18E19391]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Rlog] ADD  DEFAULT (' ') FOR [Concepto]
GO
/****** Object:  Default [DF__Rlog__Deta__19D5B7CA]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Rlog] ADD  DEFAULT (' ') FOR [Deta]
GO
/****** Object:  Default [DF__Rlog__Fecha__1AC9DC03]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Rlog] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [Fecha]
GO
/****** Object:  Default [DF__Rlog__Nucomp__1BBE003C]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Rlog] ADD  DEFAULT (' ') FOR [Nucomp]
GO
/****** Object:  Default [DF__Rlog__Usuario__1CB22475]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Rlog] ADD  DEFAULT (' ') FOR [Usuario]
GO
/****** Object:  Default [DF__Rlog__Wcompu__1DA648AE]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Rlog] ADD  DEFAULT (' ') FOR [Wcompu]
GO
--/****** Object:  Default [DF__Rliquid__Codigo__61516785]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[Rliquid] ADD  DEFAULT (' ') FOR [Codigo]
--GO
--/****** Object:  Default [DF__Rliquid__Ames__62458BBE]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[Rliquid] ADD  DEFAULT (' ') FOR [Ames]
--GO
--/****** Object:  Default [DF__Rliquid__Peri__6339AFF7]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[Rliquid] ADD  DEFAULT (' ') FOR [Peri]
--GO
--/****** Object:  Default [DF__Rliquid__Cohade__642DD430]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[Rliquid] ADD  DEFAULT (' ') FOR [Cohade]
--GO
--/****** Object:  Default [DF__Rliquid__Tipo__6521F869]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[Rliquid] ADD  DEFAULT (0) FOR [Tipo]
--GO
--/****** Object:  Default [DF__Rliquid__Descitm__66161CA2]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[Rliquid] ADD  DEFAULT (' ') FOR [Descitm]
--GO
--/****** Object:  Default [DF__Rliquid__Orden__670A40DB]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[Rliquid] ADD  DEFAULT (0) FOR [Orden]
--GO
--/****** Object:  Default [DF__Rliquid__Monto__67FE6514]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[Rliquid] ADD  DEFAULT (0) FOR [Monto]
--GO
--/****** Object:  Default [DF__Rliquid__MontoO__68F2894D]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[Rliquid] ADD  DEFAULT (0) FOR [MontoO]
--GO
--/****** Object:  Default [DF__Rliquid__MontoA__69E6AD86]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[Rliquid] ADD  DEFAULT (0) FOR [MontoA]
--GO
--/****** Object:  Default [DF__Rliquid__Vo__6ADAD1BF]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[Rliquid] ADD  DEFAULT (0) FOR [Vo]
--GO
--/****** Object:  Default [DF__Rliquid__PerImp__6BCEF5F8]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[Rliquid] ADD  DEFAULT (0) FOR [PerImp]
--GO
--/****** Object:  Default [DF__Rliquid__Empresa__6CC31A31]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[Rliquid] ADD  DEFAULT (' ') FOR [Empresa]
--GO
--/****** Object:  Default [DF__Rliquid__Inform__6DB73E6A]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[Rliquid] ADD  DEFAULT (' ') FOR [Inform]
--GO
--/****** Object:  Default [DF__Rliquid__Cencos__6EAB62A3]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[Rliquid] ADD  DEFAULT (0) FOR [Cencos]
--GO
--/****** Object:  Default [DF__Rliquid__Coprev__6F9F86DC]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[Rliquid] ADD  DEFAULT (0) FOR [Coprev]
--GO
--/****** Object:  Default [DF__Rliquid__Origen__7093AB15]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[Rliquid] ADD  DEFAULT (' ') FOR [Origen]
--GO
--/****** Object:  Default [DF__Rliquid__Cod_reg__7187CF4E]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[Rliquid] ADD  DEFAULT (0) FOR [Cod_reg]
--GO
--/****** Object:  Default [DF__Rliquid__Codpres__727BF387]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[Rliquid] ADD  DEFAULT (0) FOR [Codpres]
--GO
--/****** Object:  Default [DF__Rliquid__Cmapa__737017C0]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[Rliquid] ADD  DEFAULT (' ') FOR [Cmapa]
--GO
--/****** Object:  Default [DF__Rliquid__Dato__74643BF9]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[Rliquid] ADD  DEFAULT (' ') FOR [Dato]
--GO
--/****** Object:  Default [DF__Rliquid__Nro__75586032]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[Rliquid] ADD  DEFAULT (0) FOR [Nro]
--GO
--/****** Object:  Default [DF__Rliquid__Jdd__764C846B]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[Rliquid] ADD  DEFAULT (0) FOR [Jdd]
--GO
/****** Object:  Default [DF__Rlicencia__Clien__05CEBF1D]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Rlicencias] ADD  DEFAULT (' ') FOR [Cliente]
GO
/****** Object:  Default [DF__Rlicencias__Id__06C2E356]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Rlicencias] ADD  DEFAULT ((0)) FOR [Id]
GO
/****** Object:  Default [DF__Rlicencia__IdCli__07B7078F]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Rlicencias] ADD  DEFAULT ((0)) FOR [IdCliente]
GO
/****** Object:  Default [DF__Rlicencia__Produ__08AB2BC8]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Rlicencias] ADD  DEFAULT ((0)) FOR [Producto]
GO
/****** Object:  Default [DF__Rlicencia__Fecha__099F5001]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Rlicencias] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [Fecha_lic]
GO
/****** Object:  Default [DF__Rlicencias__Dias__0A93743A]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Rlicencias] ADD  DEFAULT ((0)) FOR [Dias]
GO
/****** Object:  Default [DF__Rlicencias__Nlic__0B879873]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Rlicencias] ADD  DEFAULT ((0)) FOR [Nlic]
GO
/****** Object:  Default [DF__Rlicencia__sitco__0C7BBCAC]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Rlicencias] ADD  DEFAULT (' ') FOR [sitcod]
GO
/****** Object:  Default [DF__Rlicencia__Licen__0D6FE0E5]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Rlicencias] ADD  DEFAULT (' ') FOR [Licencia]
GO
/****** Object:  Default [DF__Rlicencia__envio__0E64051E]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Rlicencias] ADD  DEFAULT (' ') FOR [envio]
GO
/****** Object:  Default [DF__Rlicencias__mail__0F582957]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Rlicencias] ADD  DEFAULT (' ') FOR [mail]
GO
/****** Object:  Default [DF__Rlicencia__usuar__104C4D90]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Rlicencias] ADD  DEFAULT (' ') FOR [usuario]
GO
/****** Object:  Default [DF__Rlicencia__wcomp__114071C9]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Rlicencias] ADD  DEFAULT (' ') FOR [wcompu]
GO
/****** Object:  Default [DF__Rlicencias__Obs__12349602]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Rlicencias] ADD  DEFAULT (' ') FOR [Obs]
GO
/****** Object:  Default [DF__Rlicencias__Jdd__1328BA3B]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Rlicencias] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__RJerarq5__IdOrga__1FAE8CB1]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RJerarq5] ADD  DEFAULT ((0)) FOR [IdOrgani]
GO
/****** Object:  Default [DF__RJerarq5__IdNodo__20A2B0EA]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RJerarq5] ADD  DEFAULT ((0)) FOR [IdNodo]
GO
/****** Object:  Default [DF__RJerarq5__EsEmpr__2196D523]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RJerarq5] ADD  DEFAULT ((0)) FOR [EsEmpresa]
GO
/****** Object:  Default [DF__RJerarq5__Valor__228AF95C]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RJerarq5] ADD  DEFAULT ((0)) FOR [Valor]
GO
/****** Object:  Default [DF__RJerarq5__Padre__237F1D95]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RJerarq5] ADD  DEFAULT ((0)) FOR [Padre]
GO
/****** Object:  Default [DF__RJerarq5__Jdd__247341CE]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RJerarq5] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__RJerarq5__Codigo__25676607]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RJerarq5] ADD  DEFAULT (' ') FOR [Codigo]
GO
--/****** Object:  Default [DF__RJERARQ__Segment__0D64F3ED]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RJERARQ] ADD  DEFAULT (' ') FOR [Segmento]
--GO
--/****** Object:  Default [DF__RJERARQ__GranZon__0E591826]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RJERARQ] ADD  DEFAULT (' ') FOR [GranZona]
--GO
--/****** Object:  Default [DF__RJERARQ__Zona__0F4D3C5F]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RJERARQ] ADD  DEFAULT (' ') FOR [Zona]
--GO
--/****** Object:  Default [DF__RJERARQ__Jop__10416098]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RJERARQ] ADD  DEFAULT (' ') FOR [Jop]
--GO
--/****** Object:  Default [DF__RJERARQ__Supervi__113584D1]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RJERARQ] ADD  DEFAULT (' ') FOR [Supervis]
--GO
--/****** Object:  Default [DF__RJERARQ__TipoCC__1229A90A]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RJERARQ] ADD  DEFAULT (' ') FOR [TipoCC]
--GO
--/****** Object:  Default [DF__RJERARQ__Cencos__131DCD43]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RJERARQ] ADD  DEFAULT (0) FOR [Cencos]
--GO
--/****** Object:  Default [DF__RJERARQ__Agrupad__1411F17C]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RJERARQ] ADD  DEFAULT (' ') FOR [Agrupador]
--GO
--/****** Object:  Default [DF__RJERARQ__Venta__150615B5]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RJERARQ] ADD  DEFAULT (0) FOR [Venta]
--GO
--/****** Object:  Default [DF__RJERARQ__Dotacio__15FA39EE]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RJERARQ] ADD  DEFAULT (0) FOR [Dotacion]
--GO
--/****** Object:  Default [DF__RJERARQ__Ingreso__16EE5E27]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RJERARQ] ADD  DEFAULT (0) FOR [Ingresos]
--GO
--/****** Object:  Default [DF__RJERARQ__IngxTra__17E28260]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RJERARQ] ADD  DEFAULT (0) FOR [IngxTras]
--GO
--/****** Object:  Default [DF__RJERARQ__Licenci__18D6A699]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RJERARQ] ADD  DEFAULT (0) FOR [Licencias]
--GO
--/****** Object:  Default [DF__RJERARQ__Finiqui__19CACAD2]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RJERARQ] ADD  DEFAULT (0) FOR [Finiquito]
--GO
--/****** Object:  Default [DF__RJERARQ__SalxTra__1ABEEF0B]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RJERARQ] ADD  DEFAULT (0) FOR [SalxTras]
--GO
--/****** Object:  Default [DF__RJERARQ__HrsExtr__1BB31344]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RJERARQ] ADD  DEFAULT (0) FOR [HrsExtra]
--GO
--/****** Object:  Default [DF__RJERARQ__Ames__1CA7377D]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RJERARQ] ADD  DEFAULT (' ') FOR [Ames]
--GO
--/****** Object:  Default [DF__RJERARQ__Peri__1D9B5BB6]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RJERARQ] ADD  DEFAULT (' ') FOR [Peri]
--GO
--/****** Object:  Default [DF__RJERARQ__Permiso__1E8F7FEF]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RJERARQ] ADD  DEFAULT (0) FOR [Permisos]
--GO
--/****** Object:  Default [DF__RJERARQ__Acciden__1F83A428]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RJERARQ] ADD  DEFAULT (0) FOR [Accidente]
--GO
--/****** Object:  Default [DF__RJERARQ__Empresa__2077C861]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RJERARQ] ADD  DEFAULT (' ') FOR [Empresa]
--GO
--/****** Object:  Default [DF__RJERARQ__Descrip__216BEC9A]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RJERARQ] ADD  DEFAULT (' ') FOR [Descripcc]
--GO
--/****** Object:  Default [DF__RJERARQ__Diaspag__226010D3]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RJERARQ] ADD  DEFAULT (0) FOR [Diaspag]
--GO
--/****** Object:  Default [DF__RJERARQ__Diasvac__2354350C]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RJERARQ] ADD  DEFAULT (0) FOR [Diasvac]
--GO
--/****** Object:  Default [DF__RJERARQ__Jdd__24485945]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RJERARQ] ADD  DEFAULT (0) FOR [Jdd]
--GO
--/****** Object:  Default [DF__RJDATOS__Jdd__53F76C67]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RJDATOS] ADD  DEFAULT (0) FOR [Jdd]
--GO
--/****** Object:  Default [DF__RJDATOS__Nombre__54EB90A0]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RJDATOS] ADD  DEFAULT (' ') FOR [Nombre]
--GO
--/****** Object:  Default [DF__RJDATOS__Encarga__55DFB4D9]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RJDATOS] ADD  DEFAULT (' ') FOR [Encargado]
--GO
--/****** Object:  Default [DF__RJDATOS__Fono__56D3D912]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RJDATOS] ADD  DEFAULT (' ') FOR [Fono]
--GO
--/****** Object:  Default [DF__RJDATOS__email__57C7FD4B]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RJDATOS] ADD  DEFAULT (' ') FOR [email]
--GO
--/****** Object:  Default [DF__RJDATOS__numtra__58BC2184]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RJDATOS] ADD  DEFAULT (0) FOR [numtra]
--GO
/****** Object:  Default [DF__Ritemseg__Tipo__27B9C2CD]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Ritemseg] ADD  DEFAULT (' ') FOR [Tipo]
GO
/****** Object:  Default [DF__Ritemseg__Stipo__28ADE706]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Ritemseg] ADD  DEFAULT (' ') FOR [Stipo]
GO
/****** Object:  Default [DF__Ritemseg__Item__29A20B3F]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Ritemseg] ADD  DEFAULT (' ') FOR [Item]
GO
/****** Object:  Default [DF__Ritemseg__Descri__2A962F78]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Ritemseg] ADD  DEFAULT (' ') FOR [Descrip]
GO
/****** Object:  Default [DF__Ritemseg__Acc__2B8A53B1]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Ritemseg] ADD  DEFAULT (' ') FOR [Acc]
GO
/****** Object:  Default [DF__Ritemseg__Mod__2C7E77EA]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Ritemseg] ADD  DEFAULT (' ') FOR [Mod]
GO
/****** Object:  Default [DF__Ritemseg__Cre__2D729C23]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Ritemseg] ADD  DEFAULT (' ') FOR [Cre]
GO
/****** Object:  Default [DF__Ritemseg__Eli__2E66C05C]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Ritemseg] ADD  DEFAULT (' ') FOR [Eli]
GO
/****** Object:  Default [DF__Ritemseg__Imp__2F5AE495]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Ritemseg] ADD  DEFAULT (' ') FOR [Imp]
GO
/****** Object:  Default [DF__Ritemseg__Jdd__304F08CE]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Ritemseg] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__RINTDETA__BancoI__0FC23DAB]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RINTDETA] ADD  DEFAULT ((0)) FOR [BancoId]
GO
/****** Object:  Default [DF__RINTDETA__Esquem__10B661E4]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RINTDETA] ADD  DEFAULT ((0)) FOR [Esquema]
GO
/****** Object:  Default [DF__RINTDETA__Seccio__11AA861D]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RINTDETA] ADD  DEFAULT ((0)) FOR [Seccion]
GO
/****** Object:  Default [DF__RINTDETA__Linea__129EAA56]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RINTDETA] ADD  DEFAULT ((0)) FOR [Linea]
GO
/****** Object:  Default [DF__RINTDETA__Orden__1392CE8F]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RINTDETA] ADD  DEFAULT ((0)) FOR [Orden]
GO
/****** Object:  Default [DF__RINTDETA__TipoDa__1486F2C8]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RINTDETA] ADD  DEFAULT (' ') FOR [TipoDato]
GO
/****** Object:  Default [DF__RINTDETA__Largo__157B1701]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RINTDETA] ADD  DEFAULT ((0)) FOR [Largo]
GO
/****** Object:  Default [DF__RINTDETA__Rellen__166F3B3A]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RINTDETA] ADD  DEFAULT (' ') FOR [Relleno]
GO
/****** Object:  Default [DF__RINTDETA__Alinea__17635F73]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RINTDETA] ADD  DEFAULT ((0)) FOR [Alinea]
GO
/****** Object:  Default [DF__RINTDETA__CampoA__185783AC]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RINTDETA] ADD  DEFAULT (' ') FOR [CampoAsoc]
GO
/****** Object:  Default [DF__RINTDETA__RellDe__194BA7E5]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RINTDETA] ADD  DEFAULT ((0)) FOR [RellDecC0]
GO
/****** Object:  Default [DF__RINTDETA__CantDe__1A3FCC1E]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RINTDETA] ADD  DEFAULT ((0)) FOR [CantDec]
GO
/****** Object:  Default [DF__RINTDETA__SepDec__1B33F057]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RINTDETA] ADD  DEFAULT (' ') FOR [SepDec]
GO
/****** Object:  Default [DF__RINTDETA__SepMil__1C281490]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RINTDETA] ADD  DEFAULT (' ') FOR [SepMiles]
GO
/****** Object:  Default [DF__RINTDETA__DatoFi__1D1C38C9]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RINTDETA] ADD  DEFAULT (' ') FOR [DatoFijo]
GO
/****** Object:  Default [DF__RINTDETA__NomCol__1E105D02]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RINTDETA] ADD  DEFAULT (' ') FOR [NomColumn]
GO
/****** Object:  Default [DF__RINTDETA__Format__1F04813B]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RINTDETA] ADD  DEFAULT (' ') FOR [FormatFec]
GO
/****** Object:  Default [DF__RINTDETA__DatosF__1FF8A574]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RINTDETA] ADD  DEFAULT (' ') FOR [DatosForm]
GO
/****** Object:  Default [DF__RINTDETA__QuiCar__20ECC9AD]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RINTDETA] ADD  DEFAULT (' ') FOR [QuiCarCad]
GO
/****** Object:  Default [DF__RINTDETA__StrDes__21E0EDE6]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RINTDETA] ADD  DEFAULT ((0)) FOR [StrDesde]
GO
/****** Object:  Default [DF__RINTDETA__StrHas__22D5121F]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RINTDETA] ADD  DEFAULT ((0)) FOR [StrHasta]
GO
/****** Object:  Default [DF__RINTDETA__TablaC__23C93658]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RINTDETA] ADD  DEFAULT ((0)) FOR [TablaConv]
GO
/****** Object:  Default [DF__RINTDETA__EsCodi__24BD5A91]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RINTDETA] ADD  DEFAULT ((0)) FOR [EsCodigo]
GO
/****** Object:  Default [DF__RINTDETA__TablaC__25B17ECA]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RINTDETA] ADD  DEFAULT ((0)) FOR [TablaCod]
GO
/****** Object:  Default [DF__RINTDETA__Descri__26A5A303]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RINTDETA] ADD  DEFAULT (' ') FOR [Descrip]
GO
/****** Object:  Default [DF__RINTDETA__ChAMay__2799C73C]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RINTDETA] ADD  DEFAULT ((0)) FOR [ChAMayMin]
GO
/****** Object:  Default [DF__RINTDETA__ReempC__288DEB75]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RINTDETA] ADD  DEFAULT (' ') FOR [ReempCar]
GO
/****** Object:  Default [DF__RINTDETA__TomHas__29820FAE]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RINTDETA] ADD  DEFAULT (' ') FOR [TomHasCar]
GO
/****** Object:  Default [DF__RINTDETA__TomIzq__2A7633E7]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RINTDETA] ADD  DEFAULT ((0)) FOR [TomIzqDer]
GO
/****** Object:  Default [DF__RINTDETA__TbConv__2B6A5820]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RINTDETA] ADD  DEFAULT (' ') FOR [TbConvDef]
GO
/****** Object:  Default [DF__RINTDETA__Jdd__2C5E7C59]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RINTDETA] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__RINTDETA__Espaci__2D52A092]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RINTDETA] ADD  DEFAULT ((0)) FOR [Espacios]
GO
/****** Object:  Default [DF__RINTCONVE__Esque__302F0D3D]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RINTCONVER] ADD  DEFAULT ((0)) FOR [Esquema]
GO
/****** Object:  Default [DF__RINTCONVE__Cotab__31233176]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RINTCONVER] ADD  DEFAULT ((0)) FOR [Cotab]
GO
/****** Object:  Default [DF__RINTCONVE__Codig__321755AF]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RINTCONVER] ADD  DEFAULT ((0)) FOR [Codigo]
GO
/****** Object:  Default [DF__RINTCONVE__DescA__330B79E8]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RINTCONVER] ADD  DEFAULT (' ') FOR [DescAlter]
GO
/****** Object:  Default [DF__RINTCONVER__Jdd__33FF9E21]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RINTCONVER] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__RINTBANC__BancoI__36DC0ACC]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RINTBANC] ADD  DEFAULT ((0)) FOR [BancoId]
GO
/****** Object:  Default [DF__RINTBANC__Esquem__37D02F05]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RINTBANC] ADD  DEFAULT ((0)) FOR [Esquema]
GO
/****** Object:  Default [DF__RINTBANC__Descri__38C4533E]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RINTBANC] ADD  DEFAULT (' ') FOR [Descrip]
GO
/****** Object:  Default [DF__RINTBANC__CtrCta__39B87777]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RINTBANC] ADD  DEFAULT ((0)) FOR [CtrCtaRep]
GO
/****** Object:  Default [DF__RINTBANC__TipOpc__3AAC9BB0]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RINTBANC] ADD  DEFAULT ((0)) FOR [TipOpcion]
GO
/****** Object:  Default [DF__RINTBANC__NombAr__3BA0BFE9]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RINTBANC] ADD  DEFAULT (' ') FOR [NombArch]
GO
/****** Object:  Default [DF__RINTBANC__TipArc__3C94E422]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RINTBANC] ADD  DEFAULT ((0)) FOR [TipArchGe]
GO
/****** Object:  Default [DF__RINTBANC__RegiPa__3D89085B]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RINTBANC] ADD  DEFAULT ((0)) FOR [RegiPagos]
GO
/****** Object:  Default [DF__RINTBANC__Verifi__3E7D2C94]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RINTBANC] ADD  DEFAULT (' ') FOR [VerificaCB]
GO
/****** Object:  Default [DF__RINTBANC__NoProc__3F7150CD]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RINTBANC] ADD  DEFAULT (' ') FOR [NoProcRegi]
GO
/****** Object:  Default [DF__RINTBANC__UnifxR__40657506]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RINTBANC] ADD  DEFAULT ((0)) FOR [UnifxRut]
GO
/****** Object:  Default [DF__RINTBANC__Jdd__4159993F]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RINTBANC] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__RINTBANC__CtrCbu__424DBD78]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RINTBANC] ADD  DEFAULT ((0)) FOR [CtrCbuRep]
GO
/****** Object:  Default [DF__RINTBANC__TipoOp__4341E1B1]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RINTBANC] ADD  DEFAULT ((0)) FOR [TipoOpcion]
GO
/****** Object:  Default [DF__RINTBANC__TipoAr__443605EA]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RINTBANC] ADD  DEFAULT ((0)) FOR [TipoArchGe]
GO
/****** Object:  Default [DF__Ringresos__Usuar__71C7C670]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Ringresos] ADD  DEFAULT (' ') FOR [Usuario]
GO
/****** Object:  Default [DF__Ringresos__Tipo__72BBEAA9]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Ringresos] ADD  DEFAULT (' ') FOR [Tipo]
GO
/****** Object:  Default [DF__Ringresos__Fecha__73B00EE2]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Ringresos] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [Fecha]
GO
/****** Object:  Default [DF__Ringresos__Ames__74A4331B]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Ringresos] ADD  DEFAULT (' ') FOR [Ames]
GO
/****** Object:  Default [DF__Ringresos__Peri__75985754]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Ringresos] ADD  DEFAULT (' ') FOR [Peri]
GO
/****** Object:  Default [DF__Ringresos__Deta__768C7B8D]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Ringresos] ADD  DEFAULT (' ') FOR [Deta]
GO
/****** Object:  Default [DF__Ringresos__Nucom__77809FC6]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Ringresos] ADD  DEFAULT (' ') FOR [Nucomp]
GO
/****** Object:  Default [DF__Ringresos__Jdd__7874C3FF]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Ringresos] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__Ringreapro__Jdd__7B5130AA]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Ringreapro] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__Ringreapr__Codig__7C4554E3]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Ringreapro] ADD  DEFAULT (' ') FOR [Codigo]
GO
/****** Object:  Default [DF__Ringreapr__Funci__7D39791C]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Ringreapro] ADD  DEFAULT (' ') FOR [Funcion]
GO
/****** Object:  Default [DF__Ringreapro__Situ__7E2D9D55]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Ringreapro] ADD  DEFAULT (' ') FOR [Situ]
GO
/****** Object:  Default [DF__Ringreapr__Items__7F21C18E]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Ringreapro] ADD  DEFAULT (' ') FOR [ItemsTi]
GO
/****** Object:  Default [DF__Ringreapr__IDpla__0015E5C7]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Ringreapro] ADD  DEFAULT (' ') FOR [IDplant]
GO
/****** Object:  Default [DF__Ringreapr__Apro0__010A0A00]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Ringreapro] ADD  DEFAULT (' ') FOR [Apro01]
GO
/****** Object:  Default [DF__Ringreapr__Apro0__01FE2E39]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Ringreapro] ADD  DEFAULT (' ') FOR [Apro02]
GO
/****** Object:  Default [DF__Ringreapr__Apro0__02F25272]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Ringreapro] ADD  DEFAULT (' ') FOR [Apro03]
GO
/****** Object:  Default [DF__ringlicen__Usuar__5BD88551]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[ringlicen] ADD  DEFAULT (' ') FOR [Usuario]
GO
/****** Object:  Default [DF__ringlicen__Codig__5CCCA98A]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[ringlicen] ADD  DEFAULT (' ') FOR [Codigo]
GO
/****** Object:  Default [DF__ringlicen__Rut__5DC0CDC3]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[ringlicen] ADD  DEFAULT (' ') FOR [Rut]
GO
/****** Object:  Default [DF__ringlicen__Cargo__5EB4F1FC]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[ringlicen] ADD  DEFAULT ((0)) FOR [Cargo]
GO
/****** Object:  Default [DF__ringlicen__Dias__5FA91635]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[ringlicen] ADD  DEFAULT ((0)) FOR [Dias]
GO
/****** Object:  Default [DF__ringlicen__Fecha__609D3A6E]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[ringlicen] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [Fecha_lic]
GO
/****** Object:  Default [DF__ringlicen__Fecha__61915EA7]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[ringlicen] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [Fecha_ini]
GO
/****** Object:  Default [DF__ringlicen__Nulic__628582E0]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[ringlicen] ADD  DEFAULT ((0)) FOR [Nulic]
GO
/****** Object:  Default [DF__ringlicen__Tipo__6379A719]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[ringlicen] ADD  DEFAULT ((0)) FOR [Tipo]
GO
/****** Object:  Default [DF__ringlicen__Causa__646DCB52]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[ringlicen] ADD  DEFAULT ((0)) FOR [Causal]
GO
/****** Object:  Default [DF__ringlicen__Escon__6561EF8B]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[ringlicen] ADD  DEFAULT (' ') FOR [Escon]
GO
/****** Object:  Default [DF__ringlicen__Fecha__665613C4]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[ringlicen] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [Fecha_ico]
GO
/****** Object:  Default [DF__ringlicen__Medio__674A37FD]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[ringlicen] ADD  DEFAULT (' ') FOR [Medios]
GO
/****** Object:  Default [DF__ringlicen__Fecha__683E5C36]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[ringlicen] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [Fecha_con]
GO
/****** Object:  Default [DF__ringlicen__Rutpr__6932806F]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[ringlicen] ADD  DEFAULT (' ') FOR [Rutpro]
GO
/****** Object:  Default [DF__ringlicen__Medic__6A26A4A8]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[ringlicen] ADD  DEFAULT (' ') FOR [Medico]
GO
/****** Object:  Default [DF__ringlicen__Espec__6B1AC8E1]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[ringlicen] ADD  DEFAULT ((0)) FOR [Especia]
GO
/****** Object:  Default [DF__ringlicen__mailJ__6C0EED1A]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[ringlicen] ADD  DEFAULT (' ') FOR [mailJefe]
GO
/****** Object:  Default [DF__ringlicen__Nombr__6D031153]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[ringlicen] ADD  DEFAULT (' ') FOR [Nombre]
GO
/****** Object:  Default [DF__ringlicen__Lscan__6DF7358C]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[ringlicen] ADD  DEFAULT ((0)) FOR [Lscan]
GO
/****** Object:  Default [DF__ringlicen__Jdd__6EEB59C5]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[ringlicen] ADD  DEFAULT ((0)) FOR [Jdd]
GO
--/****** Object:  Default [DF__RINDICES__Aa__1975C517]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RINDICES] ADD  DEFAULT (0) FOR [Aa]
--GO
--/****** Object:  Default [DF__RINDICES__Mm__1A69E950]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RINDICES] ADD  DEFAULT (0) FOR [Mm]
--GO
--/****** Object:  Default [DF__RINDICES__Utm__1B5E0D89]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RINDICES] ADD  DEFAULT (0) FOR [Utm]
--GO
--/****** Object:  Default [DF__RINDICES__Uf__1C5231C2]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RINDICES] ADD  DEFAULT (0) FOR [Uf]
--GO
--/****** Object:  Default [DF__RINDICES__Ipc__1D4655FB]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RINDICES] ADD  DEFAULT (0) FOR [Ipc]
--GO
--/****** Object:  Default [DF__RINDICES__Fipc__1E3A7A34]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RINDICES] ADD  DEFAULT (0) FOR [Fipc]
--GO
--/****** Object:  Default [DF__RINDICES__Jdd__1F2E9E6D]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RINDICES] ADD  DEFAULT (0) FOR [Jdd]
--GO
--/****** Object:  Default [DF__RINDICES__TopeAF__5CACADF9]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RINDICES] ADD  DEFAULT (0) FOR [TopeAFP]
--GO
--/****** Object:  Default [DF__RINDICES__TopeSE__477C86E9]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RINDICES] ADD  DEFAULT (0) FOR [TopeSEC]
--GO
--/****** Object:  Default [DF__RINDICES__Sueldo__55959C16]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RINDICES] ADD  DEFAULT ((0)) FOR [SueldoMin]
--GO
/****** Object:  Default [DF__Rimpuesxmes__jdd__4BA21D88]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Rimpuesxmes] ADD  DEFAULT ((0)) FOR [jdd]
GO
/****** Object:  Default [DF__Rimpuesxm__Empre__4C9641C1]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Rimpuesxmes] ADD  DEFAULT (' ') FOR [Empresa]
GO
/****** Object:  Default [DF__Rimpuesxmes__Aa__4D8A65FA]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Rimpuesxmes] ADD  DEFAULT ((0)) FOR [Aa]
GO
/****** Object:  Default [DF__Rimpuesxmes__ene__4E7E8A33]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Rimpuesxmes] ADD  DEFAULT ((0)) FOR [ene]
GO
/****** Object:  Default [DF__Rimpuesxmes__feb__4F72AE6C]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Rimpuesxmes] ADD  DEFAULT ((0)) FOR [feb]
GO
/****** Object:  Default [DF__Rimpuesxmes__mar__5066D2A5]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Rimpuesxmes] ADD  DEFAULT ((0)) FOR [mar]
GO
/****** Object:  Default [DF__Rimpuesxmes__abr__515AF6DE]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Rimpuesxmes] ADD  DEFAULT ((0)) FOR [abr]
GO
/****** Object:  Default [DF__Rimpuesxmes__may__524F1B17]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Rimpuesxmes] ADD  DEFAULT ((0)) FOR [may]
GO
/****** Object:  Default [DF__Rimpuesxmes__jun__53433F50]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Rimpuesxmes] ADD  DEFAULT ((0)) FOR [jun]
GO
/****** Object:  Default [DF__Rimpuesxmes__jul__54376389]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Rimpuesxmes] ADD  DEFAULT ((0)) FOR [jul]
GO
/****** Object:  Default [DF__Rimpuesxmes__ago__552B87C2]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Rimpuesxmes] ADD  DEFAULT ((0)) FOR [ago]
GO
/****** Object:  Default [DF__Rimpuesxmes__sep__561FABFB]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Rimpuesxmes] ADD  DEFAULT ((0)) FOR [sep]
GO
/****** Object:  Default [DF__Rimpuesxmes__oct__5713D034]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Rimpuesxmes] ADD  DEFAULT ((0)) FOR [oct]
GO
/****** Object:  Default [DF__Rimpuesxmes__nov__5807F46D]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Rimpuesxmes] ADD  DEFAULT ((0)) FOR [nov]
GO
/****** Object:  Default [DF__Rimpuesxmes__dic__58FC18A6]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Rimpuesxmes] ADD  DEFAULT ((0)) FOR [dic]
GO
--/****** Object:  Default [DF__RIGDET__Codigo__26EFBBC6]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RIGDET] ADD  DEFAULT (' ') FOR [Codigo]
--GO
--/****** Object:  Default [DF__RIGDET__Ames__27E3DFFF]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RIGDET] ADD  DEFAULT (' ') FOR [Ames]
--GO
--/****** Object:  Default [DF__RIGDET__Concepto__28D80438]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RIGDET] ADD  DEFAULT (' ') FOR [Concepto]
--GO
--/****** Object:  Default [DF__RIGDET__MontoA__29CC2871]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RIGDET] ADD  DEFAULT (0) FOR [MontoA]
--GO
--/****** Object:  Default [DF__RIGDET__MontoP__2AC04CAA]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RIGDET] ADD  DEFAULT (0) FOR [MontoP]
--GO
--/****** Object:  Default [DF__RIGDET__Jdd__2BB470E3]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RIGDET] ADD  DEFAULT (0) FOR [Jdd]
--GO
--/****** Object:  Default [DF__RIGAESQ__Jdd__52793849]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RIGAESQ] ADD  DEFAULT (0) FOR [Jdd]
--GO
--/****** Object:  Default [DF__RIGAESQ__Concept__536D5C82]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RIGAESQ] ADD  DEFAULT (' ') FOR [Concepto]
--GO
--/****** Object:  Default [DF__RIGAESQ__Descrip__546180BB]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RIGAESQ] ADD  DEFAULT (' ') FOR [Descrip]
--GO
--/****** Object:  Default [DF__RIGAESQ__Orden__5555A4F4]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RIGAESQ] ADD  DEFAULT (0) FOR [Orden]
--GO
--/****** Object:  Default [DF__RIGAESQ__Signo__5649C92D]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RIGAESQ] ADD  DEFAULT (' ') FOR [Signo]
--GO
--/****** Object:  Default [DF__RIGAESQ__Formula__573DED66]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RIGAESQ] ADD  DEFAULT (' ') FOR [Formula]
--GO
--/****** Object:  Default [DF__RIGAESQ__Tipo__5832119F]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RIGAESQ] ADD  DEFAULT (' ') FOR [Tipo]
--GO
/****** Object:  Default [DF__RIDIOMAS__rut__31C24FF4]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RIDIOMAS] ADD  DEFAULT (' ') FOR [rut]
GO
/****** Object:  Default [DF__RIDIOMAS__idioma__32B6742D]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RIDIOMAS] ADD  DEFAULT (0) FOR [idioma]
GO
/****** Object:  Default [DF__RIDIOMAS__habla__33AA9866]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RIDIOMAS] ADD  DEFAULT (0) FOR [habla]
GO
/****** Object:  Default [DF__RIDIOMAS__lee__349EBC9F]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RIDIOMAS] ADD  DEFAULT (0) FOR [lee]
GO
/****** Object:  Default [DF__RIDIOMAS__escrib__3592E0D8]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RIDIOMAS] ADD  DEFAULT (0) FOR [escribe]
GO
/****** Object:  Default [DF__RIDIOMAS__observ__36870511]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RIDIOMAS] ADD  DEFAULT (' ') FOR [observ]
GO
/****** Object:  Default [DF__RIDIOMAS__Fecha___377B294A]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RIDIOMAS] ADD  DEFAULT (getdate()) FOR [Fecha_mod]
GO
/****** Object:  Default [DF__RIDIOMAS__vobo__386F4D83]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RIDIOMAS] ADD  DEFAULT (0) FOR [vobo]
GO
/****** Object:  Default [DF__RIDIOMAS__usrvob__396371BC]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RIDIOMAS] ADD  DEFAULT (' ') FOR [usrvobo]
GO
/****** Object:  Default [DF__RIDIOMAS__Jdd__5AA5354D]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RIDIOMAS] ADD  DEFAULT ((0)) FOR [Jdd]
GO
--/****** Object:  Default [DF__RHONORA__Jdd__7A8729A3]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RHONORA] ADD  DEFAULT (0) FOR [Jdd]
--GO
--/****** Object:  Default [DF__RHONORA__Rut__7B7B4DDC]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RHONORA] ADD  DEFAULT (' ') FOR [Rut]
--GO
--/****** Object:  Default [DF__RHONORA__Tiser__7C6F7215]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RHONORA] ADD  DEFAULT (' ') FOR [Tiser]
--GO
--/****** Object:  Default [DF__RHONORA__Fecha_c__7D63964E]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RHONORA] ADD  DEFAULT (getdate()) FOR [Fecha_con]
--GO
--/****** Object:  Default [DF__RHONORA__Fecha_h__7E57BA87]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RHONORA] ADD  DEFAULT (getdate()) FOR [Fecha_hon]
--GO
--/****** Object:  Default [DF__RHONORA__Tipo__7F4BDEC0]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RHONORA] ADD  DEFAULT (' ') FOR [Tipo]
--GO
--/****** Object:  Default [DF__RHONORA__Numbol__004002F9]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RHONORA] ADD  DEFAULT (0) FOR [Numbol]
--GO
--/****** Object:  Default [DF__RHONORA__Monto__01342732]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RHONORA] ADD  DEFAULT (0) FOR [Monto]
--GO
--/****** Object:  Default [DF__RHONORA__Tasa__02284B6B]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RHONORA] ADD  DEFAULT (0) FOR [Tasa]
--GO
--/****** Object:  Default [DF__RHONORA__Impues__031C6FA4]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RHONORA] ADD  DEFAULT (0) FOR [Impues]
--GO
--/****** Object:  Default [DF__RHONORA__Empresa__041093DD]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RHONORA] ADD  DEFAULT (' ') FOR [Empresa]
--GO
--/****** Object:  Default [DF__RHONORA__Codigo__0504B816]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RHONORA] ADD  DEFAULT (' ') FOR [Codigo]
--GO
--/****** Object:  Default [DF__RHONORA__Nombre__05F8DC4F]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RHONORA] ADD  DEFAULT (' ') FOR [Nombre]
--GO
--/****** Object:  Default [DF__RHONORA__Direcci__06ED0088]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RHONORA] ADD  DEFAULT (' ') FOR [Direccion]
--GO
--/****** Object:  Default [DF__RHONORA__Motivo__07E124C1]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RHONORA] ADD  DEFAULT (0) FOR [Motivo]
--GO
--/****** Object:  Default [DF__RHONORA__Tibol__6F357288]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RHONORA] ADD  DEFAULT ('M') FOR [Tibol]
--GO
--/****** Object:  Default [DF__RHONORA__Cencos__75E27017]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RHONORA] ADD  DEFAULT (0) FOR [Cencos]
--GO
--/****** Object:  Default [DF__RHONORA__Fecha_s__78BEDCC2]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RHONORA] ADD  DEFAULT (' ') FOR [Fecha_ser]
--GO
--/****** Object:  Default [DF__RHOJAVI__Codigo__2FEF161B]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RHOJAVI] ADD  DEFAULT (' ') FOR [Codigo]
--GO
--/****** Object:  Default [DF__RHOJAVI__Fecha__30E33A54]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RHOJAVI] ADD  DEFAULT (getdate()) FOR [Fecha]
--GO
--/****** Object:  Default [DF__RHOJAVI__Hora__31D75E8D]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RHOJAVI] ADD  DEFAULT (' ') FOR [Hora]
--GO
--/****** Object:  Default [DF__RHOJAVI__DesTipo__32CB82C6]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RHOJAVI] ADD  DEFAULT (' ') FOR [DesTipo]
--GO
--/****** Object:  Default [DF__RHOJAVI__Detalle__33BFA6FF]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RHOJAVI] ADD  DEFAULT (' ') FOR [Detalle]
--GO
--/****** Object:  Default [DF__RHOJAVI__Estado__34B3CB38]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RHOJAVI] ADD  DEFAULT (' ') FOR [Estado]
--GO
--/****** Object:  Default [DF__RHOJAVI__Tipo__35A7EF71]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RHOJAVI] ADD  DEFAULT (0) FOR [Tipo]
--GO
--/****** Object:  Default [DF__RHOJAVI__Respon__369C13AA]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RHOJAVI] ADD  DEFAULT (' ') FOR [Respon]
--GO
--/****** Object:  Default [DF__RHOJAVI__Nhoras__379037E3]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RHOJAVI] ADD  DEFAULT (0) FOR [Nhoras]
--GO
--/****** Object:  Default [DF__RHOJAVI__Ivt__38845C1C]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RHOJAVI] ADD  DEFAULT (0) FOR [Ivt]
--GO
--/****** Object:  Default [DF__RHOJAVI__Jdd__39788055]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RHOJAVI] ADD  DEFAULT (0) FOR [Jdd]
--GO
/****** Object:  Default [DF__RHISLAB__rut__218BE82B]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RHISLAB] ADD  DEFAULT (' ') FOR [rut]
GO
/****** Object:  Default [DF__RHISLAB__cargo__22800C64]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RHISLAB] ADD  DEFAULT (' ') FOR [cargo]
GO
/****** Object:  Default [DF__RHISLAB__empresa__2374309D]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RHISLAB] ADD  DEFAULT (' ') FOR [empresa]
GO
/****** Object:  Default [DF__RHISLAB__feching__246854D6]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RHISLAB] ADD  DEFAULT (getdate()) FOR [fechingr]
GO
/****** Object:  Default [DF__RHISLAB__fechegr__255C790F]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RHISLAB] ADD  DEFAULT (getdate()) FOR [fechegr]
GO
/****** Object:  Default [DF__RHISLAB__estado__26509D48]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RHISLAB] ADD  DEFAULT (0) FOR [estado]
GO
/****** Object:  Default [DF__RHISLAB__observ__2744C181]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RHISLAB] ADD  DEFAULT (' ') FOR [observ]
GO
/****** Object:  Default [DF__RHISLAB__remuner__2838E5BA]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RHISLAB] ADD  DEFAULT (0) FOR [remunerac]
GO
/****** Object:  Default [DF__RHISLAB__func1__292D09F3]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RHISLAB] ADD  DEFAULT (0) FOR [func1]
GO
/****** Object:  Default [DF__RHISLAB__func2__2A212E2C]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RHISLAB] ADD  DEFAULT (0) FOR [func2]
GO
/****** Object:  Default [DF__RHISLAB__func3__2B155265]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RHISLAB] ADD  DEFAULT (0) FOR [func3]
GO
/****** Object:  Default [DF__RHISLAB__area__2C09769E]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RHISLAB] ADD  DEFAULT (0) FOR [area]
GO
/****** Object:  Default [DF__RHISLAB__Fecha_m__2CFD9AD7]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RHISLAB] ADD  DEFAULT (getdate()) FOR [Fecha_mod]
GO
/****** Object:  Default [DF__RHISLAB__vobo__2DF1BF10]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RHISLAB] ADD  DEFAULT (0) FOR [vobo]
GO
/****** Object:  Default [DF__RHISLAB__usrvobo__2EE5E349]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RHISLAB] ADD  DEFAULT (' ') FOR [usrvobo]
GO
/****** Object:  Default [DF__RHISLAB__Jdd__5B995986]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RHISLAB] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__RHABDES__Cohade__22AA2996]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RHABDES] ADD  DEFAULT (' ') FOR [Cohade]
GO
/****** Object:  Default [DF__RHABDES__Descrip__239E4DCF]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RHABDES] ADD  DEFAULT (' ') FOR [Descrip]
GO
/****** Object:  Default [DF__RHABDES__Tipo__24927208]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RHABDES] ADD  DEFAULT (0) FOR [Tipo]
GO
/****** Object:  Default [DF__RHABDES__Orden__25869641]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RHABDES] ADD  DEFAULT (0) FOR [Orden]
GO
/****** Object:  Default [DF__RHABDES__Vo__267ABA7A]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RHABDES] ADD  DEFAULT (' ') FOR [Vo]
GO
/****** Object:  Default [DF__RHABDES__Propor__276EDEB3]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RHABDES] ADD  DEFAULT (' ') FOR [Propor]
GO
/****** Object:  Default [DF__RHABDES__Coine__286302EC]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RHABDES] ADD  DEFAULT (0) FOR [Coine]
GO
/****** Object:  Default [DF__RHABDES__Coform__29572725]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RHABDES] ADD  DEFAULT (' ') FOR [Coform]
GO
/****** Object:  Default [DF__RHABDES__Pone__2A4B4B5E]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RHABDES] ADD  DEFAULT (' ') FOR [Pone]
GO
/****** Object:  Default [DF__RHABDES__Pror__2B3F6F97]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RHABDES] ADD  DEFAULT (' ') FOR [Pror]
GO
/****** Object:  Default [DF__RHABDES__Acumus__2C3393D0]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RHABDES] ADD  DEFAULT (' ') FOR [Acumus]
GO
/****** Object:  Default [DF__RHABDES__Refer__2D27B809]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RHABDES] ADD  DEFAULT (' ') FOR [Refer]
GO
/****** Object:  Default [DF__RHABDES__Indice__2E1BDC42]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RHABDES] ADD  DEFAULT (0) FOR [Indice]
GO
/****** Object:  Default [DF__RHABDES__Simes__2F10007B]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RHABDES] ADD  DEFAULT (' ') FOR [Simes]
GO
/****** Object:  Default [DF__RHABDES__Afe1__300424B4]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RHABDES] ADD  DEFAULT (' ') FOR [Afe1]
GO
/****** Object:  Default [DF__RHABDES__Afe2__30F848ED]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RHABDES] ADD  DEFAULT (' ') FOR [Afe2]
GO
/****** Object:  Default [DF__RHABDES__Afe3__31EC6D26]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RHABDES] ADD  DEFAULT (' ') FOR [Afe3]
GO
/****** Object:  Default [DF__RHABDES__Afe4__32E0915F]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RHABDES] ADD  DEFAULT (' ') FOR [Afe4]
GO
/****** Object:  Default [DF__RHABDES__Inform__33D4B598]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RHABDES] ADD  DEFAULT (' ') FOR [Inform]
GO
/****** Object:  Default [DF__RHABDES__Aobs__34C8D9D1]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RHABDES] ADD  DEFAULT (' ') FOR [Aobs]
GO
/****** Object:  Default [DF__RHABDES__Tiphab__35BCFE0A]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RHABDES] ADD  DEFAULT (' ') FOR [Tiphab]
GO
/****** Object:  Default [DF__RHABDES__Coinst__36B12243]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RHABDES] ADD  DEFAULT (0) FOR [Coinst]
GO
/****** Object:  Default [DF__RHABDES__RetDond__37A5467C]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RHABDES] ADD  DEFAULT (0) FOR [RetDonde]
GO
/****** Object:  Default [DF__RHABDES__Funda__38996AB5]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RHABDES] ADD  DEFAULT (' ') FOR [Funda]
GO
/****** Object:  Default [DF__RHABDES__VoCofor__398D8EEE]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RHABDES] ADD  DEFAULT (' ') FOR [VoCoform]
GO
/****** Object:  Default [DF__RHABDES__Proiga__3A81B327]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RHABDES] ADD  DEFAULT (' ') FOR [Proiga]
GO
/****** Object:  Default [DF__RHABDES__Infcon__3B75D760]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RHABDES] ADD  DEFAULT (' ') FOR [Infcon]
GO
/****** Object:  Default [DF__RHABDES__RetTipo__3C69FB99]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RHABDES] ADD  DEFAULT (' ') FOR [RetTipo]
GO
/****** Object:  Default [DF__RHABDES__Ctacor__3D5E1FD2]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RHABDES] ADD  DEFAULT (' ') FOR [Ctacor]
GO
/****** Object:  Default [DF__RHABDES__Grupo__3E52440B]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RHABDES] ADD  DEFAULT (0) FOR [Grupo]
GO
/****** Object:  Default [DF__RHABDES__Af__3F466844]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RHABDES] ADD  DEFAULT (' ') FOR [Af]
GO
/****** Object:  Default [DF__RHABDES__AfCofor__403A8C7D]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RHABDES] ADD  DEFAULT (' ') FOR [AfCoform]
GO
/****** Object:  Default [DF__RHABDES__Dato__412EB0B6]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RHABDES] ADD  DEFAULT (' ') FOR [Dato]
GO
/****** Object:  Default [DF__RHABDES__Retenci__4222D4EF]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RHABDES] ADD  DEFAULT (' ') FOR [Retencion]
GO
/****** Object:  Default [DF__RHABDES__Exliq__4316F928]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RHABDES] ADD  DEFAULT (' ') FOR [Exliq]
GO
/****** Object:  Default [DF__RHABDES__accres__440B1D61]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RHABDES] ADD  DEFAULT (' ') FOR [accres]
GO
/****** Object:  Default [DF__RHABDES__Jdd__44FF419A]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RHABDES] ADD  DEFAULT (0) FOR [Jdd]
GO
/****** Object:  Default [DF__RHABDES__Refiva__7DEDA633]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RHABDES] ADD  DEFAULT ('F') FOR [Refiva]
GO
/****** Object:  Default [DF__RHABDES__Afev__09E968C4]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RHABDES] ADD  DEFAULT ('N') FOR [Afev]
GO
/****** Object:  Default [DF__RHABDES__dAF01__3FA65AF7]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RHABDES] ADD  DEFAULT (' ') FOR [dAF01]
GO
/****** Object:  Default [DF__RHABDES__dAF02__409A7F30]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RHABDES] ADD  DEFAULT (' ') FOR [dAF02]
GO
/****** Object:  Default [DF__RHABDES__dAF03__418EA369]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RHABDES] ADD  DEFAULT (' ') FOR [dAF03]
GO
/****** Object:  Default [DF__RHABDES__dAF04__4282C7A2]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RHABDES] ADD  DEFAULT (' ') FOR [dAF04]
GO
/****** Object:  Default [DF__RHABDES__dAF05__4376EBDB]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RHABDES] ADD  DEFAULT (' ') FOR [dAF05]
GO
/****** Object:  Default [DF__RHABDES__dAF06__446B1014]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RHABDES] ADD  DEFAULT (' ') FOR [dAF06]
GO
/****** Object:  Default [DF__RHABDES__dAF07__455F344D]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RHABDES] ADD  DEFAULT (' ') FOR [dAF07]
GO
/****** Object:  Default [DF__RHABDES__dAF08__46535886]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RHABDES] ADD  DEFAULT (' ') FOR [dAF08]
GO
/****** Object:  Default [DF__RHABDES__dAF09__47477CBF]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RHABDES] ADD  DEFAULT (' ') FOR [dAF09]
GO
/****** Object:  Default [DF__RHABDES__dAF10__483BA0F8]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RHABDES] ADD  DEFAULT (' ') FOR [dAF10]
GO
/****** Object:  Default [DF__RHABDES__dAF11__492FC531]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RHABDES] ADD  DEFAULT (' ') FOR [dAF11]
GO
/****** Object:  Default [DF__RHABDES__dAF12__4A23E96A]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RHABDES] ADD  DEFAULT (' ') FOR [dAF12]
GO
/****** Object:  Default [DF__RHABDES__dAF13__4B180DA3]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RHABDES] ADD  DEFAULT (' ') FOR [dAF13]
GO
/****** Object:  Default [DF__RHABDES__dAF14__4C0C31DC]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RHABDES] ADD  DEFAULT (' ') FOR [dAF14]
GO
/****** Object:  Default [DF__RHABDES__dAF15__4D005615]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RHABDES] ADD  DEFAULT (' ') FOR [dAF15]
GO
/****** Object:  Default [DF__RHABDES__dAF16__4DF47A4E]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RHABDES] ADD  DEFAULT (' ') FOR [dAF16]
GO
/****** Object:  Default [DF__RHABDES__dAF17__4EE89E87]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RHABDES] ADD  DEFAULT (' ') FOR [dAF17]
GO
/****** Object:  Default [DF__RHABDES__dAF18__4FDCC2C0]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RHABDES] ADD  DEFAULT (' ') FOR [dAF18]
GO
/****** Object:  Default [DF__RHABDES__dAF19__50D0E6F9]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RHABDES] ADD  DEFAULT (' ') FOR [dAF19]
GO
/****** Object:  Default [DF__RHABDES__dAF20__51C50B32]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RHABDES] ADD  DEFAULT (' ') FOR [dAF20]
GO
/****** Object:  Default [DF__RHABDES__Afev2__52B92F6B]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RHABDES] ADD  DEFAULT (' ') FOR [Afev2]
GO
/****** Object:  Default [DF__RHABDES__Pone0__53AD53A4]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RHABDES] ADD  DEFAULT (' ') FOR [Pone0]
GO
/****** Object:  Default [DF__RHABDES__Unico__54A177DD]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RHABDES] ADD  DEFAULT (' ') FOR [Unico]
GO
/****** Object:  Default [DF__RHABDES__dAF21__035C66C6]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RHABDES] ADD  DEFAULT (' ') FOR [dAF21]
GO
/****** Object:  Default [DF__RHABDES__dAF22__04508AFF]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RHABDES] ADD  DEFAULT (' ') FOR [dAF22]
GO
/****** Object:  Default [DF__RHABDES__dAF23__0544AF38]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RHABDES] ADD  DEFAULT (' ') FOR [dAF23]
GO
/****** Object:  Default [DF__RHABDES__dAF24__0638D371]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RHABDES] ADD  DEFAULT (' ') FOR [dAF24]
GO
/****** Object:  Default [DF__RHABDES__dAF25__072CF7AA]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RHABDES] ADD  DEFAULT (' ') FOR [dAF25]
GO
/****** Object:  Default [DF__RHABDES__Ndecimo__44B5F42E]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RHABDES] ADD  DEFAULT ((0)) FOR [Ndecimon]
GO
/****** Object:  Default [DF__RHABDES__claiga__727CBEDE]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RHABDES] ADD  DEFAULT (' ') FOR [claiga]
GO
/****** Object:  Default [DF__RGRUPFA__Codigo__4A4E069C]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RGRUPFA] ADD  DEFAULT (' ') FOR [Codigo]
GO
/****** Object:  Default [DF__RGRUPFA__Nombre__4B422AD5]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RGRUPFA] ADD  DEFAULT (' ') FOR [Nombre]
GO
/****** Object:  Default [DF__RGRUPFA__Apc__4C364F0E]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RGRUPFA] ADD  DEFAULT (' ') FOR [Apc]
GO
/****** Object:  Default [DF__RGRUPFA__Rut__4D2A7347]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RGRUPFA] ADD  DEFAULT (' ') FOR [Rut]
GO
/****** Object:  Default [DF__RGRUPFA__PARIENT__4E1E9780]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RGRUPFA] ADD  DEFAULT (0) FOR [PARIENTE]
GO
/****** Object:  Default [DF__RGRUPFA__Fecha_n__4F12BBB9]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RGRUPFA] ADD  DEFAULT (getdate()) FOR [Fecha_nac]
GO
/****** Object:  Default [DF__RGRUPFA__Sexo__5006DFF2]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RGRUPFA] ADD  DEFAULT (' ') FOR [Sexo]
GO
/****** Object:  Default [DF__RGRUPFA__Estudio__50FB042B]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RGRUPFA] ADD  DEFAULT (0) FOR [Estudios]
GO
/****** Object:  Default [DF__RGRUPFA__Gensal__51EF2864]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RGRUPFA] ADD  DEFAULT (' ') FOR [Gensal]
GO
/****** Object:  Default [DF__RGRUPFA__Preexis__52E34C9D]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RGRUPFA] ADD  DEFAULT (' ') FOR [Preexis]
GO
/****** Object:  Default [DF__RGRUPFA__Tipo_do__53D770D6]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RGRUPFA] ADD  DEFAULT (0) FOR [Tipo_doc]
GO
/****** Object:  Default [DF__RGRUPFA__Desc_pa__54CB950F]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RGRUPFA] ADD  DEFAULT (' ') FOR [Desc_par]
GO
/****** Object:  Default [DF__RGRUPFA__Desc_es__55BFB948]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RGRUPFA] ADD  DEFAULT (' ') FOR [Desc_est]
GO
/****** Object:  Default [DF__RGRUPFA__Fecha_a__56B3DD81]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RGRUPFA] ADD  DEFAULT (getdate()) FOR [Fecha_alt]
GO
/****** Object:  Default [DF__RGRUPFA__Fecha_b__57A801BA]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RGRUPFA] ADD  DEFAULT (getdate()) FOR [Fecha_baj]
GO
/****** Object:  Default [DF__RGRUPFA__Invalid__589C25F3]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RGRUPFA] ADD  DEFAULT (0) FOR [Invalid]
GO
/****** Object:  Default [DF__RGRUPFA__Relacio__59904A2C]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RGRUPFA] ADD  DEFAULT (0) FOR [Relacion]
GO
/****** Object:  Default [DF__RGRUPFA__Curso__5A846E65]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RGRUPFA] ADD  DEFAULT (0) FOR [Curso]
GO
/****** Object:  Default [DF__RGRUPFA__Numdoc__5B78929E]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RGRUPFA] ADD  DEFAULT (' ') FOR [Numdoc]
GO
/****** Object:  Default [DF__RGRUPFA__Rebimp__5C6CB6D7]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RGRUPFA] ADD  DEFAULT (0) FOR [Rebimp]
GO
/****** Object:  Default [DF__RGRUPFA__Identid__5D60DB10]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RGRUPFA] ADD  DEFAULT (0) FOR [Identidad]
GO
/****** Object:  Default [DF__RGRUPFA__Matri_c__5E54FF49]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RGRUPFA] ADD  DEFAULT (0) FOR [Matri_cer]
GO
/****** Object:  Default [DF__RGRUPFA__Matri_f__5F492382]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RGRUPFA] ADD  DEFAULT (getdate()) FOR [Matri_fec]
GO
/****** Object:  Default [DF__RGRUPFA__Naci_ce__603D47BB]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RGRUPFA] ADD  DEFAULT (0) FOR [Naci_cer]
GO
/****** Object:  Default [DF__RGRUPFA__Naci_fe__61316BF4]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RGRUPFA] ADD  DEFAULT (getdate()) FOR [Naci_fec]
GO
/****** Object:  Default [DF__RGRUPFA__Prena_c__6225902D]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RGRUPFA] ADD  DEFAULT (0) FOR [Prena_cer]
GO
/****** Object:  Default [DF__RGRUPFA__Prena_f__6319B466]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RGRUPFA] ADD  DEFAULT (getdate()) FOR [Prena_fec]
GO
/****** Object:  Default [DF__RGRUPFA__Estu_ce__640DD89F]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RGRUPFA] ADD  DEFAULT (0) FOR [Estu_cer]
GO
/****** Object:  Default [DF__RGRUPFA__Estu_fe__6501FCD8]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RGRUPFA] ADD  DEFAULT (getdate()) FOR [Estu_fec]
GO
/****** Object:  Default [DF__RGRUPFA__Fecha_a__65F62111]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RGRUPFA] ADD  DEFAULT (getdate()) FOR [Fecha_aig]
GO
/****** Object:  Default [DF__RGRUPFA__Fecha_b__66EA454A]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RGRUPFA] ADD  DEFAULT (getdate()) FOR [Fecha_big]
GO
/****** Object:  Default [DF__RGRUPFA__RetJud__67DE6983]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RGRUPFA] ADD  DEFAULT (' ') FOR [RetJud]
GO
/****** Object:  Default [DF__RGRUPFA__Carsal__68D28DBC]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RGRUPFA] ADD  DEFAULT (' ') FOR [Carsal]
GO
/****** Object:  Default [DF__RGRUPFA__Jdd__69C6B1F5]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RGRUPFA] ADD  DEFAULT (0) FOR [Jdd]
GO
/****** Object:  Default [DF__RGRUPFA__AfpVol__71A7CADF]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RGRUPFA] ADD  DEFAULT ('N') FOR [AfpVol]
GO
/****** Object:  Default [DF__RGRUPFA__AfpCod__729BEF18]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RGRUPFA] ADD  DEFAULT (0) FOR [AfpCod]
GO
/****** Object:  Default [DF__RGRUPFA__AfpMont__73901351]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RGRUPFA] ADD  DEFAULT (0) FOR [AfpMonto]
GO
/****** Object:  Default [DF__RGRUPFA__AfpCofo__7484378A]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RGRUPFA] ADD  DEFAULT (' ') FOR [AfpCoform]
GO
/****** Object:  Default [DF__RGRUPFA__AfpDesd__75785BC3]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RGRUPFA] ADD  DEFAULT (' ') FOR [AfpDesde]
GO
/****** Object:  Default [DF__RGRUPFA__AfpHast__766C7FFC]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RGRUPFA] ADD  DEFAULT (' ') FOR [AfpHasta]
GO
/****** Object:  Default [DF__RGRUPFA__AhoVol__7760A435]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RGRUPFA] ADD  DEFAULT ('N') FOR [AhoVol]
GO
/****** Object:  Default [DF__RGRUPFA__AhoMont__7854C86E]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RGRUPFA] ADD  DEFAULT (0) FOR [AhoMonto]
GO
/****** Object:  Default [DF__RGRUPFA__AhoCofo__7948ECA7]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RGRUPFA] ADD  DEFAULT (' ') FOR [AhoCoform]
GO
/****** Object:  Default [DF__RGRUPFA__Direcci__3CC9EE4C]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RGRUPFA] ADD  DEFAULT (' ') FOR [Direccion]
GO
/****** Object:  Default [DF__RGRUPFA__Fono__3DBE1285]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RGRUPFA] ADD  DEFAULT (' ') FOR [Fono]
GO
/****** Object:  Default [DF__RGRUPFA__Pmail__3EB236BE]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RGRUPFA] ADD  DEFAULT (' ') FOR [Pmail]
GO
/****** Object:  Default [DF__RGRUPFA__AfpNper__53F837BE]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RGRUPFA] ADD  DEFAULT ((0)) FOR [AfpNper]
GO
/****** Object:  Default [DF__RGRUPFA__Nacion__7C062918]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RGRUPFA] ADD  DEFAULT ((0)) FOR [Nacion]
GO
/****** Object:  Default [DF__RGRUPFA__AsigBPS__7CFA4D51]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RGRUPFA] ADD  DEFAULT (' ') FOR [AsigBPS]
GO
/****** Object:  Default [DF__rformlaH__Jdd__18AC8967]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[rformlaH] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__rformlaH__Ames__19A0ADA0]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[rformlaH] ADD  DEFAULT (' ') FOR [Ames]
GO
/****** Object:  Default [DF__rformlaH__Coform__1A94D1D9]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[rformlaH] ADD  DEFAULT (' ') FOR [Coform]
GO
/****** Object:  Default [DF__rformlaH__Descri__1B88F612]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[rformlaH] ADD  DEFAULT (' ') FOR [Descrip]
GO
/****** Object:  Default [DF__rformlaH__Tipo__1C7D1A4B]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[rformlaH] ADD  DEFAULT (' ') FOR [Tipo]
GO
/****** Object:  Default [DF__rformlaH__Trazo__1D713E84]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[rformlaH] ADD  DEFAULT (' ') FOR [Trazo]
GO
/****** Object:  Default [DF__rformlaH__Formul__1E6562BD]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[rformlaH] ADD  DEFAULT (' ') FOR [Formula]
GO
/****** Object:  Default [DF__rformlaH__Obs__1F5986F6]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[rformlaH] ADD  DEFAULT (' ') FOR [Obs]
GO
--/****** Object:  Default [DF__RFORMLA__Coform__534D60F1]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RFORMLA] ADD  DEFAULT (' ') FOR [Coform]
--GO
--/****** Object:  Default [DF__RFORMLA__Descrip__5441852A]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RFORMLA] ADD  DEFAULT (' ') FOR [Descrip]
--GO
--/****** Object:  Default [DF__RFORMLA__Tipo__5535A963]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RFORMLA] ADD  DEFAULT (' ') FOR [Tipo]
--GO
--/****** Object:  Default [DF__RFORMLA__Trazo__5629CD9C]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RFORMLA] ADD  DEFAULT (' ') FOR [Trazo]
--GO
--/****** Object:  Default [DF__RFORMLA__Formula__571DF1D5]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RFORMLA] ADD  DEFAULT (' ') FOR [Formula]
--GO
--/****** Object:  Default [DF__RFORMLA__Jdd__5812160E]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RFORMLA] ADD  DEFAULT (0) FOR [Jdd]
--GO
--/****** Object:  Default [DF__RFORMLA__Obs__59063A47]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RFORMLA] ADD  DEFAULT (' ') FOR [Obs]
--GO
/****** Object:  Default [DF__RFormEsp__IdJdd__418F6EC0]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RFormEsp] ADD  DEFAULT (' ') FOR [IdJdd]
GO
/****** Object:  Default [DF__RFormEsp__Cohade__428392F9]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RFormEsp] ADD  DEFAULT (' ') FOR [Cohade]
GO
/****** Object:  Default [DF__RFormEsp__Coform__4377B732]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RFormEsp] ADD  DEFAULT (' ') FOR [Coform]
GO
--/****** Object:  Default [DF__RFERIAD__Jdd__2A363CC5]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RFERIAD] ADD  DEFAULT (0) FOR [Jdd]
--GO
--/****** Object:  Default [DF__RFERIAD__Fecha__2B2A60FE]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RFERIAD] ADD  DEFAULT (getdate()) FOR [Fecha]
--GO
--/****** Object:  Default [DF__RFERIAD__Tipo__2C1E8537]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RFERIAD] ADD  DEFAULT (' ') FOR [Tipo]
--GO
--/****** Object:  Default [DF__RFERIAD__Motivo__2D12A970]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RFERIAD] ADD  DEFAULT (' ') FOR [Motivo]
--GO
--/****** Object:  Default [DF__RFERIAD__Condici__3BD5CA13]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RFERIAD] ADD  DEFAULT (' ') FOR [Condicion]
--GO
/****** Object:  Default [DF__rfactores__ames__0AFD888E]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[rfactores] ADD  DEFAULT (' ') FOR [ames]
GO
/****** Object:  Default [DF__rfactores__facto__0BF1ACC7]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[rfactores] ADD  DEFAULT ((0)) FOR [factor]
GO
/****** Object:  Default [DF__rfactores__Jdd__0CE5D100]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[rfactores] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__REVENTOS__Fecha__76CBA758]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REVENTOS] ADD  CONSTRAINT [DF__REVENTOS__Fecha__76CBA758]  DEFAULT (getdate()) FOR [Fecha]
GO
/****** Object:  Default [DF__REVENTOS__Usuari__77BFCB91]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REVENTOS] ADD  CONSTRAINT [DF__REVENTOS__Usuari__77BFCB91]  DEFAULT (' ') FOR [Usuario]
GO
/****** Object:  Default [DF__REVENTOS__Prog__78B3EFCA]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REVENTOS] ADD  CONSTRAINT [DF__REVENTOS__Prog__78B3EFCA]  DEFAULT (' ') FOR [Prog]
GO
/****** Object:  Default [DF__REVENTOS__Accion__79A81403]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REVENTOS] ADD  CONSTRAINT [DF__REVENTOS__Accion__79A81403]  DEFAULT (' ') FOR [Accion]
GO
/****** Object:  Default [DF__REVENTOS__Conti__7A9C383C]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REVENTOS] ADD  CONSTRAINT [DF__REVENTOS__Conti__7A9C383C]  DEFAULT (' ') FOR [Conti]
GO
/****** Object:  Default [DF__REVENTOS__Evento__7B905C75]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REVENTOS] ADD  CONSTRAINT [DF__REVENTOS__Evento__7B905C75]  DEFAULT (' ') FOR [Evento]
GO
/****** Object:  Default [DF__REVENTOS__Wcompu__7C8480AE]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REVENTOS] ADD  CONSTRAINT [DF__REVENTOS__Wcompu__7C8480AE]  DEFAULT (' ') FOR [Wcompu]
GO
/****** Object:  Default [DF__REVENTOS__Ngrab__7D78A4E7]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REVENTOS] ADD  CONSTRAINT [DF__REVENTOS__Ngrab__7D78A4E7]  DEFAULT (0) FOR [Ngrab]
GO
/****** Object:  Default [DF__REVENTOS__Jdd__7E6CC920]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REVENTOS] ADD  CONSTRAINT [DF__REVENTOS__Jdd__7E6CC920]  DEFAULT (0) FOR [Jdd]
GO
/****** Object:  Default [DF__REVENTOS__Codigo__7DEE718A]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REVENTOS] ADD  DEFAULT (' ') FOR [Codigo]
GO
/****** Object:  Default [DF__RESUMEN__Codigo__1D114BD1]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RESUMEN] ADD  DEFAULT (' ') FOR [Codigo]
GO
/****** Object:  Default [DF__RESUMEN__Ames__1E05700A]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RESUMEN] ADD  DEFAULT (' ') FOR [Ames]
GO
/****** Object:  Default [DF__RESUMEN__Peri__1EF99443]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RESUMEN] ADD  DEFAULT (' ') FOR [Peri]
GO
/****** Object:  Default [DF__RESUMEN__Periodo__1FEDB87C]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RESUMEN] ADD  DEFAULT (' ') FOR [Periodo]
GO
/****** Object:  Default [DF__RESUMEN__Origen__20E1DCB5]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RESUMEN] ADD  DEFAULT (' ') FOR [Origen]
GO
/****** Object:  Default [DF__RESUMEN__Neto__21D600EE]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RESUMEN] ADD  DEFAULT (0) FOR [Neto]
GO
/****** Object:  Default [DF__RESUMEN__Ktha__22CA2527]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RESUMEN] ADD  DEFAULT (0) FOR [Ktha]
GO
/****** Object:  Default [DF__RESUMEN__Kthn__23BE4960]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RESUMEN] ADD  DEFAULT (0) FOR [Kthn]
GO
/****** Object:  Default [DF__RESUMEN__KthI__24B26D99]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RESUMEN] ADD  DEFAULT (0) FOR [KthI]
GO
/****** Object:  Default [DF__RESUMEN__Ktim__25A691D2]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RESUMEN] ADD  DEFAULT (0) FOR [Ktim]
GO
/****** Object:  Default [DF__RESUMEN__Ktdl__269AB60B]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RESUMEN] ADD  DEFAULT (0) FOR [Ktdl]
GO
/****** Object:  Default [DF__RESUMEN__Ktde__278EDA44]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RESUMEN] ADD  DEFAULT (0) FOR [Ktde]
GO
/****** Object:  Default [DF__RESUMEN__Ktfm__2882FE7D]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RESUMEN] ADD  DEFAULT (0) FOR [Ktfm]
GO
/****** Object:  Default [DF__RESUMEN__Ktex__297722B6]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RESUMEN] ADD  DEFAULT (0) FOR [Ktex]
GO
/****** Object:  Default [DF__RESUMEN__DiasTr__2A6B46EF]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RESUMEN] ADD  DEFAULT (0) FOR [DiasTr]
GO
/****** Object:  Default [DF__RESUMEN__DiasLi__2B5F6B28]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RESUMEN] ADD  DEFAULT (0) FOR [DiasLi]
GO
/****** Object:  Default [DF__RESUMEN__TramoCa__2C538F61]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RESUMEN] ADD  DEFAULT (0) FOR [TramoCar]
GO
/****** Object:  Default [DF__RESUMEN__Coprev__2D47B39A]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RESUMEN] ADD  DEFAULT (0) FOR [Coprev]
GO
/****** Object:  Default [DF__RESUMEN__Cod_Reg__2E3BD7D3]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RESUMEN] ADD  DEFAULT (0) FOR [Cod_Reg]
GO
/****** Object:  Default [DF__RESUMEN__Kcay__2F2FFC0C]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RESUMEN] ADD  DEFAULT (0) FOR [Kcay]
GO
/****** Object:  Default [DF__RESUMEN__Khij__30242045]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RESUMEN] ADD  DEFAULT (0) FOR [Khij]
GO
/****** Object:  Default [DF__RESUMEN__Kotc__3118447E]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RESUMEN] ADD  DEFAULT (0) FOR [Kotc]
GO
/****** Object:  Default [DF__RESUMEN__Afecto1__320C68B7]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RESUMEN] ADD  DEFAULT (0) FOR [Afecto1]
GO
/****** Object:  Default [DF__RESUMEN__Afecto2__33008CF0]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RESUMEN] ADD  DEFAULT (0) FOR [Afecto2]
GO
/****** Object:  Default [DF__RESUMEN__Afecto3__33F4B129]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RESUMEN] ADD  DEFAULT (0) FOR [Afecto3]
GO
/****** Object:  Default [DF__RESUMEN__Afecto4__34E8D562]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RESUMEN] ADD  DEFAULT (0) FOR [Afecto4]
GO
/****** Object:  Default [DF__RESUMEN__Empresa__35DCF99B]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RESUMEN] ADD  DEFAULT (' ') FOR [Empresa]
GO
/****** Object:  Default [DF__RESUMEN__Ktds__36D11DD4]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RESUMEN] ADD  DEFAULT (0) FOR [Ktds]
GO
/****** Object:  Default [DF__RESUMEN__Diaslim__37C5420D]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RESUMEN] ADD  DEFAULT (0) FOR [Diaslim]
GO
/****** Object:  Default [DF__RESUMEN__Subsil__38B96646]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RESUMEN] ADD  DEFAULT (0) FOR [Subsil]
GO
/****** Object:  Default [DF__RESUMEN__Fafp__39AD8A7F]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RESUMEN] ADD  DEFAULT (0) FOR [Fafp]
GO
/****** Object:  Default [DF__RESUMEN__Fecha_d__3AA1AEB8]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RESUMEN] ADD  DEFAULT (getdate()) FOR [Fecha_dep]
GO
/****** Object:  Default [DF__RESUMEN__BancoDe__3B95D2F1]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RESUMEN] ADD  DEFAULT (0) FOR [BancoDep]
GO
/****** Object:  Default [DF__RESUMEN__NroRec__3C89F72A]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RESUMEN] ADD  DEFAULT (0) FOR [NroRec]
GO
/****** Object:  Default [DF__RESUMEN__Fecha_p__3D7E1B63]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RESUMEN] ADD  DEFAULT (getdate()) FOR [Fecha_pag]
GO
/****** Object:  Default [DF__RESUMEN__Jdd__3E723F9C]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RESUMEN] ADD  DEFAULT (0) FOR [Jdd]
GO
/****** Object:  Default [DF__RESUMEN__KtdlO__390E6C01]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RESUMEN] ADD  DEFAULT (0) FOR [KtdlO]
GO
/****** Object:  Default [DF__RESUMEN__Afevari__0ADD8CFD]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RESUMEN] ADD  DEFAULT (0) FOR [Afevari]
GO
/****** Object:  Default [DF__RESUMEN__Dias3pd__371114F6]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RESUMEN] ADD  DEFAULT ((0)) FOR [Dias3pd]
GO
/****** Object:  Default [DF__RESUMEN__Fecha_u__3805392F]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RESUMEN] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(120)),(120))) FOR [Fecha_ult]
GO
/****** Object:  Default [DF__RESUMEN__SubsilN__38F95D68]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RESUMEN] ADD  DEFAULT ((0)) FOR [SubsilN]
GO
/****** Object:  Default [DF__RESUMEN__Afevar2__39ED81A1]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RESUMEN] ADD  DEFAULT ((0)) FOR [Afevar2]
GO
/****** Object:  Default [DF__RESUMEN__Licmd__3AE1A5DA]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RESUMEN] ADD  DEFAULT (' ') FOR [Licmd]
GO
/****** Object:  Default [DF__RESUMEN__Mondep__6BCFC14F]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RESUMEN] ADD  DEFAULT ((0)) FOR [Mondep]
GO
/****** Object:  Default [DF__RESUMEN__BancoPa__6CC3E588]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RESUMEN] ADD  DEFAULT ((0)) FOR [BancoPag]
GO
/****** Object:  Default [DF__RESUMEN__Fecha_e__6DB809C1]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RESUMEN] ADD  DEFAULT (getdate()) FOR [Fecha_eje]
GO
/****** Object:  Default [DF__RESUMEN__user_ej__6EAC2DFA]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RESUMEN] ADD  DEFAULT (' ') FOR [user_eje]
GO
/****** Object:  Default [DF__RESUMEN__efecDep__6FA05233]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RESUMEN] ADD  DEFAULT (' ') FOR [efecDep]
GO
/****** Object:  Default [DF__RESUMEN__kper__7EE295C3]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RESUMEN] ADD  DEFAULT ((0)) FOR [kper]
GO
/****** Object:  Default [DF__RESUMEN__kfal__7FD6B9FC]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RESUMEN] ADD  DEFAULT ((0)) FOR [kfal]
GO
--/****** Object:  Default [DF__RESTANQ__Jdd__1DD065E0]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RESTANQ] ADD  DEFAULT (0) FOR [Jdd]
--GO
--/****** Object:  Default [DF__RESTANQ__Cohade__1EC48A19]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RESTANQ] ADD  DEFAULT (' ') FOR [Cohade]
--GO
--/****** Object:  Default [DF__RESTANQ__Codigo__1FB8AE52]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RESTANQ] ADD  DEFAULT (' ') FOR [Codigo]
--GO
--/****** Object:  Default [DF__RESTANQ__Nro__20ACD28B]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RESTANQ] ADD  DEFAULT (0) FOR [Nro]
--GO
--/****** Object:  Default [DF__RESTANQ__Codpres__21A0F6C4]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RESTANQ] ADD  DEFAULT (0) FOR [Codpres]
--GO
--/****** Object:  Default [DF__RESTANQ__Monto__22951AFD]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RESTANQ] ADD  DEFAULT (0) FOR [Monto]
--GO
--/****** Object:  Default [DF__RESTANQ__Empresa__23893F36]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RESTANQ] ADD  DEFAULT (' ') FOR [Empresa]
--GO
--/****** Object:  Default [DF__RESTANQ__Cencos__247D636F]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RESTANQ] ADD  DEFAULT (0) FOR [Cencos]
--GO
--/****** Object:  Default [DF__RESTANQ__Tipo__257187A8]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RESTANQ] ADD  DEFAULT (0) FOR [Tipo]
--GO
--/****** Object:  Default [DF__RESTANQ__MontoO__2665ABE1]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RESTANQ] ADD  DEFAULT (0) FOR [MontoO]
--GO
--/****** Object:  Default [DF__RESTANQ__Cmapa__2759D01A]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RESTANQ] ADD  DEFAULT (' ') FOR [Cmapa]
--GO
/****** Object:  Default [DF__RESQUEMA__Jdd__414EAC47]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RESQUEMA] ADD  DEFAULT (0) FOR [Jdd]
GO
/****** Object:  Default [DF__RESQUEMA__Esquem__4242D080]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RESQUEMA] ADD  DEFAULT (0) FOR [Esquema]
GO
/****** Object:  Default [DF__RESQUEMA__Descri__4336F4B9]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RESQUEMA] ADD  DEFAULT (' ') FOR [Descrip]
GO
/****** Object:  Default [DF__RESQUEMA__Parte__442B18F2]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RESQUEMA] ADD  DEFAULT (0) FOR [Parte]
GO
/****** Object:  Default [DF__RESQUEMA__Largo__451F3D2B]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RESQUEMA] ADD  DEFAULT (0) FOR [Largo]
GO
/****** Object:  Default [DF__RESQUEMA__Conc__46136164]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RESQUEMA] ADD  DEFAULT (0) FOR [Conc]
GO
/****** Object:  Default [DF__RESQUEMA__Tx__4707859D]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RESQUEMA] ADD  DEFAULT (0) FOR [Tx]
GO
/****** Object:  Default [DF__RESQUEMA__DatoX__47FBA9D6]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RESQUEMA] ADD  DEFAULT (' ') FOR [DatoX]
GO
/****** Object:  Default [DF__RESQUEMA__Ty__48EFCE0F]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RESQUEMA] ADD  DEFAULT (0) FOR [Ty]
GO
/****** Object:  Default [DF__RESQUEMA__DatoY__49E3F248]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RESQUEMA] ADD  DEFAULT (' ') FOR [DatoY]
GO
/****** Object:  Default [DF__RESQUEMA__Resul__4AD81681]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RESQUEMA] ADD  DEFAULT (0) FOR [Resul]
GO
/****** Object:  Default [DF__RESQUEMA__DatoP__4BCC3ABA]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RESQUEMA] ADD  DEFAULT (' ') FOR [DatoP]
GO
/****** Object:  Default [DF__RESQUEMA__Deci__4CC05EF3]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RESQUEMA] ADD  DEFAULT (0) FOR [Deci]
GO
/****** Object:  Default [DF__RESQUEMA__Alinea__4DB4832C]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RESQUEMA] ADD  DEFAULT (0) FOR [Alinea]
GO
/****** Object:  Default [DF__RESQUEMA__Rellen__4EA8A765]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RESQUEMA] ADD  DEFAULT (0) FOR [Relleno]
GO
/****** Object:  Default [DF__RESQUEMA__Destin__4F9CCB9E]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RESQUEMA] ADD  DEFAULT (0) FOR [Destino]
GO
/****** Object:  Default [DF__RESQUEMA__Separa__642E9F87]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RESQUEMA] ADD  DEFAULT (' ') FOR [Separador]
GO
/****** Object:  Default [DF__RESQUEMA__Cdesde__6522C3C0]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RESQUEMA] ADD  DEFAULT ((0)) FOR [Cdesde]
GO
/****** Object:  Default [DF__RESQUEMA__Chasta__6616E7F9]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RESQUEMA] ADD  DEFAULT ((0)) FOR [Chasta]
GO
/****** Object:  Default [DF__RESQUEMA__ReemVa__670B0C32]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RESQUEMA] ADD  DEFAULT (' ') FOR [ReemVacio]
GO
/****** Object:  Default [DF__RESQUEMA__Trimea__67FF306B]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RESQUEMA] ADD  DEFAULT (' ') FOR [Trimear]
GO
/****** Object:  Default [DF__RESQUEMA__Separd__68F354A4]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RESQUEMA] ADD  DEFAULT (' ') FOR [Separdeci]
GO
/****** Object:  Default [DF__Rerrvalid__Fecha__37F02A96]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Rerrvalida] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(120)),(120))) FOR [Fecha_val]
GO
/****** Object:  Default [DF__Rerrvalid__Codig__38E44ECF]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Rerrvalida] ADD  DEFAULT (' ') FOR [Codigo]
GO
/****** Object:  Default [DF__Rerrvalid__Nombr__39D87308]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Rerrvalida] ADD  DEFAULT (' ') FOR [Nombre]
GO
/****** Object:  Default [DF__Rerrvalid__Orige__3ACC9741]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Rerrvalida] ADD  DEFAULT (' ') FOR [Origen]
GO
/****** Object:  Default [DF__Rerrvalid__Descr__3BC0BB7A]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Rerrvalida] ADD  DEFAULT (' ') FOR [Descrip]
GO
/****** Object:  Default [DF__Rerrvalid__Fecha__3CB4DFB3]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Rerrvalida] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [Fecha_pro]
GO
/****** Object:  Default [DF__Rerrvalida__Jdd__3DA903EC]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Rerrvalida] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__ReportesA__Nombr__3A0D7D32]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[ReportesAdp] ADD  DEFAULT (' ') FOR [Nombre]
GO
/****** Object:  Default [DF__ReportesA__Local__3B01A16B]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[ReportesAdp] ADD  DEFAULT (' ') FOR [LocalName]
GO
/****** Object:  Default [DF__ReportesAd__Tipo__3BF5C5A4]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[ReportesAdp] ADD  DEFAULT (' ') FOR [Tipo]
GO
/****** Object:  Default [DF__ReportesAd__Ames__3CE9E9DD]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[ReportesAdp] ADD  DEFAULT (' ') FOR [Ames]
GO
/****** Object:  Default [DF__ReportesA__Archi__3DDE0E16]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[ReportesAdp] ADD  DEFAULT (0x00000000) FOR [Archivo]
GO
/****** Object:  Default [DF__ReportesA__Usu_c__3ED2324F]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[ReportesAdp] ADD  DEFAULT (' ') FOR [Usu_cre]
GO
/****** Object:  Default [DF__ReportesA__Fecha__3FC65688]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[ReportesAdp] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [Fecha_cre]
GO
/****** Object:  Default [DF__ReportesA__Usu_e__40BA7AC1]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[ReportesAdp] ADD  DEFAULT (' ') FOR [Usu_envio]
GO
/****** Object:  Default [DF__ReportesA__Fecha__41AE9EFA]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[ReportesAdp] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [Fecha_env]
GO
/****** Object:  Default [DF__ReportesAdp__Jdd__42A2C333]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[ReportesAdp] ADD  DEFAULT ((0)) FOR [Jdd]
GO
--/****** Object:  Default [DF__RENCAPA__Curso__6DEC4894]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RENCAPA] ADD  DEFAULT (' ') FOR [Curso]
--GO
--/****** Object:  Default [DF__RENCAPA__Codigo__6EE06CCD]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RENCAPA] ADD  DEFAULT (' ') FOR [Codigo]
--GO
--/****** Object:  Default [DF__RENCAPA__Situ__6FD49106]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RENCAPA] ADD  DEFAULT (' ') FOR [Situ]
--GO
--/****** Object:  Default [DF__RENCAPA__Fecha_i__70C8B53F]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RENCAPA] ADD  DEFAULT (getdate()) FOR [Fecha_ini]
--GO
--/****** Object:  Default [DF__RENCAPA__Fecha_t__71BCD978]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RENCAPA] ADD  DEFAULT (getdate()) FOR [Fecha_ter]
--GO
--/****** Object:  Default [DF__RENCAPA__Tipo__72B0FDB1]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RENCAPA] ADD  DEFAULT (' ') FOR [Tipo]
--GO
--/****** Object:  Default [DF__RENCAPA__Jdd__73A521EA]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RENCAPA] ADD  DEFAULT (0) FOR [Jdd]
--GO
--/****** Object:  Default [DF__RENCAPA__Asisten__73FA27A5]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RENCAPA] ADD  DEFAULT (0) FOR [Asisten]
--GO
--/****** Object:  Default [DF__RENCAPA__Obs__74EE4BDE]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RENCAPA] ADD  DEFAULT (' ') FOR [Obs]
--GO
--/****** Object:  Default [DF__RENCAPA__Rut__35C7EB02]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RENCAPA] ADD  DEFAULT ('') FOR [Rut]
--GO
--/****** Object:  Default [DF__RENCAPA__Puntaje__05AEC38C]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RENCAPA] ADD  DEFAULT (0) FOR [Puntaje]
--GO
--/****** Object:  Default [DF__RENCAPA__Direcci__3FDB6521]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RENCAPA] ADD  DEFAULT (' ') FOR [Direccion]
--GO
--/****** Object:  Default [DF__RENCAPA__causen__40CF895A]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RENCAPA] ADD  DEFAULT (0) FOR [causen]
--GO
--/****** Object:  Default [DF__RENCAPA__lugar__41C3AD93]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RENCAPA] ADD  DEFAULT (' ') FOR [lugar]
--GO
--/****** Object:  Default [DF__RENCAPA__horas__42B7D1CC]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RENCAPA] ADD  DEFAULT (0) FOR [horas]
--GO
--/****** Object:  Default [DF__RENCAPA__ubicas__43ABF605]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RENCAPA] ADD  DEFAULT (' ') FOR [ubicas]
--GO
/****** Object:  Default [DF__REMPRESA__Empres__07020F21]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPRESA] ADD  DEFAULT (' ') FOR [Empresa]
GO
/****** Object:  Default [DF__REMPRESA__Nombre__07F6335A]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPRESA] ADD  DEFAULT (' ') FOR [Nombre]
GO
/****** Object:  Default [DF__REMPRESA__Rut__08EA5793]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPRESA] ADD  DEFAULT (' ') FOR [Rut]
GO
/****** Object:  Default [DF__REMPRESA__Direcc__09DE7BCC]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPRESA] ADD  DEFAULT (' ') FOR [Direccion]
GO
/****** Object:  Default [DF__REMPRESA__Fono__0AD2A005]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPRESA] ADD  DEFAULT (' ') FOR [Fono]
GO
/****** Object:  Default [DF__REMPRESA__Activi__0BC6C43E]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPRESA] ADD  DEFAULT (' ') FOR [Activi]
GO
/****** Object:  Default [DF__REMPRESA__Repleg__0CBAE877]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPRESA] ADD  DEFAULT (' ') FOR [Repleg]
GO
/****** Object:  Default [DF__REMPRESA__Coafil__0DAF0CB0]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPRESA] ADD  DEFAULT (0) FOR [Coafil]
GO
/****** Object:  Default [DF__REMPRESA__Mutual__0EA330E9]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPRESA] ADD  DEFAULT (' ') FOR [Mutual]
GO
/****** Object:  Default [DF__REMPRESA__Cacomp__0F975522]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPRESA] ADD  DEFAULT (' ') FOR [Cacomp]
GO
/****** Object:  Default [DF__REMPRESA__Fecha___108B795B]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPRESA] ADD  DEFAULT (getdate()) FOR [Fecha_ini]
GO
/****** Object:  Default [DF__REMPRESA__Ingbru__117F9D94]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPRESA] ADD  DEFAULT (' ') FOR [Ingbru]
GO
/****** Object:  Default [DF__REMPRESA__Diradm__1273C1CD]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPRESA] ADD  DEFAULT (' ') FOR [Diradm]
GO
/****** Object:  Default [DF__REMPRESA__Fax__1367E606]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPRESA] ADD  DEFAULT (' ') FOR [Fax]
GO
/****** Object:  Default [DF__REMPRESA__Email__145C0A3F]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPRESA] ADD  DEFAULT (' ') FOR [Email]
GO
/****** Object:  Default [DF__REMPRESA__RutRep__15502E78]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPRESA] ADD  DEFAULT (' ') FOR [RutRep]
GO
/****** Object:  Default [DF__REMPRESA__Comut__164452B1]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPRESA] ADD  DEFAULT (0) FOR [Comut]
GO
/****** Object:  Default [DF__REMPRESA__Jdd__173876EA]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPRESA] ADD  DEFAULT (0) FOR [Jdd]
GO
/****** Object:  Default [DF__REMPRESA__Giro__182C9B23]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPRESA] ADD  DEFAULT (' ') FOR [Giro]
GO
/****** Object:  Default [DF__REMPRESA__Junaeb__1920BF5C]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPRESA] ADD  DEFAULT (' ') FOR [Junaeb]
GO
/****** Object:  Default [DF__REMPRESA__mailRe__66A02C87]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPRESA] ADD  DEFAULT (' ') FOR [mailRegi]
GO
/****** Object:  Default [DF__REMPRESA__mailrr__679450C0]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPRESA] ADD  DEFAULT (' ') FOR [mailrrhh]
GO
/****** Object:  Default [DF__REMPRESA__Firman__6E414E4F]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPRESA] ADD  DEFAULT (' ') FOR [Firmante]
GO
/****** Object:  Default [DF__REMPRESA__AutRRH__36BC0F3B]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPRESA] ADD  DEFAULT ('') FOR [AutRRHH]
GO
/****** Object:  Default [DF__REMPRESA__Tipoem__06A2E7C5]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPRESA] ADD  DEFAULT ('0') FOR [Tipoemp]
GO
/****** Object:  Default [DF__REMPRESA__estatu__07970BFE]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPRESA] ADD  DEFAULT ('0') FOR [estatuto]
GO
/****** Object:  Default [DF__REMPRESA__CodAct__088B3037]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPRESA] ADD  DEFAULT ('0') FOR [CodAct]
GO
/****** Object:  Default [DF__REMPRESA__CalTra__097F5470]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPRESA] ADD  DEFAULT ('3') FOR [CalTrab]
GO
/****** Object:  Default [DF__REMPRESA__lusuar__0A7378A9]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPRESA] ADD  DEFAULT (' ') FOR [lusuario]
GO
/****** Object:  Default [DF__REMPRESA__lclave__0B679CE2]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPRESA] ADD  DEFAULT (' ') FOR [lclave]
GO
/****** Object:  Default [DF__REMPRESA__sisafp__45943E77]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPRESA] ADD  DEFAULT ('A') FOR [sisafp]
GO
/****** Object:  Default [DF__REMPRESA__PassWS__33408412]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPRESA] ADD  DEFAULT (' ') FOR [PassWSCon]
GO
/****** Object:  Default [DF__REMPRESA__UserWS__3434A84B]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPRESA] ADD  DEFAULT (' ') FOR [UserWSCon]
GO
/****** Object:  Default [DF__REMPRESA__Nit__3528CC84]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPRESA] ADD  DEFAULT (' ') FOR [Nit]
GO
/****** Object:  Default [DF__REMPRESA__Desc_a__361CF0BD]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPRESA] ADD  DEFAULT (' ') FOR [Desc_act]
GO
/****** Object:  Default [DF__REMPRESA__IdAdp__0268428D]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPRESA] ADD  DEFAULT (' ') FOR [IdAdp]
GO
/****** Object:  Default [DF__REMPRESA__ApvcPL__42CDABBC]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPRESA] ADD  DEFAULT ((0)) FOR [ApvcPL]
GO
/****** Object:  Default [DF__REMPRESA__ApvcPR__43C1CFF5]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPRESA] ADD  DEFAULT ((0)) FOR [ApvcPR]
GO
/****** Object:  Default [DF__REMPRESA__Nrores__7B1204DF]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPRESA] ADD  DEFAULT (' ') FOR [Nroresrd]
GO
/****** Object:  Default [DF__REMPLESH__Codigo__40F9A68C]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (' ') FOR [Codigo]
GO
/****** Object:  Default [DF__REMPLESH__Estado__41EDCAC5]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (' ') FOR [Estado]
GO
/****** Object:  Default [DF__REMPLESH__Tiprem__42E1EEFE]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (' ') FOR [Tiprem]
GO
/****** Object:  Default [DF__REMPLESH__Empres__43D61337]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (' ') FOR [Empresa]
GO
/****** Object:  Default [DF__REMPLESH__Nombre__44CA3770]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (' ') FOR [Nombre]
GO
/****** Object:  Default [DF__REMPLESH__Rut__45BE5BA9]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (' ') FOR [Rut]
GO
/****** Object:  Default [DF__REMPLESH__Sexo__46B27FE2]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (' ') FOR [Sexo]
GO
/****** Object:  Default [DF__REMPLESH__Fecha___47A6A41B]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (getdate()) FOR [Fecha_nac]
GO
/****** Object:  Default [DF__REMPLESH__Nacion__489AC854]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (0) FOR [Nacion]
GO
/****** Object:  Default [DF__REMPLESH__Est_ci__498EEC8D]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (' ') FOR [Est_civil]
GO
/****** Object:  Default [DF__REMPLESH__Estudi__4A8310C6]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (0) FOR [Estudios]
GO
/****** Object:  Default [DF__REMPLESH__Titulo__4B7734FF]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (0) FOR [Titulo]
GO
/****** Object:  Default [DF__REMPLESH__Clase__4C6B5938]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (0) FOR [Clase]
GO
/****** Object:  Default [DF__REMPLESH__Idioma__4D5F7D71]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (0) FOR [Idiomas]
GO
/****** Object:  Default [DF__REMPLESH__Autopa__4E53A1AA]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (' ') FOR [Autopas]
GO
/****** Object:  Default [DF__REMPLESH__Fecha___4F47C5E3]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (getdate()) FOR [Fecha_ing]
GO
/****** Object:  Default [DF__REMPLESH__Tipo_d__503BEA1C]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (0) FOR [Tipo_doc]
GO
/****** Object:  Default [DF__REMPLESH__Numdoc__51300E55]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (' ') FOR [Numdoc]
GO
/****** Object:  Default [DF__REMPLESH__Jefe__5224328E]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (' ') FOR [Jefe]
GO
/****** Object:  Default [DF__REMPLESH__Fecha___531856C7]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (getdate()) FOR [Fecha_ret]
GO
/****** Object:  Default [DF__REMPLESH__Moti_r__540C7B00]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (0) FOR [Moti_ret]
GO
/****** Object:  Default [DF__REMPLESH__Fecha___55009F39]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (getdate()) FOR [Fecha_xtr]
GO
/****** Object:  Default [DF__REMPLESH__Cencos__55F4C372]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (0) FOR [Cencos]
GO
/****** Object:  Default [DF__REMPLESH__Ticen__56E8E7AB]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (' ') FOR [Ticen]
GO
/****** Object:  Default [DF__REMPLESH__Catego__57DD0BE4]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (0) FOR [Catego]
GO
/****** Object:  Default [DF__REMPLESH__Clasif__58D1301D]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (0) FOR [Clasif]
GO
/****** Object:  Default [DF__REMPLESH__Ubica__59C55456]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (0) FOR [Ubica]
GO
/****** Object:  Default [DF__REMPLESH__Lpago__5AB9788F]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (0) FOR [Lpago]
GO
/****** Object:  Default [DF__REMPLESH__Cargo__5BAD9CC8]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (0) FOR [Cargo]
GO
/****** Object:  Default [DF__REMPLESH__Grado__5CA1C101]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (0) FOR [Grado]
GO
/****** Object:  Default [DF__REMPLESH__Divisi__5D95E53A]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (0) FOR [Division]
GO
/****** Object:  Default [DF__REMPLESH__Unidad__5E8A0973]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (0) FOR [Unidad]
GO
/****** Object:  Default [DF__REMPLESH__Horari__5F7E2DAC]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (0) FOR [Horario]
GO
/****** Object:  Default [DF__REMPLESH__Sit_la__607251E5]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (0) FOR [Sit_lab]
GO
/****** Object:  Default [DF__REMPLESH__Fpago__6166761E]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (0) FOR [Fpago]
GO
/****** Object:  Default [DF__REMPLESH__Banco__625A9A57]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (0) FOR [Banco]
GO
/****** Object:  Default [DF__REMPLESH__Ofiban__634EBE90]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (0) FOR [Ofiban]
GO
/****** Object:  Default [DF__REMPLESH__Cta_co__6442E2C9]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (' ') FOR [Cta_corr]
GO
/****** Object:  Default [DF__REMPLESH__Talla___65370702]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (' ') FOR [Talla_r]
GO
/****** Object:  Default [DF__REMPLESH__Talla___662B2B3B]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (' ') FOR [Talla_z]
GO
/****** Object:  Default [DF__REMPLESH__CARNET__671F4F74]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (' ') FOR [CARNET]
GO
/****** Object:  Default [DF__REMPLESH__Cod_af__681373AD]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (0) FOR [Cod_afp]
GO
/****** Object:  Default [DF__REMPLESH__Cod_si__690797E6]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (0) FOR [Cod_sin]
GO
/****** Object:  Default [DF__REMPLESH__Cod_is__69FBBC1F]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (0) FOR [Cod_isa]
GO
/****** Object:  Default [DF__REMPLESH__Fun__6AEFE058]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (' ') FOR [Fun]
GO
/****** Object:  Default [DF__REMPLESH__Fecha___6BE40491]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (getdate()) FOR [Fecha_isa]
GO
/****** Object:  Default [DF__REMPLESH__Cod_in__6CD828CA]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (0) FOR [Cod_ine]
GO
/****** Object:  Default [DF__REMPLESH__Cod_ca__6DCC4D03]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (0) FOR [Cod_caj]
GO
/****** Object:  Default [DF__REMPLESH__Zonafa__6EC0713C]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (0) FOR [Zonafa]
GO
/****** Object:  Default [DF__REMPLESH__Tramo___6FB49575]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (0) FOR [Tramo_car]
GO
/****** Object:  Default [DF__REMPLESH__Cod_re__70A8B9AE]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (0) FOR [Cod_reg]
GO
/****** Object:  Default [DF__REMPLESH__Jubila__719CDDE7]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (' ') FOR [Jubila]
GO
/****** Object:  Default [DF__REMPLESH__Fecha___72910220]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (getdate()) FOR [Fecha_vac]
GO
/****** Object:  Default [DF__REMPLESH__Vac_an__73852659]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (0) FOR [Vac_anre]
GO
/****** Object:  Default [DF__REMPLESH__Vac_fo__74794A92]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (' ') FOR [Vac_form]
GO
/****** Object:  Default [DF__REMPLESH__Vac_in__756D6ECB]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (0) FOR [Vac_ini]
GO
/****** Object:  Default [DF__REMPLESH__Vac_ba__76619304]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (0) FOR [Vac_base]
GO
/****** Object:  Default [DF__REMPLESH__Vac_dm__7755B73D]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (0) FOR [Vac_dmas]
GO
/****** Object:  Default [DF__REMPLESH__Vac_Pr__7849DB76]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (0) FOR [Vac_PrTo]
GO
/****** Object:  Default [DF__REMPLESH__Vac_Pr__793DFFAF]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (0) FOR [Vac_PrVe]
GO
/****** Object:  Default [DF__REMPLESH__Asigfa__7A3223E8]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (' ') FOR [Asigfam]
GO
/****** Object:  Default [DF__REMPLESH__Fecha___7B264821]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (getdate()) FOR [Fecha_lic]
GO
/****** Object:  Default [DF__REMPLESH__Anexo__7C1A6C5A]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (0) FOR [Anexo]
GO
/****** Object:  Default [DF__REMPLESH__SiAus__7D0E9093]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (' ') FOR [SiAus]
GO
/****** Object:  Default [DF__REMPLESH__Diastr__7E02B4CC]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (0) FOR [Diastr]
GO
/****** Object:  Default [DF__REMPLESH__Diasli__7EF6D905]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (0) FOR [Diasli]
GO
/****** Object:  Default [DF__REMPLESH__Sen_ni__7FEAFD3E]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (0) FOR [Sen_niv]
GO
/****** Object:  Default [DF__REMPLESH__Sen_fr__00DF2177]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (0) FOR [Sen_fra]
GO
/****** Object:  Default [DF__REMPLESH__TopeLe__01D345B0]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (0) FOR [TopeLey]
GO
/****** Object:  Default [DF__REMPLESH__GradoC__02C769E9]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (0) FOR [GradoC]
GO
/****** Object:  Default [DF__REMPLESH__Fecha___03BB8E22]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (getdate()) FOR [Fecha_gra]
GO
/****** Object:  Default [DF__REMPLESH__NumTar__04AFB25B]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (0) FOR [NumTar]
GO
/****** Object:  Default [DF__REMPLESH__L18566__05A3D694]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (' ') FOR [L18566]
GO
/****** Object:  Default [DF__REMPLESH__Lpacot__0697FACD]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (' ') FOR [Lpacot]
GO
/****** Object:  Default [DF__REMPLESH__Cuenta__078C1F06]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (0) FOR [Cuenta]
GO
/****** Object:  Default [DF__REMPLESH__RegPag__0880433F]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (' ') FOR [RegPag]
GO
/****** Object:  Default [DF__REMPLESH__Trapes__09746778]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (0) FOR [Trapes]
GO
/****** Object:  Default [DF__REMPLESH__Horas__0A688BB1]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (0) FOR [Horas]
GO
/****** Object:  Default [DF__REMPLESH__Licmed__0B5CAFEA]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (' ') FOR [Licmed]
GO
/****** Object:  Default [DF__REMPLESH__Trespd__0C50D423]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (' ') FOR [Trespd]
GO
/****** Object:  Default [DF__REMPLESH__Subsil__0D44F85C]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (' ') FOR [Subsil]
GO
/****** Object:  Default [DF__REMPLESH__reblim__0E391C95]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (' ') FOR [reblim]
GO
/****** Object:  Default [DF__REMPLESH__Manliq__0F2D40CE]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (' ') FOR [Manliq]
GO
/****** Object:  Default [DF__REMPLESH__Fecha___10216507]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (getdate()) FOR [Fecha_mod]
GO
/****** Object:  Default [DF__REMPLESH__Ames__11158940]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (' ') FOR [Ames]
GO
/****** Object:  Default [DF__REMPLESH__Creden__1209AD79]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (' ') FOR [Credenc]
GO
/****** Object:  Default [DF__REMPLESH__Jdd__12FDD1B2]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (0) FOR [Jdd]
GO
/****** Object:  Default [DF__REMPLESH__Fecha___13F1F5EB]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (getdate()) FOR [Fecha_sec]
GO
/****** Object:  Default [DF__REMPLESH__Tipcon__14E61A24]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (' ') FOR [Tipcon]
GO
/****** Object:  Default [DF__REMPLESH__Peri__15DA3E5D]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (' ') FOR [Peri]
GO
/****** Object:  Default [DF__REMPLESH__fecha___3AF6B473]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (' ') FOR [fecha_rea]
GO
/****** Object:  Default [DF__REMPLESH__Conven__711DBAFA]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (0) FOR [Convenio]
GO
/****** Object:  Default [DF__REMPLESH__Confid__7306036C]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (' ') FOR [Confid]
GO
/****** Object:  Default [DF__REMPLESH__Autori__77CAB889]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (' ') FOR [Autoriza]
GO
/****** Object:  Default [DF__REMPLESH__Cheres__070CFC19]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT ('N') FOR [Cheres]
GO
/****** Object:  Default [DF__REMPLESH__Chenum__08012052]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (0) FOR [Chenum]
GO
/****** Object:  Default [DF__REMPLESH__Cheval__08F5448B]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (0) FOR [Cheval]
GO
/****** Object:  Default [DF__REMPLESH__TICKET__2F1AED73]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT ('') FOR [TICKET]
GO
/****** Object:  Default [DF__REMPLESH__OCUPAC__300F11AC]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT ('') FOR [OCUPACION]
GO
/****** Object:  Default [DF__REMPLESH__esFpri__310335E5]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT ('') FOR [esFpri]
GO
/****** Object:  Default [DF__REMPLESH__Nficha__31F75A1E]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (0) FOR [Nficha]
GO
/****** Object:  Default [DF__REMPLESH__FechaA__0F382DC6]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (' ') FOR [FechaApvc]
GO
/****** Object:  Default [DF__REMPLESH__EstApv__102C51FF]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT ('N') FOR [EstApvc]
GO
/****** Object:  Default [DF__REMPLESH__SiCont__11207638]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT ('N') FOR [SiContra]
GO
/****** Object:  Default [DF__REMPLESH__Seccio__12149A71]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (0) FOR [Seccion]
GO
/****** Object:  Default [DF__REMPLESH__IndMon__1308BEAA]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (0) FOR [IndMonto]
GO
/****** Object:  Default [DF__REMPLESH__IndDia__13FCE2E3]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (0) FOR [IndDias]
GO
/****** Object:  Default [DF__REMPLESH__UserAD__14F1071C]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (' ') FOR [UserAD]
GO
/****** Object:  Default [DF__REMPLESH__Esreco__15E52B55]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT ('A') FOR [Esrecon]
GO
/****** Object:  Default [DF__REMPLESH__fecha___16D94F8E]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (' ') FOR [fecha_rct]
GO
/****** Object:  Default [DF__REMPLESH__CodOcu__17CD73C7]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (0) FOR [CodOcupa]
GO
/****** Object:  Default [DF__REMPLESH__Fpago2__18C19800]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (0) FOR [Fpago2]
GO
/****** Object:  Default [DF__REMPLESH__Banco2__19B5BC39]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (0) FOR [Banco2]
GO
/****** Object:  Default [DF__REMPLESH__Cta_co__1AA9E072]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (' ') FOR [Cta_corr2]
GO
/****** Object:  Default [DF__REMPLESH__Ffp__1B9E04AB]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (0) FOR [Ffp]
GO
/****** Object:  Default [DF__REMPLESH__Ffp2__1C9228E4]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (0) FOR [Ffp2]
GO
/****** Object:  Default [DF__REMPLESH__Ofiban__1D864D1D]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (0) FOR [Ofiban2]
GO
/****** Object:  Default [DF__REMPLESH__Evalua__1E7A7156]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (' ') FOR [Evaluador]
GO
/****** Object:  Default [DF__REMPLESH__Fechas__1F6E958F]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (' ') FOR [FechasJov]
GO
/****** Object:  Default [DF__REMPLESH__Fp2Ben__2062B9C8]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (0) FOR [Fp2Benef]
GO
/****** Object:  Default [DF__REMPLESH__Jornad__2156DE01]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT ('V') FOR [Jornada]
GO
/****** Object:  Default [DF__REMPLESH__JorCon__4A58F394]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT ('C') FOR [JorCont]
GO
/****** Object:  Default [DF__REMPLESH__Sdato2__4B4D17CD]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (' ') FOR [Sdato2]
GO
/****** Object:  Default [DF__REMPLESH__P5taex__14BBFCF2]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (' ') FOR [P5taex]
GO
/****** Object:  Default [DF__REMPLESH__Pafisp__15B0212B]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (' ') FOR [Pafisp]
GO
/****** Object:  Default [DF__REMPLESH__Pdisca__16A44564]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (' ') FOR [Pdisca]
GO
/****** Object:  Default [DF__REMPLESH__Pindom__1798699D]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (' ') FOR [Pindom]
GO
/****** Object:  Default [DF__REMPLESH__Ping5t__188C8DD6]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (' ') FOR [Ping5t]
GO
/****** Object:  Default [DF__REMPLESH__Pjortm__1980B20F]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (' ') FOR [Pjortm]
GO
/****** Object:  Default [DF__REMPLESH__PlanOS__1A74D648]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT ((0)) FOR [PlanOS]
GO
/****** Object:  Default [DF__REMPLESH__Pmadre__1B68FA81]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (' ') FOR [Pmadres]
GO
/****** Object:  Default [DF__REMPLESH__PorcUn__1C5D1EBA]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT ((0)) FOR [PorcUnif]
GO
/****** Object:  Default [DF__REMPLESH__PreSal__1D5142F3]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT ((0)) FOR [PreSalud]
GO
/****** Object:  Default [DF__REMPLESH__Psujhn__1E45672C]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (' ') FOR [Psujhn]
GO
/****** Object:  Default [DF__REMPLESH__Cta_in__1F398B65]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (' ') FOR [Cta_inte2]
GO
/****** Object:  Default [DF__REMPLESH__Cta_in__202DAF9E]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (' ') FOR [Cta_inter]
GO
/****** Object:  Default [DF__REMPLESH__Dir_tr__2121D3D7]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT ((0)) FOR [Dir_trab]
GO
/****** Object:  Default [DF__REMPLESH__Fecha___2215F810]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(120)),(120))) FOR [Fecha_ult]
GO
/****** Object:  Default [DF__REMPLESH__Premin__230A1C49]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (' ') FOR [Premint]
GO
/****** Object:  Default [DF__REMPLESH__Cod_dn__23FE4082]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT ((0)) FOR [Cod_dni]
GO
/****** Object:  Default [DF__REMPLESH__Antica__24F264BB]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT ((0)) FOR [Antica]
GO
/****** Object:  Default [DF__REMPLESH__APC__25E688F4]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (' ') FOR [APC]
GO
/****** Object:  Default [DF__REMPLESH__AutFir__26DAAD2D]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (' ') FOR [AutFirmar]
GO
/****** Object:  Default [DF__REMPLESH__Bloque__27CED166]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (' ') FOR [Bloques]
GO
/****** Object:  Default [DF__REMPLESH__Celula__28C2F59F]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (' ') FOR [Celular]
GO
/****** Object:  Default [DF__REMPLESH__Direcc__29B719D8]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (' ') FOR [Direccion]
GO
/****** Object:  Default [DF__REMPLESH__Fecha___2AAB3E11]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (' ') FOR [Fecha_afp]
GO
/****** Object:  Default [DF__REMPLESH__Fono__2B9F624A]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (' ') FOR [Fono]
GO
/****** Object:  Default [DF__REMPLESH__Ktim__2C938683]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT ((0)) FOR [Ktim]
GO
/****** Object:  Default [DF__REMPLESH__Monto___2D87AABC]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT ((0)) FOR [Monto_red]
GO
/****** Object:  Default [DF__REMPLESH__Monto___2E7BCEF5]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT ((0)) FOR [Monto_sgr]
GO
/****** Object:  Default [DF__REMPLESH__Numafp__2F6FF32E]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (' ') FOR [Numafp]
GO
/****** Object:  Default [DF__REMPLESH__pmail__30641767]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (' ') FOR [pmail]
GO
/****** Object:  Default [DF__REMPLESH__Renmax__31583BA0]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT ((0)) FOR [Renmax]
GO
/****** Object:  Default [DF__REMPLESH__Sdato__324C5FD9]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (' ') FOR [Sdato]
GO
/****** Object:  Default [DF__REMPLESH__PingSt__633A7B4E]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT (' ') FOR [PingSt]
GO
/****** Object:  Default [DF__REMPLESH__Srsico__764D4FC2]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT ((0)) FOR [Srsicoss]
GO
/****** Object:  Default [DF__REMPLESH__Ccsico__774173FB]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLESH] ADD  DEFAULT ((0)) FOR [Ccsicoss]
GO
/****** Object:  Default [DF__REMPLES__Codigo__5BE2A6F2]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (' ') FOR [Codigo]
GO
/****** Object:  Default [DF__REMPLES__Estado__5CD6CB2B]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (' ') FOR [Estado]
GO
/****** Object:  Default [DF__REMPLES__Tiprem__5DCAEF64]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (' ') FOR [Tiprem]
GO
/****** Object:  Default [DF__REMPLES__Empresa__5EBF139D]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (' ') FOR [Empresa]
GO
/****** Object:  Default [DF__REMPLES__Nombre__5FB337D6]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (' ') FOR [Nombre]
GO
/****** Object:  Default [DF__REMPLES__Rut__60A75C0F]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (' ') FOR [Rut]
GO
/****** Object:  Default [DF__REMPLES__Sexo__619B8048]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (' ') FOR [Sexo]
GO
/****** Object:  Default [DF__REMPLES__Direcci__628FA481]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (' ') FOR [Direccion]
GO
/****** Object:  Default [DF__REMPLES__Fono__6383C8BA]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (' ') FOR [Fono]
GO
/****** Object:  Default [DF__REMPLES__Fecha_n__6477ECF3]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (getdate()) FOR [Fecha_nac]
GO
/****** Object:  Default [DF__REMPLES__Nacion__656C112C]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (0) FOR [Nacion]
GO
/****** Object:  Default [DF__REMPLES__Celular__66603565]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (' ') FOR [Celular]
GO
/****** Object:  Default [DF__REMPLES__Est_civ__6754599E]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (' ') FOR [Est_civil]
GO
/****** Object:  Default [DF__REMPLES__Estudio__68487DD7]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (0) FOR [Estudios]
GO
/****** Object:  Default [DF__REMPLES__Titulo__693CA210]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (0) FOR [Titulo]
GO
/****** Object:  Default [DF__REMPLES__Clase__6A30C649]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (0) FOR [Clase]
GO
/****** Object:  Default [DF__REMPLES__Idiomas__6B24EA82]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (0) FOR [Idiomas]
GO
/****** Object:  Default [DF__REMPLES__Renmax__6C190EBB]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (0) FOR [Renmax]
GO
/****** Object:  Default [DF__REMPLES__Autopas__6D0D32F4]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (' ') FOR [Autopas]
GO
/****** Object:  Default [DF__REMPLES__pmail__6E01572D]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (' ') FOR [pmail]
GO
/****** Object:  Default [DF__REMPLES__Fecha_i__6EF57B66]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (getdate()) FOR [Fecha_ing]
GO
/****** Object:  Default [DF__REMPLES__Tipo_do__6FE99F9F]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (0) FOR [Tipo_doc]
GO
/****** Object:  Default [DF__REMPLES__Numdoc__70DDC3D8]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (' ') FOR [Numdoc]
GO
/****** Object:  Default [DF__REMPLES__Jefe__71D1E811]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (' ') FOR [Jefe]
GO
/****** Object:  Default [DF__REMPLES__Fecha_r__72C60C4A]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (getdate()) FOR [Fecha_ret]
GO
/****** Object:  Default [DF__REMPLES__Moti_re__73BA3083]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (0) FOR [Moti_ret]
GO
/****** Object:  Default [DF__REMPLES__Fecha_x__74AE54BC]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (getdate()) FOR [Fecha_xtr]
GO
/****** Object:  Default [DF__REMPLES__Cencos__75A278F5]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (0) FOR [Cencos]
GO
/****** Object:  Default [DF__REMPLES__Ticen__76969D2E]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (' ') FOR [Ticen]
GO
/****** Object:  Default [DF__REMPLES__Catego__778AC167]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (0) FOR [Catego]
GO
/****** Object:  Default [DF__REMPLES__Clasif__787EE5A0]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (0) FOR [Clasif]
GO
/****** Object:  Default [DF__REMPLES__Ubica__797309D9]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (0) FOR [Ubica]
GO
/****** Object:  Default [DF__REMPLES__Lpago__7A672E12]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (0) FOR [Lpago]
GO
/****** Object:  Default [DF__REMPLES__Cargo__7B5B524B]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (0) FOR [Cargo]
GO
/****** Object:  Default [DF__REMPLES__Grado__7C4F7684]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (0) FOR [Grado]
GO
/****** Object:  Default [DF__REMPLES__Divisio__7D439ABD]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (0) FOR [Division]
GO
/****** Object:  Default [DF__REMPLES__Unidad__7E37BEF6]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (0) FOR [Unidad]
GO
/****** Object:  Default [DF__REMPLES__Horario__7F2BE32F]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (0) FOR [Horario]
GO
/****** Object:  Default [DF__REMPLES__Sit_lab__00200768]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (0) FOR [Sit_lab]
GO
/****** Object:  Default [DF__REMPLES__Fpago__01142BA1]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (0) FOR [Fpago]
GO
/****** Object:  Default [DF__REMPLES__Banco__02084FDA]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (0) FOR [Banco]
GO
/****** Object:  Default [DF__REMPLES__Ofiban__02FC7413]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (0) FOR [Ofiban]
GO
/****** Object:  Default [DF__REMPLES__Cta_cor__03F0984C]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (' ') FOR [Cta_corr]
GO
/****** Object:  Default [DF__REMPLES__Talla_r__04E4BC85]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (' ') FOR [Talla_r]
GO
/****** Object:  Default [DF__REMPLES__Talla_z__05D8E0BE]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (' ') FOR [Talla_z]
GO
/****** Object:  Default [DF__REMPLES__CARNET__06CD04F7]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (' ') FOR [CARNET]
GO
/****** Object:  Default [DF__REMPLES__Cod_afp__07C12930]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (0) FOR [Cod_afp]
GO
/****** Object:  Default [DF__REMPLES__Numafp__08B54D69]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (' ') FOR [Numafp]
GO
/****** Object:  Default [DF__REMPLES__Fecha_a__09A971A2]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (getdate()) FOR [Fecha_afp]
GO
/****** Object:  Default [DF__REMPLES__Cod_sin__0A9D95DB]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (0) FOR [Cod_sin]
GO
/****** Object:  Default [DF__REMPLES__Cod_isa__0B91BA14]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (0) FOR [Cod_isa]
GO
/****** Object:  Default [DF__REMPLES__Fun__0C85DE4D]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (' ') FOR [Fun]
GO
/****** Object:  Default [DF__REMPLES__Fecha_i__0D7A0286]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (getdate()) FOR [Fecha_isa]
GO
/****** Object:  Default [DF__REMPLES__Cod_ine__0E6E26BF]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (0) FOR [Cod_ine]
GO
/****** Object:  Default [DF__REMPLES__Cod_caj__0F624AF8]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (0) FOR [Cod_caj]
GO
/****** Object:  Default [DF__REMPLES__Zonafa__10566F31]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (0) FOR [Zonafa]
GO
/****** Object:  Default [DF__REMPLES__Tramo_c__114A936A]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (0) FOR [Tramo_car]
GO
/****** Object:  Default [DF__REMPLES__Cod_reg__123EB7A3]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (0) FOR [Cod_reg]
GO
/****** Object:  Default [DF__REMPLES__Jubila__1332DBDC]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (' ') FOR [Jubila]
GO
/****** Object:  Default [DF__REMPLES__Fecha_v__14270015]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (getdate()) FOR [Fecha_vac]
GO
/****** Object:  Default [DF__REMPLES__Vac_anr__151B244E]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (0) FOR [Vac_anre]
GO
/****** Object:  Default [DF__REMPLES__Vac_dia__160F4887]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (0) FOR [Vac_dias]
GO
/****** Object:  Default [DF__REMPLES__Vac_for__17036CC0]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (' ') FOR [Vac_form]
GO
/****** Object:  Default [DF__REMPLES__Vac_ini__17F790F9]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (0) FOR [Vac_ini]
GO
/****** Object:  Default [DF__REMPLES__Vac_bas__18EBB532]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (0) FOR [Vac_base]
GO
/****** Object:  Default [DF__REMPLES__Vac_dma__19DFD96B]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (0) FOR [Vac_dmas]
GO
/****** Object:  Default [DF__REMPLES__Vac_PrT__1AD3FDA4]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (0) FOR [Vac_PrTo]
GO
/****** Object:  Default [DF__REMPLES__Vac_PrV__1BC821DD]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (0) FOR [Vac_PrVe]
GO
/****** Object:  Default [DF__REMPLES__Asigfam__1CBC4616]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (' ') FOR [Asigfam]
GO
/****** Object:  Default [DF__REMPLES__Fecha_l__1DB06A4F]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (getdate()) FOR [Fecha_lic]
GO
/****** Object:  Default [DF__REMPLES__Anexo__1EA48E88]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (0) FOR [Anexo]
GO
/****** Object:  Default [DF__REMPLES__Apc__1F98B2C1]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (' ') FOR [Apc]
GO
/****** Object:  Default [DF__REMPLES__SiAus__208CD6FA]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (' ') FOR [SiAus]
GO
/****** Object:  Default [DF__REMPLES__Monto_r__2180FB33]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (0) FOR [Monto_red]
GO
/****** Object:  Default [DF__REMPLES__Monto_s__22751F6C]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (0) FOR [Monto_sgr]
GO
/****** Object:  Default [DF__REMPLES__Ktim__236943A5]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (0) FOR [Ktim]
GO
/****** Object:  Default [DF__REMPLES__Antica__245D67DE]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (0) FOR [Antica]
GO
/****** Object:  Default [DF__REMPLES__Diastr__25518C17]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (0) FOR [Diastr]
GO
/****** Object:  Default [DF__REMPLES__Diasli__2645B050]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (0) FOR [Diasli]
GO
/****** Object:  Default [DF__REMPLES__Sen_niv__2739D489]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (0) FOR [Sen_niv]
GO
/****** Object:  Default [DF__REMPLES__Sen_fra__282DF8C2]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (0) FOR [Sen_fra]
GO
/****** Object:  Default [DF__REMPLES__Bloques__29221CFB]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (' ') FOR [Bloques]
GO
/****** Object:  Default [DF__REMPLES__TopeLey__2A164134]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (0) FOR [TopeLey]
GO
/****** Object:  Default [DF__REMPLES__GradoC__2B0A656D]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (0) FOR [GradoC]
GO
/****** Object:  Default [DF__REMPLES__Fecha_g__2BFE89A6]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (getdate()) FOR [Fecha_gra]
GO
/****** Object:  Default [DF__REMPLES__NumTar__2CF2ADDF]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (0) FOR [NumTar]
GO
/****** Object:  Default [DF__REMPLES__L18566__2DE6D218]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (' ') FOR [L18566]
GO
/****** Object:  Default [DF__REMPLES__Lpacot__2EDAF651]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (' ') FOR [Lpacot]
GO
/****** Object:  Default [DF__REMPLES__Cuenta__2FCF1A8A]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (0) FOR [Cuenta]
GO
/****** Object:  Default [DF__REMPLES__RegPag__30C33EC3]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (' ') FOR [RegPag]
GO
/****** Object:  Default [DF__REMPLES__Trapes__31B762FC]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (0) FOR [Trapes]
GO
/****** Object:  Default [DF__REMPLES__Horas__32AB8735]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (0) FOR [Horas]
GO
/****** Object:  Default [DF__REMPLES__Licmed__339FAB6E]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (' ') FOR [Licmed]
GO
/****** Object:  Default [DF__REMPLES__Trespd__3493CFA7]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (' ') FOR [Trespd]
GO
/****** Object:  Default [DF__REMPLES__Subsil__3587F3E0]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (' ') FOR [Subsil]
GO
/****** Object:  Default [DF__REMPLES__reblim__367C1819]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (' ') FOR [reblim]
GO
/****** Object:  Default [DF__REMPLES__Manliq__37703C52]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (' ') FOR [Manliq]
GO
/****** Object:  Default [DF__REMPLES__Fecha_m__3864608B]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (getdate()) FOR [Fecha_mod]
GO
/****** Object:  Default [DF__REMPLES__Ames__395884C4]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (' ') FOR [Ames]
GO
/****** Object:  Default [DF__REMPLES__Sdato__3A4CA8FD]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (' ') FOR [Sdato]
GO
/****** Object:  Default [DF__REMPLES__Credenc__3B40CD36]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (' ') FOR [Credenc]
GO
/****** Object:  Default [DF__REMPLES__Jdd__3C34F16F]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (0) FOR [Jdd]
GO
/****** Object:  Default [DF__REMPLES__Fecha_s__3D2915A8]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (getdate()) FOR [Fecha_sec]
GO
/****** Object:  Default [DF__REMPLES__Tipcon__3E1D39E1]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (' ') FOR [Tipcon]
GO
/****** Object:  Default [DF__REMPLES__Peri__3F115E1A]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (' ') FOR [Peri]
GO
/****** Object:  Default [DF__REMPLES__fecha_r__3A02903A]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (' ') FOR [fecha_rea]
GO
/****** Object:  Default [DF__REMPLES__Conveni__702996C1]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (0) FOR [Convenio]
GO
/****** Object:  Default [DF__REMPLES__Confid__7211DF33]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (' ') FOR [Confid]
GO
/****** Object:  Default [DF__REMPLES__Autoriz__76D69450]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (' ') FOR [Autoriza]
GO
/****** Object:  Default [DF__REMPLES__Cheres__04308F6E]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT ('N') FOR [Cheres]
GO
/****** Object:  Default [DF__REMPLES__Chenum__0524B3A7]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (0) FOR [Chenum]
GO
/****** Object:  Default [DF__REMPLES__Cheval__0618D7E0]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (0) FOR [Cheval]
GO
/****** Object:  Default [DF__REMPLES__TICKET__2B4A5C8F]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT ('') FOR [TICKET]
GO
/****** Object:  Default [DF__REMPLES__OCUPACI__2C3E80C8]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT ('') FOR [OCUPACION]
GO
/****** Object:  Default [DF__REMPLES__esFpri__2D32A501]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT ('') FOR [esFpri]
GO
/****** Object:  Default [DF__REMPLES__Nficha__2E26C93A]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (0) FOR [Nficha]
GO
/****** Object:  Default [DF__REMPLES__FechaSj__5E94F66B]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (' ') FOR [FechaSjov]
GO
/****** Object:  Default [DF__REMPLES__FechaAp__5F891AA4]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (' ') FOR [FechaApvc]
GO
/****** Object:  Default [DF__REMPLES__EstApvc__607D3EDD]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT ('N') FOR [EstApvc]
GO
/****** Object:  Default [DF__REMPLES__IndMont__61716316]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (0) FOR [IndMonto]
GO
/****** Object:  Default [DF__REMPLES__IndDias__6265874F]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (0) FOR [IndDias]
GO
/****** Object:  Default [DF__REMPLES__Seccion__6359AB88]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (0) FOR [Seccion]
GO
/****** Object:  Default [DF__REMPLES__UserAD__644DCFC1]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (' ') FOR [UserAD]
GO
/****** Object:  Default [DF__REMPLES__Esrecon__6541F3FA]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT ('A') FOR [Esrecon]
GO
/****** Object:  Default [DF__REMPLES__SiContr__66361833]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT ('N') FOR [SiContra]
GO
/****** Object:  Default [DF__REMPLES__fecha_r__672A3C6C]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (' ') FOR [fecha_rct]
GO
/****** Object:  Default [DF__REMPLES__CodOcup__681E60A5]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (0) FOR [CodOcupa]
GO
/****** Object:  Default [DF__REMPLES__Fpago2__691284DE]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (0) FOR [Fpago2]
GO
/****** Object:  Default [DF__REMPLES__Banco2__6A06A917]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (0) FOR [Banco2]
GO
/****** Object:  Default [DF__REMPLES__Cta_cor__6AFACD50]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (' ') FOR [Cta_corr2]
GO
/****** Object:  Default [DF__REMPLES__Ffp__6BEEF189]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (0) FOR [Ffp]
GO
/****** Object:  Default [DF__REMPLES__Ffp2__6CE315C2]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (0) FOR [Ffp2]
GO
/****** Object:  Default [DF__REMPLES__Ofiban2__6DD739FB]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (0) FOR [Ofiban2]
GO
/****** Object:  Default [DF__REMPLES__Fp2Bene__6ECB5E34]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (0) FOR [Fp2Benef]
GO
/****** Object:  Default [DF__REMPLES__Evaluad__6FBF826D]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (' ') FOR [Evaluador]
GO
/****** Object:  Default [DF__REMPLES__Jornada__70B3A6A6]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT ('V') FOR [Jornada]
GO
/****** Object:  Default [DF__REMPLES__Sdato2__4870AB22]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (' ') FOR [Sdato2]
GO
/****** Object:  Default [DF__REMPLES__JorCont__4964CF5B]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT ('C') FOR [JorCont]
GO
/****** Object:  Default [DF__REMPLES__P5taex__039170F0]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (' ') FOR [P5taex]
GO
/****** Object:  Default [DF__REMPLES__Pafisp__04859529]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (' ') FOR [Pafisp]
GO
/****** Object:  Default [DF__REMPLES__Pdisca__0579B962]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (' ') FOR [Pdisca]
GO
/****** Object:  Default [DF__REMPLES__Pindom__066DDD9B]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (' ') FOR [Pindom]
GO
/****** Object:  Default [DF__REMPLES__Ping5t__076201D4]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (' ') FOR [Ping5t]
GO
/****** Object:  Default [DF__REMPLES__Pjortm__0856260D]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (' ') FOR [Pjortm]
GO
/****** Object:  Default [DF__REMPLES__PlanOS__094A4A46]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT ((0)) FOR [PlanOS]
GO
/****** Object:  Default [DF__REMPLES__Pmadres__0A3E6E7F]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (' ') FOR [Pmadres]
GO
/****** Object:  Default [DF__REMPLES__PorcUni__0B3292B8]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT ((0)) FOR [PorcUnif]
GO
/****** Object:  Default [DF__REMPLES__PreSalu__0C26B6F1]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT ((0)) FOR [PreSalud]
GO
/****** Object:  Default [DF__REMPLES__Psujhn__0D1ADB2A]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (' ') FOR [Psujhn]
GO
/****** Object:  Default [DF__REMPLES__Cta_int__0E0EFF63]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (' ') FOR [Cta_inte2]
GO
/****** Object:  Default [DF__REMPLES__Cta_int__0F03239C]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (' ') FOR [Cta_inter]
GO
/****** Object:  Default [DF__REMPLES__Dir_tra__0FF747D5]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT ((0)) FOR [Dir_trab]
GO
/****** Object:  Default [DF__REMPLES__Fecha_u__10EB6C0E]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(120)),(120))) FOR [Fecha_ult]
GO
/****** Object:  Default [DF__REMPLES__Premint__11DF9047]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (' ') FOR [Premint]
GO
/****** Object:  Default [DF__REMPLES__Cod_dni__12D3B480]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT ((0)) FOR [Cod_dni]
GO
/****** Object:  Default [DF__REMPLES__AutFirm__13C7D8B9]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (' ') FOR [AutFirmar]
GO
/****** Object:  Default [DF__REMPLES__PingSt__5C8D7DBF]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (' ') FOR [PingSt]
GO
/****** Object:  Default [DF__REMPLES__Cargo_e__6ADB9D16]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT ((0)) FOR [Cargo_est]
GO
/****** Object:  Default [DF__REMPLES__Srsicos__7370E317]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT ((0)) FOR [Srsicoss]
GO
/****** Object:  Default [DF__REMPLES__Ccsicos__74650750]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT ((0)) FOR [Ccsicoss]
GO
--/****** Object:  Default [DF__REMPLEPER__Rut__03FB8544]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[REMPLEPER] ADD  DEFAULT (' ') FOR [Rut]
--GO
--/****** Object:  Default [DF__REMPLEPER__Empre__04EFA97D]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[REMPLEPER] ADD  DEFAULT (' ') FOR [Empresa]
--GO
--/****** Object:  Default [DF__REMPLEPER__Ktim__05E3CDB6]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[REMPLEPER] ADD  DEFAULT (0) FOR [Ktim]
--GO
--/****** Object:  Default [DF__REMPLEPER__Ksip__06D7F1EF]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[REMPLEPER] ADD  DEFAULT (0) FOR [Ksip]
--GO
--/****** Object:  Default [DF__REMPLEPER__ksaim__07CC1628]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[REMPLEPER] ADD  DEFAULT (0) FOR [ksaim]
--GO
--/****** Object:  Default [DF__REMPLEPER__kspue__08C03A61]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[REMPLEPER] ADD  DEFAULT (0) FOR [kspue]
--GO
--/****** Object:  Default [DF__REMPLEPER__kafes__09B45E9A]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[REMPLEPER] ADD  DEFAULT (0) FOR [kafesec]
--GO
--/****** Object:  Default [DF__REMPLEPER__kgl25__0AA882D3]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[REMPLEPER] ADD  DEFAULT (0) FOR [kgl25]
--GO
--/****** Object:  Default [DF__REMPLEPER__Jdd__0B9CA70C]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[REMPLEPER] ADD  DEFAULT (0) FOR [Jdd]
--GO
/****** Object:  Default [DF__remplech__Codigo__2235F3A1]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[remplech] ADD  DEFAULT (' ') FOR [Codigo]
GO
/****** Object:  Default [DF__remplech__Ames__232A17DA]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[remplech] ADD  DEFAULT (' ') FOR [Ames]
GO
/****** Object:  Default [DF__remplech__Codcam__241E3C13]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[remplech] ADD  DEFAULT ((0)) FOR [Codcam]
GO
/****** Object:  Default [DF__remplech__ValorN__2512604C]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[remplech] ADD  DEFAULT ((0)) FOR [ValorN]
GO
/****** Object:  Default [DF__remplech__ValorF__26068485]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[remplech] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(120)),(120))) FOR [ValorF]
GO
/****** Object:  Default [DF__remplech__ValorC__26FAA8BE]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[remplech] ADD  DEFAULT (' ') FOR [ValorC]
GO
/****** Object:  Default [DF__remplech__ValorM__27EECCF7]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[remplech] ADD  DEFAULT (' ') FOR [ValorM]
GO
/****** Object:  Default [DF__remplech__Jdd__28E2F130]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[remplech] ADD  DEFAULT ((0)) FOR [Jdd]
GO
--/****** Object:  Default [DF__REMPLEC__Codigo__3BFFE745]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[REMPLEC] ADD  DEFAULT (' ') FOR [Codigo]
--GO
--/****** Object:  Default [DF__REMPLEC__Codcam__3CF40B7E]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[REMPLEC] ADD  DEFAULT (0) FOR [Codcam]
--GO
--/****** Object:  Default [DF__REMPLEC__ValorN__3DE82FB7]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[REMPLEC] ADD  DEFAULT (0) FOR [ValorN]
--GO
--/****** Object:  Default [DF__REMPLEC__ValorF__3EDC53F0]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[REMPLEC] ADD  DEFAULT (getdate()) FOR [ValorF]
--GO
--/****** Object:  Default [DF__REMPLEC__ValorC__3FD07829]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[REMPLEC] ADD  DEFAULT (' ') FOR [ValorC]
--GO
--/****** Object:  Default [DF__REMPLEC__Jdd__40C49C62]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[REMPLEC] ADD  DEFAULT (0) FOR [Jdd]
--GO
--/****** Object:  Default [DF__REMPLEC__ValorM__38A457AD]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[REMPLEC] ADD  DEFAULT ('') FOR [ValorM]
--GO
--/****** Object:  Default [DF__REMPLEC__Fecha_u__029D4CB7]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[REMPLEC] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(120)),(120))) FOR [Fecha_ult]
--GO
/****** Object:  Default [DF__REMPLAN__Codigo__4B973090]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLAN] ADD  DEFAULT (' ') FOR [Codigo]
GO
/****** Object:  Default [DF__REMPLAN__Nombre__4C8B54C9]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLAN] ADD  DEFAULT (' ') FOR [Nombre]
GO
/****** Object:  Default [DF__REMPLAN__Rut__4D7F7902]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLAN] ADD  DEFAULT (' ') FOR [Rut]
GO
/****** Object:  Default [DF__REMPLAN__Cargo__4E739D3B]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLAN] ADD  DEFAULT (0) FOR [Cargo]
GO
/****** Object:  Default [DF__REMPLAN__Direcci__4F67C174]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLAN] ADD  DEFAULT (' ') FOR [Direccion]
GO
/****** Object:  Default [DF__REMPLAN__Fono__505BE5AD]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLAN] ADD  DEFAULT (' ') FOR [Fono]
GO
/****** Object:  Default [DF__REMPLAN__Fecha_n__515009E6]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLAN] ADD  DEFAULT (getdate()) FOR [Fecha_nac]
GO
/****** Object:  Default [DF__REMPLAN__Fecha_i__52442E1F]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLAN] ADD  DEFAULT (getdate()) FOR [Fecha_ing]
GO
/****** Object:  Default [DF__REMPLAN__Fecha_r__53385258]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLAN] ADD  DEFAULT (getdate()) FOR [Fecha_ret]
GO
/****** Object:  Default [DF__REMPLAN__Moti_re__542C7691]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLAN] ADD  DEFAULT (0) FOR [Moti_ret]
GO
/****** Object:  Default [DF__REMPLAN__Obs__55209ACA]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLAN] ADD  DEFAULT (' ') FOR [Obs]
GO
/****** Object:  Default [DF__REMPLAN__Jdd__5614BF03]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLAN] ADD  DEFAULT (0) FOR [Jdd]
GO
/****** Object:  Default [DF__REMPLAN__Cencos__3726238F]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLAN] ADD  DEFAULT (0) FOR [Cencos]
GO
/****** Object:  Default [DF__REMPLAN__Empresa__381A47C8]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLAN] ADD  DEFAULT (' ') FOR [Empresa]
GO
/****** Object:  Default [DF__REMPLAN__estado__224B023A]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLAN] ADD  DEFAULT ('N') FOR [estado]
GO
/****** Object:  Default [DF__REMPLAN__Ocupaci__233F2673]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLAN] ADD  DEFAULT (' ') FOR [Ocupacion]
GO
/****** Object:  Default [DF__REMPLAN__Detalle__469E3CA0]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[REMPLAN] ADD  DEFAULT (' ') FOR [Detalle]
GO
--/****** Object:  Default [DF__RECORDAR__Jdd__5B0E7E4A]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RECORDAR] ADD  DEFAULT (0) FOR [Jdd]
--GO
--/****** Object:  Default [DF__RECORDAR__Fecha___5C02A283]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RECORDAR] ADD  DEFAULT (getdate()) FOR [Fecha_cre]
--GO
--/****** Object:  Default [DF__RECORDAR__Usuari__5CF6C6BC]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RECORDAR] ADD  DEFAULT (' ') FOR [Usuario]
--GO
--/****** Object:  Default [DF__RECORDAR__Titulo__5DEAEAF5]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RECORDAR] ADD  DEFAULT (' ') FOR [Titulo]
--GO
--/****** Object:  Default [DF__RECORDAR__Destin__5EDF0F2E]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RECORDAR] ADD  DEFAULT (' ') FOR [Destino]
--GO
--/****** Object:  Default [DF__RECORDAR__Grupos__5FD33367]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RECORDAR] ADD  DEFAULT (' ') FOR [Grupos]
--GO
--/****** Object:  Default [DF__RECORDAR__Restri__60C757A0]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RECORDAR] ADD  DEFAULT (' ') FOR [Restrin]
--GO
--/****** Object:  Default [DF__RECORDAR__Fecha___61BB7BD9]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RECORDAR] ADD  DEFAULT (getdate()) FOR [Fecha_act]
--GO
--/****** Object:  Default [DF__RECORDAR__Color__62AFA012]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RECORDAR] ADD  DEFAULT (' ') FOR [Color]
--GO
--/****** Object:  Default [DF__RECORDAR__Dato__63A3C44B]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RECORDAR] ADD  DEFAULT (' ') FOR [Dato]
--GO
/****** Object:  Default [DF__Rdonatario__Cuit__2EF0D041]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Rdonatario] ADD  DEFAULT (' ') FOR [Cuit]
GO
/****** Object:  Default [DF__Rdonatari__Denom__2FE4F47A]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Rdonatario] ADD  DEFAULT (' ') FOR [Denominac]
GO
/****** Object:  Default [DF__Rdonatari__Tipod__30D918B3]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Rdonatario] ADD  DEFAULT ((0)) FOR [Tipodom]
GO
/****** Object:  Default [DF__Rdonatari__Calle__31CD3CEC]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Rdonatario] ADD  DEFAULT (' ') FOR [Calle]
GO
/****** Object:  Default [DF__Rdonatari__Nropu__32C16125]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Rdonatario] ADD  DEFAULT (' ') FOR [Nropuerta]
GO
/****** Object:  Default [DF__Rdonatario__Piso__33B5855E]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Rdonatario] ADD  DEFAULT (' ') FOR [Piso]
GO
/****** Object:  Default [DF__Rdonatari__Depto__34A9A997]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Rdonatario] ADD  DEFAULT (' ') FOR [Depto]
GO
/****** Object:  Default [DF__Rdonatari__Secto__359DCDD0]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Rdonatario] ADD  DEFAULT (' ') FOR [Sector]
GO
/****** Object:  Default [DF__Rdonatari__Torre__3691F209]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Rdonatario] ADD  DEFAULT (' ') FOR [Torre]
GO
/****** Object:  Default [DF__Rdonatari__Manza__37861642]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Rdonatario] ADD  DEFAULT (' ') FOR [Manzana]
GO
/****** Object:  Default [DF__Rdonatari__Codpo__387A3A7B]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Rdonatario] ADD  DEFAULT (' ') FOR [Codpostal]
GO
/****** Object:  Default [DF__Rdonatari__Local__396E5EB4]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Rdonatario] ADD  DEFAULT (' ') FOR [Localidad]
GO
/****** Object:  Default [DF__Rdonatari__Codpr__3A6282ED]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Rdonatario] ADD  DEFAULT ((0)) FOR [Codprov]
GO
/****** Object:  Default [DF__Rdonatario__Jdd__3B56A726]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Rdonatario] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__Rdonatario__Cbu__3C4ACB5F]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Rdonatario] ADD  DEFAULT (' ') FOR [Cbu]
GO
--/****** Object:  Default [DF__RDOCUMS__Codigo__4EC8A2F6]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RDOCUMS] ADD  DEFAULT (' ') FOR [Codigo]
--GO
--/****** Object:  Default [DF__RDOCUMS__Fecha_d__4FBCC72F]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RDOCUMS] ADD  DEFAULT (getdate()) FOR [Fecha_doc]
--GO
--/****** Object:  Default [DF__RDOCUMS__Tipo__50B0EB68]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RDOCUMS] ADD  DEFAULT (0) FOR [Tipo]
--GO
--/****** Object:  Default [DF__RDOCUMS__Descrip__51A50FA1]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RDOCUMS] ADD  DEFAULT (' ') FOR [Descrip]
--GO
--/****** Object:  Default [DF__RDOCUMS__Nombre__529933DA]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RDOCUMS] ADD  DEFAULT (' ') FOR [Nombre]
--GO
--/****** Object:  Default [DF__RDOCUMS__Fecha_c__538D5813]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RDOCUMS] ADD  DEFAULT (getdate()) FOR [Fecha_car]
--GO
--/****** Object:  Default [DF__RDOCUMS__Element__54817C4C]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RDOCUMS] ADD  DEFAULT (' ') FOR [Elemento]
--GO
--/****** Object:  Default [DF__RDOCUMS__Jdd__5575A085]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RDOCUMS] ADD  DEFAULT (0) FOR [Jdd]
--GO
--/****** Object:  Default [DF__RDOCUMS__Dire__39987BE6]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RDOCUMS] ADD  DEFAULT ('') FOR [Dire]
--GO
/****** Object:  Default [DF__Rdocfirma__Jdd__5F3F01E1]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Rdocfirma] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__Rdocfirma__Codig__6033261A]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Rdocfirma] ADD  DEFAULT (' ') FOR [Codigo]
GO
/****** Object:  Default [DF__Rdocfirma__Nombr__61274A53]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Rdocfirma] ADD  DEFAULT (' ') FOR [Nombredoc]
GO
/****** Object:  Default [DF__Rdocfirma__Docum__621B6E8C]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Rdocfirma] ADD  DEFAULT ((0)) FOR [Documento]
GO
/****** Object:  Default [DF__Rdocfirma__Tipod__630F92C5]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Rdocfirma] ADD  DEFAULT ((0)) FOR [Tipodoc]
GO
/****** Object:  Default [DF__Rdocfirma__Descr__6403B6FE]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Rdocfirma] ADD  DEFAULT (' ') FOR [Descrip]
GO
/****** Object:  Default [DF__Rdocfirma__Usuar__64F7DB37]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Rdocfirma] ADD  DEFAULT (' ') FOR [Usuar_car]
GO
/****** Object:  Default [DF__Rdocfirma__Fecha__65EBFF70]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Rdocfirma] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [Fecha_car]
GO
/****** Object:  Default [DF__Rdocfirma__Rutem__66E023A9]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Rdocfirma] ADD  DEFAULT (' ') FOR [Rutempl]
GO
/****** Object:  Default [DF__Rdocfirma__Rutre__67D447E2]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Rdocfirma] ADD  DEFAULT (' ') FOR [Rutrepr]
GO
/****** Object:  Default [DF__Rdocfirma__Firmo__68C86C1B]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Rdocfirma] ADD  DEFAULT (' ') FOR [Firmoempl]
GO
/****** Object:  Default [DF__Rdocfirma__Firmo__69BC9054]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Rdocfirma] ADD  DEFAULT (' ') FOR [Firmorepr]
GO
/****** Object:  Default [DF__Rdocfirma__Audit__6AB0B48D]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Rdocfirma] ADD  DEFAULT (' ') FOR [Auditempl]
GO
/****** Object:  Default [DF__Rdocfirma__Audit__6BA4D8C6]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Rdocfirma] ADD  DEFAULT (' ') FOR [Auditrepr]
GO
/****** Object:  Default [DF__Rdocempre__Jdd__6E814571]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Rdocempre] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__Rdocempre__Empre__6F7569AA]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Rdocempre] ADD  DEFAULT (' ') FOR [Empresa]
GO
/****** Object:  Default [DF__Rdocempre__Nombr__70698DE3]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Rdocempre] ADD  DEFAULT (' ') FOR [Nombredoc]
GO
/****** Object:  Default [DF__Rdocempre__Docum__715DB21C]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Rdocempre] ADD  DEFAULT ((0)) FOR [Documento]
GO
/****** Object:  Default [DF__Rdocempre__Tipod__7251D655]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Rdocempre] ADD  DEFAULT ((0)) FOR [Tipodoc]
GO
/****** Object:  Default [DF__Rdocempre__Descr__7345FA8E]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Rdocempre] ADD  DEFAULT (' ') FOR [Descrip]
GO
/****** Object:  Default [DF__Rdocempre__Usuar__743A1EC7]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Rdocempre] ADD  DEFAULT (' ') FOR [Usuar_car]
GO
/****** Object:  Default [DF__Rdocempre__Fecha__752E4300]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Rdocempre] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [Fecha_car]
GO
/****** Object:  Default [DF__Rdocemple__Jdd__54C1736E]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Rdocemple] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__Rdocemple__Codig__55B597A7]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Rdocemple] ADD  DEFAULT (' ') FOR [Codigo]
GO
/****** Object:  Default [DF__Rdocemple__Nombr__56A9BBE0]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Rdocemple] ADD  DEFAULT (' ') FOR [Nombredoc]
GO
/****** Object:  Default [DF__Rdocemple__Docum__579DE019]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Rdocemple] ADD  DEFAULT ((0)) FOR [Documento]
GO
/****** Object:  Default [DF__Rdocemple__Tipod__58920452]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Rdocemple] ADD  DEFAULT ((0)) FOR [Tipodoc]
GO
/****** Object:  Default [DF__Rdocemple__Descr__5986288B]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Rdocemple] ADD  DEFAULT (' ') FOR [Descrip]
GO
/****** Object:  Default [DF__Rdocemple__Usuar__5A7A4CC4]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Rdocemple] ADD  DEFAULT (' ') FOR [Usuar_car]
GO
/****** Object:  Default [DF__Rdocemple__Fecha__5B6E70FD]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Rdocemple] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [Fecha_car]
GO
/****** Object:  Default [DF__Rdocemple__mimet__5C629536]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Rdocemple] ADD  DEFAULT (' ') FOR [mimetype]
GO
--/****** Object:  Default [DF__RDIREC__Codigo__763775D2]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RDIREC] ADD  DEFAULT ((0)) FOR [Codigo]
--GO
--/****** Object:  Default [DF__RDIREC__Descrip__772B9A0B]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RDIREC] ADD  DEFAULT (' ') FOR [Descrip]
--GO
--/****** Object:  Default [DF__RDIREC__Direccio__781FBE44]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RDIREC] ADD  DEFAULT (' ') FOR [Direccion]
--GO
--/****** Object:  Default [DF__RDIREC__Telefono__7913E27D]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RDIREC] ADD  DEFAULT (' ') FOR [Telefono]
--GO
--/****** Object:  Default [DF__RDIREC__Valor__7A0806B6]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RDIREC] ADD  DEFAULT ((0)) FOR [Valor]
--GO
--/****** Object:  Default [DF__RDIREC__Valorc__7AFC2AEF]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RDIREC] ADD  DEFAULT (' ') FOR [Valorc]
--GO
--/****** Object:  Default [DF__RDIREC__Mail__7BF04F28]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RDIREC] ADD  DEFAULT (' ') FOR [Mail]
--GO
--/****** Object:  Default [DF__RDIREC__Jdd__7CE47361]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RDIREC] ADD  DEFAULT ((0)) FOR [Jdd]
--GO
/****** Object:  Default [DF__RDetEsque__IdEsq__47BC7E0B]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RDetEsquema] ADD  DEFAULT ((0)) FOR [IdEsquema]
GO
/****** Object:  Default [DF__RDetEsque__TipDe__48B0A244]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RDetEsquema] ADD  DEFAULT (' ') FOR [TipDet]
GO
/****** Object:  Default [DF__RDetEsquem__Fila__49A4C67D]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RDetEsquema] ADD  DEFAULT ((0)) FOR [Fila]
GO
/****** Object:  Default [DF__RDetEsque__Descr__4A98EAB6]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RDetEsquema] ADD  DEFAULT (' ') FOR [Descr]
GO
/****** Object:  Default [DF__RDetEsque__TipoD__4B8D0EEF]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RDetEsquema] ADD  DEFAULT (' ') FOR [TipoDato]
GO
/****** Object:  Default [DF__RDetEsque__Largo__4C813328]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RDetEsquema] ADD  DEFAULT ((0)) FOR [Largo]
GO
/****** Object:  Default [DF__RDetEsque__Aline__4D755761]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RDetEsquema] ADD  DEFAULT ((0)) FOR [Alineacion]
GO
/****** Object:  Default [DF__RDetEsque__Relle__4E697B9A]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RDetEsquema] ADD  DEFAULT (' ') FOR [Relleno]
GO
/****** Object:  Default [DF__RDetEsque__Desde__4F5D9FD3]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RDetEsquema] ADD  DEFAULT (' ') FOR [Desde]
GO
/****** Object:  Default [DF__RDetEsque__Hasta__5051C40C]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RDetEsquema] ADD  DEFAULT (' ') FOR [Hasta]
GO
/****** Object:  Default [DF__RDetEsque__MayMi__5145E845]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RDetEsquema] ADD  DEFAULT ((0)) FOR [MayMin]
GO
/****** Object:  Default [DF__RDetEsque__TipVa__523A0C7E]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RDetEsquema] ADD  DEFAULT ((0)) FOR [TipValor]
GO
/****** Object:  Default [DF__RDetEsque__Valor__532E30B7]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RDetEsquema] ADD  DEFAULT (' ') FOR [Valor]
GO
/****** Object:  Default [DF__RDetEsque__Tabla__542254F0]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RDetEsquema] ADD  DEFAULT (' ') FOR [Tabla]
GO
/****** Object:  Default [DF__RDetEsque__Forma__55167929]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RDetEsquema] ADD  DEFAULT (' ') FOR [FormatDate]
GO
/****** Object:  Default [DF__RDetEsque__Forma__560A9D62]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RDetEsquema] ADD  DEFAULT (' ') FOR [FormatHour]
GO
/****** Object:  Default [DF__RDetEsque__EsVal__56FEC19B]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RDetEsquema] ADD  DEFAULT ((0)) FOR [EsValorAbs]
GO
/****** Object:  Default [DF__RDetEsque__Redon__57F2E5D4]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RDetEsquema] ADD  DEFAULT ((0)) FOR [Redondeo]
GO
/****** Object:  Default [DF__RDetEsque__CantD__58E70A0D]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RDetEsquema] ADD  DEFAULT ((0)) FOR [CantDeci]
GO
/****** Object:  Default [DF__RDetEsque__SepMi__59DB2E46]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RDetEsquema] ADD  DEFAULT ((0)) FOR [SepMiles]
GO
/****** Object:  Default [DF__RDetEsque__SepDe__5ACF527F]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RDetEsquema] ADD  DEFAULT ((0)) FOR [SepDeci]
GO
/****** Object:  Default [DF__RDetEsque__EsDes__5BC376B8]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RDetEsquema] ADD  DEFAULT ((0)) FOR [EsDesdePan]
GO
/****** Object:  Default [DF__RDetEsquem__Item__5CB79AF1]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RDetEsquema] ADD  DEFAULT (' ') FOR [Item]
GO
/****** Object:  Default [DF__RDetEsque__TipoM__5DABBF2A]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RDetEsquema] ADD  DEFAULT ((0)) FOR [TipoMonto]
GO
/****** Object:  Default [DF__RDetEsque__Orden__5E9FE363]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RDetEsquema] ADD  DEFAULT ((0)) FOR [Orden]
GO
--/****** Object:  Default [DF__RDESCUR__Curso__58F12BAE]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RDESCUR] ADD  DEFAULT (' ') FOR [Curso]
--GO
--/****** Object:  Default [DF__RDESCUR__Descrip__59E54FE7]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RDESCUR] ADD  DEFAULT (' ') FOR [Descrip]
--GO
--/****** Object:  Default [DF__RDESCUR__Institu__5AD97420]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RDESCUR] ADD  DEFAULT (0) FOR [Institu]
--GO
--/****** Object:  Default [DF__RDESCUR__Nivel__5BCD9859]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RDESCUR] ADD  DEFAULT (0) FOR [Nivel]
--GO
--/****** Object:  Default [DF__RDESCUR__Costo__5CC1BC92]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RDESCUR] ADD  DEFAULT (0) FOR [Costo]
--GO
--/****** Object:  Default [DF__RDESCUR__Horas__5DB5E0CB]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RDESCUR] ADD  DEFAULT (0) FOR [Horas]
--GO
--/****** Object:  Default [DF__RDESCUR__Relator__5EAA0504]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RDESCUR] ADD  DEFAULT (' ') FOR [Relator]
--GO
--/****** Object:  Default [DF__RDESCUR__Fecha_i__5F9E293D]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RDESCUR] ADD  DEFAULT (getdate()) FOR [Fecha_ini]
--GO
--/****** Object:  Default [DF__RDESCUR__Fecha_t__60924D76]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RDESCUR] ADD  DEFAULT (getdate()) FOR [Fecha_ter]
--GO
--/****** Object:  Default [DF__RDESCUR__Compet__618671AF]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RDESCUR] ADD  DEFAULT (0) FOR [Compet]
--GO
--/****** Object:  Default [DF__RDESCUR__EsSence__627A95E8]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RDESCUR] ADD  DEFAULT (' ') FOR [EsSence]
--GO
--/****** Object:  Default [DF__RDESCUR__Cordina__636EBA21]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RDESCUR] ADD  DEFAULT (' ') FOR [Cordina]
--GO
--/****** Object:  Default [DF__RDESCUR__Jdd__6462DE5A]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RDESCUR] ADD  DEFAULT (0) FOR [Jdd]
--GO
--/****** Object:  Default [DF__RDESCUR__Tipo__3B16B004]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RDESCUR] ADD  DEFAULT ('0') FOR [Tipo]
--GO
--/****** Object:  Default [DF__RDESCUR__objetiv__3C0AD43D]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RDESCUR] ADD  DEFAULT (' ') FOR [objetivo]
--GO
--/****** Object:  Default [DF__RDESCUR__metodo__3CFEF876]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RDESCUR] ADD  DEFAULT (0) FOR [metodo]
--GO
--/****** Object:  Default [DF__RDESCUR__obligat__3DF31CAF]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RDESCUR] ADD  DEFAULT (' ') FOR [obligat]
--GO
--/****** Object:  Default [DF__RDESCUR__unidad__3EE740E8]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RDESCUR] ADD  DEFAULT (0) FOR [unidad]
--GO
--/****** Object:  Default [DF__RCURRICU__Codigo__63D8CE75]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RCURRICU] ADD  DEFAULT (' ') FOR [Codigo]
--GO
--/****** Object:  Default [DF__RCURRICU__Fecha___64CCF2AE]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RCURRICU] ADD  DEFAULT (getdate()) FOR [Fecha_ini]
--GO
--/****** Object:  Default [DF__RCURRICU__Duraci__65C116E7]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RCURRICU] ADD  DEFAULT (0) FOR [Duracion]
--GO
--/****** Object:  Default [DF__RCURRICU__TipDur__66B53B20]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RCURRICU] ADD  DEFAULT (' ') FOR [TipDur]
--GO
--/****** Object:  Default [DF__RCURRICU__Detall__67A95F59]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RCURRICU] ADD  DEFAULT (' ') FOR [Detalle]
--GO
--/****** Object:  Default [DF__RCURRICU__Tipo__689D8392]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RCURRICU] ADD  DEFAULT (0) FOR [Tipo]
--GO
--/****** Object:  Default [DF__RCURRICU__Instit__6991A7CB]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RCURRICU] ADD  DEFAULT (0) FOR [Institu]
--GO
--/****** Object:  Default [DF__RCURRICU__Compet__6A85CC04]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RCURRICU] ADD  DEFAULT (0) FOR [Compet]
--GO
--/****** Object:  Default [DF__RCURRICU__ValorS__6B79F03D]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RCURRICU] ADD  DEFAULT (0) FOR [ValorS]
--GO
--/****** Object:  Default [DF__RCURRICU__ValorT__6C6E1476]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RCURRICU] ADD  DEFAULT (0) FOR [ValorT]
--GO
--/****** Object:  Default [DF__RCURRICU__EsSenc__6D6238AF]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RCURRICU] ADD  DEFAULT (' ') FOR [EsSence]
--GO
--/****** Object:  Default [DF__RCURRICU__Situ__6E565CE8]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RCURRICU] ADD  DEFAULT (' ') FOR [Situ]
--GO
--/****** Object:  Default [DF__RCURRICU__Asiste__6F4A8121]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RCURRICU] ADD  DEFAULT (0) FOR [Asisten]
--GO
--/****** Object:  Default [DF__RCURRICU__Aproba__703EA55A]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RCURRICU] ADD  DEFAULT (' ') FOR [Aproba]
--GO
--/****** Object:  Default [DF__RCURRICU__Obs__7132C993]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RCURRICU] ADD  DEFAULT (' ') FOR [Obs]
--GO
--/****** Object:  Default [DF__RCURRICU__Jdd__7226EDCC]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RCURRICU] ADD  DEFAULT (0) FOR [Jdd]
--GO
--/****** Object:  Default [DF__RCURRICU__Nacion__32EB7E57]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RCURRICU] ADD  DEFAULT (0) FOR [Nacion]
--GO
--/****** Object:  Default [DF__RCURRICU__Area__33DFA290]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RCURRICU] ADD  DEFAULT ('') FOR [Area]
--GO
--/****** Object:  Default [DF__RCURRICU__Fecha___34D3C6C9]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RCURRICU] ADD  DEFAULT (getdate()) FOR [Fecha_ter]
--GO
--/****** Object:  Default [DF__RCURRICU__Dinsti__73C51D7B]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RCURRICU] ADD  DEFAULT (' ') FOR [Dinstitu]
--GO
--/****** Object:  Default [DF__RCURRICU__Grado__7E0DA1C4]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RCURRICU] ADD  DEFAULT (0) FOR [Grado]
--GO
--/****** Object:  Default [DF__RCURRICU__Titulo__7F01C5FD]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RCURRICU] ADD  DEFAULT (' ') FOR [Titulo]
--GO
--/****** Object:  Default [DF__RCURRICU__Especi__7FF5EA36]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RCURRICU] ADD  DEFAULT (' ') FOR [Especial]
--GO
--/****** Object:  Default [DF__RCURRICU__Puntaj__00EA0E6F]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RCURRICU] ADD  DEFAULT (0) FOR [Puntaje]
--GO
--/****** Object:  Default [DF__RCURRICU__fecha___01DE32A8]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RCURRICU] ADD  DEFAULT (' ') FOR [fecha_mod]
--GO
--/****** Object:  Default [DF__RCURRICU__Estado__02D256E1]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RCURRICU] ADD  DEFAULT (0) FOR [Estado]
--GO
--/****** Object:  Default [DF__RCURRICU__Tipotr__03C67B1A]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RCURRICU] ADD  DEFAULT (0) FOR [Tipotract]
--GO
--/****** Object:  Default [DF__RCURRICU__vobo__04BA9F53]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RCURRICU] ADD  DEFAULT (0) FOR [vobo]
--GO
--/****** Object:  Default [DF__RCURRICU__Causen__44A01A3E]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RCURRICU] ADD  DEFAULT (0) FOR [Causen]
--GO
--/****** Object:  Default [DF__RCURRICU__usrvob__01A9287E]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RCURRICU] ADD  DEFAULT (' ') FOR [usrvobo]
--GO
--/****** Object:  Default [DF__RCUENTAS__Cohade__18178C8A]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RCUENTAS] ADD  DEFAULT (' ') FOR [Cohade]
--GO
--/****** Object:  Default [DF__RCUENTAS__Indice__190BB0C3]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RCUENTAS] ADD  DEFAULT (0) FOR [Indice]
--GO
--/****** Object:  Default [DF__RCUENTAS__Cuenta__19FFD4FC]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RCUENTAS] ADD  DEFAULT (' ') FOR [Cuenta]
--GO
--/****** Object:  Default [DF__RCUENTAS__Jdd__1AF3F935]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RCUENTAS] ADD  DEFAULT (0) FOR [Jdd]
--GO
/****** Object:  Default [DF__RCubos__IDcubo__159B1292]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RCubos] ADD  DEFAULT (' ') FOR [IDcubo]
GO
/****** Object:  Default [DF__RCubos__Descrip__168F36CB]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RCubos] ADD  DEFAULT (' ') FOR [Descrip]
GO
/****** Object:  Default [DF__RCubos__Clasif__17835B04]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RCubos] ADD  DEFAULT ((0)) FOR [Clasif]
GO
/****** Object:  Default [DF__RCubos__Esquema__18777F3D]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RCubos] ADD  DEFAULT ((0)) FOR [Esquema]
GO
/****** Object:  Default [DF__RCubos__SQL__196BA376]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RCubos] ADD  DEFAULT (' ') FOR [SQL]
GO
/****** Object:  Default [DF__RCubos__Jdd__1A5FC7AF]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RCubos] ADD  DEFAULT ((0)) FOR [Jdd]
GO
--/****** Object:  Default [DF__RCTACOR__Codigo__75035A77]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RCTACOR] ADD  DEFAULT (' ') FOR [Codigo]
--GO
--/****** Object:  Default [DF__RCTACOR__Codpres__75F77EB0]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RCTACOR] ADD  DEFAULT (0) FOR [Codpres]
--GO
--/****** Object:  Default [DF__RCTACOR__Fecha__76EBA2E9]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RCTACOR] ADD  DEFAULT (getdate()) FOR [Fecha]
--GO
--/****** Object:  Default [DF__RCTACOR__Detalle__77DFC722]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RCTACOR] ADD  DEFAULT (' ') FOR [Detalle]
--GO
--/****** Object:  Default [DF__RCTACOR__MontoH__78D3EB5B]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RCTACOR] ADD  DEFAULT (0) FOR [MontoH]
--GO
--/****** Object:  Default [DF__RCTACOR__MontoC__79C80F94]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RCTACOR] ADD  DEFAULT (0) FOR [MontoC]
--GO
--/****** Object:  Default [DF__RCTACOR__MontoA__7ABC33CD]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RCTACOR] ADD  DEFAULT (0) FOR [MontoA]
--GO
--/****** Object:  Default [DF__RCTACOR__MontoP__7BB05806]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RCTACOR] ADD  DEFAULT (0) FOR [MontoP]
--GO
--/****** Object:  Default [DF__RCTACOR__Cohade__7CA47C3F]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RCTACOR] ADD  DEFAULT (' ') FOR [Cohade]
--GO
--/****** Object:  Default [DF__RCTACOR__Signo__7D98A078]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RCTACOR] ADD  DEFAULT (' ') FOR [Signo]
--GO
--/****** Object:  Default [DF__RCTACOR__Coform__7E8CC4B1]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RCTACOR] ADD  DEFAULT (' ') FOR [Coform]
--GO
--/****** Object:  Default [DF__RCTACOR__Tipo__7F80E8EA]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RCTACOR] ADD  DEFAULT (0) FOR [Tipo]
--GO
--/****** Object:  Default [DF__RCTACOR__Cuotot__00750D23]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RCTACOR] ADD  DEFAULT (0) FOR [Cuotot]
--GO
--/****** Object:  Default [DF__RCTACOR__Fecha_i__0169315C]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RCTACOR] ADD  DEFAULT (getdate()) FOR [Fecha_ini]
--GO
--/****** Object:  Default [DF__RCTACOR__Jdd__025D5595]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RCTACOR] ADD  DEFAULT (0) FOR [Jdd]
--GO
--/****** Object:  Default [DF__RCTACOR__Origen__7F6BDA51]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RCTACOR] ADD  DEFAULT ('P') FOR [Origen]
--GO
--/****** Object:  Default [DF__RCTACOR__Moneda__005FFE8A]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RCTACOR] ADD  DEFAULT (0) FOR [Moneda]
--GO
--/****** Object:  Default [DF__RCTACOR__cuota__015422C3]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RCTACOR] ADD  DEFAULT (0) FOR [cuota]
--GO
--/****** Object:  Default [DF__RCTACOR__Nucom__024846FC]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RCTACOR] ADD  DEFAULT (0) FOR [Nucom]
--GO
--/****** Object:  Default [DF__RCTACOR__Refere__033C6B35]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RCTACOR] ADD  DEFAULT (' ') FOR [Refere]
--GO
/****** Object:  Default [DF__Rcontenidos__jdd__36A700A2]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Rcontenidos] ADD  DEFAULT ((0)) FOR [jdd]
GO
/****** Object:  Default [DF__Rcontenid__fecha__379B24DB]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Rcontenidos] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [fecha_cre]
GO
/****** Object:  Default [DF__Rcontenido__Tipo__388F4914]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Rcontenidos] ADD  DEFAULT (' ') FOR [Tipo]
GO
/****** Object:  Default [DF__Rcontenid__fecha__39836D4D]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Rcontenidos] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [fecha_mod]
GO
/****** Object:  Default [DF__Rcontenid__fecha__3A779186]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Rcontenidos] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [fecha_ven]
GO
/****** Object:  Default [DF__Rcontenid__Clase__3B6BB5BF]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Rcontenidos] ADD  DEFAULT (' ') FOR [Clase]
GO
/****** Object:  Default [DF__Rcontenid__Userm__3C5FD9F8]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Rcontenidos] ADD  DEFAULT (' ') FOR [Usermod]
GO
/****** Object:  Default [DF__Rcontenid__Titul__3D53FE31]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Rcontenidos] ADD  DEFAULT (' ') FOR [Titulo]
GO
/****** Object:  Default [DF__Rcontenid__Resum__3E48226A]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Rcontenidos] ADD  DEFAULT (' ') FOR [Resumen]
GO
/****** Object:  Default [DF__Rcontenid__Archi__3F3C46A3]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Rcontenidos] ADD  DEFAULT (' ') FOR [Archivo]
GO
/****** Object:  Default [DF__Rcontenid__Detal__40306ADC]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Rcontenidos] ADD  DEFAULT (' ') FOR [Detalle]
GO
/****** Object:  Default [DF__Rcontenid__Forma__41248F15]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Rcontenidos] ADD  DEFAULT (' ') FOR [Formato]
GO
/****** Object:  Default [DF__Rcontenid__codig__4218B34E]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Rcontenidos] ADD  DEFAULT (' ') FOR [codigo]
GO
--/****** Object:  Default [DF__RCONJUN__CodCon__06B7F65E]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RCONJUN] ADD  DEFAULT (0) FOR [CodCon]
--GO
--/****** Object:  Default [DF__RCONJUN__Descrip__07AC1A97]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RCONJUN] ADD  DEFAULT (' ') FOR [Descrip]
--GO
--/****** Object:  Default [DF__RCONJUN__Tipo__08A03ED0]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RCONJUN] ADD  DEFAULT (' ') FOR [Tipo]
--GO
--/****** Object:  Default [DF__RCONJUN__Condi__09946309]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RCONJUN] ADD  DEFAULT (' ') FOR [Condi]
--GO
--/****** Object:  Default [DF__RCONJUN__Jdd__0A888742]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RCONJUN] ADD  DEFAULT (0) FOR [Jdd]
--GO
/****** Object:  Default [DF__RCONGSEM__RUT__3C3FDE67]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RCONGSEM] ADD  DEFAULT (' ') FOR [RUT]
GO
/****** Object:  Default [DF__RCONGSEM__evento__3D3402A0]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RCONGSEM] ADD  DEFAULT (' ') FOR [evento]
GO
/****** Object:  Default [DF__RCONGSEM__instit__3E2826D9]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RCONGSEM] ADD  DEFAULT (' ') FOR [instit]
GO
/****** Object:  Default [DF__RCONGSEM__fecha__3F1C4B12]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RCONGSEM] ADD  DEFAULT (getdate()) FOR [fecha]
GO
/****** Object:  Default [DF__RCONGSEM__fecha___40106F4B]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RCONGSEM] ADD  DEFAULT (getdate()) FOR [fecha_fin]
GO
/****** Object:  Default [DF__RCONGSEM__caract__41049384]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RCONGSEM] ADD  DEFAULT (' ') FOR [caracter]
GO
/****** Object:  Default [DF__RCONGSEM__ciudad__41F8B7BD]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RCONGSEM] ADD  DEFAULT (' ') FOR [ciudad]
GO
/****** Object:  Default [DF__RCONGSEM__pais__42ECDBF6]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RCONGSEM] ADD  DEFAULT (' ') FOR [pais]
GO
/****** Object:  Default [DF__RCONGSEM__observ__43E1002F]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RCONGSEM] ADD  DEFAULT (' ') FOR [observ]
GO
/****** Object:  Default [DF__RCONGSEM__Fecha___44D52468]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RCONGSEM] ADD  DEFAULT (getdate()) FOR [Fecha_mod]
GO
/****** Object:  Default [DF__RCONGSEM__vobo__45C948A1]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RCONGSEM] ADD  DEFAULT (0) FOR [vobo]
GO
/****** Object:  Default [DF__RCONGSEM__usrvob__46BD6CDA]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RCONGSEM] ADD  DEFAULT (' ') FOR [usrvobo]
GO
/****** Object:  Default [DF__RCONGSEM__Jdd__58BCECDB]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RCONGSEM] ADD  DEFAULT ((0)) FOR [Jdd]
GO
--/****** Object:  Default [DF__RCONFIR__Codigo__42CCE065]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RCONFIR] ADD  DEFAULT (' ') FOR [Codigo]
--GO
--/****** Object:  Default [DF__RCONFIR__Ames__43C1049E]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RCONFIR] ADD  DEFAULT (' ') FOR [Ames]
--GO
--/****** Object:  Default [DF__RCONFIR__Peri__44B528D7]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RCONFIR] ADD  DEFAULT (' ') FOR [Peri]
--GO
--/****** Object:  Default [DF__RCONFIR__marca__45A94D10]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RCONFIR] ADD  DEFAULT (' ') FOR [marca]
--GO
--/****** Object:  Default [DF__RCONFIR__Fecha_m__469D7149]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RCONFIR] ADD  DEFAULT (getdate()) FOR [Fecha_mar]
--GO
--/****** Object:  Default [DF__RCONFIR__Detalle__47919582]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RCONFIR] ADD  DEFAULT (' ') FOR [Detalle]
--GO
--/****** Object:  Default [DF__RCONFIR__Jdd__4885B9BB]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RCONFIR] ADD  DEFAULT (0) FOR [Jdd]
--GO
/****** Object:  Default [DF__RConfigTr__nom_c__6C63F2D5]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RConfigTransf] ADD  DEFAULT (' ') FOR [nom_conf]
GO
/****** Object:  Default [DF__RConfigTr__perio__6D58170E]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RConfigTransf] ADD  DEFAULT (' ') FOR [periodo]
GO
/****** Object:  Default [DF__RConfigTr__banco__6E4C3B47]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RConfigTransf] ADD  DEFAULT ((0)) FOR [banco]
GO
/****** Object:  Default [DF__RConfigTr__fec_p__6F405F80]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RConfigTransf] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [fec_pago]
GO
/****** Object:  Default [DF__RConfigTra__item__703483B9]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RConfigTransf] ADD  DEFAULT (' ') FOR [item]
GO
/****** Object:  Default [DF__RConfigTr__nro_c__7128A7F2]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RConfigTransf] ADD  DEFAULT (' ') FOR [nro_cheq]
GO
/****** Object:  Default [DF__RConfigTr__condi__721CCC2B]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RConfigTransf] ADD  DEFAULT (' ') FOR [condicion]
GO
/****** Object:  Default [DF__RConfigTr__nom_a__7310F064]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RConfigTransf] ADD  DEFAULT (' ') FOR [nom_archi]
GO
/****** Object:  Default [DF__RConfigTr__opcio__7405149D]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RConfigTransf] ADD  DEFAULT (' ') FOR [opciones]
GO
/****** Object:  Default [DF__RConfigTr__otros__74F938D6]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RConfigTransf] ADD  DEFAULT (' ') FOR [otros]
GO
/****** Object:  Default [DF__RConfigTr__hbanc__75ED5D0F]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RConfigTransf] ADD  DEFAULT ((0)) FOR [hbancos]
GO
/****** Object:  Default [DF__RConfigTr__hfpag__76E18148]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RConfigTransf] ADD  DEFAULT ((0)) FOR [hfpagos]
GO
/****** Object:  Default [DF__RConfigTran__Jdd__77D5A581]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RConfigTransf] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__RConfigCe__nom_c__7AB2122C]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RConfigCen] ADD  DEFAULT (' ') FOR [nom_conf]
GO
/****** Object:  Default [DF__RConfigCe__plan___7BA63665]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RConfigCen] ADD  DEFAULT ((0)) FOR [plan_cta]
GO
/****** Object:  Default [DF__RConfigCe__cond___7C9A5A9E]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RConfigCen] ADD  DEFAULT (' ') FOR [cond_emp]
GO
/****** Object:  Default [DF__RConfigCe__perio__7D8E7ED7]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RConfigCen] ADD  DEFAULT (' ') FOR [periodos]
GO
/****** Object:  Default [DF__RConfigCe__opcio__7E82A310]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RConfigCen] ADD  DEFAULT (' ') FOR [opciones]
GO
/****** Object:  Default [DF__RConfigCe__habil__7F76C749]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RConfigCen] ADD  DEFAULT ((0)) FOR [habilita]
GO
/****** Object:  Default [DF__RConfigCen__Jdd__006AEB82]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RConfigCen] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__RConfEsqu__Descr__3F27380A]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RConfEsquemas] ADD  DEFAULT (' ') FOR [Descr]
GO
/****** Object:  Default [DF__RConfEsqu__TipEs__401B5C43]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RConfEsquemas] ADD  DEFAULT (' ') FOR [TipEsq]
GO
/****** Object:  Default [DF__RConfEsqu__TipAr__410F807C]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RConfEsquemas] ADD  DEFAULT (' ') FOR [TipArch]
GO
/****** Object:  Default [DF__RConfEsqu__NArch__4203A4B5]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RConfEsquemas] ADD  DEFAULT (' ') FOR [NArchivo]
GO
/****** Object:  Default [DF__RConfEsqu__FCrea__42F7C8EE]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RConfEsquemas] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [FCreacion]
GO
/****** Object:  Default [DF__RConfEsqu__Banco__43EBED27]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RConfEsquemas] ADD  DEFAULT (' ') FOR [BancoAsoc]
GO
/****** Object:  Default [DF__RConfEsquem__Jdd__44E01160]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RConfEsquemas] ADD  DEFAULT ((0)) FOR [Jdd]
GO
--/****** Object:  Default [DF__RCONDIS__Jdd__1758727B]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RCONDIS] ADD  DEFAULT (0) FOR [Jdd]
--GO
--/****** Object:  Default [DF__RCONDIS__Usuario__184C96B4]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RCONDIS] ADD  DEFAULT (' ') FOR [Usuario]
--GO
--/****** Object:  Default [DF__RCONDIS__Descrip__1940BAED]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RCONDIS] ADD  DEFAULT (' ') FOR [Descrip]
--GO
--/****** Object:  Default [DF__RCONDIS__Condici__1A34DF26]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RCONDIS] ADD  DEFAULT (' ') FOR [Condicion]
--GO
--/****** Object:  Default [DF__RCONDAT__Jdd__24D2692A]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RCONDAT] ADD  DEFAULT (0) FOR [Jdd]
--GO
--/****** Object:  Default [DF__RCONDAT__Usuario__25C68D63]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RCONDAT] ADD  DEFAULT (' ') FOR [Usuario]
--GO
--/****** Object:  Default [DF__RCONDAT__Wcompu__26BAB19C]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RCONDAT] ADD  DEFAULT (' ') FOR [Wcompu]
--GO
--/****** Object:  Default [DF__RCONDAT__Identi__27AED5D5]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RCONDAT] ADD  DEFAULT (0) FOR [Identi]
--GO
--/****** Object:  Default [DF__RCONDAT__Wuser__28A2FA0E]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RCONDAT] ADD  DEFAULT (' ') FOR [Wuser]
--GO
--/****** Object:  Default [DF__RCONDAT__Fecha__29971E47]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RCONDAT] ADD  DEFAULT (getdate()) FOR [Fecha]
--GO
--/****** Object:  Default [DF__RCONDAT__Program__2A8B4280]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RCONDAT] ADD  DEFAULT (' ') FOR [Programa]
--GO
/****** Object:  Default [DF__Rcomisii__Codigo__60882BD5]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Rcomisii] ADD  DEFAULT (' ') FOR [Codigo]
GO
/****** Object:  Default [DF__Rcomisii__Ames__617C500E]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Rcomisii] ADD  DEFAULT (' ') FOR [Ames]
GO
/****** Object:  Default [DF__Rcomisii__Peri__62707447]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Rcomisii] ADD  DEFAULT (' ') FOR [Peri]
GO
/****** Object:  Default [DF__Rcomisii__Cohade__63649880]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Rcomisii] ADD  DEFAULT (' ') FOR [Cohade]
GO
/****** Object:  Default [DF__Rcomisii__Numero__6458BCB9]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Rcomisii] ADD  DEFAULT ((0)) FOR [Numero]
GO
/****** Object:  Default [DF__Rcomisii__M_comi__654CE0F2]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Rcomisii] ADD  DEFAULT ((0)) FOR [M_comisi]
GO
/****** Object:  Default [DF__Rcomisii__Descri__6641052B]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Rcomisii] ADD  DEFAULT (' ') FOR [Descrip]
GO
/****** Object:  Default [DF__Rcomisii__JDD__67352964]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Rcomisii] ADD  DEFAULT ((0)) FOR [JDD]
GO
--/****** Object:  Default [DF__RCOMISI__Codigo__60132A89]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RCOMISI] ADD  DEFAULT (' ') FOR [Codigo]
--GO
--/****** Object:  Default [DF__RCOMISI__Ames__61074EC2]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RCOMISI] ADD  DEFAULT (' ') FOR [Ames]
--GO
--/****** Object:  Default [DF__RCOMISI__Peri__61FB72FB]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RCOMISI] ADD  DEFAULT (' ') FOR [Peri]
--GO
--/****** Object:  Default [DF__RCOMISI__Cohade__62EF9734]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RCOMISI] ADD  DEFAULT (' ') FOR [Cohade]
--GO
--/****** Object:  Default [DF__RCOMISI__Numero__63E3BB6D]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RCOMISI] ADD  DEFAULT ((0)) FOR [Numero]
--GO
--/****** Object:  Default [DF__RCOMISI__Valor1__64D7DFA6]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RCOMISI] ADD  DEFAULT ((0)) FOR [Valor1]
--GO
--/****** Object:  Default [DF__RCOMISI__Valor2__65CC03DF]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RCOMISI] ADD  DEFAULT ((0)) FOR [Valor2]
--GO
--/****** Object:  Default [DF__RCOMISI__Valor3__66C02818]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RCOMISI] ADD  DEFAULT ((0)) FOR [Valor3]
--GO
--/****** Object:  Default [DF__RCOMISI__Valor4__67B44C51]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RCOMISI] ADD  DEFAULT ((0)) FOR [Valor4]
--GO
--/****** Object:  Default [DF__RCOMISI__Campo1__68A8708A]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RCOMISI] ADD  DEFAULT (' ') FOR [Campo1]
--GO
--/****** Object:  Default [DF__RCOMISI__Campo2__699C94C3]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RCOMISI] ADD  DEFAULT (' ') FOR [Campo2]
--GO
--/****** Object:  Default [DF__RCOMISI__Campo3__6A90B8FC]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RCOMISI] ADD  DEFAULT (' ') FOR [Campo3]
--GO
--/****** Object:  Default [DF__RCOMISI__Campo4__6B84DD35]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RCOMISI] ADD  DEFAULT (' ') FOR [Campo4]
--GO
--/****** Object:  Default [DF__RCOMISI__Largo1__6C79016E]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RCOMISI] ADD  DEFAULT (' ') FOR [Largo1]
--GO
--/****** Object:  Default [DF__RCOMISI__Largo2__6D6D25A7]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RCOMISI] ADD  DEFAULT (' ') FOR [Largo2]
--GO
--/****** Object:  Default [DF__RCOMISI__Jdd__6E6149E0]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RCOMISI] ADD  DEFAULT ((0)) FOR [Jdd]
--GO
--/****** Object:  Default [DF__RCOMCAR__Cargo__673F4B05]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RCOMCAR] ADD  DEFAULT (0) FOR [Cargo]
--GO
--/****** Object:  Default [DF__RCOMCAR__Compet__68336F3E]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RCOMCAR] ADD  DEFAULT (0) FOR [Compet]
--GO
--/****** Object:  Default [DF__RCOMCAR__Priori__69279377]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RCOMCAR] ADD  DEFAULT (0) FOR [Priori]
--GO
--/****** Object:  Default [DF__RCOMCAR__Sicap__6A1BB7B0]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RCOMCAR] ADD  DEFAULT (' ') FOR [Sicap]
--GO
--/****** Object:  Default [DF__RCOMCAR__Jdd__6B0FDBE9]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RCOMCAR] ADD  DEFAULT (0) FOR [Jdd]
--GO
/****** Object:  Default [DF__RCLIPROD__IDprod__2858E14B]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RCLIPROD] ADD  DEFAULT ((0)) FOR [IDproducto]
GO
/****** Object:  Default [DF__RCLIPROD__IDclie__294D0584]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RCLIPROD] ADD  DEFAULT ((0)) FOR [IDcliente]
GO
/****** Object:  Default [DF__RCLIPROD__Cantid__2A4129BD]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RCLIPROD] ADD  DEFAULT ((0)) FOR [Cantidad]
GO
/****** Object:  Default [DF__RCLIPROD__Activo__2B354DF6]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RCLIPROD] ADD  DEFAULT (' ') FOR [Activo]
GO
/****** Object:  Default [DF__RCLIPROD__UsuarA__2C29722F]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RCLIPROD] ADD  DEFAULT (' ') FOR [UsuarAlta]
GO
/****** Object:  Default [DF__RCLIPROD__FechaA__2D1D9668]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RCLIPROD] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [FechaAlta]
GO
/****** Object:  Default [DF__RCLIPROD__UsuarU__2E11BAA1]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RCLIPROD] ADD  DEFAULT (' ') FOR [UsuarUltM]
GO
/****** Object:  Default [DF__RCLIPROD__FechaU__2F05DEDA]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RCLIPROD] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [FechaUltM]
GO
/****** Object:  Default [DF__RCLIPROD__Desde__2FFA0313]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RCLIPROD] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [Desde]
GO
/****** Object:  Default [DF__RCLIPROD__Hasta__30EE274C]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RCLIPROD] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [Hasta]
GO
/****** Object:  Default [DF__RCLIPROD__Observ__31E24B85]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RCLIPROD] ADD  DEFAULT (' ') FOR [Observ]
GO
/****** Object:  Default [DF__RCLIPROD__Fpago__32D66FBE]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RCLIPROD] ADD  DEFAULT ((0)) FOR [Fpago]
GO
/****** Object:  Default [DF__RCLIPROD__Jdd__33CA93F7]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RCLIPROD] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__RClientes__Clien__7A92169B]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RClientes] ADD  DEFAULT (' ') FOR [Cliente]
GO
/****** Object:  Default [DF__RClientes__Rut__7B863AD4]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RClientes] ADD  DEFAULT (' ') FOR [Rut]
GO
/****** Object:  Default [DF__RClientes__Nombr__7C7A5F0D]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RClientes] ADD  DEFAULT (' ') FOR [Nombre]
GO
/****** Object:  Default [DF__RClientes__Estad__7D6E8346]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RClientes] ADD  DEFAULT (' ') FOR [Estado]
GO
/****** Object:  Default [DF__RClientes__Direc__7E62A77F]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RClientes] ADD  DEFAULT (' ') FOR [Direccion]
GO
/****** Object:  Default [DF__RClientes__Tipo__7F56CBB8]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RClientes] ADD  DEFAULT (' ') FOR [Tipo]
GO
/****** Object:  Default [DF__RClientes__Orige__004AEFF1]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RClientes] ADD  DEFAULT ((0)) FOR [Origen]
GO
/****** Object:  Default [DF__RClientes__Rubro__013F142A]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RClientes] ADD  DEFAULT ((0)) FOR [Rubro]
GO
/****** Object:  Default [DF__RClientes__nrotr__02333863]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RClientes] ADD  DEFAULT ((0)) FOR [nrotra]
GO
/****** Object:  Default [DF__RClientes__Fecha__03275C9C]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RClientes] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [Fecha_ini]
GO
/****** Object:  Default [DF__RClientes__Jdd__041B80D5]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RClientes] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__RClientes__IDPad__050FA50E]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RClientes] ADD  DEFAULT ((0)) FOR [IDPadre]
GO
/****** Object:  Default [DF__RClientes__NomFa__0603C947]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RClientes] ADD  DEFAULT (' ') FOR [NomFan]
GO
/****** Object:  Default [DF__RClientes__SistC__06F7ED80]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RClientes] ADD  DEFAULT (' ') FOR [SistCont]
GO
/****** Object:  Default [DF__RClientes__CodSI__07EC11B9]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RClientes] ADD  DEFAULT (' ') FOR [CodSII]
GO
/****** Object:  Default [DF__RClientes__Fono__08E035F2]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RClientes] ADD  DEFAULT (' ') FOR [Fono]
GO
/****** Object:  Default [DF__RClientes__HsAdi__09D45A2B]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RClientes] ADD  DEFAULT ((0)) FOR [HsAdic]
GO
/****** Object:  Default [DF__RClientes__Nombr__0AC87E64]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RClientes] ADD  DEFAULT (' ') FOR [NombreR]
GO
/****** Object:  Default [DF__RClientes__RutR__0BBCA29D]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RClientes] ADD  DEFAULT (' ') FOR [RutR]
GO
/****** Object:  Default [DF__RClientes__MailR__0CB0C6D6]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RClientes] ADD  DEFAULT (' ') FOR [MailR]
GO
/****** Object:  Default [DF__RClientes__Fpago__0DA4EB0F]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RClientes] ADD  DEFAULT ((0)) FOR [Fpago]
GO
/****** Object:  Default [DF__RClientes__Funci__0E990F48]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RClientes] ADD  DEFAULT (' ') FOR [FuncionC]
GO
/****** Object:  Default [DF__RClientes__PassR__0F8D3381]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RClientes] ADD  DEFAULT (' ') FOR [PassR]
GO
/****** Object:  Default [DF__RClientes__Usuar__108157BA]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RClientes] ADD  DEFAULT (' ') FOR [UsuarioA]
GO
/****** Object:  Default [DF__RClientes__Fecha__11757BF3]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RClientes] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [FechaA]
GO
/****** Object:  Default [DF__RClientes__Grupo__1269A02C]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RClientes] ADD  DEFAULT ((0)) FOR [Grupo]
GO
/****** Object:  Default [DF__RclaremH__Codigo__57D2EA43]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RclaremH] ADD  DEFAULT (' ') FOR [Codigo]
GO
/****** Object:  Default [DF__RclaremH__Cohade__58C70E7C]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RclaremH] ADD  DEFAULT (' ') FOR [Cohade]
GO
/****** Object:  Default [DF__RclaremH__Nro__59BB32B5]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RclaremH] ADD  DEFAULT ((0)) FOR [Nro]
GO
/****** Object:  Default [DF__RclaremH__Tipo__5AAF56EE]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RclaremH] ADD  DEFAULT ((0)) FOR [Tipo]
GO
/****** Object:  Default [DF__RclaremH__Orden__5BA37B27]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RclaremH] ADD  DEFAULT ((0)) FOR [Orden]
GO
/****** Object:  Default [DF__RclaremH__Period__5C979F60]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RclaremH] ADD  DEFAULT (' ') FOR [Periodo]
GO
/****** Object:  Default [DF__RclaremH__COFORM__5D8BC399]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RclaremH] ADD  DEFAULT (' ') FOR [COFORM]
GO
/****** Object:  Default [DF__RclaremH__CUOTOT__5E7FE7D2]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RclaremH] ADD  DEFAULT ((0)) FOR [CUOTOT]
GO
/****** Object:  Default [DF__RclaremH__Cuopar__5F740C0B]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RclaremH] ADD  DEFAULT ((0)) FOR [Cuopar]
GO
/****** Object:  Default [DF__RclaremH__Monto__60683044]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RclaremH] ADD  DEFAULT ((0)) FOR [Monto]
GO
/****** Object:  Default [DF__RclaremH__Fecha___615C547D]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RclaremH] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [Fecha_cre]
GO
/****** Object:  Default [DF__RclaremH__Fecha___625078B6]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RclaremH] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [Fecha_ini]
GO
/****** Object:  Default [DF__RclaremH__Fecha___63449CEF]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RclaremH] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [Fecha_fin]
GO
/****** Object:  Default [DF__RclaremH__Cencos__6438C128]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RclaremH] ADD  DEFAULT ((0)) FOR [Cencos]
GO
/****** Object:  Default [DF__RclaremH__Cuenta__652CE561]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RclaremH] ADD  DEFAULT (' ') FOR [Cuenta]
GO
/****** Object:  Default [DF__RclaremH__Ticen__6621099A]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RclaremH] ADD  DEFAULT (' ') FOR [Ticen]
GO
/****** Object:  Default [DF__RclaremH__Ctacor__67152DD3]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RclaremH] ADD  DEFAULT (' ') FOR [Ctacor]
GO
/****** Object:  Default [DF__RclaremH__Obs__6809520C]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RclaremH] ADD  DEFAULT (' ') FOR [Obs]
GO
/****** Object:  Default [DF__RclaremH__Formul__68FD7645]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RclaremH] ADD  DEFAULT (' ') FOR [Formula]
GO
/****** Object:  Default [DF__RclaremH__Coinst__69F19A7E]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RclaremH] ADD  DEFAULT ((0)) FOR [Coinst]
GO
/****** Object:  Default [DF__RclaremH__Pone__6AE5BEB7]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RclaremH] ADD  DEFAULT (' ') FOR [Pone]
GO
/****** Object:  Default [DF__RclaremH__Grupo__6BD9E2F0]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RclaremH] ADD  DEFAULT ((0)) FOR [Grupo]
GO
/****** Object:  Default [DF__RclaremH__Condi__6CCE0729]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RclaremH] ADD  DEFAULT (' ') FOR [Condi]
GO
/****** Object:  Default [DF__RclaremH__Simes__6DC22B62]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RclaremH] ADD  DEFAULT (' ') FOR [Simes]
GO
/****** Object:  Default [DF__RclaremH__QuePer__6EB64F9B]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RclaremH] ADD  DEFAULT (' ') FOR [QuePeri]
GO
/****** Object:  Default [DF__RclaremH__ndecim__6FAA73D4]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RclaremH] ADD  DEFAULT ((0)) FOR [ndecimon]
GO
/****** Object:  Default [DF__RclaremH__Jdd__709E980D]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RclaremH] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__RclaremH__Ames__7192BC46]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RclaremH] ADD  DEFAULT (' ') FOR [Ames]
GO
/****** Object:  Default [DF__RCLAREM__Codigo__220B0B18]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RCLAREM] ADD  DEFAULT (' ') FOR [Codigo]
GO
/****** Object:  Default [DF__RCLAREM__Cohade__22FF2F51]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RCLAREM] ADD  DEFAULT (' ') FOR [Cohade]
GO
/****** Object:  Default [DF__RCLAREM__Nro__23F3538A]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RCLAREM] ADD  DEFAULT (0) FOR [Nro]
GO
/****** Object:  Default [DF__RCLAREM__Tipo__24E777C3]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RCLAREM] ADD  DEFAULT (0) FOR [Tipo]
GO
/****** Object:  Default [DF__RCLAREM__Orden__25DB9BFC]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RCLAREM] ADD  DEFAULT (0) FOR [Orden]
GO
/****** Object:  Default [DF__RCLAREM__Periodo__26CFC035]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RCLAREM] ADD  DEFAULT (' ') FOR [Periodo]
GO
/****** Object:  Default [DF__RCLAREM__COFORM__27C3E46E]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RCLAREM] ADD  DEFAULT (' ') FOR [COFORM]
GO
/****** Object:  Default [DF__RCLAREM__CUOTOT__28B808A7]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RCLAREM] ADD  DEFAULT (0) FOR [CUOTOT]
GO
/****** Object:  Default [DF__RCLAREM__Cuopar__29AC2CE0]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RCLAREM] ADD  DEFAULT (0) FOR [Cuopar]
GO
/****** Object:  Default [DF__RCLAREM__Monto__2AA05119]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RCLAREM] ADD  DEFAULT (0) FOR [Monto]
GO
/****** Object:  Default [DF__RCLAREM__Fecha_c__2B947552]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RCLAREM] ADD  DEFAULT (getdate()) FOR [Fecha_cre]
GO
/****** Object:  Default [DF__RCLAREM__Fecha_i__2C88998B]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RCLAREM] ADD  DEFAULT (getdate()) FOR [Fecha_ini]
GO
/****** Object:  Default [DF__RCLAREM__Fecha_f__2D7CBDC4]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RCLAREM] ADD  DEFAULT (getdate()) FOR [Fecha_fin]
GO
/****** Object:  Default [DF__RCLAREM__Cencos__2E70E1FD]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RCLAREM] ADD  DEFAULT (0) FOR [Cencos]
GO
/****** Object:  Default [DF__RCLAREM__Cuenta__2F650636]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RCLAREM] ADD  DEFAULT (' ') FOR [Cuenta]
GO
/****** Object:  Default [DF__RCLAREM__Ticen__30592A6F]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RCLAREM] ADD  DEFAULT (' ') FOR [Ticen]
GO
/****** Object:  Default [DF__RCLAREM__Ctacor__314D4EA8]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RCLAREM] ADD  DEFAULT (' ') FOR [Ctacor]
GO
/****** Object:  Default [DF__RCLAREM__Obs__324172E1]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RCLAREM] ADD  DEFAULT (' ') FOR [Obs]
GO
/****** Object:  Default [DF__RCLAREM__Formula__3335971A]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RCLAREM] ADD  DEFAULT (' ') FOR [Formula]
GO
/****** Object:  Default [DF__RCLAREM__Coinst__3429BB53]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RCLAREM] ADD  DEFAULT (0) FOR [Coinst]
GO
/****** Object:  Default [DF__RCLAREM__Pone__351DDF8C]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RCLAREM] ADD  DEFAULT (' ') FOR [Pone]
GO
/****** Object:  Default [DF__RCLAREM__Grupo__361203C5]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RCLAREM] ADD  DEFAULT (0) FOR [Grupo]
GO
/****** Object:  Default [DF__RCLAREM__Condi__370627FE]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RCLAREM] ADD  DEFAULT (' ') FOR [Condi]
GO
/****** Object:  Default [DF__RCLAREM__Simes__37FA4C37]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RCLAREM] ADD  DEFAULT (' ') FOR [Simes]
GO
/****** Object:  Default [DF__RCLAREM__QuePeri__38EE7070]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RCLAREM] ADD  DEFAULT (' ') FOR [QuePeri]
GO
/****** Object:  Default [DF__RCLAREM__Jdd__39E294A9]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RCLAREM] ADD  DEFAULT (0) FOR [Jdd]
GO
/****** Object:  Default [DF__RCLAREM__Ndecimo__45AA1867]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RCLAREM] ADD  DEFAULT ((0)) FOR [Ndecimon]
GO
/****** Object:  Default [DF__RclaencH__Codigo__746F28F1]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RclaencH] ADD  DEFAULT (' ') FOR [Codigo]
GO
/****** Object:  Default [DF__RclaencH__Descri__75634D2A]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RclaencH] ADD  DEFAULT (' ') FOR [Descrip]
GO
/****** Object:  Default [DF__RclaencH__Codemp__76577163]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RclaencH] ADD  DEFAULT (' ') FOR [Codemp]
GO
/****** Object:  Default [DF__RclaencH__Funda__774B959C]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RclaencH] ADD  DEFAULT (' ') FOR [Funda]
GO
/****** Object:  Default [DF__RclaencH__Jdd__783FB9D5]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RclaencH] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__RclaencH__Ames__7933DE0E]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RclaencH] ADD  DEFAULT (' ') FOR [Ames]
GO
--/****** Object:  Default [DF__RCLAENC__Codigo__43A1090D]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RCLAENC] ADD  DEFAULT (' ') FOR [Codigo]
--GO
--/****** Object:  Default [DF__RCLAENC__Descrip__44952D46]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RCLAENC] ADD  DEFAULT (' ') FOR [Descrip]
--GO
--/****** Object:  Default [DF__RCLAENC__Codemp__4589517F]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RCLAENC] ADD  DEFAULT (' ') FOR [Codemp]
--GO
--/****** Object:  Default [DF__RCLAENC__Funda__467D75B8]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RCLAENC] ADD  DEFAULT (' ') FOR [Funda]
--GO
--/****** Object:  Default [DF__RCLAENC__Jdd__477199F1]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RCLAENC] ADD  DEFAULT (0) FOR [Jdd]
--GO
/****** Object:  Default [DF__Rcertis__jdd__6A5BAED2]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Rcertis] ADD  DEFAULT ((0)) FOR [jdd]
GO
/****** Object:  Default [DF__Rcertis__Rut__6B4FD30B]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Rcertis] ADD  DEFAULT (' ') FOR [Rut]
GO
/****** Object:  Default [DF__Rcertis__Empresa__6C43F744]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Rcertis] ADD  DEFAULT (' ') FOR [Empresa]
GO
/****** Object:  Default [DF__Rcertis__Ames__6D381B7D]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Rcertis] ADD  DEFAULT (' ') FOR [Ames]
GO
/****** Object:  Default [DF__Rcertis__Nombre__6E2C3FB6]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Rcertis] ADD  DEFAULT (' ') FOR [Nombre]
GO
/****** Object:  Default [DF__Rcertis__RemBru__6F2063EF]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Rcertis] ADD  DEFAULT ((0)) FOR [RemBru]
GO
/****** Object:  Default [DF__Rcertis__Remimp__70148828]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Rcertis] ADD  DEFAULT ((0)) FOR [Remimp]
GO
/****** Object:  Default [DF__Rcertis__Cotiza__7108AC61]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Rcertis] ADD  DEFAULT ((0)) FOR [Cotiza]
GO
/****** Object:  Default [DF__Rcertis__Impues__71FCD09A]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Rcertis] ADD  DEFAULT ((0)) FOR [Impues]
GO
/****** Object:  Default [DF__Rcertis__Ppm__72F0F4D3]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Rcertis] ADD  DEFAULT ((0)) FOR [Ppm]
GO
/****** Object:  Default [DF__Rcertis__impf29__73E5190C]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Rcertis] ADD  DEFAULT ((0)) FOR [impf29]
GO
/****** Object:  Default [DF__Rcertis__Impues1__74D93D45]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Rcertis] ADD  DEFAULT ((0)) FOR [Impues14]
GO
/****** Object:  Default [DF__Rcertis__impues1__75CD617E]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Rcertis] ADD  DEFAULT ((0)) FOR [impues14A]
GO
/****** Object:  Default [DF__Rcertis__exento__76C185B7]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Rcertis] ADD  DEFAULT ((0)) FOR [exento]
GO
/****** Object:  Default [DF__Rcertis__zonafa__77B5A9F0]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Rcertis] ADD  DEFAULT ((0)) FOR [zonafa]
GO
--/****** Object:  Default [DF__RCERTIREN__Rut__2D67AF2B]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RCERTIREN] ADD  DEFAULT (' ') FOR [Rut]
--GO
--/****** Object:  Default [DF__RCERTIREN__Ames__2E5BD364]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RCERTIREN] ADD  DEFAULT (' ') FOR [Ames]
--GO
--/****** Object:  Default [DF__RCERTIREN__Empre__2F4FF79D]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RCERTIREN] ADD  DEFAULT (' ') FOR [Empresa]
--GO
--/****** Object:  Default [DF__RCERTIREN__Rembr__30441BD6]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RCERTIREN] ADD  DEFAULT (0) FOR [Rembru]
--GO
--/****** Object:  Default [DF__RCERTIREN__Cotiz__3138400F]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RCERTIREN] ADD  DEFAULT (0) FOR [Cotiza]
--GO
--/****** Object:  Default [DF__RCERTIREN__Afect__322C6448]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RCERTIREN] ADD  DEFAULT (0) FOR [Afecto]
--GO
--/****** Object:  Default [DF__RCERTIREN__Impue__33208881]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RCERTIREN] ADD  DEFAULT (0) FOR [Impues]
--GO
--/****** Object:  Default [DF__RCERTIREN__Exent__3414ACBA]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RCERTIREN] ADD  DEFAULT (0) FOR [Exento]
--GO
--/****** Object:  Default [DF__RCERTIREN__Zonaf__3508D0F3]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RCERTIREN] ADD  DEFAULT (0) FOR [Zonafa]
--GO
--/****** Object:  Default [DF__RCERTIREN__Ppm__35FCF52C]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RCERTIREN] ADD  DEFAULT (0) FOR [Ppm]
--GO
--/****** Object:  Default [DF__RCERTIREN__facto__36F11965]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RCERTIREN] ADD  DEFAULT (0) FOR [factor]
--GO
--/****** Object:  Default [DF__RCERTIREN__aAfec__37E53D9E]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RCERTIREN] ADD  DEFAULT (0) FOR [aAfecto]
--GO
--/****** Object:  Default [DF__RCERTIREN__aImpu__38D961D7]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RCERTIREN] ADD  DEFAULT (0) FOR [aImpues]
--GO
--/****** Object:  Default [DF__RCERTIREN__aExen__39CD8610]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RCERTIREN] ADD  DEFAULT (0) FOR [aExento]
--GO
--/****** Object:  Default [DF__RCERTIREN__aZona__3AC1AA49]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RCERTIREN] ADD  DEFAULT (0) FOR [aZonafa]
--GO
--/****** Object:  Default [DF__RCERTIREN__aPpm__3BB5CE82]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RCERTIREN] ADD  DEFAULT (0) FOR [aPpm]
--GO
--/****** Object:  Default [DF__RCERTIREN__numce__3CA9F2BB]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RCERTIREN] ADD  DEFAULT (0) FOR [numcer]
--GO
--/****** Object:  Default [DF__RCERTIREN__Jdd__3D9E16F4]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RCERTIREN] ADD  DEFAULT (0) FOR [Jdd]
--GO
--/****** Object:  Default [DF__RCENTROS__Codigo__595B4002]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RCENTROS] ADD  DEFAULT (' ') FOR [Codigo]
--GO
--/****** Object:  Default [DF__RCENTROS__Ames__5A4F643B]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RCENTROS] ADD  DEFAULT (' ') FOR [Ames]
--GO
--/****** Object:  Default [DF__RCENTROS__Peri__5B438874]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RCENTROS] ADD  DEFAULT (' ') FOR [Peri]
--GO
--/****** Object:  Default [DF__RCENTROS__Period__5C37ACAD]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RCENTROS] ADD  DEFAULT (' ') FOR [Periodo]
--GO
--/****** Object:  Default [DF__RCENTROS__Cencos__5D2BD0E6]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RCENTROS] ADD  DEFAULT (0) FOR [Cencos]
--GO
--/****** Object:  Default [DF__RCENTROS__Porcen__5E1FF51F]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RCENTROS] ADD  DEFAULT (0) FOR [Porcen]
--GO
--/****** Object:  Default [DF__RCENTROS__Unids__5F141958]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RCENTROS] ADD  DEFAULT (0) FOR [Unids]
--GO
--/****** Object:  Default [DF__RCENTROS__Ticen__60083D91]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RCENTROS] ADD  DEFAULT (' ') FOR [Ticen]
--GO
--/****** Object:  Default [DF__RCENTROS__Jdd__60FC61CA]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RCENTROS] ADD  DEFAULT (0) FOR [Jdd]
--GO
/****** Object:  Default [DF__Rbloq__codigo__50BBD860]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Rbloq] ADD  DEFAULT (' ') FOR [codigo]
GO
/****** Object:  Default [DF__Rbloq__id__51AFFC99]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Rbloq] ADD  DEFAULT (' ') FOR [id]
GO
/****** Object:  Default [DF__Rbloq__id_cola__52A420D2]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Rbloq] ADD  DEFAULT (' ') FOR [id_cola]
GO
/****** Object:  Default [DF__Rbloq__Fecha_exp__5398450B]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Rbloq] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [Fecha_exp]
GO
/****** Object:  Default [DF__Rbloq__Jdd__548C6944]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Rbloq] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__RBECAS__RUT__4999D985]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RBECAS] ADD  DEFAULT (' ') FOR [RUT]
GO
/****** Object:  Default [DF__RBECAS__tipobeca__4A8DFDBE]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RBECAS] ADD  DEFAULT (' ') FOR [tipobeca]
GO
/****** Object:  Default [DF__RBECAS__fecha__4B8221F7]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RBECAS] ADD  DEFAULT (getdate()) FOR [fecha]
GO
/****** Object:  Default [DF__RBECAS__fecha_fi__4C764630]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RBECAS] ADD  DEFAULT (getdate()) FOR [fecha_fin]
GO
/****** Object:  Default [DF__RBECAS__instit__4D6A6A69]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RBECAS] ADD  DEFAULT (' ') FOR [instit]
GO
/****** Object:  Default [DF__RBECAS__observ__4E5E8EA2]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RBECAS] ADD  DEFAULT (' ') FOR [observ]
GO
/****** Object:  Default [DF__RBECAS__monto__4F52B2DB]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RBECAS] ADD  DEFAULT (0) FOR [monto]
GO
/****** Object:  Default [DF__RBECAS__Fecha_mo__5046D714]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RBECAS] ADD  DEFAULT (getdate()) FOR [Fecha_mod]
GO
/****** Object:  Default [DF__RBECAS__vobo__513AFB4D]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RBECAS] ADD  DEFAULT (0) FOR [vobo]
GO
/****** Object:  Default [DF__RBECAS__usrvobo__522F1F86]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RBECAS] ADD  DEFAULT (' ') FOR [usrvobo]
GO
/****** Object:  Default [DF__RBECAS__Jdd__59B11114]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RBECAS] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__rbatchvis__Idbat__7B712C3B]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[rbatchvisto] ADD  DEFAULT ((0)) FOR [Idbatch]
GO
/****** Object:  Default [DF__rbatchvis__Exten__7C655074]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[rbatchvisto] ADD  DEFAULT (' ') FOR [Extension]
GO
/****** Object:  Default [DF__rbatchvis__Desca__7D5974AD]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[rbatchvisto] ADD  DEFAULT ((0)) FOR [Descarga]
GO
/****** Object:  Default [DF__rbatchvisto__Jdd__7E4D98E6]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[rbatchvisto] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__rbatchst__Idbatc__3F5C4234]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[rbatchst] ADD  DEFAULT ((0)) FOR [Idbatch]
GO
/****** Object:  Default [DF__rbatchst__Fecha__4050666D]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[rbatchst] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [Fecha]
GO
/****** Object:  Default [DF__rbatchst__Estado__41448AA6]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[rbatchst] ADD  DEFAULT (' ') FOR [Estado]
GO
/****** Object:  Default [DF__rbatchst__Jdd__4238AEDF]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[rbatchst] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__rbatchqf__Idbatc__45151B8A]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[rbatchqf] ADD  DEFAULT ((0)) FOR [Idbatch]
GO
/****** Object:  Default [DF__rbatchqf__Codigo__46093FC3]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[rbatchqf] ADD  DEFAULT (' ') FOR [Codigo]
GO
/****** Object:  Default [DF__rbatchqf__Jdd__46FD63FC]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[rbatchqf] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__rbatchliq__Idbat__49D9D0A7]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[rbatchliq] ADD  DEFAULT ((0)) FOR [Idbatch]
GO
/****** Object:  Default [DF__rbatchliq__Codig__4ACDF4E0]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[rbatchliq] ADD  DEFAULT (' ') FOR [Codigo]
GO
/****** Object:  Default [DF__rbatchliq__Tipo__4BC21919]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[rbatchliq] ADD  DEFAULT ((0)) FOR [Tipo]
GO
/****** Object:  Default [DF__rbatchliq__Orden__4CB63D52]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[rbatchliq] ADD  DEFAULT ((0)) FOR [Orden]
GO
/****** Object:  Default [DF__rbatchliq__Cohad__4DAA618B]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[rbatchliq] ADD  DEFAULT (' ') FOR [Cohade]
GO
/****** Object:  Default [DF__rbatchliq__Desci__4E9E85C4]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[rbatchliq] ADD  DEFAULT (' ') FOR [Descitm]
GO
/****** Object:  Default [DF__rbatchliq__Monto__4F92A9FD]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[rbatchliq] ADD  DEFAULT ((0)) FOR [Monto]
GO
/****** Object:  Default [DF__rbatchliq__Monto__5086CE36]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[rbatchliq] ADD  DEFAULT ((0)) FOR [MontoO]
GO
/****** Object:  Default [DF__rbatchliq__Monto__517AF26F]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[rbatchliq] ADD  DEFAULT ((0)) FOR [MontoA]
GO
/****** Object:  Default [DF__rbatchliq__Cenco__526F16A8]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[rbatchliq] ADD  DEFAULT ((0)) FOR [Cencos]
GO
/****** Object:  Default [DF__rbatchliq__Copre__53633AE1]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[rbatchliq] ADD  DEFAULT ((0)) FOR [Coprev]
GO
/****** Object:  Default [DF__rbatchliq__Orige__54575F1A]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[rbatchliq] ADD  DEFAULT (' ') FOR [Origen]
GO
/****** Object:  Default [DF__rbatchliq__Cmapa__554B8353]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[rbatchliq] ADD  DEFAULT (' ') FOR [Cmapa]
GO
/****** Object:  Default [DF__rbatchliq__Cod_r__563FA78C]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[rbatchliq] ADD  DEFAULT ((0)) FOR [Cod_reg]
GO
/****** Object:  Default [DF__rbatchliq__Empre__5733CBC5]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[rbatchliq] ADD  DEFAULT (' ') FOR [Empresa]
GO
/****** Object:  Default [DF__rbatchliq__Dato__5827EFFE]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[rbatchliq] ADD  DEFAULT (' ') FOR [Dato]
GO
/****** Object:  Default [DF__rbatchliq__Codpr__591C1437]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[rbatchliq] ADD  DEFAULT ((0)) FOR [Codpres]
GO
/****** Object:  Default [DF__rbatchliq__PerIm__5A103870]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[rbatchliq] ADD  DEFAULT ((0)) FOR [PerImp]
GO
/****** Object:  Default [DF__rbatchliq__Infor__5B045CA9]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[rbatchliq] ADD  DEFAULT (' ') FOR [Inform]
GO
/****** Object:  Default [DF__rbatchliq__Nro__5BF880E2]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[rbatchliq] ADD  DEFAULT ((0)) FOR [Nro]
GO
/****** Object:  Default [DF__rbatchliq__Vo__5CECA51B]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[rbatchliq] ADD  DEFAULT ((0)) FOR [Vo]
GO
/****** Object:  Default [DF__rbatchliq__Nombr__5DE0C954]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[rbatchliq] ADD  DEFAULT (' ') FOR [Nombre]
GO
/****** Object:  Default [DF__rbatchliq__Feliq__5ED4ED8D]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[rbatchliq] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [Feliq]
GO
/****** Object:  Default [DF__rbatchliq__Rut__5FC911C6]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[rbatchliq] ADD  DEFAULT (' ') FOR [Rut]
GO
/****** Object:  Default [DF__rbatchliq__Cargo__60BD35FF]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[rbatchliq] ADD  DEFAULT (' ') FOR [Cargo]
GO
/****** Object:  Default [DF__rbatchliq__Fecha__61B15A38]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[rbatchliq] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [Fecha_ing]
GO
/****** Object:  Default [DF__rbatchliq__erut__62A57E71]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[rbatchliq] ADD  DEFAULT (' ') FOR [erut]
GO
/****** Object:  Default [DF__rbatchliq__Cofor__6399A2AA]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[rbatchliq] ADD  DEFAULT (' ') FOR [Coform]
GO
/****** Object:  Default [DF__rbatchliq__hab__648DC6E3]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[rbatchliq] ADD  DEFAULT ((0)) FOR [hab]
GO
/****** Object:  Default [DF__rbatchliq__des__6581EB1C]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[rbatchliq] ADD  DEFAULT ((0)) FOR [des]
GO
/****** Object:  Default [DF__rbatchliq__otr__66760F55]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[rbatchliq] ADD  DEFAULT ((0)) FOR [otr]
GO
/****** Object:  Default [DF__rbatchliq__Dias__676A338E]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[rbatchliq] ADD  DEFAULT ((0)) FOR [Dias]
GO
/****** Object:  Default [DF__rbatchliq__d15__685E57C7]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[rbatchliq] ADD  DEFAULT (' ') FOR [d15]
GO
/****** Object:  Default [DF__rbatchliq__vl__69527C00]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[rbatchliq] ADD  DEFAULT ((0)) FOR [vl]
GO
/****** Object:  Default [DF__rbatchliq__tktdl__6A46A039]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[rbatchliq] ADD  DEFAULT ((0)) FOR [tktdlo]
GO
/****** Object:  Default [DF__rbatchliq__Pone__6B3AC472]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[rbatchliq] ADD  DEFAULT (' ') FOR [Pone]
GO
/****** Object:  Default [DF__rbatchliq__Jdd__6C2EE8AB]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[rbatchliq] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__rbatchliq__dias3__6D230CE4]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[rbatchliq] ADD  DEFAULT ((0)) FOR [dias3pd]
GO
/****** Object:  Default [DF__rbatchliq__licmd__6E17311D]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[rbatchliq] ADD  DEFAULT ((0)) FOR [licmd1]
GO
/****** Object:  Default [DF__rbatchliq__licmd__6F0B5556]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[rbatchliq] ADD  DEFAULT ((0)) FOR [licmd2]
GO
/****** Object:  Default [DF__rbatchliq__licmd__6FFF798F]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[rbatchliq] ADD  DEFAULT ((0)) FOR [licmd3]
GO
/****** Object:  Default [DF__rbatchliq__licmd__70F39DC8]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[rbatchliq] ADD  DEFAULT ((0)) FOR [licmd4]
GO
/****** Object:  Default [DF__rbatchliq__licmd__71E7C201]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[rbatchliq] ADD  DEFAULT ((0)) FOR [licmd5]
GO
/****** Object:  Default [DF__rbatchliq__licmd__72DBE63A]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[rbatchliq] ADD  DEFAULT ((0)) FOR [licmd6]
GO
/****** Object:  Default [DF__rbatchfin__Idbat__32024716]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[rbatchfiniq] ADD  DEFAULT ((0)) FOR [Idbatch]
GO
/****** Object:  Default [DF__rbatchfin__Param__32F66B4F]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[rbatchfiniq] ADD  DEFAULT (' ') FOR [Params]
GO
/****** Object:  Default [DF__rbatchfin__Codig__33EA8F88]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[rbatchfiniq] ADD  DEFAULT (' ') FOR [Codigo]
GO
/****** Object:  Default [DF__rbatchfin__Param__34DEB3C1]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[rbatchfiniq] ADD  DEFAULT (' ') FOR [ParamsRes]
GO
/****** Object:  Default [DF__rbatchfiniq__Jdd__35D2D7FA]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[rbatchfiniq] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__rbatchdes__Nombr__75B852E5]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[rbatchdesc] ADD  DEFAULT (' ') FOR [Nombre]
GO
/****** Object:  Default [DF__rbatchdes__Exten__76AC771E]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[rbatchdesc] ADD  DEFAULT (' ') FOR [Extension]
GO
/****** Object:  Default [DF__rbatchdes__Descr__77A09B57]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[rbatchdesc] ADD  DEFAULT (' ') FOR [Descrip]
GO
/****** Object:  Default [DF__rbatchdesc__Jdd__7894BF90]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[rbatchdesc] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__rbatch__Estado__24A84BF8]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[rbatch] ADD  DEFAULT (' ') FOR [Estado]
GO
/****** Object:  Default [DF__rbatch__JuegoDat__259C7031]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[rbatch] ADD  DEFAULT (' ') FOR [JuegoDatos]
GO
/****** Object:  Default [DF__rbatch__Usuario__2690946A]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[rbatch] ADD  DEFAULT (' ') FOR [Usuario]
GO
/****** Object:  Default [DF__rbatch__Path__2784B8A3]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[rbatch] ADD  DEFAULT (' ') FOR [Path]
GO
/****** Object:  Default [DF__rbatch__Llamador__2878DCDC]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[rbatch] ADD  DEFAULT (' ') FOR [Llamador]
GO
/****** Object:  Default [DF__rbatch__Llamado__296D0115]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[rbatch] ADD  DEFAULT (' ') FOR [Llamado]
GO
/****** Object:  Default [DF__rbatch__Fecha__2A61254E]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[rbatch] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [Fecha]
GO
/****** Object:  Default [DF__rbatch__Params__2B554987]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[rbatch] ADD  DEFAULT (' ') FOR [Params]
GO
/****** Object:  Default [DF__rbatch__Jdd__2C496DC0]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[rbatch] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__rbatch__IdLaunch__2D3D91F9]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[rbatch] ADD  DEFAULT (' ') FOR [IdLauncher]
GO
/****** Object:  Default [DF__rbatch__ProcessI__2E31B632]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[rbatch] ADD  DEFAULT ((0)) FOR [ProcessId]
GO
/****** Object:  Default [DF__rbatch__JobId__2F25DA6B]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[rbatch] ADD  DEFAULT ((0)) FOR [JobId]
GO
/****** Object:  Default [DF__Rbases__Jdd__4EB3945D]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Rbases] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__Rbases__Cliente__4FA7B896]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Rbases] ADD  DEFAULT (' ') FOR [Cliente]
GO
/****** Object:  Default [DF__Rbases__idJdd__509BDCCF]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Rbases] ADD  DEFAULT (' ') FOR [idJdd]
GO
/****** Object:  Default [DF__Rbases__IdClient__51900108]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Rbases] ADD  DEFAULT ((0)) FOR [IdCliente]
GO
/****** Object:  Default [DF__Rbases__Descrip__52842541]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Rbases] ADD  DEFAULT (' ') FOR [Descrip]
GO
/****** Object:  Default [DF__Rbases__stringco__5378497A]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Rbases] ADD  DEFAULT (' ') FOR [stringco]
GO
/****** Object:  Default [DF__Rbases__Pay__546C6DB3]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Rbases] ADD  DEFAULT (' ') FOR [Pay]
GO
/****** Object:  Default [DF__Rbases__Eva__556091EC]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Rbases] ADD  DEFAULT (' ') FOR [Eva]
GO
/****** Object:  Default [DF__Rbases__Sel__5654B625]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Rbases] ADD  DEFAULT (' ') FOR [Sel]
GO
/****** Object:  Default [DF__Rbases__Dcg__5748DA5E]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Rbases] ADD  DEFAULT (' ') FOR [Dcg]
GO
/****** Object:  Default [DF__Rbases__Cap__583CFE97]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Rbases] ADD  DEFAULT (' ') FOR [Cap]
GO
/****** Object:  Default [DF__Rbases__Cas__593122D0]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Rbases] ADD  DEFAULT (' ') FOR [Cas]
GO
/****** Object:  Default [DF__Rbases__Bie__5A254709]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Rbases] ADD  DEFAULT (' ') FOR [Bie]
GO
/****** Object:  Default [DF__Rbases__Ben__5B196B42]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Rbases] ADD  DEFAULT (' ') FOR [Ben]
GO
/****** Object:  Default [DF__Rbases__Mad__5C0D8F7B]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Rbases] ADD  DEFAULT (' ') FOR [Mad]
GO
/****** Object:  Default [DF__Rbases__cola__5D01B3B4]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Rbases] ADD  DEFAULT (' ') FOR [cola]
GO
/****** Object:  Default [DF__Rbases__grupo_ou__5DF5D7ED]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Rbases] ADD  DEFAULT ((0)) FOR [grupo_out]
GO
/****** Object:  Default [DF__Rbases__Quincena__5EE9FC26]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Rbases] ADD  DEFAULT (' ') FOR [Quincena]
GO
/****** Object:  Default [DF__Rbases__Alarma__5FDE205F]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Rbases] ADD  DEFAULT (' ') FOR [Alarma]
GO
/****** Object:  Default [DF__Rbases__IdAdp__60D24498]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Rbases] ADD  DEFAULT (' ') FOR [IdAdp]
GO
/****** Object:  Default [DF__Rbases__Estado__61C668D1]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Rbases] ADD  DEFAULT (' ') FOR [Estado]
GO
/****** Object:  Default [DF__Rbases__BaseE__62BA8D0A]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Rbases] ADD  DEFAULT (' ') FOR [BaseE]
GO
/****** Object:  Default [DF__Rbases__ServerE__63AEB143]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Rbases] ADD  DEFAULT (' ') FOR [ServerE]
GO
/****** Object:  Default [DF__Rbases__ODBC__64A2D57C]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Rbases] ADD  DEFAULT (' ') FOR [ODBC]
GO
/****** Object:  Default [DF__Rbases__Streamli__6596F9B5]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Rbases] ADD  DEFAULT (' ') FOR [Streamline]
GO
/****** Object:  Default [DF__Rbases__BatchMod__668B1DEE]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Rbases] ADD  DEFAULT (' ') FOR [BatchMode]
GO
/****** Object:  Default [DF__Rbases__BatchPat__677F4227]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[Rbases] ADD  DEFAULT (' ') FOR [BatchPath]
GO
/****** Object:  Default [DF__RAUSENT__Codigo__6CA31EA0]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RAUSENT] ADD  DEFAULT (' ') FOR [Codigo]
GO
/****** Object:  Default [DF__RAUSENT__Fecha_i__6D9742D9]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RAUSENT] ADD  DEFAULT (getdate()) FOR [Fecha_ini]
GO
/****** Object:  Default [DF__RAUSENT__Dias__6E8B6712]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RAUSENT] ADD  DEFAULT (0) FOR [Dias]
GO
/****** Object:  Default [DF__RAUSENT__Fecha_f__6F7F8B4B]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RAUSENT] ADD  DEFAULT (getdate()) FOR [Fecha_fin]
GO
/****** Object:  Default [DF__RAUSENT__Fecha_l__7073AF84]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RAUSENT] ADD  DEFAULT (getdate()) FOR [Fecha_lic]
GO
/****** Object:  Default [DF__RAUSENT__Rebsal__7167D3BD]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RAUSENT] ADD  DEFAULT (0) FOR [Rebsal]
GO
/****** Object:  Default [DF__RAUSENT__Escon__725BF7F6]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RAUSENT] ADD  DEFAULT (' ') FOR [Escon]
GO
/****** Object:  Default [DF__RAUSENT__Tipo__73501C2F]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RAUSENT] ADD  DEFAULT (0) FOR [Tipo]
GO
/****** Object:  Default [DF__RAUSENT__Dtipo__74444068]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RAUSENT] ADD  DEFAULT (' ') FOR [Dtipo]
GO
/****** Object:  Default [DF__RAUSENT__Causal__753864A1]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RAUSENT] ADD  DEFAULT (0) FOR [Causal]
GO
/****** Object:  Default [DF__RAUSENT__Dcausal__762C88DA]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RAUSENT] ADD  DEFAULT (' ') FOR [Dcausal]
GO
/****** Object:  Default [DF__RAUSENT__Detalle__7720AD13]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RAUSENT] ADD  DEFAULT (' ') FOR [Detalle]
GO
/****** Object:  Default [DF__RAUSENT__Medico__7814D14C]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RAUSENT] ADD  DEFAULT (' ') FOR [Medico]
GO
/****** Object:  Default [DF__RAUSENT__Nulic__7908F585]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RAUSENT] ADD  DEFAULT (0) FOR [Nulic]
GO
/****** Object:  Default [DF__RAUSENT__DiasE__79FD19BE]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RAUSENT] ADD  DEFAULT (0) FOR [DiasE]
GO
/****** Object:  Default [DF__RAUSENT__Medios__7AF13DF7]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RAUSENT] ADD  DEFAULT (' ') FOR [Medios]
GO
/****** Object:  Default [DF__RAUSENT__Diagnos__7BE56230]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RAUSENT] ADD  DEFAULT (0) FOR [Diagnos]
GO
/****** Object:  Default [DF__RAUSENT__Mailen__7CD98669]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RAUSENT] ADD  DEFAULT (0) FOR [Mailen]
GO
/****** Object:  Default [DF__RAUSENT__Jdd__7DCDAAA2]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RAUSENT] ADD  DEFAULT (0) FOR [Jdd]
GO
/****** Object:  Default [DF__RAUSENT__fecha_r__3BEAD8AC]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RAUSENT] ADD  DEFAULT (' ') FOR [fecha_ret]
GO
/****** Object:  Default [DF__RAUSENT__Rutpro__79B300FB]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RAUSENT] ADD  DEFAULT (' ') FOR [Rutpro]
GO
/****** Object:  Default [DF__RAUSENT__Especia__7AA72534]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RAUSENT] ADD  DEFAULT (1) FOR [Especia]
GO
/****** Object:  Default [DF__RAUSENT__MontoAn__7B9B496D]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RAUSENT] ADD  DEFAULT (0) FOR [MontoAn]
GO
/****** Object:  Default [DF__RAUSENT__MontoRe__7C8F6DA6]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RAUSENT] ADD  DEFAULT (0) FOR [MontoRe]
GO
/****** Object:  Default [DF__RAUSENT__MontoCo__7D8391DF]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RAUSENT] ADD  DEFAULT (0) FOR [MontoCo]
GO
/****** Object:  Default [DF__RAUSENT__Fecha_i__75AD65ED]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RAUSENT] ADD  DEFAULT (' ') FOR [Fecha_ico]
GO
/****** Object:  Default [DF__RAUSENT__fecha_e__0C5BC11B]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RAUSENT] ADD  DEFAULT (' ') FOR [fecha_env]
GO
/****** Object:  Default [DF__RAUSENT__estado__0D4FE554]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RAUSENT] ADD  DEFAULT (' ') FOR [estado]
GO
/****** Object:  Default [DF__RAUSENT__CodSub__0E44098D]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RAUSENT] ADD  DEFAULT (' ') FOR [CodSub]
GO
/****** Object:  Default [DF__RAUSENT__fecha_i__24334AAC]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RAUSENT] ADD  DEFAULT (' ') FOR [fecha_ing]
GO
/****** Object:  Default [DF__RAUSENT__usuario__25276EE5]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RAUSENT] ADD  DEFAULT (' ') FOR [usuario]
GO
/****** Object:  Default [DF__RAUSENT__origen__261B931E]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RAUSENT] ADD  DEFAULT (' ') FOR [origen]
GO
/****** Object:  Default [DF__RAUSENT__Dias3pd__7DD8979A]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RAUSENT] ADD  DEFAULT ((0)) FOR [Dias3pd]
GO
/****** Object:  Default [DF__RAUSENT__Fecha_u__7ECCBBD3]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RAUSENT] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(120)),(120))) FOR [Fecha_ult]
GO
/****** Object:  Default [DF__RAUSENT__SubsilB__7FC0E00C]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RAUSENT] ADD  DEFAULT ((0)) FOR [SubsilB]
GO
/****** Object:  Default [DF__RAUSENT__SubsilN__00B50445]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RAUSENT] ADD  DEFAULT ((0)) FOR [SubsilN]
GO
/****** Object:  Default [DF__RAUSENT__Dv__01741E54]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RAUSENT] ADD  DEFAULT (' ') FOR [Dv]
GO
/****** Object:  Default [DF__RAUSENT__Lscan__2CDE6A9D]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RAUSENT] ADD  DEFAULT ((0)) FOR [Lscan]
GO
--/****** Object:  Default [DF__RASIGNA__Codigo__0E04126B]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RASIGNA] ADD  DEFAULT (' ') FOR [Codigo]
--GO
--/****** Object:  Default [DF__RASIGNA__Fecha_a__0EF836A4]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RASIGNA] ADD  DEFAULT (getdate()) FOR [Fecha_asi]
--GO
--/****** Object:  Default [DF__RASIGNA__Descrip__0FEC5ADD]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RASIGNA] ADD  DEFAULT (' ') FOR [Descrip]
--GO
--/****** Object:  Default [DF__RASIGNA__Valor__10E07F16]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RASIGNA] ADD  DEFAULT (0) FOR [Valor]
--GO
--/****** Object:  Default [DF__RASIGNA__Fecha_v__11D4A34F]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RASIGNA] ADD  DEFAULT (getdate()) FOR [Fecha_ven]
--GO
--/****** Object:  Default [DF__RASIGNA__Bien__12C8C788]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RASIGNA] ADD  DEFAULT (0) FOR [Bien]
--GO
--/****** Object:  Default [DF__RASIGNA__Respon__13BCEBC1]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RASIGNA] ADD  DEFAULT (' ') FOR [Respon]
--GO
--/****** Object:  Default [DF__RASIGNA__Obs__14B10FFA]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RASIGNA] ADD  DEFAULT (' ') FOR [Obs]
--GO
--/****** Object:  Default [DF__RASIGNA__Devuelt__15A53433]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RASIGNA] ADD  DEFAULT (' ') FOR [Devuelto]
--GO
--/****** Object:  Default [DF__RASIGNA__Jdd__1699586C]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RASIGNA] ADD  DEFAULT (0) FOR [Jdd]
--GO
--/****** Object:  Default [DF__RASIGNA__Cantid__7E77B618]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RASIGNA] ADD  DEFAULT (0) FOR [Cantid]
--GO
/****** Object:  Default [DF__RAlertasEnvi__Id__012A0591]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RAlertasEnvio] ADD  DEFAULT ((0)) FOR [Id]
GO
/****** Object:  Default [DF__RAlertasE__Fecha__021E29CA]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RAlertasEnvio] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [FechaEnvio]
GO
/****** Object:  Default [DF__RAlertasE__Estad__03124E03]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RAlertasEnvio] ADD  DEFAULT (' ') FOR [Estado]
GO
/****** Object:  Default [DF__RAlertasE__Usuar__0406723C]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RAlertasEnvio] ADD  DEFAULT (' ') FOR [Usuario1]
GO
/****** Object:  Default [DF__RAlertasE__Visto__04FA9675]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RAlertasEnvio] ADD  DEFAULT (' ') FOR [Visto]
GO
/****** Object:  Default [DF__RAlertasE__Usuar__05EEBAAE]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RAlertasEnvio] ADD  DEFAULT (' ') FOR [Usuario2]
GO
/****** Object:  Default [DF__RAlertasE__Usuar__06E2DEE7]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RAlertasEnvio] ADD  DEFAULT (' ') FOR [Usuario3]
GO
/****** Object:  Default [DF__RAlertasE__Texto__07D70320]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RAlertasEnvio] ADD  DEFAULT (' ') FOR [Texto]
GO
/****** Object:  Default [DF__RALERTAS5__Id__09F455BC]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RALERTAS5] ADD  DEFAULT ((0)) FOR [Id]
GO
/****** Object:  Default [DF__RALERTAS5__Ubica__0AE879F5]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RALERTAS5] ADD  DEFAULT (' ') FOR [Ubica]
GO
/****** Object:  Default [DF__RALERTAS5__Descr__0BDC9E2E]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RALERTAS5] ADD  DEFAULT (' ') FOR [Descrip]
GO
/****** Object:  Default [DF__RALERTAS5__Proce__0CD0C267]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RALERTAS5] ADD  DEFAULT (' ') FOR [Proce]
GO
/****** Object:  Default [DF__RALERTAS5__Estad__0DC4E6A0]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RALERTAS5] ADD  DEFAULT (' ') FOR [Estado]
GO
/****** Object:  Default [DF__RALERTAS5__Param__0EB90AD9]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RALERTAS5] ADD  DEFAULT (' ') FOR [Params]
GO
/****** Object:  Default [DF__RALERTAS5__Expli__0FAD2F12]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RALERTAS5] ADD  DEFAULT (' ') FOR [Explica]
GO
/****** Object:  Default [DF__RALERTAS5__Jdd__10A1534B]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RALERTAS5] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__RALERTAS5__Usuar__11957784]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RALERTAS5] ADD  DEFAULT (' ') FOR [Usuario1]
GO
/****** Object:  Default [DF__RALERTAS5__Campo__12899BBD]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RALERTAS5] ADD  DEFAULT (' ') FOR [Campo]
GO
/****** Object:  Default [DF__RALERTAS5__Dias__137DBFF6]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RALERTAS5] ADD  DEFAULT ((0)) FOR [Dias]
GO
/****** Object:  Default [DF__RALERTAS5__Hora__1471E42F]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RALERTAS5] ADD  DEFAULT ((0)) FOR [Hora]
GO
/****** Object:  Default [DF__RALERTAS5__Templ__15660868]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RALERTAS5] ADD  DEFAULT (' ') FOR [Template]
GO
/****** Object:  Default [DF__RALERTAS5__Fecha__165A2CA1]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RALERTAS5] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [FechaEnvio]
GO
/****** Object:  Default [DF__RALERTAS5__Envia__174E50DA]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RALERTAS5] ADD  DEFAULT (' ') FOR [EnviaSMS]
GO
/****** Object:  Default [DF__RALERTAS5__Envia__18427513]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RALERTAS5] ADD  DEFAULT (' ') FOR [EnviaMail]
GO
/****** Object:  Default [DF__RALERTAS5__Usuar__1936994C]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RALERTAS5] ADD  DEFAULT (' ') FOR [Usuario2]
GO
/****** Object:  Default [DF__RALERTAS5__Usuar__1A2ABD85]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RALERTAS5] ADD  DEFAULT (' ') FOR [Usuario3]
GO
/****** Object:  Default [DF__RALERTAS__Id__550B8C31]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RALERTAS] ADD  DEFAULT (0) FOR [Id]
GO
/****** Object:  Default [DF__RALERTAS__Descri__55FFB06A]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RALERTAS] ADD  DEFAULT (' ') FOR [Descrip]
GO
/****** Object:  Default [DF__RALERTAS__Estado__56F3D4A3]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RALERTAS] ADD  DEFAULT (' ') FOR [Estado]
GO
/****** Object:  Default [DF__RALERTAS__Ubica__57E7F8DC]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RALERTAS] ADD  DEFAULT (' ') FOR [Ubica]
GO
/****** Object:  Default [DF__RALERTAS__Proce__58DC1D15]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RALERTAS] ADD  DEFAULT (' ') FOR [Proce]
GO
/****** Object:  Default [DF__RALERTAS__Params__59D0414E]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RALERTAS] ADD  DEFAULT (' ') FOR [Params]
GO
/****** Object:  Default [DF__RALERTAS__Explic__5AC46587]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RALERTAS] ADD  DEFAULT (' ') FOR [Explica]
GO
/****** Object:  Default [DF__RALERTAS__Jdd__5BB889C0]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RALERTAS] ADD  DEFAULT (0) FOR [Jdd]
GO
/****** Object:  Default [DF__RALERTAS__Usuari__4B62F1BD]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RALERTAS] ADD  DEFAULT (' ') FOR [Usuario1]
GO
/****** Object:  Default [DF__RALERTAS__Campo__4C5715F6]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RALERTAS] ADD  DEFAULT (' ') FOR [Campo]
GO
/****** Object:  Default [DF__RALERTAS__Dias__4D4B3A2F]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RALERTAS] ADD  DEFAULT (' ') FOR [Dias]
GO
/****** Object:  Default [DF__RALERTAS__Hora__4E3F5E68]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RALERTAS] ADD  DEFAULT ((0)) FOR [Hora]
GO
/****** Object:  Default [DF__RALERTAS__Templa__4F3382A1]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RALERTAS] ADD  DEFAULT (' ') FOR [Template]
GO
/****** Object:  Default [DF__RALERTAS__FechaE__5027A6DA]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RALERTAS] ADD  DEFAULT (' ') FOR [FechaEnvio]
GO
/****** Object:  Default [DF__RALERTAS__EnviaS__520FEF4C]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RALERTAS] ADD  DEFAULT (' ') FOR [EnviaSMS]
GO
/****** Object:  Default [DF__RALERTAS__EnviaM__53041385]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RALERTAS] ADD  DEFAULT (' ') FOR [EnviaMail]
GO
/****** Object:  Default [DF__RALERTAS__Usuari__54EC5BF7]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RALERTAS] ADD  DEFAULT (' ') FOR [Usuario2]
GO
/****** Object:  Default [DF__RALERTAS__Usuari__55E08030]    Script Date: 10/19/2015 10:35:10 ******/
ALTER TABLE [dbo].[RALERTAS] ADD  DEFAULT (' ') FOR [Usuario3]
GO
--/****** Object:  Default [DF__RAFECTOS__Codigo__5D6BC808]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RAFECTOS] ADD  DEFAULT (' ') FOR [Codigo]
--GO
--/****** Object:  Default [DF__RAFECTOS__Ames__5E5FEC41]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RAFECTOS] ADD  DEFAULT (' ') FOR [Ames]
--GO
--/****** Object:  Default [DF__RAFECTOS__Peri__5F54107A]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RAFECTOS] ADD  DEFAULT (' ') FOR [Peri]
--GO
--/****** Object:  Default [DF__RAFECTOS__Jdd__604834B3]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RAFECTOS] ADD  DEFAULT ((0)) FOR [Jdd]
--GO
--/****** Object:  Default [DF__RAFECTOS__AF01__613C58EC]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RAFECTOS] ADD  DEFAULT ((0)) FOR [AF01]
--GO
--/****** Object:  Default [DF__RAFECTOS__AF02__62307D25]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RAFECTOS] ADD  DEFAULT ((0)) FOR [AF02]
--GO
--/****** Object:  Default [DF__RAFECTOS__AF03__6324A15E]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RAFECTOS] ADD  DEFAULT ((0)) FOR [AF03]
--GO
--/****** Object:  Default [DF__RAFECTOS__AF04__6418C597]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RAFECTOS] ADD  DEFAULT ((0)) FOR [AF04]
--GO
--/****** Object:  Default [DF__RAFECTOS__AF05__650CE9D0]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RAFECTOS] ADD  DEFAULT ((0)) FOR [AF05]
--GO
--/****** Object:  Default [DF__RAFECTOS__AF06__66010E09]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RAFECTOS] ADD  DEFAULT ((0)) FOR [AF06]
--GO
--/****** Object:  Default [DF__RAFECTOS__AF07__66F53242]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RAFECTOS] ADD  DEFAULT ((0)) FOR [AF07]
--GO
--/****** Object:  Default [DF__RAFECTOS__AF08__67E9567B]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RAFECTOS] ADD  DEFAULT ((0)) FOR [AF08]
--GO
--/****** Object:  Default [DF__RAFECTOS__AF09__68DD7AB4]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RAFECTOS] ADD  DEFAULT ((0)) FOR [AF09]
--GO
--/****** Object:  Default [DF__RAFECTOS__AF10__69D19EED]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RAFECTOS] ADD  DEFAULT ((0)) FOR [AF10]
--GO
--/****** Object:  Default [DF__RAFECTOS__AF11__6AC5C326]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RAFECTOS] ADD  DEFAULT ((0)) FOR [AF11]
--GO
--/****** Object:  Default [DF__RAFECTOS__AF12__6BB9E75F]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RAFECTOS] ADD  DEFAULT ((0)) FOR [AF12]
--GO
--/****** Object:  Default [DF__RAFECTOS__AF13__6CAE0B98]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RAFECTOS] ADD  DEFAULT ((0)) FOR [AF13]
--GO
--/****** Object:  Default [DF__RAFECTOS__AF14__6DA22FD1]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RAFECTOS] ADD  DEFAULT ((0)) FOR [AF14]
--GO
--/****** Object:  Default [DF__RAFECTOS__AF15__6E96540A]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RAFECTOS] ADD  DEFAULT ((0)) FOR [AF15]
--GO
--/****** Object:  Default [DF__RAFECTOS__AF16__6F8A7843]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RAFECTOS] ADD  DEFAULT ((0)) FOR [AF16]
--GO
--/****** Object:  Default [DF__RAFECTOS__AF17__707E9C7C]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RAFECTOS] ADD  DEFAULT ((0)) FOR [AF17]
--GO
--/****** Object:  Default [DF__RAFECTOS__AF18__7172C0B5]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RAFECTOS] ADD  DEFAULT ((0)) FOR [AF18]
--GO
--/****** Object:  Default [DF__RAFECTOS__AF19__7266E4EE]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RAFECTOS] ADD  DEFAULT ((0)) FOR [AF19]
--GO
--/****** Object:  Default [DF__RAFECTOS__AF20__735B0927]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RAFECTOS] ADD  DEFAULT ((0)) FOR [AF20]
--GO
--/****** Object:  Default [DF__RAFECTOS__AF21__7CAF6937]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RAFECTOS] ADD  DEFAULT ((0)) FOR [AF21]
--GO
--/****** Object:  Default [DF__RAFECTOS__AF22__7DA38D70]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RAFECTOS] ADD  DEFAULT ((0)) FOR [AF22]
--GO
--/****** Object:  Default [DF__RAFECTOS__AF23__7E97B1A9]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RAFECTOS] ADD  DEFAULT ((0)) FOR [AF23]
--GO
--/****** Object:  Default [DF__RAFECTOS__AF24__7F8BD5E2]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RAFECTOS] ADD  DEFAULT ((0)) FOR [AF24]
--GO
--/****** Object:  Default [DF__RAFECTOS__AF25__007FFA1B]    Script Date: 10/19/2015 10:35:10 ******/
--ALTER TABLE [dbo].[RAFECTOS] ADD  DEFAULT ((0)) FOR [AF25]
--GO