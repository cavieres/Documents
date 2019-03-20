/****** Object:  Table [dbo].[Tbrhuids]    Script Date: 04/12/2016 17:51:08 ******/
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
/****** Object:  Table [dbo].[TBRHUCAT]    Script Date: 04/12/2016 17:51:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TBRHUCAT](
	[catmodulo] [char](3) NOT NULL,
	[catnombre] [char](60) NOT NULL,
	[catcaption] [char](30) NOT NULL,
	[catdescrip] [char](80) NOT NULL,
	[catform] [char](30) NOT NULL,
	[catoricap] [char](30) NOT NULL,
	[catorides] [char](200) NOT NULL,
	[Jdd] [int] NOT NULL,
 CONSTRAINT [PK_TBRHUCAT] PRIMARY KEY CLUSTERED 
(
	[Jdd] ASC,
	[catmodulo] ASC,
	[catform] ASC,
	[catnombre] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbprs]    Script Date: 04/12/2016 17:51:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbprs](
	[prsrid] [int] IDENTITY(1,1) NOT NULL,
	[prsrut] [varchar](10) NOT NULL,
	[prsnom] [varchar](100) NOT NULL,
	[prsapepat] [varchar](50) NULL,
	[prsapemat] [varchar](50) NULL,
	[prsemail] [varchar](50) NULL,
	[prsfechnac] [datetime] NULL,
	[Jdd] [int] NOT NULL,
 CONSTRAINT [PK_prsrid] PRIMARY KEY CLUSTERED 
(
	[prsrid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbproc]    Script Date: 04/12/2016 17:51:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbproc](
	[procid] [int] IDENTITY(1,1) NOT NULL,
	[procnom] [varchar](150) NULL,
	[proctipo] [bigint] NULL,
	[Jdd] [int] NOT NULL,
 CONSTRAINT [PK_procID] PRIMARY KEY CLUSTERED 
(
	[procid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Tbporvdp]    Script Date: 04/12/2016 17:51:08 ******/
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
/****** Object:  Table [dbo].[Tbporrsa]    Script Date: 04/12/2016 17:51:08 ******/
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
/****** Object:  Table [dbo].[Tbporrec]    Script Date: 04/12/2016 17:51:08 ******/
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
/****** Object:  Table [dbo].[Tbporrdp]    Script Date: 04/12/2016 17:51:08 ******/
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
/****** Object:  Table [dbo].[Tbporrca]    Script Date: 04/12/2016 17:51:08 ******/
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
/****** Object:  Table [dbo].[Tbporpun]    Script Date: 04/12/2016 17:51:08 ******/
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
/****** Object:  Table [dbo].[Tbporexa]    Script Date: 04/12/2016 17:51:08 ******/
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
/****** Object:  Table [dbo].[Tbpordto]    Script Date: 04/12/2016 17:51:08 ******/
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
/****** Object:  Table [dbo].[Tbpordoc]    Script Date: 04/12/2016 17:51:08 ******/
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
/****** Object:  Table [dbo].[Tbpordmp]    Script Date: 04/12/2016 17:51:08 ******/
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
/****** Object:  Table [dbo].[Tbporcom]    Script Date: 04/12/2016 17:51:08 ******/
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
/****** Object:  Table [dbo].[Tbporcgo]    Script Date: 04/12/2016 17:51:08 ******/
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
	[cgocodigo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Tbporbdp]    Script Date: 04/12/2016 17:51:08 ******/
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
/****** Object:  Table [dbo].[Tbporadi]    Script Date: 04/12/2016 17:51:08 ******/
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
/****** Object:  Table [dbo].[Tbporact]    Script Date: 04/12/2016 17:51:08 ******/
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
/****** Object:  Table [dbo].[tbplantillas]    Script Date: 04/12/2016 17:51:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbplantillas](
	[idPlantilla] [int] NOT NULL,
	[nomPlantilla] [varchar](50) NOT NULL,
	[plantilla] [varbinary](max) NOT NULL,
	[extPlantilla] [varchar](50) NOT NULL,
	[idTipoArchivo] [int] NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbpcparc]    Script Date: 04/12/2016 17:51:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbpcparc](
	[idArchivo] [int] IDENTITY(1,1) NOT NULL,
	[nomCarga] [varchar](30) NOT NULL,
	[nomArch] [varchar](30) NOT NULL,
	[extArch] [varchar](30) NOT NULL,
	[comArch] [varchar](256) NOT NULL,
	[tipArch] [int] NOT NULL,
	[idEstado] [int] NOT NULL,
	[UsuarAlta] [varchar](30) NOT NULL,
	[fechAlta] [datetime] NOT NULL,
	[UsuarUltM] [varchar](30) NOT NULL,
	[fechUltM] [datetime] NOT NULL,
	[archivo] [varbinary](max) NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbmens]    Script Date: 04/12/2016 17:51:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbmens](
	[mensid] [int] IDENTITY(1,1) NOT NULL,
	[IDCliente] [int] NOT NULL,
	[mensfechini] [datetime] NULL,
	[mensfechfin] [datetime] NULL,
	[mensdetall] [varchar](max) NULL,
	[Jdd] [int] NOT NULL,
 CONSTRAINT [PK_mensid] PRIMARY KEY CLUSTERED 
(
	[mensid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[pcpCargas]    Script Date: 04/12/2016 17:51:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[pcpCargas](
	[idCarga] [int] IDENTITY(1,1) NOT NULL,
	[fecha] [datetime] NOT NULL,
	[USUARIO] [char](12) NOT NULL,
	[Titulo] [varchar](40) NOT NULL,
	[Descripcion] [varchar](200) NULL,
	[Tipo] [int] NOT NULL,
	[Archivo] [varbinary](max) NOT NULL,
	[nomArch] [nvarchar](100) NOT NULL,
	[extArch] [nvarchar](20) NOT NULL,
	[Jdd] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idCarga] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PCPCALHIST]    Script Date: 04/12/2016 17:51:07 ******/
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
/****** Object:  Table [dbo].[PCPCALENDAR]    Script Date: 04/12/2016 17:51:07 ******/
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
/****** Object:  Table [dbo].[LaunchServers]    Script Date: 04/12/2016 17:51:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LaunchServers](
	[IdLaunch] [int] IDENTITY(1,1) NOT NULL,
	[UrlServ] [varchar](100) NOT NULL,
	[ServName] [varchar](50) NOT NULL,
	[CPU] [int] NOT NULL,
	[SrvState] [char](1) NOT NULL,
	[LastRun] [datetime] NULL,
 CONSTRAINT [PK_LaunchServers] PRIMARY KEY CLUSTERED 
(
	[IdLaunch] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[interconnection_token]    Script Date: 04/12/2016 17:51:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[interconnection_token](
	[domain] [varchar](50) NOT NULL,
	[dataset] [varchar](50) NOT NULL,
	[token] [char](32) NOT NULL,
	[creation] [datetime] NOT NULL,
 CONSTRAINT [PK_interconnection_token] PRIMARY KEY CLUSTERED 
(
	[token] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[conFotos]    Script Date: 04/12/2016 17:51:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[conFotos](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](255) NULL,
	[Foto] [image] NULL,
	[Foto2] [varbinary](max) NULL,
	[Archivo] [varbinary](max) NULL,
	[NombreArchivo] [varchar](50) NULL,
 CONSTRAINT [PK_conFotos] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbtransf]    Script Date: 04/12/2016 17:51:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbtransf](
	[transfid] [int] IDENTITY(1,1) NOT NULL,
	[transftipo] [int] NOT NULL,
	[transfobs] [varchar](max) NULL,
	[transfver] [varchar](50) NULL,
	[transfelim] [int] NULL,
	[transfentid] [int] NULL,
	[Jdd] [int] NOT NULL,
 CONSTRAINT [fk_trabsfid] PRIMARY KEY CLUSTERED 
(
	[transfid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbcat]    Script Date: 04/12/2016 17:51:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbcat](
	[catid] [int] IDENTITY(1,1) NOT NULL,
	[catproblid] [int] NOT NULL,
	[cattipoid] [int] NOT NULL,
	[catdet] [int] NOT NULL,
	[catsoluc] [varchar](max) NOT NULL,
	[Jdd] [int] NOT NULL,
 CONSTRAINT [PK_catid] PRIMARY KEY CLUSTERED 
(
	[catid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TBCASUFU]    Script Date: 04/12/2016 17:51:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TBCASUFU](
	[CodigoUF] [int] NOT NULL,
	[Tope] [int] NOT NULL,
	[Horas] [int] NOT NULL,
	[Aprobador1] [char](12) NOT NULL,
	[Aprobador2] [char](12) NOT NULL,
 CONSTRAINT [PK_TBCASUFU] PRIMARY KEY CLUSTERED 
(
	[CodigoUF] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TBCASTUF]    Script Date: 04/12/2016 17:51:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TBCASTUF](
	[CodigoUF] [int] NOT NULL,
	[Tareador] [char](12) NOT NULL,
 CONSTRAINT [PK_TBCASTUF] PRIMARY KEY CLUSTERED 
(
	[CodigoUF] ASC,
	[Tareador] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TBCASTRA]    Script Date: 04/12/2016 17:51:08 ******/
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
/****** Object:  Table [dbo].[tbcastnn]    Script Date: 04/12/2016 17:51:08 ******/
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
/****** Object:  Table [dbo].[tbcastnm]    Script Date: 04/12/2016 17:51:08 ******/
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
/****** Object:  Table [dbo].[TbCasTar]    Script Date: 04/12/2016 17:51:08 ******/
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
/****** Object:  Table [dbo].[TbCasTad]    Script Date: 04/12/2016 17:51:08 ******/
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
 CONSTRAINT [PK_TbCasTad] PRIMARY KEY CLUSTERED 
(
	[TadAmes] ASC,
	[TadUnidad] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TbCasStr]    Script Date: 04/12/2016 17:51:08 ******/
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
/****** Object:  Table [dbo].[TbCasSrA]    Script Date: 04/12/2016 17:51:08 ******/
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
/****** Object:  Table [dbo].[tbcasrel]    Script Date: 04/12/2016 17:51:08 ******/
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
/****** Object:  Table [dbo].[TBCASRAC]    Script Date: 04/12/2016 17:51:08 ******/
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
/****** Object:  Table [dbo].[tbcasper]    Script Date: 04/12/2016 17:51:08 ******/
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
/****** Object:  Table [dbo].[tbcaspen]    Script Date: 04/12/2016 17:51:08 ******/
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
/****** Object:  Table [dbo].[TbCasPdo]    Script Date: 04/12/2016 17:51:08 ******/
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
/****** Object:  Table [dbo].[tbcaspac]    Script Date: 04/12/2016 17:51:08 ******/
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
/****** Object:  Table [dbo].[tbcasnov]    Script Date: 04/12/2016 17:51:08 ******/
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
/****** Object:  Table [dbo].[tbcasnoh]    Script Date: 04/12/2016 17:51:08 ******/
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
/****** Object:  Table [dbo].[tbcasnmo]    Script Date: 04/12/2016 17:51:08 ******/
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
/****** Object:  Table [dbo].[tbcasnmh]    Script Date: 04/12/2016 17:51:08 ******/
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
/****** Object:  Table [dbo].[tbcasneg]    Script Date: 04/12/2016 17:51:08 ******/
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
/****** Object:  Table [dbo].[TBCASLIQ]    Script Date: 04/12/2016 17:51:08 ******/
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
/****** Object:  Table [dbo].[TbCasEva]    Script Date: 04/12/2016 17:51:08 ******/
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
/****** Object:  Table [dbo].[TBCASETU]    Script Date: 04/12/2016 17:51:08 ******/
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
/****** Object:  Table [dbo].[TBCASETR]    Script Date: 04/12/2016 17:51:08 ******/
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
/****** Object:  Table [dbo].[TBCASERT]    Script Date: 04/12/2016 17:51:08 ******/
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
/****** Object:  Table [dbo].[TBCASERO]    Script Date: 04/12/2016 17:51:08 ******/
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
/****** Object:  Table [dbo].[tbcasera]    Script Date: 04/12/2016 17:51:08 ******/
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
/****** Object:  Table [dbo].[tbcaselm]    Script Date: 04/12/2016 17:51:08 ******/
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
/****** Object:  Table [dbo].[tbcascre]    Script Date: 04/12/2016 17:51:08 ******/
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
/****** Object:  Table [dbo].[tbcascom]    Script Date: 04/12/2016 17:51:08 ******/
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
/****** Object:  Table [dbo].[tbcascoh]    Script Date: 04/12/2016 17:51:08 ******/
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
/****** Object:  Table [dbo].[TBCASCLK]    Script Date: 04/12/2016 17:51:08 ******/
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
/****** Object:  Table [dbo].[TBCASCFG]    Script Date: 04/12/2016 17:51:08 ******/
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
/****** Object:  Table [dbo].[tbcascex]    Script Date: 04/12/2016 17:51:08 ******/
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
/****** Object:  Table [dbo].[tbcascco]    Script Date: 04/12/2016 17:51:08 ******/
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
/****** Object:  Table [dbo].[TBCASCAT]    Script Date: 04/12/2016 17:51:08 ******/
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
/****** Object:  Table [dbo].[tbcasbla]    Script Date: 04/12/2016 17:51:08 ******/
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
/****** Object:  Table [dbo].[TBCASAPH]    Script Date: 04/12/2016 17:51:08 ******/
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
/****** Object:  Table [dbo].[TBCASAPA]    Script Date: 04/12/2016 17:51:08 ******/
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
/****** Object:  Table [dbo].[tbcasacc]    Script Date: 04/12/2016 17:51:08 ******/
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
/****** Object:  Table [dbo].[TBEVAVOT]    Script Date: 04/12/2016 17:51:08 ******/
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
/****** Object:  Table [dbo].[TBEVATDM]    Script Date: 04/12/2016 17:51:08 ******/
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
/****** Object:  Table [dbo].[TBEVASUC]    Script Date: 04/12/2016 17:51:08 ******/
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
/****** Object:  Table [dbo].[TBEVASFD]    Script Date: 04/12/2016 17:51:08 ******/
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
/****** Object:  Table [dbo].[TBEVASFA]    Script Date: 04/12/2016 17:51:08 ******/
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
/****** Object:  Table [dbo].[TBEVARDF]    Script Date: 04/12/2016 17:51:08 ******/
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
/****** Object:  Table [dbo].[TBEVAPSF]    Script Date: 04/12/2016 17:51:08 ******/
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
/****** Object:  Table [dbo].[TBEVAOBJ]    Script Date: 04/12/2016 17:51:08 ******/
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
/****** Object:  Table [dbo].[TBEVANOT]    Script Date: 04/12/2016 17:51:08 ******/
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
/****** Object:  Table [dbo].[TBEVAMTA]    Script Date: 04/12/2016 17:51:08 ******/
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
/****** Object:  Table [dbo].[TBEVAMGR]    Script Date: 04/12/2016 17:51:08 ******/
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
/****** Object:  Table [dbo].[TBEVAMET]    Script Date: 04/12/2016 17:51:08 ******/
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
/****** Object:  Table [dbo].[TBEVAMCG]    Script Date: 04/12/2016 17:51:08 ******/
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
/****** Object:  Table [dbo].[TBEVAIRE]    Script Date: 04/12/2016 17:51:08 ******/
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
/****** Object:  Table [dbo].[TBEVAINP]    Script Date: 04/12/2016 17:51:08 ******/
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
/****** Object:  Table [dbo].[TBEVAINC]    Script Date: 04/12/2016 17:51:08 ******/
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
/****** Object:  Table [dbo].[TBEVAFPO]    Script Date: 04/12/2016 17:51:08 ******/
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
/****** Object:  Table [dbo].[TBEVAFMT]    Script Date: 04/12/2016 17:51:08 ******/
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
/****** Object:  Table [dbo].[TBEVAFMD]    Script Date: 04/12/2016 17:51:08 ******/
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
/****** Object:  Table [dbo].[TBEVAFGR]    Script Date: 04/12/2016 17:51:08 ******/
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
/****** Object:  Table [dbo].[TBEVAFFA]    Script Date: 04/12/2016 17:51:08 ******/
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
/****** Object:  Table [dbo].[TBEVAFCT]    Script Date: 04/12/2016 17:51:08 ******/
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
/****** Object:  Table [dbo].[TBEVAFCP]    Script Date: 04/12/2016 17:51:08 ******/
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
/****** Object:  Table [dbo].[TBEVAFCD]    Script Date: 04/12/2016 17:51:08 ******/
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
/****** Object:  Table [dbo].[TBEVAEVP]    Script Date: 04/12/2016 17:51:08 ******/
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
/****** Object:  Table [dbo].[TBEVAEVD]    Script Date: 04/12/2016 17:51:08 ******/
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
/****** Object:  Table [dbo].[TBEVAEMP]    Script Date: 04/12/2016 17:51:08 ******/
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
/****** Object:  Table [dbo].[TBEVADPR]    Script Date: 04/12/2016 17:51:08 ******/
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
/****** Object:  Table [dbo].[TBEVADEP]    Script Date: 04/12/2016 17:51:08 ******/
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
/****** Object:  Table [dbo].[TBEVADEF]    Script Date: 04/12/2016 17:51:08 ******/
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
/****** Object:  Table [dbo].[TBEVACON]    Script Date: 04/12/2016 17:51:08 ******/
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
/****** Object:  Table [dbo].[TBEVACGR]    Script Date: 04/12/2016 17:51:08 ******/
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
/****** Object:  Table [dbo].[TBEVACFG]    Script Date: 04/12/2016 17:51:08 ******/
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
/****** Object:  Table [dbo].[TBEVACES]    Script Date: 04/12/2016 17:51:08 ******/
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
/****** Object:  Table [dbo].[TBEVACEM]    Script Date: 04/12/2016 17:51:08 ******/
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
/****** Object:  Table [dbo].[TBEVACAT]    Script Date: 04/12/2016 17:51:08 ******/
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
/****** Object:  Table [dbo].[TBEVAAPM]    Script Date: 04/12/2016 17:51:08 ******/
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
/****** Object:  Table [dbo].[TBEVA_RHU]    Script Date: 04/12/2016 17:51:08 ******/
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
/****** Object:  Table [dbo].[Sindices]    Script Date: 04/12/2016 17:51:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Sindices](
	[Jdd] [int] NOT NULL,
	[Ames] [char](6) NOT NULL,
	[Uf] [numeric](10, 2) NOT NULL,
	[Utm] [int] NOT NULL,
 CONSTRAINT [Sindices_PK] PRIMARY KEY CLUSTERED 
(
	[Ames] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RVerRep]    Script Date: 04/12/2016 17:51:08 ******/
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
/****** Object:  Table [dbo].[RValidac]    Script Date: 04/12/2016 17:51:08 ******/
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
/****** Object:  Table [dbo].[RVACDET]    Script Date: 04/12/2016 17:51:08 ******/
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
	[Dulper] [int] NOT NULL,
	[Jdd] [int] NOT NULL,
 CONSTRAINT [PK_RVACDET] PRIMARY KEY CLUSTERED 
(
	[Jdd] ASC,
	[Codigo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RVACACIG]    Script Date: 04/12/2016 17:51:08 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RVACACID]    Script Date: 04/12/2016 17:51:08 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RVACACI]    Script Date: 04/12/2016 17:51:08 ******/
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
	[Fecha_ret] [datetime] NOT NULL,
	[Motanul] [char](30) NOT NULL,
	[Pertom] [char](20) NOT NULL,
	[Usuario] [char](12) NOT NULL,
	[Fecha_dat] [datetime] NOT NULL,
	[Fecha_ult] [datetime] NOT NULL,
	[Jdd] [int] NOT NULL,
 CONSTRAINT [PK_RVACACI] PRIMARY KEY CLUSTERED 
(
	[Codigo] ASC,
	[Numdoc] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[rusuarios]    Script Date: 04/12/2016 17:51:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[rusuarios](
	[jdd] [int] NOT NULL,
	[Usuario] [char](12) NOT NULL,
	[Estado] [char](1) NOT NULL,
	[Descrip] [char](30) NOT NULL,
	[Dato] [varchar](250) NOT NULL,
	[Historia] [varchar](140) NOT NULL,
	[Intentos] [int] NOT NULL,
	[Fecha_exp] [datetime] NOT NULL,
	[Mail] [varchar](50) NOT NULL,
	[Empresa] [char](3) NOT NULL,
	[Ubica] [int] NOT NULL,
	[Perfil] [char](12) NOT NULL,
	[Antig] [char](1) NOT NULL,
	[Sele] [char](1) NOT NULL,
	[fono] [char](18) NOT NULL,
	[cont_princ] [char](1) NOT NULL,
	[ej_payroll] [char](1) NOT NULL,
	[ger_out] [int] NOT NULL,
	[subge_out] [int] NOT NULL,
	[jefe_out] [int] NOT NULL,
	[grupo_out] [int] NOT NULL,
	[idArea] [int] NULL,
	[Supervisor] [char](12) NULL,
 CONSTRAINT [rusuarios_PK] PRIMARY KEY CLUSTERED 
(
	[jdd] ASC,
	[Usuario] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RUSUARIOI]    Script Date: 04/12/2016 17:51:08 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RUSUARIO]    Script Date: 04/12/2016 17:51:08 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RUNICAR]    Script Date: 04/12/2016 17:51:08 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RultseleD]    Script Date: 04/12/2016 17:51:08 ******/
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
/****** Object:  Table [dbo].[Rultsele]    Script Date: 04/12/2016 17:51:08 ******/
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
/****** Object:  Table [dbo].[RULTSEL]    Script Date: 04/12/2016 17:51:08 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RTRAPRO]    Script Date: 04/12/2016 17:51:08 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RTRAMOV]    Script Date: 04/12/2016 17:51:08 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Rtiposeg]    Script Date: 04/12/2016 17:51:08 ******/
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
/****** Object:  Table [dbo].[RTIEMPOS]    Script Date: 04/12/2016 17:51:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RTIEMPOS](
	[Fecha] [datetime] NOT NULL,
	[Usuario] [char](12) NOT NULL,
	[Proceso] [varchar](10) NOT NULL,
	[Etapa] [varchar](25) NOT NULL,
	[Cantidad] [int] NOT NULL,
	[Duracion] [money] NOT NULL,
	[Peri] [char](1) NOT NULL,
	[Wcompu] [varchar](40) NOT NULL,
	[Marca] [int] NOT NULL,
	[Jdd] [int] NOT NULL,
 CONSTRAINT [PK_RTIEMPOS] PRIMARY KEY CLUSTERED 
(
	[Fecha] ASC,
	[Usuario] ASC,
	[Proceso] ASC,
	[Peri] ASC,
	[Etapa] ASC,
	[Marca] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Rtemplates]    Script Date: 04/12/2016 17:51:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Rtemplates](
	[Codigo] [char](20) NOT NULL,
	[Tipo] [int] NOT NULL,
	[Fecha_cre] [datetime] NOT NULL,
	[Fecha_mod] [datetime] NOT NULL,
	[Descrip] [varchar](50) NOT NULL,
	[Template] [varchar](max) NOT NULL,
	[Formato] [char](1) NOT NULL,
	[Jdd] [int] NOT NULL,
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
 CONSTRAINT [PK_Rtemplates] PRIMARY KEY CLUSTERED 
(
	[Jdd] ASC,
	[Codigo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RtablasH]    Script Date: 04/12/2016 17:51:08 ******/
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
/****** Object:  Table [dbo].[Rtablas]    Script Date: 04/12/2016 17:51:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Rtablas](
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
	[Jdd] [int] NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RSOLPEN]    Script Date: 04/12/2016 17:51:08 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RSOLICI]    Script Date: 04/12/2016 17:51:08 ******/
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
	[Priori] [char](1) NOT NULL,
	[Jdd] [int] NOT NULL,
 CONSTRAINT [PK_RSOLICI] PRIMARY KEY CLUSTERED 
(
	[Codigo] ASC,
	[Tipo] ASC,
	[Fecha_ini] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Rsercola]    Script Date: 04/12/2016 17:51:08 ******/
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
	[Jdd] [int] NOT NULL,
	[feliq] [char](6) NOT NULL,
	[peri] [char](1) NOT NULL,
	[Tipo] [int] NOT NULL,
	[Idbatch] [int] NOT NULL,
 CONSTRAINT [PK_Rsercola] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RSeguros]    Script Date: 04/12/2016 17:51:08 ******/
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
/****** Object:  Table [dbo].[rseggrup]    Script Date: 04/12/2016 17:51:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[rseggrup](
	[Grupo] [char](10) NOT NULL,
	[Nombre] [char](30) NOT NULL,
	[Empresas] [char](52) NOT NULL,
	[Ngrab] [int] NOT NULL,
	[Jdd] [int] NOT NULL,
 CONSTRAINT [rseggrup_PK] PRIMARY KEY CLUSTERED 
(
	[Jdd] ASC,
	[Grupo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RSEGDER]    Script Date: 04/12/2016 17:51:08 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[rrotupr5]    Script Date: 04/12/2016 17:51:08 ******/
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
/****** Object:  Table [dbo].[RROTULOS]    Script Date: 04/12/2016 17:51:08 ******/
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
	[Rotulo] [char](50) NOT NULL,
	[Descrip] [char](50) NOT NULL,
	[Jdd] [int] NOT NULL,
 CONSTRAINT [PK_RROTULOS] PRIMARY KEY CLUSTERED 
(
	[Jdd] ASC,
	[Clasif] ASC,
	[Campo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Rreportes]    Script Date: 04/12/2016 17:51:08 ******/
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
/****** Object:  Table [dbo].[Rrecibos]    Script Date: 04/12/2016 17:51:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Rrecibos](
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
	[IdLote] [int] NOT NULL,
	[Visto] [int] NOT NULL,
	[Conform] [int] NOT NULL,
	[Jdd] [int] NOT NULL,
	[ReciboC] [varbinary](max) NOT NULL,
	[ReciboNC] [varbinary](max) NOT NULL,
 CONSTRAINT [PK_Rrecibos] PRIMARY KEY CLUSTERED 
(
	[Codigo] ASC,
	[Ames] ASC,
	[Peri] ASC,
	[Jdd] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RPublica]    Script Date: 04/12/2016 17:51:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RPublica](
	[RUT] [char](12) NOT NULL,
	[Titulo] [char](50) NOT NULL,
	[autores] [varchar](50) NOT NULL,
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
	[jdd] [int] NOT NULL,
 CONSTRAINT [PK_RPublica] PRIMARY KEY CLUSTERED 
(
	[RUT] ASC,
	[fecha] ASC,
	[Titulo] ASC,
	[jdd] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Rprogrl]    Script Date: 04/12/2016 17:51:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Rprogrl](
	[Codigo] [char](12) NOT NULL,
	[Ames] [char](6) NOT NULL,
	[Empresa] [char](3) NOT NULL,
	[Cencos] [int] NOT NULL,
	[Dias] [numeric](8, 2) NOT NULL,
	[Monto] [money] NOT NULL,
	[Base] [money] NOT NULL,
	[Diasp] [numeric](8, 2) NOT NULL,
	[Porcen] [int] NOT NULL,
	[Jdd] [int] NOT NULL,
 CONSTRAINT [PK_Rprogrl] PRIMARY KEY CLUSTERED 
(
	[Jdd] ASC,
	[Codigo] ASC,
	[Ames] ASC,
	[Empresa] ASC,
	[Cencos] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[rproductos]    Script Date: 04/12/2016 17:51:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[rproductos](
	[IDProducto] [int] IDENTITY(1,1) NOT NULL,
	[Descrip] [varchar](100) NOT NULL,
	[Precio] [money] NULL,
	[Fechaini] [datetime] NULL,
	[Fechafin] [datetime] NULL,
	[UsuarAlta] [char](12) NULL,
	[FechaAlta] [datetime] NULL,
	[USUARULTM] [char](12) NULL,
	[FechaUltM] [datetime] NULL,
	[Plataforma] [varchar](50) NULL,
	[VencUpgr] [datetime] NULL,
	[Tipolic] [varchar](50) NULL,
	[Version] [varchar](50) NULL,
	[Estup] [int] NOT NULL,
	[Elim] [int] NULL,
	[ActivoCRM] [char](1) NULL,
	[ActivoASP] [char](1) NULL,
	[Jdd] [int] NULL,
	[Servicio] [varchar](50) NULL,
 CONSTRAINT [PK_IDProducto] PRIMARY KEY CLUSTERED 
(
	[IDProducto] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RPREUNI]    Script Date: 04/12/2016 17:51:08 ******/
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
	[Nivel] [varchar](64) NOT NULL,
	[Jdd] [int] NOT NULL,
 CONSTRAINT [PK_RPREUNI] PRIMARY KEY CLUSTERED 
(
	[Empresa] ASC,
	[Unidad] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RPLANCU]    Script Date: 04/12/2016 17:51:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RPLANCU](
	[Jdd] [int] NOT NULL,
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
 CONSTRAINT [PK_RPLANCU] PRIMARY KEY CLUSTERED 
(
	[Jdd] ASC,
	[Codplan] ASC,
	[Cohade] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RPLAING]    Script Date: 04/12/2016 17:51:08 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Rpermisos]    Script Date: 04/12/2016 17:51:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Rpermisos](
	[Grupo] [char](12) NOT NULL,
	[Item] [char](20) NOT NULL,
	[Permisos] [char](15) NOT NULL,
	[Verif] [char](60) NOT NULL,
	[Jdd] [int] NOT NULL,
 CONSTRAINT [Rpermisos_PK] PRIMARY KEY CLUSTERED 
(
	[Jdd] ASC,
	[Grupo] ASC,
	[Item] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RPerfiles]    Script Date: 04/12/2016 17:51:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RPerfiles](
	[Jdd] [int] NOT NULL,
	[Perfil] [char](12) NOT NULL,
	[Descrip] [char](30) NOT NULL,
	[Dato] [char](40) NOT NULL,
 CONSTRAINT [RPerfiles_PK] PRIMARY KEY CLUSTERED 
(
	[Jdd] ASC,
	[Perfil] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[rpauser]    Script Date: 04/12/2016 17:51:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[rpauser](
	[Usuario] [char](12) NOT NULL,
	[Copar] [char](12) NOT NULL,
	[Descrip] [char](30) NOT NULL,
	[Param] [char](254) NOT NULL,
	[Jdd] [int] NOT NULL,
	[paradi] [char](2000) NOT NULL,
 CONSTRAINT [rpauser_PK] PRIMARY KEY CLUSTERED 
(
	[Jdd] ASC,
	[Copar] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RPASREL]    Script Date: 04/12/2016 17:51:08 ******/
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
	[ktimAfp] [money] NOT NULL,
	[Factor] [numeric](9, 6) NOT NULL,
	[ScTafe] [money] NOT NULL,
	[ScTmon] [money] NOT NULL,
	[ScEafe] [money] NOT NULL,
	[ScEmon] [money] NOT NULL,
	[ScIafe] [money] NOT NULL,
	[ScImon] [money] NOT NULL,
	[Traper] [money] NOT NULL,
	[Sisafp] [money] NOT NULL,
	[Jdd] [int] NOT NULL,
 CONSTRAINT [PK_RPASREL] PRIMARY KEY CLUSTERED 
(
	[Jdd] ASC,
	[Ames] ASC,
	[Codigo] ASC,
	[Peri] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Rpasiga]    Script Date: 04/12/2016 17:51:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Rpasiga](
	[Codigo] [char](12) NOT NULL,
	[Peri] [char](1) NOT NULL,
	[Concepto] [char](4) NOT NULL,
	[MontoM] [money] NOT NULL,
	[MontoP] [money] NOT NULL,
	[MontoG] [money] NOT NULL,
	[Fecha_pag] [money] NOT NULL,
	[Ames] [char](6) NOT NULL,
	[Jdd] [int] NOT NULL,
 CONSTRAINT [PK_Rpasiga] PRIMARY KEY CLUSTERED 
(
	[Codigo] ASC,
	[Ames] ASC,
	[Peri] ASC,
	[Concepto] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Rparams]    Script Date: 04/12/2016 17:51:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Rparams](
	[Copar] [char](12) NOT NULL,
	[Descrip] [char](30) NOT NULL,
	[Param] [varchar](254) NOT NULL,
	[Paradi] [varchar](max) NOT NULL,
	[Jdd] [int] NOT NULL,
	[Ngrab] [int] NOT NULL,
 CONSTRAINT [Rparams_PK] PRIMARY KEY CLUSTERED 
(
	[Jdd] ASC,
	[Copar] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RORGFUN5]    Script Date: 04/12/2016 17:51:08 ******/
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
	[Idnodo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ROrgCar5]    Script Date: 04/12/2016 17:51:08 ******/
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
/****** Object:  Table [dbo].[ROrgani5]    Script Date: 04/12/2016 17:51:08 ******/
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
/****** Object:  Table [dbo].[Rorgani]    Script Date: 04/12/2016 17:51:08 ******/
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
/****** Object:  Table [dbo].[RNUMCHE]    Script Date: 04/12/2016 17:51:08 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[rnotici]    Script Date: 04/12/2016 17:51:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[rnotici](
	[tipo] [int] NOT NULL,
	[codigo] [char](12) NOT NULL,
	[fecha_not] [datetime] NOT NULL,
	[Detalle] [char](250) NOT NULL,
	[nro] [int] NOT NULL,
	[usuario] [char](12) NOT NULL,
	[jdd] [int] NOT NULL,
 CONSTRAINT [PK_rnotici] PRIMARY KEY CLUSTERED 
(
	[jdd] ASC,
	[usuario] ASC,
	[nro] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[rnotas]    Script Date: 04/12/2016 17:51:08 ******/
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
	[Visto] [char](1) NOT NULL,
	[EnviaSMS] [char](1) NOT NULL,
	[EnviaMail] [char](1) NOT NULL,
 CONSTRAINT [rnotas_PK] PRIMARY KEY CLUSTERED 
(
	[Jdd] ASC,
	[Usuario] ASC,
	[Nro] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RnominaE]    Script Date: 04/12/2016 17:51:08 ******/
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
	[Aprueba] [char](12) NOT NULL,
	[Fecha_apr] [datetime] NOT NULL,
	[Descrip] [varchar](200) NOT NULL,
	[Estado] [char](1) NOT NULL,
	[Motivor] [varchar](250) NOT NULL,
 CONSTRAINT [RnominaE_PK] PRIMARY KEY CLUSTERED 
(
	[Jdd] ASC,
	[Nomina] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RnominaD]    Script Date: 04/12/2016 17:51:08 ******/
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
 CONSTRAINT [RnominaD_PK] PRIMARY KEY CLUSTERED 
(
	[Jdd] ASC,
	[Nomina] ASC,
	[Linea] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Rmsm]    Script Date: 04/12/2016 17:51:08 ******/
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
/****** Object:  Table [dbo].[RmodulosI]    Script Date: 04/12/2016 17:51:08 ******/
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
/****** Object:  Table [dbo].[Rmodulos5]    Script Date: 04/12/2016 17:51:08 ******/
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
	[Nperiodo] [int] NOT NULL,
	[varis] [varchar](max) NOT NULL,
	[Dueno] [char](12) NOT NULL,
	[Jdd] [int] NOT NULL,
	[SQLDirecto] [varchar](max) NOT NULL,
	[FSQLDirect] [int] NOT NULL,
	[orderby] [varchar](200) NOT NULL,
 CONSTRAINT [PK_Rmodulos5] PRIMARY KEY CLUSTERED 
(
	[Jdd] ASC,
	[IDModulo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RMODULOS]    Script Date: 04/12/2016 17:51:07 ******/
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
	[Desde] [varchar](2000) NOT NULL,
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
	[Dueno] [char](12) NOT NULL,
	[Jdd] [int] NOT NULL,
 CONSTRAINT [PK_RMODULOS] PRIMARY KEY CLUSTERED 
(
	[Modulo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RModRepOp]    Script Date: 04/12/2016 17:51:07 ******/
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
/****** Object:  Table [dbo].[RMODIFICAS]    Script Date: 04/12/2016 17:51:07 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RModgest]    Script Date: 04/12/2016 17:51:07 ******/
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
	[Dueno] [char](12) NOT NULL,
	[Jdd] [int] NOT NULL,
	[seteo] [char](100) NOT NULL,
 CONSTRAINT [PK_RModgest] PRIMARY KEY CLUSTERED 
(
	[Jdd] ASC,
	[IDModulo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Rmodesp]    Script Date: 04/12/2016 17:51:07 ******/
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
/****** Object:  Table [dbo].[RMAPITMH]    Script Date: 04/12/2016 17:51:07 ******/
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
	[Condi] [varchar](120) NOT NULL,
	[Simes] [char](1) NOT NULL,
	[Queperi] [char](7) NOT NULL,
	[Fecha_ing] [datetime] NOT NULL,
	[Fecha_apr] [datetime] NOT NULL,
	[Codigo_in] [char](12) NOT NULL,
	[Codigo_ap] [char](12) NOT NULL,
	[Plantilla] [char](10) NOT NULL,
	[Ames] [char](6) NOT NULL,
	[Moti_mod] [int] NOT NULL,
	[Fecha_ult] [datetime] NOT NULL,
	[Jdd] [int] NOT NULL,
 CONSTRAINT [PK_RMAPITMH] PRIMARY KEY CLUSTERED 
(
	[Codigo] ASC,
	[Ames] ASC,
	[Periodo] ASC,
	[Cohade] ASC,
	[Nro] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RMAPITM]    Script Date: 04/12/2016 17:51:07 ******/
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
	[Condi] [varchar](120) NOT NULL,
	[Simes] [char](1) NOT NULL,
	[Queperi] [char](7) NOT NULL,
	[Fecha_ing] [datetime] NOT NULL,
	[Fecha_apr] [datetime] NOT NULL,
	[Codigo_in] [char](12) NOT NULL,
	[Codigo_ap] [char](12) NOT NULL,
	[Plantilla] [char](10) NOT NULL,
	[Ames] [char](6) NOT NULL,
	[Moti_mod] [int] NOT NULL,
	[Fecha_ult] [datetime] NOT NULL,
	[Jdd] [int] NOT NULL,
 CONSTRAINT [PK_RMAPITM] PRIMARY KEY CLUSTERED 
(
	[Codigo] ASC,
	[Cohade] ASC,
	[Periodo] ASC,
	[Nro] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RLotes]    Script Date: 04/12/2016 17:51:07 ******/
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
/****** Object:  Table [dbo].[Rlogval]    Script Date: 04/12/2016 17:51:07 ******/
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
/****** Object:  Table [dbo].[RlogMP]    Script Date: 04/12/2016 17:51:07 ******/
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
/****** Object:  Table [dbo].[RlogCliente]    Script Date: 04/12/2016 17:51:07 ******/
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
/****** Object:  Table [dbo].[RlogAlertas]    Script Date: 04/12/2016 17:51:07 ******/
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
/****** Object:  Table [dbo].[Rlog]    Script Date: 04/12/2016 17:51:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Rlog](
	[Jdd] [int] NOT NULL,
	[Id] [int] NOT NULL,
	[Proced] [char](20) NOT NULL,
	[codigoA] [char](12) NOT NULL,
	[Concepto] [char](30) NOT NULL,
	[Deta] [varchar](250) NOT NULL,
	[Fecha] [datetime] NOT NULL,
	[Usuario] [char](12) NOT NULL,
	[Wcompu] [char](25) NOT NULL,
	[Nucomp] [char](12) NOT NULL,
 CONSTRAINT [Rlog_PK] PRIMARY KEY CLUSTERED 
(
	[Jdd] ASC,
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Rliquid]    Script Date: 04/12/2016 17:51:07 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Rlicencias]    Script Date: 04/12/2016 17:51:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Rlicencias](
	[Jdd] [int] NOT NULL,
	[Cliente] [char](15) NOT NULL,
	[Id] [int] NOT NULL,
	[Producto] [int] NOT NULL,
	[Fecha_lic] [datetime] NOT NULL,
	[Dias] [int] NOT NULL,
	[Nlic] [int] NOT NULL,
	[sitcod] [varchar](20) NOT NULL,
	[Licencia] [varchar](50) NOT NULL,
	[envio] [char](1) NOT NULL,
	[mail] [varchar](50) NOT NULL,
	[Obs] [varchar](200) NOT NULL,
	[usuario] [char](12) NOT NULL,
	[wcompu] [varchar](50) NOT NULL,
	[IDCliente] [int] NOT NULL,
 CONSTRAINT [Rlicencias_PK] PRIMARY KEY CLUSTERED 
(
	[Jdd] ASC,
	[Cliente] ASC,
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RJerarq5]    Script Date: 04/12/2016 17:51:07 ******/
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
/****** Object:  Table [dbo].[RJERARQ]    Script Date: 04/12/2016 17:51:07 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RJDATOS]    Script Date: 04/12/2016 17:51:07 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Ritemseg]    Script Date: 04/12/2016 17:51:07 ******/
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
/****** Object:  Table [dbo].[RINTDETA]    Script Date: 04/12/2016 17:51:07 ******/
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
	[CampoAsoci] [char](25) NOT NULL,
	[RelleDeciC] [char](1) NOT NULL,
	[CantDec] [int] NOT NULL,
	[SepDec] [char](1) NOT NULL,
	[SepMiles] [char](1) NOT NULL,
	[DatoFijo] [char](200) NOT NULL,
	[NombreColu] [char](40) NOT NULL,
	[FormatoFec] [char](40) NOT NULL,
	[DatosFormu] [char](1) NOT NULL,
	[QuitaCarCa] [char](40) NOT NULL,
	[StrDesde] [int] NOT NULL,
	[StrHasta] [int] NOT NULL,
	[TablaConve] [int] NOT NULL,
	[EsCodigo] [char](1) NOT NULL,
	[TablaCodig] [int] NOT NULL,
	[Descrip] [char](60) NOT NULL,
	[CharAMayMi] [int] NOT NULL,
	[ReempCarac] [char](40) NOT NULL,
	[TomaHastCa] [char](1) NOT NULL,
	[TomaIzqODe] [int] NOT NULL,
	[TablaConvd] [char](30) NOT NULL,
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
/****** Object:  Table [dbo].[RINTCONVER]    Script Date: 04/12/2016 17:51:07 ******/
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
	[DescAltern] [char](60) NOT NULL,
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
/****** Object:  Table [dbo].[RINTBANC]    Script Date: 04/12/2016 17:51:07 ******/
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
	[CtrlCtaRep] [char](1) NOT NULL,
	[TipoOpcion] [int] NOT NULL,
	[NombArch] [char](25) NOT NULL,
	[TipoArchGe] [int] NOT NULL,
	[RegiPagos] [char](1) NOT NULL,
	[VerificaCB] [char](1) NOT NULL,
	[NoProcRegi] [char](1) NOT NULL,
	[UnificarxR] [int] NOT NULL,
	[Jdd] [int] NOT NULL,
	[TipArchGe] [int] NOT NULL,
	[TipOpcion] [int] NOT NULL,
	[CtrCbuRep] [bit] NOT NULL,
 CONSTRAINT [PK_RINTBANC] PRIMARY KEY CLUSTERED 
(
	[BancoId] ASC,
	[Esquema] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Ringresos]    Script Date: 04/12/2016 17:51:07 ******/
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
 CONSTRAINT [Ringresos_PK] PRIMARY KEY CLUSTERED 
(
	[Jdd] ASC,
	[Usuario] ASC,
	[Nucomp] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Ringreapro]    Script Date: 04/12/2016 17:51:07 ******/
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
	[ItemsSi] [varchar](140) NOT NULL,
	[Apro01] [char](12) NOT NULL,
	[Apro02] [char](12) NOT NULL,
	[Apro03] [char](12) NOT NULL,
	[IDPlant] [varchar](100) NOT NULL,
 CONSTRAINT [Ringreapro_PK] PRIMARY KEY CLUSTERED 
(
	[Jdd] ASC,
	[Codigo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ringlicen]    Script Date: 04/12/2016 17:51:07 ******/
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
	[Medios] [char](1) NOT NULL,
	[Rutpro] [char](12) NOT NULL,
	[Medico] [char](30) NOT NULL,
	[Especia] [int] NOT NULL,
	[mailJefe] [varchar](60) NOT NULL,
	[Nombre] [char](40) NOT NULL,
	[Jdd] [int] NOT NULL,
	[Lscan] [varbinary](max) NOT NULL,
	[Fecha_con] [datetime] NOT NULL,
	[Fecha_ico] [datetime] NOT NULL,
 CONSTRAINT [ringlicen_PK] PRIMARY KEY CLUSTERED 
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
/****** Object:  Table [dbo].[RINDICES]    Script Date: 04/12/2016 17:51:07 ******/
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
	[TopeAFP] [money] NOT NULL,
	[TopeSEC] [money] NOT NULL,
	[Jdd] [int] NOT NULL,
	[SueldoMin] [money] NOT NULL,
 CONSTRAINT [PK_RINDICES] PRIMARY KEY CLUSTERED 
(
	[Aa] ASC,
	[Mm] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rimpuesxmes]    Script Date: 04/12/2016 17:51:07 ******/
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
/****** Object:  Table [dbo].[Rigdet]    Script Date: 04/12/2016 17:51:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Rigdet](
	[Codigo] [char](12) NOT NULL,
	[Ames] [char](6) NOT NULL,
	[Concepto] [char](4) NOT NULL,
	[Montoa] [money] NOT NULL,
	[Montop] [money] NOT NULL,
	[Jdd] [int] NOT NULL,
 CONSTRAINT [PK_Rigdet] PRIMARY KEY CLUSTERED 
(
	[Codigo] ASC,
	[Ames] ASC,
	[Concepto] ASC,
	[Jdd] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Rigaesq]    Script Date: 04/12/2016 17:51:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Rigaesq](
	[Concepto] [char](4) NOT NULL,
	[Descrip] [char](30) NOT NULL,
	[Orden] [int] NOT NULL,
	[Signo] [char](1) NOT NULL,
	[Formula] [char](4) NOT NULL,
	[Tipo] [char](1) NOT NULL,
	[Jdd] [int] NOT NULL,
 CONSTRAINT [PK_Rigaesq] PRIMARY KEY CLUSTERED 
(
	[Orden] ASC,
	[Concepto] ASC,
	[Jdd] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Ridiomas]    Script Date: 04/12/2016 17:51:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Ridiomas](
	[RUT] [char](12) NOT NULL,
	[idioma] [int] NOT NULL,
	[habla] [int] NOT NULL,
	[lee] [int] NOT NULL,
	[escribe] [int] NOT NULL,
	[observ] [varchar](254) NOT NULL,
	[Fecha_mod] [datetime] NOT NULL,
	[usrvobo] [char](12) NOT NULL,
	[vobo] [int] NOT NULL,
	[jdd] [int] NOT NULL,
 CONSTRAINT [PK_Ridiomas] PRIMARY KEY CLUSTERED 
(
	[RUT] ASC,
	[idioma] ASC,
	[jdd] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RHONORA]    Script Date: 04/12/2016 17:51:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RHONORA](
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
	[fecha_ser] [datetime] NOT NULL,
	[Cencos] [int] NOT NULL,
	[Tibol] [char](1) NOT NULL,
	[Jdd] [int] NOT NULL,
 CONSTRAINT [PK_RHONORA] PRIMARY KEY CLUSTERED 
(
	[Jdd] ASC,
	[Empresa] ASC,
	[Rut] ASC,
	[Numbol] ASC,
	[Tibol] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RHOJAVI]    Script Date: 04/12/2016 17:51:07 ******/
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
	[Tipo] [int] NOT NULL,
	[Detalle] [char](230) NOT NULL,
	[Estado] [char](1) NOT NULL,
	[Respon] [char](12) NOT NULL,
	[Nhoras] [numeric](9, 2) NOT NULL,
	[Destipo] [char](20) NOT NULL,
	[Ivt] [int] NOT NULL,
	[Jdd] [int] NOT NULL,
 CONSTRAINT [PK_RHOJAVI] PRIMARY KEY CLUSTERED 
(
	[Codigo] ASC,
	[Fecha] ASC,
	[Hora] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Rhislab]    Script Date: 04/12/2016 17:51:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Rhislab](
	[RUT] [char](12) NOT NULL,
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
	[jdd] [int] NOT NULL,
 CONSTRAINT [PK_Rhislab] PRIMARY KEY CLUSTERED 
(
	[RUT] ASC,
	[fechingr] ASC,
	[cargo] ASC,
	[jdd] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Rhabdes]    Script Date: 04/12/2016 17:51:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Rhabdes](
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
	[Afev] [char](1) NOT NULL,
	[Afe3] [char](1) NOT NULL,
	[Afe4] [char](1) NOT NULL,
	[Inform] [char](1) NOT NULL,
	[Aobs] [char](1) NOT NULL,
	[Tiphab] [char](1) NOT NULL,
	[Coinst] [int] NOT NULL,
	[RetDonde] [int] NOT NULL,
	[Funda] [varchar](max) NOT NULL,
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
	[Refiva] [char](1) NOT NULL,
	[Jdd] [int] NOT NULL,
	[Ndecimon] [int] NOT NULL,
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
	[afev2] [char](1) NOT NULL,
	[pone0] [char](1) NOT NULL,
	[unico] [char](1) NOT NULL,
	[dAF21] [char](1) NOT NULL,
	[dAF22] [char](1) NOT NULL,
	[dAF23] [char](1) NOT NULL,
	[dAF24] [char](1) NOT NULL,
	[dAF25] [char](1) NOT NULL,
	[claiga] [char](4) NOT NULL,
 CONSTRAINT [PK_Rhabdes] PRIMARY KEY CLUSTERED 
(
	[Jdd] ASC,
	[Cohade] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RGRUPFA]    Script Date: 04/12/2016 17:51:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RGRUPFA](
	[Codigo] [char](12) NOT NULL,
	[Nombre] [varchar](60) NOT NULL,
	[Apc] [char](15) NOT NULL,
	[Rut] [char](12) NOT NULL,
	[PARIENTE] [int] NOT NULL,
	[Fecha_nac] [datetime] NOT NULL,
	[Sexo] [char](1) NOT NULL,
	[Estudios] [int] NOT NULL,
	[Gensal] [char](1) NOT NULL,
	[Preexis] [varchar](60) NOT NULL,
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
	[Direccion] [varchar](128) NOT NULL,
	[Fono] [char](18) NOT NULL,
	[Pmail] [varchar](50) NOT NULL,
	[AfpVol] [char](1) NOT NULL,
	[AfpCoform] [char](4) NOT NULL,
	[Afpcod] [int] NOT NULL,
	[AfpMonto] [money] NOT NULL,
	[AfpDesde] [datetime] NOT NULL,
	[AfpHasta] [datetime] NOT NULL,
	[AhoVol] [char](1) NOT NULL,
	[AhoCoform] [char](4) NOT NULL,
	[AhoMonto] [money] NOT NULL,
	[Jdd] [int] NOT NULL,
	[Nacion] [int] NOT NULL,
	[AsigBPS] [char](1) NOT NULL,
	[AfpNper] [int] NOT NULL,
 CONSTRAINT [PK_RGRUPFA] PRIMARY KEY CLUSTERED 
(
	[Jdd] ASC,
	[Codigo] ASC,
	[Rut] ASC,
	[Nombre] ASC,
	[Relacion] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[rformlaH]    Script Date: 04/12/2016 17:51:07 ******/
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
/****** Object:  Table [dbo].[rformla]    Script Date: 04/12/2016 17:51:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[rformla](
	[Coform] [char](4) NOT NULL,
	[Descrip] [char](40) NOT NULL,
	[Tipo] [char](1) NOT NULL,
	[Trazo] [char](1) NOT NULL,
	[Formula] [varchar](max) NOT NULL,
	[Jdd] [int] NOT NULL,
	[Obs] [varchar](max) NOT NULL,
 CONSTRAINT [PK_rformla] PRIMARY KEY CLUSTERED 
(
	[Jdd] ASC,
	[Coform] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RFormEsp]    Script Date: 04/12/2016 17:51:07 ******/
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
	[Cohade] ASC,
	[Coform] ASC,
	[IdJdd] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Rferiad]    Script Date: 04/12/2016 17:51:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Rferiad](
	[Fecha] [datetime] NOT NULL,
	[Tipo] [char](1) NOT NULL,
	[Motivo] [char](30) NOT NULL,
	[Jdd] [int] NOT NULL,
	[Condicion] [varchar](max) NOT NULL,
 CONSTRAINT [PK_Rferiad] PRIMARY KEY CLUSTERED 
(
	[Jdd] ASC,
	[Fecha] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[rfactores]    Script Date: 04/12/2016 17:51:07 ******/
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
/****** Object:  Table [dbo].[Reventos]    Script Date: 04/12/2016 17:51:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Reventos](
	[Fecha] [datetime] NOT NULL,
	[Usuario] [char](12) NOT NULL,
	[Prog] [char](8) NOT NULL,
	[Accion] [char](1) NOT NULL,
	[Conti] [char](1) NOT NULL,
	[Evento] [char](150) NOT NULL,
	[Wcompu] [char](15) NOT NULL,
	[Ngrab] [int] NOT NULL,
	[Marca] [timestamp] NOT NULL,
	[Jdd] [int] NOT NULL,
	[Codigo] [char](12) NOT NULL,
 CONSTRAINT [PK_Reventos] PRIMARY KEY CLUSTERED 
(
	[Jdd] ASC,
	[Fecha] ASC,
	[Usuario] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Resumen]    Script Date: 04/12/2016 17:51:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Resumen](
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
	[KtdlO] [money] NOT NULL,
	[Ktde] [money] NOT NULL,
	[Ktds] [money] NOT NULL,
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
	[Afevari] [money] NOT NULL,
	[Empresa] [char](3) NOT NULL,
	[Diaslim] [numeric](4, 1) NOT NULL,
	[Subsil] [money] NOT NULL,
	[Fafp] [numeric](5, 2) NOT NULL,
	[Fecha_dep] [datetime] NOT NULL,
	[BancoDep] [int] NOT NULL,
	[NroRec] [int] NOT NULL,
	[Fecha_pag] [datetime] NOT NULL,
	[Jdd] [int] NOT NULL,
	[Mondep] [money] NOT NULL,
	[BancoPag] [int] NOT NULL,
	[Fecha_eje] [datetime] NOT NULL,
	[User_eje] [char](12) NOT NULL,
	[efecDep] [char](1) NOT NULL,
	[Afevar2] [money] NOT NULL,
	[SubsilN] [money] NOT NULL,
	[Licmd] [char](12) NOT NULL,
	[Dias3pd] [numeric](4, 1) NOT NULL,
	[Fecha_ult] [datetime] NOT NULL,
	[kper] [numeric](4, 1) NOT NULL,
	[kfal] [numeric](4, 1) NOT NULL,
 CONSTRAINT [PK_Resumen] PRIMARY KEY CLUSTERED 
(
	[Jdd] ASC,
	[Codigo] ASC,
	[Ames] ASC,
	[Peri] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RESTANQ]    Script Date: 04/12/2016 17:51:07 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Resquema]    Script Date: 04/12/2016 17:51:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Resquema](
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
 CONSTRAINT [PK_Resquema] PRIMARY KEY CLUSTERED 
(
	[Jdd] ASC,
	[Esquema] ASC,
	[Parte] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Rerrvalida]    Script Date: 04/12/2016 17:51:07 ******/
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
/****** Object:  Table [dbo].[ReportesAdp]    Script Date: 04/12/2016 17:51:07 ******/
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
/****** Object:  Table [dbo].[RENCAPA]    Script Date: 04/12/2016 17:51:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RENCAPA](
	[Curso] [char](15) NOT NULL,
	[Codigo] [char](12) NOT NULL,
	[Rut] [char](12) NOT NULL,
	[Situ] [char](10) NOT NULL,
	[Fecha_ini] [datetime] NOT NULL,
	[Fecha_ter] [datetime] NOT NULL,
	[Tipo] [char](1) NOT NULL,
	[Asisten] [int] NOT NULL,
	[Aproba] [char](1) NOT NULL,
	[Obs] [char](128) NOT NULL,
	[Puntaje] [numeric](5, 2) NOT NULL,
	[Causen] [int] NOT NULL,
	[Lugar] [char](30) NOT NULL,
	[Horas] [money] NOT NULL,
	[Ubicas] [char](30) NOT NULL,
	[Direccion] [char](254) NOT NULL,
	[Jdd] [int] NOT NULL,
 CONSTRAINT [PK_RENCAPA] PRIMARY KEY CLUSTERED 
(
	[Curso] ASC,
	[Fecha_ini] ASC,
	[Codigo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[rempresa]    Script Date: 04/12/2016 17:51:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[rempresa](
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
	[Email] [char](70) NOT NULL,
	[RutRep] [char](12) NOT NULL,
	[Comut] [numeric](5, 2) NOT NULL,
	[Jdd] [int] NOT NULL,
	[Giro] [char](80) NOT NULL,
	[Junaeb] [char](10) NOT NULL,
	[mailRRHH] [char](70) NOT NULL,
	[mailRegi] [char](70) NOT NULL,
	[Firmante] [char](12) NOT NULL,
	[AutRRHH] [char](12) NOT NULL,
	[Tipoemp] [char](1) NOT NULL,
	[estatuto] [char](1) NOT NULL,
	[CodAct] [char](1) NOT NULL,
	[CalTrab] [char](1) NOT NULL,
	[lusuario] [char](12) NOT NULL,
	[lclave] [char](12) NOT NULL,
	[sisafp] [char](1) NOT NULL,
	[ApvcPL] [money] NOT NULL,
	[ApvcPR] [money] NOT NULL,
	[desc_act] [char](100) NOT NULL,
	[UserWSCon] [varchar](15) NOT NULL,
	[PassWSCon] [varchar](60) NOT NULL,
	[Nit] [varchar](15) NOT NULL,
	[IdAdp] [char](12) NOT NULL,
	[Nroresrd] [char](12) NOT NULL,
 CONSTRAINT [rempresa_PK] PRIMARY KEY CLUSTERED 
(
	[Jdd] ASC,
	[Empresa] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[remplesh]    Script Date: 04/12/2016 17:51:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[remplesh](
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
 CONSTRAINT [PK_remplesh] PRIMARY KEY CLUSTERED 
(
	[Jdd] ASC,
	[Codigo] ASC,
	[Ames] ASC,
	[Peri] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[REMPLES]    Script Date: 04/12/2016 17:51:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[REMPLES](
	[Codigo] [char](12) NOT NULL,
	[Estado] [char](1) NOT NULL,
	[NFicha] [int] NOT NULL,
	[EsFpri] [char](1) NOT NULL,
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
	[pmail] [varchar](50) NOT NULL,
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
	[Ocupacion] [varchar](50) NOT NULL,
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
	[Cta_corr2] [varchar](26) NOT NULL,
	[Cta_inter] [varchar](26) NOT NULL,
	[Cta_inte2] [varchar](26) NOT NULL,
	[Ffp] [numeric](5, 2) NOT NULL,
	[Ffp2] [numeric](5, 2) NOT NULL,
	[Ofiban] [int] NOT NULL,
	[Ofiban2] [int] NOT NULL,
	[Fp2Benef] [int] NOT NULL,
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
	[UserAD] [varchar](50) NOT NULL,
	[FechaSjov] [datetime] NOT NULL,
	[Jornada] [char](1) NOT NULL,
	[Sdato2] [char](50) NOT NULL,
	[JorCont] [char](1) NOT NULL,
	[PlanOS] [int] NOT NULL,
	[PreSalud] [int] NOT NULL,
	[Pjortm] [char](1) NOT NULL,
	[Psujhn] [char](1) NOT NULL,
	[Ping5t] [char](1) NOT NULL,
	[Pafisp] [char](1) NOT NULL,
	[Pdisca] [char](1) NOT NULL,
	[P5taex] [char](1) NOT NULL,
	[Pmadres] [char](1) NOT NULL,
	[Pindom] [char](1) NOT NULL,
	[Premint] [char](1) NOT NULL,
	[PorcUnif] [numeric](3, 2) NOT NULL,
	[Dir_trab] [int] NOT NULL,
	[Cod_dni] [int] NOT NULL,
	[Fecha_ult] [datetime] NOT NULL,
	[Jdd] [int] NOT NULL,
	[AutFirmar] [char](1) NOT NULL,
	[Cargo_est] [int] NOT NULL,
	[Srsicoss] [int] NOT NULL,
	[Ccsicoss] [int] NOT NULL,
	[PingSt] [char](1) NOT NULL,
 CONSTRAINT [PK_REMPLES] PRIMARY KEY CLUSTERED 
(
	[Codigo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[REMPLEPER]    Script Date: 04/12/2016 17:51:07 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[remplech]    Script Date: 04/12/2016 17:51:07 ******/
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
/****** Object:  Table [dbo].[remplec]    Script Date: 04/12/2016 17:51:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[remplec](
	[Codigo] [char](12) NOT NULL,
	[Codcam] [int] NOT NULL,
	[ValorN] [money] NOT NULL,
	[ValorF] [datetime] NOT NULL,
	[ValorC] [char](30) NOT NULL,
	[ValorM] [varchar](max) NOT NULL,
	[Jdd] [int] NOT NULL,
 CONSTRAINT [PK_remplec] PRIMARY KEY CLUSTERED 
(
	[Jdd] ASC,
	[Codigo] ASC,
	[Codcam] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[REMPLAN]    Script Date: 04/12/2016 17:51:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[REMPLAN](
	[Codigo] [char](12) NOT NULL,
	[Nombre] [varchar](60) NOT NULL,
	[Rut] [char](12) NOT NULL,
	[Cargo] [int] NOT NULL,
	[Cencos] [int] NOT NULL,
	[Empresa] [char](3) NOT NULL,
	[Estado] [char](1) NOT NULL,
	[Ocupacion] [char](50) NOT NULL,
	[Direccion] [char](95) NOT NULL,
	[Fono] [char](18) NOT NULL,
	[Fecha_nac] [datetime] NOT NULL,
	[Fecha_ing] [datetime] NOT NULL,
	[Fecha_ret] [datetime] NOT NULL,
	[Moti_ret] [int] NOT NULL,
	[Obs] [char](163) NOT NULL,
	[Jdd] [int] NOT NULL,
	[Detalle] [varchar](500) NOT NULL,
 CONSTRAINT [PK_REMPLAN] PRIMARY KEY CLUSTERED 
(
	[Codigo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RECORDAR]    Script Date: 04/12/2016 17:51:07 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Rdonatario]    Script Date: 04/12/2016 17:51:07 ******/
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
/****** Object:  Table [dbo].[RDOCUMS]    Script Date: 04/12/2016 17:51:07 ******/
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
	[Elemento] [image] NOT NULL,
	[Dire] [char](20) NOT NULL,
	[Dtipo] [char](10) NOT NULL,
	[Jdd] [int] NOT NULL,
 CONSTRAINT [PK_RDOCUMS] PRIMARY KEY CLUSTERED 
(
	[Jdd] ASC,
	[Codigo] ASC,
	[Nombre] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Rdocfirma]    Script Date: 04/12/2016 17:51:07 ******/
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
/****** Object:  Table [dbo].[Rdocempre]    Script Date: 04/12/2016 17:51:07 ******/
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
/****** Object:  Table [dbo].[Rdocemple]    Script Date: 04/12/2016 17:51:07 ******/
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
	[Descrip] [char](20) NOT NULL,
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
/****** Object:  Table [dbo].[Rdirec]    Script Date: 04/12/2016 17:51:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Rdirec](
	[Codigo] [int] NOT NULL,
	[Descrip] [char](30) NOT NULL,
	[Direccion] [varchar](128) NOT NULL,
	[Telefono] [char](18) NOT NULL,
	[Valor] [money] NOT NULL,
	[Valorc] [varchar](20) NOT NULL,
	[mail] [varchar](60) NOT NULL,
	[Jdd] [int] NOT NULL,
 CONSTRAINT [PK_Rdirec] PRIMARY KEY CLUSTERED 
(
	[Jdd] ASC,
	[Codigo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RDetEsquema]    Script Date: 04/12/2016 17:51:07 ******/
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
	[EsVisible] [bit] NOT NULL,
	[EsCondic] [bit] NOT NULL,
	[CampEval] [int] NOT NULL,
	[Operador] [varchar](10) NOT NULL,
	[CampCom1] [int] NOT NULL,
	[CampCom2] [int] NOT NULL,
 CONSTRAINT [PK_RDetEsquema] PRIMARY KEY CLUSTERED 
(
	[IdDetalle] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RDESCUR]    Script Date: 04/12/2016 17:51:07 ******/
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
	[Objetivo] [varchar](2000) NOT NULL,
	[Metodo] [int] NOT NULL,
	[Obligat] [char](1) NOT NULL,
	[Unidad] [int] NOT NULL,
	[Tipo] [int] NOT NULL,
	[Jdd] [int] NOT NULL,
 CONSTRAINT [PK_RDESCUR] PRIMARY KEY CLUSTERED 
(
	[Curso] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RCURRICU]    Script Date: 04/12/2016 17:51:07 ******/
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
	[Fecha_ter] [datetime] NOT NULL,
	[Nacion] [int] NOT NULL,
	[Detalle] [char](50) NOT NULL,
	[Tipo] [int] NOT NULL,
	[Institu] [int] NOT NULL,
	[Dinstitu] [char](40) NOT NULL,
	[Area] [char](30) NOT NULL,
	[Compet] [int] NOT NULL,
	[ValorS] [money] NOT NULL,
	[ValorT] [money] NOT NULL,
	[EsSence] [char](1) NOT NULL,
	[Situ] [char](10) NOT NULL,
	[Asisten] [int] NOT NULL,
	[Aproba] [char](1) NOT NULL,
	[Obs] [char](128) NOT NULL,
	[Curso] [char](15) NOT NULL,
	[Grado] [int] NOT NULL,
	[Titulo] [varchar](50) NOT NULL,
	[Especial] [varchar](30) NOT NULL,
	[Puntaje] [numeric](5, 2) NOT NULL,
	[Jdd] [int] NOT NULL,
	[Fecha_mod] [datetime] NOT NULL,
	[Estado] [int] NOT NULL,
	[Tipotract] [int] NOT NULL,
	[vobo] [int] NOT NULL,
	[usrvobo] [char](12) NOT NULL,
	[Causen] [int] NOT NULL,
 CONSTRAINT [PK_RCURRICU] PRIMARY KEY CLUSTERED 
(
	[Codigo] ASC,
	[Tipo] ASC,
	[Fecha_ini] ASC,
	[Curso] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Rcuentas]    Script Date: 04/12/2016 17:51:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Rcuentas](
	[Cohade] [char](6) NOT NULL,
	[Indice] [int] NOT NULL,
	[Cuenta] [char](14) NOT NULL,
	[Jdd] [int] NOT NULL,
 CONSTRAINT [PK_Rcuentas] PRIMARY KEY CLUSTERED 
(
	[Jdd] ASC,
	[Cohade] ASC,
	[Indice] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RCubos]    Script Date: 04/12/2016 17:51:07 ******/
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
/****** Object:  Table [dbo].[RCTACOR]    Script Date: 04/12/2016 17:51:07 ******/
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
	[Moneda] [int] NOT NULL,
	[Cuota] [int] NOT NULL,
	[Nucom] [int] NOT NULL,
	[Refere] [char](15) NOT NULL,
	[Origen] [char](1) NOT NULL,
	[Jdd] [int] NOT NULL,
 CONSTRAINT [PK_RCTACOR] PRIMARY KEY CLUSTERED 
(
	[Codigo] ASC,
	[Codpres] ASC,
	[Signo] ASC,
	[Cuota] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RConTrans]    Script Date: 04/12/2016 17:51:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RConTrans](
	[IdJdd] [varchar](15) NOT NULL,
	[IdEsquema] [int] NOT NULL,
	[RutEmpresa] [varchar](12) NOT NULL,
	[Empresa] [varchar](50) NOT NULL,
	[Archivo] [varbinary](max) NOT NULL,
	[Fecha] [datetime] NOT NULL,
	[Banco] [varchar](50) NOT NULL,
	[Comentario] [varchar](100) NOT NULL,
	[IdConfigur] [int] NOT NULL,
 CONSTRAINT [PK_RConTrans] PRIMARY KEY CLUSTERED 
(
	[IdJdd] ASC,
	[IdEsquema] ASC,
	[RutEmpresa] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Rcontenidos]    Script Date: 04/12/2016 17:51:07 ******/
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
/****** Object:  Table [dbo].[Rconjun]    Script Date: 04/12/2016 17:51:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Rconjun](
	[Jdd] [int] NOT NULL,
	[codCon] [int] NOT NULL,
	[Tipo] [char](1) NOT NULL,
	[Condi] [varchar](max) NOT NULL,
	[Descrip] [char](30) NOT NULL,
 CONSTRAINT [Rconjun_PK] PRIMARY KEY CLUSTERED 
(
	[Jdd] ASC,
	[codCon] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Rcongsem]    Script Date: 04/12/2016 17:51:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Rcongsem](
	[RUT] [char](12) NOT NULL,
	[evento] [varchar](100) NOT NULL,
	[instit] [varchar](100) NOT NULL,
	[fecha] [datetime] NOT NULL,
	[fecha_fin] [datetime] NOT NULL,
	[caracter] [char](10) NOT NULL,
	[ciudad] [varchar](50) NOT NULL,
	[Pais] [char](30) NOT NULL,
	[observ] [varchar](100) NOT NULL,
	[Fecha_mod] [datetime] NOT NULL,
	[vobo] [int] NOT NULL,
	[usrvobo] [char](12) NOT NULL,
	[jdd] [int] NOT NULL,
 CONSTRAINT [PK_Rcongsem] PRIMARY KEY CLUSTERED 
(
	[RUT] ASC,
	[fecha] ASC,
	[jdd] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RCONFIR]    Script Date: 04/12/2016 17:51:07 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RConfigTransf]    Script Date: 04/12/2016 17:51:07 ******/
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
	[Jdd] [int] NOT NULL,
	[ctaCte] [varchar](50) NOT NULL,
	[nroConv] [varchar](50) NOT NULL,
	[NroNomina] [varchar](50) NOT NULL,
	[NomNomina] [varchar](50) NOT NULL,
	[Nomdia] [int] NOT NULL,
	[NroDia] [int] NOT NULL,
	[Horas] [int] NOT NULL,
	[mailNotif] [varchar](50) NOT NULL,
	[DiaPago] [int] NOT NULL,
	[hbancos] [int] NOT NULL,
	[hfpagos] [int] NOT NULL,
	[Transfer] [int] NOT NULL,
	[empresa] [int] NOT NULL,
	[idJdd] [varchar](15) NOT NULL,
	[IdProceso] [int] NOT NULL,
 CONSTRAINT [PK_RConfigTransf] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RConfigCen]    Script Date: 04/12/2016 17:51:07 ******/
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
/****** Object:  Table [dbo].[RConfEsquemas]    Script Date: 04/12/2016 17:51:07 ******/
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
/****** Object:  Table [dbo].[RCONDIS]    Script Date: 04/12/2016 17:51:07 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RCONDAT]    Script Date: 04/12/2016 17:51:07 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Rcomisii]    Script Date: 04/12/2016 17:51:07 ******/
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
/****** Object:  Table [dbo].[RComisi]    Script Date: 04/12/2016 17:51:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RComisi](
	[Ames] [char](6) NOT NULL,
	[Peri] [char](1) NOT NULL,
	[Codigo] [char](12) NOT NULL,
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
 CONSTRAINT [PK_RComisi] PRIMARY KEY CLUSTERED 
(
	[Jdd] ASC,
	[Ames] ASC,
	[Peri] ASC,
	[Codigo] ASC,
	[Cohade] ASC,
	[Numero] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RCOMCAR]    Script Date: 04/12/2016 17:51:07 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[rcliprod]    Script Date: 04/12/2016 17:51:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[rcliprod](
	[IDProducto] [int] NOT NULL,
	[IDCliente] [int] NOT NULL,
	[Cantidad] [int] NULL,
	[Activo] [char](1) NULL,
	[FechaAlta] [datetime] NOT NULL,
	[UsuarUltm] [char](12) NULL,
	[FechaUltM] [datetime] NULL,
	[desde] [datetime] NULL,
	[hasta] [datetime] NULL,
	[Observ] [varchar](100) NULL,
	[Fpago] [int] NULL,
	[Jdd] [int] NULL,
	[FechEntrLic] [datetime] NULL,
	[UsuarAlta] [char](12) NOT NULL,
	[UsuarBaja] [char](12) NULL,
	[FechaBaja] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[IDProducto] ASC,
	[IDCliente] ASC,
	[FechaAlta] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[rclientes]    Script Date: 04/12/2016 17:51:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[rclientes](
	[IDCliente] [int] IDENTITY(1,1) NOT NULL,
	[Cliente] [char](15) NULL,
	[Nombre] [varchar](50) NULL,
	[Direccion] [varchar](128) NULL,
	[Origen] [int] NULL,
	[nrotra] [int] NULL,
	[Jdd] [int] NULL,
	[IDPadre] [int] NULL,
	[SistCont] [varchar](100) NULL,
	[Fono] [varchar](50) NULL,
	[NombreR] [varchar](100) NULL,
	[MailR] [varchar](50) NULL,
	[FuncionC] [varchar](100) NULL,
	[UsuarioA] [char](12) NULL,
	[Rut] [char](12) NOT NULL,
	[Estado] [char](1) NOT NULL,
	[Tipo] [int] NOT NULL,
	[Rubro] [int] NULL,
	[Fecha_ini] [datetime] NULL,
	[NomFan] [varchar](100) NULL,
	[CodSII] [varchar](150) NULL,
	[HsAdic] [int] NOT NULL,
	[RutR] [char](12) NULL,
	[PassR] [varchar](max) NULL,
	[FechaA] [datetime] NULL,
	[EstadoUpg] [int] NULL,
	[Fpago] [int] NOT NULL,
	[grupo_out] [int] NOT NULL,
	[Grupo] [int] NOT NULL,
 CONSTRAINT [PK_IDCLIENTE] PRIMARY KEY CLUSTERED 
(
	[IDCliente] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RclaremH]    Script Date: 04/12/2016 17:51:07 ******/
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
/****** Object:  Table [dbo].[Rclarem]    Script Date: 04/12/2016 17:51:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Rclarem](
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
	[Jdd] [int] NOT NULL,
	[Ndecimon] [int] NOT NULL,
 CONSTRAINT [PK_Rclarem] PRIMARY KEY CLUSTERED 
(
	[Jdd] ASC,
	[Codigo] ASC,
	[Cohade] ASC,
	[Periodo] ASC,
	[Nro] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RclaencH]    Script Date: 04/12/2016 17:51:07 ******/
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
/****** Object:  Table [dbo].[Rclaenc]    Script Date: 04/12/2016 17:51:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Rclaenc](
	[Codigo] [char](12) NOT NULL,
	[Descrip] [char](30) NOT NULL,
	[Codemp] [char](12) NOT NULL,
	[Funda] [varchar](max) NOT NULL,
	[Jdd] [int] NOT NULL,
 CONSTRAINT [PK_Rclaenc] PRIMARY KEY CLUSTERED 
(
	[Jdd] ASC,
	[Codigo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Rcertis]    Script Date: 04/12/2016 17:51:07 ******/
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
/****** Object:  Table [dbo].[RCERTIREN]    Script Date: 04/12/2016 17:51:07 ******/
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
	[OtrExento] [money] NOT NULL,
	[aOtrExent] [money] NOT NULL,
 CONSTRAINT [PK_RCERTIREN] PRIMARY KEY CLUSTERED 
(
	[Rut] ASC,
	[Ames] ASC,
	[Empresa] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Rcentros]    Script Date: 04/12/2016 17:51:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Rcentros](
	[Codigo] [char](12) NOT NULL,
	[Ames] [char](6) NOT NULL,
	[Peri] [char](1) NOT NULL,
	[Periodo] [char](7) NOT NULL,
	[Cencos] [money] NOT NULL,
	[Porcen] [money] NOT NULL,
	[Unids] [money] NOT NULL,
	[Ticen] [char](1) NOT NULL,
	[Jdd] [int] NOT NULL,
 CONSTRAINT [PK_Rcentros] PRIMARY KEY CLUSTERED 
(
	[Jdd] ASC,
	[Ames] ASC,
	[Codigo] ASC,
	[Peri] ASC,
	[Cencos] ASC,
	[Porcen] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Rbloq]    Script Date: 04/12/2016 17:51:07 ******/
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
/****** Object:  Table [dbo].[Rbecas]    Script Date: 04/12/2016 17:51:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Rbecas](
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
	[jdd] [int] NOT NULL,
 CONSTRAINT [PK_Rbecas] PRIMARY KEY CLUSTERED 
(
	[RUT] ASC,
	[fecha] ASC,
	[jdd] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[rbatchvisto]    Script Date: 04/12/2016 17:51:07 ******/
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
/****** Object:  Table [dbo].[rbatchst]    Script Date: 04/12/2016 17:51:07 ******/
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
	[Idbatch] ASC,
	[Fecha] ASC,
	[Estado] ASC,
	[Jdd] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[rbatchqf]    Script Date: 04/12/2016 17:51:07 ******/
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
/****** Object:  Table [dbo].[rbatchliq]    Script Date: 04/12/2016 17:51:07 ******/
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
	[Nombre] [char](40) NOT NULL,
	[Feliq] [char](6) NOT NULL,
	[Rut] [char](12) NOT NULL,
	[Cargo] [varchar](50) NOT NULL,
	[Fecha_ing] [datetime] NOT NULL,
	[erut] [char](12) NOT NULL,
	[Coform] [char](4) NOT NULL,
	[hab] [money] NOT NULL,
	[des] [money] NOT NULL,
	[otr] [money] NOT NULL,
	[Dias] [int] NOT NULL,
	[d15] [char](1) NOT NULL,
	[vl] [char](1) NOT NULL,
	[Tkdlo] [int] NOT NULL,
	[Pone] [char](1) NOT NULL,
	[Jdd] [int] NOT NULL,
	[dias3pd] [int] NOT NULL,
	[licmd1] [int] NOT NULL,
	[licmd2] [int] NOT NULL,
	[licmd3] [int] NOT NULL,
	[licmd4] [int] NOT NULL,
	[licmd5] [int] NOT NULL,
	[licmd6] [int] NOT NULL,
 CONSTRAINT [PK_rbatchliq] PRIMARY KEY CLUSTERED 
(
	[Idbatch] ASC,
	[Jdd] ASC,
	[Codigo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[rbatchfiniq]    Script Date: 04/12/2016 17:51:07 ******/
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
/****** Object:  Table [dbo].[rbatchdesc]    Script Date: 04/12/2016 17:51:07 ******/
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
/****** Object:  Table [dbo].[rbatch]    Script Date: 04/12/2016 17:51:07 ******/
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
	[ProcessId] [int] NULL,
	[IdLauncher] [varchar](50) NULL,
	[JobId] [uniqueidentifier] NULL,
 CONSTRAINT [PK_rbatch] PRIMARY KEY CLUSTERED 
(
	[Jdd] ASC,
	[Idbatch] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Rbases]    Script Date: 04/12/2016 17:51:07 ******/
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
	[IDCliente] [int] NOT NULL,
	[grupo_out] [int] NOT NULL,
	[cola] [char](250) NOT NULL,
	[Quincena] [char](1) NOT NULL,
	[Alarma] [char](1) NOT NULL,
	[Streamline] [char](1) NOT NULL,
	[IdAdp] [char](12) NOT NULL,
	[Estado] [char](1) NOT NULL,
	[BaseE] [varchar](80) NOT NULL,
	[ServerE] [varchar](80) NOT NULL,
	[ODBC] [varchar](16) NOT NULL,
	[BatchMode] [char](1) NOT NULL,
	[BatchPath] [char](100) NOT NULL,
 CONSTRAINT [Rbases_PK] PRIMARY KEY CLUSTERED 
(
	[Jdd] ASC,
	[idJdd] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[rausent]    Script Date: 04/12/2016 17:51:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[rausent](
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
	[Rutpro] [char](12) NOT NULL,
	[Especia] [int] NOT NULL,
	[MontoAn] [money] NOT NULL,
	[MontoRe] [money] NOT NULL,
	[MontoCo] [money] NOT NULL,
	[Fecha_ret] [datetime] NOT NULL,
	[Estado] [char](1) NOT NULL,
	[Fecha_env] [datetime] NOT NULL,
	[Fecha_ico] [datetime] NOT NULL,
	[CodSub] [char](1) NOT NULL,
	[Origen] [char](1) NOT NULL,
	[Fecha_ing] [datetime] NOT NULL,
	[Usuario] [char](12) NOT NULL,
	[Lscan] [varbinary](max) NOT NULL,
	[Jdd] [int] NOT NULL,
	[fecha_ult] [datetime] NOT NULL,
	[SubsilB] [money] NOT NULL,
	[Dias3pd] [numeric](5, 2) NOT NULL,
	[SubsilN] [money] NOT NULL,
	[Dv] [char](1) NOT NULL,
 CONSTRAINT [PK_rausent] PRIMARY KEY CLUSTERED 
(
	[Jdd] ASC,
	[Codigo] ASC,
	[Fecha_ini] ASC,
	[Nulic] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Rasigna]    Script Date: 04/12/2016 17:51:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Rasigna](
	[Codigo] [char](12) NOT NULL,
	[Fecha_asi] [datetime] NOT NULL,
	[Descrip] [char](30) NOT NULL,
	[Bien] [int] NOT NULL,
	[Cantid] [int] NOT NULL,
	[Valor] [money] NOT NULL,
	[Fecha_ven] [datetime] NOT NULL,
	[Respon] [char](12) NOT NULL,
	[Obs] [char](250) NOT NULL,
	[Devuelto] [char](1) NOT NULL,
	[Jdd] [int] NOT NULL,
 CONSTRAINT [PK_Rasigna] PRIMARY KEY CLUSTERED 
(
	[Jdd] ASC,
	[Codigo] ASC,
	[Bien] ASC,
	[Fecha_asi] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RAlertasEnvio]    Script Date: 04/12/2016 17:51:07 ******/
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
/****** Object:  Table [dbo].[RALERTAS5]    Script Date: 04/12/2016 17:51:07 ******/
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
/****** Object:  Table [dbo].[RALERTAS]    Script Date: 04/12/2016 17:51:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RALERTAS](
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
 CONSTRAINT [PK_RALERTAS] PRIMARY KEY CLUSTERED 
(
	[Jdd] ASC,
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Rafectos]    Script Date: 04/12/2016 17:51:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Rafectos](
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
 CONSTRAINT [PK_Rafectos] PRIMARY KEY CLUSTERED 
(
	[Codigo] ASC,
	[Ames] ASC,
	[Peri] ASC,
	[Jdd] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[products]    Script Date: 04/12/2016 17:51:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[products](
	[ProductId] [int] NOT NULL,
	[ProductName] [char](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 100) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Plantillas]    Script Date: 04/12/2016 17:51:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Plantillas](
	[idPlantilla] [int] IDENTITY(1,1) NOT NULL,
	[nomPlantilla] [varchar](50) NOT NULL,
	[plantilla] [varbinary](max) NOT NULL,
	[extPlantilla] [varchar](50) NOT NULL,
	[idTipoArchivo] [int] NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PCPwrkusr]    Script Date: 04/12/2016 17:51:07 ******/
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
/****** Object:  Table [dbo].[PCPwrkflw]    Script Date: 04/12/2016 17:51:07 ******/
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
/****** Object:  Table [dbo].[PCPRvacaci]    Script Date: 04/12/2016 17:51:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PCPRvacaci](
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
	[IDOT] [int] NOT NULL,
	[PCPEstado] [int] NOT NULL,
	[PCPError] [varchar](200) NOT NULL,
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
/****** Object:  Table [dbo].[PCPRmapitm]    Script Date: 04/12/2016 17:51:07 ******/
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
	[Linea_wfl] [int] NOT NULL,
	[Etapa_wfl] [int] NOT NULL,
	[Etasig_wfl] [int] NOT NULL,
	[Orden_wfl] [int] NOT NULL,
	[Estado_wfl] [int] NOT NULL,
	[User_wfl] [char](12) NOT NULL,
	[Fecha_wfl] [datetime] NOT NULL,
	[Obser_wfl] [char](200) NOT NULL,
	[Iddonat] [int] NOT NULL,
 CONSTRAINT [PK_PCPRmapitm] PRIMARY KEY CLUSTERED 
(
	[IDPCPRmap] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PCPRgrupfa]    Script Date: 04/12/2016 17:51:07 ******/
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
/****** Object:  Table [dbo].[PCPRemples]    Script Date: 04/12/2016 17:51:07 ******/
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
	[Talla_z] [char](4) NOT NULL,
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
	[IDOT] [int] NOT NULL,
	[PCPestado] [int] NOT NULL,
	[PCPerror] [varchar](200) NOT NULL,
	[IDEmpleado] [int] IDENTITY(1,1) NOT NULL,
	[Linea_wfl] [int] NOT NULL,
	[Etapa_wfl] [int] NOT NULL,
	[Etasig_wfl] [int] NOT NULL,
	[Orden_wfl] [int] NOT NULL,
	[Estado_wfl] [int] NOT NULL,
	[User_wfl] [char](12) NOT NULL,
	[Fecha_wfl] [datetime] NOT NULL,
	[Obser_wfl] [char](200) NOT NULL,
	[Srsicoss] [int] NOT NULL,
	[Ccsicoss] [int] NOT NULL,
	[premint] [char](1) NOT NULL,
	[AutFirmar] [char](1) NOT NULL,
 CONSTRAINT [PK_PCPRemples] PRIMARY KEY CLUSTERED 
(
	[IDEmpleado] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PCPRdomic]    Script Date: 04/12/2016 17:51:07 ******/
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
/****** Object:  Table [dbo].[PCPRausent]    Script Date: 04/12/2016 17:51:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PCPRausent](
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
	[Rutpro] [char](12) NOT NULL,
	[Especia] [int] NOT NULL,
	[MontoAn] [money] NOT NULL,
	[MontoRe] [money] NOT NULL,
	[MontoCo] [money] NOT NULL,
	[Fecha_ret] [datetime] NOT NULL,
	[Estado] [char](1) NOT NULL,
	[Fecha_env] [datetime] NOT NULL,
	[Fecha_ico] [datetime] NOT NULL,
	[CodSub] [char](1) NOT NULL,
	[Origen] [char](1) NOT NULL,
	[Fecha_ing] [datetime] NOT NULL,
	[Usuario] [char](12) NOT NULL,
	[Lscan] [varbinary](max) NOT NULL,
	[Jdd] [int] NOT NULL,
	[IDOT] [int] NOT NULL,
	[PCPEstado] [int] NOT NULL,
	[PCPError] [varchar](200) NOT NULL,
	[IDAusent] [int] IDENTITY(1,1) NOT NULL,
	[Linea_wfl] [int] NOT NULL,
	[Etapa_wfl] [int] NOT NULL,
	[Etasig_wfl] [int] NOT NULL,
	[Orden_wfl] [int] NOT NULL,
	[Estado_wfl] [int] NOT NULL,
	[User_wfl] [char](12) NOT NULL,
	[Fecha_wfl] [datetime] NOT NULL,
	[Obser_wfl] [char](200) NOT NULL,
	[Dv] [char](1) NOT NULL,
 CONSTRAINT [PK_PCPRausent] PRIMARY KEY CLUSTERED 
(
	[IDAusent] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PCPPLANT]    Script Date: 04/12/2016 17:51:07 ******/
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
/****** Object:  Table [dbo].[PCPOT]    Script Date: 04/12/2016 17:51:07 ******/
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
/****** Object:  Table [dbo].[PCPNovF]    Script Date: 04/12/2016 17:51:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PCPNovF](
	[Codigo] [char](12) NOT NULL,
	[Nombre] [char](60) NOT NULL,
	[Campo1] [char](12) NOT NULL,
	[Valor1] [varchar](40) NOT NULL,
	[Campo2] [char](12) NOT NULL,
	[Valor2] [varchar](40) NOT NULL,
	[Campo3] [char](12) NOT NULL,
	[Valor3] [varchar](40) NOT NULL,
	[Campo4] [char](12) NOT NULL,
	[Valor4] [varchar](40) NOT NULL,
	[Numrem] [int] NOT NULL,
	[Opd] [int] NOT NULL,
	[Jdd] [int] NOT NULL,
	[IDOT] [int] NOT NULL,
	[PCPEstado] [int] NOT NULL,
	[PCPError] [varchar](200) NOT NULL,
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
/****** Object:  Table [dbo].[pcpNoved]    Script Date: 04/12/2016 17:51:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[pcpNoved](
	[idNov] [int] IDENTITY(1,1) NOT NULL,
	[fecha] [datetime] NOT NULL,
	[juegoDatos] [char](12) NOT NULL,
	[idJdd] [int] NOT NULL,
	[tipo] [char](1) NOT NULL,
	[Jdd] [int] NOT NULL,
 CONSTRAINT [pcpNoved_PK] PRIMARY KEY CLUSTERED 
(
	[Jdd] ASC,
	[idNov] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PCPMENSEST]    Script Date: 04/12/2016 17:51:07 ******/
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
/****** Object:  Table [dbo].[PCPMENSDET]    Script Date: 04/12/2016 17:51:07 ******/
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
/****** Object:  Table [dbo].[PCPMENSAJ]    Script Date: 04/12/2016 17:51:07 ******/
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
/****** Object:  Table [dbo].[PCPMENSADJUN]    Script Date: 04/12/2016 17:51:07 ******/
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
/****** Object:  Table [dbo].[PCPItemsD]    Script Date: 04/12/2016 17:51:07 ******/
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
/****** Object:  Table [dbo].[PCPItems]    Script Date: 04/12/2016 17:51:07 ******/
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
/****** Object:  Table [dbo].[pcpestad]    Script Date: 04/12/2016 17:51:07 ******/
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
/****** Object:  Table [dbo].[pcperrpro]    Script Date: 04/12/2016 17:51:07 ******/
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
/****** Object:  Table [dbo].[PCPComisi]    Script Date: 04/12/2016 17:51:07 ******/
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
/****** Object:  Table [dbo].[pcpCargEst]    Script Date: 04/12/2016 17:51:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[pcpCargEst](
	[idEstado] [int] IDENTITY(1,1) NOT NULL,
	[idCarga] [int] NOT NULL,
	[Estado] [int] NOT NULL,
	[Fecha] [datetime] NOT NULL,
	[Usuario] [char](12) NOT NULL,
	[Jdd] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idEstado] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbcontempr]    Script Date: 04/12/2016 17:51:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbcontempr](
	[prsid] [int] NOT NULL,
	[IDCliente] [int] NOT NULL,
	[tipocontid] [bigint] NOT NULL,
	[tipotratid] [bigint] NOT NULL,
	[contemprfechact] [datetime] NOT NULL,
	[contemprcargo] [int] NOT NULL,
	[contemprtel] [varchar](50) NOT NULL,
	[contemprcel] [varchar](50) NOT NULL,
	[contemprestado] [int] NOT NULL,
	[fechini] [datetime] NOT NULL,
	[fechfin] [datetime] NOT NULL,
	[Jdd] [int] NOT NULL,
 CONSTRAINT [PK_contempr] PRIMARY KEY CLUSTERED 
(
	[prsid] ASC,
	[IDCliente] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbcas]    Script Date: 04/12/2016 17:51:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbcas](
	[casid] [int] IDENTITY(1,1) NOT NULL,
	[IDCliente] [int] NOT NULL,
	[procid] [int] NULL,
	[casver] [varchar](50) NULL,
	[casreloj] [int] NULL,
	[casdll] [varchar](100) NULL,
	[cassp] [int] NULL,
	[casspesp] [int] NULL,
	[casrelgen] [int] NULL,
	[casrelviga] [int] NULL,
	[casrellogam] [int] NULL,
	[casrelotro] [varchar](100) NULL,
	[casmarmanu] [int] NULL,
	[casmarlinea] [int] NULL,
	[casmarcasi] [int] NULL,
	[casmarpay] [int] NULL,
	[casmarotr] [varchar](100) NULL,
	[Jdd] [int] NOT NULL,
 CONSTRAINT [PK_Casid] PRIMARY KEY CLUSTERED 
(
	[casid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbtransfempr]    Script Date: 04/12/2016 17:51:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbtransfempr](
	[transfid] [int] NOT NULL,
	[IDCliente] [int] NOT NULL,
	[Jdd] [int] NOT NULL,
 CONSTRAINT [PK_tbtransfempr] PRIMARY KEY CLUSTERED 
(
	[transfid] ASC,
	[IDCliente] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbtk]    Script Date: 04/12/2016 17:51:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbtk](
	[tkid] [int] IDENTITY(1,1) NOT NULL,
	[IDCliente] [int] NOT NULL,
	[catid] [int] NOT NULL,
	[tkorigid] [int] NOT NULL,
	[tkfechcre] [datetime] NULL,
	[tkfechini] [datetime] NULL,
	[tkfechresp] [datetime] NULL,
	[tksolentr] [varchar](200) NULL,
	[tkivt] [int] NULL,
	[tkivtptotrat] [varchar](200) NULL,
	[tkivttareal] [varchar](200) NULL,
	[Usuario] [char](12) NULL,
	[estid] [int] NULL,
	[tkhrini] [datetime] NULL,
	[tkivthrfin] [datetime] NULL,
	[UsuarioNom] [varchar](100) NULL,
	[prsid] [int] NULL,
	[IDproducto] [int] NULL,
	[tkfechcierr] [datetime] NULL,
	[urlavi] [varchar](200) NULL,
	[tkadjunto] [varchar](200) NULL,
	[tkivtfechfin] [datetime] NULL,
	[Jdd] [int] NOT NULL,
 CONSTRAINT [PK_tkid] PRIMARY KEY CLUSTERED 
(
	[tkid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbllam]    Script Date: 04/12/2016 17:51:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbllam](
	[llamid] [int] IDENTITY(1,1) NOT NULL,
	[tkid] [int] NULL,
	[llamhrini] [datetime] NULL,
	[llamhrfin] [datetime] NULL,
	[llamdet] [varchar](max) NULL,
	[Usuario] [char](12) NULL,
	[prsid] [int] NULL,
	[llamnum] [int] NULL,
	[llamivr] [varchar](50) NULL,
	[Jdd] [int] NOT NULL,
 CONSTRAINT [PK_Llamid] PRIMARY KEY CLUSTERED 
(
	[llamid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Default [DF__conFotos__Nombre__2B5F6B28]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[conFotos] ADD  DEFAULT (' ') FOR [Nombre]
GO
/****** Object:  Default [DF__conFotos__Foto2__2C538F61]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[conFotos] ADD  DEFAULT ((0)) FOR [Foto2]
GO
/****** Object:  Default [DF__conFotos__Archiv__2D47B39A]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[conFotos] ADD  DEFAULT ((0)) FOR [Archivo]
GO
/****** Object:  Default [DF__conFotos__Nombre__2E3BD7D3]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[conFotos] ADD  DEFAULT (' ') FOR [NombreArchivo]
GO
/****** Object:  Default [DF__interconn__domai__5D227A9C]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[interconnection_token] ADD  DEFAULT (' ') FOR [domain]
GO
/****** Object:  Default [DF__interconn__datas__5E169ED5]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[interconnection_token] ADD  DEFAULT (' ') FOR [dataset]
GO
/****** Object:  Default [DF__interconn__token__5F0AC30E]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[interconnection_token] ADD  DEFAULT (' ') FOR [token]
GO
/****** Object:  Default [DF_ADD_CREATIION_DATE]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[interconnection_token] ADD  CONSTRAINT [DF_ADD_CREATIION_DATE]  DEFAULT (getdate()) FOR [creation]
GO
/****** Object:  Default [DF__LaunchSer__UrlSe__579EAB70]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[LaunchServers] ADD  DEFAULT (' ') FOR [UrlServ]
GO
/****** Object:  Default [DF__LaunchSer__ServN__5892CFA9]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[LaunchServers] ADD  DEFAULT (' ') FOR [ServName]
GO
/****** Object:  Default [DF__LaunchServe__CPU__5986F3E2]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[LaunchServers] ADD  DEFAULT ((0)) FOR [CPU]
GO
/****** Object:  Default [DF__LaunchSer__SrvSt__5A7B181B]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[LaunchServers] ADD  DEFAULT (' ') FOR [SrvState]
GO
/****** Object:  Default [DF__LaunchSer__LastR__5B6F3C54]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[LaunchServers] ADD  DEFAULT (getdate()) FOR [LastRun]
GO
/****** Object:  Default [DF__PCPCALEND__activ__2F2FFC0C]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPCALENDAR] ADD  DEFAULT ((0)) FOR [actividad]
GO
/****** Object:  Default [DF__PCPCALEND__fteor__30242045]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPCALENDAR] ADD  DEFAULT (getdate()) FOR [fteorica]
GO
/****** Object:  Default [DF__PCPCALEND__freal__3118447E]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPCALENDAR] ADD  DEFAULT (getdate()) FOR [freal]
GO
/****** Object:  Default [DF__PCPCALENDA__anio__320C68B7]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPCALENDAR] ADD  DEFAULT ((0)) FOR [anio]
GO
/****** Object:  Default [DF__PCPCALENDAR__mes__33008CF0]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPCALENDAR] ADD  DEFAULT ((0)) FOR [mes]
GO
/****** Object:  Default [DF__PCPCALEND__termi__33F4B129]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPCALENDAR] ADD  DEFAULT (' ') FOR [terminada]
GO
/****** Object:  Default [DF__PCPCALEND__statu__34E8D562]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPCALENDAR] ADD  DEFAULT (' ') FOR [status]
GO
/****** Object:  Default [DF__PCPCALENDAR__KPI__35DCF99B]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPCALENDAR] ADD  DEFAULT (' ') FOR [KPI]
GO
/****** Object:  Default [DF__PCPCALENDAR__Jdd__36D11DD4]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPCALENDAR] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__PCPCALHIS__activ__37C5420D]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPCALHIST] ADD  DEFAULT ((0)) FOR [actividad]
GO
/****** Object:  Default [DF__PCPCALHIST__anio__38B96646]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPCALHIST] ADD  DEFAULT ((0)) FOR [anio]
GO
/****** Object:  Default [DF__PCPCALHIST__mes__39AD8A7F]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPCALHIST] ADD  DEFAULT ((0)) FOR [mes]
GO
/****** Object:  Default [DF__PCPCALHIS__fteor__3AA1AEB8]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPCALHIST] ADD  DEFAULT (getdate()) FOR [fteorica]
GO
/****** Object:  Default [DF__PCPCALHIS__aprob__3B95D2F1]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPCALHIST] ADD  DEFAULT (' ') FOR [aprobada]
GO
/****** Object:  Default [DF__PCPCALHIS__usuar__3C89F72A]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPCALHIST] ADD  DEFAULT (' ') FOR [usuario]
GO
/****** Object:  Default [DF__PCPCALHIS__fecha__3D7E1B63]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPCALHIST] ADD  DEFAULT (getdate()) FOR [fecha]
GO
/****** Object:  Default [DF__PCPCALHIST__Jdd__3E723F9C]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPCALHIST] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__pcpCargas__fecha__3F6663D5]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[pcpCargas] ADD  DEFAULT (getdate()) FOR [fecha]
GO
/****** Object:  Default [DF__pcpCargas__USUAR__405A880E]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[pcpCargas] ADD  DEFAULT (' ') FOR [USUARIO]
GO
/****** Object:  Default [DF__pcpCargas__Titul__414EAC47]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[pcpCargas] ADD  DEFAULT (' ') FOR [Titulo]
GO
/****** Object:  Default [DF__pcpCargas__Descr__4242D080]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[pcpCargas] ADD  DEFAULT (' ') FOR [Descripcion]
GO
/****** Object:  Default [DF__pcpCargas__Tipo__4336F4B9]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[pcpCargas] ADD  DEFAULT ((0)) FOR [Tipo]
GO
/****** Object:  Default [DF__pcpCargas__Archi__442B18F2]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[pcpCargas] ADD  DEFAULT ((0)) FOR [Archivo]
GO
/****** Object:  Default [DF__pcpCargas__nomAr__451F3D2B]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[pcpCargas] ADD  DEFAULT (' ') FOR [nomArch]
GO
/****** Object:  Default [DF__pcpCargas__extAr__46136164]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[pcpCargas] ADD  DEFAULT (' ') FOR [extArch]
GO
/****** Object:  Default [DF__pcpCargas__Jdd__4707859D]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[pcpCargas] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__pcpCargEs__idCar__47FBA9D6]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[pcpCargEst] ADD  DEFAULT ((0)) FOR [idCarga]
GO
/****** Object:  Default [DF__pcpCargEs__Estad__48EFCE0F]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[pcpCargEst] ADD  DEFAULT ((0)) FOR [Estado]
GO
/****** Object:  Default [DF__pcpCargEs__Fecha__49E3F248]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[pcpCargEst] ADD  DEFAULT (getdate()) FOR [Fecha]
GO
/****** Object:  Default [DF__pcpCargEs__Usuar__4AD81681]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[pcpCargEst] ADD  DEFAULT (' ') FOR [Usuario]
GO
/****** Object:  Default [DF__pcpCargEst__Jdd__4BCC3ABA]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[pcpCargEst] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__PCPComisi__Ames__4CC05EF3]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPComisi] ADD  DEFAULT (' ') FOR [Ames]
GO
/****** Object:  Default [DF__PCPComisi__Peri__4DB4832C]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPComisi] ADD  DEFAULT (' ') FOR [Peri]
GO
/****** Object:  Default [DF__PCPComisi__Codig__4EA8A765]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPComisi] ADD  DEFAULT (' ') FOR [Codigo]
GO
/****** Object:  Default [DF__PCPComisi__Nombr__4F9CCB9E]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPComisi] ADD  DEFAULT (' ') FOR [Nombre]
GO
/****** Object:  Default [DF__PCPComisi__Cohad__5090EFD7]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPComisi] ADD  DEFAULT (' ') FOR [Cohade]
GO
/****** Object:  Default [DF__PCPComisi__Numer__51851410]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPComisi] ADD  DEFAULT ((0)) FOR [Numero]
GO
/****** Object:  Default [DF__PCPComisi__Valor__52793849]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPComisi] ADD  DEFAULT ((0)) FOR [Valor1]
GO
/****** Object:  Default [DF__PCPComisi__Valor__536D5C82]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPComisi] ADD  DEFAULT ((0)) FOR [Valor2]
GO
/****** Object:  Default [DF__PCPComisi__Valor__546180BB]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPComisi] ADD  DEFAULT ((0)) FOR [Valor3]
GO
/****** Object:  Default [DF__PCPComisi__Valor__5555A4F4]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPComisi] ADD  DEFAULT ((0)) FOR [Valor4]
GO
/****** Object:  Default [DF__PCPComisi__Campo__5649C92D]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPComisi] ADD  DEFAULT (' ') FOR [Campo1]
GO
/****** Object:  Default [DF__PCPComisi__Campo__573DED66]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPComisi] ADD  DEFAULT (' ') FOR [Campo2]
GO
/****** Object:  Default [DF__PCPComisi__Campo__5832119F]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPComisi] ADD  DEFAULT (' ') FOR [Campo3]
GO
/****** Object:  Default [DF__PCPComisi__Campo__592635D8]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPComisi] ADD  DEFAULT (' ') FOR [Campo4]
GO
/****** Object:  Default [DF__PCPComisi__Largo__5A1A5A11]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPComisi] ADD  DEFAULT (' ') FOR [Largo1]
GO
/****** Object:  Default [DF__PCPComisi__Largo__5B0E7E4A]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPComisi] ADD  DEFAULT (' ') FOR [Largo2]
GO
/****** Object:  Default [DF__PCPComisi__Jdd__5C02A283]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPComisi] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__PCPComisi__IDOT__5CF6C6BC]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPComisi] ADD  DEFAULT ((0)) FOR [IDOT]
GO
/****** Object:  Default [DF__PCPComisi__PCPEs__5DEAEAF5]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPComisi] ADD  DEFAULT ((0)) FOR [PCPEstado]
GO
/****** Object:  Default [DF__PCPComisi__PCPEr__5EDF0F2E]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPComisi] ADD  DEFAULT (' ') FOR [PCPErrores]
GO
/****** Object:  Default [DF__PCPComisi__Linea__5FD33367]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPComisi] ADD  DEFAULT ((0)) FOR [Linea_wfl]
GO
/****** Object:  Default [DF__PCPComisi__Etapa__60C757A0]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPComisi] ADD  DEFAULT ((0)) FOR [Etapa_wfl]
GO
/****** Object:  Default [DF__PCPComisi__Etasi__61BB7BD9]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPComisi] ADD  DEFAULT ((0)) FOR [Etasig_wfl]
GO
/****** Object:  Default [DF__PCPComisi__Orden__62AFA012]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPComisi] ADD  DEFAULT ((0)) FOR [Orden_wfl]
GO
/****** Object:  Default [DF__PCPComisi__Estad__63A3C44B]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPComisi] ADD  DEFAULT ((0)) FOR [Estado_wfl]
GO
/****** Object:  Default [DF__PCPComisi__User___6497E884]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPComisi] ADD  DEFAULT (' ') FOR [User_wfl]
GO
/****** Object:  Default [DF__PCPComisi__Fecha__658C0CBD]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPComisi] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [Fecha_wfl]
GO
/****** Object:  Default [DF__PCPComisi__Obser__668030F6]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPComisi] ADD  DEFAULT (' ') FOR [Obser_wfl]
GO
/****** Object:  Default [DF__pcperrpro__Idest__6774552F]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[pcperrpro] ADD  DEFAULT ((0)) FOR [Idestado]
GO
/****** Object:  Default [DF__pcperrpro__Descr__68687968]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[pcperrpro] ADD  DEFAULT (' ') FOR [Descrip]
GO
/****** Object:  Default [DF__pcperrpro__jdd__695C9DA1]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[pcperrpro] ADD  DEFAULT ((0)) FOR [jdd]
GO
/****** Object:  Default [DF__pcpestad__Activi__6A50C1DA]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[pcpestad] ADD  DEFAULT ((0)) FOR [Actividad]
GO
/****** Object:  Default [DF__pcpestad__Fteori__6B44E613]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[pcpestad] ADD  DEFAULT (getdate()) FOR [Fteorica]
GO
/****** Object:  Default [DF__pcpestad__Act_de__6C390A4C]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[pcpestad] ADD  DEFAULT (' ') FOR [Act_desc]
GO
/****** Object:  Default [DF__pcpestad__Freal__6D2D2E85]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[pcpestad] ADD  DEFAULT (getdate()) FOR [Freal]
GO
/****** Object:  Default [DF__pcpestad__Atraso__6E2152BE]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[pcpestad] ADD  DEFAULT ((0)) FOR [Atraso]
GO
/****** Object:  Default [DF__pcpestad__Ames__6F1576F7]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[pcpestad] ADD  DEFAULT (' ') FOR [Ames]
GO
/****** Object:  Default [DF__pcpestad__status__70099B30]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[pcpestad] ADD  DEFAULT ((0)) FOR [status]
GO
/****** Object:  Default [DF__pcpestad__Respon__70FDBF69]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[pcpestad] ADD  DEFAULT (' ') FOR [Responsab]
GO
/****** Object:  Default [DF__pcpestad__Status__71F1E3A2]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[pcpestad] ADD  DEFAULT (' ') FOR [Status1]
GO
/****** Object:  Default [DF__pcpestad__Status__72E607DB]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[pcpestad] ADD  DEFAULT (' ') FOR [Status2]
GO
/****** Object:  Default [DF__pcpestad__Grupo__73DA2C14]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[pcpestad] ADD  DEFAULT ((0)) FOR [Grupo]
GO
/****** Object:  Default [DF__pcpestad__Grupo___74CE504D]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[pcpestad] ADD  DEFAULT (' ') FOR [Grupo_desc]
GO
/****** Object:  Default [DF__pcpestad__Subger__75C27486]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[pcpestad] ADD  DEFAULT (' ') FOR [Subgeren]
GO
/****** Object:  Default [DF__pcpestad__Gerenc__76B698BF]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[pcpestad] ADD  DEFAULT (' ') FOR [Gerencia]
GO
/****** Object:  Default [DF__pcpestad__Idjdd__77AABCF8]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[pcpestad] ADD  DEFAULT (' ') FOR [Idjdd]
GO
/****** Object:  Default [DF__pcpestad__Idjdd___789EE131]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[pcpestad] ADD  DEFAULT (' ') FOR [Idjdd_desc]
GO
/****** Object:  Default [DF__pcpestad__Idclie__7993056A]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[pcpestad] ADD  DEFAULT ((0)) FOR [Idcliente]
GO
/****** Object:  Default [DF__pcpestad__Client__7A8729A3]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[pcpestad] ADD  DEFAULT (' ') FOR [Cliente]
GO
/****** Object:  Default [DF__pcpestad__jdd__7B7B4DDC]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[pcpestad] ADD  DEFAULT ((0)) FOR [jdd]
GO
/****** Object:  Default [DF__PCPItems__Descri__7C6F7215]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPItems] ADD  DEFAULT (' ') FOR [Descrip]
GO
/****** Object:  Default [DF__PCPItems__Jdd__7D63964E]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPItems] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__PCPItems__Usuari__7E57BA87]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPItems] ADD  DEFAULT (' ') FOR [UsuarioC]
GO
/****** Object:  Default [DF__PCPItems__FechaC__7F4BDEC0]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPItems] ADD  DEFAULT (getdate()) FOR [FechaC]
GO
/****** Object:  Default [DF__PCPItems__Usuari__004002F9]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPItems] ADD  DEFAULT (' ') FOR [UsuarioM]
GO
/****** Object:  Default [DF__PCPItems__FechaM__01342732]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPItems] ADD  DEFAULT (getdate()) FOR [FechaM]
GO
/****** Object:  Default [DF__PCPItems__Perfil__02284B6B]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPItems] ADD  DEFAULT (' ') FOR [Perfiles]
GO
/****** Object:  Default [DF__PCPItemsD__IDPCP__031C6FA4]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPItemsD] ADD  DEFAULT ((0)) FOR [IDPCPitems]
GO
/****** Object:  Default [DF__PCPItemsD__Cohad__041093DD]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPItemsD] ADD  DEFAULT (' ') FOR [Cohade]
GO
/****** Object:  Default [DF__PCPItemsD__Nro__0504B816]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPItemsD] ADD  DEFAULT ((0)) FOR [Nro]
GO
/****** Object:  Default [DF__PCPItemsD__Titul__05F8DC4F]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPItemsD] ADD  DEFAULT (' ') FOR [Titulo]
GO
/****** Object:  Default [DF__PCPItemsD__Cofor__06ED0088]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPItemsD] ADD  DEFAULT (' ') FOR [Coform]
GO
/****** Object:  Default [DF__PCPItemsD__Cuoto__07E124C1]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPItemsD] ADD  DEFAULT ((0)) FOR [Cuotot]
GO
/****** Object:  Default [DF__PCPItemsD__Cuopa__08D548FA]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPItemsD] ADD  DEFAULT ((0)) FOR [Cuopar]
GO
/****** Object:  Default [DF__PCPItemsD__Fecha__09C96D33]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPItemsD] ADD  DEFAULT (getdate()) FOR [Fecha_ini]
GO
/****** Object:  Default [DF__PCPItemsD__Fecha__0ABD916C]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPItemsD] ADD  DEFAULT (getdate()) FOR [Fecha_fin]
GO
/****** Object:  Default [DF__PCPItemsD__Cenco__0BB1B5A5]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPItemsD] ADD  DEFAULT ((0)) FOR [Cencos]
GO
/****** Object:  Default [DF__PCPItemsD__Cuent__0CA5D9DE]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPItemsD] ADD  DEFAULT (' ') FOR [Cuenta]
GO
/****** Object:  Default [DF__PCPItemsD__Ticen__0D99FE17]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPItemsD] ADD  DEFAULT (' ') FOR [Ticen]
GO
/****** Object:  Default [DF__PCPItemsD__Obs__0E8E2250]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPItemsD] ADD  DEFAULT (' ') FOR [Obs]
GO
/****** Object:  Default [DF__PCPItemsD__Grupo__0F824689]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPItemsD] ADD  DEFAULT ((0)) FOR [Grupo]
GO
/****** Object:  Default [DF__PCPItemsD__Simes__10766AC2]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPItemsD] ADD  DEFAULT (' ') FOR [Simes]
GO
/****** Object:  Default [DF__PCPItemsD__Codpr__116A8EFB]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPItemsD] ADD  DEFAULT ((0)) FOR [Codpres]
GO
/****** Object:  Default [DF__PCPItemsD__Propo__125EB334]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPItemsD] ADD  DEFAULT (' ') FOR [Propor]
GO
/****** Object:  Default [DF__PCPItemsD__Coins__1352D76D]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPItemsD] ADD  DEFAULT ((0)) FOR [Coinst]
GO
/****** Object:  Default [DF__PCPItemsD__PerIm__1446FBA6]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPItemsD] ADD  DEFAULT ((0)) FOR [PerImp]
GO
/****** Object:  Default [DF__PCPItemsD__Acumu__153B1FDF]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPItemsD] ADD  DEFAULT ((0)) FOR [Acumu]
GO
/****** Object:  Default [DF__PCPItemsD__Maxim__162F4418]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPItemsD] ADD  DEFAULT ((0)) FOR [Maximo]
GO
/****** Object:  Default [DF__PCPItemsD__Tiacu__17236851]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPItemsD] ADD  DEFAULT (' ') FOR [Tiacu]
GO
/****** Object:  Default [DF__PCPItemsD__HNro__18178C8A]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPItemsD] ADD  DEFAULT ((0)) FOR [HNro]
GO
/****** Object:  Default [DF__PCPItemsD__HCofo__190BB0C3]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPItemsD] ADD  DEFAULT ((0)) FOR [HCoform]
GO
/****** Object:  Default [DF__PCPItemsD__HCuot__19FFD4FC]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPItemsD] ADD  DEFAULT ((0)) FOR [HCuotot]
GO
/****** Object:  Default [DF__PCPItemsD__HCuop__1AF3F935]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPItemsD] ADD  DEFAULT ((0)) FOR [HCuopar]
GO
/****** Object:  Default [DF__PCPItemsD__HFech__1BE81D6E]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPItemsD] ADD  DEFAULT ((0)) FOR [HFecha_ini]
GO
/****** Object:  Default [DF__PCPItemsD__HFech__1CDC41A7]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPItemsD] ADD  DEFAULT ((0)) FOR [HFecha_fin]
GO
/****** Object:  Default [DF__PCPItemsD__HCenc__1DD065E0]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPItemsD] ADD  DEFAULT ((0)) FOR [HCencos]
GO
/****** Object:  Default [DF__PCPItemsD__HCuen__1EC48A19]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPItemsD] ADD  DEFAULT ((0)) FOR [HCuenta]
GO
/****** Object:  Default [DF__PCPItemsD__HTice__1FB8AE52]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPItemsD] ADD  DEFAULT ((0)) FOR [HTicen]
GO
/****** Object:  Default [DF__PCPItemsD__HObs__20ACD28B]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPItemsD] ADD  DEFAULT ((0)) FOR [HObs]
GO
/****** Object:  Default [DF__PCPItemsD__HGrup__21A0F6C4]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPItemsD] ADD  DEFAULT ((0)) FOR [HGrupo]
GO
/****** Object:  Default [DF__PCPItemsD__HSime__22951AFD]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPItemsD] ADD  DEFAULT ((0)) FOR [HSimes]
GO
/****** Object:  Default [DF__PCPItemsD__HCodp__23893F36]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPItemsD] ADD  DEFAULT ((0)) FOR [HCodpres]
GO
/****** Object:  Default [DF__PCPItemsD__HProp__247D636F]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPItemsD] ADD  DEFAULT ((0)) FOR [HPropor]
GO
/****** Object:  Default [DF__PCPItemsD__HCoin__257187A8]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPItemsD] ADD  DEFAULT ((0)) FOR [HCoinst]
GO
/****** Object:  Default [DF__PCPItemsD__HPerI__2665ABE1]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPItemsD] ADD  DEFAULT ((0)) FOR [HPerImp]
GO
/****** Object:  Default [DF__PCPItemsD__HAcum__2759D01A]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPItemsD] ADD  DEFAULT ((0)) FOR [HAcumu]
GO
/****** Object:  Default [DF__PCPItemsD__HTiac__284DF453]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPItemsD] ADD  DEFAULT ((0)) FOR [HTiacu]
GO
/****** Object:  Default [DF__PCPItemsD__Jdd__2942188C]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPItemsD] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__PCPMENSAD__Secue__2A363CC5]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPMENSADJUN] ADD  DEFAULT ((0)) FOR [Secuen_Det]
GO
/****** Object:  Default [DF__PCPMENSAD__Docum__2B2A60FE]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPMENSADJUN] ADD  DEFAULT ((0)) FOR [Docum]
GO
/****** Object:  Default [DF__PCPMENSAD__TipoA__2C1E8537]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPMENSADJUN] ADD  DEFAULT (' ') FOR [TipoArch]
GO
/****** Object:  Default [DF__PCPMENSAD__Nombr__2D12A970]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPMENSADJUN] ADD  DEFAULT (' ') FOR [NombreArch]
GO
/****** Object:  Default [DF__PCPMENSADJU__Jdd__2E06CDA9]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPMENSADJUN] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__PCPMENSAJ__Usuar__2EFAF1E2]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPMENSAJ] ADD  DEFAULT (' ') FOR [Usuario]
GO
/****** Object:  Default [DF__PCPMENSAJ__tipo___2FEF161B]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPMENSAJ] ADD  DEFAULT ((0)) FOR [tipo_mensa]
GO
/****** Object:  Default [DF__PCPMENSAJ__asunt__30E33A54]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPMENSAJ] ADD  DEFAULT (' ') FOR [asunto_men]
GO
/****** Object:  Default [DF__PCPMENSAJ__Jdd__31D75E8D]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPMENSAJ] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__PCPMENSDE__idMen__32CB82C6]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPMENSDET] ADD  DEFAULT ((0)) FOR [idMensaje]
GO
/****** Object:  Default [DF__PCPMENSDE__Fecha__33BFA6FF]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPMENSDET] ADD  DEFAULT (getdate()) FOR [Fecha]
GO
/****** Object:  Default [DF__PCPMENSDE__Cuerp__34B3CB38]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPMENSDET] ADD  DEFAULT (' ') FOR [Cuerpo]
GO
/****** Object:  Default [DF__PCPMENSDE__Usuar__35A7EF71]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPMENSDET] ADD  DEFAULT (' ') FOR [Usuario]
GO
/****** Object:  Default [DF__PCPMENSDET__Jdd__369C13AA]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPMENSDET] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__PCPMENSES__idMen__379037E3]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPMENSEST] ADD  DEFAULT ((0)) FOR [idMensaje]
GO
/****** Object:  Default [DF__PCPMENSES__estad__38845C1C]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPMENSEST] ADD  DEFAULT (' ') FOR [estado]
GO
/****** Object:  Default [DF__PCPMENSES__fecha__39788055]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPMENSEST] ADD  DEFAULT (getdate()) FOR [fecha]
GO
/****** Object:  Default [DF__PCPMENSES__usuar__3A6CA48E]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPMENSEST] ADD  DEFAULT (' ') FOR [usuario]
GO
/****** Object:  Default [DF__PCPMENSEST__Jdd__3B60C8C7]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPMENSEST] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__pcpNoved__fecha__3C54ED00]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[pcpNoved] ADD  DEFAULT (getdate()) FOR [fecha]
GO
/****** Object:  Default [DF__pcpNoved__juegoD__3D491139]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[pcpNoved] ADD  DEFAULT (' ') FOR [juegoDatos]
GO
/****** Object:  Default [DF__pcpNoved__idJdd__3E3D3572]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[pcpNoved] ADD  DEFAULT ((0)) FOR [idJdd]
GO
/****** Object:  Default [DF__pcpNoved__tipo__3F3159AB]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[pcpNoved] ADD  DEFAULT (' ') FOR [tipo]
GO
/****** Object:  Default [DF__pcpNoved__Jdd__40257DE4]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[pcpNoved] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__PCPNovF__Codigo__4119A21D]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPNovF] ADD  DEFAULT (' ') FOR [Codigo]
GO
/****** Object:  Default [DF__PCPNovF__Nombre__420DC656]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPNovF] ADD  DEFAULT (' ') FOR [Nombre]
GO
/****** Object:  Default [DF__PCPNovF__Campo1__4301EA8F]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPNovF] ADD  DEFAULT (' ') FOR [Campo1]
GO
/****** Object:  Default [DF__PCPNovF__Valor1__43F60EC8]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPNovF] ADD  DEFAULT (' ') FOR [Valor1]
GO
/****** Object:  Default [DF__PCPNovF__Campo2__44EA3301]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPNovF] ADD  DEFAULT (' ') FOR [Campo2]
GO
/****** Object:  Default [DF__PCPNovF__Valor2__45DE573A]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPNovF] ADD  DEFAULT (' ') FOR [Valor2]
GO
/****** Object:  Default [DF__PCPNovF__Campo3__46D27B73]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPNovF] ADD  DEFAULT (' ') FOR [Campo3]
GO
/****** Object:  Default [DF__PCPNovF__Valor3__47C69FAC]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPNovF] ADD  DEFAULT (' ') FOR [Valor3]
GO
/****** Object:  Default [DF__PCPNovF__Campo4__48BAC3E5]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPNovF] ADD  DEFAULT (' ') FOR [Campo4]
GO
/****** Object:  Default [DF__PCPNovF__Valor4__49AEE81E]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPNovF] ADD  DEFAULT (' ') FOR [Valor4]
GO
/****** Object:  Default [DF__PCPNovF__Numrem__4AA30C57]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPNovF] ADD  DEFAULT ((0)) FOR [Numrem]
GO
/****** Object:  Default [DF__PCPNovF__Opd__4B973090]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPNovF] ADD  DEFAULT ((0)) FOR [Opd]
GO
/****** Object:  Default [DF__PCPNovF__Jdd__4C8B54C9]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPNovF] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__PCPNovF__IDOT__4D7F7902]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPNovF] ADD  DEFAULT ((0)) FOR [IDOT]
GO
/****** Object:  Default [DF__PCPNovF__PCPEsta__4E739D3B]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPNovF] ADD  DEFAULT ((0)) FOR [PCPEstado]
GO
/****** Object:  Default [DF__PCPNovF__PCPErro__4F67C174]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPNovF] ADD  DEFAULT (' ') FOR [PCPError]
GO
/****** Object:  Default [DF__PCPNovF__Linea_w__505BE5AD]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPNovF] ADD  DEFAULT ((0)) FOR [Linea_wfl]
GO
/****** Object:  Default [DF__PCPNovF__Etapa_w__515009E6]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPNovF] ADD  DEFAULT ((0)) FOR [Etapa_wfl]
GO
/****** Object:  Default [DF__PCPNovF__Etasig___52442E1F]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPNovF] ADD  DEFAULT ((0)) FOR [Etasig_wfl]
GO
/****** Object:  Default [DF__PCPNovF__Orden_w__53385258]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPNovF] ADD  DEFAULT ((0)) FOR [Orden_wfl]
GO
/****** Object:  Default [DF__PCPNovF__Estado___542C7691]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPNovF] ADD  DEFAULT ((0)) FOR [Estado_wfl]
GO
/****** Object:  Default [DF__PCPNovF__User_wf__55209ACA]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPNovF] ADD  DEFAULT (' ') FOR [User_wfl]
GO
/****** Object:  Default [DF__PCPNovF__Fecha_w__5614BF03]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPNovF] ADD  DEFAULT (getdate()) FOR [Fecha_wfl]
GO
/****** Object:  Default [DF__PCPNovF__Obser_w__5708E33C]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPNovF] ADD  DEFAULT (' ') FOR [Obser_wfl]
GO
/****** Object:  Default [DF__PCPOT__Tipo__57FD0775]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPOT] ADD  DEFAULT ((0)) FOR [Tipo]
GO
/****** Object:  Default [DF__PCPOT__Fecha__58F12BAE]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPOT] ADD  DEFAULT (getdate()) FOR [Fecha]
GO
/****** Object:  Default [DF__PCPOT__Resumen__59E54FE7]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPOT] ADD  DEFAULT (' ') FOR [Resumen]
GO
/****** Object:  Default [DF__PCPOT__Usuario__5AD97420]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPOT] ADD  DEFAULT (' ') FOR [Usuario]
GO
/****** Object:  Default [DF__PCPOT__Jdd__5BCD9859]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPOT] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__PCPOT__Perfil__5CC1BC92]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPOT] ADD  DEFAULT (' ') FOR [Perfil]
GO
/****** Object:  Default [DF__PCPOT__Fecha_Env__5DB5E0CB]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPOT] ADD  DEFAULT (getdate()) FOR [Fecha_Env]
GO
/****** Object:  Default [DF__PCPOT__Fecha_Rec__5EAA0504]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPOT] ADD  DEFAULT (getdate()) FOR [Fecha_Rec]
GO
/****** Object:  Default [DF__PCPOT__idItems__5F9E293D]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPOT] ADD  DEFAULT ((0)) FOR [idItems]
GO
/****** Object:  Default [DF__PCPPLANT__Titulo__60924D76]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPPLANT] ADD  DEFAULT (' ') FOR [Titulo]
GO
/****** Object:  Default [DF__PCPPLANT__Descri__618671AF]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPPLANT] ADD  DEFAULT (' ') FOR [Descrip]
GO
/****** Object:  Default [DF__PCPPLANT__Tipo__627A95E8]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPPLANT] ADD  DEFAULT ((0)) FOR [Tipo]
GO
/****** Object:  Default [DF__PCPPLANT__Nompla__636EBA21]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPPLANT] ADD  DEFAULT (' ') FOR [Nomplant]
GO
/****** Object:  Default [DF__PCPPLANT__Extens__6462DE5A]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPPLANT] ADD  DEFAULT (' ') FOR [Extension]
GO
/****** Object:  Default [DF__PCPPLANT__Planti__65570293]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPPLANT] ADD  DEFAULT ((0)) FOR [Plantilla]
GO
/****** Object:  Default [DF__PCPPLANT__Usuari__664B26CC]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPPLANT] ADD  DEFAULT (' ') FOR [Usuario]
GO
/****** Object:  Default [DF__PCPPLANT__Fecha__673F4B05]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPPLANT] ADD  DEFAULT (getdate()) FOR [Fecha]
GO
/****** Object:  Default [DF__PCPPLANT__Jdd__68336F3E]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPPLANT] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__PCPPLANT__TieneP__69279377]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPPLANT] ADD  DEFAULT (' ') FOR [TienePlant]
GO
/****** Object:  Default [DF__PCPRausen__Codig__6A1BB7B0]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRausent] ADD  DEFAULT (' ') FOR [Codigo]
GO
/****** Object:  Default [DF__PCPRausen__Fecha__6B0FDBE9]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRausent] ADD  DEFAULT (getdate()) FOR [Fecha_ini]
GO
/****** Object:  Default [DF__PCPRausent__Dias__6C040022]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRausent] ADD  DEFAULT ((0)) FOR [Dias]
GO
/****** Object:  Default [DF__PCPRausen__Fecha__6CF8245B]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRausent] ADD  DEFAULT (getdate()) FOR [Fecha_fin]
GO
/****** Object:  Default [DF__PCPRausen__Fecha__6DEC4894]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRausent] ADD  DEFAULT (getdate()) FOR [Fecha_lic]
GO
/****** Object:  Default [DF__PCPRausen__Rebsa__6EE06CCD]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRausent] ADD  DEFAULT ((0)) FOR [Rebsal]
GO
/****** Object:  Default [DF__PCPRausen__Escon__6FD49106]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRausent] ADD  DEFAULT (' ') FOR [Escon]
GO
/****** Object:  Default [DF__PCPRausent__Tipo__70C8B53F]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRausent] ADD  DEFAULT ((0)) FOR [Tipo]
GO
/****** Object:  Default [DF__PCPRausen__Dtipo__71BCD978]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRausent] ADD  DEFAULT (' ') FOR [Dtipo]
GO
/****** Object:  Default [DF__PCPRausen__Causa__72B0FDB1]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRausent] ADD  DEFAULT ((0)) FOR [Causal]
GO
/****** Object:  Default [DF__PCPRausen__Dcaus__73A521EA]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRausent] ADD  DEFAULT (' ') FOR [Dcausal]
GO
/****** Object:  Default [DF__PCPRausen__Detal__74994623]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRausent] ADD  DEFAULT (' ') FOR [Detalle]
GO
/****** Object:  Default [DF__PCPRausen__Medic__758D6A5C]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRausent] ADD  DEFAULT (' ') FOR [Medico]
GO
/****** Object:  Default [DF__PCPRausen__Nulic__76818E95]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRausent] ADD  DEFAULT ((0)) FOR [Nulic]
GO
/****** Object:  Default [DF__PCPRausen__DiasE__7775B2CE]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRausent] ADD  DEFAULT ((0)) FOR [DiasE]
GO
/****** Object:  Default [DF__PCPRausen__Medio__7869D707]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRausent] ADD  DEFAULT (' ') FOR [Medios]
GO
/****** Object:  Default [DF__PCPRausen__Diagn__795DFB40]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRausent] ADD  DEFAULT ((0)) FOR [Diagnos]
GO
/****** Object:  Default [DF__PCPRausen__Maile__7A521F79]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRausent] ADD  DEFAULT ((0)) FOR [Mailen]
GO
/****** Object:  Default [DF__PCPRausen__Rutpr__7B4643B2]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRausent] ADD  DEFAULT (' ') FOR [Rutpro]
GO
/****** Object:  Default [DF__PCPRausen__Espec__7C3A67EB]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRausent] ADD  DEFAULT ((0)) FOR [Especia]
GO
/****** Object:  Default [DF__PCPRausen__Monto__7D2E8C24]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRausent] ADD  DEFAULT ((0)) FOR [MontoAn]
GO
/****** Object:  Default [DF__PCPRausen__Monto__7E22B05D]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRausent] ADD  DEFAULT ((0)) FOR [MontoRe]
GO
/****** Object:  Default [DF__PCPRausen__Monto__7F16D496]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRausent] ADD  DEFAULT ((0)) FOR [MontoCo]
GO
/****** Object:  Default [DF__PCPRausen__Fecha__000AF8CF]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRausent] ADD  DEFAULT (getdate()) FOR [Fecha_ret]
GO
/****** Object:  Default [DF__PCPRausen__Estad__00FF1D08]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRausent] ADD  DEFAULT (' ') FOR [Estado]
GO
/****** Object:  Default [DF__PCPRausen__Fecha__01F34141]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRausent] ADD  DEFAULT (getdate()) FOR [Fecha_env]
GO
/****** Object:  Default [DF__PCPRausen__Fecha__02E7657A]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRausent] ADD  DEFAULT (getdate()) FOR [Fecha_ico]
GO
/****** Object:  Default [DF__PCPRausen__CodSu__03DB89B3]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRausent] ADD  DEFAULT (' ') FOR [CodSub]
GO
/****** Object:  Default [DF__PCPRausen__Orige__04CFADEC]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRausent] ADD  DEFAULT (' ') FOR [Origen]
GO
/****** Object:  Default [DF__PCPRausen__Fecha__05C3D225]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRausent] ADD  DEFAULT (getdate()) FOR [Fecha_ing]
GO
/****** Object:  Default [DF__PCPRausen__Usuar__06B7F65E]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRausent] ADD  DEFAULT (' ') FOR [Usuario]
GO
/****** Object:  Default [DF__PCPRausen__Lscan__07AC1A97]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRausent] ADD  DEFAULT ((0)) FOR [Lscan]
GO
/****** Object:  Default [DF__PCPRausent__Jdd__08A03ED0]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRausent] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__PCPRausent__IDOT__09946309]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRausent] ADD  DEFAULT ((0)) FOR [IDOT]
GO
/****** Object:  Default [DF__PCPRausen__PCPEs__0A888742]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRausent] ADD  DEFAULT ((0)) FOR [PCPEstado]
GO
/****** Object:  Default [DF__PCPRausen__PCPEr__0B7CAB7B]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRausent] ADD  DEFAULT (' ') FOR [PCPError]
GO
/****** Object:  Default [DF__PCPRausen__Linea__0C70CFB4]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRausent] ADD  DEFAULT ((0)) FOR [Linea_wfl]
GO
/****** Object:  Default [DF__PCPRausen__Etapa__0D64F3ED]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRausent] ADD  DEFAULT ((0)) FOR [Etapa_wfl]
GO
/****** Object:  Default [DF__PCPRausen__Etasi__0E591826]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRausent] ADD  DEFAULT ((0)) FOR [Etasig_wfl]
GO
/****** Object:  Default [DF__PCPRausen__Orden__0F4D3C5F]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRausent] ADD  DEFAULT ((0)) FOR [Orden_wfl]
GO
/****** Object:  Default [DF__PCPRausen__Estad__10416098]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRausent] ADD  DEFAULT ((0)) FOR [Estado_wfl]
GO
/****** Object:  Default [DF__PCPRausen__User___113584D1]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRausent] ADD  DEFAULT (' ') FOR [User_wfl]
GO
/****** Object:  Default [DF__PCPRausen__Fecha__1229A90A]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRausent] ADD  DEFAULT (getdate()) FOR [Fecha_wfl]
GO
/****** Object:  Default [DF__PCPRausen__Obser__131DCD43]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRausent] ADD  DEFAULT (' ') FOR [Obser_wfl]
GO
/****** Object:  Default [DF__PCPRausent__Dv__1411F17C]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRausent] ADD  DEFAULT (' ') FOR [Dv]
GO
/****** Object:  Default [DF__PCPRdomic__Jdd__150615B5]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRdomic] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__PCPRdomic__Codig__15FA39EE]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRdomic] ADD  DEFAULT (' ') FOR [Codigo]
GO
/****** Object:  Default [DF__PCPRdomic__Nombr__16EE5E27]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRdomic] ADD  DEFAULT (' ') FOR [Nombre]
GO
/****** Object:  Default [DF__PCPRdomic__Calle__17E28260]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRdomic] ADD  DEFAULT (' ') FOR [Calle]
GO
/****** Object:  Default [DF__PCPRdomic__Nro__18D6A699]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRdomic] ADD  DEFAULT (' ') FOR [Nro]
GO
/****** Object:  Default [DF__PCPRdomic__Piso__19CACAD2]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRdomic] ADD  DEFAULT (' ') FOR [Piso]
GO
/****** Object:  Default [DF__PCPRdomic__Depto__1ABEEF0B]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRdomic] ADD  DEFAULT (' ') FOR [Depto]
GO
/****** Object:  Default [DF__PCPRdomic__Comun__1BB31344]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRdomic] ADD  DEFAULT ((0)) FOR [Comuna]
GO
/****** Object:  Default [DF__PCPRdomic__Ciuda__1CA7377D]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRdomic] ADD  DEFAULT (' ') FOR [Ciudad]
GO
/****** Object:  Default [DF__PCPRdomic__Regio__1D9B5BB6]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRdomic] ADD  DEFAULT ((0)) FOR [Region]
GO
/****** Object:  Default [DF__PCPRdomic__IDOT__1E8F7FEF]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRdomic] ADD  DEFAULT ((0)) FOR [IDOT]
GO
/****** Object:  Default [DF__PCPRdomic__PCPEs__1F83A428]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRdomic] ADD  DEFAULT ((0)) FOR [PCPEstado]
GO
/****** Object:  Default [DF__PCPRdomic__PCPEr__2077C861]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRdomic] ADD  DEFAULT (' ') FOR [PCPErrores]
GO
/****** Object:  Default [DF__PCPRdomic__Codpo__216BEC9A]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRdomic] ADD  DEFAULT (' ') FOR [Codpostal]
GO
/****** Object:  Default [DF__PCPRdomic__Lote__226010D3]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRdomic] ADD  DEFAULT (' ') FOR [Lote]
GO
/****** Object:  Default [DF__PCPRdomic__Km__2354350C]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRdomic] ADD  DEFAULT (' ') FOR [Km]
GO
/****** Object:  Default [DF__PCPRdomic__Block__24485945]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRdomic] ADD  DEFAULT (' ') FOR [Block]
GO
/****** Object:  Default [DF__PCPRdomic__Etapa__253C7D7E]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRdomic] ADD  DEFAULT (' ') FOR [Etapa]
GO
/****** Object:  Default [DF__PCPRdomic__Manza__2630A1B7]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRdomic] ADD  DEFAULT (' ') FOR [Manzana]
GO
/****** Object:  Default [DF__PCPRdomic__Nombr__2724C5F0]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRdomic] ADD  DEFAULT (' ') FOR [NombreZona]
GO
/****** Object:  Default [DF__PCPRdomic__Refer__2818EA29]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRdomic] ADD  DEFAULT (' ') FOR [Referencia]
GO
/****** Object:  Default [DF__PCPRdomic__Ubige__290D0E62]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRdomic] ADD  DEFAULT (' ') FOR [Ubigeo]
GO
/****** Object:  Default [DF__PCPRdomic__Linea__2A01329B]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRdomic] ADD  DEFAULT ((0)) FOR [Linea_wfl]
GO
/****** Object:  Default [DF__PCPRdomic__Etapa__2AF556D4]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRdomic] ADD  DEFAULT ((0)) FOR [Etapa_wfl]
GO
/****** Object:  Default [DF__PCPRdomic__Etasi__2BE97B0D]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRdomic] ADD  DEFAULT ((0)) FOR [Etasig_wfl]
GO
/****** Object:  Default [DF__PCPRdomic__Orden__2CDD9F46]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRdomic] ADD  DEFAULT ((0)) FOR [Orden_wfl]
GO
/****** Object:  Default [DF__PCPRdomic__Estad__2DD1C37F]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRdomic] ADD  DEFAULT ((0)) FOR [Estado_wfl]
GO
/****** Object:  Default [DF__PCPRdomic__User___2EC5E7B8]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRdomic] ADD  DEFAULT (' ') FOR [User_wfl]
GO
/****** Object:  Default [DF__PCPRdomic__Fecha__2FBA0BF1]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRdomic] ADD  DEFAULT (getdate()) FOR [Fecha_wfl]
GO
/****** Object:  Default [DF__PCPRdomic__Obser__30AE302A]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRdomic] ADD  DEFAULT (' ') FOR [Obser_wfl]
GO
/****** Object:  Default [DF__PCPRemples__Jdd__31A25463]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__PCPRemple__Codig__3296789C]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT (' ') FOR [Codigo]
GO
/****** Object:  Default [DF__PCPRemple__Estad__338A9CD5]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT (' ') FOR [Estado]
GO
/****** Object:  Default [DF__PCPRemple__NFich__347EC10E]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT ((0)) FOR [NFicha]
GO
/****** Object:  Default [DF__PCPRemple__EsFpr__3572E547]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT (' ') FOR [EsFpri]
GO
/****** Object:  Default [DF__PCPRemple__Tipre__36670980]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT (' ') FOR [Tiprem]
GO
/****** Object:  Default [DF__PCPRemple__Empre__375B2DB9]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT (' ') FOR [Empresa]
GO
/****** Object:  Default [DF__PCPRemple__Nombr__384F51F2]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT (' ') FOR [Nombre]
GO
/****** Object:  Default [DF__PCPRemples__Rut__3943762B]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT (' ') FOR [Rut]
GO
/****** Object:  Default [DF__PCPRemples__Sexo__3A379A64]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT (' ') FOR [Sexo]
GO
/****** Object:  Default [DF__PCPRemple__Direc__3B2BBE9D]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT (' ') FOR [Direccion]
GO
/****** Object:  Default [DF__PCPRemples__Fono__3C1FE2D6]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT (' ') FOR [Fono]
GO
/****** Object:  Default [DF__PCPRemple__Fecha__3D14070F]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT (getdate()) FOR [Fecha_nac]
GO
/****** Object:  Default [DF__PCPRemple__Nacio__3E082B48]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT ((0)) FOR [Nacion]
GO
/****** Object:  Default [DF__PCPRemple__Celul__3EFC4F81]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT (' ') FOR [Celular]
GO
/****** Object:  Default [DF__PCPRemple__Est_c__3FF073BA]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT (' ') FOR [Est_civil]
GO
/****** Object:  Default [DF__PCPRemple__Estud__40E497F3]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT ((0)) FOR [Estudios]
GO
/****** Object:  Default [DF__PCPRemple__Titul__41D8BC2C]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT ((0)) FOR [Titulo]
GO
/****** Object:  Default [DF__PCPRemple__Clase__42CCE065]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT ((0)) FOR [Clase]
GO
/****** Object:  Default [DF__PCPRemple__Idiom__43C1049E]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT ((0)) FOR [Idiomas]
GO
/****** Object:  Default [DF__PCPRemple__Renma__44B528D7]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT ((0)) FOR [Renmax]
GO
/****** Object:  Default [DF__PCPRemple__Autop__45A94D10]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT (' ') FOR [Autopas]
GO
/****** Object:  Default [DF__PCPRemple__pmail__469D7149]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT (' ') FOR [pmail]
GO
/****** Object:  Default [DF__PCPRemple__Fecha__47919582]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT (getdate()) FOR [Fecha_ing]
GO
/****** Object:  Default [DF__PCPRemple__Tipo___4885B9BB]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT ((0)) FOR [Tipo_doc]
GO
/****** Object:  Default [DF__PCPRemple__Numdo__4979DDF4]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT (' ') FOR [Numdoc]
GO
/****** Object:  Default [DF__PCPRemples__Jefe__4A6E022D]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT (' ') FOR [Jefe]
GO
/****** Object:  Default [DF__PCPRemple__Autor__4B622666]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT (' ') FOR [Autoriza]
GO
/****** Object:  Default [DF__PCPRemple__Fecha__4C564A9F]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT (getdate()) FOR [Fecha_ret]
GO
/****** Object:  Default [DF__PCPRemple__Moti___4D4A6ED8]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT ((0)) FOR [Moti_ret]
GO
/****** Object:  Default [DF__PCPRemple__Fecha__4E3E9311]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT (getdate()) FOR [Fecha_xtr]
GO
/****** Object:  Default [DF__PCPRemple__Cenco__4F32B74A]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT ((0)) FOR [Cencos]
GO
/****** Object:  Default [DF__PCPRemple__Ticen__5026DB83]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT (' ') FOR [Ticen]
GO
/****** Object:  Default [DF__PCPRemple__Categ__511AFFBC]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT ((0)) FOR [Catego]
GO
/****** Object:  Default [DF__PCPRemple__Clasi__520F23F5]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT ((0)) FOR [Clasif]
GO
/****** Object:  Default [DF__PCPRemple__Ubica__5303482E]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT ((0)) FOR [Ubica]
GO
/****** Object:  Default [DF__PCPRemple__Lpago__53F76C67]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT ((0)) FOR [Lpago]
GO
/****** Object:  Default [DF__PCPRemple__Cargo__54EB90A0]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT ((0)) FOR [Cargo]
GO
/****** Object:  Default [DF__PCPRemple__Ocupa__55DFB4D9]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT (' ') FOR [Ocupacion]
GO
/****** Object:  Default [DF__PCPRemple__CodOc__56D3D912]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT ((0)) FOR [CodOcupa]
GO
/****** Object:  Default [DF__PCPRemple__Grado__57C7FD4B]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT ((0)) FOR [Grado]
GO
/****** Object:  Default [DF__PCPRemple__Divis__58BC2184]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT ((0)) FOR [Division]
GO
/****** Object:  Default [DF__PCPRemple__Unida__59B045BD]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT ((0)) FOR [Unidad]
GO
/****** Object:  Default [DF__PCPRemple__Horar__5AA469F6]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT ((0)) FOR [Horario]
GO
/****** Object:  Default [DF__PCPRemple__Conve__5B988E2F]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT ((0)) FOR [Convenio]
GO
/****** Object:  Default [DF__PCPRemple__Confi__5C8CB268]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT (' ') FOR [Confid]
GO
/****** Object:  Default [DF__PCPRemple__Secci__5D80D6A1]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT ((0)) FOR [Seccion]
GO
/****** Object:  Default [DF__PCPRemple__Sit_l__5E74FADA]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT ((0)) FOR [Sit_lab]
GO
/****** Object:  Default [DF__PCPRemple__CARNE__5F691F13]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT (' ') FOR [CARNET]
GO
/****** Object:  Default [DF__PCPRemple__Fpago__605D434C]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT ((0)) FOR [Fpago]
GO
/****** Object:  Default [DF__PCPRemple__Fpago__61516785]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT ((0)) FOR [Fpago2]
GO
/****** Object:  Default [DF__PCPRemple__Banco__62458BBE]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT ((0)) FOR [Banco]
GO
/****** Object:  Default [DF__PCPRemple__Banco__6339AFF7]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT ((0)) FOR [Banco2]
GO
/****** Object:  Default [DF__PCPRemple__Cta_c__642DD430]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT (' ') FOR [Cta_corr]
GO
/****** Object:  Default [DF__PCPRemple__Cta_c__6521F869]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT (' ') FOR [Cta_corr2]
GO
/****** Object:  Default [DF__PCPRemples__Ffp__66161CA2]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT ((0)) FOR [Ffp]
GO
/****** Object:  Default [DF__PCPRemples__Ffp2__670A40DB]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT ((0)) FOR [Ffp2]
GO
/****** Object:  Default [DF__PCPRemple__Ofiba__67FE6514]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT ((0)) FOR [Ofiban]
GO
/****** Object:  Default [DF__PCPRemple__Ofiba__68F2894D]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT ((0)) FOR [Ofiban2]
GO
/****** Object:  Default [DF__PCPRemple__Talla__69E6AD86]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT (' ') FOR [Talla_r]
GO
/****** Object:  Default [DF__PCPRemple__Talla__6ADAD1BF]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT (' ') FOR [Talla_z]
GO
/****** Object:  Default [DF__PCPRemple__Cod_a__6BCEF5F8]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT ((0)) FOR [Cod_afp]
GO
/****** Object:  Default [DF__PCPRemple__Numaf__6CC31A31]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT (' ') FOR [Numafp]
GO
/****** Object:  Default [DF__PCPRemple__Fecha__6DB73E6A]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT (getdate()) FOR [Fecha_afp]
GO
/****** Object:  Default [DF__PCPRemple__Cod_s__6EAB62A3]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT ((0)) FOR [Cod_sin]
GO
/****** Object:  Default [DF__PCPRemple__Cod_i__6F9F86DC]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT ((0)) FOR [Cod_isa]
GO
/****** Object:  Default [DF__PCPRemples__Fun__7093AB15]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT (' ') FOR [Fun]
GO
/****** Object:  Default [DF__PCPRemple__Fecha__7187CF4E]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT (getdate()) FOR [Fecha_isa]
GO
/****** Object:  Default [DF__PCPRemple__Cod_i__727BF387]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT ((0)) FOR [Cod_ine]
GO
/****** Object:  Default [DF__PCPRemple__Cod_c__737017C0]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT ((0)) FOR [Cod_caj]
GO
/****** Object:  Default [DF__PCPRemple__Zonaf__74643BF9]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT ((0)) FOR [Zonafa]
GO
/****** Object:  Default [DF__PCPRemple__Tramo__75586032]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT ((0)) FOR [Tramo_car]
GO
/****** Object:  Default [DF__PCPRemple__Cod_r__764C846B]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT ((0)) FOR [Cod_reg]
GO
/****** Object:  Default [DF__PCPRemple__Jubil__7740A8A4]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT (' ') FOR [Jubila]
GO
/****** Object:  Default [DF__PCPRemple__Fecha__7834CCDD]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT (getdate()) FOR [Fecha_vac]
GO
/****** Object:  Default [DF__PCPRemple__Vac_f__7928F116]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT (' ') FOR [Vac_form]
GO
/****** Object:  Default [DF__PCPRemple__Vac_a__7A1D154F]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT ((0)) FOR [Vac_anre]
GO
/****** Object:  Default [DF__PCPRemple__Fecha__7B113988]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT (getdate()) FOR [Fecha_rea]
GO
/****** Object:  Default [DF__PCPRemple__Vac_i__7C055DC1]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT ((0)) FOR [Vac_ini]
GO
/****** Object:  Default [DF__PCPRemple__Vac_b__7CF981FA]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT ((0)) FOR [Vac_base]
GO
/****** Object:  Default [DF__PCPRemple__Asigf__7DEDA633]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT (' ') FOR [Asigfam]
GO
/****** Object:  Default [DF__PCPRemple__Fecha__7EE1CA6C]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT (getdate()) FOR [Fecha_lic]
GO
/****** Object:  Default [DF__PCPRemple__Anexo__7FD5EEA5]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT ((0)) FOR [Anexo]
GO
/****** Object:  Default [DF__PCPRemples__Apc__00CA12DE]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT (' ') FOR [Apc]
GO
/****** Object:  Default [DF__PCPRemple__SiAus__01BE3717]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT (' ') FOR [SiAus]
GO
/****** Object:  Default [DF__PCPRemple__Monto__02B25B50]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT ((0)) FOR [Monto_red]
GO
/****** Object:  Default [DF__PCPRemple__Monto__03A67F89]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT ((0)) FOR [Monto_sgr]
GO
/****** Object:  Default [DF__PCPRemples__Ktim__049AA3C2]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT ((0)) FOR [Ktim]
GO
/****** Object:  Default [DF__PCPRemple__Antic__058EC7FB]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT ((0)) FOR [Antica]
GO
/****** Object:  Default [DF__PCPRemple__Diast__0682EC34]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT ((0)) FOR [Diastr]
GO
/****** Object:  Default [DF__PCPRemple__Diasl__0777106D]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT ((0)) FOR [Diasli]
GO
/****** Object:  Default [DF__PCPRemple__Sen_n__086B34A6]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT ((0)) FOR [Sen_niv]
GO
/****** Object:  Default [DF__PCPRemple__Sen_f__095F58DF]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT ((0)) FOR [Sen_fra]
GO
/****** Object:  Default [DF__PCPRemple__Bloqu__0A537D18]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT (' ') FOR [Bloques]
GO
/****** Object:  Default [DF__PCPRemple__TopeL__0B47A151]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT ((0)) FOR [TopeLey]
GO
/****** Object:  Default [DF__PCPRemple__Grado__0C3BC58A]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT ((0)) FOR [GradoC]
GO
/****** Object:  Default [DF__PCPRemple__Fecha__0D2FE9C3]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT (getdate()) FOR [Fecha_gra]
GO
/****** Object:  Default [DF__PCPRemple__NumTa__0E240DFC]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT ((0)) FOR [NumTar]
GO
/****** Object:  Default [DF__PCPRemple__L1856__0F183235]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT (' ') FOR [L18566]
GO
/****** Object:  Default [DF__PCPRemple__Lpaco__100C566E]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT (' ') FOR [Lpacot]
GO
/****** Object:  Default [DF__PCPRemple__Cuent__11007AA7]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT ((0)) FOR [Cuenta]
GO
/****** Object:  Default [DF__PCPRemple__RegPa__11F49EE0]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT (' ') FOR [RegPag]
GO
/****** Object:  Default [DF__PCPRemple__Trape__12E8C319]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT ((0)) FOR [Trapes]
GO
/****** Object:  Default [DF__PCPRemple__Horas__13DCE752]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT ((0)) FOR [Horas]
GO
/****** Object:  Default [DF__PCPRemple__Licme__14D10B8B]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT (' ') FOR [Licmed]
GO
/****** Object:  Default [DF__PCPRemple__Tresp__15C52FC4]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT (' ') FOR [Trespd]
GO
/****** Object:  Default [DF__PCPRemple__Subsi__16B953FD]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT (' ') FOR [Subsil]
GO
/****** Object:  Default [DF__PCPRemple__rebli__17AD7836]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT (' ') FOR [reblim]
GO
/****** Object:  Default [DF__PCPRemple__Manli__18A19C6F]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT (' ') FOR [Manliq]
GO
/****** Object:  Default [DF__PCPRemple__Fecha__1995C0A8]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT (getdate()) FOR [Fecha_mod]
GO
/****** Object:  Default [DF__PCPRemples__Ames__1A89E4E1]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT (' ') FOR [Ames]
GO
/****** Object:  Default [DF__PCPRemple__Sdato__1B7E091A]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT (' ') FOR [Sdato]
GO
/****** Object:  Default [DF__PCPRemple__Crede__1C722D53]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT (' ') FOR [Credenc]
GO
/****** Object:  Default [DF__PCPRemple__Ticke__1D66518C]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT (' ') FOR [Ticket]
GO
/****** Object:  Default [DF__PCPRemple__Fecha__1E5A75C5]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT (getdate()) FOR [Fecha_sec]
GO
/****** Object:  Default [DF__PCPRemple__Tipco__1F4E99FE]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT (' ') FOR [Tipcon]
GO
/****** Object:  Default [DF__PCPRemple__Chere__2042BE37]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT (' ') FOR [Cheres]
GO
/****** Object:  Default [DF__PCPRemple__Chenu__2136E270]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT ((0)) FOR [Chenum]
GO
/****** Object:  Default [DF__PCPRemple__Cheva__222B06A9]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT ((0)) FOR [Cheval]
GO
/****** Object:  Default [DF__PCPRemples__Peri__231F2AE2]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT (' ') FOR [Peri]
GO
/****** Object:  Default [DF__PCPRemple__Sicon__24134F1B]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT (' ') FOR [Sicontra]
GO
/****** Object:  Default [DF__PCPRemple__fecha__25077354]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT (getdate()) FOR [fecha_rct]
GO
/****** Object:  Default [DF__PCPRemple__Evalu__25FB978D]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT (' ') FOR [Evaluador]
GO
/****** Object:  Default [DF__PCPRemple__Esrec__26EFBBC6]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT (' ') FOR [Esrecon]
GO
/****** Object:  Default [DF__PCPRemple__IndMo__27E3DFFF]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT ((0)) FOR [IndMonto]
GO
/****** Object:  Default [DF__PCPRemple__IndDi__28D80438]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT ((0)) FOR [IndDias]
GO
/****** Object:  Default [DF__PCPRemple__Fecha__29CC2871]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT (getdate()) FOR [FechaApvc]
GO
/****** Object:  Default [DF__PCPRemple__EstAp__2AC04CAA]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT (' ') FOR [EstApvc]
GO
/****** Object:  Default [DF__PCPRemple__UserA__2BB470E3]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT (' ') FOR [UserAD]
GO
/****** Object:  Default [DF__PCPRemple__Fecha__2CA8951C]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT (getdate()) FOR [FechaSjov]
GO
/****** Object:  Default [DF__PCPRemple__Jorna__2D9CB955]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT (' ') FOR [Jornada]
GO
/****** Object:  Default [DF__PCPRemple__Sdato__2E90DD8E]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT (' ') FOR [Sdato2]
GO
/****** Object:  Default [DF__PCPRemple__JorCo__2F8501C7]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT (' ') FOR [JorCont]
GO
/****** Object:  Default [DF__PCPRemple__Pjort__30792600]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT (' ') FOR [Pjortm]
GO
/****** Object:  Default [DF__PCPRemple__Psujh__316D4A39]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT (' ') FOR [Psujhn]
GO
/****** Object:  Default [DF__PCPRemple__PingS__32616E72]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT (' ') FOR [PingSt]
GO
/****** Object:  Default [DF__PCPRemple__Pafis__335592AB]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT (' ') FOR [Pafisp]
GO
/****** Object:  Default [DF__PCPRemple__Pdisc__3449B6E4]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT (' ') FOR [Pdisca]
GO
/****** Object:  Default [DF__PCPRemple__P5tae__353DDB1D]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT (' ') FOR [P5taex]
GO
/****** Object:  Default [DF__PCPRemple__Pmadr__3631FF56]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT (' ') FOR [Pmadres]
GO
/****** Object:  Default [DF__PCPRemple__Pindo__3726238F]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT (' ') FOR [Pindom]
GO
/****** Object:  Default [DF__PCPRemple__cta_i__381A47C8]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT (' ') FOR [cta_inter]
GO
/****** Object:  Default [DF__PCPRemple__cta_i__390E6C01]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT (' ') FOR [cta_inte2]
GO
/****** Object:  Default [DF__PCPRemple__dir_t__3A02903A]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT ((0)) FOR [dir_trab]
GO
/****** Object:  Default [DF__PCPRemple__fp2be__3AF6B473]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT ((0)) FOR [fp2benef]
GO
/****** Object:  Default [DF__PCPRemples__IDOT__3BEAD8AC]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT ((0)) FOR [IDOT]
GO
/****** Object:  Default [DF__PCPRemple__PCPes__3CDEFCE5]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT ((0)) FOR [PCPestado]
GO
/****** Object:  Default [DF__PCPRemple__PCPer__3DD3211E]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT (' ') FOR [PCPerror]
GO
/****** Object:  Default [DF__PCPRemple__Linea__3EC74557]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT ((0)) FOR [Linea_wfl]
GO
/****** Object:  Default [DF__PCPRemple__Etapa__3FBB6990]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT ((0)) FOR [Etapa_wfl]
GO
/****** Object:  Default [DF__PCPRemple__Etasi__40AF8DC9]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT ((0)) FOR [Etasig_wfl]
GO
/****** Object:  Default [DF__PCPRemple__Orden__41A3B202]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT ((0)) FOR [Orden_wfl]
GO
/****** Object:  Default [DF__PCPRemple__Estad__4297D63B]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT ((0)) FOR [Estado_wfl]
GO
/****** Object:  Default [DF__PCPRemple__User___438BFA74]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT (' ') FOR [User_wfl]
GO
/****** Object:  Default [DF__PCPRemple__Fecha__44801EAD]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT (getdate()) FOR [Fecha_wfl]
GO
/****** Object:  Default [DF__PCPRemple__Obser__457442E6]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT (' ') FOR [Obser_wfl]
GO
/****** Object:  Default [DF__PCPRemple__Srsic__4668671F]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT ((0)) FOR [Srsicoss]
GO
/****** Object:  Default [DF__PCPRemple__Ccsic__475C8B58]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT ((0)) FOR [Ccsicoss]
GO
/****** Object:  Default [DF__PCPRemple__premi__4850AF91]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT (' ') FOR [premint]
GO
/****** Object:  Default [DF__PCPRemple__AutFi__417A6027]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRemples] ADD  DEFAULT (' ') FOR [AutFirmar]
GO
/****** Object:  Default [DF__PCPRgrupfa__Jdd__4944D3CA]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRgrupfa] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__PCPRgrupf__Codig__4A38F803]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRgrupfa] ADD  DEFAULT (' ') FOR [Codigo]
GO
/****** Object:  Default [DF__PCPRgrupf__Nombr__4B2D1C3C]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRgrupfa] ADD  DEFAULT (' ') FOR [Nombre]
GO
/****** Object:  Default [DF__PCPRgrupf__Rut_C__4C214075]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRgrupfa] ADD  DEFAULT (' ') FOR [Rut_Carga]
GO
/****** Object:  Default [DF__PCPRgrupf__Ident__4D1564AE]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRgrupfa] ADD  DEFAULT ((0)) FOR [Identidad]
GO
/****** Object:  Default [DF__PCPRgrupf__Nom_C__4E0988E7]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRgrupfa] ADD  DEFAULT (' ') FOR [Nom_Carga]
GO
/****** Object:  Default [DF__PCPRgrupf__Ape_C__4EFDAD20]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRgrupfa] ADD  DEFAULT (' ') FOR [Ape_Carga]
GO
/****** Object:  Default [DF__PCPRgrupf__Mat_C__4FF1D159]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRgrupfa] ADD  DEFAULT (' ') FOR [Mat_Carga]
GO
/****** Object:  Default [DF__PCPRgrupfa__Apc__50E5F592]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRgrupfa] ADD  DEFAULT (' ') FOR [Apc]
GO
/****** Object:  Default [DF__PCPRgrupf__Parie__51DA19CB]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRgrupfa] ADD  DEFAULT ((0)) FOR [Pariente]
GO
/****** Object:  Default [DF__PCPRgrupf__Desc___52CE3E04]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRgrupfa] ADD  DEFAULT (' ') FOR [Desc_par]
GO
/****** Object:  Default [DF__PCPRgrupfa__Sexo__53C2623D]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRgrupfa] ADD  DEFAULT (' ') FOR [Sexo]
GO
/****** Object:  Default [DF__PCPRgrupf__Fecha__54B68676]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRgrupfa] ADD  DEFAULT (getdate()) FOR [Fecha_nac]
GO
/****** Object:  Default [DF__PCPRgrupf__Tipo___55AAAAAF]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRgrupfa] ADD  DEFAULT ((0)) FOR [Tipo_doc]
GO
/****** Object:  Default [DF__PCPRgrupf__Numdo__569ECEE8]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRgrupfa] ADD  DEFAULT (' ') FOR [Numdoc]
GO
/****** Object:  Default [DF__PCPRgrupf__Gensa__5792F321]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRgrupfa] ADD  DEFAULT (' ') FOR [Gensal]
GO
/****** Object:  Default [DF__PCPRgrupf__Rebim__5887175A]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRgrupfa] ADD  DEFAULT ((0)) FOR [Rebimp]
GO
/****** Object:  Default [DF__PCPRgrupf__Estud__597B3B93]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRgrupfa] ADD  DEFAULT ((0)) FOR [Estudios]
GO
/****** Object:  Default [DF__PCPRgrupf__Desc___5A6F5FCC]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRgrupfa] ADD  DEFAULT (' ') FOR [Desc_est]
GO
/****** Object:  Default [DF__PCPRgrupf__Fecha__5B638405]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRgrupfa] ADD  DEFAULT (getdate()) FOR [Fecha_alt]
GO
/****** Object:  Default [DF__PCPRgrupf__Fecha__5C57A83E]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRgrupfa] ADD  DEFAULT (getdate()) FOR [Fecha_baj]
GO
/****** Object:  Default [DF__PCPRgrupf__Inval__5D4BCC77]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRgrupfa] ADD  DEFAULT ((0)) FOR [Invalid]
GO
/****** Object:  Default [DF__PCPRgrupf__Preex__5E3FF0B0]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRgrupfa] ADD  DEFAULT (' ') FOR [Preexis]
GO
/****** Object:  Default [DF__PCPRgrupf__Relac__5F3414E9]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRgrupfa] ADD  DEFAULT ((0)) FOR [Relacion]
GO
/****** Object:  Default [DF__PCPRgrupf__Curso__60283922]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRgrupfa] ADD  DEFAULT ((0)) FOR [Curso]
GO
/****** Object:  Default [DF__PCPRgrupf__RetJu__611C5D5B]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRgrupfa] ADD  DEFAULT (' ') FOR [RetJud]
GO
/****** Object:  Default [DF__PCPRgrupf__Carsa__62108194]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRgrupfa] ADD  DEFAULT (' ') FOR [Carsal]
GO
/****** Object:  Default [DF__PCPRgrupf__Matri__6304A5CD]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRgrupfa] ADD  DEFAULT (getdate()) FOR [Matri_fec]
GO
/****** Object:  Default [DF__PCPRgrupf__Matri__63F8CA06]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRgrupfa] ADD  DEFAULT ((0)) FOR [Matri_cer]
GO
/****** Object:  Default [DF__PCPRgrupf__Naci___64ECEE3F]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRgrupfa] ADD  DEFAULT (getdate()) FOR [Naci_fec]
GO
/****** Object:  Default [DF__PCPRgrupf__Naci___65E11278]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRgrupfa] ADD  DEFAULT ((0)) FOR [Naci_cer]
GO
/****** Object:  Default [DF__PCPRgrupf__Prena__66D536B1]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRgrupfa] ADD  DEFAULT (getdate()) FOR [Prena_fec]
GO
/****** Object:  Default [DF__PCPRgrupf__Prena__67C95AEA]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRgrupfa] ADD  DEFAULT ((0)) FOR [Prena_cer]
GO
/****** Object:  Default [DF__PCPRgrupf__Estu___68BD7F23]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRgrupfa] ADD  DEFAULT (getdate()) FOR [Estu_fec]
GO
/****** Object:  Default [DF__PCPRgrupf__Estu___69B1A35C]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRgrupfa] ADD  DEFAULT ((0)) FOR [Estu_cer]
GO
/****** Object:  Default [DF__PCPRgrupf__Fecha__6AA5C795]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRgrupfa] ADD  DEFAULT (getdate()) FOR [Fecha_aig]
GO
/****** Object:  Default [DF__PCPRgrupf__Fecha__6B99EBCE]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRgrupfa] ADD  DEFAULT (getdate()) FOR [Fecha_big]
GO
/****** Object:  Default [DF__PCPRgrupf__AfpVo__6C8E1007]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRgrupfa] ADD  DEFAULT (' ') FOR [AfpVol]
GO
/****** Object:  Default [DF__PCPRgrupf__AfpCo__6D823440]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRgrupfa] ADD  DEFAULT ((0)) FOR [AfpCod]
GO
/****** Object:  Default [DF__PCPRgrupf__AfpNp__6E765879]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRgrupfa] ADD  DEFAULT ((0)) FOR [AfpNper]
GO
/****** Object:  Default [DF__PCPRgrupf__AfpMo__6F6A7CB2]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRgrupfa] ADD  DEFAULT ((0)) FOR [AfpMonto]
GO
/****** Object:  Default [DF__PCPRgrupf__AfpCo__705EA0EB]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRgrupfa] ADD  DEFAULT (' ') FOR [AfpCoform]
GO
/****** Object:  Default [DF__PCPRgrupf__AfpDe__7152C524]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRgrupfa] ADD  DEFAULT (getdate()) FOR [AfpDesde]
GO
/****** Object:  Default [DF__PCPRgrupf__AfpHa__7246E95D]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRgrupfa] ADD  DEFAULT (getdate()) FOR [AfpHasta]
GO
/****** Object:  Default [DF__PCPRgrupf__AhoVo__733B0D96]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRgrupfa] ADD  DEFAULT (' ') FOR [AhoVol]
GO
/****** Object:  Default [DF__PCPRgrupf__AhoMo__742F31CF]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRgrupfa] ADD  DEFAULT ((0)) FOR [AhoMonto]
GO
/****** Object:  Default [DF__PCPRgrupf__AhoCo__75235608]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRgrupfa] ADD  DEFAULT (' ') FOR [AhoCoform]
GO
/****** Object:  Default [DF__PCPRgrupfa__IDOT__76177A41]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRgrupfa] ADD  DEFAULT ((0)) FOR [IDOT]
GO
/****** Object:  Default [DF__PCPRgrupf__PCPEs__770B9E7A]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRgrupfa] ADD  DEFAULT ((0)) FOR [PCPEstado]
GO
/****** Object:  Default [DF__PCPRgrupf__PCPEr__77FFC2B3]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRgrupfa] ADD  DEFAULT (' ') FOR [PCPErrores]
GO
/****** Object:  Default [DF__PCPRgrupf__Linea__78F3E6EC]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRgrupfa] ADD  DEFAULT ((0)) FOR [Linea_wfl]
GO
/****** Object:  Default [DF__PCPRgrupf__Etapa__79E80B25]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRgrupfa] ADD  DEFAULT ((0)) FOR [Etapa_wfl]
GO
/****** Object:  Default [DF__PCPRgrupf__Etasi__7ADC2F5E]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRgrupfa] ADD  DEFAULT ((0)) FOR [Etasig_wfl]
GO
/****** Object:  Default [DF__PCPRgrupf__Orden__7BD05397]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRgrupfa] ADD  DEFAULT ((0)) FOR [Orden_wfl]
GO
/****** Object:  Default [DF__PCPRgrupf__Estad__7CC477D0]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRgrupfa] ADD  DEFAULT ((0)) FOR [Estado_wfl]
GO
/****** Object:  Default [DF__PCPRgrupf__User___7DB89C09]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRgrupfa] ADD  DEFAULT (' ') FOR [User_wfl]
GO
/****** Object:  Default [DF__PCPRgrupf__Fecha__7EACC042]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRgrupfa] ADD  DEFAULT (getdate()) FOR [Fecha_wfl]
GO
/****** Object:  Default [DF__PCPRgrupf__Obser__7FA0E47B]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRgrupfa] ADD  DEFAULT (' ') FOR [Obser_wfl]
GO
/****** Object:  Default [DF__PCPRmapit__Codig__009508B4]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRmapitm] ADD  DEFAULT (' ') FOR [Codigo]
GO
/****** Object:  Default [DF__PCPRmapit__Cohad__01892CED]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRmapitm] ADD  DEFAULT (' ') FOR [Cohade]
GO
/****** Object:  Default [DF__PCPRmapitm__Nro__027D5126]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRmapitm] ADD  DEFAULT ((0)) FOR [Nro]
GO
/****** Object:  Default [DF__PCPRmapitm__Tipo__0371755F]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRmapitm] ADD  DEFAULT ((0)) FOR [Tipo]
GO
/****** Object:  Default [DF__PCPRmapit__Orden__04659998]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRmapitm] ADD  DEFAULT ((0)) FOR [Orden]
GO
/****** Object:  Default [DF__PCPRmapit__Perio__0559BDD1]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRmapitm] ADD  DEFAULT (' ') FOR [Periodo]
GO
/****** Object:  Default [DF__PCPRmapit__COFOR__064DE20A]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRmapitm] ADD  DEFAULT (' ') FOR [COFORM]
GO
/****** Object:  Default [DF__PCPRmapit__CUOTO__07420643]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRmapitm] ADD  DEFAULT ((0)) FOR [CUOTOT]
GO
/****** Object:  Default [DF__PCPRmapit__CUOPA__08362A7C]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRmapitm] ADD  DEFAULT ((0)) FOR [CUOPAR]
GO
/****** Object:  Default [DF__PCPRmapit__Monto__092A4EB5]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRmapitm] ADD  DEFAULT ((0)) FOR [Monto]
GO
/****** Object:  Default [DF__PCPRmapit__Fecha__0A1E72EE]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRmapitm] ADD  DEFAULT (getdate()) FOR [Fecha_cre]
GO
/****** Object:  Default [DF__PCPRmapit__Fecha__0B129727]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRmapitm] ADD  DEFAULT (getdate()) FOR [Fecha_ini]
GO
/****** Object:  Default [DF__PCPRmapit__Fecha__0C06BB60]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRmapitm] ADD  DEFAULT (getdate()) FOR [Fecha_fin]
GO
/****** Object:  Default [DF__PCPRmapit__Cenco__0CFADF99]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRmapitm] ADD  DEFAULT ((0)) FOR [Cencos]
GO
/****** Object:  Default [DF__PCPRmapit__Cuent__0DEF03D2]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRmapitm] ADD  DEFAULT (' ') FOR [Cuenta]
GO
/****** Object:  Default [DF__PCPRmapit__Ticen__0EE3280B]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRmapitm] ADD  DEFAULT (' ') FOR [Ticen]
GO
/****** Object:  Default [DF__PCPRmapit__Fepro__0FD74C44]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRmapitm] ADD  DEFAULT (getdate()) FOR [Fepro]
GO
/****** Object:  Default [DF__PCPRmapit__Codpr__10CB707D]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRmapitm] ADD  DEFAULT ((0)) FOR [Codpres]
GO
/****** Object:  Default [DF__PCPRmapitm__Obs__11BF94B6]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRmapitm] ADD  DEFAULT (' ') FOR [Obs]
GO
/****** Object:  Default [DF__PCPRmapit__Formu__12B3B8EF]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRmapitm] ADD  DEFAULT (' ') FOR [Formula]
GO
/****** Object:  Default [DF__PCPRmapit__Proce__13A7DD28]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRmapitm] ADD  DEFAULT (' ') FOR [Procede]
GO
/****** Object:  Default [DF__PCPRmapit__Estad__149C0161]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRmapitm] ADD  DEFAULT (' ') FOR [Estado]
GO
/****** Object:  Default [DF__PCPRmapit__Coins__1590259A]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRmapitm] ADD  DEFAULT ((0)) FOR [Coinst]
GO
/****** Object:  Default [DF__PCPRmapit__PerIm__168449D3]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRmapitm] ADD  DEFAULT ((0)) FOR [PerImp]
GO
/****** Object:  Default [DF__PCPRmapitm__Pone__17786E0C]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRmapitm] ADD  DEFAULT (' ') FOR [Pone]
GO
/****** Object:  Default [DF__PCPRmapit__Acumu__186C9245]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRmapitm] ADD  DEFAULT ((0)) FOR [Acumu]
GO
/****** Object:  Default [DF__PCPRmapit__Tiacu__1960B67E]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRmapitm] ADD  DEFAULT (' ') FOR [Tiacu]
GO
/****** Object:  Default [DF__PCPRmapit__Monto__1A54DAB7]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRmapitm] ADD  DEFAULT ((0)) FOR [MontoC]
GO
/****** Object:  Default [DF__PCPRmapit__Monto__1B48FEF0]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRmapitm] ADD  DEFAULT ((0)) FOR [MontoP]
GO
/****** Object:  Default [DF__PCPRmapit__Propo__1C3D2329]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRmapitm] ADD  DEFAULT (' ') FOR [Propor]
GO
/****** Object:  Default [DF__PCPRmapit__Grupo__1D314762]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRmapitm] ADD  DEFAULT ((0)) FOR [Grupo]
GO
/****** Object:  Default [DF__PCPRmapit__Condi__1E256B9B]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRmapitm] ADD  DEFAULT (' ') FOR [Condi]
GO
/****** Object:  Default [DF__PCPRmapit__Simes__1F198FD4]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRmapitm] ADD  DEFAULT (' ') FOR [Simes]
GO
/****** Object:  Default [DF__PCPRmapit__Quepe__200DB40D]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRmapitm] ADD  DEFAULT (' ') FOR [Queperi]
GO
/****** Object:  Default [DF__PCPRmapit__Fecha__2101D846]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRmapitm] ADD  DEFAULT (getdate()) FOR [Fecha_ing]
GO
/****** Object:  Default [DF__PCPRmapit__Fecha__21F5FC7F]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRmapitm] ADD  DEFAULT (getdate()) FOR [Fecha_apr]
GO
/****** Object:  Default [DF__PCPRmapit__Codig__22EA20B8]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRmapitm] ADD  DEFAULT (' ') FOR [Codigo_in]
GO
/****** Object:  Default [DF__PCPRmapit__Codig__23DE44F1]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRmapitm] ADD  DEFAULT (' ') FOR [Codigo_ap]
GO
/****** Object:  Default [DF__PCPRmapit__Plant__24D2692A]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRmapitm] ADD  DEFAULT (' ') FOR [Plantilla]
GO
/****** Object:  Default [DF__PCPRmapitm__Ames__25C68D63]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRmapitm] ADD  DEFAULT (' ') FOR [Ames]
GO
/****** Object:  Default [DF__PCPRmapitm__Jdd__26BAB19C]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRmapitm] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__PCPRmapitm__IDOT__27AED5D5]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRmapitm] ADD  DEFAULT ((0)) FOR [IDOT]
GO
/****** Object:  Default [DF__PCPRmapit__PCPEs__28A2FA0E]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRmapitm] ADD  DEFAULT ((0)) FOR [PCPEstado]
GO
/****** Object:  Default [DF__PCPRmapit__PCPEr__29971E47]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRmapitm] ADD  DEFAULT (' ') FOR [PCPErrores]
GO
/****** Object:  Default [DF__PCPRmapit__Linea__2A8B4280]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRmapitm] ADD  DEFAULT ((0)) FOR [Linea_wfl]
GO
/****** Object:  Default [DF__PCPRmapit__Etapa__2B7F66B9]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRmapitm] ADD  DEFAULT ((0)) FOR [Etapa_wfl]
GO
/****** Object:  Default [DF__PCPRmapit__Etasi__2C738AF2]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRmapitm] ADD  DEFAULT ((0)) FOR [Etasig_wfl]
GO
/****** Object:  Default [DF__PCPRmapit__Orden__2D67AF2B]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRmapitm] ADD  DEFAULT ((0)) FOR [Orden_wfl]
GO
/****** Object:  Default [DF__PCPRmapit__Estad__2E5BD364]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRmapitm] ADD  DEFAULT ((0)) FOR [Estado_wfl]
GO
/****** Object:  Default [DF__PCPRmapit__User___2F4FF79D]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRmapitm] ADD  DEFAULT (' ') FOR [User_wfl]
GO
/****** Object:  Default [DF__PCPRmapit__Fecha__30441BD6]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRmapitm] ADD  DEFAULT (getdate()) FOR [Fecha_wfl]
GO
/****** Object:  Default [DF__PCPRmapit__Obser__3138400F]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRmapitm] ADD  DEFAULT (' ') FOR [Obser_wfl]
GO
/****** Object:  Default [DF__PCPRmapit__Iddon__322C6448]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRmapitm] ADD  DEFAULT ((0)) FOR [Iddonat]
GO
/****** Object:  Default [DF__PCPRvacac__Numdo__33208881]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRvacaci] ADD  DEFAULT ((0)) FOR [Numdoc]
GO
/****** Object:  Default [DF__PCPRvacac__Codig__3414ACBA]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRvacaci] ADD  DEFAULT (' ') FOR [Codigo]
GO
/****** Object:  Default [DF__PCPRvacac__Feini__3508D0F3]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRvacaci] ADD  DEFAULT (getdate()) FOR [Feini]
GO
/****** Object:  Default [DF__PCPRvacac__Fefin__35FCF52C]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRvacaci] ADD  DEFAULT (getdate()) FOR [Fefin]
GO
/****** Object:  Default [DF__PCPRvacaci__Dias__36F11965]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRvacaci] ADD  DEFAULT ((0)) FOR [Dias]
GO
/****** Object:  Default [DF__PCPRvacac__Statu__37E53D9E]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRvacaci] ADD  DEFAULT (' ') FOR [Status]
GO
/****** Object:  Default [DF__PCPRvacac__Numre__38D961D7]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRvacaci] ADD  DEFAULT ((0)) FOR [Numrem]
GO
/****** Object:  Default [DF__PCPRvacaci__Opd__39CD8610]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRvacaci] ADD  DEFAULT ((0)) FOR [Opd]
GO
/****** Object:  Default [DF__PCPRvacaci__Dmi__3AC1AA49]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRvacaci] ADD  DEFAULT ((0)) FOR [Dmi]
GO
/****** Object:  Default [DF__PCPRvacaci__Dmf__3BB5CE82]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRvacaci] ADD  DEFAULT ((0)) FOR [Dmf]
GO
/****** Object:  Default [DF__PCPRvacaci__Ampm__3CA9F2BB]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRvacaci] ADD  DEFAULT ((0)) FOR [Ampm]
GO
/****** Object:  Default [DF__PCPRvacac__Fecha__3D9E16F4]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRvacaci] ADD  DEFAULT (getdate()) FOR [Fecha_ret]
GO
/****** Object:  Default [DF__PCPRvacac__Motan__3E923B2D]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRvacaci] ADD  DEFAULT (' ') FOR [Motanul]
GO
/****** Object:  Default [DF__PCPRvacac__Perto__3F865F66]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRvacaci] ADD  DEFAULT (' ') FOR [Pertom]
GO
/****** Object:  Default [DF__PCPRvacaci__Jdd__407A839F]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRvacaci] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__PCPRvacaci__IDOT__416EA7D8]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRvacaci] ADD  DEFAULT ((0)) FOR [IDOT]
GO
/****** Object:  Default [DF__PCPRvacac__PCPEs__4262CC11]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRvacaci] ADD  DEFAULT ((0)) FOR [PCPEstado]
GO
/****** Object:  Default [DF__PCPRvacac__PCPEr__4356F04A]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRvacaci] ADD  DEFAULT (' ') FOR [PCPError]
GO
/****** Object:  Default [DF__PCPRvacac__Linea__444B1483]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRvacaci] ADD  DEFAULT ((0)) FOR [Linea_wfl]
GO
/****** Object:  Default [DF__PCPRvacac__Etapa__453F38BC]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRvacaci] ADD  DEFAULT ((0)) FOR [Etapa_wfl]
GO
/****** Object:  Default [DF__PCPRvacac__Etasi__46335CF5]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRvacaci] ADD  DEFAULT ((0)) FOR [Etasig_wfl]
GO
/****** Object:  Default [DF__PCPRvacac__Orden__4727812E]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRvacaci] ADD  DEFAULT ((0)) FOR [Orden_wfl]
GO
/****** Object:  Default [DF__PCPRvacac__Estad__481BA567]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRvacaci] ADD  DEFAULT ((0)) FOR [Estado_wfl]
GO
/****** Object:  Default [DF__PCPRvacac__User___490FC9A0]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRvacaci] ADD  DEFAULT (' ') FOR [User_wfl]
GO
/****** Object:  Default [DF__PCPRvacac__Fecha__4A03EDD9]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRvacaci] ADD  DEFAULT (getdate()) FOR [Fecha_wfl]
GO
/****** Object:  Default [DF__PCPRvacac__Obser__4AF81212]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPRvacaci] ADD  DEFAULT (' ') FOR [Obser_wfl]
GO
/****** Object:  Default [DF__PCPwrkflw__Tipo__4BEC364B]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPwrkflw] ADD  DEFAULT ((0)) FOR [Tipo]
GO
/****** Object:  Default [DF__PCPwrkflw__Etapa__4CE05A84]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPwrkflw] ADD  DEFAULT ((0)) FOR [Etapa]
GO
/****** Object:  Default [DF__PCPwrkflw__Etapa__4DD47EBD]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPwrkflw] ADD  DEFAULT ((0)) FOR [Etapasig]
GO
/****** Object:  Default [DF__PCPwrkflw__idIte__4EC8A2F6]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPwrkflw] ADD  DEFAULT ((0)) FOR [idItems]
GO
/****** Object:  Default [DF__PCPwrkflw__Tipo___4FBCC72F]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPwrkflw] ADD  DEFAULT ((0)) FOR [Tipo_nodo]
GO
/****** Object:  Default [DF__PCPwrkflw__Jdd__50B0EB68]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPwrkflw] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__PCPwrkusr__idWrk__51A50FA1]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPwrkusr] ADD  DEFAULT ((0)) FOR [idWrkflw]
GO
/****** Object:  Default [DF__PCPwrkusr__Usuar__529933DA]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPwrkusr] ADD  DEFAULT (' ') FOR [Usuario]
GO
/****** Object:  Default [DF__PCPwrkusr__Modif__538D5813]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPwrkusr] ADD  DEFAULT (' ') FOR [Modifica]
GO
/****** Object:  Default [DF__PCPwrkusr__Jdd__54817C4C]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[PCPwrkusr] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__Plantilla__nomPl__5575A085]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Plantillas] ADD  DEFAULT (' ') FOR [nomPlantilla]
GO
/****** Object:  Default [DF__Plantilla__plant__5669C4BE]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Plantillas] ADD  DEFAULT ((0)) FOR [plantilla]
GO
/****** Object:  Default [DF__Plantilla__extPl__575DE8F7]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Plantillas] ADD  DEFAULT (' ') FOR [extPlantilla]
GO
/****** Object:  Default [DF__Plantilla__idTip__58520D30]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Plantillas] ADD  DEFAULT ((0)) FOR [idTipoArchivo]
GO
/****** Object:  Default [DF__products__Produc__59463169]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[products] ADD  DEFAULT ((0)) FOR [ProductId]
GO
/****** Object:  Default [DF__products__Produc__5A3A55A2]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[products] ADD  DEFAULT (' ') FOR [ProductName]
GO
/****** Object:  Default [DF__Rafectos__Codigo__5B2E79DB]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rafectos] ADD  DEFAULT (' ') FOR [Codigo]
GO
/****** Object:  Default [DF__Rafectos__Ames__5C229E14]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rafectos] ADD  DEFAULT (' ') FOR [Ames]
GO
/****** Object:  Default [DF__Rafectos__Peri__5D16C24D]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rafectos] ADD  DEFAULT (' ') FOR [Peri]
GO
/****** Object:  Default [DF__Rafectos__Jdd__5E0AE686]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rafectos] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__Rafectos__AF01__5EFF0ABF]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rafectos] ADD  DEFAULT ((0)) FOR [AF01]
GO
/****** Object:  Default [DF__Rafectos__AF02__5FF32EF8]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rafectos] ADD  DEFAULT ((0)) FOR [AF02]
GO
/****** Object:  Default [DF__Rafectos__AF03__60E75331]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rafectos] ADD  DEFAULT ((0)) FOR [AF03]
GO
/****** Object:  Default [DF__Rafectos__AF04__61DB776A]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rafectos] ADD  DEFAULT ((0)) FOR [AF04]
GO
/****** Object:  Default [DF__Rafectos__AF05__62CF9BA3]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rafectos] ADD  DEFAULT ((0)) FOR [AF05]
GO
/****** Object:  Default [DF__Rafectos__AF06__63C3BFDC]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rafectos] ADD  DEFAULT ((0)) FOR [AF06]
GO
/****** Object:  Default [DF__Rafectos__AF07__64B7E415]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rafectos] ADD  DEFAULT ((0)) FOR [AF07]
GO
/****** Object:  Default [DF__Rafectos__AF08__65AC084E]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rafectos] ADD  DEFAULT ((0)) FOR [AF08]
GO
/****** Object:  Default [DF__Rafectos__AF09__66A02C87]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rafectos] ADD  DEFAULT ((0)) FOR [AF09]
GO
/****** Object:  Default [DF__Rafectos__AF10__679450C0]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rafectos] ADD  DEFAULT ((0)) FOR [AF10]
GO
/****** Object:  Default [DF__Rafectos__AF11__688874F9]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rafectos] ADD  DEFAULT ((0)) FOR [AF11]
GO
/****** Object:  Default [DF__Rafectos__AF12__697C9932]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rafectos] ADD  DEFAULT ((0)) FOR [AF12]
GO
/****** Object:  Default [DF__Rafectos__AF13__6A70BD6B]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rafectos] ADD  DEFAULT ((0)) FOR [AF13]
GO
/****** Object:  Default [DF__Rafectos__AF14__6B64E1A4]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rafectos] ADD  DEFAULT ((0)) FOR [AF14]
GO
/****** Object:  Default [DF__Rafectos__AF15__6C5905DD]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rafectos] ADD  DEFAULT ((0)) FOR [AF15]
GO
/****** Object:  Default [DF__Rafectos__AF16__6D4D2A16]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rafectos] ADD  DEFAULT ((0)) FOR [AF16]
GO
/****** Object:  Default [DF__Rafectos__AF17__6E414E4F]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rafectos] ADD  DEFAULT ((0)) FOR [AF17]
GO
/****** Object:  Default [DF__Rafectos__AF18__6F357288]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rafectos] ADD  DEFAULT ((0)) FOR [AF18]
GO
/****** Object:  Default [DF__Rafectos__AF19__702996C1]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rafectos] ADD  DEFAULT ((0)) FOR [AF19]
GO
/****** Object:  Default [DF__Rafectos__AF20__711DBAFA]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rafectos] ADD  DEFAULT ((0)) FOR [AF20]
GO
/****** Object:  Default [DF__Rafectos__AF21__7211DF33]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rafectos] ADD  DEFAULT ((0)) FOR [AF21]
GO
/****** Object:  Default [DF__Rafectos__AF22__7306036C]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rafectos] ADD  DEFAULT ((0)) FOR [AF22]
GO
/****** Object:  Default [DF__Rafectos__AF23__73FA27A5]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rafectos] ADD  DEFAULT ((0)) FOR [AF23]
GO
/****** Object:  Default [DF__Rafectos__AF24__74EE4BDE]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rafectos] ADD  DEFAULT ((0)) FOR [AF24]
GO
/****** Object:  Default [DF__Rafectos__AF25__75E27017]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rafectos] ADD  DEFAULT ((0)) FOR [AF25]
GO
/****** Object:  Default [DF__RALERTAS__Id__76D69450]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RALERTAS] ADD  DEFAULT ((0)) FOR [Id]
GO
/****** Object:  Default [DF__RALERTAS__Ubica__77CAB889]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RALERTAS] ADD  DEFAULT (' ') FOR [Ubica]
GO
/****** Object:  Default [DF__RALERTAS__Descri__78BEDCC2]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RALERTAS] ADD  DEFAULT (' ') FOR [Descrip]
GO
/****** Object:  Default [DF__RALERTAS__Proce__79B300FB]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RALERTAS] ADD  DEFAULT (' ') FOR [Proce]
GO
/****** Object:  Default [DF__RALERTAS__Estado__7AA72534]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RALERTAS] ADD  DEFAULT (' ') FOR [Estado]
GO
/****** Object:  Default [DF__RALERTAS__Params__7B9B496D]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RALERTAS] ADD  DEFAULT (' ') FOR [Params]
GO
/****** Object:  Default [DF__RALERTAS__Explic__7C8F6DA6]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RALERTAS] ADD  DEFAULT (' ') FOR [Explica]
GO
/****** Object:  Default [DF__RALERTAS__Jdd__7D8391DF]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RALERTAS] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__RALERTAS__Usuari__7E77B618]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RALERTAS] ADD  DEFAULT (' ') FOR [Usuario1]
GO
/****** Object:  Default [DF__RALERTAS__Campo__7F6BDA51]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RALERTAS] ADD  DEFAULT (' ') FOR [Campo]
GO
/****** Object:  Default [DF__RALERTAS__Dias__005FFE8A]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RALERTAS] ADD  DEFAULT ((0)) FOR [Dias]
GO
/****** Object:  Default [DF__RALERTAS__Hora__015422C3]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RALERTAS] ADD  DEFAULT ((0)) FOR [Hora]
GO
/****** Object:  Default [DF__RALERTAS__Templa__024846FC]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RALERTAS] ADD  DEFAULT (' ') FOR [Template]
GO
/****** Object:  Default [DF__RALERTAS__FechaE__033C6B35]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RALERTAS] ADD  DEFAULT (getdate()) FOR [FechaEnvio]
GO
/****** Object:  Default [DF__RALERTAS__EnviaS__04308F6E]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RALERTAS] ADD  DEFAULT (' ') FOR [EnviaSMS]
GO
/****** Object:  Default [DF__RALERTAS__EnviaM__0524B3A7]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RALERTAS] ADD  DEFAULT (' ') FOR [EnviaMail]
GO
/****** Object:  Default [DF__RALERTAS__Usuari__0618D7E0]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RALERTAS] ADD  DEFAULT (' ') FOR [Usuario2]
GO
/****** Object:  Default [DF__RALERTAS__Usuari__070CFC19]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RALERTAS] ADD  DEFAULT (' ') FOR [Usuario3]
GO
/****** Object:  Default [DF__RALERTAS5__Id__08012052]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RALERTAS5] ADD  DEFAULT ((0)) FOR [Id]
GO
/****** Object:  Default [DF__RALERTAS5__Ubica__08F5448B]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RALERTAS5] ADD  DEFAULT (' ') FOR [Ubica]
GO
/****** Object:  Default [DF__RALERTAS5__Descr__09E968C4]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RALERTAS5] ADD  DEFAULT (' ') FOR [Descrip]
GO
/****** Object:  Default [DF__RALERTAS5__Proce__0ADD8CFD]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RALERTAS5] ADD  DEFAULT (' ') FOR [Proce]
GO
/****** Object:  Default [DF__RALERTAS5__Estad__0BD1B136]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RALERTAS5] ADD  DEFAULT (' ') FOR [Estado]
GO
/****** Object:  Default [DF__RALERTAS5__Param__0CC5D56F]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RALERTAS5] ADD  DEFAULT (' ') FOR [Params]
GO
/****** Object:  Default [DF__RALERTAS5__Expli__0DB9F9A8]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RALERTAS5] ADD  DEFAULT (' ') FOR [Explica]
GO
/****** Object:  Default [DF__RALERTAS5__Jdd__0EAE1DE1]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RALERTAS5] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__RALERTAS5__Usuar__0FA2421A]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RALERTAS5] ADD  DEFAULT (' ') FOR [Usuario1]
GO
/****** Object:  Default [DF__RALERTAS5__Campo__10966653]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RALERTAS5] ADD  DEFAULT (' ') FOR [Campo]
GO
/****** Object:  Default [DF__RALERTAS5__Dias__118A8A8C]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RALERTAS5] ADD  DEFAULT ((0)) FOR [Dias]
GO
/****** Object:  Default [DF__RALERTAS5__Hora__127EAEC5]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RALERTAS5] ADD  DEFAULT ((0)) FOR [Hora]
GO
/****** Object:  Default [DF__RALERTAS5__Templ__1372D2FE]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RALERTAS5] ADD  DEFAULT (' ') FOR [Template]
GO
/****** Object:  Default [DF__RALERTAS5__Fecha__1466F737]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RALERTAS5] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [FechaEnvio]
GO
/****** Object:  Default [DF__RALERTAS5__Envia__155B1B70]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RALERTAS5] ADD  DEFAULT (' ') FOR [EnviaSMS]
GO
/****** Object:  Default [DF__RALERTAS5__Envia__164F3FA9]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RALERTAS5] ADD  DEFAULT (' ') FOR [EnviaMail]
GO
/****** Object:  Default [DF__RALERTAS5__Usuar__174363E2]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RALERTAS5] ADD  DEFAULT (' ') FOR [Usuario2]
GO
/****** Object:  Default [DF__RALERTAS5__Usuar__1837881B]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RALERTAS5] ADD  DEFAULT (' ') FOR [Usuario3]
GO
/****** Object:  Default [DF__RAlertasEnvi__Id__192BAC54]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RAlertasEnvio] ADD  DEFAULT ((0)) FOR [Id]
GO
/****** Object:  Default [DF__RAlertasE__Fecha__1A1FD08D]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RAlertasEnvio] ADD  DEFAULT (getdate()) FOR [FechaEnvio]
GO
/****** Object:  Default [DF__RAlertasE__Estad__1B13F4C6]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RAlertasEnvio] ADD  DEFAULT (' ') FOR [Estado]
GO
/****** Object:  Default [DF__RAlertasE__Usuar__1C0818FF]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RAlertasEnvio] ADD  DEFAULT (' ') FOR [Usuario1]
GO
/****** Object:  Default [DF__RAlertasE__Visto__1CFC3D38]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RAlertasEnvio] ADD  DEFAULT (' ') FOR [Visto]
GO
/****** Object:  Default [DF__RAlertasE__Usuar__1DF06171]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RAlertasEnvio] ADD  DEFAULT (' ') FOR [Usuario2]
GO
/****** Object:  Default [DF__RAlertasE__Usuar__1EE485AA]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RAlertasEnvio] ADD  DEFAULT (' ') FOR [Usuario3]
GO
/****** Object:  Default [DF__RAlertasE__Texto__1FD8A9E3]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RAlertasEnvio] ADD  DEFAULT (' ') FOR [Texto]
GO
/****** Object:  Default [DF__Rasigna__Codigo__20CCCE1C]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rasigna] ADD  DEFAULT (' ') FOR [Codigo]
GO
/****** Object:  Default [DF__Rasigna__Fecha_a__21C0F255]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rasigna] ADD  DEFAULT (getdate()) FOR [Fecha_asi]
GO
/****** Object:  Default [DF__Rasigna__Descrip__22B5168E]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rasigna] ADD  DEFAULT (' ') FOR [Descrip]
GO
/****** Object:  Default [DF__Rasigna__Bien__23A93AC7]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rasigna] ADD  DEFAULT ((0)) FOR [Bien]
GO
/****** Object:  Default [DF__Rasigna__Cantid__249D5F00]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rasigna] ADD  DEFAULT ((0)) FOR [Cantid]
GO
/****** Object:  Default [DF__Rasigna__Valor__25918339]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rasigna] ADD  DEFAULT ((0)) FOR [Valor]
GO
/****** Object:  Default [DF__Rasigna__Fecha_v__2685A772]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rasigna] ADD  DEFAULT (getdate()) FOR [Fecha_ven]
GO
/****** Object:  Default [DF__Rasigna__Respon__2779CBAB]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rasigna] ADD  DEFAULT (' ') FOR [Respon]
GO
/****** Object:  Default [DF__Rasigna__Obs__286DEFE4]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rasigna] ADD  DEFAULT (' ') FOR [Obs]
GO
/****** Object:  Default [DF__Rasigna__Devuelt__2962141D]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rasigna] ADD  DEFAULT (' ') FOR [Devuelto]
GO
/****** Object:  Default [DF__Rasigna__Jdd__2A563856]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rasigna] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__rausent__Codigo__2B4A5C8F]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[rausent] ADD  DEFAULT (' ') FOR [Codigo]
GO
/****** Object:  Default [DF__rausent__Fecha_i__2C3E80C8]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[rausent] ADD  DEFAULT (getdate()) FOR [Fecha_ini]
GO
/****** Object:  Default [DF__rausent__Dias__2D32A501]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[rausent] ADD  DEFAULT ((0)) FOR [Dias]
GO
/****** Object:  Default [DF__rausent__Fecha_f__2E26C93A]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[rausent] ADD  DEFAULT (getdate()) FOR [Fecha_fin]
GO
/****** Object:  Default [DF__rausent__Fecha_l__2F1AED73]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[rausent] ADD  DEFAULT (getdate()) FOR [Fecha_lic]
GO
/****** Object:  Default [DF__rausent__Rebsal__300F11AC]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[rausent] ADD  DEFAULT ((0)) FOR [Rebsal]
GO
/****** Object:  Default [DF__rausent__Escon__310335E5]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[rausent] ADD  DEFAULT (' ') FOR [Escon]
GO
/****** Object:  Default [DF__rausent__Tipo__31F75A1E]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[rausent] ADD  DEFAULT ((0)) FOR [Tipo]
GO
/****** Object:  Default [DF__rausent__Dtipo__32EB7E57]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[rausent] ADD  DEFAULT (' ') FOR [Dtipo]
GO
/****** Object:  Default [DF__rausent__Causal__33DFA290]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[rausent] ADD  DEFAULT ((0)) FOR [Causal]
GO
/****** Object:  Default [DF__rausent__Dcausal__34D3C6C9]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[rausent] ADD  DEFAULT (' ') FOR [Dcausal]
GO
/****** Object:  Default [DF__rausent__Detalle__35C7EB02]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[rausent] ADD  DEFAULT (' ') FOR [Detalle]
GO
/****** Object:  Default [DF__rausent__Medico__36BC0F3B]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[rausent] ADD  DEFAULT (' ') FOR [Medico]
GO
/****** Object:  Default [DF__rausent__Nulic__37B03374]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[rausent] ADD  DEFAULT ((0)) FOR [Nulic]
GO
/****** Object:  Default [DF__rausent__DiasE__38A457AD]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[rausent] ADD  DEFAULT ((0)) FOR [DiasE]
GO
/****** Object:  Default [DF__rausent__Medios__39987BE6]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[rausent] ADD  DEFAULT (' ') FOR [Medios]
GO
/****** Object:  Default [DF__rausent__Diagnos__3A8CA01F]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[rausent] ADD  DEFAULT ((0)) FOR [Diagnos]
GO
/****** Object:  Default [DF__rausent__Mailen__3B80C458]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[rausent] ADD  DEFAULT ((0)) FOR [Mailen]
GO
/****** Object:  Default [DF__rausent__Rutpro__3C74E891]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[rausent] ADD  DEFAULT (' ') FOR [Rutpro]
GO
/****** Object:  Default [DF__rausent__Especia__3D690CCA]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[rausent] ADD  DEFAULT ((0)) FOR [Especia]
GO
/****** Object:  Default [DF__rausent__MontoAn__3E5D3103]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[rausent] ADD  DEFAULT ((0)) FOR [MontoAn]
GO
/****** Object:  Default [DF__rausent__MontoRe__3F51553C]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[rausent] ADD  DEFAULT ((0)) FOR [MontoRe]
GO
/****** Object:  Default [DF__rausent__MontoCo__40457975]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[rausent] ADD  DEFAULT ((0)) FOR [MontoCo]
GO
/****** Object:  Default [DF__rausent__Fecha_r__41399DAE]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[rausent] ADD  DEFAULT (getdate()) FOR [Fecha_ret]
GO
/****** Object:  Default [DF__rausent__Estado__422DC1E7]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[rausent] ADD  DEFAULT (' ') FOR [Estado]
GO
/****** Object:  Default [DF__rausent__Fecha_e__4321E620]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[rausent] ADD  DEFAULT (getdate()) FOR [Fecha_env]
GO
/****** Object:  Default [DF__rausent__Fecha_i__44160A59]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[rausent] ADD  DEFAULT (getdate()) FOR [Fecha_ico]
GO
/****** Object:  Default [DF__rausent__CodSub__450A2E92]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[rausent] ADD  DEFAULT (' ') FOR [CodSub]
GO
/****** Object:  Default [DF__rausent__Origen__45FE52CB]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[rausent] ADD  DEFAULT (' ') FOR [Origen]
GO
/****** Object:  Default [DF__rausent__Fecha_i__46F27704]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[rausent] ADD  DEFAULT (getdate()) FOR [Fecha_ing]
GO
/****** Object:  Default [DF__rausent__Usuario__47E69B3D]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[rausent] ADD  DEFAULT (' ') FOR [Usuario]
GO
/****** Object:  Default [DF__rausent__Lscan__48DABF76]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[rausent] ADD  DEFAULT ((0)) FOR [Lscan]
GO
/****** Object:  Default [DF__rausent__Jdd__49CEE3AF]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[rausent] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__rausent__fecha_u__4AC307E8]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[rausent] ADD  DEFAULT (getdate()) FOR [fecha_ult]
GO
/****** Object:  Default [DF__rausent__SubsilB__4BB72C21]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[rausent] ADD  DEFAULT ((0)) FOR [SubsilB]
GO
/****** Object:  Default [DF__rausent__Dias3pd__4CAB505A]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[rausent] ADD  DEFAULT ((0)) FOR [Dias3pd]
GO
/****** Object:  Default [DF__rausent__SubsilN__4D9F7493]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[rausent] ADD  DEFAULT ((0)) FOR [SubsilN]
GO
/****** Object:  Default [DF__rausent__Dv__4E9398CC]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[rausent] ADD  DEFAULT (' ') FOR [Dv]
GO
/****** Object:  Default [DF__Rbases__Jdd__4F87BD05]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rbases] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__Rbases__Cliente__507BE13E]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rbases] ADD  DEFAULT (' ') FOR [Cliente]
GO
/****** Object:  Default [DF__Rbases__idJdd__51700577]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rbases] ADD  DEFAULT (' ') FOR [idJdd]
GO
/****** Object:  Default [DF__Rbases__Descrip__526429B0]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rbases] ADD  DEFAULT (' ') FOR [Descrip]
GO
/****** Object:  Default [DF__Rbases__stringco__53584DE9]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rbases] ADD  DEFAULT (' ') FOR [stringco]
GO
/****** Object:  Default [DF__Rbases__Pay__544C7222]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rbases] ADD  DEFAULT (' ') FOR [Pay]
GO
/****** Object:  Default [DF__Rbases__Eva__5540965B]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rbases] ADD  DEFAULT (' ') FOR [Eva]
GO
/****** Object:  Default [DF__Rbases__Sel__5634BA94]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rbases] ADD  DEFAULT (' ') FOR [Sel]
GO
/****** Object:  Default [DF__Rbases__Dcg__5728DECD]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rbases] ADD  DEFAULT (' ') FOR [Dcg]
GO
/****** Object:  Default [DF__Rbases__Cap__581D0306]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rbases] ADD  DEFAULT (' ') FOR [Cap]
GO
/****** Object:  Default [DF__Rbases__Cas__5911273F]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rbases] ADD  DEFAULT (' ') FOR [Cas]
GO
/****** Object:  Default [DF__Rbases__Bie__5A054B78]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rbases] ADD  DEFAULT (' ') FOR [Bie]
GO
/****** Object:  Default [DF__Rbases__Ben__5AF96FB1]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rbases] ADD  DEFAULT (' ') FOR [Ben]
GO
/****** Object:  Default [DF__Rbases__Mad__5BED93EA]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rbases] ADD  DEFAULT (' ') FOR [Mad]
GO
/****** Object:  Default [DF__Rbases__IDClient__5CE1B823]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rbases] ADD  DEFAULT ((0)) FOR [IDCliente]
GO
/****** Object:  Default [DF__Rbases__grupo_ou__5DD5DC5C]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rbases] ADD  DEFAULT ((0)) FOR [grupo_out]
GO
/****** Object:  Default [DF__Rbases__cola__5ECA0095]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rbases] ADD  DEFAULT (' ') FOR [cola]
GO
/****** Object:  Default [DF__Rbases__Quincena__5FBE24CE]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rbases] ADD  DEFAULT (' ') FOR [Quincena]
GO
/****** Object:  Default [DF__Rbases__Alarma__60B24907]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rbases] ADD  DEFAULT (' ') FOR [Alarma]
GO
/****** Object:  Default [DF__Rbases__Streamli__61A66D40]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rbases] ADD  DEFAULT (' ') FOR [Streamline]
GO
/****** Object:  Default [DF__Rbases__IdAdp__629A9179]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rbases] ADD  DEFAULT (' ') FOR [IdAdp]
GO
/****** Object:  Default [DF__Rbases__Estado__638EB5B2]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rbases] ADD  DEFAULT (' ') FOR [Estado]
GO
/****** Object:  Default [DF__Rbases__BaseE__6482D9EB]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rbases] ADD  DEFAULT (' ') FOR [BaseE]
GO
/****** Object:  Default [DF__Rbases__ServerE__6576FE24]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rbases] ADD  DEFAULT (' ') FOR [ServerE]
GO
/****** Object:  Default [DF__Rbases__ODBC__666B225D]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rbases] ADD  DEFAULT (' ') FOR [ODBC]
GO
/****** Object:  Default [DF__Rbases__BatchMod__675F4696]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rbases] ADD  DEFAULT (' ') FOR [BatchMode]
GO
/****** Object:  Default [DF__Rbases__BatchPat__68536ACF]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rbases] ADD  DEFAULT (' ') FOR [BatchPath]
GO
/****** Object:  Default [DF__rbatch__Estado__69478F08]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[rbatch] ADD  DEFAULT (' ') FOR [Estado]
GO
/****** Object:  Default [DF__rbatch__JuegoDat__6A3BB341]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[rbatch] ADD  DEFAULT (' ') FOR [JuegoDatos]
GO
/****** Object:  Default [DF__rbatch__Usuario__6B2FD77A]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[rbatch] ADD  DEFAULT (' ') FOR [Usuario]
GO
/****** Object:  Default [DF__rbatch__Path__6C23FBB3]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[rbatch] ADD  DEFAULT (' ') FOR [Path]
GO
/****** Object:  Default [DF__rbatch__Llamador__6D181FEC]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[rbatch] ADD  DEFAULT (' ') FOR [Llamador]
GO
/****** Object:  Default [DF__rbatch__Llamado__6E0C4425]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[rbatch] ADD  DEFAULT (' ') FOR [Llamado]
GO
/****** Object:  Default [DF__rbatch__Fecha__6F00685E]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[rbatch] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [Fecha]
GO
/****** Object:  Default [DF__rbatch__Params__6FF48C97]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[rbatch] ADD  DEFAULT (' ') FOR [Params]
GO
/****** Object:  Default [DF__rbatch__Jdd__70E8B0D0]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[rbatch] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__rbatch__ProcessI__54C23EC5]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[rbatch] ADD  DEFAULT ((0)) FOR [ProcessId]
GO
/****** Object:  Default [DF__rbatch__IdLaunch__55B662FE]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[rbatch] ADD  DEFAULT (' ') FOR [IdLauncher]
GO
/****** Object:  Default [DF__rbatchdes__Nombr__71DCD509]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[rbatchdesc] ADD  DEFAULT (' ') FOR [Nombre]
GO
/****** Object:  Default [DF__rbatchdes__Exten__72D0F942]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[rbatchdesc] ADD  DEFAULT (' ') FOR [Extension]
GO
/****** Object:  Default [DF__rbatchdes__Descr__73C51D7B]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[rbatchdesc] ADD  DEFAULT (' ') FOR [Descrip]
GO
/****** Object:  Default [DF__rbatchdesc__Jdd__74B941B4]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[rbatchdesc] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__rbatchfin__Idbat__1A959D30]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[rbatchfiniq] ADD  DEFAULT ((0)) FOR [Idbatch]
GO
/****** Object:  Default [DF__rbatchfin__Param__1B89C169]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[rbatchfiniq] ADD  DEFAULT (' ') FOR [Params]
GO
/****** Object:  Default [DF__rbatchfin__Codig__1C7DE5A2]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[rbatchfiniq] ADD  DEFAULT (' ') FOR [Codigo]
GO
/****** Object:  Default [DF__rbatchfin__Param__771756C9]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[rbatchfiniq] ADD  DEFAULT (' ') FOR [ParamsRes]
GO
/****** Object:  Default [DF__rbatchfiniq__Jdd__780B7B02]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[rbatchfiniq] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__rbatchliq__Idbat__75AD65ED]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[rbatchliq] ADD  DEFAULT ((0)) FOR [Idbatch]
GO
/****** Object:  Default [DF__rbatchliq__Codig__76A18A26]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[rbatchliq] ADD  DEFAULT (' ') FOR [Codigo]
GO
/****** Object:  Default [DF__rbatchliq__Tipo__7795AE5F]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[rbatchliq] ADD  DEFAULT ((0)) FOR [Tipo]
GO
/****** Object:  Default [DF__rbatchliq__Orden__7889D298]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[rbatchliq] ADD  DEFAULT ((0)) FOR [Orden]
GO
/****** Object:  Default [DF__rbatchliq__Cohad__797DF6D1]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[rbatchliq] ADD  DEFAULT (' ') FOR [Cohade]
GO
/****** Object:  Default [DF__rbatchliq__Desci__7A721B0A]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[rbatchliq] ADD  DEFAULT (' ') FOR [Descitm]
GO
/****** Object:  Default [DF__rbatchliq__Monto__7B663F43]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[rbatchliq] ADD  DEFAULT ((0)) FOR [Monto]
GO
/****** Object:  Default [DF__rbatchliq__Monto__7C5A637C]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[rbatchliq] ADD  DEFAULT ((0)) FOR [MontoO]
GO
/****** Object:  Default [DF__rbatchliq__Monto__7D4E87B5]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[rbatchliq] ADD  DEFAULT ((0)) FOR [MontoA]
GO
/****** Object:  Default [DF__rbatchliq__Cenco__7E42ABEE]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[rbatchliq] ADD  DEFAULT ((0)) FOR [Cencos]
GO
/****** Object:  Default [DF__rbatchliq__Copre__7F36D027]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[rbatchliq] ADD  DEFAULT ((0)) FOR [Coprev]
GO
/****** Object:  Default [DF__rbatchliq__Orige__002AF460]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[rbatchliq] ADD  DEFAULT (' ') FOR [Origen]
GO
/****** Object:  Default [DF__rbatchliq__Cmapa__011F1899]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[rbatchliq] ADD  DEFAULT (' ') FOR [Cmapa]
GO
/****** Object:  Default [DF__rbatchliq__Cod_r__02133CD2]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[rbatchliq] ADD  DEFAULT ((0)) FOR [Cod_reg]
GO
/****** Object:  Default [DF__rbatchliq__Empre__0307610B]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[rbatchliq] ADD  DEFAULT (' ') FOR [Empresa]
GO
/****** Object:  Default [DF__rbatchliq__Dato__03FB8544]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[rbatchliq] ADD  DEFAULT (' ') FOR [Dato]
GO
/****** Object:  Default [DF__rbatchliq__Codpr__04EFA97D]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[rbatchliq] ADD  DEFAULT ((0)) FOR [Codpres]
GO
/****** Object:  Default [DF__rbatchliq__PerIm__05E3CDB6]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[rbatchliq] ADD  DEFAULT ((0)) FOR [PerImp]
GO
/****** Object:  Default [DF__rbatchliq__Infor__06D7F1EF]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[rbatchliq] ADD  DEFAULT (' ') FOR [Inform]
GO
/****** Object:  Default [DF__rbatchliq__Nro__07CC1628]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[rbatchliq] ADD  DEFAULT ((0)) FOR [Nro]
GO
/****** Object:  Default [DF__rbatchliq__Vo__08C03A61]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[rbatchliq] ADD  DEFAULT ((0)) FOR [Vo]
GO
/****** Object:  Default [DF__rbatchliq__Nombr__09B45E9A]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[rbatchliq] ADD  DEFAULT (' ') FOR [Nombre]
GO
/****** Object:  Default [DF__rbatchliq__Feliq__0AA882D3]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[rbatchliq] ADD  DEFAULT (' ') FOR [Feliq]
GO
/****** Object:  Default [DF__rbatchliq__Rut__0B9CA70C]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[rbatchliq] ADD  DEFAULT (' ') FOR [Rut]
GO
/****** Object:  Default [DF__rbatchliq__Cargo__0C90CB45]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[rbatchliq] ADD  DEFAULT (' ') FOR [Cargo]
GO
/****** Object:  Default [DF__rbatchliq__Fecha__0D84EF7E]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[rbatchliq] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [Fecha_ing]
GO
/****** Object:  Default [DF__rbatchliq__erut__0E7913B7]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[rbatchliq] ADD  DEFAULT (' ') FOR [erut]
GO
/****** Object:  Default [DF__rbatchliq__Cofor__0F6D37F0]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[rbatchliq] ADD  DEFAULT (' ') FOR [Coform]
GO
/****** Object:  Default [DF__rbatchliq__hab__10615C29]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[rbatchliq] ADD  DEFAULT ((0)) FOR [hab]
GO
/****** Object:  Default [DF__rbatchliq__des__11558062]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[rbatchliq] ADD  DEFAULT ((0)) FOR [des]
GO
/****** Object:  Default [DF__rbatchliq__otr__1249A49B]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[rbatchliq] ADD  DEFAULT ((0)) FOR [otr]
GO
/****** Object:  Default [DF__rbatchliq__Dias__133DC8D4]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[rbatchliq] ADD  DEFAULT ((0)) FOR [Dias]
GO
/****** Object:  Default [DF__rbatchliq__d15__1431ED0D]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[rbatchliq] ADD  DEFAULT (' ') FOR [d15]
GO
/****** Object:  Default [DF__rbatchliq__vl__15261146]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[rbatchliq] ADD  DEFAULT (' ') FOR [vl]
GO
/****** Object:  Default [DF__rbatchliq__Tkdlo__161A357F]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[rbatchliq] ADD  DEFAULT ((0)) FOR [Tkdlo]
GO
/****** Object:  Default [DF__rbatchliq__Pone__170E59B8]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[rbatchliq] ADD  DEFAULT (' ') FOR [Pone]
GO
/****** Object:  Default [DF__rbatchliq__Jdd__18027DF1]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[rbatchliq] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__rbatchliq__dias3__18F6A22A]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[rbatchliq] ADD  DEFAULT ((0)) FOR [dias3pd]
GO
/****** Object:  Default [DF__rbatchliq__licmd__19EAC663]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[rbatchliq] ADD  DEFAULT ((0)) FOR [licmd1]
GO
/****** Object:  Default [DF__rbatchliq__licmd__1ADEEA9C]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[rbatchliq] ADD  DEFAULT ((0)) FOR [licmd2]
GO
/****** Object:  Default [DF__rbatchliq__licmd__1BD30ED5]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[rbatchliq] ADD  DEFAULT ((0)) FOR [licmd3]
GO
/****** Object:  Default [DF__rbatchliq__licmd__1CC7330E]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[rbatchliq] ADD  DEFAULT ((0)) FOR [licmd4]
GO
/****** Object:  Default [DF__rbatchliq__licmd__1DBB5747]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[rbatchliq] ADD  DEFAULT ((0)) FOR [licmd5]
GO
/****** Object:  Default [DF__rbatchliq__licmd__1EAF7B80]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[rbatchliq] ADD  DEFAULT ((0)) FOR [licmd6]
GO
/****** Object:  Default [DF__rbatchqf__Idbatc__1FA39FB9]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[rbatchqf] ADD  DEFAULT ((0)) FOR [Idbatch]
GO
/****** Object:  Default [DF__rbatchqf__Codigo__2097C3F2]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[rbatchqf] ADD  DEFAULT (' ') FOR [Codigo]
GO
/****** Object:  Default [DF__rbatchqf__Jdd__218BE82B]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[rbatchqf] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__rbatchst__Idbatc__22800C64]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[rbatchst] ADD  DEFAULT ((0)) FOR [Idbatch]
GO
/****** Object:  Default [DF__rbatchst__Fecha__2374309D]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[rbatchst] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [Fecha]
GO
/****** Object:  Default [DF__rbatchst__Estado__246854D6]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[rbatchst] ADD  DEFAULT (' ') FOR [Estado]
GO
/****** Object:  Default [DF__rbatchst__Jdd__255C790F]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[rbatchst] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__rbatchvis__Idbat__26509D48]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[rbatchvisto] ADD  DEFAULT ((0)) FOR [Idbatch]
GO
/****** Object:  Default [DF__rbatchvis__Exten__2744C181]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[rbatchvisto] ADD  DEFAULT (' ') FOR [Extension]
GO
/****** Object:  Default [DF__rbatchvis__Desca__2838E5BA]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[rbatchvisto] ADD  DEFAULT ((0)) FOR [Descarga]
GO
/****** Object:  Default [DF__rbatchvisto__Jdd__292D09F3]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[rbatchvisto] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__Rbecas__RUT__2A212E2C]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rbecas] ADD  DEFAULT (' ') FOR [RUT]
GO
/****** Object:  Default [DF__Rbecas__tipobeca__2B155265]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rbecas] ADD  DEFAULT (' ') FOR [tipobeca]
GO
/****** Object:  Default [DF__Rbecas__fecha__2C09769E]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rbecas] ADD  DEFAULT (getdate()) FOR [fecha]
GO
/****** Object:  Default [DF__Rbecas__fecha_fi__2CFD9AD7]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rbecas] ADD  DEFAULT (getdate()) FOR [fecha_fin]
GO
/****** Object:  Default [DF__Rbecas__instit__2DF1BF10]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rbecas] ADD  DEFAULT (' ') FOR [instit]
GO
/****** Object:  Default [DF__Rbecas__observ__2EE5E349]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rbecas] ADD  DEFAULT (' ') FOR [observ]
GO
/****** Object:  Default [DF__Rbecas__monto__2FDA0782]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rbecas] ADD  DEFAULT ((0)) FOR [monto]
GO
/****** Object:  Default [DF__Rbecas__Fecha_mo__30CE2BBB]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rbecas] ADD  DEFAULT (getdate()) FOR [Fecha_mod]
GO
/****** Object:  Default [DF__Rbecas__vobo__31C24FF4]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rbecas] ADD  DEFAULT ((0)) FOR [vobo]
GO
/****** Object:  Default [DF__Rbecas__usrvobo__32B6742D]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rbecas] ADD  DEFAULT (' ') FOR [usrvobo]
GO
/****** Object:  Default [DF__Rbecas__jdd__33AA9866]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rbecas] ADD  DEFAULT ((0)) FOR [jdd]
GO
/****** Object:  Default [DF__Rbloq__codigo__349EBC9F]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rbloq] ADD  DEFAULT (' ') FOR [codigo]
GO
/****** Object:  Default [DF__Rbloq__id__3592E0D8]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rbloq] ADD  DEFAULT (' ') FOR [id]
GO
/****** Object:  Default [DF__Rbloq__id_cola__36870511]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rbloq] ADD  DEFAULT (' ') FOR [id_cola]
GO
/****** Object:  Default [DF__Rbloq__Fecha_exp__377B294A]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rbloq] ADD  DEFAULT (getdate()) FOR [Fecha_exp]
GO
/****** Object:  Default [DF__Rbloq__Jdd__386F4D83]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rbloq] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__Rcentros__Codigo__396371BC]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rcentros] ADD  DEFAULT (' ') FOR [Codigo]
GO
/****** Object:  Default [DF__Rcentros__Ames__3A5795F5]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rcentros] ADD  DEFAULT (' ') FOR [Ames]
GO
/****** Object:  Default [DF__Rcentros__Peri__3B4BBA2E]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rcentros] ADD  DEFAULT (' ') FOR [Peri]
GO
/****** Object:  Default [DF__Rcentros__Period__3C3FDE67]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rcentros] ADD  DEFAULT (' ') FOR [Periodo]
GO
/****** Object:  Default [DF__Rcentros__Cencos__3D3402A0]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rcentros] ADD  DEFAULT ((0)) FOR [Cencos]
GO
/****** Object:  Default [DF__Rcentros__Porcen__3E2826D9]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rcentros] ADD  DEFAULT ((0)) FOR [Porcen]
GO
/****** Object:  Default [DF__Rcentros__Unids__3F1C4B12]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rcentros] ADD  DEFAULT ((0)) FOR [Unids]
GO
/****** Object:  Default [DF__Rcentros__Ticen__40106F4B]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rcentros] ADD  DEFAULT (' ') FOR [Ticen]
GO
/****** Object:  Default [DF__Rcentros__Jdd__41049384]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rcentros] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__RCERTIREN__Rut__41F8B7BD]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RCERTIREN] ADD  DEFAULT (' ') FOR [Rut]
GO
/****** Object:  Default [DF__RCERTIREN__Ames__42ECDBF6]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RCERTIREN] ADD  DEFAULT (' ') FOR [Ames]
GO
/****** Object:  Default [DF__RCERTIREN__Empre__43E1002F]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RCERTIREN] ADD  DEFAULT (' ') FOR [Empresa]
GO
/****** Object:  Default [DF__RCERTIREN__Rembr__44D52468]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RCERTIREN] ADD  DEFAULT ((0)) FOR [Rembru]
GO
/****** Object:  Default [DF__RCERTIREN__Cotiz__45C948A1]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RCERTIREN] ADD  DEFAULT ((0)) FOR [Cotiza]
GO
/****** Object:  Default [DF__RCERTIREN__Afect__46BD6CDA]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RCERTIREN] ADD  DEFAULT ((0)) FOR [Afecto]
GO
/****** Object:  Default [DF__RCERTIREN__Impue__47B19113]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RCERTIREN] ADD  DEFAULT ((0)) FOR [Impues]
GO
/****** Object:  Default [DF__RCERTIREN__Exent__48A5B54C]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RCERTIREN] ADD  DEFAULT ((0)) FOR [Exento]
GO
/****** Object:  Default [DF__RCERTIREN__Zonaf__4999D985]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RCERTIREN] ADD  DEFAULT ((0)) FOR [Zonafa]
GO
/****** Object:  Default [DF__RCERTIREN__Ppm__4A8DFDBE]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RCERTIREN] ADD  DEFAULT ((0)) FOR [Ppm]
GO
/****** Object:  Default [DF__RCERTIREN__facto__4B8221F7]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RCERTIREN] ADD  DEFAULT ((0)) FOR [factor]
GO
/****** Object:  Default [DF__RCERTIREN__aAfec__4C764630]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RCERTIREN] ADD  DEFAULT ((0)) FOR [aAfecto]
GO
/****** Object:  Default [DF__RCERTIREN__aImpu__4D6A6A69]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RCERTIREN] ADD  DEFAULT ((0)) FOR [aImpues]
GO
/****** Object:  Default [DF__RCERTIREN__aExen__4E5E8EA2]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RCERTIREN] ADD  DEFAULT ((0)) FOR [aExento]
GO
/****** Object:  Default [DF__RCERTIREN__aZona__4F52B2DB]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RCERTIREN] ADD  DEFAULT ((0)) FOR [aZonafa]
GO
/****** Object:  Default [DF__RCERTIREN__aPpm__5046D714]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RCERTIREN] ADD  DEFAULT ((0)) FOR [aPpm]
GO
/****** Object:  Default [DF__RCERTIREN__numce__513AFB4D]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RCERTIREN] ADD  DEFAULT ((0)) FOR [numcer]
GO
/****** Object:  Default [DF__RCERTIREN__Jdd__522F1F86]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RCERTIREN] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__RCERTIREN__OtrEx__532343BF]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RCERTIREN] ADD  DEFAULT ((0)) FOR [OtrExento]
GO
/****** Object:  Default [DF__RCERTIREN__aOtrE__541767F8]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RCERTIREN] ADD  DEFAULT ((0)) FOR [aOtrExent]
GO
/****** Object:  Default [DF__Rcertis__jdd__550B8C31]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rcertis] ADD  DEFAULT ((0)) FOR [jdd]
GO
/****** Object:  Default [DF__Rcertis__Rut__55FFB06A]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rcertis] ADD  DEFAULT (' ') FOR [Rut]
GO
/****** Object:  Default [DF__Rcertis__Empresa__56F3D4A3]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rcertis] ADD  DEFAULT (' ') FOR [Empresa]
GO
/****** Object:  Default [DF__Rcertis__Ames__57E7F8DC]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rcertis] ADD  DEFAULT (' ') FOR [Ames]
GO
/****** Object:  Default [DF__Rcertis__Nombre__58DC1D15]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rcertis] ADD  DEFAULT (' ') FOR [Nombre]
GO
/****** Object:  Default [DF__Rcertis__RemBru__59D0414E]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rcertis] ADD  DEFAULT ((0)) FOR [RemBru]
GO
/****** Object:  Default [DF__Rcertis__Remimp__5AC46587]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rcertis] ADD  DEFAULT ((0)) FOR [Remimp]
GO
/****** Object:  Default [DF__Rcertis__Cotiza__5BB889C0]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rcertis] ADD  DEFAULT ((0)) FOR [Cotiza]
GO
/****** Object:  Default [DF__Rcertis__Impues__5CACADF9]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rcertis] ADD  DEFAULT ((0)) FOR [Impues]
GO
/****** Object:  Default [DF__Rcertis__Ppm__5DA0D232]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rcertis] ADD  DEFAULT ((0)) FOR [Ppm]
GO
/****** Object:  Default [DF__Rcertis__impf29__5E94F66B]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rcertis] ADD  DEFAULT ((0)) FOR [impf29]
GO
/****** Object:  Default [DF__Rcertis__Impues1__5F891AA4]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rcertis] ADD  DEFAULT ((0)) FOR [Impues14]
GO
/****** Object:  Default [DF__Rcertis__impues1__607D3EDD]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rcertis] ADD  DEFAULT ((0)) FOR [impues14A]
GO
/****** Object:  Default [DF__Rcertis__exento__61716316]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rcertis] ADD  DEFAULT ((0)) FOR [exento]
GO
/****** Object:  Default [DF__Rcertis__zonafa__6265874F]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rcertis] ADD  DEFAULT ((0)) FOR [zonafa]
GO
/****** Object:  Default [DF__Rclaenc__Codigo__6359AB88]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rclaenc] ADD  DEFAULT (' ') FOR [Codigo]
GO
/****** Object:  Default [DF__Rclaenc__Descrip__644DCFC1]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rclaenc] ADD  DEFAULT (' ') FOR [Descrip]
GO
/****** Object:  Default [DF__Rclaenc__Codemp__6541F3FA]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rclaenc] ADD  DEFAULT (' ') FOR [Codemp]
GO
/****** Object:  Default [DF__Rclaenc__Funda__66361833]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rclaenc] ADD  DEFAULT (' ') FOR [Funda]
GO
/****** Object:  Default [DF__Rclaenc__Jdd__672A3C6C]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rclaenc] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__RclaencH__Codigo__681E60A5]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RclaencH] ADD  DEFAULT (' ') FOR [Codigo]
GO
/****** Object:  Default [DF__RclaencH__Descri__691284DE]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RclaencH] ADD  DEFAULT (' ') FOR [Descrip]
GO
/****** Object:  Default [DF__RclaencH__Codemp__6A06A917]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RclaencH] ADD  DEFAULT (' ') FOR [Codemp]
GO
/****** Object:  Default [DF__RclaencH__Funda__6AFACD50]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RclaencH] ADD  DEFAULT (' ') FOR [Funda]
GO
/****** Object:  Default [DF__RclaencH__Jdd__6BEEF189]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RclaencH] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__RclaencH__Ames__6CE315C2]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RclaencH] ADD  DEFAULT (' ') FOR [Ames]
GO
/****** Object:  Default [DF__Rclarem__Codigo__6DD739FB]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rclarem] ADD  DEFAULT (' ') FOR [Codigo]
GO
/****** Object:  Default [DF__Rclarem__Cohade__6ECB5E34]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rclarem] ADD  DEFAULT (' ') FOR [Cohade]
GO
/****** Object:  Default [DF__Rclarem__Nro__6FBF826D]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rclarem] ADD  DEFAULT ((0)) FOR [Nro]
GO
/****** Object:  Default [DF__Rclarem__Tipo__70B3A6A6]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rclarem] ADD  DEFAULT ((0)) FOR [Tipo]
GO
/****** Object:  Default [DF__Rclarem__Orden__71A7CADF]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rclarem] ADD  DEFAULT ((0)) FOR [Orden]
GO
/****** Object:  Default [DF__Rclarem__Periodo__729BEF18]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rclarem] ADD  DEFAULT (' ') FOR [Periodo]
GO
/****** Object:  Default [DF__Rclarem__COFORM__73901351]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rclarem] ADD  DEFAULT (' ') FOR [COFORM]
GO
/****** Object:  Default [DF__Rclarem__CUOTOT__7484378A]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rclarem] ADD  DEFAULT ((0)) FOR [CUOTOT]
GO
/****** Object:  Default [DF__Rclarem__Cuopar__75785BC3]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rclarem] ADD  DEFAULT ((0)) FOR [Cuopar]
GO
/****** Object:  Default [DF__Rclarem__Monto__766C7FFC]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rclarem] ADD  DEFAULT ((0)) FOR [Monto]
GO
/****** Object:  Default [DF__Rclarem__Fecha_c__7760A435]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rclarem] ADD  DEFAULT (getdate()) FOR [Fecha_cre]
GO
/****** Object:  Default [DF__Rclarem__Fecha_i__7854C86E]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rclarem] ADD  DEFAULT (getdate()) FOR [Fecha_ini]
GO
/****** Object:  Default [DF__Rclarem__Fecha_f__7948ECA7]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rclarem] ADD  DEFAULT (getdate()) FOR [Fecha_fin]
GO
/****** Object:  Default [DF__Rclarem__Cencos__7A3D10E0]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rclarem] ADD  DEFAULT ((0)) FOR [Cencos]
GO
/****** Object:  Default [DF__Rclarem__Cuenta__7B313519]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rclarem] ADD  DEFAULT (' ') FOR [Cuenta]
GO
/****** Object:  Default [DF__Rclarem__Ticen__7C255952]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rclarem] ADD  DEFAULT (' ') FOR [Ticen]
GO
/****** Object:  Default [DF__Rclarem__Ctacor__7D197D8B]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rclarem] ADD  DEFAULT (' ') FOR [Ctacor]
GO
/****** Object:  Default [DF__Rclarem__Obs__7E0DA1C4]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rclarem] ADD  DEFAULT (' ') FOR [Obs]
GO
/****** Object:  Default [DF__Rclarem__Formula__7F01C5FD]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rclarem] ADD  DEFAULT (' ') FOR [Formula]
GO
/****** Object:  Default [DF__Rclarem__Coinst__7FF5EA36]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rclarem] ADD  DEFAULT ((0)) FOR [Coinst]
GO
/****** Object:  Default [DF__Rclarem__Pone__00EA0E6F]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rclarem] ADD  DEFAULT (' ') FOR [Pone]
GO
/****** Object:  Default [DF__Rclarem__Grupo__01DE32A8]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rclarem] ADD  DEFAULT ((0)) FOR [Grupo]
GO
/****** Object:  Default [DF__Rclarem__Condi__02D256E1]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rclarem] ADD  DEFAULT (' ') FOR [Condi]
GO
/****** Object:  Default [DF__Rclarem__Simes__03C67B1A]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rclarem] ADD  DEFAULT (' ') FOR [Simes]
GO
/****** Object:  Default [DF__Rclarem__QuePeri__04BA9F53]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rclarem] ADD  DEFAULT (' ') FOR [QuePeri]
GO
/****** Object:  Default [DF__Rclarem__Jdd__05AEC38C]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rclarem] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__Rclarem__Ndecimo__06A2E7C5]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rclarem] ADD  DEFAULT ((0)) FOR [Ndecimon]
GO
/****** Object:  Default [DF__RclaremH__Codigo__07970BFE]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RclaremH] ADD  DEFAULT (' ') FOR [Codigo]
GO
/****** Object:  Default [DF__RclaremH__Cohade__088B3037]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RclaremH] ADD  DEFAULT (' ') FOR [Cohade]
GO
/****** Object:  Default [DF__RclaremH__Nro__097F5470]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RclaremH] ADD  DEFAULT ((0)) FOR [Nro]
GO
/****** Object:  Default [DF__RclaremH__Tipo__0A7378A9]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RclaremH] ADD  DEFAULT ((0)) FOR [Tipo]
GO
/****** Object:  Default [DF__RclaremH__Orden__0B679CE2]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RclaremH] ADD  DEFAULT ((0)) FOR [Orden]
GO
/****** Object:  Default [DF__RclaremH__Period__0C5BC11B]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RclaremH] ADD  DEFAULT (' ') FOR [Periodo]
GO
/****** Object:  Default [DF__RclaremH__COFORM__0D4FE554]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RclaremH] ADD  DEFAULT (' ') FOR [COFORM]
GO
/****** Object:  Default [DF__RclaremH__CUOTOT__0E44098D]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RclaremH] ADD  DEFAULT ((0)) FOR [CUOTOT]
GO
/****** Object:  Default [DF__RclaremH__Cuopar__0F382DC6]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RclaremH] ADD  DEFAULT ((0)) FOR [Cuopar]
GO
/****** Object:  Default [DF__RclaremH__Monto__102C51FF]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RclaremH] ADD  DEFAULT ((0)) FOR [Monto]
GO
/****** Object:  Default [DF__RclaremH__Fecha___11207638]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RclaremH] ADD  DEFAULT (getdate()) FOR [Fecha_cre]
GO
/****** Object:  Default [DF__RclaremH__Fecha___12149A71]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RclaremH] ADD  DEFAULT (getdate()) FOR [Fecha_ini]
GO
/****** Object:  Default [DF__RclaremH__Fecha___1308BEAA]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RclaremH] ADD  DEFAULT (getdate()) FOR [Fecha_fin]
GO
/****** Object:  Default [DF__RclaremH__Cencos__13FCE2E3]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RclaremH] ADD  DEFAULT ((0)) FOR [Cencos]
GO
/****** Object:  Default [DF__RclaremH__Cuenta__14F1071C]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RclaremH] ADD  DEFAULT (' ') FOR [Cuenta]
GO
/****** Object:  Default [DF__RclaremH__Ticen__15E52B55]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RclaremH] ADD  DEFAULT (' ') FOR [Ticen]
GO
/****** Object:  Default [DF__RclaremH__Ctacor__16D94F8E]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RclaremH] ADD  DEFAULT (' ') FOR [Ctacor]
GO
/****** Object:  Default [DF__RclaremH__Obs__17CD73C7]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RclaremH] ADD  DEFAULT (' ') FOR [Obs]
GO
/****** Object:  Default [DF__RclaremH__Formul__18C19800]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RclaremH] ADD  DEFAULT (' ') FOR [Formula]
GO
/****** Object:  Default [DF__RclaremH__Coinst__19B5BC39]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RclaremH] ADD  DEFAULT ((0)) FOR [Coinst]
GO
/****** Object:  Default [DF__RclaremH__Pone__1AA9E072]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RclaremH] ADD  DEFAULT (' ') FOR [Pone]
GO
/****** Object:  Default [DF__RclaremH__Grupo__1B9E04AB]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RclaremH] ADD  DEFAULT ((0)) FOR [Grupo]
GO
/****** Object:  Default [DF__RclaremH__Condi__1C9228E4]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RclaremH] ADD  DEFAULT (' ') FOR [Condi]
GO
/****** Object:  Default [DF__RclaremH__Simes__1D864D1D]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RclaremH] ADD  DEFAULT (' ') FOR [Simes]
GO
/****** Object:  Default [DF__RclaremH__QuePer__1E7A7156]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RclaremH] ADD  DEFAULT (' ') FOR [QuePeri]
GO
/****** Object:  Default [DF__RclaremH__ndecim__1F6E958F]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RclaremH] ADD  DEFAULT ((0)) FOR [ndecimon]
GO
/****** Object:  Default [DF__RclaremH__Jdd__2062B9C8]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RclaremH] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__RclaremH__Ames__2156DE01]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RclaremH] ADD  DEFAULT (' ') FOR [Ames]
GO
/****** Object:  Default [DF__rclientes__Clien__224B023A]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[rclientes] ADD  DEFAULT (' ') FOR [Cliente]
GO
/****** Object:  Default [DF__rclientes__Nombr__233F2673]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[rclientes] ADD  DEFAULT (' ') FOR [Nombre]
GO
/****** Object:  Default [DF__rclientes__Direc__24334AAC]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[rclientes] ADD  DEFAULT (' ') FOR [Direccion]
GO
/****** Object:  Default [DF__rclientes__Orige__25276EE5]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[rclientes] ADD  DEFAULT ((0)) FOR [Origen]
GO
/****** Object:  Default [DF__rclientes__nrotr__261B931E]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[rclientes] ADD  DEFAULT ((0)) FOR [nrotra]
GO
/****** Object:  Default [DF__rclientes__Jdd__270FB757]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[rclientes] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__rclientes__IDPad__2803DB90]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[rclientes] ADD  DEFAULT ((0)) FOR [IDPadre]
GO
/****** Object:  Default [DF__rclientes__SistC__28F7FFC9]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[rclientes] ADD  DEFAULT (' ') FOR [SistCont]
GO
/****** Object:  Default [DF__rclientes__Fono__29EC2402]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[rclientes] ADD  DEFAULT (' ') FOR [Fono]
GO
/****** Object:  Default [DF__rclientes__Nombr__2AE0483B]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[rclientes] ADD  DEFAULT (' ') FOR [NombreR]
GO
/****** Object:  Default [DF__rclientes__MailR__2BD46C74]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[rclientes] ADD  DEFAULT (' ') FOR [MailR]
GO
/****** Object:  Default [DF__rclientes__Funci__2CC890AD]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[rclientes] ADD  DEFAULT (' ') FOR [FuncionC]
GO
/****** Object:  Default [DF__rclientes__Usuar__2DBCB4E6]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[rclientes] ADD  DEFAULT (' ') FOR [UsuarioA]
GO
/****** Object:  Default [DF__rclientes__Rut__2EB0D91F]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[rclientes] ADD  DEFAULT (' ') FOR [Rut]
GO
/****** Object:  Default [DF__rclientes__Estad__2FA4FD58]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[rclientes] ADD  DEFAULT (' ') FOR [Estado]
GO
/****** Object:  Default [DF__rclientes__Tipo__30992191]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[rclientes] ADD  DEFAULT ((0)) FOR [Tipo]
GO
/****** Object:  Default [DF__rclientes__Rubro__318D45CA]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[rclientes] ADD  DEFAULT ((0)) FOR [Rubro]
GO
/****** Object:  Default [DF__rclientes__Fecha__32816A03]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[rclientes] ADD  DEFAULT (getdate()) FOR [Fecha_ini]
GO
/****** Object:  Default [DF__rclientes__NomFa__33758E3C]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[rclientes] ADD  DEFAULT (' ') FOR [NomFan]
GO
/****** Object:  Default [DF__rclientes__CodSI__3469B275]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[rclientes] ADD  DEFAULT (' ') FOR [CodSII]
GO
/****** Object:  Default [DF__rclientes__HsAdi__355DD6AE]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[rclientes] ADD  DEFAULT ((0)) FOR [HsAdic]
GO
/****** Object:  Default [DF__rclientes__RutR__3651FAE7]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[rclientes] ADD  DEFAULT (' ') FOR [RutR]
GO
/****** Object:  Default [DF__rclientes__PassR__37461F20]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[rclientes] ADD  DEFAULT (' ') FOR [PassR]
GO
/****** Object:  Default [DF__rclientes__Fecha__383A4359]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[rclientes] ADD  DEFAULT (getdate()) FOR [FechaA]
GO
/****** Object:  Default [DF__rclientes__Estad__392E6792]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[rclientes] ADD  DEFAULT ((0)) FOR [EstadoUpg]
GO
/****** Object:  Default [DF__rclientes__Fpago__6FBF826D]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[rclientes] ADD  CONSTRAINT [DF__rclientes__Fpago__6FBF826D]  DEFAULT ((0)) FOR [Fpago]
GO
/****** Object:  Default [DF_rclientes_grupo_out]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[rclientes] ADD  CONSTRAINT [DF_rclientes_grupo_out]  DEFAULT ((0)) FOR [grupo_out]
GO
/****** Object:  Default [DF__rclientes__Grupo__3C0AD43D]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[rclientes] ADD  DEFAULT ((0)) FOR [Grupo]
GO
/****** Object:  Default [DF__rcliprod__IDProd__3CFEF876]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[rcliprod] ADD  DEFAULT ((0)) FOR [IDProducto]
GO
/****** Object:  Default [DF__rcliprod__IDClie__3DF31CAF]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[rcliprod] ADD  DEFAULT ((0)) FOR [IDCliente]
GO
/****** Object:  Default [DF__rcliprod__Cantid__3EE740E8]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[rcliprod] ADD  DEFAULT ((0)) FOR [Cantidad]
GO
/****** Object:  Default [DF__rcliprod__Activo__3FDB6521]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[rcliprod] ADD  DEFAULT (' ') FOR [Activo]
GO
/****** Object:  Default [DF__rcliprod__FechaA__40CF895A]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[rcliprod] ADD  DEFAULT (getdate()) FOR [FechaAlta]
GO
/****** Object:  Default [DF__rcliprod__UsuarU__41C3AD93]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[rcliprod] ADD  DEFAULT (' ') FOR [UsuarUltm]
GO
/****** Object:  Default [DF__rcliprod__FechaU__42B7D1CC]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[rcliprod] ADD  DEFAULT (getdate()) FOR [FechaUltM]
GO
/****** Object:  Default [DF__rcliprod__desde__43ABF605]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[rcliprod] ADD  DEFAULT (getdate()) FOR [desde]
GO
/****** Object:  Default [DF__rcliprod__hasta__44A01A3E]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[rcliprod] ADD  DEFAULT (getdate()) FOR [hasta]
GO
/****** Object:  Default [DF__rcliprod__Observ__45943E77]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[rcliprod] ADD  DEFAULT (' ') FOR [Observ]
GO
/****** Object:  Default [DF__rcliprod__Fpago__468862B0]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[rcliprod] ADD  DEFAULT ((0)) FOR [Fpago]
GO
/****** Object:  Default [DF__rcliprod__Jdd__477C86E9]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[rcliprod] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__rcliprod__FechEn__4870AB22]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[rcliprod] ADD  DEFAULT (getdate()) FOR [FechEntrLic]
GO
/****** Object:  Default [DF__rcliprod__UsuarA__4964CF5B]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[rcliprod] ADD  DEFAULT ('') FOR [UsuarAlta]
GO
/****** Object:  Default [DF__rcliprod__UsuarB__4A58F394]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[rcliprod] ADD  DEFAULT (' ') FOR [UsuarBaja]
GO
/****** Object:  Default [DF__rcliprod__FechaB__4B4D17CD]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[rcliprod] ADD  DEFAULT (getdate()) FOR [FechaBaja]
GO
/****** Object:  Default [DF__RCOMCAR__Cargo__4C413C06]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RCOMCAR] ADD  DEFAULT ((0)) FOR [Cargo]
GO
/****** Object:  Default [DF__RCOMCAR__Compet__4D35603F]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RCOMCAR] ADD  DEFAULT ((0)) FOR [Compet]
GO
/****** Object:  Default [DF__RCOMCAR__Priori__4E298478]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RCOMCAR] ADD  DEFAULT ((0)) FOR [Priori]
GO
/****** Object:  Default [DF__RCOMCAR__Sicap__4F1DA8B1]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RCOMCAR] ADD  DEFAULT (' ') FOR [Sicap]
GO
/****** Object:  Default [DF__RCOMCAR__Jdd__5011CCEA]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RCOMCAR] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__RComisi__Ames__5105F123]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RComisi] ADD  DEFAULT (' ') FOR [Ames]
GO
/****** Object:  Default [DF__RComisi__Peri__51FA155C]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RComisi] ADD  DEFAULT (' ') FOR [Peri]
GO
/****** Object:  Default [DF__RComisi__Codigo__52EE3995]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RComisi] ADD  DEFAULT (' ') FOR [Codigo]
GO
/****** Object:  Default [DF__RComisi__Cohade__53E25DCE]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RComisi] ADD  DEFAULT (' ') FOR [Cohade]
GO
/****** Object:  Default [DF__RComisi__Numero__54D68207]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RComisi] ADD  DEFAULT ((0)) FOR [Numero]
GO
/****** Object:  Default [DF__RComisi__Valor1__55CAA640]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RComisi] ADD  DEFAULT ((0)) FOR [Valor1]
GO
/****** Object:  Default [DF__RComisi__Valor2__56BECA79]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RComisi] ADD  DEFAULT ((0)) FOR [Valor2]
GO
/****** Object:  Default [DF__RComisi__Valor3__57B2EEB2]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RComisi] ADD  DEFAULT ((0)) FOR [Valor3]
GO
/****** Object:  Default [DF__RComisi__Valor4__58A712EB]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RComisi] ADD  DEFAULT ((0)) FOR [Valor4]
GO
/****** Object:  Default [DF__RComisi__Campo1__599B3724]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RComisi] ADD  DEFAULT (' ') FOR [Campo1]
GO
/****** Object:  Default [DF__RComisi__Campo2__5A8F5B5D]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RComisi] ADD  DEFAULT (' ') FOR [Campo2]
GO
/****** Object:  Default [DF__RComisi__Campo3__5B837F96]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RComisi] ADD  DEFAULT (' ') FOR [Campo3]
GO
/****** Object:  Default [DF__RComisi__Campo4__5C77A3CF]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RComisi] ADD  DEFAULT (' ') FOR [Campo4]
GO
/****** Object:  Default [DF__RComisi__Largo1__5D6BC808]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RComisi] ADD  DEFAULT (' ') FOR [Largo1]
GO
/****** Object:  Default [DF__RComisi__Largo2__5E5FEC41]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RComisi] ADD  DEFAULT (' ') FOR [Largo2]
GO
/****** Object:  Default [DF__RComisi__Jdd__5F54107A]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RComisi] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__Rcomisii__Codigo__332C40D0]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rcomisii] ADD  DEFAULT (' ') FOR [Codigo]
GO
/****** Object:  Default [DF__Rcomisii__Ames__34206509]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rcomisii] ADD  DEFAULT (' ') FOR [Ames]
GO
/****** Object:  Default [DF__Rcomisii__Peri__35148942]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rcomisii] ADD  DEFAULT (' ') FOR [Peri]
GO
/****** Object:  Default [DF__Rcomisii__Cohade__3608AD7B]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rcomisii] ADD  DEFAULT (' ') FOR [Cohade]
GO
/****** Object:  Default [DF__Rcomisii__Numero__36FCD1B4]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rcomisii] ADD  DEFAULT ((0)) FOR [Numero]
GO
/****** Object:  Default [DF__Rcomisii__M_comi__37F0F5ED]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rcomisii] ADD  DEFAULT ((0)) FOR [M_comisi]
GO
/****** Object:  Default [DF__Rcomisii__Descri__38E51A26]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rcomisii] ADD  DEFAULT (' ') FOR [Descrip]
GO
/****** Object:  Default [DF__Rcomisii__JDD__39D93E5F]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rcomisii] ADD  DEFAULT ((0)) FOR [JDD]
GO
/****** Object:  Default [DF__RCONDAT__Jdd__604834B3]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RCONDAT] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__RCONDAT__Usuario__613C58EC]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RCONDAT] ADD  DEFAULT (' ') FOR [Usuario]
GO
/****** Object:  Default [DF__RCONDAT__Wcompu__62307D25]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RCONDAT] ADD  DEFAULT (' ') FOR [Wcompu]
GO
/****** Object:  Default [DF__RCONDAT__Identi__6324A15E]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RCONDAT] ADD  DEFAULT ((0)) FOR [Identi]
GO
/****** Object:  Default [DF__RCONDAT__Wuser__6418C597]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RCONDAT] ADD  DEFAULT (' ') FOR [Wuser]
GO
/****** Object:  Default [DF__RCONDAT__Fecha__650CE9D0]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RCONDAT] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(120)),(120))) FOR [Fecha]
GO
/****** Object:  Default [DF__RCONDAT__Program__66010E09]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RCONDAT] ADD  DEFAULT (' ') FOR [Programa]
GO
/****** Object:  Default [DF__RCONDIS__Jdd__66F53242]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RCONDIS] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__RCONDIS__Usuario__67E9567B]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RCONDIS] ADD  DEFAULT (' ') FOR [Usuario]
GO
/****** Object:  Default [DF__RCONDIS__Descrip__68DD7AB4]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RCONDIS] ADD  DEFAULT (' ') FOR [Descrip]
GO
/****** Object:  Default [DF__RCONDIS__Condici__69D19EED]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RCONDIS] ADD  DEFAULT (' ') FOR [Condicion]
GO
/****** Object:  Default [DF__RConfEsqu__Descr__11CB4D05]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RConfEsquemas] ADD  DEFAULT (' ') FOR [Descr]
GO
/****** Object:  Default [DF__RConfEsqu__TipEs__12BF713E]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RConfEsquemas] ADD  DEFAULT (' ') FOR [TipEsq]
GO
/****** Object:  Default [DF__RConfEsqu__TipAr__13B39577]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RConfEsquemas] ADD  DEFAULT (' ') FOR [TipArch]
GO
/****** Object:  Default [DF__RConfEsqu__NArch__14A7B9B0]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RConfEsquemas] ADD  DEFAULT (' ') FOR [NArchivo]
GO
/****** Object:  Default [DF__RConfEsqu__FCrea__159BDDE9]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RConfEsquemas] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [FCreacion]
GO
/****** Object:  Default [DF__RConfEsqu__Banco__16900222]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RConfEsquemas] ADD  DEFAULT (' ') FOR [BancoAsoc]
GO
/****** Object:  Default [DF__RConfEsquem__Jdd__1784265B]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RConfEsquemas] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__RConfigCe__nom_c__6AC5C326]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RConfigCen] ADD  DEFAULT (' ') FOR [nom_conf]
GO
/****** Object:  Default [DF__RConfigCe__plan___6BB9E75F]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RConfigCen] ADD  DEFAULT ((0)) FOR [plan_cta]
GO
/****** Object:  Default [DF__RConfigCe__cond___6CAE0B98]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RConfigCen] ADD  DEFAULT (' ') FOR [cond_emp]
GO
/****** Object:  Default [DF__RConfigCe__perio__6DA22FD1]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RConfigCen] ADD  DEFAULT (' ') FOR [periodos]
GO
/****** Object:  Default [DF__RConfigCe__opcio__6E96540A]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RConfigCen] ADD  DEFAULT (' ') FOR [opciones]
GO
/****** Object:  Default [DF__RConfigCe__habil__6F8A7843]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RConfigCen] ADD  DEFAULT ((0)) FOR [habilita]
GO
/****** Object:  Default [DF__RConfigCen__Jdd__707E9C7C]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RConfigCen] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__RConfigTr__nom_c__7172C0B5]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RConfigTransf] ADD  DEFAULT (' ') FOR [nom_conf]
GO
/****** Object:  Default [DF__RConfigTr__perio__7266E4EE]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RConfigTransf] ADD  DEFAULT (' ') FOR [periodo]
GO
/****** Object:  Default [DF__RConfigTr__banco__735B0927]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RConfigTransf] ADD  DEFAULT ((0)) FOR [banco]
GO
/****** Object:  Default [DF__RConfigTr__fec_p__744F2D60]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RConfigTransf] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [fec_pago]
GO
/****** Object:  Default [DF__RConfigTra__item__75435199]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RConfigTransf] ADD  DEFAULT (' ') FOR [item]
GO
/****** Object:  Default [DF__RConfigTr__nro_c__763775D2]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RConfigTransf] ADD  DEFAULT (' ') FOR [nro_cheq]
GO
/****** Object:  Default [DF__RConfigTr__condi__772B9A0B]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RConfigTransf] ADD  DEFAULT (' ') FOR [condicion]
GO
/****** Object:  Default [DF__RConfigTr__nom_a__781FBE44]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RConfigTransf] ADD  DEFAULT (' ') FOR [nom_archi]
GO
/****** Object:  Default [DF__RConfigTr__opcio__7913E27D]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RConfigTransf] ADD  DEFAULT (' ') FOR [opciones]
GO
/****** Object:  Default [DF__RConfigTr__otros__7A0806B6]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RConfigTransf] ADD  DEFAULT (' ') FOR [otros]
GO
/****** Object:  Default [DF__RConfigTran__Jdd__7AFC2AEF]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RConfigTransf] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__RConfigTr__ctaCt__1334728A]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RConfigTransf] ADD  DEFAULT ('') FOR [ctaCte]
GO
/****** Object:  Default [DF__RConfigTr__nroCo__142896C3]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RConfigTransf] ADD  DEFAULT ('') FOR [nroConv]
GO
/****** Object:  Default [DF__RConfigTr__NroNo__151CBAFC]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RConfigTransf] ADD  DEFAULT ('') FOR [NroNomina]
GO
/****** Object:  Default [DF__RConfigTr__NomNo__1610DF35]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RConfigTransf] ADD  DEFAULT ('') FOR [NomNomina]
GO
/****** Object:  Default [DF__RConfigTr__Nomdi__1705036E]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RConfigTransf] ADD  DEFAULT ((0)) FOR [Nomdia]
GO
/****** Object:  Default [DF__RConfigTr__NroDi__17F927A7]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RConfigTransf] ADD  DEFAULT ((0)) FOR [NroDia]
GO
/****** Object:  Default [DF__RConfigTr__Horas__18ED4BE0]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RConfigTransf] ADD  DEFAULT ((0)) FOR [Horas]
GO
/****** Object:  Default [DF__RConfigTr__mailN__19E17019]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RConfigTransf] ADD  DEFAULT ('') FOR [mailNotif]
GO
/****** Object:  Default [DF__RConfigTr__DiaPa__1AD59452]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RConfigTransf] ADD  DEFAULT ((0)) FOR [DiaPago]
GO
/****** Object:  Default [DF__RConfigTr__hbanc__1BC9B88B]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RConfigTransf] ADD  DEFAULT ((0)) FOR [hbancos]
GO
/****** Object:  Default [DF__RConfigTr__hfpag__1CBDDCC4]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RConfigTransf] ADD  DEFAULT ((0)) FOR [hfpagos]
GO
/****** Object:  Default [DF__RConfigTr__Trans__1DB200FD]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RConfigTransf] ADD  DEFAULT ((0)) FOR [Transfer]
GO
/****** Object:  Default [DF__RConfigTr__empre__1EA62536]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RConfigTransf] ADD  DEFAULT ((0)) FOR [empresa]
GO
/****** Object:  Default [DF__RConfigTr__idJdd__1F9A496F]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RConfigTransf] ADD  DEFAULT (' ') FOR [idJdd]
GO
/****** Object:  Default [DF__RConfigTr__IdPro__218291E1]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RConfigTransf] ADD  DEFAULT ((0)) FOR [IdProceso]
GO
/****** Object:  Default [DF__RCONFIR__Codigo__7BF04F28]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RCONFIR] ADD  DEFAULT (' ') FOR [Codigo]
GO
/****** Object:  Default [DF__RCONFIR__Ames__7CE47361]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RCONFIR] ADD  DEFAULT (' ') FOR [Ames]
GO
/****** Object:  Default [DF__RCONFIR__Peri__7DD8979A]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RCONFIR] ADD  DEFAULT (' ') FOR [Peri]
GO
/****** Object:  Default [DF__RCONFIR__marca__7ECCBBD3]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RCONFIR] ADD  DEFAULT (' ') FOR [marca]
GO
/****** Object:  Default [DF__RCONFIR__Fecha_m__7FC0E00C]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RCONFIR] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [Fecha_mar]
GO
/****** Object:  Default [DF__RCONFIR__Detalle__00B50445]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RCONFIR] ADD  DEFAULT (' ') FOR [Detalle]
GO
/****** Object:  Default [DF__RCONFIR__Jdd__01A9287E]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RCONFIR] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__Rcongsem__RUT__029D4CB7]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rcongsem] ADD  DEFAULT (' ') FOR [RUT]
GO
/****** Object:  Default [DF__Rcongsem__evento__039170F0]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rcongsem] ADD  DEFAULT (' ') FOR [evento]
GO
/****** Object:  Default [DF__Rcongsem__instit__04859529]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rcongsem] ADD  DEFAULT (' ') FOR [instit]
GO
/****** Object:  Default [DF__Rcongsem__fecha__0579B962]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rcongsem] ADD  DEFAULT (getdate()) FOR [fecha]
GO
/****** Object:  Default [DF__Rcongsem__fecha___066DDD9B]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rcongsem] ADD  DEFAULT (getdate()) FOR [fecha_fin]
GO
/****** Object:  Default [DF__Rcongsem__caract__076201D4]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rcongsem] ADD  DEFAULT (' ') FOR [caracter]
GO
/****** Object:  Default [DF__Rcongsem__ciudad__0856260D]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rcongsem] ADD  DEFAULT (' ') FOR [ciudad]
GO
/****** Object:  Default [DF__Rcongsem__Pais__094A4A46]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rcongsem] ADD  DEFAULT (' ') FOR [Pais]
GO
/****** Object:  Default [DF__Rcongsem__observ__0A3E6E7F]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rcongsem] ADD  DEFAULT (' ') FOR [observ]
GO
/****** Object:  Default [DF__Rcongsem__Fecha___0B3292B8]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rcongsem] ADD  DEFAULT (getdate()) FOR [Fecha_mod]
GO
/****** Object:  Default [DF__Rcongsem__vobo__0C26B6F1]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rcongsem] ADD  DEFAULT ((0)) FOR [vobo]
GO
/****** Object:  Default [DF__Rcongsem__usrvob__0D1ADB2A]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rcongsem] ADD  DEFAULT (' ') FOR [usrvobo]
GO
/****** Object:  Default [DF__Rcongsem__jdd__0E0EFF63]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rcongsem] ADD  DEFAULT ((0)) FOR [jdd]
GO
/****** Object:  Default [DF__Rconjun__Jdd__0F03239C]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rconjun] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__Rconjun__codCon__0FF747D5]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rconjun] ADD  DEFAULT ((0)) FOR [codCon]
GO
/****** Object:  Default [DF__Rconjun__Tipo__10EB6C0E]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rconjun] ADD  DEFAULT (' ') FOR [Tipo]
GO
/****** Object:  Default [DF__Rconjun__Condi__11DF9047]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rconjun] ADD  DEFAULT (' ') FOR [Condi]
GO
/****** Object:  Default [DF__Rconjun__Descrip__12D3B480]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rconjun] ADD  DEFAULT (' ') FOR [Descrip]
GO
/****** Object:  Default [DF__Rcontenidos__jdd__13C7D8B9]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rcontenidos] ADD  DEFAULT ((0)) FOR [jdd]
GO
/****** Object:  Default [DF__Rcontenid__fecha__14BBFCF2]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rcontenidos] ADD  DEFAULT (getdate()) FOR [fecha_cre]
GO
/****** Object:  Default [DF__Rcontenido__Tipo__15B0212B]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rcontenidos] ADD  DEFAULT (' ') FOR [Tipo]
GO
/****** Object:  Default [DF__Rcontenid__fecha__16A44564]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rcontenidos] ADD  DEFAULT (getdate()) FOR [fecha_mod]
GO
/****** Object:  Default [DF__Rcontenid__fecha__1798699D]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rcontenidos] ADD  DEFAULT (getdate()) FOR [fecha_ven]
GO
/****** Object:  Default [DF__Rcontenid__Clase__188C8DD6]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rcontenidos] ADD  DEFAULT (' ') FOR [Clase]
GO
/****** Object:  Default [DF__Rcontenid__Userm__1980B20F]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rcontenidos] ADD  DEFAULT (' ') FOR [Usermod]
GO
/****** Object:  Default [DF__Rcontenid__Titul__1A74D648]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rcontenidos] ADD  DEFAULT (' ') FOR [Titulo]
GO
/****** Object:  Default [DF__Rcontenid__Resum__1B68FA81]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rcontenidos] ADD  DEFAULT (' ') FOR [Resumen]
GO
/****** Object:  Default [DF__Rcontenid__Archi__1C5D1EBA]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rcontenidos] ADD  DEFAULT (' ') FOR [Archivo]
GO
/****** Object:  Default [DF__Rcontenid__Detal__1D5142F3]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rcontenidos] ADD  DEFAULT (' ') FOR [Detalle]
GO
/****** Object:  Default [DF__Rcontenid__Forma__1E45672C]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rcontenidos] ADD  DEFAULT (' ') FOR [Formato]
GO
/****** Object:  Default [DF__Rcontenid__codig__1F398B65]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rcontenidos] ADD  DEFAULT (' ') FOR [codigo]
GO
/****** Object:  Default [DF__RConTrans__IdJdd__7F2D79DD]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RConTrans] ADD  DEFAULT (' ') FOR [IdJdd]
GO
/****** Object:  Default [DF__RConTrans__IdEsq__00219E16]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RConTrans] ADD  DEFAULT ((0)) FOR [IdEsquema]
GO
/****** Object:  Default [DF__RConTrans__RutEm__0115C24F]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RConTrans] ADD  DEFAULT (' ') FOR [RutEmpresa]
GO
/****** Object:  Default [DF__RConTrans__Empre__0209E688]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RConTrans] ADD  DEFAULT (' ') FOR [Empresa]
GO
/****** Object:  Default [DF__RConTrans__Archi__02FE0AC1]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RConTrans] ADD  DEFAULT ((0)) FOR [Archivo]
GO
/****** Object:  Default [DF__RConTrans__Fecha__03F22EFA]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RConTrans] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [Fecha]
GO
/****** Object:  Default [DF__RConTrans__Banco__04E65333]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RConTrans] ADD  DEFAULT (' ') FOR [Banco]
GO
/****** Object:  Default [DF__RConTrans__Comen__05DA776C]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RConTrans] ADD  DEFAULT (' ') FOR [Comentario]
GO
/****** Object:  Default [DF__RConTrans__IdCon__208E6DA8]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RConTrans] ADD  DEFAULT ((0)) FOR [IdConfigur]
GO
/****** Object:  Default [DF__RCTACOR__Codigo__202DAF9E]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RCTACOR] ADD  DEFAULT (' ') FOR [Codigo]
GO
/****** Object:  Default [DF__RCTACOR__Codpres__2121D3D7]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RCTACOR] ADD  DEFAULT ((0)) FOR [Codpres]
GO
/****** Object:  Default [DF__RCTACOR__Fecha__2215F810]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RCTACOR] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(120)),(120))) FOR [Fecha]
GO
/****** Object:  Default [DF__RCTACOR__Detalle__230A1C49]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RCTACOR] ADD  DEFAULT (' ') FOR [Detalle]
GO
/****** Object:  Default [DF__RCTACOR__MontoH__23FE4082]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RCTACOR] ADD  DEFAULT ((0)) FOR [MontoH]
GO
/****** Object:  Default [DF__RCTACOR__MontoC__24F264BB]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RCTACOR] ADD  DEFAULT ((0)) FOR [MontoC]
GO
/****** Object:  Default [DF__RCTACOR__MontoA__25E688F4]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RCTACOR] ADD  DEFAULT ((0)) FOR [MontoA]
GO
/****** Object:  Default [DF__RCTACOR__MontoP__26DAAD2D]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RCTACOR] ADD  DEFAULT ((0)) FOR [MontoP]
GO
/****** Object:  Default [DF__RCTACOR__Cohade__27CED166]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RCTACOR] ADD  DEFAULT (' ') FOR [Cohade]
GO
/****** Object:  Default [DF__RCTACOR__Signo__28C2F59F]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RCTACOR] ADD  DEFAULT (' ') FOR [Signo]
GO
/****** Object:  Default [DF__RCTACOR__Coform__29B719D8]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RCTACOR] ADD  DEFAULT (' ') FOR [Coform]
GO
/****** Object:  Default [DF__RCTACOR__Tipo__2AAB3E11]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RCTACOR] ADD  DEFAULT ((0)) FOR [Tipo]
GO
/****** Object:  Default [DF__RCTACOR__Cuotot__2B9F624A]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RCTACOR] ADD  DEFAULT ((0)) FOR [Cuotot]
GO
/****** Object:  Default [DF__RCTACOR__Fecha_i__2C938683]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RCTACOR] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [Fecha_ini]
GO
/****** Object:  Default [DF__RCTACOR__Moneda__2D87AABC]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RCTACOR] ADD  DEFAULT ((0)) FOR [Moneda]
GO
/****** Object:  Default [DF__RCTACOR__Cuota__2E7BCEF5]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RCTACOR] ADD  DEFAULT ((0)) FOR [Cuota]
GO
/****** Object:  Default [DF__RCTACOR__Nucom__2F6FF32E]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RCTACOR] ADD  DEFAULT ((0)) FOR [Nucom]
GO
/****** Object:  Default [DF__RCTACOR__Refere__30641767]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RCTACOR] ADD  DEFAULT (' ') FOR [Refere]
GO
/****** Object:  Default [DF__RCTACOR__Origen__31583BA0]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RCTACOR] ADD  DEFAULT (' ') FOR [Origen]
GO
/****** Object:  Default [DF__RCTACOR__Jdd__324C5FD9]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RCTACOR] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__RCubos__IDcubo__33408412]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RCubos] ADD  DEFAULT (' ') FOR [IDcubo]
GO
/****** Object:  Default [DF__RCubos__Descrip__3434A84B]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RCubos] ADD  DEFAULT (' ') FOR [Descrip]
GO
/****** Object:  Default [DF__RCubos__Clasif__3528CC84]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RCubos] ADD  DEFAULT ((0)) FOR [Clasif]
GO
/****** Object:  Default [DF__RCubos__Esquema__361CF0BD]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RCubos] ADD  DEFAULT ((0)) FOR [Esquema]
GO
/****** Object:  Default [DF__RCubos__SQL__371114F6]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RCubos] ADD  DEFAULT (' ') FOR [SQL]
GO
/****** Object:  Default [DF__RCubos__Jdd__3805392F]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RCubos] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__Rcuentas__Cohade__38F95D68]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rcuentas] ADD  DEFAULT (' ') FOR [Cohade]
GO
/****** Object:  Default [DF__Rcuentas__Indice__39ED81A1]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rcuentas] ADD  DEFAULT ((0)) FOR [Indice]
GO
/****** Object:  Default [DF__Rcuentas__Cuenta__3AE1A5DA]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rcuentas] ADD  DEFAULT (' ') FOR [Cuenta]
GO
/****** Object:  Default [DF__Rcuentas__Jdd__3BD5CA13]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rcuentas] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__RCURRICU__Codigo__3CC9EE4C]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RCURRICU] ADD  DEFAULT (' ') FOR [Codigo]
GO
/****** Object:  Default [DF__RCURRICU__Fecha___3DBE1285]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RCURRICU] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [Fecha_ini]
GO
/****** Object:  Default [DF__RCURRICU__Duraci__3EB236BE]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RCURRICU] ADD  DEFAULT ((0)) FOR [Duracion]
GO
/****** Object:  Default [DF__RCURRICU__TipDur__3FA65AF7]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RCURRICU] ADD  DEFAULT (' ') FOR [TipDur]
GO
/****** Object:  Default [DF__RCURRICU__Fecha___409A7F30]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RCURRICU] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [Fecha_ter]
GO
/****** Object:  Default [DF__RCURRICU__Nacion__418EA369]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RCURRICU] ADD  DEFAULT ((0)) FOR [Nacion]
GO
/****** Object:  Default [DF__RCURRICU__Detall__4282C7A2]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RCURRICU] ADD  DEFAULT (' ') FOR [Detalle]
GO
/****** Object:  Default [DF__RCURRICU__Tipo__4376EBDB]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RCURRICU] ADD  DEFAULT ((0)) FOR [Tipo]
GO
/****** Object:  Default [DF__RCURRICU__Instit__446B1014]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RCURRICU] ADD  DEFAULT ((0)) FOR [Institu]
GO
/****** Object:  Default [DF__RCURRICU__Dinsti__455F344D]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RCURRICU] ADD  DEFAULT (' ') FOR [Dinstitu]
GO
/****** Object:  Default [DF__RCURRICU__Area__46535886]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RCURRICU] ADD  DEFAULT (' ') FOR [Area]
GO
/****** Object:  Default [DF__RCURRICU__Compet__47477CBF]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RCURRICU] ADD  DEFAULT ((0)) FOR [Compet]
GO
/****** Object:  Default [DF__RCURRICU__ValorS__483BA0F8]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RCURRICU] ADD  DEFAULT ((0)) FOR [ValorS]
GO
/****** Object:  Default [DF__RCURRICU__ValorT__492FC531]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RCURRICU] ADD  DEFAULT ((0)) FOR [ValorT]
GO
/****** Object:  Default [DF__RCURRICU__EsSenc__4A23E96A]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RCURRICU] ADD  DEFAULT (' ') FOR [EsSence]
GO
/****** Object:  Default [DF__RCURRICU__Situ__4B180DA3]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RCURRICU] ADD  DEFAULT (' ') FOR [Situ]
GO
/****** Object:  Default [DF__RCURRICU__Asiste__4C0C31DC]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RCURRICU] ADD  DEFAULT ((0)) FOR [Asisten]
GO
/****** Object:  Default [DF__RCURRICU__Aproba__4D005615]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RCURRICU] ADD  DEFAULT (' ') FOR [Aproba]
GO
/****** Object:  Default [DF__RCURRICU__Obs__4DF47A4E]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RCURRICU] ADD  DEFAULT (' ') FOR [Obs]
GO
/****** Object:  Default [DF__RCURRICU__Curso__4EE89E87]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RCURRICU] ADD  DEFAULT (' ') FOR [Curso]
GO
/****** Object:  Default [DF__RCURRICU__Grado__4FDCC2C0]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RCURRICU] ADD  DEFAULT ((0)) FOR [Grado]
GO
/****** Object:  Default [DF__RCURRICU__Titulo__50D0E6F9]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RCURRICU] ADD  DEFAULT (' ') FOR [Titulo]
GO
/****** Object:  Default [DF__RCURRICU__Especi__51C50B32]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RCURRICU] ADD  DEFAULT (' ') FOR [Especial]
GO
/****** Object:  Default [DF__RCURRICU__Puntaj__52B92F6B]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RCURRICU] ADD  DEFAULT ((0)) FOR [Puntaje]
GO
/****** Object:  Default [DF__RCURRICU__Jdd__53AD53A4]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RCURRICU] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__RCURRICU__Fecha___54A177DD]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RCURRICU] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [Fecha_mod]
GO
/****** Object:  Default [DF__RCURRICU__Estado__55959C16]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RCURRICU] ADD  DEFAULT ((0)) FOR [Estado]
GO
/****** Object:  Default [DF__RCURRICU__Tipotr__5689C04F]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RCURRICU] ADD  DEFAULT ((0)) FOR [Tipotract]
GO
/****** Object:  Default [DF__RCURRICU__vobo__577DE488]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RCURRICU] ADD  DEFAULT ((0)) FOR [vobo]
GO
/****** Object:  Default [DF__RCURRICU__usrvob__587208C1]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RCURRICU] ADD  DEFAULT (' ') FOR [usrvobo]
GO
/****** Object:  Default [DF__RCURRICU__Causen__59662CFA]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RCURRICU] ADD  DEFAULT ((0)) FOR [Causen]
GO
/****** Object:  Default [DF__RDESCUR__Curso__5A5A5133]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RDESCUR] ADD  DEFAULT (' ') FOR [Curso]
GO
/****** Object:  Default [DF__RDESCUR__Descrip__5B4E756C]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RDESCUR] ADD  DEFAULT (' ') FOR [Descrip]
GO
/****** Object:  Default [DF__RDESCUR__Institu__5C4299A5]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RDESCUR] ADD  DEFAULT ((0)) FOR [Institu]
GO
/****** Object:  Default [DF__RDESCUR__Nivel__5D36BDDE]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RDESCUR] ADD  DEFAULT ((0)) FOR [Nivel]
GO
/****** Object:  Default [DF__RDESCUR__Costo__5E2AE217]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RDESCUR] ADD  DEFAULT ((0)) FOR [Costo]
GO
/****** Object:  Default [DF__RDESCUR__Horas__5F1F0650]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RDESCUR] ADD  DEFAULT ((0)) FOR [Horas]
GO
/****** Object:  Default [DF__RDESCUR__Relator__60132A89]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RDESCUR] ADD  DEFAULT (' ') FOR [Relator]
GO
/****** Object:  Default [DF__RDESCUR__Fecha_i__61074EC2]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RDESCUR] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [Fecha_ini]
GO
/****** Object:  Default [DF__RDESCUR__Fecha_t__61FB72FB]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RDESCUR] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [Fecha_ter]
GO
/****** Object:  Default [DF__RDESCUR__Compet__62EF9734]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RDESCUR] ADD  DEFAULT ((0)) FOR [Compet]
GO
/****** Object:  Default [DF__RDESCUR__EsSence__63E3BB6D]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RDESCUR] ADD  DEFAULT (' ') FOR [EsSence]
GO
/****** Object:  Default [DF__RDESCUR__Cordina__64D7DFA6]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RDESCUR] ADD  DEFAULT (' ') FOR [Cordina]
GO
/****** Object:  Default [DF__RDESCUR__Objetiv__65CC03DF]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RDESCUR] ADD  DEFAULT (' ') FOR [Objetivo]
GO
/****** Object:  Default [DF__RDESCUR__Metodo__66C02818]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RDESCUR] ADD  DEFAULT ((0)) FOR [Metodo]
GO
/****** Object:  Default [DF__RDESCUR__Obligat__67B44C51]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RDESCUR] ADD  DEFAULT (' ') FOR [Obligat]
GO
/****** Object:  Default [DF__RDESCUR__Unidad__68A8708A]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RDESCUR] ADD  DEFAULT ((0)) FOR [Unidad]
GO
/****** Object:  Default [DF__RDESCUR__Tipo__699C94C3]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RDESCUR] ADD  DEFAULT ((0)) FOR [Tipo]
GO
/****** Object:  Default [DF__RDESCUR__Jdd__6A90B8FC]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RDESCUR] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__RDetEsque__IdEsq__1A609306]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RDetEsquema] ADD  DEFAULT ((0)) FOR [IdEsquema]
GO
/****** Object:  Default [DF__RDetEsque__TipDe__1B54B73F]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RDetEsquema] ADD  DEFAULT (' ') FOR [TipDet]
GO
/****** Object:  Default [DF__RDetEsquem__Fila__1C48DB78]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RDetEsquema] ADD  DEFAULT ((0)) FOR [Fila]
GO
/****** Object:  Default [DF__RDetEsque__Descr__1D3CFFB1]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RDetEsquema] ADD  DEFAULT (' ') FOR [Descr]
GO
/****** Object:  Default [DF__RDetEsque__TipoD__1E3123EA]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RDetEsquema] ADD  DEFAULT (' ') FOR [TipoDato]
GO
/****** Object:  Default [DF__RDetEsque__Largo__1F254823]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RDetEsquema] ADD  DEFAULT ((0)) FOR [Largo]
GO
/****** Object:  Default [DF__RDetEsque__Aline__20196C5C]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RDetEsquema] ADD  DEFAULT ((0)) FOR [Alineacion]
GO
/****** Object:  Default [DF__RDetEsque__Relle__210D9095]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RDetEsquema] ADD  DEFAULT (' ') FOR [Relleno]
GO
/****** Object:  Default [DF__RDetEsque__Desde__2201B4CE]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RDetEsquema] ADD  DEFAULT (' ') FOR [Desde]
GO
/****** Object:  Default [DF__RDetEsque__Hasta__22F5D907]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RDetEsquema] ADD  DEFAULT (' ') FOR [Hasta]
GO
/****** Object:  Default [DF__RDetEsque__MayMi__23E9FD40]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RDetEsquema] ADD  DEFAULT ((0)) FOR [MayMin]
GO
/****** Object:  Default [DF__RDetEsque__TipVa__24DE2179]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RDetEsquema] ADD  DEFAULT ((0)) FOR [TipValor]
GO
/****** Object:  Default [DF__RDetEsque__Valor__25D245B2]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RDetEsquema] ADD  DEFAULT (' ') FOR [Valor]
GO
/****** Object:  Default [DF__RDetEsque__Tabla__26C669EB]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RDetEsquema] ADD  DEFAULT (' ') FOR [Tabla]
GO
/****** Object:  Default [DF__RDetEsque__Forma__27BA8E24]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RDetEsquema] ADD  DEFAULT (' ') FOR [FormatDate]
GO
/****** Object:  Default [DF__RDetEsque__Forma__28AEB25D]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RDetEsquema] ADD  DEFAULT (' ') FOR [FormatHour]
GO
/****** Object:  Default [DF__RDetEsque__EsVal__29A2D696]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RDetEsquema] ADD  DEFAULT ((0)) FOR [EsValorAbs]
GO
/****** Object:  Default [DF__RDetEsque__Redon__2A96FACF]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RDetEsquema] ADD  DEFAULT ((0)) FOR [Redondeo]
GO
/****** Object:  Default [DF__RDetEsque__CantD__2B8B1F08]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RDetEsquema] ADD  DEFAULT ((0)) FOR [CantDeci]
GO
/****** Object:  Default [DF__RDetEsque__SepMi__2C7F4341]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RDetEsquema] ADD  DEFAULT ((0)) FOR [SepMiles]
GO
/****** Object:  Default [DF__RDetEsque__SepDe__2D73677A]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RDetEsquema] ADD  DEFAULT ((0)) FOR [SepDeci]
GO
/****** Object:  Default [DF__RDetEsque__EsDes__2E678BB3]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RDetEsquema] ADD  DEFAULT ((0)) FOR [EsDesdePan]
GO
/****** Object:  Default [DF__RDetEsquem__Item__2F5BAFEC]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RDetEsquema] ADD  DEFAULT (' ') FOR [Item]
GO
/****** Object:  Default [DF__RDetEsque__TipoM__304FD425]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RDetEsquema] ADD  DEFAULT ((0)) FOR [TipoMonto]
GO
/****** Object:  Default [DF__RDetEsque__Orden__3143F85E]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RDetEsquema] ADD  DEFAULT ((0)) FOR [Orden]
GO
/****** Object:  Default [DF__RDetEsque__EsVis__0D7B9934]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RDetEsquema] ADD  DEFAULT ((1)) FOR [EsVisible]
GO
/****** Object:  Default [DF__RDetEsque__EsCon__0E6FBD6D]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RDetEsquema] ADD  DEFAULT ((0)) FOR [EsCondic]
GO
/****** Object:  Default [DF__RDetEsque__CampE__0F63E1A6]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RDetEsquema] ADD  DEFAULT ((0)) FOR [CampEval]
GO
/****** Object:  Default [DF__RDetEsque__Opera__105805DF]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RDetEsquema] ADD  DEFAULT ('') FOR [Operador]
GO
/****** Object:  Default [DF__RDetEsque__CampC__114C2A18]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RDetEsquema] ADD  DEFAULT ((0)) FOR [CampCom1]
GO
/****** Object:  Default [DF__RDetEsque__CampC__12404E51]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RDetEsquema] ADD  DEFAULT ((0)) FOR [CampCom2]
GO
/****** Object:  Default [DF__Rdirec__Codigo__6B84DD35]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rdirec] ADD  DEFAULT ((0)) FOR [Codigo]
GO
/****** Object:  Default [DF__Rdirec__Descrip__6C79016E]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rdirec] ADD  DEFAULT (' ') FOR [Descrip]
GO
/****** Object:  Default [DF__Rdirec__Direccio__6D6D25A7]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rdirec] ADD  DEFAULT (' ') FOR [Direccion]
GO
/****** Object:  Default [DF__Rdirec__Telefono__6E6149E0]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rdirec] ADD  DEFAULT (' ') FOR [Telefono]
GO
/****** Object:  Default [DF__Rdirec__Valor__6F556E19]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rdirec] ADD  DEFAULT ((0)) FOR [Valor]
GO
/****** Object:  Default [DF__Rdirec__Valorc__70499252]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rdirec] ADD  DEFAULT (' ') FOR [Valorc]
GO
/****** Object:  Default [DF__Rdirec__mail__713DB68B]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rdirec] ADD  DEFAULT (' ') FOR [mail]
GO
/****** Object:  Default [DF__Rdirec__Jdd__7231DAC4]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rdirec] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__Rdocemple__Jdd__7325FEFD]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rdocemple] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__Rdocemple__Codig__741A2336]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rdocemple] ADD  DEFAULT (' ') FOR [Codigo]
GO
/****** Object:  Default [DF__Rdocemple__Nombr__750E476F]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rdocemple] ADD  DEFAULT (' ') FOR [Nombredoc]
GO
/****** Object:  Default [DF__Rdocemple__Docum__76026BA8]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rdocemple] ADD  DEFAULT ((0)) FOR [Documento]
GO
/****** Object:  Default [DF__Rdocemple__Tipod__76F68FE1]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rdocemple] ADD  DEFAULT ((0)) FOR [Tipodoc]
GO
/****** Object:  Default [DF__Rdocemple__Descr__77EAB41A]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rdocemple] ADD  DEFAULT (' ') FOR [Descrip]
GO
/****** Object:  Default [DF__Rdocemple__Usuar__78DED853]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rdocemple] ADD  DEFAULT (' ') FOR [Usuar_car]
GO
/****** Object:  Default [DF__Rdocemple__Fecha__79D2FC8C]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rdocemple] ADD  DEFAULT (getdate()) FOR [Fecha_car]
GO
/****** Object:  Default [DF__Rdocemple__mimet__7AC720C5]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rdocemple] ADD  DEFAULT (' ') FOR [mimetype]
GO
/****** Object:  Default [DF__Rdocempre__Jdd__7BBB44FE]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rdocempre] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__Rdocempre__Empre__7CAF6937]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rdocempre] ADD  DEFAULT (' ') FOR [Empresa]
GO
/****** Object:  Default [DF__Rdocempre__Nombr__7DA38D70]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rdocempre] ADD  DEFAULT (' ') FOR [Nombredoc]
GO
/****** Object:  Default [DF__Rdocempre__Docum__7E97B1A9]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rdocempre] ADD  DEFAULT ((0)) FOR [Documento]
GO
/****** Object:  Default [DF__Rdocempre__Tipod__7F8BD5E2]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rdocempre] ADD  DEFAULT ((0)) FOR [Tipodoc]
GO
/****** Object:  Default [DF__Rdocempre__Descr__007FFA1B]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rdocempre] ADD  DEFAULT (' ') FOR [Descrip]
GO
/****** Object:  Default [DF__Rdocempre__Usuar__01741E54]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rdocempre] ADD  DEFAULT (' ') FOR [Usuar_car]
GO
/****** Object:  Default [DF__Rdocempre__Fecha__0268428D]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rdocempre] ADD  DEFAULT (getdate()) FOR [Fecha_car]
GO
/****** Object:  Default [DF__Rdocfirma__Jdd__035C66C6]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rdocfirma] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__Rdocfirma__Codig__04508AFF]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rdocfirma] ADD  DEFAULT (' ') FOR [Codigo]
GO
/****** Object:  Default [DF__Rdocfirma__Nombr__0544AF38]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rdocfirma] ADD  DEFAULT (' ') FOR [Nombredoc]
GO
/****** Object:  Default [DF__Rdocfirma__Docum__0638D371]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rdocfirma] ADD  DEFAULT ((0)) FOR [Documento]
GO
/****** Object:  Default [DF__Rdocfirma__Tipod__072CF7AA]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rdocfirma] ADD  DEFAULT ((0)) FOR [Tipodoc]
GO
/****** Object:  Default [DF__Rdocfirma__Descr__08211BE3]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rdocfirma] ADD  DEFAULT (' ') FOR [Descrip]
GO
/****** Object:  Default [DF__Rdocfirma__Usuar__0915401C]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rdocfirma] ADD  DEFAULT (' ') FOR [Usuar_car]
GO
/****** Object:  Default [DF__Rdocfirma__Fecha__0A096455]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rdocfirma] ADD  DEFAULT (getdate()) FOR [Fecha_car]
GO
/****** Object:  Default [DF__Rdocfirma__Rutem__0AFD888E]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rdocfirma] ADD  DEFAULT (' ') FOR [Rutempl]
GO
/****** Object:  Default [DF__Rdocfirma__Rutre__0BF1ACC7]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rdocfirma] ADD  DEFAULT (' ') FOR [Rutrepr]
GO
/****** Object:  Default [DF__Rdocfirma__Firmo__0CE5D100]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rdocfirma] ADD  DEFAULT (' ') FOR [Firmoempl]
GO
/****** Object:  Default [DF__Rdocfirma__Firmo__0DD9F539]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rdocfirma] ADD  DEFAULT (' ') FOR [Firmorepr]
GO
/****** Object:  Default [DF__Rdocfirma__Audit__0ECE1972]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rdocfirma] ADD  DEFAULT (' ') FOR [Auditempl]
GO
/****** Object:  Default [DF__Rdocfirma__Audit__0FC23DAB]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rdocfirma] ADD  DEFAULT (' ') FOR [Auditrepr]
GO
/****** Object:  Default [DF__RDOCUMS__Codigo__10B661E4]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RDOCUMS] ADD  DEFAULT (' ') FOR [Codigo]
GO
/****** Object:  Default [DF__RDOCUMS__Fecha_d__11AA861D]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RDOCUMS] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [Fecha_doc]
GO
/****** Object:  Default [DF__RDOCUMS__Tipo__129EAA56]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RDOCUMS] ADD  DEFAULT ((0)) FOR [Tipo]
GO
/****** Object:  Default [DF__RDOCUMS__Descrip__1392CE8F]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RDOCUMS] ADD  DEFAULT (' ') FOR [Descrip]
GO
/****** Object:  Default [DF__RDOCUMS__Nombre__1486F2C8]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RDOCUMS] ADD  DEFAULT (' ') FOR [Nombre]
GO
/****** Object:  Default [DF__RDOCUMS__Fecha_c__157B1701]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RDOCUMS] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [Fecha_car]
GO
/****** Object:  Default [DF__RDOCUMS__Element__166F3B3A]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RDOCUMS] ADD  DEFAULT (0x00) FOR [Elemento]
GO
/****** Object:  Default [DF__RDOCUMS__Dire__17635F73]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RDOCUMS] ADD  DEFAULT (' ') FOR [Dire]
GO
/****** Object:  Default [DF__RDOCUMS__Dtipo__185783AC]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RDOCUMS] ADD  DEFAULT (' ') FOR [Dtipo]
GO
/****** Object:  Default [DF__RDOCUMS__Jdd__194BA7E5]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RDOCUMS] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__Rdonatario__Cuit__1A3FCC1E]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rdonatario] ADD  DEFAULT (' ') FOR [Cuit]
GO
/****** Object:  Default [DF__Rdonatari__Denom__1B33F057]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rdonatario] ADD  DEFAULT (' ') FOR [Denominac]
GO
/****** Object:  Default [DF__Rdonatari__Tipod__1C281490]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rdonatario] ADD  DEFAULT ((0)) FOR [Tipodom]
GO
/****** Object:  Default [DF__Rdonatari__Calle__1D1C38C9]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rdonatario] ADD  DEFAULT (' ') FOR [Calle]
GO
/****** Object:  Default [DF__Rdonatari__Nropu__1E105D02]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rdonatario] ADD  DEFAULT (' ') FOR [Nropuerta]
GO
/****** Object:  Default [DF__Rdonatario__Piso__1F04813B]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rdonatario] ADD  DEFAULT (' ') FOR [Piso]
GO
/****** Object:  Default [DF__Rdonatari__Depto__1FF8A574]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rdonatario] ADD  DEFAULT (' ') FOR [Depto]
GO
/****** Object:  Default [DF__Rdonatari__Secto__20ECC9AD]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rdonatario] ADD  DEFAULT (' ') FOR [Sector]
GO
/****** Object:  Default [DF__Rdonatari__Torre__21E0EDE6]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rdonatario] ADD  DEFAULT (' ') FOR [Torre]
GO
/****** Object:  Default [DF__Rdonatari__Manza__22D5121F]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rdonatario] ADD  DEFAULT (' ') FOR [Manzana]
GO
/****** Object:  Default [DF__Rdonatari__Codpo__23C93658]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rdonatario] ADD  DEFAULT (' ') FOR [Codpostal]
GO
/****** Object:  Default [DF__Rdonatari__Local__24BD5A91]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rdonatario] ADD  DEFAULT (' ') FOR [Localidad]
GO
/****** Object:  Default [DF__Rdonatari__Codpr__25B17ECA]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rdonatario] ADD  DEFAULT ((0)) FOR [Codprov]
GO
/****** Object:  Default [DF__Rdonatario__Jdd__26A5A303]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rdonatario] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__Rdonatario__Cbu__2799C73C]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rdonatario] ADD  DEFAULT (' ') FOR [Cbu]
GO
/****** Object:  Default [DF__RECORDAR__Jdd__288DEB75]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RECORDAR] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__RECORDAR__Fecha___29820FAE]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RECORDAR] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(120)),(120))) FOR [Fecha_cre]
GO
/****** Object:  Default [DF__RECORDAR__Usuari__2A7633E7]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RECORDAR] ADD  DEFAULT (' ') FOR [Usuario]
GO
/****** Object:  Default [DF__RECORDAR__Titulo__2B6A5820]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RECORDAR] ADD  DEFAULT (' ') FOR [Titulo]
GO
/****** Object:  Default [DF__RECORDAR__Destin__2C5E7C59]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RECORDAR] ADD  DEFAULT (' ') FOR [Destino]
GO
/****** Object:  Default [DF__RECORDAR__Grupos__2D52A092]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RECORDAR] ADD  DEFAULT (' ') FOR [Grupos]
GO
/****** Object:  Default [DF__RECORDAR__Restri__2E46C4CB]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RECORDAR] ADD  DEFAULT (' ') FOR [Restrin]
GO
/****** Object:  Default [DF__RECORDAR__Fecha___2F3AE904]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RECORDAR] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [Fecha_act]
GO
/****** Object:  Default [DF__RECORDAR__Color__302F0D3D]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RECORDAR] ADD  DEFAULT (' ') FOR [Color]
GO
/****** Object:  Default [DF__RECORDAR__Dato__31233176]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RECORDAR] ADD  DEFAULT (' ') FOR [Dato]
GO
/****** Object:  Default [DF__REMPLAN__Codigo__321755AF]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[REMPLAN] ADD  DEFAULT (' ') FOR [Codigo]
GO
/****** Object:  Default [DF__REMPLAN__Nombre__330B79E8]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[REMPLAN] ADD  DEFAULT (' ') FOR [Nombre]
GO
/****** Object:  Default [DF__REMPLAN__Rut__33FF9E21]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[REMPLAN] ADD  DEFAULT (' ') FOR [Rut]
GO
/****** Object:  Default [DF__REMPLAN__Cargo__34F3C25A]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[REMPLAN] ADD  DEFAULT ((0)) FOR [Cargo]
GO
/****** Object:  Default [DF__REMPLAN__Cencos__35E7E693]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[REMPLAN] ADD  DEFAULT ((0)) FOR [Cencos]
GO
/****** Object:  Default [DF__REMPLAN__Empresa__36DC0ACC]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[REMPLAN] ADD  DEFAULT (' ') FOR [Empresa]
GO
/****** Object:  Default [DF__REMPLAN__Estado__37D02F05]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[REMPLAN] ADD  DEFAULT (' ') FOR [Estado]
GO
/****** Object:  Default [DF__REMPLAN__Ocupaci__38C4533E]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[REMPLAN] ADD  DEFAULT (' ') FOR [Ocupacion]
GO
/****** Object:  Default [DF__REMPLAN__Direcci__39B87777]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[REMPLAN] ADD  DEFAULT (' ') FOR [Direccion]
GO
/****** Object:  Default [DF__REMPLAN__Fono__3AAC9BB0]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[REMPLAN] ADD  DEFAULT (' ') FOR [Fono]
GO
/****** Object:  Default [DF__REMPLAN__Fecha_n__3BA0BFE9]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[REMPLAN] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [Fecha_nac]
GO
/****** Object:  Default [DF__REMPLAN__Fecha_i__3C94E422]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[REMPLAN] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [Fecha_ing]
GO
/****** Object:  Default [DF__REMPLAN__Fecha_r__3D89085B]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[REMPLAN] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [Fecha_ret]
GO
/****** Object:  Default [DF__REMPLAN__Moti_re__3E7D2C94]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[REMPLAN] ADD  DEFAULT ((0)) FOR [Moti_ret]
GO
/****** Object:  Default [DF__REMPLAN__Obs__3F7150CD]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[REMPLAN] ADD  DEFAULT (' ') FOR [Obs]
GO
/****** Object:  Default [DF__REMPLAN__Jdd__40657506]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[REMPLAN] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__REMPLAN__Detalle__4159993F]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[REMPLAN] ADD  DEFAULT (' ') FOR [Detalle]
GO
/****** Object:  Default [DF__remplec__Codigo__424DBD78]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[remplec] ADD  DEFAULT (' ') FOR [Codigo]
GO
/****** Object:  Default [DF__remplec__Codcam__4341E1B1]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[remplec] ADD  DEFAULT ((0)) FOR [Codcam]
GO
/****** Object:  Default [DF__remplec__ValorN__443605EA]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[remplec] ADD  DEFAULT ((0)) FOR [ValorN]
GO
/****** Object:  Default [DF__remplec__ValorF__452A2A23]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[remplec] ADD  DEFAULT (getdate()) FOR [ValorF]
GO
/****** Object:  Default [DF__remplec__ValorC__461E4E5C]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[remplec] ADD  DEFAULT (' ') FOR [ValorC]
GO
/****** Object:  Default [DF__remplec__ValorM__47127295]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[remplec] ADD  DEFAULT (' ') FOR [ValorM]
GO
/****** Object:  Default [DF__remplec__Jdd__480696CE]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[remplec] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__remplech__Codigo__48FABB07]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[remplech] ADD  DEFAULT (' ') FOR [Codigo]
GO
/****** Object:  Default [DF__remplech__Ames__49EEDF40]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[remplech] ADD  DEFAULT (' ') FOR [Ames]
GO
/****** Object:  Default [DF__remplech__Codcam__4AE30379]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[remplech] ADD  DEFAULT ((0)) FOR [Codcam]
GO
/****** Object:  Default [DF__remplech__ValorN__4BD727B2]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[remplech] ADD  DEFAULT ((0)) FOR [ValorN]
GO
/****** Object:  Default [DF__remplech__ValorF__4CCB4BEB]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[remplech] ADD  DEFAULT (getdate()) FOR [ValorF]
GO
/****** Object:  Default [DF__remplech__ValorC__4DBF7024]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[remplech] ADD  DEFAULT (' ') FOR [ValorC]
GO
/****** Object:  Default [DF__remplech__ValorM__4EB3945D]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[remplech] ADD  DEFAULT (' ') FOR [ValorM]
GO
/****** Object:  Default [DF__remplech__Jdd__4FA7B896]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[remplech] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__REMPLEPER__Rut__509BDCCF]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[REMPLEPER] ADD  DEFAULT (' ') FOR [Rut]
GO
/****** Object:  Default [DF__REMPLEPER__Empre__51900108]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[REMPLEPER] ADD  DEFAULT (' ') FOR [Empresa]
GO
/****** Object:  Default [DF__REMPLEPER__Ktim__52842541]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[REMPLEPER] ADD  DEFAULT ((0)) FOR [Ktim]
GO
/****** Object:  Default [DF__REMPLEPER__Ksip__5378497A]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[REMPLEPER] ADD  DEFAULT ((0)) FOR [Ksip]
GO
/****** Object:  Default [DF__REMPLEPER__ksaim__546C6DB3]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[REMPLEPER] ADD  DEFAULT ((0)) FOR [ksaim]
GO
/****** Object:  Default [DF__REMPLEPER__kspue__556091EC]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[REMPLEPER] ADD  DEFAULT ((0)) FOR [kspue]
GO
/****** Object:  Default [DF__REMPLEPER__kafes__5654B625]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[REMPLEPER] ADD  DEFAULT ((0)) FOR [kafesec]
GO
/****** Object:  Default [DF__REMPLEPER__kgl25__5748DA5E]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[REMPLEPER] ADD  DEFAULT ((0)) FOR [kgl25]
GO
/****** Object:  Default [DF__REMPLEPER__Jdd__583CFE97]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[REMPLEPER] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__REMPLES__Codigo__593122D0]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (' ') FOR [Codigo]
GO
/****** Object:  Default [DF__REMPLES__Estado__5A254709]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (' ') FOR [Estado]
GO
/****** Object:  Default [DF__REMPLES__NFicha__5B196B42]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT ((0)) FOR [NFicha]
GO
/****** Object:  Default [DF__REMPLES__EsFpri__5C0D8F7B]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (' ') FOR [EsFpri]
GO
/****** Object:  Default [DF__REMPLES__Tiprem__5D01B3B4]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (' ') FOR [Tiprem]
GO
/****** Object:  Default [DF__REMPLES__Empresa__5DF5D7ED]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (' ') FOR [Empresa]
GO
/****** Object:  Default [DF__REMPLES__Nombre__5EE9FC26]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (' ') FOR [Nombre]
GO
/****** Object:  Default [DF__REMPLES__Rut__5FDE205F]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (' ') FOR [Rut]
GO
/****** Object:  Default [DF__REMPLES__Sexo__60D24498]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (' ') FOR [Sexo]
GO
/****** Object:  Default [DF__REMPLES__Direcci__61C668D1]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (' ') FOR [Direccion]
GO
/****** Object:  Default [DF__REMPLES__Fono__62BA8D0A]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (' ') FOR [Fono]
GO
/****** Object:  Default [DF__REMPLES__Fecha_n__63AEB143]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [Fecha_nac]
GO
/****** Object:  Default [DF__REMPLES__Nacion__64A2D57C]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT ((0)) FOR [Nacion]
GO
/****** Object:  Default [DF__REMPLES__Celular__6596F9B5]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (' ') FOR [Celular]
GO
/****** Object:  Default [DF__REMPLES__Est_civ__668B1DEE]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (' ') FOR [Est_civil]
GO
/****** Object:  Default [DF__REMPLES__Estudio__677F4227]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT ((0)) FOR [Estudios]
GO
/****** Object:  Default [DF__REMPLES__Titulo__68736660]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT ((0)) FOR [Titulo]
GO
/****** Object:  Default [DF__REMPLES__Clase__69678A99]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT ((0)) FOR [Clase]
GO
/****** Object:  Default [DF__REMPLES__Idiomas__6A5BAED2]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT ((0)) FOR [Idiomas]
GO
/****** Object:  Default [DF__REMPLES__Renmax__6B4FD30B]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT ((0)) FOR [Renmax]
GO
/****** Object:  Default [DF__REMPLES__Autopas__6C43F744]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (' ') FOR [Autopas]
GO
/****** Object:  Default [DF__REMPLES__pmail__6D381B7D]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (' ') FOR [pmail]
GO
/****** Object:  Default [DF__REMPLES__Fecha_i__6E2C3FB6]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [Fecha_ing]
GO
/****** Object:  Default [DF__REMPLES__Tipo_do__6F2063EF]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT ((0)) FOR [Tipo_doc]
GO
/****** Object:  Default [DF__REMPLES__Numdoc__70148828]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (' ') FOR [Numdoc]
GO
/****** Object:  Default [DF__REMPLES__Jefe__7108AC61]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (' ') FOR [Jefe]
GO
/****** Object:  Default [DF__REMPLES__Autoriz__71FCD09A]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (' ') FOR [Autoriza]
GO
/****** Object:  Default [DF__REMPLES__Fecha_r__72F0F4D3]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [Fecha_ret]
GO
/****** Object:  Default [DF__REMPLES__Moti_re__73E5190C]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT ((0)) FOR [Moti_ret]
GO
/****** Object:  Default [DF__REMPLES__Fecha_x__74D93D45]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [Fecha_xtr]
GO
/****** Object:  Default [DF__REMPLES__Cencos__75CD617E]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT ((0)) FOR [Cencos]
GO
/****** Object:  Default [DF__REMPLES__Ticen__76C185B7]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (' ') FOR [Ticen]
GO
/****** Object:  Default [DF__REMPLES__Catego__77B5A9F0]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT ((0)) FOR [Catego]
GO
/****** Object:  Default [DF__REMPLES__Clasif__78A9CE29]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT ((0)) FOR [Clasif]
GO
/****** Object:  Default [DF__REMPLES__Ubica__799DF262]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT ((0)) FOR [Ubica]
GO
/****** Object:  Default [DF__REMPLES__Lpago__7A92169B]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT ((0)) FOR [Lpago]
GO
/****** Object:  Default [DF__REMPLES__Cargo__7B863AD4]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT ((0)) FOR [Cargo]
GO
/****** Object:  Default [DF__REMPLES__Ocupaci__7C7A5F0D]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (' ') FOR [Ocupacion]
GO
/****** Object:  Default [DF__REMPLES__CodOcup__7D6E8346]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT ((0)) FOR [CodOcupa]
GO
/****** Object:  Default [DF__REMPLES__Grado__7E62A77F]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT ((0)) FOR [Grado]
GO
/****** Object:  Default [DF__REMPLES__Divisio__7F56CBB8]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT ((0)) FOR [Division]
GO
/****** Object:  Default [DF__REMPLES__Unidad__004AEFF1]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT ((0)) FOR [Unidad]
GO
/****** Object:  Default [DF__REMPLES__Horario__013F142A]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT ((0)) FOR [Horario]
GO
/****** Object:  Default [DF__REMPLES__Conveni__02333863]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT ((0)) FOR [Convenio]
GO
/****** Object:  Default [DF__REMPLES__Confid__03275C9C]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (' ') FOR [Confid]
GO
/****** Object:  Default [DF__REMPLES__Seccion__041B80D5]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT ((0)) FOR [Seccion]
GO
/****** Object:  Default [DF__REMPLES__Sit_lab__050FA50E]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT ((0)) FOR [Sit_lab]
GO
/****** Object:  Default [DF__REMPLES__CARNET__0603C947]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (' ') FOR [CARNET]
GO
/****** Object:  Default [DF__REMPLES__Fpago__06F7ED80]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT ((0)) FOR [Fpago]
GO
/****** Object:  Default [DF__REMPLES__Fpago2__07EC11B9]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT ((0)) FOR [Fpago2]
GO
/****** Object:  Default [DF__REMPLES__Banco__08E035F2]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT ((0)) FOR [Banco]
GO
/****** Object:  Default [DF__REMPLES__Banco2__09D45A2B]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT ((0)) FOR [Banco2]
GO
/****** Object:  Default [DF__REMPLES__Cta_cor__0AC87E64]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (' ') FOR [Cta_corr]
GO
/****** Object:  Default [DF__REMPLES__Cta_cor__0BBCA29D]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (' ') FOR [Cta_corr2]
GO
/****** Object:  Default [DF__REMPLES__Cta_int__0CB0C6D6]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (' ') FOR [Cta_inter]
GO
/****** Object:  Default [DF__REMPLES__Cta_int__0DA4EB0F]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (' ') FOR [Cta_inte2]
GO
/****** Object:  Default [DF__REMPLES__Ffp__0E990F48]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT ((0)) FOR [Ffp]
GO
/****** Object:  Default [DF__REMPLES__Ffp2__0F8D3381]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT ((0)) FOR [Ffp2]
GO
/****** Object:  Default [DF__REMPLES__Ofiban__108157BA]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT ((0)) FOR [Ofiban]
GO
/****** Object:  Default [DF__REMPLES__Ofiban2__11757BF3]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT ((0)) FOR [Ofiban2]
GO
/****** Object:  Default [DF__REMPLES__Fp2Bene__1269A02C]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT ((0)) FOR [Fp2Benef]
GO
/****** Object:  Default [DF__REMPLES__Talla_r__135DC465]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (' ') FOR [Talla_r]
GO
/****** Object:  Default [DF__REMPLES__Talla_z__1451E89E]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (' ') FOR [Talla_z]
GO
/****** Object:  Default [DF__REMPLES__Cod_afp__15460CD7]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT ((0)) FOR [Cod_afp]
GO
/****** Object:  Default [DF__REMPLES__Numafp__163A3110]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (' ') FOR [Numafp]
GO
/****** Object:  Default [DF__REMPLES__Fecha_a__172E5549]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [Fecha_afp]
GO
/****** Object:  Default [DF__REMPLES__Cod_sin__18227982]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT ((0)) FOR [Cod_sin]
GO
/****** Object:  Default [DF__REMPLES__Cod_isa__19169DBB]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT ((0)) FOR [Cod_isa]
GO
/****** Object:  Default [DF__REMPLES__Fun__1A0AC1F4]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (' ') FOR [Fun]
GO
/****** Object:  Default [DF__REMPLES__Fecha_i__1AFEE62D]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [Fecha_isa]
GO
/****** Object:  Default [DF__REMPLES__Cod_ine__1BF30A66]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT ((0)) FOR [Cod_ine]
GO
/****** Object:  Default [DF__REMPLES__Cod_caj__1CE72E9F]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT ((0)) FOR [Cod_caj]
GO
/****** Object:  Default [DF__REMPLES__Zonafa__1DDB52D8]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT ((0)) FOR [Zonafa]
GO
/****** Object:  Default [DF__REMPLES__Tramo_c__1ECF7711]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT ((0)) FOR [Tramo_car]
GO
/****** Object:  Default [DF__REMPLES__Cod_reg__1FC39B4A]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT ((0)) FOR [Cod_reg]
GO
/****** Object:  Default [DF__REMPLES__Jubila__20B7BF83]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (' ') FOR [Jubila]
GO
/****** Object:  Default [DF__REMPLES__Fecha_v__21ABE3BC]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [Fecha_vac]
GO
/****** Object:  Default [DF__REMPLES__Vac_for__22A007F5]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (' ') FOR [Vac_form]
GO
/****** Object:  Default [DF__REMPLES__Vac_anr__23942C2E]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT ((0)) FOR [Vac_anre]
GO
/****** Object:  Default [DF__REMPLES__Fecha_r__24885067]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [Fecha_rea]
GO
/****** Object:  Default [DF__REMPLES__Vac_ini__257C74A0]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT ((0)) FOR [Vac_ini]
GO
/****** Object:  Default [DF__REMPLES__Vac_bas__267098D9]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT ((0)) FOR [Vac_base]
GO
/****** Object:  Default [DF__REMPLES__Asigfam__2764BD12]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (' ') FOR [Asigfam]
GO
/****** Object:  Default [DF__REMPLES__Fecha_l__2858E14B]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [Fecha_lic]
GO
/****** Object:  Default [DF__REMPLES__Anexo__294D0584]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT ((0)) FOR [Anexo]
GO
/****** Object:  Default [DF__REMPLES__Apc__2A4129BD]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (' ') FOR [Apc]
GO
/****** Object:  Default [DF__REMPLES__SiAus__2B354DF6]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (' ') FOR [SiAus]
GO
/****** Object:  Default [DF__REMPLES__Monto_r__2C29722F]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT ((0)) FOR [Monto_red]
GO
/****** Object:  Default [DF__REMPLES__Monto_s__2D1D9668]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT ((0)) FOR [Monto_sgr]
GO
/****** Object:  Default [DF__REMPLES__Ktim__2E11BAA1]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT ((0)) FOR [Ktim]
GO
/****** Object:  Default [DF__REMPLES__Antica__2F05DEDA]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT ((0)) FOR [Antica]
GO
/****** Object:  Default [DF__REMPLES__Diastr__2FFA0313]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT ((0)) FOR [Diastr]
GO
/****** Object:  Default [DF__REMPLES__Diasli__30EE274C]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT ((0)) FOR [Diasli]
GO
/****** Object:  Default [DF__REMPLES__Sen_niv__31E24B85]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT ((0)) FOR [Sen_niv]
GO
/****** Object:  Default [DF__REMPLES__Sen_fra__32D66FBE]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT ((0)) FOR [Sen_fra]
GO
/****** Object:  Default [DF__REMPLES__Bloques__33CA93F7]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (' ') FOR [Bloques]
GO
/****** Object:  Default [DF__REMPLES__TopeLey__34BEB830]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT ((0)) FOR [TopeLey]
GO
/****** Object:  Default [DF__REMPLES__GradoC__35B2DC69]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT ((0)) FOR [GradoC]
GO
/****** Object:  Default [DF__REMPLES__Fecha_g__36A700A2]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [Fecha_gra]
GO
/****** Object:  Default [DF__REMPLES__NumTar__379B24DB]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT ((0)) FOR [NumTar]
GO
/****** Object:  Default [DF__REMPLES__L18566__388F4914]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (' ') FOR [L18566]
GO
/****** Object:  Default [DF__REMPLES__Lpacot__39836D4D]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (' ') FOR [Lpacot]
GO
/****** Object:  Default [DF__REMPLES__Cuenta__3A779186]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT ((0)) FOR [Cuenta]
GO
/****** Object:  Default [DF__REMPLES__RegPag__3B6BB5BF]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (' ') FOR [RegPag]
GO
/****** Object:  Default [DF__REMPLES__Trapes__3C5FD9F8]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT ((0)) FOR [Trapes]
GO
/****** Object:  Default [DF__REMPLES__Horas__3D53FE31]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT ((0)) FOR [Horas]
GO
/****** Object:  Default [DF__REMPLES__Licmed__3E48226A]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (' ') FOR [Licmed]
GO
/****** Object:  Default [DF__REMPLES__Trespd__3F3C46A3]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (' ') FOR [Trespd]
GO
/****** Object:  Default [DF__REMPLES__Subsil__40306ADC]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (' ') FOR [Subsil]
GO
/****** Object:  Default [DF__REMPLES__reblim__41248F15]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (' ') FOR [reblim]
GO
/****** Object:  Default [DF__REMPLES__Manliq__4218B34E]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (' ') FOR [Manliq]
GO
/****** Object:  Default [DF__REMPLES__Fecha_m__430CD787]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [Fecha_mod]
GO
/****** Object:  Default [DF__REMPLES__Ames__4400FBC0]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (' ') FOR [Ames]
GO
/****** Object:  Default [DF__REMPLES__Sdato__44F51FF9]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (' ') FOR [Sdato]
GO
/****** Object:  Default [DF__REMPLES__Credenc__45E94432]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (' ') FOR [Credenc]
GO
/****** Object:  Default [DF__REMPLES__Ticket__46DD686B]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (' ') FOR [Ticket]
GO
/****** Object:  Default [DF__REMPLES__Fecha_s__47D18CA4]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [Fecha_sec]
GO
/****** Object:  Default [DF__REMPLES__Tipcon__48C5B0DD]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (' ') FOR [Tipcon]
GO
/****** Object:  Default [DF__REMPLES__Cheres__49B9D516]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (' ') FOR [Cheres]
GO
/****** Object:  Default [DF__REMPLES__Chenum__4AADF94F]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT ((0)) FOR [Chenum]
GO
/****** Object:  Default [DF__REMPLES__Cheval__4BA21D88]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT ((0)) FOR [Cheval]
GO
/****** Object:  Default [DF__REMPLES__Peri__4C9641C1]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (' ') FOR [Peri]
GO
/****** Object:  Default [DF__REMPLES__Sicontr__4D8A65FA]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (' ') FOR [Sicontra]
GO
/****** Object:  Default [DF__REMPLES__fecha_r__4E7E8A33]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [fecha_rct]
GO
/****** Object:  Default [DF__REMPLES__Evaluad__4F72AE6C]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (' ') FOR [Evaluador]
GO
/****** Object:  Default [DF__REMPLES__Esrecon__5066D2A5]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (' ') FOR [Esrecon]
GO
/****** Object:  Default [DF__REMPLES__IndMont__515AF6DE]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT ((0)) FOR [IndMonto]
GO
/****** Object:  Default [DF__REMPLES__IndDias__524F1B17]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT ((0)) FOR [IndDias]
GO
/****** Object:  Default [DF__REMPLES__FechaAp__53433F50]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [FechaApvc]
GO
/****** Object:  Default [DF__REMPLES__EstApvc__54376389]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (' ') FOR [EstApvc]
GO
/****** Object:  Default [DF__REMPLES__UserAD__552B87C2]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (' ') FOR [UserAD]
GO
/****** Object:  Default [DF__REMPLES__FechaSj__561FABFB]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [FechaSjov]
GO
/****** Object:  Default [DF__REMPLES__Jornada__5713D034]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (' ') FOR [Jornada]
GO
/****** Object:  Default [DF__REMPLES__Sdato2__5807F46D]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (' ') FOR [Sdato2]
GO
/****** Object:  Default [DF__REMPLES__JorCont__58FC18A6]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (' ') FOR [JorCont]
GO
/****** Object:  Default [DF__REMPLES__PlanOS__59F03CDF]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT ((0)) FOR [PlanOS]
GO
/****** Object:  Default [DF__REMPLES__PreSalu__5AE46118]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT ((0)) FOR [PreSalud]
GO
/****** Object:  Default [DF__REMPLES__Pjortm__5BD88551]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (' ') FOR [Pjortm]
GO
/****** Object:  Default [DF__REMPLES__Psujhn__5CCCA98A]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (' ') FOR [Psujhn]
GO
/****** Object:  Default [DF__REMPLES__Ping5t__5DC0CDC3]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (' ') FOR [Ping5t]
GO
/****** Object:  Default [DF__REMPLES__Pafisp__5EB4F1FC]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (' ') FOR [Pafisp]
GO
/****** Object:  Default [DF__REMPLES__Pdisca__5FA91635]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (' ') FOR [Pdisca]
GO
/****** Object:  Default [DF__REMPLES__P5taex__609D3A6E]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (' ') FOR [P5taex]
GO
/****** Object:  Default [DF__REMPLES__Pmadres__61915EA7]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (' ') FOR [Pmadres]
GO
/****** Object:  Default [DF__REMPLES__Pindom__628582E0]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (' ') FOR [Pindom]
GO
/****** Object:  Default [DF__REMPLES__Premint__6379A719]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (' ') FOR [Premint]
GO
/****** Object:  Default [DF__REMPLES__PorcUni__646DCB52]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT ((0)) FOR [PorcUnif]
GO
/****** Object:  Default [DF__REMPLES__Dir_tra__6561EF8B]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT ((0)) FOR [Dir_trab]
GO
/****** Object:  Default [DF__REMPLES__Cod_dni__665613C4]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT ((0)) FOR [Cod_dni]
GO
/****** Object:  Default [DF__REMPLES__Fecha_u__674A37FD]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(120)),(120))) FOR [Fecha_ult]
GO
/****** Object:  Default [DF__REMPLES__Jdd__683E5C36]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__REMPLES__AutFirm__6932806F]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (' ') FOR [AutFirmar]
GO
/****** Object:  Default [DF__REMPLES__Cargo_e__6A26A4A8]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT ((0)) FOR [Cargo_est]
GO
/****** Object:  Default [DF__REMPLES__Srsicos__6B1AC8E1]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT ((0)) FOR [Srsicoss]
GO
/****** Object:  Default [DF__REMPLES__Ccsicos__6C0EED1A]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT ((0)) FOR [Ccsicoss]
GO
/****** Object:  Default [DF__REMPLES__PingSt__6D031153]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[REMPLES] ADD  DEFAULT (' ') FOR [PingSt]
GO
/****** Object:  Default [DF__remplesh__Jdd__6DF7358C]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[remplesh] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__remplesh__Codigo__6EEB59C5]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[remplesh] ADD  DEFAULT (' ') FOR [Codigo]
GO
/****** Object:  Default [DF__remplesh__Estado__6FDF7DFE]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[remplesh] ADD  DEFAULT (' ') FOR [Estado]
GO
/****** Object:  Default [DF__remplesh__NFicha__70D3A237]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[remplesh] ADD  DEFAULT ((0)) FOR [NFicha]
GO
/****** Object:  Default [DF__remplesh__EsFpri__71C7C670]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[remplesh] ADD  DEFAULT (' ') FOR [EsFpri]
GO
/****** Object:  Default [DF__remplesh__Tiprem__72BBEAA9]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[remplesh] ADD  DEFAULT (' ') FOR [Tiprem]
GO
/****** Object:  Default [DF__remplesh__Empres__73B00EE2]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[remplesh] ADD  DEFAULT (' ') FOR [Empresa]
GO
/****** Object:  Default [DF__remplesh__Nombre__74A4331B]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[remplesh] ADD  DEFAULT (' ') FOR [Nombre]
GO
/****** Object:  Default [DF__remplesh__Rut__75985754]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[remplesh] ADD  DEFAULT (' ') FOR [Rut]
GO
/****** Object:  Default [DF__remplesh__Sexo__768C7B8D]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[remplesh] ADD  DEFAULT (' ') FOR [Sexo]
GO
/****** Object:  Default [DF__remplesh__Direcc__77809FC6]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[remplesh] ADD  DEFAULT (' ') FOR [Direccion]
GO
/****** Object:  Default [DF__remplesh__Fono__7874C3FF]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[remplesh] ADD  DEFAULT (' ') FOR [Fono]
GO
/****** Object:  Default [DF__remplesh__Fecha___7968E838]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[remplesh] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [Fecha_nac]
GO
/****** Object:  Default [DF__remplesh__Nacion__7A5D0C71]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[remplesh] ADD  DEFAULT ((0)) FOR [Nacion]
GO
/****** Object:  Default [DF__remplesh__Celula__7B5130AA]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[remplesh] ADD  DEFAULT (' ') FOR [Celular]
GO
/****** Object:  Default [DF__remplesh__Est_ci__7C4554E3]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[remplesh] ADD  DEFAULT (' ') FOR [Est_civil]
GO
/****** Object:  Default [DF__remplesh__Estudi__7D39791C]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[remplesh] ADD  DEFAULT ((0)) FOR [Estudios]
GO
/****** Object:  Default [DF__remplesh__Titulo__7E2D9D55]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[remplesh] ADD  DEFAULT ((0)) FOR [Titulo]
GO
/****** Object:  Default [DF__remplesh__Clase__7F21C18E]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[remplesh] ADD  DEFAULT ((0)) FOR [Clase]
GO
/****** Object:  Default [DF__remplesh__Idioma__0015E5C7]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[remplesh] ADD  DEFAULT ((0)) FOR [Idiomas]
GO
/****** Object:  Default [DF__remplesh__Renmax__010A0A00]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[remplesh] ADD  DEFAULT ((0)) FOR [Renmax]
GO
/****** Object:  Default [DF__remplesh__Autopa__01FE2E39]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[remplesh] ADD  DEFAULT (' ') FOR [Autopas]
GO
/****** Object:  Default [DF__remplesh__pmail__02F25272]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[remplesh] ADD  DEFAULT (' ') FOR [pmail]
GO
/****** Object:  Default [DF__remplesh__Fecha___03E676AB]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[remplesh] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [Fecha_ing]
GO
/****** Object:  Default [DF__remplesh__Tipo_d__04DA9AE4]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[remplesh] ADD  DEFAULT ((0)) FOR [Tipo_doc]
GO
/****** Object:  Default [DF__remplesh__Numdoc__05CEBF1D]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[remplesh] ADD  DEFAULT (' ') FOR [Numdoc]
GO
/****** Object:  Default [DF__remplesh__Jefe__06C2E356]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[remplesh] ADD  DEFAULT (' ') FOR [Jefe]
GO
/****** Object:  Default [DF__remplesh__Autori__07B7078F]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[remplesh] ADD  DEFAULT (' ') FOR [Autoriza]
GO
/****** Object:  Default [DF__remplesh__Fecha___08AB2BC8]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[remplesh] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [Fecha_ret]
GO
/****** Object:  Default [DF__remplesh__Moti_r__099F5001]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[remplesh] ADD  DEFAULT ((0)) FOR [Moti_ret]
GO
/****** Object:  Default [DF__remplesh__Fecha___0A93743A]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[remplesh] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [Fecha_xtr]
GO
/****** Object:  Default [DF__remplesh__Cencos__0B879873]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[remplesh] ADD  DEFAULT ((0)) FOR [Cencos]
GO
/****** Object:  Default [DF__remplesh__Ticen__0C7BBCAC]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[remplesh] ADD  DEFAULT (' ') FOR [Ticen]
GO
/****** Object:  Default [DF__remplesh__Catego__0D6FE0E5]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[remplesh] ADD  DEFAULT ((0)) FOR [Catego]
GO
/****** Object:  Default [DF__remplesh__Clasif__0E64051E]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[remplesh] ADD  DEFAULT ((0)) FOR [Clasif]
GO
/****** Object:  Default [DF__remplesh__Ubica__0F582957]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[remplesh] ADD  DEFAULT ((0)) FOR [Ubica]
GO
/****** Object:  Default [DF__remplesh__Lpago__104C4D90]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[remplesh] ADD  DEFAULT ((0)) FOR [Lpago]
GO
/****** Object:  Default [DF__remplesh__Cargo__114071C9]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[remplesh] ADD  DEFAULT ((0)) FOR [Cargo]
GO
/****** Object:  Default [DF__remplesh__Ocupac__12349602]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[remplesh] ADD  DEFAULT (' ') FOR [Ocupacion]
GO
/****** Object:  Default [DF__remplesh__CodOcu__1328BA3B]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[remplesh] ADD  DEFAULT ((0)) FOR [CodOcupa]
GO
/****** Object:  Default [DF__remplesh__Grado__141CDE74]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[remplesh] ADD  DEFAULT ((0)) FOR [Grado]
GO
/****** Object:  Default [DF__remplesh__Divisi__151102AD]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[remplesh] ADD  DEFAULT ((0)) FOR [Division]
GO
/****** Object:  Default [DF__remplesh__Unidad__160526E6]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[remplesh] ADD  DEFAULT ((0)) FOR [Unidad]
GO
/****** Object:  Default [DF__remplesh__Horari__16F94B1F]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[remplesh] ADD  DEFAULT ((0)) FOR [Horario]
GO
/****** Object:  Default [DF__remplesh__Conven__17ED6F58]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[remplesh] ADD  DEFAULT ((0)) FOR [Convenio]
GO
/****** Object:  Default [DF__remplesh__Confid__18E19391]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[remplesh] ADD  DEFAULT (' ') FOR [Confid]
GO
/****** Object:  Default [DF__remplesh__Seccio__19D5B7CA]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[remplesh] ADD  DEFAULT ((0)) FOR [Seccion]
GO
/****** Object:  Default [DF__remplesh__Sit_la__1AC9DC03]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[remplesh] ADD  DEFAULT ((0)) FOR [Sit_lab]
GO
/****** Object:  Default [DF__remplesh__CARNET__1BBE003C]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[remplesh] ADD  DEFAULT (' ') FOR [CARNET]
GO
/****** Object:  Default [DF__remplesh__Fpago__1CB22475]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[remplesh] ADD  DEFAULT ((0)) FOR [Fpago]
GO
/****** Object:  Default [DF__remplesh__Fpago2__1DA648AE]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[remplesh] ADD  DEFAULT ((0)) FOR [Fpago2]
GO
/****** Object:  Default [DF__remplesh__Banco__1E9A6CE7]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[remplesh] ADD  DEFAULT ((0)) FOR [Banco]
GO
/****** Object:  Default [DF__remplesh__Banco2__1F8E9120]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[remplesh] ADD  DEFAULT ((0)) FOR [Banco2]
GO
/****** Object:  Default [DF__remplesh__Cta_co__2082B559]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[remplesh] ADD  DEFAULT (' ') FOR [Cta_corr]
GO
/****** Object:  Default [DF__remplesh__Cta_co__2176D992]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[remplesh] ADD  DEFAULT (' ') FOR [Cta_corr2]
GO
/****** Object:  Default [DF__remplesh__Ffp__226AFDCB]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[remplesh] ADD  DEFAULT ((0)) FOR [Ffp]
GO
/****** Object:  Default [DF__remplesh__Ffp2__235F2204]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[remplesh] ADD  DEFAULT ((0)) FOR [Ffp2]
GO
/****** Object:  Default [DF__remplesh__Ofiban__2453463D]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[remplesh] ADD  DEFAULT ((0)) FOR [Ofiban]
GO
/****** Object:  Default [DF__remplesh__Ofiban__25476A76]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[remplesh] ADD  DEFAULT ((0)) FOR [Ofiban2]
GO
/****** Object:  Default [DF__remplesh__Talla___263B8EAF]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[remplesh] ADD  DEFAULT (' ') FOR [Talla_r]
GO
/****** Object:  Default [DF__remplesh__Talla___272FB2E8]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[remplesh] ADD  DEFAULT (' ') FOR [Talla_z]
GO
/****** Object:  Default [DF__remplesh__Cod_af__2823D721]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[remplesh] ADD  DEFAULT ((0)) FOR [Cod_afp]
GO
/****** Object:  Default [DF__remplesh__Numafp__2917FB5A]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[remplesh] ADD  DEFAULT (' ') FOR [Numafp]
GO
/****** Object:  Default [DF__remplesh__Fecha___2A0C1F93]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[remplesh] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [Fecha_afp]
GO
/****** Object:  Default [DF__remplesh__Cod_si__2B0043CC]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[remplesh] ADD  DEFAULT ((0)) FOR [Cod_sin]
GO
/****** Object:  Default [DF__remplesh__Cod_is__2BF46805]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[remplesh] ADD  DEFAULT ((0)) FOR [Cod_isa]
GO
/****** Object:  Default [DF__remplesh__Fun__2CE88C3E]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[remplesh] ADD  DEFAULT (' ') FOR [Fun]
GO
/****** Object:  Default [DF__remplesh__Fecha___2DDCB077]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[remplesh] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [Fecha_isa]
GO
/****** Object:  Default [DF__remplesh__Cod_in__2ED0D4B0]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[remplesh] ADD  DEFAULT ((0)) FOR [Cod_ine]
GO
/****** Object:  Default [DF__remplesh__Cod_ca__2FC4F8E9]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[remplesh] ADD  DEFAULT ((0)) FOR [Cod_caj]
GO
/****** Object:  Default [DF__remplesh__Zonafa__30B91D22]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[remplesh] ADD  DEFAULT ((0)) FOR [Zonafa]
GO
/****** Object:  Default [DF__remplesh__Tramo___31AD415B]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[remplesh] ADD  DEFAULT ((0)) FOR [Tramo_car]
GO
/****** Object:  Default [DF__remplesh__Cod_re__32A16594]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[remplesh] ADD  DEFAULT ((0)) FOR [Cod_reg]
GO
/****** Object:  Default [DF__remplesh__Jubila__339589CD]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[remplesh] ADD  DEFAULT (' ') FOR [Jubila]
GO
/****** Object:  Default [DF__remplesh__Fecha___3489AE06]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[remplesh] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [Fecha_vac]
GO
/****** Object:  Default [DF__remplesh__Vac_fo__357DD23F]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[remplesh] ADD  DEFAULT (' ') FOR [Vac_form]
GO
/****** Object:  Default [DF__remplesh__Vac_an__3671F678]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[remplesh] ADD  DEFAULT ((0)) FOR [Vac_anre]
GO
/****** Object:  Default [DF__remplesh__Fecha___37661AB1]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[remplesh] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [Fecha_rea]
GO
/****** Object:  Default [DF__remplesh__Vac_in__385A3EEA]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[remplesh] ADD  DEFAULT ((0)) FOR [Vac_ini]
GO
/****** Object:  Default [DF__remplesh__Vac_ba__394E6323]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[remplesh] ADD  DEFAULT ((0)) FOR [Vac_base]
GO
/****** Object:  Default [DF__remplesh__Asigfa__3A42875C]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[remplesh] ADD  DEFAULT (' ') FOR [Asigfam]
GO
/****** Object:  Default [DF__remplesh__Fecha___3B36AB95]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[remplesh] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [Fecha_lic]
GO
/****** Object:  Default [DF__remplesh__Anexo__3C2ACFCE]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[remplesh] ADD  DEFAULT ((0)) FOR [Anexo]
GO
/****** Object:  Default [DF__remplesh__Apc__3D1EF407]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[remplesh] ADD  DEFAULT (' ') FOR [Apc]
GO
/****** Object:  Default [DF__remplesh__SiAus__3E131840]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[remplesh] ADD  DEFAULT (' ') FOR [SiAus]
GO
/****** Object:  Default [DF__remplesh__Monto___3F073C79]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[remplesh] ADD  DEFAULT ((0)) FOR [Monto_red]
GO
/****** Object:  Default [DF__remplesh__Monto___3FFB60B2]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[remplesh] ADD  DEFAULT ((0)) FOR [Monto_sgr]
GO
/****** Object:  Default [DF__remplesh__Ktim__40EF84EB]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[remplesh] ADD  DEFAULT ((0)) FOR [Ktim]
GO
/****** Object:  Default [DF__remplesh__Antica__41E3A924]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[remplesh] ADD  DEFAULT ((0)) FOR [Antica]
GO
/****** Object:  Default [DF__remplesh__Diastr__42D7CD5D]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[remplesh] ADD  DEFAULT ((0)) FOR [Diastr]
GO
/****** Object:  Default [DF__remplesh__Diasli__43CBF196]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[remplesh] ADD  DEFAULT ((0)) FOR [Diasli]
GO
/****** Object:  Default [DF__remplesh__Sen_ni__44C015CF]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[remplesh] ADD  DEFAULT ((0)) FOR [Sen_niv]
GO
/****** Object:  Default [DF__remplesh__Sen_fr__45B43A08]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[remplesh] ADD  DEFAULT ((0)) FOR [Sen_fra]
GO
/****** Object:  Default [DF__remplesh__Bloque__46A85E41]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[remplesh] ADD  DEFAULT (' ') FOR [Bloques]
GO
/****** Object:  Default [DF__remplesh__TopeLe__479C827A]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[remplesh] ADD  DEFAULT ((0)) FOR [TopeLey]
GO
/****** Object:  Default [DF__remplesh__GradoC__4890A6B3]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[remplesh] ADD  DEFAULT ((0)) FOR [GradoC]
GO
/****** Object:  Default [DF__remplesh__Fecha___4984CAEC]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[remplesh] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [Fecha_gra]
GO
/****** Object:  Default [DF__remplesh__NumTar__4A78EF25]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[remplesh] ADD  DEFAULT ((0)) FOR [NumTar]
GO
/****** Object:  Default [DF__remplesh__L18566__4B6D135E]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[remplesh] ADD  DEFAULT (' ') FOR [L18566]
GO
/****** Object:  Default [DF__remplesh__Lpacot__4C613797]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[remplesh] ADD  DEFAULT (' ') FOR [Lpacot]
GO
/****** Object:  Default [DF__remplesh__Cuenta__4D555BD0]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[remplesh] ADD  DEFAULT ((0)) FOR [Cuenta]
GO
/****** Object:  Default [DF__remplesh__RegPag__4E498009]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[remplesh] ADD  DEFAULT (' ') FOR [RegPag]
GO
/****** Object:  Default [DF__remplesh__Trapes__4F3DA442]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[remplesh] ADD  DEFAULT ((0)) FOR [Trapes]
GO
/****** Object:  Default [DF__remplesh__Horas__5031C87B]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[remplesh] ADD  DEFAULT ((0)) FOR [Horas]
GO
/****** Object:  Default [DF__remplesh__Licmed__5125ECB4]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[remplesh] ADD  DEFAULT (' ') FOR [Licmed]
GO
/****** Object:  Default [DF__remplesh__Trespd__521A10ED]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[remplesh] ADD  DEFAULT (' ') FOR [Trespd]
GO
/****** Object:  Default [DF__remplesh__Subsil__530E3526]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[remplesh] ADD  DEFAULT (' ') FOR [Subsil]
GO
/****** Object:  Default [DF__remplesh__reblim__5402595F]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[remplesh] ADD  DEFAULT (' ') FOR [reblim]
GO
/****** Object:  Default [DF__remplesh__Manliq__54F67D98]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[remplesh] ADD  DEFAULT (' ') FOR [Manliq]
GO
/****** Object:  Default [DF__remplesh__Fecha___55EAA1D1]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[remplesh] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [Fecha_mod]
GO
/****** Object:  Default [DF__remplesh__Ames__56DEC60A]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[remplesh] ADD  DEFAULT (' ') FOR [Ames]
GO
/****** Object:  Default [DF__remplesh__Sdato__57D2EA43]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[remplesh] ADD  DEFAULT (' ') FOR [Sdato]
GO
/****** Object:  Default [DF__remplesh__Creden__58C70E7C]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[remplesh] ADD  DEFAULT (' ') FOR [Credenc]
GO
/****** Object:  Default [DF__remplesh__Ticket__59BB32B5]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[remplesh] ADD  DEFAULT (' ') FOR [Ticket]
GO
/****** Object:  Default [DF__remplesh__Fecha___5AAF56EE]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[remplesh] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [Fecha_sec]
GO
/****** Object:  Default [DF__remplesh__Tipcon__5BA37B27]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[remplesh] ADD  DEFAULT (' ') FOR [Tipcon]
GO
/****** Object:  Default [DF__remplesh__Cheres__5C979F60]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[remplesh] ADD  DEFAULT (' ') FOR [Cheres]
GO
/****** Object:  Default [DF__remplesh__Chenum__5D8BC399]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[remplesh] ADD  DEFAULT ((0)) FOR [Chenum]
GO
/****** Object:  Default [DF__remplesh__Cheval__5E7FE7D2]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[remplesh] ADD  DEFAULT ((0)) FOR [Cheval]
GO
/****** Object:  Default [DF__remplesh__Peri__5F740C0B]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[remplesh] ADD  DEFAULT (' ') FOR [Peri]
GO
/****** Object:  Default [DF__remplesh__Sicont__60683044]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[remplesh] ADD  DEFAULT (' ') FOR [Sicontra]
GO
/****** Object:  Default [DF__remplesh__fecha___615C547D]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[remplesh] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [fecha_rct]
GO
/****** Object:  Default [DF__remplesh__Evalua__625078B6]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[remplesh] ADD  DEFAULT (' ') FOR [Evaluador]
GO
/****** Object:  Default [DF__remplesh__Esreco__63449CEF]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[remplesh] ADD  DEFAULT (' ') FOR [Esrecon]
GO
/****** Object:  Default [DF__remplesh__IndMon__6438C128]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[remplesh] ADD  DEFAULT ((0)) FOR [IndMonto]
GO
/****** Object:  Default [DF__remplesh__IndDia__652CE561]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[remplesh] ADD  DEFAULT ((0)) FOR [IndDias]
GO
/****** Object:  Default [DF__remplesh__FechaA__6621099A]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[remplesh] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [FechaApvc]
GO
/****** Object:  Default [DF__remplesh__EstApv__67152DD3]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[remplesh] ADD  DEFAULT (' ') FOR [EstApvc]
GO
/****** Object:  Default [DF__remplesh__UserAD__6809520C]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[remplesh] ADD  DEFAULT (' ') FOR [UserAD]
GO
/****** Object:  Default [DF__remplesh__FechaS__68FD7645]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[remplesh] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [FechaSjov]
GO
/****** Object:  Default [DF__remplesh__Jornad__69F19A7E]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[remplesh] ADD  DEFAULT (' ') FOR [Jornada]
GO
/****** Object:  Default [DF__remplesh__Sdato2__6AE5BEB7]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[remplesh] ADD  DEFAULT (' ') FOR [Sdato2]
GO
/****** Object:  Default [DF__remplesh__JorCon__6BD9E2F0]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[remplesh] ADD  DEFAULT (' ') FOR [JorCont]
GO
/****** Object:  Default [DF__remplesh__Pjortm__6CCE0729]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[remplesh] ADD  DEFAULT (' ') FOR [Pjortm]
GO
/****** Object:  Default [DF__remplesh__Psujhn__6DC22B62]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[remplesh] ADD  DEFAULT (' ') FOR [Psujhn]
GO
/****** Object:  Default [DF__remplesh__PingSt__6EB64F9B]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[remplesh] ADD  DEFAULT (' ') FOR [PingSt]
GO
/****** Object:  Default [DF__remplesh__Pafisp__6FAA73D4]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[remplesh] ADD  DEFAULT (' ') FOR [Pafisp]
GO
/****** Object:  Default [DF__remplesh__Pdisca__709E980D]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[remplesh] ADD  DEFAULT (' ') FOR [Pdisca]
GO
/****** Object:  Default [DF__remplesh__P5taex__7192BC46]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[remplesh] ADD  DEFAULT (' ') FOR [P5taex]
GO
/****** Object:  Default [DF__remplesh__Pmadre__7286E07F]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[remplesh] ADD  DEFAULT (' ') FOR [Pmadres]
GO
/****** Object:  Default [DF__remplesh__Pindom__737B04B8]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[remplesh] ADD  DEFAULT (' ') FOR [Pindom]
GO
/****** Object:  Default [DF__remplesh__cta_in__746F28F1]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[remplesh] ADD  DEFAULT (' ') FOR [cta_inter]
GO
/****** Object:  Default [DF__remplesh__cta_in__75634D2A]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[remplesh] ADD  DEFAULT (' ') FOR [cta_inte2]
GO
/****** Object:  Default [DF__remplesh__dir_tr__76577163]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[remplesh] ADD  DEFAULT ((0)) FOR [dir_trab]
GO
/****** Object:  Default [DF__remplesh__fp2ben__774B959C]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[remplesh] ADD  DEFAULT ((0)) FOR [fp2benef]
GO
/****** Object:  Default [DF__remplesh__AutFir__783FB9D5]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[remplesh] ADD  DEFAULT (' ') FOR [AutFirmar]
GO
/****** Object:  Default [DF__remplesh__Premin__7933DE0E]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[remplesh] ADD  DEFAULT (' ') FOR [Premint]
GO
/****** Object:  Default [DF__remplesh__PorcUn__7A280247]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[remplesh] ADD  DEFAULT ((0)) FOR [PorcUnif]
GO
/****** Object:  Default [DF__remplesh__Cod_dn__7B1C2680]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[remplesh] ADD  DEFAULT ((0)) FOR [Cod_dni]
GO
/****** Object:  Default [DF__remplesh__Fecha___7C104AB9]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[remplesh] ADD  DEFAULT (getdate()) FOR [Fecha_ult]
GO
/****** Object:  Default [DF__remplesh__Cargo___7D046EF2]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[remplesh] ADD  DEFAULT ((0)) FOR [Cargo_est]
GO
/****** Object:  Default [DF__remplesh__Srsico__7DF8932B]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[remplesh] ADD  DEFAULT ((0)) FOR [Srsicoss]
GO
/****** Object:  Default [DF__remplesh__Ccsico__7EECB764]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[remplesh] ADD  DEFAULT ((0)) FOR [Ccsicoss]
GO
/****** Object:  Default [DF__rempresa__Empres__7FE0DB9D]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[rempresa] ADD  DEFAULT (' ') FOR [Empresa]
GO
/****** Object:  Default [DF__rempresa__Nombre__00D4FFD6]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[rempresa] ADD  DEFAULT (' ') FOR [Nombre]
GO
/****** Object:  Default [DF__rempresa__Rut__01C9240F]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[rempresa] ADD  DEFAULT (' ') FOR [Rut]
GO
/****** Object:  Default [DF__rempresa__Direcc__02BD4848]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[rempresa] ADD  DEFAULT (' ') FOR [Direccion]
GO
/****** Object:  Default [DF__rempresa__Fono__03B16C81]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[rempresa] ADD  DEFAULT (' ') FOR [Fono]
GO
/****** Object:  Default [DF__rempresa__Activi__04A590BA]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[rempresa] ADD  DEFAULT (' ') FOR [Activi]
GO
/****** Object:  Default [DF__rempresa__Repleg__0599B4F3]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[rempresa] ADD  DEFAULT (' ') FOR [Repleg]
GO
/****** Object:  Default [DF__rempresa__Coafil__068DD92C]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[rempresa] ADD  DEFAULT ((0)) FOR [Coafil]
GO
/****** Object:  Default [DF__rempresa__Mutual__0781FD65]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[rempresa] ADD  DEFAULT (' ') FOR [Mutual]
GO
/****** Object:  Default [DF__rempresa__Cacomp__0876219E]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[rempresa] ADD  DEFAULT (' ') FOR [Cacomp]
GO
/****** Object:  Default [DF__rempresa__Fecha___096A45D7]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[rempresa] ADD  DEFAULT (getdate()) FOR [Fecha_ini]
GO
/****** Object:  Default [DF__rempresa__Ingbru__0A5E6A10]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[rempresa] ADD  DEFAULT (' ') FOR [Ingbru]
GO
/****** Object:  Default [DF__rempresa__Diradm__0B528E49]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[rempresa] ADD  DEFAULT (' ') FOR [Diradm]
GO
/****** Object:  Default [DF__rempresa__Fax__0C46B282]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[rempresa] ADD  DEFAULT (' ') FOR [Fax]
GO
/****** Object:  Default [DF__rempresa__Email__0D3AD6BB]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[rempresa] ADD  DEFAULT (' ') FOR [Email]
GO
/****** Object:  Default [DF__rempresa__RutRep__0E2EFAF4]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[rempresa] ADD  DEFAULT (' ') FOR [RutRep]
GO
/****** Object:  Default [DF__rempresa__Comut__0F231F2D]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[rempresa] ADD  DEFAULT ((0)) FOR [Comut]
GO
/****** Object:  Default [DF__rempresa__Jdd__10174366]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[rempresa] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__rempresa__Giro__110B679F]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[rempresa] ADD  DEFAULT (' ') FOR [Giro]
GO
/****** Object:  Default [DF__rempresa__Junaeb__11FF8BD8]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[rempresa] ADD  DEFAULT (' ') FOR [Junaeb]
GO
/****** Object:  Default [DF__rempresa__mailRR__12F3B011]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[rempresa] ADD  DEFAULT (' ') FOR [mailRRHH]
GO
/****** Object:  Default [DF__rempresa__mailRe__13E7D44A]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[rempresa] ADD  DEFAULT (' ') FOR [mailRegi]
GO
/****** Object:  Default [DF__rempresa__Firman__14DBF883]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[rempresa] ADD  DEFAULT (' ') FOR [Firmante]
GO
/****** Object:  Default [DF__rempresa__AutRRH__15D01CBC]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[rempresa] ADD  DEFAULT (' ') FOR [AutRRHH]
GO
/****** Object:  Default [DF__rempresa__Tipoem__16C440F5]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[rempresa] ADD  DEFAULT (' ') FOR [Tipoemp]
GO
/****** Object:  Default [DF__rempresa__estatu__17B8652E]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[rempresa] ADD  DEFAULT (' ') FOR [estatuto]
GO
/****** Object:  Default [DF__rempresa__CodAct__18AC8967]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[rempresa] ADD  DEFAULT (' ') FOR [CodAct]
GO
/****** Object:  Default [DF__rempresa__CalTra__19A0ADA0]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[rempresa] ADD  DEFAULT (' ') FOR [CalTrab]
GO
/****** Object:  Default [DF__rempresa__lusuar__1A94D1D9]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[rempresa] ADD  DEFAULT (' ') FOR [lusuario]
GO
/****** Object:  Default [DF__rempresa__lclave__1B88F612]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[rempresa] ADD  DEFAULT (' ') FOR [lclave]
GO
/****** Object:  Default [DF__rempresa__sisafp__1C7D1A4B]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[rempresa] ADD  DEFAULT (' ') FOR [sisafp]
GO
/****** Object:  Default [DF__rempresa__ApvcPL__1D713E84]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[rempresa] ADD  DEFAULT ((0)) FOR [ApvcPL]
GO
/****** Object:  Default [DF__rempresa__ApvcPR__1E6562BD]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[rempresa] ADD  DEFAULT ((0)) FOR [ApvcPR]
GO
/****** Object:  Default [DF__rempresa__desc_a__1F5986F6]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[rempresa] ADD  DEFAULT (' ') FOR [desc_act]
GO
/****** Object:  Default [DF__rempresa__UserWS__204DAB2F]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[rempresa] ADD  DEFAULT (' ') FOR [UserWSCon]
GO
/****** Object:  Default [DF__rempresa__PassWS__2141CF68]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[rempresa] ADD  DEFAULT (' ') FOR [PassWSCon]
GO
/****** Object:  Default [DF__rempresa__Nit__2235F3A1]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[rempresa] ADD  DEFAULT (' ') FOR [Nit]
GO
/****** Object:  Default [DF__rempresa__IdAdp__232A17DA]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[rempresa] ADD  DEFAULT (' ') FOR [IdAdp]
GO
/****** Object:  Default [DF__rempresa__Nrores__241E3C13]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[rempresa] ADD  DEFAULT (' ') FOR [Nroresrd]
GO
/****** Object:  Default [DF__RENCAPA__Curso__2512604C]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RENCAPA] ADD  DEFAULT (' ') FOR [Curso]
GO
/****** Object:  Default [DF__RENCAPA__Codigo__26068485]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RENCAPA] ADD  DEFAULT (' ') FOR [Codigo]
GO
/****** Object:  Default [DF__RENCAPA__Rut__26FAA8BE]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RENCAPA] ADD  DEFAULT (' ') FOR [Rut]
GO
/****** Object:  Default [DF__RENCAPA__Situ__27EECCF7]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RENCAPA] ADD  DEFAULT (' ') FOR [Situ]
GO
/****** Object:  Default [DF__RENCAPA__Fecha_i__28E2F130]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RENCAPA] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [Fecha_ini]
GO
/****** Object:  Default [DF__RENCAPA__Fecha_t__29D71569]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RENCAPA] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [Fecha_ter]
GO
/****** Object:  Default [DF__RENCAPA__Tipo__2ACB39A2]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RENCAPA] ADD  DEFAULT (' ') FOR [Tipo]
GO
/****** Object:  Default [DF__RENCAPA__Asisten__2BBF5DDB]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RENCAPA] ADD  DEFAULT ((0)) FOR [Asisten]
GO
/****** Object:  Default [DF__RENCAPA__Aproba__2CB38214]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RENCAPA] ADD  DEFAULT (' ') FOR [Aproba]
GO
/****** Object:  Default [DF__RENCAPA__Obs__2DA7A64D]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RENCAPA] ADD  DEFAULT (' ') FOR [Obs]
GO
/****** Object:  Default [DF__RENCAPA__Puntaje__2E9BCA86]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RENCAPA] ADD  DEFAULT ((0)) FOR [Puntaje]
GO
/****** Object:  Default [DF__RENCAPA__Causen__2F8FEEBF]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RENCAPA] ADD  DEFAULT ((0)) FOR [Causen]
GO
/****** Object:  Default [DF__RENCAPA__Lugar__308412F8]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RENCAPA] ADD  DEFAULT (' ') FOR [Lugar]
GO
/****** Object:  Default [DF__RENCAPA__Horas__31783731]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RENCAPA] ADD  DEFAULT ((0)) FOR [Horas]
GO
/****** Object:  Default [DF__RENCAPA__Ubicas__326C5B6A]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RENCAPA] ADD  DEFAULT (' ') FOR [Ubicas]
GO
/****** Object:  Default [DF__RENCAPA__Direcci__33607FA3]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RENCAPA] ADD  DEFAULT (' ') FOR [Direccion]
GO
/****** Object:  Default [DF__RENCAPA__Jdd__3454A3DC]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RENCAPA] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__ReportesA__Nombr__3548C815]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[ReportesAdp] ADD  DEFAULT (' ') FOR [Nombre]
GO
/****** Object:  Default [DF__ReportesA__Local__363CEC4E]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[ReportesAdp] ADD  DEFAULT (' ') FOR [LocalName]
GO
/****** Object:  Default [DF__ReportesAd__Tipo__37311087]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[ReportesAdp] ADD  DEFAULT (' ') FOR [Tipo]
GO
/****** Object:  Default [DF__ReportesAd__Ames__382534C0]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[ReportesAdp] ADD  DEFAULT (' ') FOR [Ames]
GO
/****** Object:  Default [DF__ReportesA__Archi__391958F9]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[ReportesAdp] ADD  DEFAULT (0x00000000) FOR [Archivo]
GO
/****** Object:  Default [DF__ReportesA__Usu_c__3A0D7D32]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[ReportesAdp] ADD  DEFAULT (' ') FOR [Usu_cre]
GO
/****** Object:  Default [DF__ReportesA__Fecha__3B01A16B]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[ReportesAdp] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [Fecha_cre]
GO
/****** Object:  Default [DF__ReportesA__Usu_e__3BF5C5A4]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[ReportesAdp] ADD  DEFAULT (' ') FOR [Usu_envio]
GO
/****** Object:  Default [DF__ReportesA__Fecha__3CE9E9DD]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[ReportesAdp] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [Fecha_env]
GO
/****** Object:  Default [DF__ReportesAdp__Jdd__3DDE0E16]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[ReportesAdp] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__Rerrvalid__Fecha__3ED2324F]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rerrvalida] ADD  DEFAULT (getdate()) FOR [Fecha_val]
GO
/****** Object:  Default [DF__Rerrvalid__Codig__3FC65688]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rerrvalida] ADD  DEFAULT (' ') FOR [Codigo]
GO
/****** Object:  Default [DF__Rerrvalid__Nombr__40BA7AC1]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rerrvalida] ADD  DEFAULT (' ') FOR [Nombre]
GO
/****** Object:  Default [DF__Rerrvalid__Orige__41AE9EFA]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rerrvalida] ADD  DEFAULT (' ') FOR [Origen]
GO
/****** Object:  Default [DF__Rerrvalid__Descr__42A2C333]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rerrvalida] ADD  DEFAULT (' ') FOR [Descrip]
GO
/****** Object:  Default [DF__Rerrvalid__Fecha__4396E76C]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rerrvalida] ADD  DEFAULT (getdate()) FOR [Fecha_pro]
GO
/****** Object:  Default [DF__Rerrvalida__Jdd__448B0BA5]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rerrvalida] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__Resquema__Jdd__457F2FDE]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Resquema] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__Resquema__Esquem__46735417]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Resquema] ADD  DEFAULT ((0)) FOR [Esquema]
GO
/****** Object:  Default [DF__Resquema__Descri__47677850]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Resquema] ADD  DEFAULT (' ') FOR [Descrip]
GO
/****** Object:  Default [DF__Resquema__Parte__485B9C89]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Resquema] ADD  DEFAULT ((0)) FOR [Parte]
GO
/****** Object:  Default [DF__Resquema__Largo__494FC0C2]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Resquema] ADD  DEFAULT ((0)) FOR [Largo]
GO
/****** Object:  Default [DF__Resquema__Conc__4A43E4FB]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Resquema] ADD  DEFAULT ((0)) FOR [Conc]
GO
/****** Object:  Default [DF__Resquema__Tx__4B380934]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Resquema] ADD  DEFAULT ((0)) FOR [Tx]
GO
/****** Object:  Default [DF__Resquema__DatoX__4C2C2D6D]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Resquema] ADD  DEFAULT (' ') FOR [DatoX]
GO
/****** Object:  Default [DF__Resquema__Ty__4D2051A6]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Resquema] ADD  DEFAULT ((0)) FOR [Ty]
GO
/****** Object:  Default [DF__Resquema__DatoY__4E1475DF]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Resquema] ADD  DEFAULT (' ') FOR [DatoY]
GO
/****** Object:  Default [DF__Resquema__Resul__4F089A18]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Resquema] ADD  DEFAULT ((0)) FOR [Resul]
GO
/****** Object:  Default [DF__Resquema__DatoP__4FFCBE51]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Resquema] ADD  DEFAULT (' ') FOR [DatoP]
GO
/****** Object:  Default [DF__Resquema__Deci__50F0E28A]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Resquema] ADD  DEFAULT ((0)) FOR [Deci]
GO
/****** Object:  Default [DF__Resquema__Alinea__51E506C3]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Resquema] ADD  DEFAULT ((0)) FOR [Alinea]
GO
/****** Object:  Default [DF__Resquema__Rellen__52D92AFC]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Resquema] ADD  DEFAULT ((0)) FOR [Relleno]
GO
/****** Object:  Default [DF__Resquema__Destin__53CD4F35]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Resquema] ADD  DEFAULT ((0)) FOR [Destino]
GO
/****** Object:  Default [DF__Resquema__Separa__54C1736E]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Resquema] ADD  DEFAULT (' ') FOR [Separador]
GO
/****** Object:  Default [DF__Resquema__Cdesde__55B597A7]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Resquema] ADD  DEFAULT ((0)) FOR [Cdesde]
GO
/****** Object:  Default [DF__Resquema__Chasta__56A9BBE0]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Resquema] ADD  DEFAULT ((0)) FOR [Chasta]
GO
/****** Object:  Default [DF__Resquema__ReemVa__579DE019]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Resquema] ADD  DEFAULT (' ') FOR [ReemVacio]
GO
/****** Object:  Default [DF__Resquema__Trimea__58920452]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Resquema] ADD  DEFAULT (' ') FOR [Trimear]
GO
/****** Object:  Default [DF__Resquema__Separd__3FC721DF]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Resquema] ADD  DEFAULT (' ') FOR [Separdeci]
GO
/****** Object:  Default [DF__RESTANQ__Jdd__5986288B]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RESTANQ] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__RESTANQ__Cohade__5A7A4CC4]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RESTANQ] ADD  DEFAULT (' ') FOR [Cohade]
GO
/****** Object:  Default [DF__RESTANQ__Codigo__5B6E70FD]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RESTANQ] ADD  DEFAULT (' ') FOR [Codigo]
GO
/****** Object:  Default [DF__RESTANQ__Nro__5C629536]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RESTANQ] ADD  DEFAULT ((0)) FOR [Nro]
GO
/****** Object:  Default [DF__RESTANQ__Codpres__5D56B96F]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RESTANQ] ADD  DEFAULT ((0)) FOR [Codpres]
GO
/****** Object:  Default [DF__RESTANQ__Monto__5E4ADDA8]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RESTANQ] ADD  DEFAULT ((0)) FOR [Monto]
GO
/****** Object:  Default [DF__RESTANQ__Empresa__5F3F01E1]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RESTANQ] ADD  DEFAULT (' ') FOR [Empresa]
GO
/****** Object:  Default [DF__RESTANQ__Cencos__6033261A]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RESTANQ] ADD  DEFAULT ((0)) FOR [Cencos]
GO
/****** Object:  Default [DF__RESTANQ__Tipo__61274A53]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RESTANQ] ADD  DEFAULT ((0)) FOR [Tipo]
GO
/****** Object:  Default [DF__RESTANQ__MontoO__621B6E8C]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RESTANQ] ADD  DEFAULT ((0)) FOR [MontoO]
GO
/****** Object:  Default [DF__RESTANQ__Cmapa__630F92C5]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RESTANQ] ADD  DEFAULT (' ') FOR [Cmapa]
GO
/****** Object:  Default [DF__Resumen__Codigo__6403B6FE]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Resumen] ADD  DEFAULT (' ') FOR [Codigo]
GO
/****** Object:  Default [DF__Resumen__Ames__64F7DB37]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Resumen] ADD  DEFAULT (' ') FOR [Ames]
GO
/****** Object:  Default [DF__Resumen__Peri__65EBFF70]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Resumen] ADD  DEFAULT (' ') FOR [Peri]
GO
/****** Object:  Default [DF__Resumen__Periodo__66E023A9]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Resumen] ADD  DEFAULT (' ') FOR [Periodo]
GO
/****** Object:  Default [DF__Resumen__Origen__67D447E2]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Resumen] ADD  DEFAULT (' ') FOR [Origen]
GO
/****** Object:  Default [DF__Resumen__Neto__68C86C1B]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Resumen] ADD  DEFAULT ((0)) FOR [Neto]
GO
/****** Object:  Default [DF__Resumen__Ktha__69BC9054]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Resumen] ADD  DEFAULT ((0)) FOR [Ktha]
GO
/****** Object:  Default [DF__Resumen__Kthn__6AB0B48D]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Resumen] ADD  DEFAULT ((0)) FOR [Kthn]
GO
/****** Object:  Default [DF__Resumen__KthI__6BA4D8C6]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Resumen] ADD  DEFAULT ((0)) FOR [KthI]
GO
/****** Object:  Default [DF__Resumen__Ktim__6C98FCFF]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Resumen] ADD  DEFAULT ((0)) FOR [Ktim]
GO
/****** Object:  Default [DF__Resumen__Ktdl__6D8D2138]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Resumen] ADD  DEFAULT ((0)) FOR [Ktdl]
GO
/****** Object:  Default [DF__Resumen__KtdlO__6E814571]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Resumen] ADD  DEFAULT ((0)) FOR [KtdlO]
GO
/****** Object:  Default [DF__Resumen__Ktde__6F7569AA]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Resumen] ADD  DEFAULT ((0)) FOR [Ktde]
GO
/****** Object:  Default [DF__Resumen__Ktds__70698DE3]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Resumen] ADD  DEFAULT ((0)) FOR [Ktds]
GO
/****** Object:  Default [DF__Resumen__Ktfm__715DB21C]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Resumen] ADD  DEFAULT ((0)) FOR [Ktfm]
GO
/****** Object:  Default [DF__Resumen__Ktex__7251D655]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Resumen] ADD  DEFAULT ((0)) FOR [Ktex]
GO
/****** Object:  Default [DF__Resumen__DiasTr__7345FA8E]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Resumen] ADD  DEFAULT ((0)) FOR [DiasTr]
GO
/****** Object:  Default [DF__Resumen__DiasLi__743A1EC7]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Resumen] ADD  DEFAULT ((0)) FOR [DiasLi]
GO
/****** Object:  Default [DF__Resumen__TramoCa__752E4300]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Resumen] ADD  DEFAULT ((0)) FOR [TramoCar]
GO
/****** Object:  Default [DF__Resumen__Coprev__76226739]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Resumen] ADD  DEFAULT ((0)) FOR [Coprev]
GO
/****** Object:  Default [DF__Resumen__Cod_Reg__77168B72]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Resumen] ADD  DEFAULT ((0)) FOR [Cod_Reg]
GO
/****** Object:  Default [DF__Resumen__Kcay__780AAFAB]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Resumen] ADD  DEFAULT ((0)) FOR [Kcay]
GO
/****** Object:  Default [DF__Resumen__Khij__78FED3E4]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Resumen] ADD  DEFAULT ((0)) FOR [Khij]
GO
/****** Object:  Default [DF__Resumen__Kotc__79F2F81D]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Resumen] ADD  DEFAULT ((0)) FOR [Kotc]
GO
/****** Object:  Default [DF__Resumen__Afecto1__7AE71C56]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Resumen] ADD  DEFAULT ((0)) FOR [Afecto1]
GO
/****** Object:  Default [DF__Resumen__Afecto2__7BDB408F]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Resumen] ADD  DEFAULT ((0)) FOR [Afecto2]
GO
/****** Object:  Default [DF__Resumen__Afecto3__7CCF64C8]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Resumen] ADD  DEFAULT ((0)) FOR [Afecto3]
GO
/****** Object:  Default [DF__Resumen__Afecto4__7DC38901]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Resumen] ADD  DEFAULT ((0)) FOR [Afecto4]
GO
/****** Object:  Default [DF__Resumen__Afevari__7EB7AD3A]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Resumen] ADD  DEFAULT ((0)) FOR [Afevari]
GO
/****** Object:  Default [DF__Resumen__Empresa__7FABD173]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Resumen] ADD  DEFAULT (' ') FOR [Empresa]
GO
/****** Object:  Default [DF__Resumen__Diaslim__009FF5AC]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Resumen] ADD  DEFAULT ((0)) FOR [Diaslim]
GO
/****** Object:  Default [DF__Resumen__Subsil__019419E5]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Resumen] ADD  DEFAULT ((0)) FOR [Subsil]
GO
/****** Object:  Default [DF__Resumen__Fafp__02883E1E]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Resumen] ADD  DEFAULT ((0)) FOR [Fafp]
GO
/****** Object:  Default [DF__Resumen__Fecha_d__037C6257]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Resumen] ADD  DEFAULT (getdate()) FOR [Fecha_dep]
GO
/****** Object:  Default [DF__Resumen__BancoDe__04708690]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Resumen] ADD  DEFAULT ((0)) FOR [BancoDep]
GO
/****** Object:  Default [DF__Resumen__NroRec__0564AAC9]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Resumen] ADD  DEFAULT ((0)) FOR [NroRec]
GO
/****** Object:  Default [DF__Resumen__Fecha_p__0658CF02]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Resumen] ADD  DEFAULT (getdate()) FOR [Fecha_pag]
GO
/****** Object:  Default [DF__Resumen__Jdd__074CF33B]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Resumen] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__Resumen__Mondep__08411774]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Resumen] ADD  DEFAULT ((0)) FOR [Mondep]
GO
/****** Object:  Default [DF__Resumen__BancoPa__09353BAD]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Resumen] ADD  DEFAULT ((0)) FOR [BancoPag]
GO
/****** Object:  Default [DF__Resumen__Fecha_e__0A295FE6]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Resumen] ADD  DEFAULT (getdate()) FOR [Fecha_eje]
GO
/****** Object:  Default [DF__Resumen__User_ej__0B1D841F]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Resumen] ADD  DEFAULT (' ') FOR [User_eje]
GO
/****** Object:  Default [DF__Resumen__efecDep__0C11A858]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Resumen] ADD  DEFAULT (' ') FOR [efecDep]
GO
/****** Object:  Default [DF__Resumen__Afevar2__0D05CC91]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Resumen] ADD  DEFAULT ((0)) FOR [Afevar2]
GO
/****** Object:  Default [DF__Resumen__SubsilN__0DF9F0CA]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Resumen] ADD  DEFAULT ((0)) FOR [SubsilN]
GO
/****** Object:  Default [DF__Resumen__Licmd__0EEE1503]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Resumen] ADD  DEFAULT (' ') FOR [Licmd]
GO
/****** Object:  Default [DF__Resumen__Dias3pd__0FE2393C]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Resumen] ADD  DEFAULT ((0)) FOR [Dias3pd]
GO
/****** Object:  Default [DF__Resumen__Fecha_u__0D1BA681]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Resumen] ADD  DEFAULT (getdate()) FOR [Fecha_ult]
GO
/****** Object:  Default [DF__Resumen__kper__0E0FCABA]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Resumen] ADD  DEFAULT ((0)) FOR [kper]
GO
/****** Object:  Default [DF__Resumen__kfal__0F03EEF3]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Resumen] ADD  DEFAULT ((0)) FOR [kfal]
GO
/****** Object:  Default [DF__Reventos__Fecha__10D65D75]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Reventos] ADD  DEFAULT (getdate()) FOR [Fecha]
GO
/****** Object:  Default [DF__Reventos__Usuari__11CA81AE]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Reventos] ADD  DEFAULT (' ') FOR [Usuario]
GO
/****** Object:  Default [DF__Reventos__Prog__12BEA5E7]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Reventos] ADD  DEFAULT (' ') FOR [Prog]
GO
/****** Object:  Default [DF__Reventos__Accion__13B2CA20]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Reventos] ADD  DEFAULT (' ') FOR [Accion]
GO
/****** Object:  Default [DF__Reventos__Conti__14A6EE59]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Reventos] ADD  DEFAULT (' ') FOR [Conti]
GO
/****** Object:  Default [DF__Reventos__Evento__159B1292]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Reventos] ADD  DEFAULT (' ') FOR [Evento]
GO
/****** Object:  Default [DF__Reventos__Wcompu__168F36CB]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Reventos] ADD  DEFAULT (' ') FOR [Wcompu]
GO
/****** Object:  Default [DF__Reventos__Ngrab__17835B04]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Reventos] ADD  DEFAULT ((0)) FOR [Ngrab]
GO
/****** Object:  Default [DF__Reventos__Jdd__18777F3D]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Reventos] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__Reventos__Codigo__0C278248]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Reventos] ADD  DEFAULT (' ') FOR [Codigo]
GO
/****** Object:  Default [DF__rfactores__ames__196BA376]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[rfactores] ADD  DEFAULT (' ') FOR [ames]
GO
/****** Object:  Default [DF__rfactores__facto__1A5FC7AF]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[rfactores] ADD  DEFAULT ((0)) FOR [factor]
GO
/****** Object:  Default [DF__rfactores__Jdd__1B53EBE8]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[rfactores] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__Rferiad__Fecha__1C481021]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rferiad] ADD  DEFAULT (getdate()) FOR [Fecha]
GO
/****** Object:  Default [DF__Rferiad__Tipo__1D3C345A]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rferiad] ADD  DEFAULT (' ') FOR [Tipo]
GO
/****** Object:  Default [DF__Rferiad__Motivo__1E305893]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rferiad] ADD  DEFAULT (' ') FOR [Motivo]
GO
/****** Object:  Default [DF__Rferiad__Jdd__1F247CCC]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rferiad] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__Rferiad__Condici__2018A105]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rferiad] ADD  DEFAULT (' ') FOR [Condicion]
GO
/****** Object:  Default [DF__RFormEsp__IdJdd__1AEAA2EB]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RFormEsp] ADD  DEFAULT (' ') FOR [IdJdd]
GO
/****** Object:  Default [DF__RFormEsp__Cohade__1BDEC724]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RFormEsp] ADD  DEFAULT (' ') FOR [Cohade]
GO
/****** Object:  Default [DF__RFormEsp__Coform__1CD2EB5D]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RFormEsp] ADD  DEFAULT (' ') FOR [Coform]
GO
/****** Object:  Default [DF__rformla__Coform__210CC53E]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[rformla] ADD  DEFAULT (' ') FOR [Coform]
GO
/****** Object:  Default [DF__rformla__Descrip__2200E977]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[rformla] ADD  DEFAULT (' ') FOR [Descrip]
GO
/****** Object:  Default [DF__rformla__Tipo__22F50DB0]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[rformla] ADD  DEFAULT (' ') FOR [Tipo]
GO
/****** Object:  Default [DF__rformla__Trazo__23E931E9]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[rformla] ADD  DEFAULT (' ') FOR [Trazo]
GO
/****** Object:  Default [DF__rformla__Formula__24DD5622]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[rformla] ADD  DEFAULT (' ') FOR [Formula]
GO
/****** Object:  Default [DF__rformla__Jdd__25D17A5B]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[rformla] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__rformla__Obs__26C59E94]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[rformla] ADD  DEFAULT (' ') FOR [Obs]
GO
/****** Object:  Default [DF__rformlaH__Jdd__27B9C2CD]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[rformlaH] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__rformlaH__Ames__28ADE706]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[rformlaH] ADD  DEFAULT (' ') FOR [Ames]
GO
/****** Object:  Default [DF__rformlaH__Coform__29A20B3F]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[rformlaH] ADD  DEFAULT (' ') FOR [Coform]
GO
/****** Object:  Default [DF__rformlaH__Descri__2A962F78]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[rformlaH] ADD  DEFAULT (' ') FOR [Descrip]
GO
/****** Object:  Default [DF__rformlaH__Tipo__2B8A53B1]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[rformlaH] ADD  DEFAULT (' ') FOR [Tipo]
GO
/****** Object:  Default [DF__rformlaH__Trazo__2C7E77EA]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[rformlaH] ADD  DEFAULT (' ') FOR [Trazo]
GO
/****** Object:  Default [DF__rformlaH__Formul__2D729C23]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[rformlaH] ADD  DEFAULT (' ') FOR [Formula]
GO
/****** Object:  Default [DF__rformlaH__Obs__2E66C05C]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[rformlaH] ADD  DEFAULT (' ') FOR [Obs]
GO
/****** Object:  Default [DF__RGRUPFA__Codigo__2F5AE495]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RGRUPFA] ADD  DEFAULT (' ') FOR [Codigo]
GO
/****** Object:  Default [DF__RGRUPFA__Nombre__304F08CE]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RGRUPFA] ADD  DEFAULT (' ') FOR [Nombre]
GO
/****** Object:  Default [DF__RGRUPFA__Apc__31432D07]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RGRUPFA] ADD  DEFAULT (' ') FOR [Apc]
GO
/****** Object:  Default [DF__RGRUPFA__Rut__32375140]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RGRUPFA] ADD  DEFAULT (' ') FOR [Rut]
GO
/****** Object:  Default [DF__RGRUPFA__PARIENT__332B7579]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RGRUPFA] ADD  DEFAULT ((0)) FOR [PARIENTE]
GO
/****** Object:  Default [DF__RGRUPFA__Fecha_n__341F99B2]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RGRUPFA] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(120)),(120))) FOR [Fecha_nac]
GO
/****** Object:  Default [DF__RGRUPFA__Sexo__3513BDEB]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RGRUPFA] ADD  DEFAULT (' ') FOR [Sexo]
GO
/****** Object:  Default [DF__RGRUPFA__Estudio__3607E224]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RGRUPFA] ADD  DEFAULT ((0)) FOR [Estudios]
GO
/****** Object:  Default [DF__RGRUPFA__Gensal__36FC065D]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RGRUPFA] ADD  DEFAULT (' ') FOR [Gensal]
GO
/****** Object:  Default [DF__RGRUPFA__Preexis__37F02A96]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RGRUPFA] ADD  DEFAULT (' ') FOR [Preexis]
GO
/****** Object:  Default [DF__RGRUPFA__Tipo_do__38E44ECF]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RGRUPFA] ADD  DEFAULT ((0)) FOR [Tipo_doc]
GO
/****** Object:  Default [DF__RGRUPFA__Desc_pa__39D87308]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RGRUPFA] ADD  DEFAULT (' ') FOR [Desc_par]
GO
/****** Object:  Default [DF__RGRUPFA__Desc_es__3ACC9741]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RGRUPFA] ADD  DEFAULT (' ') FOR [Desc_est]
GO
/****** Object:  Default [DF__RGRUPFA__Fecha_a__3BC0BB7A]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RGRUPFA] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(120)),(120))) FOR [Fecha_alt]
GO
/****** Object:  Default [DF__RGRUPFA__Fecha_b__3CB4DFB3]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RGRUPFA] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(120)),(120))) FOR [Fecha_baj]
GO
/****** Object:  Default [DF__RGRUPFA__Invalid__3DA903EC]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RGRUPFA] ADD  DEFAULT ((0)) FOR [Invalid]
GO
/****** Object:  Default [DF__RGRUPFA__Relacio__3E9D2825]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RGRUPFA] ADD  DEFAULT ((0)) FOR [Relacion]
GO
/****** Object:  Default [DF__RGRUPFA__Curso__3F914C5E]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RGRUPFA] ADD  DEFAULT ((0)) FOR [Curso]
GO
/****** Object:  Default [DF__RGRUPFA__Numdoc__40857097]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RGRUPFA] ADD  DEFAULT (' ') FOR [Numdoc]
GO
/****** Object:  Default [DF__RGRUPFA__Rebimp__417994D0]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RGRUPFA] ADD  DEFAULT ((0)) FOR [Rebimp]
GO
/****** Object:  Default [DF__RGRUPFA__Identid__426DB909]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RGRUPFA] ADD  DEFAULT ((0)) FOR [Identidad]
GO
/****** Object:  Default [DF__RGRUPFA__Matri_c__4361DD42]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RGRUPFA] ADD  DEFAULT ((0)) FOR [Matri_cer]
GO
/****** Object:  Default [DF__RGRUPFA__Matri_f__4456017B]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RGRUPFA] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [Matri_fec]
GO
/****** Object:  Default [DF__RGRUPFA__Naci_ce__454A25B4]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RGRUPFA] ADD  DEFAULT ((0)) FOR [Naci_cer]
GO
/****** Object:  Default [DF__RGRUPFA__Naci_fe__463E49ED]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RGRUPFA] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [Naci_fec]
GO
/****** Object:  Default [DF__RGRUPFA__Prena_c__47326E26]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RGRUPFA] ADD  DEFAULT ((0)) FOR [Prena_cer]
GO
/****** Object:  Default [DF__RGRUPFA__Prena_f__4826925F]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RGRUPFA] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [Prena_fec]
GO
/****** Object:  Default [DF__RGRUPFA__Estu_ce__491AB698]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RGRUPFA] ADD  DEFAULT ((0)) FOR [Estu_cer]
GO
/****** Object:  Default [DF__RGRUPFA__Estu_fe__4A0EDAD1]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RGRUPFA] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [Estu_fec]
GO
/****** Object:  Default [DF__RGRUPFA__Fecha_a__4B02FF0A]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RGRUPFA] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [Fecha_aig]
GO
/****** Object:  Default [DF__RGRUPFA__Fecha_b__4BF72343]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RGRUPFA] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [Fecha_big]
GO
/****** Object:  Default [DF__RGRUPFA__RetJud__4CEB477C]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RGRUPFA] ADD  DEFAULT (' ') FOR [RetJud]
GO
/****** Object:  Default [DF__RGRUPFA__Carsal__4DDF6BB5]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RGRUPFA] ADD  DEFAULT (' ') FOR [Carsal]
GO
/****** Object:  Default [DF__RGRUPFA__Direcci__4ED38FEE]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RGRUPFA] ADD  DEFAULT (' ') FOR [Direccion]
GO
/****** Object:  Default [DF__RGRUPFA__Fono__4FC7B427]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RGRUPFA] ADD  DEFAULT (' ') FOR [Fono]
GO
/****** Object:  Default [DF__RGRUPFA__Pmail__50BBD860]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RGRUPFA] ADD  DEFAULT (' ') FOR [Pmail]
GO
/****** Object:  Default [DF__RGRUPFA__AfpVol__51AFFC99]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RGRUPFA] ADD  DEFAULT (' ') FOR [AfpVol]
GO
/****** Object:  Default [DF__RGRUPFA__AfpCofo__52A420D2]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RGRUPFA] ADD  DEFAULT (' ') FOR [AfpCoform]
GO
/****** Object:  Default [DF__RGRUPFA__Afpcod__5398450B]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RGRUPFA] ADD  DEFAULT ((0)) FOR [Afpcod]
GO
/****** Object:  Default [DF__RGRUPFA__AfpMont__548C6944]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RGRUPFA] ADD  DEFAULT ((0)) FOR [AfpMonto]
GO
/****** Object:  Default [DF__RGRUPFA__AfpDesd__55808D7D]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RGRUPFA] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [AfpDesde]
GO
/****** Object:  Default [DF__RGRUPFA__AfpHast__5674B1B6]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RGRUPFA] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [AfpHasta]
GO
/****** Object:  Default [DF__RGRUPFA__AhoVol__5768D5EF]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RGRUPFA] ADD  DEFAULT (' ') FOR [AhoVol]
GO
/****** Object:  Default [DF__RGRUPFA__AhoCofo__585CFA28]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RGRUPFA] ADD  DEFAULT (' ') FOR [AhoCoform]
GO
/****** Object:  Default [DF__RGRUPFA__AhoMont__59511E61]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RGRUPFA] ADD  DEFAULT ((0)) FOR [AhoMonto]
GO
/****** Object:  Default [DF__RGRUPFA__Jdd__5A45429A]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RGRUPFA] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__RGRUPFA__Nacion__5B3966D3]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RGRUPFA] ADD  DEFAULT ((0)) FOR [Nacion]
GO
/****** Object:  Default [DF__RGRUPFA__AsigBPS__5C2D8B0C]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RGRUPFA] ADD  DEFAULT (' ') FOR [AsigBPS]
GO
/****** Object:  Default [DF__RGRUPFA__AfpNper__5D21AF45]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RGRUPFA] ADD  DEFAULT ((0)) FOR [AfpNper]
GO
/****** Object:  Default [DF__Rhabdes__Cohade__5E15D37E]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rhabdes] ADD  DEFAULT (' ') FOR [Cohade]
GO
/****** Object:  Default [DF__Rhabdes__Descrip__5F09F7B7]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rhabdes] ADD  DEFAULT (' ') FOR [Descrip]
GO
/****** Object:  Default [DF__Rhabdes__Tipo__5FFE1BF0]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rhabdes] ADD  DEFAULT ((0)) FOR [Tipo]
GO
/****** Object:  Default [DF__Rhabdes__Orden__60F24029]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rhabdes] ADD  DEFAULT ((0)) FOR [Orden]
GO
/****** Object:  Default [DF__Rhabdes__Vo__61E66462]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rhabdes] ADD  DEFAULT (' ') FOR [Vo]
GO
/****** Object:  Default [DF__Rhabdes__Propor__62DA889B]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rhabdes] ADD  DEFAULT (' ') FOR [Propor]
GO
/****** Object:  Default [DF__Rhabdes__Coine__63CEACD4]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rhabdes] ADD  DEFAULT ((0)) FOR [Coine]
GO
/****** Object:  Default [DF__Rhabdes__Coform__64C2D10D]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rhabdes] ADD  DEFAULT (' ') FOR [Coform]
GO
/****** Object:  Default [DF__Rhabdes__Pone__65B6F546]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rhabdes] ADD  DEFAULT (' ') FOR [Pone]
GO
/****** Object:  Default [DF__Rhabdes__Pror__66AB197F]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rhabdes] ADD  DEFAULT (' ') FOR [Pror]
GO
/****** Object:  Default [DF__Rhabdes__Acumus__679F3DB8]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rhabdes] ADD  DEFAULT (' ') FOR [Acumus]
GO
/****** Object:  Default [DF__Rhabdes__Refer__689361F1]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rhabdes] ADD  DEFAULT (' ') FOR [Refer]
GO
/****** Object:  Default [DF__Rhabdes__Indice__6987862A]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rhabdes] ADD  DEFAULT ((0)) FOR [Indice]
GO
/****** Object:  Default [DF__Rhabdes__Simes__6A7BAA63]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rhabdes] ADD  DEFAULT (' ') FOR [Simes]
GO
/****** Object:  Default [DF__Rhabdes__Afe1__6B6FCE9C]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rhabdes] ADD  DEFAULT (' ') FOR [Afe1]
GO
/****** Object:  Default [DF__Rhabdes__Afe2__6C63F2D5]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rhabdes] ADD  DEFAULT (' ') FOR [Afe2]
GO
/****** Object:  Default [DF__Rhabdes__Afev__6D58170E]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rhabdes] ADD  DEFAULT (' ') FOR [Afev]
GO
/****** Object:  Default [DF__Rhabdes__Afe3__6E4C3B47]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rhabdes] ADD  DEFAULT (' ') FOR [Afe3]
GO
/****** Object:  Default [DF__Rhabdes__Afe4__6F405F80]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rhabdes] ADD  DEFAULT (' ') FOR [Afe4]
GO
/****** Object:  Default [DF__Rhabdes__Inform__703483B9]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rhabdes] ADD  DEFAULT (' ') FOR [Inform]
GO
/****** Object:  Default [DF__Rhabdes__Aobs__7128A7F2]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rhabdes] ADD  DEFAULT (' ') FOR [Aobs]
GO
/****** Object:  Default [DF__Rhabdes__Tiphab__721CCC2B]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rhabdes] ADD  DEFAULT (' ') FOR [Tiphab]
GO
/****** Object:  Default [DF__Rhabdes__Coinst__7310F064]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rhabdes] ADD  DEFAULT ((0)) FOR [Coinst]
GO
/****** Object:  Default [DF__Rhabdes__RetDond__7405149D]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rhabdes] ADD  DEFAULT ((0)) FOR [RetDonde]
GO
/****** Object:  Default [DF__Rhabdes__Funda__74F938D6]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rhabdes] ADD  DEFAULT (' ') FOR [Funda]
GO
/****** Object:  Default [DF__Rhabdes__VoCofor__75ED5D0F]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rhabdes] ADD  DEFAULT (' ') FOR [VoCoform]
GO
/****** Object:  Default [DF__Rhabdes__Proiga__76E18148]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rhabdes] ADD  DEFAULT (' ') FOR [Proiga]
GO
/****** Object:  Default [DF__Rhabdes__Infcon__77D5A581]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rhabdes] ADD  DEFAULT (' ') FOR [Infcon]
GO
/****** Object:  Default [DF__Rhabdes__RetTipo__78C9C9BA]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rhabdes] ADD  DEFAULT (' ') FOR [RetTipo]
GO
/****** Object:  Default [DF__Rhabdes__Ctacor__79BDEDF3]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rhabdes] ADD  DEFAULT (' ') FOR [Ctacor]
GO
/****** Object:  Default [DF__Rhabdes__Grupo__7AB2122C]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rhabdes] ADD  DEFAULT ((0)) FOR [Grupo]
GO
/****** Object:  Default [DF__Rhabdes__Af__7BA63665]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rhabdes] ADD  DEFAULT (' ') FOR [Af]
GO
/****** Object:  Default [DF__Rhabdes__AfCofor__7C9A5A9E]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rhabdes] ADD  DEFAULT (' ') FOR [AfCoform]
GO
/****** Object:  Default [DF__Rhabdes__Dato__7D8E7ED7]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rhabdes] ADD  DEFAULT (' ') FOR [Dato]
GO
/****** Object:  Default [DF__Rhabdes__Retenci__7E82A310]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rhabdes] ADD  DEFAULT (' ') FOR [Retencion]
GO
/****** Object:  Default [DF__Rhabdes__Exliq__7F76C749]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rhabdes] ADD  DEFAULT (' ') FOR [Exliq]
GO
/****** Object:  Default [DF__Rhabdes__accres__006AEB82]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rhabdes] ADD  DEFAULT (' ') FOR [accres]
GO
/****** Object:  Default [DF__Rhabdes__Refiva__015F0FBB]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rhabdes] ADD  DEFAULT (' ') FOR [Refiva]
GO
/****** Object:  Default [DF__Rhabdes__Jdd__025333F4]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rhabdes] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__Rhabdes__Ndecimo__0347582D]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rhabdes] ADD  DEFAULT ((0)) FOR [Ndecimon]
GO
/****** Object:  Default [DF__Rhabdes__dAF01__043B7C66]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rhabdes] ADD  DEFAULT (' ') FOR [dAF01]
GO
/****** Object:  Default [DF__Rhabdes__dAF02__052FA09F]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rhabdes] ADD  DEFAULT (' ') FOR [dAF02]
GO
/****** Object:  Default [DF__Rhabdes__dAF03__0623C4D8]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rhabdes] ADD  DEFAULT (' ') FOR [dAF03]
GO
/****** Object:  Default [DF__Rhabdes__dAF04__0717E911]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rhabdes] ADD  DEFAULT (' ') FOR [dAF04]
GO
/****** Object:  Default [DF__Rhabdes__dAF05__080C0D4A]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rhabdes] ADD  DEFAULT (' ') FOR [dAF05]
GO
/****** Object:  Default [DF__Rhabdes__dAF06__09003183]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rhabdes] ADD  DEFAULT (' ') FOR [dAF06]
GO
/****** Object:  Default [DF__Rhabdes__dAF07__09F455BC]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rhabdes] ADD  DEFAULT (' ') FOR [dAF07]
GO
/****** Object:  Default [DF__Rhabdes__dAF08__0AE879F5]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rhabdes] ADD  DEFAULT (' ') FOR [dAF08]
GO
/****** Object:  Default [DF__Rhabdes__dAF09__0BDC9E2E]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rhabdes] ADD  DEFAULT (' ') FOR [dAF09]
GO
/****** Object:  Default [DF__Rhabdes__dAF10__0CD0C267]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rhabdes] ADD  DEFAULT (' ') FOR [dAF10]
GO
/****** Object:  Default [DF__Rhabdes__dAF11__0DC4E6A0]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rhabdes] ADD  DEFAULT (' ') FOR [dAF11]
GO
/****** Object:  Default [DF__Rhabdes__dAF12__0EB90AD9]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rhabdes] ADD  DEFAULT (' ') FOR [dAF12]
GO
/****** Object:  Default [DF__Rhabdes__dAF13__0FAD2F12]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rhabdes] ADD  DEFAULT (' ') FOR [dAF13]
GO
/****** Object:  Default [DF__Rhabdes__dAF14__10A1534B]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rhabdes] ADD  DEFAULT (' ') FOR [dAF14]
GO
/****** Object:  Default [DF__Rhabdes__dAF15__11957784]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rhabdes] ADD  DEFAULT (' ') FOR [dAF15]
GO
/****** Object:  Default [DF__Rhabdes__dAF16__12899BBD]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rhabdes] ADD  DEFAULT (' ') FOR [dAF16]
GO
/****** Object:  Default [DF__Rhabdes__dAF17__137DBFF6]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rhabdes] ADD  DEFAULT (' ') FOR [dAF17]
GO
/****** Object:  Default [DF__Rhabdes__dAF18__1471E42F]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rhabdes] ADD  DEFAULT (' ') FOR [dAF18]
GO
/****** Object:  Default [DF__Rhabdes__dAF19__15660868]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rhabdes] ADD  DEFAULT (' ') FOR [dAF19]
GO
/****** Object:  Default [DF__Rhabdes__dAF20__165A2CA1]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rhabdes] ADD  DEFAULT (' ') FOR [dAF20]
GO
/****** Object:  Default [DF__Rhabdes__afev2__174E50DA]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rhabdes] ADD  DEFAULT (' ') FOR [afev2]
GO
/****** Object:  Default [DF__Rhabdes__pone0__18427513]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rhabdes] ADD  DEFAULT (' ') FOR [pone0]
GO
/****** Object:  Default [DF__Rhabdes__unico__1936994C]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rhabdes] ADD  DEFAULT (' ') FOR [unico]
GO
/****** Object:  Default [DF__Rhabdes__dAF21__1A2ABD85]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rhabdes] ADD  DEFAULT (' ') FOR [dAF21]
GO
/****** Object:  Default [DF__Rhabdes__dAF22__1B1EE1BE]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rhabdes] ADD  DEFAULT (' ') FOR [dAF22]
GO
/****** Object:  Default [DF__Rhabdes__dAF23__1C1305F7]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rhabdes] ADD  DEFAULT (' ') FOR [dAF23]
GO
/****** Object:  Default [DF__Rhabdes__dAF24__1D072A30]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rhabdes] ADD  DEFAULT (' ') FOR [dAF24]
GO
/****** Object:  Default [DF__Rhabdes__dAF25__1DFB4E69]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rhabdes] ADD  DEFAULT (' ') FOR [dAF25]
GO
/****** Object:  Default [DF__Rhabdes__claiga__2ACC04F9]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rhabdes] ADD  DEFAULT (' ') FOR [claiga]
GO
/****** Object:  Default [DF__Rhislab__RUT__1EEF72A2]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rhislab] ADD  DEFAULT (' ') FOR [RUT]
GO
/****** Object:  Default [DF__Rhislab__cargo__1FE396DB]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rhislab] ADD  DEFAULT (' ') FOR [cargo]
GO
/****** Object:  Default [DF__Rhislab__empresa__20D7BB14]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rhislab] ADD  DEFAULT (' ') FOR [empresa]
GO
/****** Object:  Default [DF__Rhislab__feching__21CBDF4D]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rhislab] ADD  DEFAULT (getdate()) FOR [fechingr]
GO
/****** Object:  Default [DF__Rhislab__fechegr__22C00386]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rhislab] ADD  DEFAULT (getdate()) FOR [fechegr]
GO
/****** Object:  Default [DF__Rhislab__estado__23B427BF]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rhislab] ADD  DEFAULT ((0)) FOR [estado]
GO
/****** Object:  Default [DF__Rhislab__observ__24A84BF8]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rhislab] ADD  DEFAULT (' ') FOR [observ]
GO
/****** Object:  Default [DF__Rhislab__remuner__259C7031]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rhislab] ADD  DEFAULT ((0)) FOR [remunerac]
GO
/****** Object:  Default [DF__Rhislab__func1__2690946A]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rhislab] ADD  DEFAULT ((0)) FOR [func1]
GO
/****** Object:  Default [DF__Rhislab__func2__2784B8A3]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rhislab] ADD  DEFAULT ((0)) FOR [func2]
GO
/****** Object:  Default [DF__Rhislab__func3__2878DCDC]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rhislab] ADD  DEFAULT ((0)) FOR [func3]
GO
/****** Object:  Default [DF__Rhislab__area__296D0115]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rhislab] ADD  DEFAULT ((0)) FOR [area]
GO
/****** Object:  Default [DF__Rhislab__Fecha_m__2A61254E]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rhislab] ADD  DEFAULT (getdate()) FOR [Fecha_mod]
GO
/****** Object:  Default [DF__Rhislab__vobo__2B554987]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rhislab] ADD  DEFAULT ((0)) FOR [vobo]
GO
/****** Object:  Default [DF__Rhislab__usrvobo__2C496DC0]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rhislab] ADD  DEFAULT (' ') FOR [usrvobo]
GO
/****** Object:  Default [DF__Rhislab__jdd__2D3D91F9]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rhislab] ADD  DEFAULT ((0)) FOR [jdd]
GO
/****** Object:  Default [DF__RHOJAVI__Codigo__2E31B632]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RHOJAVI] ADD  DEFAULT (' ') FOR [Codigo]
GO
/****** Object:  Default [DF__RHOJAVI__Fecha__2F25DA6B]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RHOJAVI] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [Fecha]
GO
/****** Object:  Default [DF__RHOJAVI__Hora__3019FEA4]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RHOJAVI] ADD  DEFAULT (' ') FOR [Hora]
GO
/****** Object:  Default [DF__RHOJAVI__Tipo__310E22DD]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RHOJAVI] ADD  DEFAULT ((0)) FOR [Tipo]
GO
/****** Object:  Default [DF__RHOJAVI__Detalle__32024716]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RHOJAVI] ADD  DEFAULT (' ') FOR [Detalle]
GO
/****** Object:  Default [DF__RHOJAVI__Estado__32F66B4F]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RHOJAVI] ADD  DEFAULT (' ') FOR [Estado]
GO
/****** Object:  Default [DF__RHOJAVI__Respon__33EA8F88]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RHOJAVI] ADD  DEFAULT (' ') FOR [Respon]
GO
/****** Object:  Default [DF__RHOJAVI__Nhoras__34DEB3C1]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RHOJAVI] ADD  DEFAULT ((0)) FOR [Nhoras]
GO
/****** Object:  Default [DF__RHOJAVI__Destipo__35D2D7FA]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RHOJAVI] ADD  DEFAULT (' ') FOR [Destipo]
GO
/****** Object:  Default [DF__RHOJAVI__Ivt__36C6FC33]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RHOJAVI] ADD  DEFAULT ((0)) FOR [Ivt]
GO
/****** Object:  Default [DF__RHOJAVI__Jdd__37BB206C]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RHOJAVI] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__RHONORA__Rut__38AF44A5]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RHONORA] ADD  DEFAULT (' ') FOR [Rut]
GO
/****** Object:  Default [DF__RHONORA__Tiser__39A368DE]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RHONORA] ADD  DEFAULT (' ') FOR [Tiser]
GO
/****** Object:  Default [DF__RHONORA__Fecha_c__3A978D17]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RHONORA] ADD  DEFAULT (getdate()) FOR [Fecha_con]
GO
/****** Object:  Default [DF__RHONORA__Fecha_h__3B8BB150]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RHONORA] ADD  DEFAULT (getdate()) FOR [Fecha_hon]
GO
/****** Object:  Default [DF__RHONORA__Tipo__3C7FD589]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RHONORA] ADD  DEFAULT (' ') FOR [Tipo]
GO
/****** Object:  Default [DF__RHONORA__Numbol__3D73F9C2]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RHONORA] ADD  DEFAULT ((0)) FOR [Numbol]
GO
/****** Object:  Default [DF__RHONORA__Monto__3E681DFB]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RHONORA] ADD  DEFAULT ((0)) FOR [Monto]
GO
/****** Object:  Default [DF__RHONORA__Tasa__3F5C4234]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RHONORA] ADD  DEFAULT ((0)) FOR [Tasa]
GO
/****** Object:  Default [DF__RHONORA__Impues__4050666D]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RHONORA] ADD  DEFAULT ((0)) FOR [Impues]
GO
/****** Object:  Default [DF__RHONORA__Empresa__41448AA6]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RHONORA] ADD  DEFAULT (' ') FOR [Empresa]
GO
/****** Object:  Default [DF__RHONORA__Codigo__4238AEDF]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RHONORA] ADD  DEFAULT (' ') FOR [Codigo]
GO
/****** Object:  Default [DF__RHONORA__Nombre__432CD318]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RHONORA] ADD  DEFAULT (' ') FOR [Nombre]
GO
/****** Object:  Default [DF__RHONORA__Direcci__4420F751]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RHONORA] ADD  DEFAULT (' ') FOR [Direccion]
GO
/****** Object:  Default [DF__RHONORA__Motivo__45151B8A]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RHONORA] ADD  DEFAULT ((0)) FOR [Motivo]
GO
/****** Object:  Default [DF__RHONORA__fecha_s__46093FC3]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RHONORA] ADD  DEFAULT (getdate()) FOR [fecha_ser]
GO
/****** Object:  Default [DF__RHONORA__Cencos__46FD63FC]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RHONORA] ADD  DEFAULT ((0)) FOR [Cencos]
GO
/****** Object:  Default [DF__RHONORA__Tibol__47F18835]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RHONORA] ADD  DEFAULT (' ') FOR [Tibol]
GO
/****** Object:  Default [DF__RHONORA__Jdd__48E5AC6E]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RHONORA] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__Ridiomas__RUT__49D9D0A7]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Ridiomas] ADD  DEFAULT (' ') FOR [RUT]
GO
/****** Object:  Default [DF__Ridiomas__idioma__4ACDF4E0]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Ridiomas] ADD  DEFAULT ((0)) FOR [idioma]
GO
/****** Object:  Default [DF__Ridiomas__habla__4BC21919]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Ridiomas] ADD  DEFAULT ((0)) FOR [habla]
GO
/****** Object:  Default [DF__Ridiomas__lee__4CB63D52]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Ridiomas] ADD  DEFAULT ((0)) FOR [lee]
GO
/****** Object:  Default [DF__Ridiomas__escrib__4DAA618B]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Ridiomas] ADD  DEFAULT ((0)) FOR [escribe]
GO
/****** Object:  Default [DF__Ridiomas__observ__4E9E85C4]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Ridiomas] ADD  DEFAULT (' ') FOR [observ]
GO
/****** Object:  Default [DF__Ridiomas__Fecha___4F92A9FD]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Ridiomas] ADD  DEFAULT (getdate()) FOR [Fecha_mod]
GO
/****** Object:  Default [DF__Ridiomas__usrvob__5086CE36]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Ridiomas] ADD  DEFAULT (' ') FOR [usrvobo]
GO
/****** Object:  Default [DF__Ridiomas__vobo__517AF26F]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Ridiomas] ADD  DEFAULT ((0)) FOR [vobo]
GO
/****** Object:  Default [DF__Ridiomas__jdd__526F16A8]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Ridiomas] ADD  DEFAULT ((0)) FOR [jdd]
GO
/****** Object:  Default [DF__Rigaesq__Concept__53633AE1]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rigaesq] ADD  DEFAULT (' ') FOR [Concepto]
GO
/****** Object:  Default [DF__Rigaesq__Descrip__54575F1A]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rigaesq] ADD  DEFAULT (' ') FOR [Descrip]
GO
/****** Object:  Default [DF__Rigaesq__Orden__554B8353]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rigaesq] ADD  DEFAULT ((0)) FOR [Orden]
GO
/****** Object:  Default [DF__Rigaesq__Signo__563FA78C]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rigaesq] ADD  DEFAULT (' ') FOR [Signo]
GO
/****** Object:  Default [DF__Rigaesq__Formula__5733CBC5]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rigaesq] ADD  DEFAULT (' ') FOR [Formula]
GO
/****** Object:  Default [DF__Rigaesq__Tipo__5827EFFE]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rigaesq] ADD  DEFAULT (' ') FOR [Tipo]
GO
/****** Object:  Default [DF__Rigaesq__Jdd__591C1437]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rigaesq] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__Rigdet__Codigo__5A103870]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rigdet] ADD  DEFAULT (' ') FOR [Codigo]
GO
/****** Object:  Default [DF__Rigdet__Ames__5B045CA9]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rigdet] ADD  DEFAULT (' ') FOR [Ames]
GO
/****** Object:  Default [DF__Rigdet__Concepto__5BF880E2]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rigdet] ADD  DEFAULT (' ') FOR [Concepto]
GO
/****** Object:  Default [DF__Rigdet__Montoa__5CECA51B]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rigdet] ADD  DEFAULT ((0)) FOR [Montoa]
GO
/****** Object:  Default [DF__Rigdet__Montop__5DE0C954]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rigdet] ADD  DEFAULT ((0)) FOR [Montop]
GO
/****** Object:  Default [DF__Rigdet__Jdd__5ED4ED8D]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rigdet] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__Rimpuesxmes__jdd__5FC911C6]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rimpuesxmes] ADD  DEFAULT ((0)) FOR [jdd]
GO
/****** Object:  Default [DF__Rimpuesxm__Empre__60BD35FF]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rimpuesxmes] ADD  DEFAULT (' ') FOR [Empresa]
GO
/****** Object:  Default [DF__Rimpuesxmes__Aa__61B15A38]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rimpuesxmes] ADD  DEFAULT ((0)) FOR [Aa]
GO
/****** Object:  Default [DF__Rimpuesxmes__ene__62A57E71]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rimpuesxmes] ADD  DEFAULT ((0)) FOR [ene]
GO
/****** Object:  Default [DF__Rimpuesxmes__feb__6399A2AA]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rimpuesxmes] ADD  DEFAULT ((0)) FOR [feb]
GO
/****** Object:  Default [DF__Rimpuesxmes__mar__648DC6E3]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rimpuesxmes] ADD  DEFAULT ((0)) FOR [mar]
GO
/****** Object:  Default [DF__Rimpuesxmes__abr__6581EB1C]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rimpuesxmes] ADD  DEFAULT ((0)) FOR [abr]
GO
/****** Object:  Default [DF__Rimpuesxmes__may__66760F55]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rimpuesxmes] ADD  DEFAULT ((0)) FOR [may]
GO
/****** Object:  Default [DF__Rimpuesxmes__jun__676A338E]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rimpuesxmes] ADD  DEFAULT ((0)) FOR [jun]
GO
/****** Object:  Default [DF__Rimpuesxmes__jul__685E57C7]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rimpuesxmes] ADD  DEFAULT ((0)) FOR [jul]
GO
/****** Object:  Default [DF__Rimpuesxmes__ago__69527C00]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rimpuesxmes] ADD  DEFAULT ((0)) FOR [ago]
GO
/****** Object:  Default [DF__Rimpuesxmes__sep__6A46A039]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rimpuesxmes] ADD  DEFAULT ((0)) FOR [sep]
GO
/****** Object:  Default [DF__Rimpuesxmes__oct__6B3AC472]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rimpuesxmes] ADD  DEFAULT ((0)) FOR [oct]
GO
/****** Object:  Default [DF__Rimpuesxmes__nov__6C2EE8AB]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rimpuesxmes] ADD  DEFAULT ((0)) FOR [nov]
GO
/****** Object:  Default [DF__Rimpuesxmes__dic__6D230CE4]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rimpuesxmes] ADD  DEFAULT ((0)) FOR [dic]
GO
/****** Object:  Default [DF__RINDICES__Aa__6E17311D]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RINDICES] ADD  DEFAULT ((0)) FOR [Aa]
GO
/****** Object:  Default [DF__RINDICES__Mm__6F0B5556]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RINDICES] ADD  DEFAULT ((0)) FOR [Mm]
GO
/****** Object:  Default [DF__RINDICES__Utm__6FFF798F]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RINDICES] ADD  DEFAULT ((0)) FOR [Utm]
GO
/****** Object:  Default [DF__RINDICES__Uf__70F39DC8]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RINDICES] ADD  DEFAULT ((0)) FOR [Uf]
GO
/****** Object:  Default [DF__RINDICES__Ipc__71E7C201]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RINDICES] ADD  DEFAULT ((0)) FOR [Ipc]
GO
/****** Object:  Default [DF__RINDICES__Fipc__72DBE63A]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RINDICES] ADD  DEFAULT ((0)) FOR [Fipc]
GO
/****** Object:  Default [DF__RINDICES__TopeAF__73D00A73]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RINDICES] ADD  DEFAULT ((0)) FOR [TopeAFP]
GO
/****** Object:  Default [DF__RINDICES__TopeSE__74C42EAC]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RINDICES] ADD  DEFAULT ((0)) FOR [TopeSEC]
GO
/****** Object:  Default [DF__RINDICES__Jdd__75B852E5]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RINDICES] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__RINDICES__Sueldo__76AC771E]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RINDICES] ADD  DEFAULT ((0)) FOR [SueldoMin]
GO
/****** Object:  Default [DF__ringlicen__Usuar__77A09B57]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[ringlicen] ADD  DEFAULT (' ') FOR [Usuario]
GO
/****** Object:  Default [DF__ringlicen__Codig__7894BF90]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[ringlicen] ADD  DEFAULT (' ') FOR [Codigo]
GO
/****** Object:  Default [DF__ringlicen__Rut__7988E3C9]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[ringlicen] ADD  DEFAULT (' ') FOR [Rut]
GO
/****** Object:  Default [DF__ringlicen__Cargo__7A7D0802]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[ringlicen] ADD  DEFAULT ((0)) FOR [Cargo]
GO
/****** Object:  Default [DF__ringlicen__Dias__7B712C3B]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[ringlicen] ADD  DEFAULT ((0)) FOR [Dias]
GO
/****** Object:  Default [DF__ringlicen__Fecha__7C655074]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[ringlicen] ADD  DEFAULT (getdate()) FOR [Fecha_lic]
GO
/****** Object:  Default [DF__ringlicen__Fecha__7D5974AD]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[ringlicen] ADD  DEFAULT (getdate()) FOR [Fecha_ini]
GO
/****** Object:  Default [DF__ringlicen__Nulic__7E4D98E6]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[ringlicen] ADD  DEFAULT ((0)) FOR [Nulic]
GO
/****** Object:  Default [DF__ringlicen__Tipo__7F41BD1F]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[ringlicen] ADD  DEFAULT ((0)) FOR [Tipo]
GO
/****** Object:  Default [DF__ringlicen__Causa__0035E158]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[ringlicen] ADD  DEFAULT ((0)) FOR [Causal]
GO
/****** Object:  Default [DF__ringlicen__Escon__012A0591]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[ringlicen] ADD  DEFAULT (' ') FOR [Escon]
GO
/****** Object:  Default [DF__ringlicen__Medio__021E29CA]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[ringlicen] ADD  DEFAULT (' ') FOR [Medios]
GO
/****** Object:  Default [DF__ringlicen__Rutpr__03124E03]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[ringlicen] ADD  DEFAULT (' ') FOR [Rutpro]
GO
/****** Object:  Default [DF__ringlicen__Medic__0406723C]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[ringlicen] ADD  DEFAULT (' ') FOR [Medico]
GO
/****** Object:  Default [DF__ringlicen__Espec__04FA9675]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[ringlicen] ADD  DEFAULT ((0)) FOR [Especia]
GO
/****** Object:  Default [DF__ringlicen__mailJ__05EEBAAE]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[ringlicen] ADD  DEFAULT (' ') FOR [mailJefe]
GO
/****** Object:  Default [DF__ringlicen__Nombr__06E2DEE7]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[ringlicen] ADD  DEFAULT (' ') FOR [Nombre]
GO
/****** Object:  Default [DF__ringlicen__Jdd__07D70320]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[ringlicen] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__ringlicen__Lscan__08CB2759]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[ringlicen] ADD  DEFAULT ((0)) FOR [Lscan]
GO
/****** Object:  Default [DF__ringlicen__Fecha__09BF4B92]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[ringlicen] ADD  DEFAULT (getdate()) FOR [Fecha_con]
GO
/****** Object:  Default [DF__ringlicen__Fecha__0AB36FCB]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[ringlicen] ADD  DEFAULT (getdate()) FOR [Fecha_ico]
GO
/****** Object:  Default [DF__Ringreapro__Jdd__0BA79404]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Ringreapro] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__Ringreapr__Codig__0C9BB83D]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Ringreapro] ADD  DEFAULT (' ') FOR [Codigo]
GO
/****** Object:  Default [DF__Ringreapr__Funci__0D8FDC76]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Ringreapro] ADD  DEFAULT (' ') FOR [Funcion]
GO
/****** Object:  Default [DF__Ringreapro__Situ__0E8400AF]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Ringreapro] ADD  DEFAULT (' ') FOR [Situ]
GO
/****** Object:  Default [DF__Ringreapr__Items__0F7824E8]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Ringreapro] ADD  DEFAULT (' ') FOR [ItemsTi]
GO
/****** Object:  Default [DF__Ringreapr__Items__106C4921]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Ringreapro] ADD  DEFAULT (' ') FOR [ItemsSi]
GO
/****** Object:  Default [DF__Ringreapr__Apro0__11606D5A]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Ringreapro] ADD  DEFAULT (' ') FOR [Apro01]
GO
/****** Object:  Default [DF__Ringreapr__Apro0__12549193]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Ringreapro] ADD  DEFAULT (' ') FOR [Apro02]
GO
/****** Object:  Default [DF__Ringreapr__Apro0__1348B5CC]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Ringreapro] ADD  DEFAULT (' ') FOR [Apro03]
GO
/****** Object:  Default [DF__Ringreapr__IDPla__143CDA05]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Ringreapro] ADD  DEFAULT (' ') FOR [IDPlant]
GO
/****** Object:  Default [DF__Ringresos__Usuar__1530FE3E]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Ringresos] ADD  DEFAULT (' ') FOR [Usuario]
GO
/****** Object:  Default [DF__Ringresos__Tipo__16252277]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Ringresos] ADD  DEFAULT (' ') FOR [Tipo]
GO
/****** Object:  Default [DF__Ringresos__Fecha__171946B0]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Ringresos] ADD  DEFAULT (getdate()) FOR [Fecha]
GO
/****** Object:  Default [DF__Ringresos__Ames__180D6AE9]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Ringresos] ADD  DEFAULT (' ') FOR [Ames]
GO
/****** Object:  Default [DF__Ringresos__Peri__19018F22]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Ringresos] ADD  DEFAULT (' ') FOR [Peri]
GO
/****** Object:  Default [DF__Ringresos__Deta__19F5B35B]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Ringresos] ADD  DEFAULT (' ') FOR [Deta]
GO
/****** Object:  Default [DF__Ringresos__Nucom__1AE9D794]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Ringresos] ADD  DEFAULT (' ') FOR [Nucomp]
GO
/****** Object:  Default [DF__Ringresos__Jdd__1BDDFBCD]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Ringresos] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__RINTBANC__BancoI__1CD22006]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RINTBANC] ADD  DEFAULT ((0)) FOR [BancoId]
GO
/****** Object:  Default [DF__RINTBANC__Esquem__1DC6443F]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RINTBANC] ADD  DEFAULT ((0)) FOR [Esquema]
GO
/****** Object:  Default [DF__RINTBANC__Descri__1EBA6878]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RINTBANC] ADD  DEFAULT (' ') FOR [Descrip]
GO
/****** Object:  Default [DF__RINTBANC__CtrlCt__1FAE8CB1]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RINTBANC] ADD  DEFAULT (' ') FOR [CtrlCtaRep]
GO
/****** Object:  Default [DF__RINTBANC__TipoOp__20A2B0EA]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RINTBANC] ADD  DEFAULT ((0)) FOR [TipoOpcion]
GO
/****** Object:  Default [DF__RINTBANC__NombAr__2196D523]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RINTBANC] ADD  DEFAULT (' ') FOR [NombArch]
GO
/****** Object:  Default [DF__RINTBANC__TipoAr__228AF95C]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RINTBANC] ADD  DEFAULT ((0)) FOR [TipoArchGe]
GO
/****** Object:  Default [DF__RINTBANC__RegiPa__237F1D95]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RINTBANC] ADD  DEFAULT (' ') FOR [RegiPagos]
GO
/****** Object:  Default [DF__RINTBANC__Verifi__247341CE]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RINTBANC] ADD  DEFAULT (' ') FOR [VerificaCB]
GO
/****** Object:  Default [DF__RINTBANC__NoProc__25676607]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RINTBANC] ADD  DEFAULT (' ') FOR [NoProcRegi]
GO
/****** Object:  Default [DF__RINTBANC__Unific__265B8A40]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RINTBANC] ADD  DEFAULT ((0)) FOR [UnificarxR]
GO
/****** Object:  Default [DF__RINTBANC__Jdd__274FAE79]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RINTBANC] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__RINTBANC__TipArc__2843D2B2]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RINTBANC] ADD  DEFAULT ((0)) FOR [TipArchGe]
GO
/****** Object:  Default [DF__RINTBANC__TipOpc__2937F6EB]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RINTBANC] ADD  DEFAULT ((0)) FOR [TipOpcion]
GO
/****** Object:  Default [DF__RINTBANC__CtrCbu__2A2C1B24]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RINTBANC] ADD  DEFAULT ((0)) FOR [CtrCbuRep]
GO
/****** Object:  Default [DF__RINTCONVE__Esque__2B203F5D]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RINTCONVER] ADD  DEFAULT ((0)) FOR [Esquema]
GO
/****** Object:  Default [DF__RINTCONVE__Cotab__2C146396]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RINTCONVER] ADD  DEFAULT ((0)) FOR [Cotab]
GO
/****** Object:  Default [DF__RINTCONVE__Codig__2D0887CF]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RINTCONVER] ADD  DEFAULT ((0)) FOR [Codigo]
GO
/****** Object:  Default [DF__RINTCONVE__DescA__2DFCAC08]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RINTCONVER] ADD  DEFAULT (' ') FOR [DescAltern]
GO
/****** Object:  Default [DF__RINTCONVER__Jdd__2EF0D041]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RINTCONVER] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__RINTDETA__BancoI__2FE4F47A]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RINTDETA] ADD  DEFAULT ((0)) FOR [BancoId]
GO
/****** Object:  Default [DF__RINTDETA__Esquem__30D918B3]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RINTDETA] ADD  DEFAULT ((0)) FOR [Esquema]
GO
/****** Object:  Default [DF__RINTDETA__Seccio__31CD3CEC]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RINTDETA] ADD  DEFAULT ((0)) FOR [Seccion]
GO
/****** Object:  Default [DF__RINTDETA__Linea__32C16125]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RINTDETA] ADD  DEFAULT ((0)) FOR [Linea]
GO
/****** Object:  Default [DF__RINTDETA__Orden__33B5855E]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RINTDETA] ADD  DEFAULT ((0)) FOR [Orden]
GO
/****** Object:  Default [DF__RINTDETA__TipoDa__34A9A997]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RINTDETA] ADD  DEFAULT (' ') FOR [TipoDato]
GO
/****** Object:  Default [DF__RINTDETA__Largo__359DCDD0]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RINTDETA] ADD  DEFAULT ((0)) FOR [Largo]
GO
/****** Object:  Default [DF__RINTDETA__Rellen__3691F209]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RINTDETA] ADD  DEFAULT (' ') FOR [Relleno]
GO
/****** Object:  Default [DF__RINTDETA__Alinea__37861642]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RINTDETA] ADD  DEFAULT ((0)) FOR [Alinea]
GO
/****** Object:  Default [DF__RINTDETA__CampoA__387A3A7B]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RINTDETA] ADD  DEFAULT (' ') FOR [CampoAsoci]
GO
/****** Object:  Default [DF__RINTDETA__RelleD__396E5EB4]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RINTDETA] ADD  DEFAULT (' ') FOR [RelleDeciC]
GO
/****** Object:  Default [DF__RINTDETA__CantDe__3A6282ED]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RINTDETA] ADD  DEFAULT ((0)) FOR [CantDec]
GO
/****** Object:  Default [DF__RINTDETA__SepDec__3B56A726]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RINTDETA] ADD  DEFAULT (' ') FOR [SepDec]
GO
/****** Object:  Default [DF__RINTDETA__SepMil__3C4ACB5F]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RINTDETA] ADD  DEFAULT (' ') FOR [SepMiles]
GO
/****** Object:  Default [DF__RINTDETA__DatoFi__3D3EEF98]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RINTDETA] ADD  DEFAULT (' ') FOR [DatoFijo]
GO
/****** Object:  Default [DF__RINTDETA__Nombre__3E3313D1]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RINTDETA] ADD  DEFAULT (' ') FOR [NombreColu]
GO
/****** Object:  Default [DF__RINTDETA__Format__3F27380A]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RINTDETA] ADD  DEFAULT (' ') FOR [FormatoFec]
GO
/****** Object:  Default [DF__RINTDETA__DatosF__401B5C43]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RINTDETA] ADD  DEFAULT (' ') FOR [DatosFormu]
GO
/****** Object:  Default [DF__RINTDETA__QuitaC__410F807C]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RINTDETA] ADD  DEFAULT (' ') FOR [QuitaCarCa]
GO
/****** Object:  Default [DF__RINTDETA__StrDes__4203A4B5]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RINTDETA] ADD  DEFAULT ((0)) FOR [StrDesde]
GO
/****** Object:  Default [DF__RINTDETA__StrHas__42F7C8EE]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RINTDETA] ADD  DEFAULT ((0)) FOR [StrHasta]
GO
/****** Object:  Default [DF__RINTDETA__TablaC__43EBED27]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RINTDETA] ADD  DEFAULT ((0)) FOR [TablaConve]
GO
/****** Object:  Default [DF__RINTDETA__EsCodi__44E01160]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RINTDETA] ADD  DEFAULT (' ') FOR [EsCodigo]
GO
/****** Object:  Default [DF__RINTDETA__TablaC__45D43599]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RINTDETA] ADD  DEFAULT ((0)) FOR [TablaCodig]
GO
/****** Object:  Default [DF__RINTDETA__Descri__46C859D2]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RINTDETA] ADD  DEFAULT (' ') FOR [Descrip]
GO
/****** Object:  Default [DF__RINTDETA__CharAM__47BC7E0B]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RINTDETA] ADD  DEFAULT ((0)) FOR [CharAMayMi]
GO
/****** Object:  Default [DF__RINTDETA__ReempC__48B0A244]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RINTDETA] ADD  DEFAULT (' ') FOR [ReempCarac]
GO
/****** Object:  Default [DF__RINTDETA__TomaHa__49A4C67D]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RINTDETA] ADD  DEFAULT (' ') FOR [TomaHastCa]
GO
/****** Object:  Default [DF__RINTDETA__TomaIz__4A98EAB6]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RINTDETA] ADD  DEFAULT ((0)) FOR [TomaIzqODe]
GO
/****** Object:  Default [DF__RINTDETA__TablaC__4B8D0EEF]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RINTDETA] ADD  DEFAULT (' ') FOR [TablaConvd]
GO
/****** Object:  Default [DF__RINTDETA__Jdd__4C813328]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RINTDETA] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__RINTDETA__Espaci__4D755761]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RINTDETA] ADD  DEFAULT ((0)) FOR [Espacios]
GO
/****** Object:  Default [DF__Ritemseg__Tipo__4E697B9A]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Ritemseg] ADD  DEFAULT (' ') FOR [Tipo]
GO
/****** Object:  Default [DF__Ritemseg__Stipo__4F5D9FD3]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Ritemseg] ADD  DEFAULT (' ') FOR [Stipo]
GO
/****** Object:  Default [DF__Ritemseg__Item__5051C40C]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Ritemseg] ADD  DEFAULT (' ') FOR [Item]
GO
/****** Object:  Default [DF__Ritemseg__Descri__5145E845]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Ritemseg] ADD  DEFAULT (' ') FOR [Descrip]
GO
/****** Object:  Default [DF__Ritemseg__Acc__523A0C7E]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Ritemseg] ADD  DEFAULT (' ') FOR [Acc]
GO
/****** Object:  Default [DF__Ritemseg__Mod__532E30B7]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Ritemseg] ADD  DEFAULT (' ') FOR [Mod]
GO
/****** Object:  Default [DF__Ritemseg__Cre__542254F0]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Ritemseg] ADD  DEFAULT (' ') FOR [Cre]
GO
/****** Object:  Default [DF__Ritemseg__Eli__55167929]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Ritemseg] ADD  DEFAULT (' ') FOR [Eli]
GO
/****** Object:  Default [DF__Ritemseg__Imp__560A9D62]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Ritemseg] ADD  DEFAULT (' ') FOR [Imp]
GO
/****** Object:  Default [DF__Ritemseg__Jdd__56FEC19B]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Ritemseg] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__RJDATOS__Jdd__57F2E5D4]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RJDATOS] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__RJDATOS__Nombre__58E70A0D]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RJDATOS] ADD  DEFAULT (' ') FOR [Nombre]
GO
/****** Object:  Default [DF__RJDATOS__Encarga__59DB2E46]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RJDATOS] ADD  DEFAULT (' ') FOR [Encargado]
GO
/****** Object:  Default [DF__RJDATOS__Fono__5ACF527F]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RJDATOS] ADD  DEFAULT (' ') FOR [Fono]
GO
/****** Object:  Default [DF__RJDATOS__email__5BC376B8]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RJDATOS] ADD  DEFAULT (' ') FOR [email]
GO
/****** Object:  Default [DF__RJDATOS__numtra__5CB79AF1]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RJDATOS] ADD  DEFAULT ((0)) FOR [numtra]
GO
/****** Object:  Default [DF__RJERARQ__Segment__5DABBF2A]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RJERARQ] ADD  DEFAULT (' ') FOR [Segmento]
GO
/****** Object:  Default [DF__RJERARQ__GranZon__5E9FE363]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RJERARQ] ADD  DEFAULT (' ') FOR [GranZona]
GO
/****** Object:  Default [DF__RJERARQ__Zona__5F94079C]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RJERARQ] ADD  DEFAULT (' ') FOR [Zona]
GO
/****** Object:  Default [DF__RJERARQ__Jop__60882BD5]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RJERARQ] ADD  DEFAULT (' ') FOR [Jop]
GO
/****** Object:  Default [DF__RJERARQ__Supervi__617C500E]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RJERARQ] ADD  DEFAULT (' ') FOR [Supervis]
GO
/****** Object:  Default [DF__RJERARQ__TipoCC__62707447]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RJERARQ] ADD  DEFAULT (' ') FOR [TipoCC]
GO
/****** Object:  Default [DF__RJERARQ__Cencos__63649880]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RJERARQ] ADD  DEFAULT ((0)) FOR [Cencos]
GO
/****** Object:  Default [DF__RJERARQ__Agrupad__6458BCB9]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RJERARQ] ADD  DEFAULT (' ') FOR [Agrupador]
GO
/****** Object:  Default [DF__RJERARQ__Venta__654CE0F2]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RJERARQ] ADD  DEFAULT ((0)) FOR [Venta]
GO
/****** Object:  Default [DF__RJERARQ__Dotacio__6641052B]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RJERARQ] ADD  DEFAULT ((0)) FOR [Dotacion]
GO
/****** Object:  Default [DF__RJERARQ__Ingreso__67352964]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RJERARQ] ADD  DEFAULT ((0)) FOR [Ingresos]
GO
/****** Object:  Default [DF__RJERARQ__IngxTra__68294D9D]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RJERARQ] ADD  DEFAULT ((0)) FOR [IngxTras]
GO
/****** Object:  Default [DF__RJERARQ__Licenci__691D71D6]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RJERARQ] ADD  DEFAULT ((0)) FOR [Licencias]
GO
/****** Object:  Default [DF__RJERARQ__Finiqui__6A11960F]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RJERARQ] ADD  DEFAULT ((0)) FOR [Finiquito]
GO
/****** Object:  Default [DF__RJERARQ__SalxTra__6B05BA48]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RJERARQ] ADD  DEFAULT ((0)) FOR [SalxTras]
GO
/****** Object:  Default [DF__RJERARQ__HrsExtr__6BF9DE81]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RJERARQ] ADD  DEFAULT ((0)) FOR [HrsExtra]
GO
/****** Object:  Default [DF__RJERARQ__Ames__6CEE02BA]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RJERARQ] ADD  DEFAULT (' ') FOR [Ames]
GO
/****** Object:  Default [DF__RJERARQ__Peri__6DE226F3]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RJERARQ] ADD  DEFAULT (' ') FOR [Peri]
GO
/****** Object:  Default [DF__RJERARQ__Permiso__6ED64B2C]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RJERARQ] ADD  DEFAULT ((0)) FOR [Permisos]
GO
/****** Object:  Default [DF__RJERARQ__Acciden__6FCA6F65]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RJERARQ] ADD  DEFAULT ((0)) FOR [Accidente]
GO
/****** Object:  Default [DF__RJERARQ__Empresa__70BE939E]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RJERARQ] ADD  DEFAULT (' ') FOR [Empresa]
GO
/****** Object:  Default [DF__RJERARQ__Descrip__71B2B7D7]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RJERARQ] ADD  DEFAULT (' ') FOR [Descripcc]
GO
/****** Object:  Default [DF__RJERARQ__Diaspag__72A6DC10]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RJERARQ] ADD  DEFAULT ((0)) FOR [Diaspag]
GO
/****** Object:  Default [DF__RJERARQ__Diasvac__739B0049]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RJERARQ] ADD  DEFAULT ((0)) FOR [Diasvac]
GO
/****** Object:  Default [DF__RJERARQ__Jdd__748F2482]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RJERARQ] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__RJerarq5__IdOrga__758348BB]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RJerarq5] ADD  DEFAULT ((0)) FOR [IdOrgani]
GO
/****** Object:  Default [DF__RJerarq5__IdNodo__76776CF4]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RJerarq5] ADD  DEFAULT ((0)) FOR [IdNodo]
GO
/****** Object:  Default [DF__RJerarq5__EsEmpr__776B912D]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RJerarq5] ADD  DEFAULT ((0)) FOR [EsEmpresa]
GO
/****** Object:  Default [DF__RJerarq5__Valor__785FB566]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RJerarq5] ADD  DEFAULT ((0)) FOR [Valor]
GO
/****** Object:  Default [DF__RJerarq5__Padre__7953D99F]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RJerarq5] ADD  DEFAULT ((0)) FOR [Padre]
GO
/****** Object:  Default [DF__RJerarq5__Jdd__7A47FDD8]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RJerarq5] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__RJerarq5__Codigo__7B3C2211]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RJerarq5] ADD  DEFAULT (' ') FOR [Codigo]
GO
/****** Object:  Default [DF__Rlicencias__Jdd__7C30464A]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rlicencias] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__Rlicencia__Clien__7D246A83]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rlicencias] ADD  DEFAULT (' ') FOR [Cliente]
GO
/****** Object:  Default [DF__Rlicencias__Id__7E188EBC]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rlicencias] ADD  DEFAULT ((0)) FOR [Id]
GO
/****** Object:  Default [DF__Rlicencia__Produ__7F0CB2F5]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rlicencias] ADD  DEFAULT ((0)) FOR [Producto]
GO
/****** Object:  Default [DF__Rlicencia__Fecha__0000D72E]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rlicencias] ADD  DEFAULT (getdate()) FOR [Fecha_lic]
GO
/****** Object:  Default [DF__Rlicencias__Dias__00F4FB67]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rlicencias] ADD  DEFAULT ((0)) FOR [Dias]
GO
/****** Object:  Default [DF__Rlicencias__Nlic__01E91FA0]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rlicencias] ADD  DEFAULT ((0)) FOR [Nlic]
GO
/****** Object:  Default [DF__Rlicencia__sitco__02DD43D9]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rlicencias] ADD  DEFAULT (' ') FOR [sitcod]
GO
/****** Object:  Default [DF__Rlicencia__Licen__03D16812]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rlicencias] ADD  DEFAULT (' ') FOR [Licencia]
GO
/****** Object:  Default [DF__Rlicencia__envio__04C58C4B]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rlicencias] ADD  DEFAULT (' ') FOR [envio]
GO
/****** Object:  Default [DF__Rlicencias__mail__05B9B084]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rlicencias] ADD  DEFAULT (' ') FOR [mail]
GO
/****** Object:  Default [DF__Rlicencias__Obs__06ADD4BD]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rlicencias] ADD  DEFAULT (' ') FOR [Obs]
GO
/****** Object:  Default [DF__Rlicencia__usuar__07A1F8F6]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rlicencias] ADD  DEFAULT (' ') FOR [usuario]
GO
/****** Object:  Default [DF__Rlicencia__wcomp__08961D2F]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rlicencias] ADD  DEFAULT (' ') FOR [wcompu]
GO
/****** Object:  Default [DF__Rlicencia__IDCli__098A4168]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rlicencias] ADD  DEFAULT ((0)) FOR [IDCliente]
GO
/****** Object:  Default [DF__Rliquid__Codigo__0A7E65A1]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rliquid] ADD  DEFAULT (' ') FOR [Codigo]
GO
/****** Object:  Default [DF__Rliquid__Ames__0B7289DA]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rliquid] ADD  DEFAULT (' ') FOR [Ames]
GO
/****** Object:  Default [DF__Rliquid__Peri__0C66AE13]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rliquid] ADD  DEFAULT (' ') FOR [Peri]
GO
/****** Object:  Default [DF__Rliquid__Cohade__0D5AD24C]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rliquid] ADD  DEFAULT (' ') FOR [Cohade]
GO
/****** Object:  Default [DF__Rliquid__Tipo__0E4EF685]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rliquid] ADD  DEFAULT ((0)) FOR [Tipo]
GO
/****** Object:  Default [DF__Rliquid__Descitm__0F431ABE]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rliquid] ADD  DEFAULT (' ') FOR [Descitm]
GO
/****** Object:  Default [DF__Rliquid__Orden__10373EF7]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rliquid] ADD  DEFAULT ((0)) FOR [Orden]
GO
/****** Object:  Default [DF__Rliquid__Monto__112B6330]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rliquid] ADD  DEFAULT ((0)) FOR [Monto]
GO
/****** Object:  Default [DF__Rliquid__MontoO__121F8769]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rliquid] ADD  DEFAULT ((0)) FOR [MontoO]
GO
/****** Object:  Default [DF__Rliquid__MontoA__1313ABA2]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rliquid] ADD  DEFAULT ((0)) FOR [MontoA]
GO
/****** Object:  Default [DF__Rliquid__Vo__1407CFDB]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rliquid] ADD  DEFAULT ((0)) FOR [Vo]
GO
/****** Object:  Default [DF__Rliquid__PerImp__14FBF414]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rliquid] ADD  DEFAULT ((0)) FOR [PerImp]
GO
/****** Object:  Default [DF__Rliquid__Empresa__15F0184D]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rliquid] ADD  DEFAULT (' ') FOR [Empresa]
GO
/****** Object:  Default [DF__Rliquid__Inform__16E43C86]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rliquid] ADD  DEFAULT (' ') FOR [Inform]
GO
/****** Object:  Default [DF__Rliquid__Cencos__17D860BF]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rliquid] ADD  DEFAULT ((0)) FOR [Cencos]
GO
/****** Object:  Default [DF__Rliquid__Coprev__18CC84F8]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rliquid] ADD  DEFAULT ((0)) FOR [Coprev]
GO
/****** Object:  Default [DF__Rliquid__Origen__19C0A931]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rliquid] ADD  DEFAULT (' ') FOR [Origen]
GO
/****** Object:  Default [DF__Rliquid__Cod_reg__1AB4CD6A]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rliquid] ADD  DEFAULT ((0)) FOR [Cod_reg]
GO
/****** Object:  Default [DF__Rliquid__Codpres__1BA8F1A3]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rliquid] ADD  DEFAULT ((0)) FOR [Codpres]
GO
/****** Object:  Default [DF__Rliquid__Cmapa__1C9D15DC]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rliquid] ADD  DEFAULT (' ') FOR [Cmapa]
GO
/****** Object:  Default [DF__Rliquid__Dato__1D913A15]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rliquid] ADD  DEFAULT (' ') FOR [Dato]
GO
/****** Object:  Default [DF__Rliquid__Nro__1E855E4E]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rliquid] ADD  DEFAULT ((0)) FOR [Nro]
GO
/****** Object:  Default [DF__Rliquid__Jdd__1F798287]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rliquid] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__Rlog__Jdd__206DA6C0]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rlog] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__Rlog__Id__2161CAF9]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rlog] ADD  DEFAULT ((0)) FOR [Id]
GO
/****** Object:  Default [DF__Rlog__Proced__2255EF32]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rlog] ADD  DEFAULT (' ') FOR [Proced]
GO
/****** Object:  Default [DF__Rlog__codigoA__234A136B]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rlog] ADD  DEFAULT (' ') FOR [codigoA]
GO
/****** Object:  Default [DF__Rlog__Concepto__243E37A4]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rlog] ADD  DEFAULT (' ') FOR [Concepto]
GO
/****** Object:  Default [DF__Rlog__Deta__25325BDD]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rlog] ADD  DEFAULT (' ') FOR [Deta]
GO
/****** Object:  Default [DF__Rlog__Fecha__26268016]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rlog] ADD  DEFAULT (getdate()) FOR [Fecha]
GO
/****** Object:  Default [DF__Rlog__Usuario__271AA44F]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rlog] ADD  DEFAULT (' ') FOR [Usuario]
GO
/****** Object:  Default [DF__Rlog__Wcompu__280EC888]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rlog] ADD  DEFAULT (' ') FOR [Wcompu]
GO
/****** Object:  Default [DF__Rlog__Nucomp__2902ECC1]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rlog] ADD  DEFAULT (' ') FOR [Nucomp]
GO
/****** Object:  Default [DF__RlogAlertas__Jdd__29F710FA]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RlogAlertas] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__RlogAlertas__Nro__2AEB3533]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RlogAlertas] ADD  DEFAULT ((0)) FOR [Nro]
GO
/****** Object:  Default [DF__RlogAlert__Detal__2BDF596C]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RlogAlertas] ADD  DEFAULT (' ') FOR [Detalle]
GO
/****** Object:  Default [DF__RlogAlert__Estad__2CD37DA5]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RlogAlertas] ADD  DEFAULT (' ') FOR [Estado]
GO
/****** Object:  Default [DF__RlogAlert__Usuar__2DC7A1DE]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RlogAlertas] ADD  DEFAULT (' ') FOR [Usuario]
GO
/****** Object:  Default [DF__RlogAlert__Fecha__2EBBC617]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RlogAlertas] ADD  DEFAULT (getdate()) FOR [Fecha]
GO
/****** Object:  Default [DF__RlogClient__Tipo__2FAFEA50]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RlogCliente] ADD  DEFAULT (' ') FOR [Tipo]
GO
/****** Object:  Default [DF__RlogClien__Desci__30A40E89]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RlogCliente] ADD  DEFAULT (' ') FOR [Descip]
GO
/****** Object:  Default [DF__RlogClien__Clien__319832C2]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RlogCliente] ADD  DEFAULT (' ') FOR [Cliente]
GO
/****** Object:  Default [DF__RlogClien__Nombr__328C56FB]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RlogCliente] ADD  DEFAULT (' ') FOR [NombreBase]
GO
/****** Object:  Default [DF__RlogClien__Fecha__33807B34]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RlogCliente] ADD  DEFAULT (getdate()) FOR [Fecha]
GO
/****** Object:  Default [DF__RlogMP__Fecha__34749F6D]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RlogMP] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [Fecha]
GO
/****** Object:  Default [DF__RlogMP__Jdatos__3568C3A6]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RlogMP] ADD  DEFAULT (' ') FOR [Jdatos]
GO
/****** Object:  Default [DF__RlogMP__Servidor__365CE7DF]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RlogMP] ADD  DEFAULT (' ') FOR [Servidor]
GO
/****** Object:  Default [DF__RlogMP__Base__37510C18]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RlogMP] ADD  DEFAULT (' ') FOR [Base]
GO
/****** Object:  Default [DF__RlogMP__UserPay__38453051]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RlogMP] ADD  DEFAULT (' ') FOR [UserPay]
GO
/****** Object:  Default [DF__RlogMP__UserWin__3939548A]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RlogMP] ADD  DEFAULT (' ') FOR [UserWin]
GO
/****** Object:  Default [DF__RlogMP__Proced__3A2D78C3]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RlogMP] ADD  DEFAULT (' ') FOR [Proced]
GO
/****** Object:  Default [DF__RlogMP__Ruta__3B219CFC]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RlogMP] ADD  DEFAULT (' ') FOR [Ruta]
GO
/****** Object:  Default [DF__RlogMP__Estado__3C15C135]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RlogMP] ADD  DEFAULT (' ') FOR [Estado]
GO
/****** Object:  Default [DF__RlogMP__Jdd__3D09E56E]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RlogMP] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__Rlogval__Jdd__3DFE09A7]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rlogval] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__Rlogval__Proced__3EF22DE0]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rlogval] ADD  DEFAULT (' ') FOR [Proced]
GO
/****** Object:  Default [DF__Rlogval__Codigo__3FE65219]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rlogval] ADD  DEFAULT (' ') FOR [Codigo]
GO
/****** Object:  Default [DF__Rlogval__Tipo__40DA7652]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rlogval] ADD  DEFAULT (' ') FOR [Tipo]
GO
/****** Object:  Default [DF__Rlogval__Mens_Er__41CE9A8B]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rlogval] ADD  DEFAULT (' ') FOR [Mens_Error]
GO
/****** Object:  Default [DF__Rlogval__Fecha__42C2BEC4]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rlogval] ADD  DEFAULT (getdate()) FOR [Fecha]
GO
/****** Object:  Default [DF__Rlogval__Usuario__43B6E2FD]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rlogval] ADD  DEFAULT (' ') FOR [Usuario]
GO
/****** Object:  Default [DF__Rlogval__Lote__44AB0736]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rlogval] ADD  DEFAULT (' ') FOR [Lote]
GO
/****** Object:  Default [DF__RLotes__Ames__459F2B6F]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RLotes] ADD  DEFAULT (' ') FOR [Ames]
GO
/****** Object:  Default [DF__RLotes__Peri__46934FA8]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RLotes] ADD  DEFAULT (' ') FOR [Peri]
GO
/****** Object:  Default [DF__RLotes__Fecha_cr__478773E1]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RLotes] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [Fecha_cre]
GO
/****** Object:  Default [DF__RLotes__Usu_cre__487B981A]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RLotes] ADD  DEFAULT (' ') FOR [Usu_cre]
GO
/****** Object:  Default [DF__RLotes__Obs_cre__496FBC53]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RLotes] ADD  DEFAULT (' ') FOR [Obs_cre]
GO
/****** Object:  Default [DF__RLotes__Total_em__4A63E08C]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RLotes] ADD  DEFAULT ((0)) FOR [Total_emp]
GO
/****** Object:  Default [DF__RLotes__Fecha_ac__4B5804C5]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RLotes] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [Fecha_acr]
GO
/****** Object:  Default [DF__RLotes__Fecha_pa__4C4C28FE]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RLotes] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [Fecha_pag]
GO
/****** Object:  Default [DF__RLotes__Estado__4D404D37]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RLotes] ADD  DEFAULT ((0)) FOR [Estado]
GO
/****** Object:  Default [DF__RLotes__Fecha_mo__4E347170]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RLotes] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [Fecha_mod]
GO
/****** Object:  Default [DF__RLotes__Usu_mod__4F2895A9]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RLotes] ADD  DEFAULT (' ') FOR [Usu_mod]
GO
/****** Object:  Default [DF__RLotes__Obs_mod__501CB9E2]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RLotes] ADD  DEFAULT (' ') FOR [Obs_mod]
GO
/****** Object:  Default [DF__RLotes__Jdd__5110DE1B]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RLotes] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__RMAPITM__Codigo__52050254]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RMAPITM] ADD  DEFAULT (' ') FOR [Codigo]
GO
/****** Object:  Default [DF__RMAPITM__Cohade__52F9268D]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RMAPITM] ADD  DEFAULT (' ') FOR [Cohade]
GO
/****** Object:  Default [DF__RMAPITM__Nro__53ED4AC6]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RMAPITM] ADD  DEFAULT ((0)) FOR [Nro]
GO
/****** Object:  Default [DF__RMAPITM__Tipo__54E16EFF]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RMAPITM] ADD  DEFAULT ((0)) FOR [Tipo]
GO
/****** Object:  Default [DF__RMAPITM__Orden__55D59338]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RMAPITM] ADD  DEFAULT ((0)) FOR [Orden]
GO
/****** Object:  Default [DF__RMAPITM__Periodo__56C9B771]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RMAPITM] ADD  DEFAULT (' ') FOR [Periodo]
GO
/****** Object:  Default [DF__RMAPITM__COFORM__57BDDBAA]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RMAPITM] ADD  DEFAULT (' ') FOR [COFORM]
GO
/****** Object:  Default [DF__RMAPITM__CUOTOT__58B1FFE3]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RMAPITM] ADD  DEFAULT ((0)) FOR [CUOTOT]
GO
/****** Object:  Default [DF__RMAPITM__CUOPAR__59A6241C]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RMAPITM] ADD  DEFAULT ((0)) FOR [CUOPAR]
GO
/****** Object:  Default [DF__RMAPITM__Monto__5A9A4855]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RMAPITM] ADD  DEFAULT ((0)) FOR [Monto]
GO
/****** Object:  Default [DF__RMAPITM__Fecha_c__5B8E6C8E]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RMAPITM] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [Fecha_cre]
GO
/****** Object:  Default [DF__RMAPITM__Fecha_i__5C8290C7]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RMAPITM] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [Fecha_ini]
GO
/****** Object:  Default [DF__RMAPITM__Fecha_f__5D76B500]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RMAPITM] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [Fecha_fin]
GO
/****** Object:  Default [DF__RMAPITM__Cencos__5E6AD939]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RMAPITM] ADD  DEFAULT ((0)) FOR [Cencos]
GO
/****** Object:  Default [DF__RMAPITM__Cuenta__5F5EFD72]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RMAPITM] ADD  DEFAULT (' ') FOR [Cuenta]
GO
/****** Object:  Default [DF__RMAPITM__Ticen__605321AB]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RMAPITM] ADD  DEFAULT (' ') FOR [Ticen]
GO
/****** Object:  Default [DF__RMAPITM__Fepro__614745E4]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RMAPITM] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [Fepro]
GO
/****** Object:  Default [DF__RMAPITM__Codpres__623B6A1D]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RMAPITM] ADD  DEFAULT ((0)) FOR [Codpres]
GO
/****** Object:  Default [DF__RMAPITM__Obs__632F8E56]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RMAPITM] ADD  DEFAULT (' ') FOR [Obs]
GO
/****** Object:  Default [DF__RMAPITM__Formula__6423B28F]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RMAPITM] ADD  DEFAULT (' ') FOR [Formula]
GO
/****** Object:  Default [DF__RMAPITM__Procede__6517D6C8]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RMAPITM] ADD  DEFAULT (' ') FOR [Procede]
GO
/****** Object:  Default [DF__RMAPITM__Estado__660BFB01]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RMAPITM] ADD  DEFAULT (' ') FOR [Estado]
GO
/****** Object:  Default [DF__RMAPITM__Coinst__67001F3A]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RMAPITM] ADD  DEFAULT ((0)) FOR [Coinst]
GO
/****** Object:  Default [DF__RMAPITM__PerImp__67F44373]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RMAPITM] ADD  DEFAULT ((0)) FOR [PerImp]
GO
/****** Object:  Default [DF__RMAPITM__Pone__68E867AC]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RMAPITM] ADD  DEFAULT (' ') FOR [Pone]
GO
/****** Object:  Default [DF__RMAPITM__Acumu__69DC8BE5]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RMAPITM] ADD  DEFAULT ((0)) FOR [Acumu]
GO
/****** Object:  Default [DF__RMAPITM__Tiacu__6AD0B01E]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RMAPITM] ADD  DEFAULT (' ') FOR [Tiacu]
GO
/****** Object:  Default [DF__RMAPITM__MontoC__6BC4D457]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RMAPITM] ADD  DEFAULT ((0)) FOR [MontoC]
GO
/****** Object:  Default [DF__RMAPITM__MontoP__6CB8F890]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RMAPITM] ADD  DEFAULT ((0)) FOR [MontoP]
GO
/****** Object:  Default [DF__RMAPITM__Propor__6DAD1CC9]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RMAPITM] ADD  DEFAULT (' ') FOR [Propor]
GO
/****** Object:  Default [DF__RMAPITM__Grupo__6EA14102]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RMAPITM] ADD  DEFAULT ((0)) FOR [Grupo]
GO
/****** Object:  Default [DF__RMAPITM__Condi__6F95653B]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RMAPITM] ADD  DEFAULT (' ') FOR [Condi]
GO
/****** Object:  Default [DF__RMAPITM__Simes__70898974]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RMAPITM] ADD  DEFAULT (' ') FOR [Simes]
GO
/****** Object:  Default [DF__RMAPITM__Queperi__717DADAD]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RMAPITM] ADD  DEFAULT (' ') FOR [Queperi]
GO
/****** Object:  Default [DF__RMAPITM__Fecha_i__7271D1E6]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RMAPITM] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(120)),(120))) FOR [Fecha_ing]
GO
/****** Object:  Default [DF__RMAPITM__Fecha_a__7365F61F]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RMAPITM] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(120)),(120))) FOR [Fecha_apr]
GO
/****** Object:  Default [DF__RMAPITM__Codigo___745A1A58]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RMAPITM] ADD  DEFAULT (' ') FOR [Codigo_in]
GO
/****** Object:  Default [DF__RMAPITM__Codigo___754E3E91]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RMAPITM] ADD  DEFAULT (' ') FOR [Codigo_ap]
GO
/****** Object:  Default [DF__RMAPITM__Plantil__764262CA]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RMAPITM] ADD  DEFAULT (' ') FOR [Plantilla]
GO
/****** Object:  Default [DF__RMAPITM__Ames__77368703]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RMAPITM] ADD  DEFAULT (' ') FOR [Ames]
GO
/****** Object:  Default [DF__RMAPITM__Moti_mo__782AAB3C]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RMAPITM] ADD  DEFAULT ((0)) FOR [Moti_mod]
GO
/****** Object:  Default [DF__RMAPITM__Fecha_u__791ECF75]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RMAPITM] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(120)),(120))) FOR [Fecha_ult]
GO
/****** Object:  Default [DF__RMAPITM__Jdd__7A12F3AE]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RMAPITM] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__RMAPITMH__Codigo__7B0717E7]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RMAPITMH] ADD  DEFAULT (' ') FOR [Codigo]
GO
/****** Object:  Default [DF__RMAPITMH__Cohade__7BFB3C20]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RMAPITMH] ADD  DEFAULT (' ') FOR [Cohade]
GO
/****** Object:  Default [DF__RMAPITMH__Nro__7CEF6059]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RMAPITMH] ADD  DEFAULT ((0)) FOR [Nro]
GO
/****** Object:  Default [DF__RMAPITMH__Tipo__7DE38492]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RMAPITMH] ADD  DEFAULT ((0)) FOR [Tipo]
GO
/****** Object:  Default [DF__RMAPITMH__Orden__7ED7A8CB]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RMAPITMH] ADD  DEFAULT ((0)) FOR [Orden]
GO
/****** Object:  Default [DF__RMAPITMH__Period__7FCBCD04]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RMAPITMH] ADD  DEFAULT (' ') FOR [Periodo]
GO
/****** Object:  Default [DF__RMAPITMH__COFORM__00BFF13D]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RMAPITMH] ADD  DEFAULT (' ') FOR [COFORM]
GO
/****** Object:  Default [DF__RMAPITMH__CUOTOT__01B41576]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RMAPITMH] ADD  DEFAULT ((0)) FOR [CUOTOT]
GO
/****** Object:  Default [DF__RMAPITMH__CUOPAR__02A839AF]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RMAPITMH] ADD  DEFAULT ((0)) FOR [CUOPAR]
GO
/****** Object:  Default [DF__RMAPITMH__Monto__039C5DE8]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RMAPITMH] ADD  DEFAULT ((0)) FOR [Monto]
GO
/****** Object:  Default [DF__RMAPITMH__Fecha___04908221]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RMAPITMH] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [Fecha_cre]
GO
/****** Object:  Default [DF__RMAPITMH__Fecha___0584A65A]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RMAPITMH] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [Fecha_ini]
GO
/****** Object:  Default [DF__RMAPITMH__Fecha___0678CA93]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RMAPITMH] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [Fecha_fin]
GO
/****** Object:  Default [DF__RMAPITMH__Cencos__076CEECC]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RMAPITMH] ADD  DEFAULT ((0)) FOR [Cencos]
GO
/****** Object:  Default [DF__RMAPITMH__Cuenta__08611305]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RMAPITMH] ADD  DEFAULT (' ') FOR [Cuenta]
GO
/****** Object:  Default [DF__RMAPITMH__Ticen__0955373E]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RMAPITMH] ADD  DEFAULT (' ') FOR [Ticen]
GO
/****** Object:  Default [DF__RMAPITMH__Fepro__0A495B77]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RMAPITMH] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [Fepro]
GO
/****** Object:  Default [DF__RMAPITMH__Codpre__0B3D7FB0]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RMAPITMH] ADD  DEFAULT ((0)) FOR [Codpres]
GO
/****** Object:  Default [DF__RMAPITMH__Obs__0C31A3E9]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RMAPITMH] ADD  DEFAULT (' ') FOR [Obs]
GO
/****** Object:  Default [DF__RMAPITMH__Formul__0D25C822]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RMAPITMH] ADD  DEFAULT (' ') FOR [Formula]
GO
/****** Object:  Default [DF__RMAPITMH__Proced__0E19EC5B]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RMAPITMH] ADD  DEFAULT (' ') FOR [Procede]
GO
/****** Object:  Default [DF__RMAPITMH__Estado__0F0E1094]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RMAPITMH] ADD  DEFAULT (' ') FOR [Estado]
GO
/****** Object:  Default [DF__RMAPITMH__Coinst__100234CD]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RMAPITMH] ADD  DEFAULT ((0)) FOR [Coinst]
GO
/****** Object:  Default [DF__RMAPITMH__PerImp__10F65906]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RMAPITMH] ADD  DEFAULT ((0)) FOR [PerImp]
GO
/****** Object:  Default [DF__RMAPITMH__Pone__11EA7D3F]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RMAPITMH] ADD  DEFAULT (' ') FOR [Pone]
GO
/****** Object:  Default [DF__RMAPITMH__Acumu__12DEA178]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RMAPITMH] ADD  DEFAULT ((0)) FOR [Acumu]
GO
/****** Object:  Default [DF__RMAPITMH__Tiacu__13D2C5B1]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RMAPITMH] ADD  DEFAULT (' ') FOR [Tiacu]
GO
/****** Object:  Default [DF__RMAPITMH__MontoC__14C6E9EA]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RMAPITMH] ADD  DEFAULT ((0)) FOR [MontoC]
GO
/****** Object:  Default [DF__RMAPITMH__MontoP__15BB0E23]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RMAPITMH] ADD  DEFAULT ((0)) FOR [MontoP]
GO
/****** Object:  Default [DF__RMAPITMH__Propor__16AF325C]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RMAPITMH] ADD  DEFAULT (' ') FOR [Propor]
GO
/****** Object:  Default [DF__RMAPITMH__Grupo__17A35695]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RMAPITMH] ADD  DEFAULT ((0)) FOR [Grupo]
GO
/****** Object:  Default [DF__RMAPITMH__Condi__18977ACE]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RMAPITMH] ADD  DEFAULT (' ') FOR [Condi]
GO
/****** Object:  Default [DF__RMAPITMH__Simes__198B9F07]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RMAPITMH] ADD  DEFAULT (' ') FOR [Simes]
GO
/****** Object:  Default [DF__RMAPITMH__Queper__1A7FC340]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RMAPITMH] ADD  DEFAULT (' ') FOR [Queperi]
GO
/****** Object:  Default [DF__RMAPITMH__Fecha___1B73E779]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RMAPITMH] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(120)),(120))) FOR [Fecha_ing]
GO
/****** Object:  Default [DF__RMAPITMH__Fecha___1C680BB2]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RMAPITMH] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(120)),(120))) FOR [Fecha_apr]
GO
/****** Object:  Default [DF__RMAPITMH__Codigo__1D5C2FEB]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RMAPITMH] ADD  DEFAULT (' ') FOR [Codigo_in]
GO
/****** Object:  Default [DF__RMAPITMH__Codigo__1E505424]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RMAPITMH] ADD  DEFAULT (' ') FOR [Codigo_ap]
GO
/****** Object:  Default [DF__RMAPITMH__Planti__1F44785D]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RMAPITMH] ADD  DEFAULT (' ') FOR [Plantilla]
GO
/****** Object:  Default [DF__RMAPITMH__Ames__20389C96]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RMAPITMH] ADD  DEFAULT (' ') FOR [Ames]
GO
/****** Object:  Default [DF__RMAPITMH__Moti_m__212CC0CF]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RMAPITMH] ADD  DEFAULT ((0)) FOR [Moti_mod]
GO
/****** Object:  Default [DF__RMAPITMH__Fecha___2220E508]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RMAPITMH] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(120)),(120))) FOR [Fecha_ult]
GO
/****** Object:  Default [DF__RMAPITMH__Jdd__23150941]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RMAPITMH] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__Rmodesp__IDmodes__24092D7A]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rmodesp] ADD  DEFAULT (' ') FOR [IDmodesp]
GO
/****** Object:  Default [DF__Rmodesp__Descrip__24FD51B3]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rmodesp] ADD  DEFAULT (' ') FOR [Descrip]
GO
/****** Object:  Default [DF__Rmodesp__Fecha__25F175EC]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rmodesp] ADD  DEFAULT (getdate()) FOR [Fecha]
GO
/****** Object:  Default [DF__Rmodesp__Usuario__26E59A25]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rmodesp] ADD  DEFAULT (' ') FOR [Usuario]
GO
/****** Object:  Default [DF__Rmodesp__Definic__27D9BE5E]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rmodesp] ADD  DEFAULT (' ') FOR [Definicion]
GO
/****** Object:  Default [DF__Rmodesp__Jdd__28CDE297]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[Rmodesp] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__RModgest__IDModu__29C206D0]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RModgest] ADD  DEFAULT (' ') FOR [IDModulo]
GO
/****** Object:  Default [DF__RModgest__Descri__2AB62B09]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RModgest] ADD  DEFAULT (' ') FOR [Descrip]
GO
/****** Object:  Default [DF__RModgest__Clasif__2BAA4F42]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RModgest] ADD  DEFAULT ((0)) FOR [Clasif]
GO
/****** Object:  Default [DF__RModgest__Planti__2C9E737B]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RModgest] ADD  DEFAULT ((0)) FOR [Plantilla]
GO
/****** Object:  Default [DF__RModgest__Fecha___2D9297B4]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RModgest] ADD  DEFAULT (getdate()) FOR [Fecha_cre]
GO
/****** Object:  Default [DF__RModgest__idCubo__2E86BBED]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RModgest] ADD  DEFAULT (' ') FOR [idCubo]
GO
/****** Object:  Default [DF__RModgest__Dueno__2F7AE026]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RModgest] ADD  DEFAULT (' ') FOR [Dueno]
GO
/****** Object:  Default [DF__RModgest__Jdd__306F045F]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RModgest] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__RModgest__seteo__31632898]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RModgest] ADD  DEFAULT (' ') FOR [seteo]
GO
/****** Object:  Default [DF__RMODIFICAS__Id__32574CD1]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RMODIFICAS] ADD  DEFAULT ((0)) FOR [Id]
GO
/****** Object:  Default [DF__RMODIFICA__Fecha__334B710A]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RMODIFICAS] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(120)),(120))) FOR [Fecha]
GO
/****** Object:  Default [DF__RMODIFICA__Conce__343F9543]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RMODIFICAS] ADD  DEFAULT (' ') FOR [Concepto]
GO
/****** Object:  Default [DF__RMODIFICA__Codig__3533B97C]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RMODIFICAS] ADD  DEFAULT (' ') FOR [CodigoC]
GO
/****** Object:  Default [DF__RMODIFICAS__Acc__3627DDB5]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RMODIFICAS] ADD  DEFAULT (' ') FOR [Acc]
GO
/****** Object:  Default [DF__RMODIFICA__Codig__371C01EE]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RMODIFICAS] ADD  DEFAULT (' ') FOR [Codigo]
GO
/****** Object:  Default [DF__RMODIFICAS__Deta__38102627]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RMODIFICAS] ADD  DEFAULT (' ') FOR [Deta]
GO
/****** Object:  Default [DF__RMODIFICA__Usuar__39044A60]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RMODIFICAS] ADD  DEFAULT (' ') FOR [Usuario]
GO
/****** Object:  Default [DF__RMODIFICA__Wcomp__39F86E99]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RMODIFICAS] ADD  DEFAULT (' ') FOR [Wcompu]
GO
/****** Object:  Default [DF__RMODIFICAS__Jdd__3AEC92D2]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RMODIFICAS] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__RModRepOp__CodTa__3BE0B70B]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RModRepOp] ADD  DEFAULT ((0)) FOR [CodTab80]
GO
/****** Object:  Default [DF__RModRepOp__CodTa__3CD4DB44]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RModRepOp] ADD  DEFAULT ((0)) FOR [CodTab81]
GO
/****** Object:  Default [DF__RModRepOp__id__3DC8FF7D]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RModRepOp] ADD  DEFAULT ((0)) FOR [id]
GO
/****** Object:  Default [DF__RModRepOp__Jdd__3EBD23B6]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[RModRepOp] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__RMODULOS__Modulo__3FB147EF]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RMODULOS] ADD  DEFAULT (' ') FOR [Modulo]
GO
/****** Object:  Default [DF__RMODULOS__Descri__40A56C28]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RMODULOS] ADD  DEFAULT (' ') FOR [Descrip]
GO
/****** Object:  Default [DF__RMODULOS__Clasif__41999061]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RMODULOS] ADD  DEFAULT ((0)) FOR [Clasif]
GO
/****** Object:  Default [DF__RMODULOS__Campos__428DB49A]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RMODULOS] ADD  DEFAULT (' ') FOR [Campos]
GO
/****** Object:  Default [DF__RMODULOS__Desde__4381D8D3]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RMODULOS] ADD  DEFAULT (' ') FOR [Desde]
GO
/****** Object:  Default [DF__RMODULOS__Filtro__4475FD0C]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RMODULOS] ADD  DEFAULT (' ') FOR [Filtro]
GO
/****** Object:  Default [DF__RMODULOS__Agrupa__456A2145]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RMODULOS] ADD  DEFAULT (' ') FOR [Agrupa]
GO
/****** Object:  Default [DF__RMODULOS__Orden__465E457E]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RMODULOS] ADD  DEFAULT (' ') FOR [Orden]
GO
/****** Object:  Default [DF__RMODULOS__Tipper__475269B7]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RMODULOS] ADD  DEFAULT ((0)) FOR [Tipper]
GO
/****** Object:  Default [DF__RMODULOS__Cohade__48468DF0]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RMODULOS] ADD  DEFAULT (' ') FOR [Cohades]
GO
/****** Object:  Default [DF__RMODULOS__Indir__493AB229]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RMODULOS] ADD  DEFAULT ((0)) FOR [Indir]
GO
/****** Object:  Default [DF__RMODULOS__Grupos__4A2ED662]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RMODULOS] ADD  DEFAULT (' ') FOR [Grupos]
GO
/****** Object:  Default [DF__RMODULOS__Direct__4B22FA9B]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RMODULOS] ADD  DEFAULT (' ') FOR [Directa]
GO
/****** Object:  Default [DF__RMODULOS__Swhere__4C171ED4]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RMODULOS] ADD  DEFAULT (' ') FOR [Swhere]
GO
/****** Object:  Default [DF__RMODULOS__Nperio__4D0B430D]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RMODULOS] ADD  DEFAULT ((0)) FOR [Nperiodo]
GO
/****** Object:  Default [DF__RMODULOS__varis__4DFF6746]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RMODULOS] ADD  DEFAULT (' ') FOR [varis]
GO
/****** Object:  Default [DF__RMODULOS__Dueno__4EF38B7F]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RMODULOS] ADD  DEFAULT (' ') FOR [Dueno]
GO
/****** Object:  Default [DF__RMODULOS__Jdd__4FE7AFB8]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RMODULOS] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__Rmodulos5__IDMod__50DBD3F1]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Rmodulos5] ADD  DEFAULT (' ') FOR [IDModulo]
GO
/****** Object:  Default [DF__Rmodulos5__Descr__51CFF82A]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Rmodulos5] ADD  DEFAULT (' ') FOR [Descrip]
GO
/****** Object:  Default [DF__Rmodulos5__Clasi__52C41C63]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Rmodulos5] ADD  DEFAULT ((0)) FOR [Clasif]
GO
/****** Object:  Default [DF__Rmodulos5__Campo__53B8409C]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Rmodulos5] ADD  DEFAULT (' ') FOR [Campos]
GO
/****** Object:  Default [DF__Rmodulos5__Desde__54AC64D5]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Rmodulos5] ADD  DEFAULT (' ') FOR [Desde]
GO
/****** Object:  Default [DF__Rmodulos5__Filtr__55A0890E]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Rmodulos5] ADD  DEFAULT (' ') FOR [Filtro]
GO
/****** Object:  Default [DF__Rmodulos5__Agrup__5694AD47]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Rmodulos5] ADD  DEFAULT (' ') FOR [Agrupa]
GO
/****** Object:  Default [DF__Rmodulos5__Orden__5788D180]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Rmodulos5] ADD  DEFAULT (' ') FOR [Orden]
GO
/****** Object:  Default [DF__Rmodulos5__Tippe__587CF5B9]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Rmodulos5] ADD  DEFAULT ((0)) FOR [Tipper]
GO
/****** Object:  Default [DF__Rmodulos5__Cohad__597119F2]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Rmodulos5] ADD  DEFAULT (' ') FOR [Cohades]
GO
/****** Object:  Default [DF__Rmodulos5__Indir__5A653E2B]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Rmodulos5] ADD  DEFAULT ((0)) FOR [Indir]
GO
/****** Object:  Default [DF__Rmodulos5__Grupo__5B596264]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Rmodulos5] ADD  DEFAULT (' ') FOR [Grupos]
GO
/****** Object:  Default [DF__Rmodulos5__SQL__5C4D869D]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Rmodulos5] ADD  DEFAULT (' ') FOR [SQL]
GO
/****** Object:  Default [DF__Rmodulos5__Swher__5D41AAD6]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Rmodulos5] ADD  DEFAULT (' ') FOR [Swhere]
GO
/****** Object:  Default [DF__Rmodulos5__Nperi__5E35CF0F]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Rmodulos5] ADD  DEFAULT ((0)) FOR [Nperiodo]
GO
/****** Object:  Default [DF__Rmodulos5__varis__5F29F348]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Rmodulos5] ADD  DEFAULT (' ') FOR [varis]
GO
/****** Object:  Default [DF__Rmodulos5__Dueno__601E1781]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Rmodulos5] ADD  DEFAULT (' ') FOR [Dueno]
GO
/****** Object:  Default [DF__Rmodulos5__Jdd__61123BBA]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Rmodulos5] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__Rmodulos5__SQLDi__62065FF3]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Rmodulos5] ADD  DEFAULT (' ') FOR [SQLDirecto]
GO
/****** Object:  Default [DF__Rmodulos5__FSQLD__62FA842C]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Rmodulos5] ADD  DEFAULT (' ') FOR [FSQLDirect]
GO
/****** Object:  Default [DF__Rmodulos5__order__63EEA865]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Rmodulos5] ADD  DEFAULT (' ') FOR [orderby]
GO
/****** Object:  Default [DF__RmodulosI__Jdd__64E2CC9E]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RmodulosI] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__RmodulosI__Id__65D6F0D7]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RmodulosI] ADD  DEFAULT (' ') FOR [Id]
GO
/****** Object:  Default [DF__RmodulosI__Descr__66CB1510]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RmodulosI] ADD  DEFAULT (' ') FOR [Descrip]
GO
/****** Object:  Default [DF__RmodulosI__Clasi__67BF3949]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RmodulosI] ADD  DEFAULT ((0)) FOR [Clasif]
GO
/****** Object:  Default [DF__RmodulosI__Campo__68B35D82]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RmodulosI] ADD  DEFAULT (' ') FOR [Campos]
GO
/****** Object:  Default [DF__RmodulosI__Total__69A781BB]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RmodulosI] ADD  DEFAULT (' ') FOR [Totales]
GO
/****** Object:  Default [DF__RmodulosI__Tabla__6A9BA5F4]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RmodulosI] ADD  DEFAULT (' ') FOR [Tablas]
GO
/****** Object:  Default [DF__RmodulosI__Filtr__6B8FCA2D]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RmodulosI] ADD  DEFAULT (' ') FOR [Filtro]
GO
/****** Object:  Default [DF__RmodulosI__Orden__6C83EE66]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RmodulosI] ADD  DEFAULT (' ') FOR [Orden]
GO
/****** Object:  Default [DF__RmodulosI__Agrup__6D78129F]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RmodulosI] ADD  DEFAULT (' ') FOR [Agrupa]
GO
/****** Object:  Default [DF__RmodulosI__Peri__6E6C36D8]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RmodulosI] ADD  DEFAULT (' ') FOR [Peri]
GO
/****** Object:  Default [DF__RmodulosI__Dueno__6F605B11]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RmodulosI] ADD  DEFAULT (' ') FOR [Dueno]
GO
/****** Object:  Default [DF__RmodulosI__Grupo__70547F4A]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RmodulosI] ADD  DEFAULT (' ') FOR [Grupos]
GO
/****** Object:  Default [DF__RmodulosI__fecha__7148A383]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RmodulosI] ADD  DEFAULT (getdate()) FOR [fecha_cre]
GO
/****** Object:  Default [DF__Rmsm__usuario__723CC7BC]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Rmsm] ADD  DEFAULT (' ') FOR [usuario]
GO
/****** Object:  Default [DF__Rmsm__id__7330EBF5]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Rmsm] ADD  DEFAULT (' ') FOR [id]
GO
/****** Object:  Default [DF__Rmsm__message__7425102E]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Rmsm] ADD  DEFAULT (' ') FOR [message]
GO
/****** Object:  Default [DF__Rmsm__source__75193467]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Rmsm] ADD  DEFAULT (' ') FOR [source]
GO
/****** Object:  Default [DF__Rmsm__Fecha__760D58A0]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Rmsm] ADD  DEFAULT (getdate()) FOR [Fecha]
GO
/****** Object:  Default [DF__Rmsm__number__77017CD9]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Rmsm] ADD  DEFAULT (' ') FOR [number]
GO
/****** Object:  Default [DF__Rmsm__Jdd__77F5A112]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Rmsm] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__RnominaD__Jdd__78E9C54B]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RnominaD] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__RnominaD__Nomina__79DDE984]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RnominaD] ADD  DEFAULT ((0)) FOR [Nomina]
GO
/****** Object:  Default [DF__RnominaD__Linea__7AD20DBD]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RnominaD] ADD  DEFAULT ((0)) FOR [Linea]
GO
/****** Object:  Default [DF__RnominaD__codigo__7BC631F6]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RnominaD] ADD  DEFAULT (' ') FOR [codigo]
GO
/****** Object:  Default [DF__RnominaD__Id__7CBA562F]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RnominaD] ADD  DEFAULT ((0)) FOR [Id]
GO
/****** Object:  Default [DF__RnominaD__Cohade__7DAE7A68]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RnominaD] ADD  DEFAULT (' ') FOR [Cohade]
GO
/****** Object:  Default [DF__RnominaD__Monto__7EA29EA1]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RnominaD] ADD  DEFAULT ((0)) FOR [Monto]
GO
/****** Object:  Default [DF__RnominaD__Cuotas__7F96C2DA]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RnominaD] ADD  DEFAULT ((0)) FOR [Cuotas]
GO
/****** Object:  Default [DF__RnominaE__Jdd__008AE713]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RnominaE] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__RnominaE__Nomina__017F0B4C]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RnominaE] ADD  DEFAULT ((0)) FOR [Nomina]
GO
/****** Object:  Default [DF__RnominaE__Fecha___02732F85]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RnominaE] ADD  DEFAULT (getdate()) FOR [Fecha_ing]
GO
/****** Object:  Default [DF__RnominaE__Ames__036753BE]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RnominaE] ADD  DEFAULT (' ') FOR [Ames]
GO
/****** Object:  Default [DF__RnominaE__Peri__045B77F7]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RnominaE] ADD  DEFAULT (' ') FOR [Peri]
GO
/****** Object:  Default [DF__RnominaE__Ingres__054F9C30]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RnominaE] ADD  DEFAULT (' ') FOR [Ingreso]
GO
/****** Object:  Default [DF__RnominaE__Revisa__0643C069]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RnominaE] ADD  DEFAULT (' ') FOR [Revisa]
GO
/****** Object:  Default [DF__RnominaE__Aprueb__0737E4A2]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RnominaE] ADD  DEFAULT (' ') FOR [Aprueba]
GO
/****** Object:  Default [DF__RnominaE__Fecha___082C08DB]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RnominaE] ADD  DEFAULT (getdate()) FOR [Fecha_apr]
GO
/****** Object:  Default [DF__RnominaE__Descri__09202D14]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RnominaE] ADD  DEFAULT (' ') FOR [Descrip]
GO
/****** Object:  Default [DF__RnominaE__Estado__0A14514D]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RnominaE] ADD  DEFAULT (' ') FOR [Estado]
GO
/****** Object:  Default [DF__RnominaE__Motivo__0B087586]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RnominaE] ADD  DEFAULT (' ') FOR [Motivor]
GO
/****** Object:  Default [DF__rnotas__Jdd__0BFC99BF]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[rnotas] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__rnotas__Usuario__0CF0BDF8]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[rnotas] ADD  DEFAULT (' ') FOR [Usuario]
GO
/****** Object:  Default [DF__rnotas__Nro__0DE4E231]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[rnotas] ADD  DEFAULT ((0)) FOR [Nro]
GO
/****** Object:  Default [DF__rnotas__Fecha_cr__0ED9066A]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[rnotas] ADD  DEFAULT (getdate()) FOR [Fecha_cre]
GO
/****** Object:  Default [DF__rnotas__Descrip__0FCD2AA3]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[rnotas] ADD  DEFAULT (' ') FOR [Descrip]
GO
/****** Object:  Default [DF__rnotas__Fecha_ve__10C14EDC]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[rnotas] ADD  DEFAULT (getdate()) FOR [Fecha_ven]
GO
/****** Object:  Default [DF__rnotas__Tipo__11B57315]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[rnotas] ADD  DEFAULT (' ') FOR [Tipo]
GO
/****** Object:  Default [DF__rnotas__Detalle__12A9974E]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[rnotas] ADD  DEFAULT (' ') FOR [Detalle]
GO
/****** Object:  Default [DF__rnotas__FechaEnv__139DBB87]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[rnotas] ADD  DEFAULT (' ') FOR [FechaEnvio]
GO
/****** Object:  Default [DF__rnotas__Visto__1491DFC0]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[rnotas] ADD  DEFAULT ('N') FOR [Visto]
GO
/****** Object:  Default [DF__rnotas__EnviaSMS__158603F9]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[rnotas] ADD  DEFAULT (' ') FOR [EnviaSMS]
GO
/****** Object:  Default [DF__rnotas__EnviaMai__167A2832]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[rnotas] ADD  DEFAULT (' ') FOR [EnviaMail]
GO
/****** Object:  Default [DF__rnotici__tipo__176E4C6B]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[rnotici] ADD  DEFAULT ((0)) FOR [tipo]
GO
/****** Object:  Default [DF__rnotici__codigo__186270A4]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[rnotici] ADD  DEFAULT (' ') FOR [codigo]
GO
/****** Object:  Default [DF__rnotici__fecha_n__195694DD]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[rnotici] ADD  DEFAULT (getdate()) FOR [fecha_not]
GO
/****** Object:  Default [DF__rnotici__Detalle__1A4AB916]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[rnotici] ADD  DEFAULT (' ') FOR [Detalle]
GO
/****** Object:  Default [DF__rnotici__nro__1B3EDD4F]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[rnotici] ADD  DEFAULT ((0)) FOR [nro]
GO
/****** Object:  Default [DF__rnotici__usuario__1C330188]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[rnotici] ADD  DEFAULT (' ') FOR [usuario]
GO
/****** Object:  Default [DF__rnotici__jdd__1D2725C1]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[rnotici] ADD  DEFAULT ((0)) FOR [jdd]
GO
/****** Object:  Default [DF__RNUMCHE__Empresa__1E1B49FA]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RNUMCHE] ADD  DEFAULT (' ') FOR [Empresa]
GO
/****** Object:  Default [DF__RNUMCHE__Banco__1F0F6E33]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RNUMCHE] ADD  DEFAULT ((0)) FOR [Banco]
GO
/****** Object:  Default [DF__RNUMCHE__Numche__2003926C]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RNUMCHE] ADD  DEFAULT ((0)) FOR [Numche]
GO
/****** Object:  Default [DF__RNUMCHE__Codigo__20F7B6A5]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RNUMCHE] ADD  DEFAULT (' ') FOR [Codigo]
GO
/****** Object:  Default [DF__RNUMCHE__Monto__21EBDADE]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RNUMCHE] ADD  DEFAULT ((0)) FOR [Monto]
GO
/****** Object:  Default [DF__RNUMCHE__fecha__22DFFF17]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RNUMCHE] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [fecha]
GO
/****** Object:  Default [DF__RNUMCHE__Jdd__23D42350]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RNUMCHE] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__Rorgani__Nivel__24C84789]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Rorgani] ADD  DEFAULT (' ') FOR [Nivel]
GO
/****** Object:  Default [DF__Rorgani__Nroniv__25BC6BC2]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Rorgani] ADD  DEFAULT ((0)) FOR [Nroniv]
GO
/****** Object:  Default [DF__Rorgani__Descrip__26B08FFB]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Rorgani] ADD  DEFAULT (' ') FOR [Descrip]
GO
/****** Object:  Default [DF__Rorgani__Nivsup__27A4B434]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Rorgani] ADD  DEFAULT (' ') FOR [Nivsup]
GO
/****** Object:  Default [DF__Rorgani__Jdd__2898D86D]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Rorgani] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__ROrgani5__IdOrga__298CFCA6]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[ROrgani5] ADD  DEFAULT ((0)) FOR [IdOrgani]
GO
/****** Object:  Default [DF__ROrgani5__Descri__2A8120DF]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[ROrgani5] ADD  DEFAULT (' ') FOR [Descrip]
GO
/****** Object:  Default [DF__ROrgani5__Fecha___2B754518]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[ROrgani5] ADD  DEFAULT (getdate()) FOR [Fecha_ini]
GO
/****** Object:  Default [DF__ROrgani5__Fecha___2C696951]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[ROrgani5] ADD  DEFAULT (getdate()) FOR [Fecha_fin]
GO
/****** Object:  Default [DF__ROrgani5__Cotab__2D5D8D8A]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[ROrgani5] ADD  DEFAULT ((0)) FOR [Cotab]
GO
/****** Object:  Default [DF__ROrgani5__Jdd__2E51B1C3]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[ROrgani5] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__ROrgCar5__IdOrga__2F45D5FC]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[ROrgCar5] ADD  DEFAULT ((0)) FOR [IdOrgani]
GO
/****** Object:  Default [DF__ROrgCar5__IdNodo__3039FA35]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[ROrgCar5] ADD  DEFAULT ((0)) FOR [IdNodo]
GO
/****** Object:  Default [DF__ROrgCar5__Cargo__312E1E6E]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[ROrgCar5] ADD  DEFAULT ((0)) FOR [Cargo]
GO
/****** Object:  Default [DF__ROrgCar5__Cantid__322242A7]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[ROrgCar5] ADD  DEFAULT ((0)) FOR [Cantidad]
GO
/****** Object:  Default [DF__ROrgCar5__Jdd__331666E0]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[ROrgCar5] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__RORGFUN5__Idorga__340A8B19]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RORGFUN5] ADD  DEFAULT ((0)) FOR [Idorgani]
GO
/****** Object:  Default [DF__RORGFUN5__Idnodo__34FEAF52]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RORGFUN5] ADD  DEFAULT ((0)) FOR [Idnodo]
GO
/****** Object:  Default [DF__RORGFUN5__Codigo__35F2D38B]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RORGFUN5] ADD  DEFAULT (' ') FOR [Codigo]
GO
/****** Object:  Default [DF__RORGFUN5__Funcio__36E6F7C4]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RORGFUN5] ADD  DEFAULT ((0)) FOR [Funcion]
GO
/****** Object:  Default [DF__Rparams__Copar__37DB1BFD]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Rparams] ADD  DEFAULT (' ') FOR [Copar]
GO
/****** Object:  Default [DF__Rparams__Descrip__38CF4036]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Rparams] ADD  DEFAULT (' ') FOR [Descrip]
GO
/****** Object:  Default [DF__Rparams__Param__39C3646F]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Rparams] ADD  DEFAULT (' ') FOR [Param]
GO
/****** Object:  Default [DF__Rparams__Paradi__3AB788A8]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Rparams] ADD  DEFAULT (' ') FOR [Paradi]
GO
/****** Object:  Default [DF__Rparams__Jdd__3BABACE1]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Rparams] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__Rparams__Ngrab__3C9FD11A]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Rparams] ADD  DEFAULT ((0)) FOR [Ngrab]
GO
/****** Object:  Default [DF__Rpasiga__Codigo__3D93F553]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Rpasiga] ADD  DEFAULT (' ') FOR [Codigo]
GO
/****** Object:  Default [DF__Rpasiga__Peri__3E88198C]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Rpasiga] ADD  DEFAULT (' ') FOR [Peri]
GO
/****** Object:  Default [DF__Rpasiga__Concept__3F7C3DC5]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Rpasiga] ADD  DEFAULT (' ') FOR [Concepto]
GO
/****** Object:  Default [DF__Rpasiga__MontoM__407061FE]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Rpasiga] ADD  DEFAULT ((0)) FOR [MontoM]
GO
/****** Object:  Default [DF__Rpasiga__MontoP__41648637]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Rpasiga] ADD  DEFAULT ((0)) FOR [MontoP]
GO
/****** Object:  Default [DF__Rpasiga__MontoG__4258AA70]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Rpasiga] ADD  DEFAULT ((0)) FOR [MontoG]
GO
/****** Object:  Default [DF__Rpasiga__Fecha_p__434CCEA9]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Rpasiga] ADD  DEFAULT ((0)) FOR [Fecha_pag]
GO
/****** Object:  Default [DF__Rpasiga__Ames__4440F2E2]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Rpasiga] ADD  DEFAULT (' ') FOR [Ames]
GO
/****** Object:  Default [DF__Rpasiga__Jdd__4535171B]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Rpasiga] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__RPASREL__Codigo__46293B54]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RPASREL] ADD  DEFAULT (' ') FOR [Codigo]
GO
/****** Object:  Default [DF__RPASREL__Ames__471D5F8D]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RPASREL] ADD  DEFAULT (' ') FOR [Ames]
GO
/****** Object:  Default [DF__RPASREL__Empresa__481183C6]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RPASREL] ADD  DEFAULT (' ') FOR [Empresa]
GO
/****** Object:  Default [DF__RPASREL__Peri__4905A7FF]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RPASREL] ADD  DEFAULT (' ') FOR [Peri]
GO
/****** Object:  Default [DF__RPASREL__Afecto__49F9CC38]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RPASREL] ADD  DEFAULT ((0)) FOR [Afecto]
GO
/****** Object:  Default [DF__RPASREL__Impuest__4AEDF071]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RPASREL] ADD  DEFAULT ((0)) FOR [Impuesto]
GO
/****** Object:  Default [DF__RPASREL__Afp__4BE214AA]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RPASREL] ADD  DEFAULT ((0)) FOR [Afp]
GO
/****** Object:  Default [DF__RPASREL__Isapre__4CD638E3]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RPASREL] ADD  DEFAULT ((0)) FOR [Isapre]
GO
/****** Object:  Default [DF__RPASREL__Ktim__4DCA5D1C]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RPASREL] ADD  DEFAULT ((0)) FOR [Ktim]
GO
/****** Object:  Default [DF__RPASREL__ktimAfp__4EBE8155]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RPASREL] ADD  DEFAULT ((0)) FOR [ktimAfp]
GO
/****** Object:  Default [DF__RPASREL__Factor__4FB2A58E]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RPASREL] ADD  DEFAULT ((0)) FOR [Factor]
GO
/****** Object:  Default [DF__RPASREL__ScTafe__50A6C9C7]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RPASREL] ADD  DEFAULT ((0)) FOR [ScTafe]
GO
/****** Object:  Default [DF__RPASREL__ScTmon__519AEE00]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RPASREL] ADD  DEFAULT ((0)) FOR [ScTmon]
GO
/****** Object:  Default [DF__RPASREL__ScEafe__528F1239]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RPASREL] ADD  DEFAULT ((0)) FOR [ScEafe]
GO
/****** Object:  Default [DF__RPASREL__ScEmon__53833672]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RPASREL] ADD  DEFAULT ((0)) FOR [ScEmon]
GO
/****** Object:  Default [DF__RPASREL__ScIafe__54775AAB]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RPASREL] ADD  DEFAULT ((0)) FOR [ScIafe]
GO
/****** Object:  Default [DF__RPASREL__ScImon__556B7EE4]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RPASREL] ADD  DEFAULT ((0)) FOR [ScImon]
GO
/****** Object:  Default [DF__RPASREL__Traper__565FA31D]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RPASREL] ADD  DEFAULT ((0)) FOR [Traper]
GO
/****** Object:  Default [DF__RPASREL__Sisafp__5753C756]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RPASREL] ADD  DEFAULT ((0)) FOR [Sisafp]
GO
/****** Object:  Default [DF__RPASREL__Jdd__5847EB8F]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RPASREL] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__rpauser__Usuario__593C0FC8]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[rpauser] ADD  DEFAULT (' ') FOR [Usuario]
GO
/****** Object:  Default [DF__rpauser__Copar__5A303401]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[rpauser] ADD  DEFAULT (' ') FOR [Copar]
GO
/****** Object:  Default [DF__rpauser__Descrip__5B24583A]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[rpauser] ADD  DEFAULT (' ') FOR [Descrip]
GO
/****** Object:  Default [DF__rpauser__Param__5C187C73]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[rpauser] ADD  DEFAULT (' ') FOR [Param]
GO
/****** Object:  Default [DF__rpauser__Jdd__5D0CA0AC]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[rpauser] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__rpauser__paradi__5E00C4E5]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[rpauser] ADD  DEFAULT (' ') FOR [paradi]
GO
/****** Object:  Default [DF__RPerfiles__Jdd__5EF4E91E]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RPerfiles] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__RPerfiles__Perfi__5FE90D57]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RPerfiles] ADD  DEFAULT (' ') FOR [Perfil]
GO
/****** Object:  Default [DF__RPerfiles__Descr__60DD3190]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RPerfiles] ADD  DEFAULT (' ') FOR [Descrip]
GO
/****** Object:  Default [DF__RPerfiles__Dato__61D155C9]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RPerfiles] ADD  DEFAULT (' ') FOR [Dato]
GO
/****** Object:  Default [DF__Rpermisos__Grupo__62C57A02]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Rpermisos] ADD  DEFAULT (' ') FOR [Grupo]
GO
/****** Object:  Default [DF__Rpermisos__Item__63B99E3B]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Rpermisos] ADD  DEFAULT (' ') FOR [Item]
GO
/****** Object:  Default [DF__Rpermisos__Permi__64ADC274]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Rpermisos] ADD  DEFAULT (' ') FOR [Permisos]
GO
/****** Object:  Default [DF__Rpermisos__Verif__65A1E6AD]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Rpermisos] ADD  DEFAULT (' ') FOR [Verif]
GO
/****** Object:  Default [DF__Rpermisos__Jdd__66960AE6]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Rpermisos] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__RPLAING__Usuario__678A2F1F]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RPLAING] ADD  DEFAULT (' ') FOR [Usuario]
GO
/****** Object:  Default [DF__RPLAING__Fecha__687E5358]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RPLAING] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [Fecha]
GO
/****** Object:  Default [DF__RPLAING__Cencos__69727791]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RPLAING] ADD  DEFAULT ((0)) FOR [Cencos]
GO
/****** Object:  Default [DF__RPLAING__Codigo__6A669BCA]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RPLAING] ADD  DEFAULT (' ') FOR [Codigo]
GO
/****** Object:  Default [DF__RPLAING__Cohade__6B5AC003]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RPLAING] ADD  DEFAULT (' ') FOR [Cohade]
GO
/****** Object:  Default [DF__RPLAING__Monto__6C4EE43C]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RPLAING] ADD  DEFAULT ((0)) FOR [Monto]
GO
/****** Object:  Default [DF__RPLAING__Jdd__6D430875]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RPLAING] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__RPLANCU__Jdd__6E372CAE]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RPLANCU] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__RPLANCU__Codplan__6F2B50E7]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RPLANCU] ADD  DEFAULT ((0)) FOR [Codplan]
GO
/****** Object:  Default [DF__RPLANCU__Cohade__701F7520]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RPLANCU] ADD  DEFAULT (' ') FOR [Cohade]
GO
/****** Object:  Default [DF__RPLANCU__PerEsqD__71139959]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RPLANCU] ADD  DEFAULT ((0)) FOR [PerEsqD]
GO
/****** Object:  Default [DF__RPLANCU__PerEsqC__7207BD92]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RPLANCU] ADD  DEFAULT ((0)) FOR [PerEsqC]
GO
/****** Object:  Default [DF__RPLANCU__PerDato__72FBE1CB]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RPLANCU] ADD  DEFAULT (' ') FOR [PerDato]
GO
/****** Object:  Default [DF__RPLANCU__PerDato__73F00604]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RPLANCU] ADD  DEFAULT (' ') FOR [PerDato2]
GO
/****** Object:  Default [DF__RPLANCU__DiaEsqD__74E42A3D]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RPLANCU] ADD  DEFAULT ((0)) FOR [DiaEsqD]
GO
/****** Object:  Default [DF__RPLANCU__DiaEsqC__75D84E76]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RPLANCU] ADD  DEFAULT ((0)) FOR [DiaEsqC]
GO
/****** Object:  Default [DF__RPLANCU__DiaDato__76CC72AF]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RPLANCU] ADD  DEFAULT (' ') FOR [DiaDato]
GO
/****** Object:  Default [DF__RPLANCU__DiaDato__77C096E8]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RPLANCU] ADD  DEFAULT (' ') FOR [DiaDato2]
GO
/****** Object:  Default [DF__RPLANCU__Fuera__78B4BB21]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RPLANCU] ADD  DEFAULT (' ') FOR [Fuera]
GO
/****** Object:  Default [DF__RPREUNI__Empresa__79A8DF5A]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RPREUNI] ADD  DEFAULT (' ') FOR [Empresa]
GO
/****** Object:  Default [DF__RPREUNI__Unidad__7A9D0393]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RPREUNI] ADD  DEFAULT ((0)) FOR [Unidad]
GO
/****** Object:  Default [DF__RPREUNI__Depe__7B9127CC]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RPREUNI] ADD  DEFAULT (' ') FOR [Depe]
GO
/****** Object:  Default [DF__RPREUNI__Codres__7C854C05]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RPREUNI] ADD  DEFAULT (' ') FOR [Codres]
GO
/****** Object:  Default [DF__RPREUNI__Nivel__7D79703E]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RPREUNI] ADD  DEFAULT (' ') FOR [Nivel]
GO
/****** Object:  Default [DF__RPREUNI__Jdd__7E6D9477]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RPREUNI] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__rproducto__Descr__7F61B8B0]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[rproductos] ADD  DEFAULT (' ') FOR [Descrip]
GO
/****** Object:  Default [DF__rproducto__Preci__0055DCE9]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[rproductos] ADD  DEFAULT ((0)) FOR [Precio]
GO
/****** Object:  Default [DF__rproducto__Fecha__014A0122]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[rproductos] ADD  DEFAULT (getdate()) FOR [Fechaini]
GO
/****** Object:  Default [DF__rproducto__Fecha__023E255B]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[rproductos] ADD  DEFAULT (getdate()) FOR [Fechafin]
GO
/****** Object:  Default [DF__rproducto__Usuar__03324994]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[rproductos] ADD  DEFAULT (' ') FOR [UsuarAlta]
GO
/****** Object:  Default [DF__rproducto__Fecha__04266DCD]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[rproductos] ADD  DEFAULT (getdate()) FOR [FechaAlta]
GO
/****** Object:  Default [DF__rproducto__USUAR__051A9206]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[rproductos] ADD  DEFAULT (' ') FOR [USUARULTM]
GO
/****** Object:  Default [DF__rproducto__Fecha__060EB63F]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[rproductos] ADD  DEFAULT (getdate()) FOR [FechaUltM]
GO
/****** Object:  Default [DF__rproducto__Plata__0702DA78]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[rproductos] ADD  DEFAULT (' ') FOR [Plataforma]
GO
/****** Object:  Default [DF__rproducto__VencU__07F6FEB1]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[rproductos] ADD  DEFAULT (getdate()) FOR [VencUpgr]
GO
/****** Object:  Default [DF__rproducto__Tipol__08EB22EA]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[rproductos] ADD  DEFAULT (' ') FOR [Tipolic]
GO
/****** Object:  Default [DF__rproducto__Versi__09DF4723]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[rproductos] ADD  DEFAULT (' ') FOR [Version]
GO
/****** Object:  Default [DF__rproducto__Estup__0AD36B5C]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[rproductos] ADD  DEFAULT ((0)) FOR [Estup]
GO
/****** Object:  Default [DF__rproductos__Elim__0BC78F95]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[rproductos] ADD  DEFAULT ((0)) FOR [Elim]
GO
/****** Object:  Default [DF__rproducto__Activ__0CBBB3CE]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[rproductos] ADD  DEFAULT (' ') FOR [ActivoCRM]
GO
/****** Object:  Default [DF__rproducto__Activ__0DAFD807]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[rproductos] ADD  DEFAULT (' ') FOR [ActivoASP]
GO
/****** Object:  Default [DF__rproductos__Jdd__0EA3FC40]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[rproductos] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__rproducto__Servi__0F982079]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[rproductos] ADD  DEFAULT (' ') FOR [Servicio]
GO
/****** Object:  Default [DF__Rprogrl__Codigo__108C44B2]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Rprogrl] ADD  DEFAULT (' ') FOR [Codigo]
GO
/****** Object:  Default [DF__Rprogrl__Ames__118068EB]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Rprogrl] ADD  DEFAULT (' ') FOR [Ames]
GO
/****** Object:  Default [DF__Rprogrl__Empresa__12748D24]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Rprogrl] ADD  DEFAULT (' ') FOR [Empresa]
GO
/****** Object:  Default [DF__Rprogrl__Cencos__1368B15D]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Rprogrl] ADD  DEFAULT ((0)) FOR [Cencos]
GO
/****** Object:  Default [DF__Rprogrl__Dias__145CD596]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Rprogrl] ADD  DEFAULT ((0)) FOR [Dias]
GO
/****** Object:  Default [DF__Rprogrl__Monto__1550F9CF]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Rprogrl] ADD  DEFAULT ((0)) FOR [Monto]
GO
/****** Object:  Default [DF__Rprogrl__Base__16451E08]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Rprogrl] ADD  DEFAULT ((0)) FOR [Base]
GO
/****** Object:  Default [DF__Rprogrl__Diasp__17394241]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Rprogrl] ADD  DEFAULT ((0)) FOR [Diasp]
GO
/****** Object:  Default [DF__Rprogrl__Porcen__182D667A]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Rprogrl] ADD  DEFAULT ((0)) FOR [Porcen]
GO
/****** Object:  Default [DF__Rprogrl__Jdd__19218AB3]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Rprogrl] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__RPublica__RUT__1A15AEEC]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RPublica] ADD  DEFAULT (' ') FOR [RUT]
GO
/****** Object:  Default [DF__RPublica__Titulo__1B09D325]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RPublica] ADD  DEFAULT (' ') FOR [Titulo]
GO
/****** Object:  Default [DF__RPublica__autore__1BFDF75E]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RPublica] ADD  DEFAULT (' ') FOR [autores]
GO
/****** Object:  Default [DF__RPublica__anhio__1CF21B97]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RPublica] ADD  DEFAULT ((0)) FOR [anhio]
GO
/****** Object:  Default [DF__RPublica__fecha__1DE63FD0]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RPublica] ADD  DEFAULT (getdate()) FOR [fecha]
GO
/****** Object:  Default [DF__RPublica__revlib__1EDA6409]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RPublica] ADD  DEFAULT (' ') FOR [revlibeve]
GO
/****** Object:  Default [DF__RPublica__capitu__1FCE8842]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RPublica] ADD  DEFAULT (' ') FOR [capitulo]
GO
/****** Object:  Default [DF__RPublica__pagina__20C2AC7B]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RPublica] ADD  DEFAULT (' ') FOR [paginas]
GO
/****** Object:  Default [DF__RPublica__clave__21B6D0B4]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RPublica] ADD  DEFAULT (' ') FOR [clave]
GO
/****** Object:  Default [DF__RPublica__isbn__22AAF4ED]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RPublica] ADD  DEFAULT (' ') FOR [isbn]
GO
/****** Object:  Default [DF__RPublica__editor__239F1926]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RPublica] ADD  DEFAULT (' ') FOR [editores]
GO
/****** Object:  Default [DF__RPublica__editor__24933D5F]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RPublica] ADD  DEFAULT (' ') FOR [editorial]
GO
/****** Object:  Default [DF__RPublica__lugar__25876198]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RPublica] ADD  DEFAULT (' ') FOR [lugar]
GO
/****** Object:  Default [DF__RPublica__tipo__267B85D1]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RPublica] ADD  DEFAULT ((0)) FOR [tipo]
GO
/****** Object:  Default [DF__RPublica__Fecha___276FAA0A]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RPublica] ADD  DEFAULT (getdate()) FOR [Fecha_mod]
GO
/****** Object:  Default [DF__RPublica__observ__2863CE43]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RPublica] ADD  DEFAULT (' ') FOR [observ]
GO
/****** Object:  Default [DF__RPublica__vobo__2957F27C]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RPublica] ADD  DEFAULT ((0)) FOR [vobo]
GO
/****** Object:  Default [DF__RPublica__usrvob__2A4C16B5]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RPublica] ADD  DEFAULT (' ') FOR [usrvobo]
GO
/****** Object:  Default [DF__RPublica__jdd__2B403AEE]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RPublica] ADD  DEFAULT ((0)) FOR [jdd]
GO
/****** Object:  Default [DF__Rrecibos__Codigo__2C345F27]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Rrecibos] ADD  DEFAULT (' ') FOR [Codigo]
GO
/****** Object:  Default [DF__Rrecibos__Ames__2D288360]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Rrecibos] ADD  DEFAULT (' ') FOR [Ames]
GO
/****** Object:  Default [DF__Rrecibos__Peri__2E1CA799]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Rrecibos] ADD  DEFAULT (' ') FOR [Peri]
GO
/****** Object:  Default [DF__Rrecibos__Recibo__2F10CBD2]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Rrecibos] ADD  DEFAULT (0x00000000) FOR [Recibo]
GO
/****** Object:  Default [DF__Rrecibos__Usu_cr__3004F00B]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Rrecibos] ADD  DEFAULT (' ') FOR [Usu_cre]
GO
/****** Object:  Default [DF__Rrecibos__Fecha___30F91444]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Rrecibos] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [Fecha_cre]
GO
/****** Object:  Default [DF__Rrecibos__Firman__31ED387D]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Rrecibos] ADD  DEFAULT (' ') FOR [Firmante]
GO
/****** Object:  Default [DF__Rrecibos__Fecha___32E15CB6]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Rrecibos] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [Fecha_fir]
GO
/****** Object:  Default [DF__Rrecibos__Fecha___33D580EF]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Rrecibos] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [Fecha_epr]
GO
/****** Object:  Default [DF__Rrecibos__IP_fir__34C9A528]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Rrecibos] ADD  DEFAULT (' ') FOR [IP_fir]
GO
/****** Object:  Default [DF__Rrecibos__Obs__35BDC961]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Rrecibos] ADD  DEFAULT (' ') FOR [Obs]
GO
/****** Object:  Default [DF__Rrecibos__IdLote__36B1ED9A]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Rrecibos] ADD  DEFAULT ((0)) FOR [IdLote]
GO
/****** Object:  Default [DF__Rrecibos__Visto__37A611D3]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Rrecibos] ADD  DEFAULT ((0)) FOR [Visto]
GO
/****** Object:  Default [DF__Rrecibos__Confor__389A360C]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Rrecibos] ADD  DEFAULT ((0)) FOR [Conform]
GO
/****** Object:  Default [DF__Rrecibos__Jdd__398E5A45]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Rrecibos] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__Rrecibos__Recibo__07ECDD10]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Rrecibos] ADD  DEFAULT ((0)) FOR [ReciboC]
GO
/****** Object:  Default [DF__Rrecibos__Recibo__08E10149]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Rrecibos] ADD  DEFAULT ((0)) FOR [ReciboNC]
GO
/****** Object:  Default [DF__Rreportes__Jdd__3A827E7E]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Rreportes] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__Rreportes__IDRep__3B76A2B7]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Rreportes] ADD  DEFAULT (' ') FOR [IDReporte]
GO
/****** Object:  Default [DF__Rreportes__Descr__3C6AC6F0]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Rreportes] ADD  DEFAULT (' ') FOR [Descrip]
GO
/****** Object:  Default [DF__Rreportes__Repor__3D5EEB29]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Rreportes] ADD  DEFAULT ((0)) FOR [Reporte]
GO
/****** Object:  Default [DF__Rreportes__Autor__3E530F62]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Rreportes] ADD  DEFAULT (' ') FOR [Autor]
GO
/****** Object:  Default [DF__Rreportes__Fecha__3F47339B]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Rreportes] ADD  DEFAULT (getdate()) FOR [Fecha_cre]
GO
/****** Object:  Default [DF__Rreportes__Fecha__403B57D4]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Rreportes] ADD  DEFAULT (getdate()) FOR [Fecha_rev]
GO
/****** Object:  Default [DF__Rreportes__Tipo__412F7C0D]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Rreportes] ADD  DEFAULT ((0)) FOR [Tipo]
GO
/****** Object:  Default [DF__RROTULOS__Campo__4223A046]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RROTULOS] ADD  DEFAULT (' ') FOR [Campo]
GO
/****** Object:  Default [DF__RROTULOS__Alias__4317C47F]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RROTULOS] ADD  DEFAULT (' ') FOR [Alias]
GO
/****** Object:  Default [DF__RROTULOS__Clasif__440BE8B8]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RROTULOS] ADD  DEFAULT (' ') FOR [Clasif]
GO
/****** Object:  Default [DF__RROTULOS__Rotulo__45000CF1]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RROTULOS] ADD  DEFAULT (' ') FOR [Rotulo]
GO
/****** Object:  Default [DF__RROTULOS__Descri__45F4312A]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RROTULOS] ADD  DEFAULT (' ') FOR [Descrip]
GO
/****** Object:  Default [DF__RROTULOS__Jdd__46E85563]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RROTULOS] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__rrotupr5__campo__47DC799C]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[rrotupr5] ADD  DEFAULT (' ') FOR [campo]
GO
/****** Object:  Default [DF__rrotupr5__tabla__48D09DD5]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[rrotupr5] ADD  DEFAULT (' ') FOR [tabla]
GO
/****** Object:  Default [DF__rrotupr5__rotulo__49C4C20E]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[rrotupr5] ADD  DEFAULT (' ') FOR [rotulo]
GO
/****** Object:  Default [DF__rrotupr5__descri__4AB8E647]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[rrotupr5] ADD  DEFAULT (' ') FOR [descrip]
GO
/****** Object:  Default [DF__rrotupr5__cambia__4BAD0A80]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[rrotupr5] ADD  DEFAULT (' ') FOR [cambiado]
GO
/****** Object:  Default [DF__rrotupr5__Jdd__4CA12EB9]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[rrotupr5] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__RSEGDER__Codseg__4D9552F2]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RSEGDER] ADD  DEFAULT (' ') FOR [Codseg]
GO
/****** Object:  Default [DF__RSEGDER__Item__4E89772B]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RSEGDER] ADD  DEFAULT (' ') FOR [Item]
GO
/****** Object:  Default [DF__RSEGDER__Tipo__4F7D9B64]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RSEGDER] ADD  DEFAULT (' ') FOR [Tipo]
GO
/****** Object:  Default [DF__RSEGDER__Stipo__5071BF9D]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RSEGDER] ADD  DEFAULT (' ') FOR [Stipo]
GO
/****** Object:  Default [DF__RSEGDER__Permiso__5165E3D6]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RSEGDER] ADD  DEFAULT (' ') FOR [Permisos]
GO
/****** Object:  Default [DF__RSEGDER__Ngrab__525A080F]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RSEGDER] ADD  DEFAULT (' ') FOR [Ngrab]
GO
/****** Object:  Default [DF__RSEGDER__Tie__534E2C48]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RSEGDER] ADD  DEFAULT (' ') FOR [Tie]
GO
/****** Object:  Default [DF__RSEGDER__Jdd__54425081]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RSEGDER] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__rseggrup__Grupo__553674BA]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[rseggrup] ADD  DEFAULT (' ') FOR [Grupo]
GO
/****** Object:  Default [DF__rseggrup__Nombre__562A98F3]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[rseggrup] ADD  DEFAULT (' ') FOR [Nombre]
GO
/****** Object:  Default [DF__rseggrup__Empres__571EBD2C]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[rseggrup] ADD  DEFAULT (' ') FOR [Empresas]
GO
/****** Object:  Default [DF__rseggrup__Ngrab__5812E165]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[rseggrup] ADD  DEFAULT ((0)) FOR [Ngrab]
GO
/****** Object:  Default [DF__rseggrup__Jdd__5907059E]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[rseggrup] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__RSeguros__Codigo__59FB29D7]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RSeguros] ADD  DEFAULT (' ') FOR [Codigo]
GO
/****** Object:  Default [DF__RSeguros__Seguro__5AEF4E10]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RSeguros] ADD  DEFAULT ((0)) FOR [Seguro]
GO
/****** Object:  Default [DF__RSeguros__Instit__5BE37249]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RSeguros] ADD  DEFAULT ((0)) FOR [Institu]
GO
/****** Object:  Default [DF__RSeguros__NroPol__5CD79682]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RSeguros] ADD  DEFAULT (' ') FOR [NroPoliza]
GO
/****** Object:  Default [DF__RSeguros__MontoE__5DCBBABB]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RSeguros] ADD  DEFAULT ((0)) FOR [MontoEmpr]
GO
/****** Object:  Default [DF__RSeguros__MonEmp__5EBFDEF4]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RSeguros] ADD  DEFAULT ((0)) FOR [MonEmpr]
GO
/****** Object:  Default [DF__RSeguros__MontoE__5FB4032D]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RSeguros] ADD  DEFAULT ((0)) FOR [MontoEmpl]
GO
/****** Object:  Default [DF__RSeguros__MonEmp__60A82766]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RSeguros] ADD  DEFAULT ((0)) FOR [MonEmpl]
GO
/****** Object:  Default [DF__RSeguros__Fecha___619C4B9F]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RSeguros] ADD  DEFAULT (getdate()) FOR [Fecha_ini]
GO
/****** Object:  Default [DF__RSeguros__Fecha___62906FD8]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RSeguros] ADD  DEFAULT (getdate()) FOR [Fecha_fin]
GO
/****** Object:  Default [DF__RSeguros__Jdd__63849411]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RSeguros] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__RSeguros__Estado__6478B84A]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RSeguros] ADD  DEFAULT ((0)) FOR [Estado]
GO
/****** Object:  Default [DF__Rsercola__usuari__656CDC83]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Rsercola] ADD  DEFAULT (' ') FOR [usuario]
GO
/****** Object:  Default [DF__Rsercola__id__666100BC]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Rsercola] ADD  DEFAULT (' ') FOR [id]
GO
/****** Object:  Default [DF__Rsercola__docume__675524F5]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Rsercola] ADD  DEFAULT ((0)) FOR [documento]
GO
/****** Object:  Default [DF__Rsercola__IDRepo__6849492E]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Rsercola] ADD  DEFAULT (' ') FOR [IDReporte]
GO
/****** Object:  Default [DF__Rsercola__Finali__693D6D67]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Rsercola] ADD  DEFAULT ((0)) FOR [Finalizo]
GO
/****** Object:  Default [DF__Rsercola__Fecha___6A3191A0]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Rsercola] ADD  DEFAULT (getdate()) FOR [Fecha_ini]
GO
/****** Object:  Default [DF__Rsercola__Fecha___6B25B5D9]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Rsercola] ADD  DEFAULT (getdate()) FOR [Fecha_in2]
GO
/****** Object:  Default [DF__Rsercola__Fecha___6C19DA12]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Rsercola] ADD  DEFAULT (getdate()) FOR [Fecha_fin]
GO
/****** Object:  Default [DF__Rsercola__cantid__6D0DFE4B]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Rsercola] ADD  DEFAULT ((0)) FOR [cantidad]
GO
/****** Object:  Default [DF__Rsercola__comple__6E022284]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Rsercola] ADD  DEFAULT ((0)) FOR [completo]
GO
/****** Object:  Default [DF__Rsercola__descri__6EF646BD]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Rsercola] ADD  DEFAULT (' ') FOR [descrip]
GO
/****** Object:  Default [DF__Rsercola__Jdd__6FEA6AF6]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Rsercola] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__Rsercola__feliq__70DE8F2F]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Rsercola] ADD  DEFAULT (' ') FOR [feliq]
GO
/****** Object:  Default [DF__Rsercola__peri__71D2B368]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Rsercola] ADD  DEFAULT (' ') FOR [peri]
GO
/****** Object:  Default [DF__Rsercola__Tipo__72C6D7A1]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Rsercola] ADD  DEFAULT ((0)) FOR [Tipo]
GO
/****** Object:  Default [DF__Rsercola__Idbatc__6562BAE2]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Rsercola] ADD  DEFAULT ((0)) FOR [Idbatch]
GO
/****** Object:  Default [DF__RSOLICI__Codigo__73BAFBDA]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RSOLICI] ADD  DEFAULT (' ') FOR [Codigo]
GO
/****** Object:  Default [DF__RSOLICI__Tipo__74AF2013]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RSOLICI] ADD  DEFAULT ((0)) FOR [Tipo]
GO
/****** Object:  Default [DF__RSOLICI__Fecha_i__75A3444C]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RSOLICI] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(120)),(120))) FOR [Fecha_ini]
GO
/****** Object:  Default [DF__RSOLICI__Estado__76976885]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RSOLICI] ADD  DEFAULT ((0)) FOR [Estado]
GO
/****** Object:  Default [DF__RSOLICI__Fecha_t__778B8CBE]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RSOLICI] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [Fecha_ter]
GO
/****** Object:  Default [DF__RSOLICI__Detalle__787FB0F7]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RSOLICI] ADD  DEFAULT (' ') FOR [Detalle]
GO
/****** Object:  Default [DF__RSOLICI__Priori__7973D530]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RSOLICI] ADD  DEFAULT (' ') FOR [Priori]
GO
/****** Object:  Default [DF__RSOLICI__Jdd__7A67F969]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RSOLICI] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__RSOLPEN__Codigo__7B5C1DA2]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RSOLPEN] ADD  DEFAULT (' ') FOR [Codigo]
GO
/****** Object:  Default [DF__RSOLPEN__Tipo__7C5041DB]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RSOLPEN] ADD  DEFAULT ((0)) FOR [Tipo]
GO
/****** Object:  Default [DF__RSOLPEN__Nusol__7D446614]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RSOLPEN] ADD  DEFAULT ((0)) FOR [Nusol]
GO
/****** Object:  Default [DF__RSOLPEN__Fecha_s__7E388A4D]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RSOLPEN] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(120)),(120))) FOR [Fecha_sol]
GO
/****** Object:  Default [DF__RSOLPEN__Estado__7F2CAE86]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RSOLPEN] ADD  DEFAULT ((0)) FOR [Estado]
GO
/****** Object:  Default [DF__RSOLPEN__Fecha_t__0020D2BF]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RSOLPEN] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [Fecha_ter]
GO
/****** Object:  Default [DF__RSOLPEN__Detalle__0114F6F8]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RSOLPEN] ADD  DEFAULT (' ') FOR [Detalle]
GO
/****** Object:  Default [DF__RSOLPEN__Params__02091B31]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RSOLPEN] ADD  DEFAULT (' ') FOR [Params]
GO
/****** Object:  Default [DF__RSOLPEN__Priori__02FD3F6A]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RSOLPEN] ADD  DEFAULT (' ') FOR [Priori]
GO
/****** Object:  Default [DF__RSOLPEN__Jefe__03F163A3]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RSOLPEN] ADD  DEFAULT (' ') FOR [Jefe]
GO
/****** Object:  Default [DF__RSOLPEN__Obs__04E587DC]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RSOLPEN] ADD  DEFAULT (' ') FOR [Obs]
GO
/****** Object:  Default [DF__RSOLPEN__Jdd__05D9AC15]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RSOLPEN] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__Rtablas__Tipo__06CDD04E]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Rtablas] ADD  DEFAULT (' ') FOR [Tipo]
GO
/****** Object:  Default [DF__Rtablas__Cotab__07C1F487]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Rtablas] ADD  DEFAULT ((0)) FOR [Cotab]
GO
/****** Object:  Default [DF__Rtablas__Codigo__08B618C0]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Rtablas] ADD  DEFAULT ((0)) FOR [Codigo]
GO
/****** Object:  Default [DF__Rtablas__Descrip__09AA3CF9]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Rtablas] ADD  DEFAULT (' ') FOR [Descrip]
GO
/****** Object:  Default [DF__Rtablas__Valor__0A9E6132]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Rtablas] ADD  DEFAULT ((0)) FOR [Valor]
GO
/****** Object:  Default [DF__Rtablas__Valor2__0B92856B]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Rtablas] ADD  DEFAULT ((0)) FOR [Valor2]
GO
/****** Object:  Default [DF__Rtablas__ValorC__0C86A9A4]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Rtablas] ADD  DEFAULT (' ') FOR [ValorC]
GO
/****** Object:  Default [DF__Rtablas__Valor4__0D7ACDDD]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Rtablas] ADD  DEFAULT (' ') FOR [Valor4]
GO
/****** Object:  Default [DF__Rtablas__CodAl__0E6EF216]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Rtablas] ADD  DEFAULT (' ') FOR [CodAl]
GO
/****** Object:  Default [DF__Rtablas__ValorG__0F63164F]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Rtablas] ADD  DEFAULT (' ') FOR [ValorG]
GO
/****** Object:  Default [DF__Rtablas__Jdd__10573A88]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Rtablas] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__RtablasH__Jdd__114B5EC1]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RtablasH] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__RtablasH__Ames__123F82FA]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RtablasH] ADD  DEFAULT (' ') FOR [Ames]
GO
/****** Object:  Default [DF__RtablasH__Tipo__1333A733]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RtablasH] ADD  DEFAULT (' ') FOR [Tipo]
GO
/****** Object:  Default [DF__RtablasH__Cotab__1427CB6C]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RtablasH] ADD  DEFAULT ((0)) FOR [Cotab]
GO
/****** Object:  Default [DF__RtablasH__Codigo__151BEFA5]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RtablasH] ADD  DEFAULT ((0)) FOR [Codigo]
GO
/****** Object:  Default [DF__RtablasH__Descri__161013DE]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RtablasH] ADD  DEFAULT (' ') FOR [Descrip]
GO
/****** Object:  Default [DF__RtablasH__Valor__17043817]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RtablasH] ADD  DEFAULT ((0)) FOR [Valor]
GO
/****** Object:  Default [DF__RtablasH__Valor2__17F85C50]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RtablasH] ADD  DEFAULT ((0)) FOR [Valor2]
GO
/****** Object:  Default [DF__RtablasH__ValorC__18EC8089]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RtablasH] ADD  DEFAULT (' ') FOR [ValorC]
GO
/****** Object:  Default [DF__RtablasH__Valor4__19E0A4C2]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RtablasH] ADD  DEFAULT (' ') FOR [Valor4]
GO
/****** Object:  Default [DF__RtablasH__CodAl__1AD4C8FB]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RtablasH] ADD  DEFAULT (' ') FOR [CodAl]
GO
/****** Object:  Default [DF__RtablasH__ValorG__1BC8ED34]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RtablasH] ADD  DEFAULT (' ') FOR [ValorG]
GO
/****** Object:  Default [DF__Rtemplate__Codig__1CBD116D]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Rtemplates] ADD  DEFAULT (' ') FOR [Codigo]
GO
/****** Object:  Default [DF__Rtemplates__Tipo__1DB135A6]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Rtemplates] ADD  DEFAULT ((0)) FOR [Tipo]
GO
/****** Object:  Default [DF__Rtemplate__Fecha__1EA559DF]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Rtemplates] ADD  DEFAULT (getdate()) FOR [Fecha_cre]
GO
/****** Object:  Default [DF__Rtemplate__Fecha__1F997E18]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Rtemplates] ADD  DEFAULT (getdate()) FOR [Fecha_mod]
GO
/****** Object:  Default [DF__Rtemplate__Descr__208DA251]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Rtemplates] ADD  DEFAULT (' ') FOR [Descrip]
GO
/****** Object:  Default [DF__Rtemplate__Templ__2181C68A]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Rtemplates] ADD  DEFAULT (' ') FOR [Template]
GO
/****** Object:  Default [DF__Rtemplate__Forma__2275EAC3]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Rtemplates] ADD  DEFAULT (' ') FOR [Formato]
GO
/****** Object:  Default [DF__Rtemplates__Jdd__236A0EFC]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Rtemplates] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__Rtemplate__item1__245E3335]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Rtemplates] ADD  DEFAULT (' ') FOR [item1]
GO
/****** Object:  Default [DF__Rtemplate__item2__2552576E]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Rtemplates] ADD  DEFAULT (' ') FOR [item2]
GO
/****** Object:  Default [DF__Rtemplate__item3__26467BA7]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Rtemplates] ADD  DEFAULT (' ') FOR [item3]
GO
/****** Object:  Default [DF__Rtemplate__item4__273A9FE0]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Rtemplates] ADD  DEFAULT (' ') FOR [item4]
GO
/****** Object:  Default [DF__Rtemplate__item5__282EC419]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Rtemplates] ADD  DEFAULT (' ') FOR [item5]
GO
/****** Object:  Default [DF__Rtemplate__item6__2922E852]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Rtemplates] ADD  DEFAULT (' ') FOR [item6]
GO
/****** Object:  Default [DF__Rtemplate__item7__2A170C8B]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Rtemplates] ADD  DEFAULT (' ') FOR [item7]
GO
/****** Object:  Default [DF__Rtemplate__item8__2B0B30C4]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Rtemplates] ADD  DEFAULT (' ') FOR [item8]
GO
/****** Object:  Default [DF__Rtemplate__item9__2BFF54FD]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Rtemplates] ADD  DEFAULT (' ') FOR [item9]
GO
/****** Object:  Default [DF__Rtemplate__item1__2CF37936]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Rtemplates] ADD  DEFAULT (' ') FOR [item10]
GO
/****** Object:  Default [DF__Rtemplate__valor__2DE79D6F]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Rtemplates] ADD  DEFAULT ('0') FOR [valor1]
GO
/****** Object:  Default [DF__Rtemplate__valor__2EDBC1A8]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Rtemplates] ADD  DEFAULT ('0') FOR [valor2]
GO
/****** Object:  Default [DF__Rtemplate__valor__2FCFE5E1]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Rtemplates] ADD  DEFAULT ('0') FOR [valor3]
GO
/****** Object:  Default [DF__Rtemplate__valor__30C40A1A]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Rtemplates] ADD  DEFAULT ('0') FOR [valor4]
GO
/****** Object:  Default [DF__Rtemplate__valor__31B82E53]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Rtemplates] ADD  DEFAULT ('0') FOR [valor5]
GO
/****** Object:  Default [DF__Rtemplate__valor__32AC528C]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Rtemplates] ADD  DEFAULT ('0') FOR [valor6]
GO
/****** Object:  Default [DF__Rtemplate__valor__33A076C5]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Rtemplates] ADD  DEFAULT ('0') FOR [valor7]
GO
/****** Object:  Default [DF__Rtemplate__valor__34949AFE]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Rtemplates] ADD  DEFAULT ('0') FOR [valor8]
GO
/****** Object:  Default [DF__Rtemplate__valor__3588BF37]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Rtemplates] ADD  DEFAULT ('0') FOR [valor9]
GO
/****** Object:  Default [DF__Rtemplate__valor__367CE370]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Rtemplates] ADD  DEFAULT ('0') FOR [valor10]
GO
/****** Object:  Default [DF__Rtemplate__firma__377107A9]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Rtemplates] ADD  DEFAULT (' ') FOR [firmacod]
GO
/****** Object:  Default [DF__Rtemplate__veaut__38652BE2]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Rtemplates] ADD  DEFAULT (' ') FOR [veautoc]
GO
/****** Object:  Default [DF__RTIEMPOS__Fecha__3959501B]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RTIEMPOS] ADD  DEFAULT (getdate()) FOR [Fecha]
GO
/****** Object:  Default [DF__RTIEMPOS__Usuari__3A4D7454]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RTIEMPOS] ADD  DEFAULT (' ') FOR [Usuario]
GO
/****** Object:  Default [DF__RTIEMPOS__Proces__3B41988D]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RTIEMPOS] ADD  DEFAULT (' ') FOR [Proceso]
GO
/****** Object:  Default [DF__RTIEMPOS__Etapa__3C35BCC6]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RTIEMPOS] ADD  DEFAULT (' ') FOR [Etapa]
GO
/****** Object:  Default [DF__RTIEMPOS__Cantid__3D29E0FF]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RTIEMPOS] ADD  DEFAULT ((0)) FOR [Cantidad]
GO
/****** Object:  Default [DF__RTIEMPOS__Duraci__3E1E0538]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RTIEMPOS] ADD  DEFAULT ((0)) FOR [Duracion]
GO
/****** Object:  Default [DF__RTIEMPOS__Peri__3F122971]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RTIEMPOS] ADD  DEFAULT (' ') FOR [Peri]
GO
/****** Object:  Default [DF__RTIEMPOS__Wcompu__40064DAA]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RTIEMPOS] ADD  DEFAULT (' ') FOR [Wcompu]
GO
/****** Object:  Default [DF__RTIEMPOS__Marca__40FA71E3]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RTIEMPOS] ADD  DEFAULT ((0)) FOR [Marca]
GO
/****** Object:  Default [DF__RTIEMPOS__Jdd__41EE961C]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RTIEMPOS] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__Rtiposeg__Tipo__42E2BA55]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Rtiposeg] ADD  DEFAULT (' ') FOR [Tipo]
GO
/****** Object:  Default [DF__Rtiposeg__Descri__43D6DE8E]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Rtiposeg] ADD  DEFAULT (' ') FOR [Descrip]
GO
/****** Object:  Default [DF__Rtiposeg__Jdd__44CB02C7]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Rtiposeg] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__RTRAMOV__Codigo__45BF2700]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RTRAMOV] ADD  DEFAULT (' ') FOR [Codigo]
GO
/****** Object:  Default [DF__RTRAMOV__Numcom__46B34B39]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RTRAMOV] ADD  DEFAULT ((0)) FOR [Numcom]
GO
/****** Object:  Default [DF__RTRAMOV__Ames__47A76F72]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RTRAMOV] ADD  DEFAULT (' ') FOR [Ames]
GO
/****** Object:  Default [DF__RTRAMOV__fecha_t__489B93AB]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RTRAMOV] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [fecha_tra]
GO
/****** Object:  Default [DF__RTRAMOV__Cod_pro__498FB7E4]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RTRAMOV] ADD  DEFAULT ((0)) FOR [Cod_pro]
GO
/****** Object:  Default [DF__RTRAMOV__Cantid__4A83DC1D]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RTRAMOV] ADD  DEFAULT ((0)) FOR [Cantid]
GO
/****** Object:  Default [DF__RTRAMOV__ValUni__4B780056]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RTRAMOV] ADD  DEFAULT ((0)) FOR [ValUni]
GO
/****** Object:  Default [DF__RTRAMOV__Cohade__4C6C248F]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RTRAMOV] ADD  DEFAULT (' ') FOR [Cohade]
GO
/****** Object:  Default [DF__RTRAMOV__Cencos__4D6048C8]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RTRAMOV] ADD  DEFAULT ((0)) FOR [Cencos]
GO
/****** Object:  Default [DF__RTRAMOV__Jdd__4E546D01]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RTRAMOV] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__RTRAPRO__Cod_pro__4F48913A]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RTRAPRO] ADD  DEFAULT ((0)) FOR [Cod_pro]
GO
/****** Object:  Default [DF__RTRAPRO__Descrip__503CB573]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RTRAPRO] ADD  DEFAULT (' ') FOR [Descrip]
GO
/****** Object:  Default [DF__RTRAPRO__Valor__5130D9AC]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RTRAPRO] ADD  DEFAULT ((0)) FOR [Valor]
GO
/****** Object:  Default [DF__RTRAPRO__Unidad__5224FDE5]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RTRAPRO] ADD  DEFAULT (' ') FOR [Unidad]
GO
/****** Object:  Default [DF__RTRAPRO__Cohade__5319221E]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RTRAPRO] ADD  DEFAULT (' ') FOR [Cohade]
GO
/****** Object:  Default [DF__RTRAPRO__Jdd__540D4657]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RTRAPRO] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__RULTSEL__Jdd__55016A90]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RULTSEL] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__RULTSEL__jdato__55F58EC9]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RULTSEL] ADD  DEFAULT (' ') FOR [jdato]
GO
/****** Object:  Default [DF__RULTSEL__Usuario__56E9B302]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RULTSEL] ADD  DEFAULT (' ') FOR [Usuario]
GO
/****** Object:  Default [DF__RULTSEL__Codigo__57DDD73B]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RULTSEL] ADD  DEFAULT (' ') FOR [Codigo]
GO
/****** Object:  Default [DF__RULTSEL__rut__58D1FB74]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RULTSEL] ADD  DEFAULT (' ') FOR [rut]
GO
/****** Object:  Default [DF__Rultsele__Jdd__59C61FAD]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Rultsele] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__Rultsele__jdato__5ABA43E6]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Rultsele] ADD  DEFAULT (' ') FOR [jdato]
GO
/****** Object:  Default [DF__Rultsele__Sele__5BAE681F]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Rultsele] ADD  DEFAULT ((0)) FOR [Sele]
GO
/****** Object:  Default [DF__Rultsele__Usuari__5CA28C58]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Rultsele] ADD  DEFAULT (' ') FOR [Usuario]
GO
/****** Object:  Default [DF__Rultsele__Codigo__5D96B091]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Rultsele] ADD  DEFAULT (' ') FOR [Codigo]
GO
/****** Object:  Default [DF__Rultsele__rut__5E8AD4CA]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Rultsele] ADD  DEFAULT (' ') FOR [rut]
GO
/****** Object:  Default [DF__RultseleD__Jdd__5F7EF903]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RultseleD] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__RultseleD__Sele__60731D3C]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RultseleD] ADD  DEFAULT ((0)) FOR [Sele]
GO
/****** Object:  Default [DF__RultseleD__descr__61674175]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RultseleD] ADD  DEFAULT (' ') FOR [descrip]
GO
/****** Object:  Default [DF__RUNICAR__Empresa__625B65AE]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RUNICAR] ADD  DEFAULT (' ') FOR [Empresa]
GO
/****** Object:  Default [DF__RUNICAR__Unidad__634F89E7]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RUNICAR] ADD  DEFAULT ((0)) FOR [Unidad]
GO
/****** Object:  Default [DF__RUNICAR__Cargo__6443AE20]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RUNICAR] ADD  DEFAULT ((0)) FOR [Cargo]
GO
/****** Object:  Default [DF__RUNICAR__vacan__6537D259]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RUNICAR] ADD  DEFAULT ((0)) FOR [vacan]
GO
/****** Object:  Default [DF__RUNICAR__Dotacio__662BF692]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RUNICAR] ADD  DEFAULT ((0)) FOR [Dotacion]
GO
/****** Object:  Default [DF__RUNICAR__Jdd__67201ACB]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RUNICAR] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__RUSUARIO__Usuari__68143F04]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RUSUARIO] ADD  DEFAULT (' ') FOR [Usuario]
GO
/****** Object:  Default [DF__RUSUARIO__Descri__6908633D]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RUSUARIO] ADD  DEFAULT (' ') FOR [Descrip]
GO
/****** Object:  Default [DF__RUSUARIO__Dato__69FC8776]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RUSUARIO] ADD  DEFAULT (' ') FOR [Dato]
GO
/****** Object:  Default [DF__RUSUARIO__Condic__6AF0ABAF]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RUSUARIO] ADD  DEFAULT (' ') FOR [Condicion]
GO
/****** Object:  Default [DF__RUSUARIO__Estado__6BE4CFE8]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RUSUARIO] ADD  DEFAULT (' ') FOR [Estado]
GO
/****** Object:  Default [DF__RUSUARIO__DescCo__6CD8F421]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RUSUARIO] ADD  DEFAULT (' ') FOR [DescCond]
GO
/****** Object:  Default [DF__RUSUARIO__Codigo__6DCD185A]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RUSUARIO] ADD  DEFAULT (' ') FOR [Codigo]
GO
/****** Object:  Default [DF__RUSUARIO__Dato2__6EC13C93]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RUSUARIO] ADD  DEFAULT (' ') FOR [Dato2]
GO
/****** Object:  Default [DF__RUSUARIO__Histor__6FB560CC]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RUSUARIO] ADD  DEFAULT (' ') FOR [Histori]
GO
/****** Object:  Default [DF__RUSUARIO__Ngrab__70A98505]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RUSUARIO] ADD  DEFAULT ((0)) FOR [Ngrab]
GO
/****** Object:  Default [DF__RUSUARIO__Tie__719DA93E]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RUSUARIO] ADD  DEFAULT (' ') FOR [Tie]
GO
/****** Object:  Default [DF__RUSUARIO__Jdd__7291CD77]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RUSUARIO] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__RUSUARIOI__jdd__7385F1B0]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RUSUARIOI] ADD  DEFAULT ((0)) FOR [jdd]
GO
/****** Object:  Default [DF__RUSUARIOI__Usuar__747A15E9]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RUSUARIOI] ADD  DEFAULT (' ') FOR [Usuario]
GO
/****** Object:  Default [DF__RUSUARIOI__Inten__756E3A22]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RUSUARIOI] ADD  DEFAULT ((0)) FOR [Intentos]
GO
/****** Object:  Default [DF__rusuarios__jdd__76625E5B]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[rusuarios] ADD  DEFAULT ((0)) FOR [jdd]
GO
/****** Object:  Default [DF__rusuarios__Usuar__77568294]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[rusuarios] ADD  DEFAULT (' ') FOR [Usuario]
GO
/****** Object:  Default [DF__rusuarios__Estad__784AA6CD]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[rusuarios] ADD  DEFAULT (' ') FOR [Estado]
GO
/****** Object:  Default [DF__rusuarios__Descr__793ECB06]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[rusuarios] ADD  DEFAULT (' ') FOR [Descrip]
GO
/****** Object:  Default [DF__rusuarios__Dato__7A32EF3F]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[rusuarios] ADD  DEFAULT (' ') FOR [Dato]
GO
/****** Object:  Default [DF__rusuarios__Histo__7B271378]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[rusuarios] ADD  DEFAULT (' ') FOR [Historia]
GO
/****** Object:  Default [DF__rusuarios__Inten__7C1B37B1]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[rusuarios] ADD  DEFAULT ((0)) FOR [Intentos]
GO
/****** Object:  Default [DF__rusuarios__Fecha__7D0F5BEA]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[rusuarios] ADD  DEFAULT (getdate()) FOR [Fecha_exp]
GO
/****** Object:  Default [DF__rusuarios__Mail__7E038023]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[rusuarios] ADD  DEFAULT (' ') FOR [Mail]
GO
/****** Object:  Default [DF__rusuarios__Empre__7EF7A45C]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[rusuarios] ADD  DEFAULT (' ') FOR [Empresa]
GO
/****** Object:  Default [DF__rusuarios__Ubica__7FEBC895]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[rusuarios] ADD  DEFAULT ((0)) FOR [Ubica]
GO
/****** Object:  Default [DF__rusuarios__Perfi__00DFECCE]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[rusuarios] ADD  DEFAULT (' ') FOR [Perfil]
GO
/****** Object:  Default [DF__rusuarios__Antig__01D41107]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[rusuarios] ADD  DEFAULT (' ') FOR [Antig]
GO
/****** Object:  Default [DF__rusuarios__Sele__02C83540]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[rusuarios] ADD  DEFAULT (' ') FOR [Sele]
GO
/****** Object:  Default [DF__rusuarios__fono__03BC5979]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[rusuarios] ADD  DEFAULT (' ') FOR [fono]
GO
/****** Object:  Default [DF__rusuarios__cont___04B07DB2]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[rusuarios] ADD  DEFAULT (' ') FOR [cont_princ]
GO
/****** Object:  Default [DF__rusuarios__ej_pa__05A4A1EB]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[rusuarios] ADD  DEFAULT (' ') FOR [ej_payroll]
GO
/****** Object:  Default [DF__rusuarios__ger_o__0698C624]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[rusuarios] ADD  DEFAULT ((0)) FOR [ger_out]
GO
/****** Object:  Default [DF__rusuarios__subge__078CEA5D]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[rusuarios] ADD  DEFAULT ((0)) FOR [subge_out]
GO
/****** Object:  Default [DF__rusuarios__jefe___08810E96]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[rusuarios] ADD  DEFAULT ((0)) FOR [jefe_out]
GO
/****** Object:  Default [DF__rusuarios__grupo__097532CF]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[rusuarios] ADD  DEFAULT ((0)) FOR [grupo_out]
GO
/****** Object:  Default [DF__rusuarios__idAre__0A695708]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[rusuarios] ADD  DEFAULT ((0)) FOR [idArea]
GO
/****** Object:  Default [DF__rusuarios__Super__0B5D7B41]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[rusuarios] ADD  DEFAULT (' ') FOR [Supervisor]
GO
/****** Object:  Default [DF__RVACACI__Numdoc__0C519F7A]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RVACACI] ADD  DEFAULT ((0)) FOR [Numdoc]
GO
/****** Object:  Default [DF__RVACACI__Codigo__0D45C3B3]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RVACACI] ADD  DEFAULT (' ') FOR [Codigo]
GO
/****** Object:  Default [DF__RVACACI__Feini__0E39E7EC]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RVACACI] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [Feini]
GO
/****** Object:  Default [DF__RVACACI__Fefin__0F2E0C25]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RVACACI] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [Fefin]
GO
/****** Object:  Default [DF__RVACACI__Dias__1022305E]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RVACACI] ADD  DEFAULT ((0)) FOR [Dias]
GO
/****** Object:  Default [DF__RVACACI__Status__11165497]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RVACACI] ADD  DEFAULT (' ') FOR [Status]
GO
/****** Object:  Default [DF__RVACACI__Numrem__120A78D0]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RVACACI] ADD  DEFAULT ((0)) FOR [Numrem]
GO
/****** Object:  Default [DF__RVACACI__Opd__12FE9D09]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RVACACI] ADD  DEFAULT ((0)) FOR [Opd]
GO
/****** Object:  Default [DF__RVACACI__Dmi__13F2C142]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RVACACI] ADD  DEFAULT ((0)) FOR [Dmi]
GO
/****** Object:  Default [DF__RVACACI__Dmf__14E6E57B]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RVACACI] ADD  DEFAULT ((0)) FOR [Dmf]
GO
/****** Object:  Default [DF__RVACACI__Ampm__15DB09B4]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RVACACI] ADD  DEFAULT ((0)) FOR [Ampm]
GO
/****** Object:  Default [DF__RVACACI__Fecha_r__16CF2DED]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RVACACI] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [Fecha_ret]
GO
/****** Object:  Default [DF__RVACACI__Motanul__17C35226]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RVACACI] ADD  DEFAULT (' ') FOR [Motanul]
GO
/****** Object:  Default [DF__RVACACI__Pertom__18B7765F]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RVACACI] ADD  DEFAULT (' ') FOR [Pertom]
GO
/****** Object:  Default [DF__RVACACI__Usuario__19AB9A98]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RVACACI] ADD  DEFAULT (' ') FOR [Usuario]
GO
/****** Object:  Default [DF__RVACACI__Fecha_d__1A9FBED1]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RVACACI] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(120)),(120))) FOR [Fecha_dat]
GO
/****** Object:  Default [DF__RVACACI__Fecha_u__1B93E30A]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RVACACI] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(120)),(120))) FOR [Fecha_ult]
GO
/****** Object:  Default [DF__RVACACI__Jdd__1C880743]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RVACACI] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__RVACACID__Codigo__1D7C2B7C]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RVACACID] ADD  DEFAULT (' ') FOR [Codigo]
GO
/****** Object:  Default [DF__RVACACID__Dias__1E704FB5]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RVACACID] ADD  DEFAULT ((0)) FOR [Dias]
GO
/****** Object:  Default [DF__RVACACID__Fecha___1F6473EE]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RVACACID] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [Fecha_ini]
GO
/****** Object:  Default [DF__RVACACID__Fecha___20589827]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RVACACID] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [Fecha_fin]
GO
/****** Object:  Default [DF__RVACACID__Tipo__214CBC60]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RVACACID] ADD  DEFAULT (' ') FOR [Tipo]
GO
/****** Object:  Default [DF__RVACACID__Descri__2240E099]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RVACACID] ADD  DEFAULT (' ') FOR [Descrip]
GO
/****** Object:  Default [DF__RVACACID__Nro__233504D2]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RVACACID] ADD  DEFAULT ((0)) FOR [Nro]
GO
/****** Object:  Default [DF__RVACACID__Jdd__2429290B]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RVACACID] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__RVACACIG__Numdoc__251D4D44]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RVACACIG] ADD  DEFAULT ((0)) FOR [Numdoc]
GO
/****** Object:  Default [DF__RVACACIG__Codigo__2611717D]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RVACACIG] ADD  DEFAULT (' ') FOR [Codigo]
GO
/****** Object:  Default [DF__RVACACIG__Feini__270595B6]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RVACACIG] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [Feini]
GO
/****** Object:  Default [DF__RVACACIG__Fefin__27F9B9EF]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RVACACIG] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [Fefin]
GO
/****** Object:  Default [DF__RVACACIG__Dias__28EDDE28]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RVACACIG] ADD  DEFAULT ((0)) FOR [Dias]
GO
/****** Object:  Default [DF__RVACACIG__Status__29E20261]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RVACACIG] ADD  DEFAULT (' ') FOR [Status]
GO
/****** Object:  Default [DF__RVACACIG__Numrem__2AD6269A]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RVACACIG] ADD  DEFAULT ((0)) FOR [Numrem]
GO
/****** Object:  Default [DF__RVACACIG__Opd__2BCA4AD3]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RVACACIG] ADD  DEFAULT ((0)) FOR [Opd]
GO
/****** Object:  Default [DF__RVACACIG__Dmi__2CBE6F0C]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RVACACIG] ADD  DEFAULT ((0)) FOR [Dmi]
GO
/****** Object:  Default [DF__RVACACIG__Dmf__2DB29345]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RVACACIG] ADD  DEFAULT ((0)) FOR [Dmf]
GO
/****** Object:  Default [DF__RVACACIG__Ampm__2EA6B77E]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RVACACIG] ADD  DEFAULT ((0)) FOR [Ampm]
GO
/****** Object:  Default [DF__RVACACIG__Fecha___2F9ADBB7]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RVACACIG] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [Fecha_ret]
GO
/****** Object:  Default [DF__RVACACIG__Motanu__308EFFF0]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RVACACIG] ADD  DEFAULT (' ') FOR [Motanul]
GO
/****** Object:  Default [DF__RVACACIG__Pertom__31832429]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RVACACIG] ADD  DEFAULT (' ') FOR [Pertom]
GO
/****** Object:  Default [DF__RVACACIG__Jdd__32774862]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RVACACIG] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__RVACDET__Codigo__336B6C9B]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RVACDET] ADD  DEFAULT (' ') FOR [Codigo]
GO
/****** Object:  Default [DF__RVACDET__Fecha_a__345F90D4]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RVACDET] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [Fecha_act]
GO
/****** Object:  Default [DF__RVACDET__Totpen__3553B50D]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RVACDET] ADD  DEFAULT ((0)) FOR [Totpen]
GO
/****** Object:  Default [DF__RVACDET__PeriPen__3647D946]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RVACDET] ADD  DEFAULT (' ') FOR [PeriPen]
GO
/****** Object:  Default [DF__RVACDET__Normdev__373BFD7F]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RVACDET] ADD  DEFAULT ((0)) FOR [Normdev]
GO
/****** Object:  Default [DF__RVACDET__Normtom__383021B8]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RVACDET] ADD  DEFAULT ((0)) FOR [Normtom]
GO
/****** Object:  Default [DF__RVACDET__Propdev__392445F1]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RVACDET] ADD  DEFAULT ((0)) FOR [Propdev]
GO
/****** Object:  Default [DF__RVACDET__Proptom__3A186A2A]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RVACDET] ADD  DEFAULT ((0)) FOR [Proptom]
GO
/****** Object:  Default [DF__RVACDET__Prgrdev__3B0C8E63]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RVACDET] ADD  DEFAULT ((0)) FOR [Prgrdev]
GO
/****** Object:  Default [DF__RVACDET__Prgrtom__3C00B29C]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RVACDET] ADD  DEFAULT ((0)) FOR [Prgrtom]
GO
/****** Object:  Default [DF__RVACDET__Adicdev__3CF4D6D5]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RVACDET] ADD  DEFAULT ((0)) FOR [Adicdev]
GO
/****** Object:  Default [DF__RVACDET__Adictom__3DE8FB0E]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RVACDET] ADD  DEFAULT ((0)) FOR [Adictom]
GO
/****** Object:  Default [DF__RVACDET__Dulper__3EDD1F47]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RVACDET] ADD  DEFAULT ((0)) FOR [Dulper]
GO
/****** Object:  Default [DF__RVACDET__Jdd__3FD14380]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RVACDET] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__RValidac__Jdd__40C567B9]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RValidac] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__RValidac__Usuari__41B98BF2]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RValidac] ADD  DEFAULT (' ') FOR [Usuario]
GO
/****** Object:  Default [DF__RValidac__Descri__42ADB02B]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RValidac] ADD  DEFAULT (' ') FOR [Descrip]
GO
/****** Object:  Default [DF__RValidac__Condic__43A1D464]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RValidac] ADD  DEFAULT (' ') FOR [Condicion]
GO
/****** Object:  Default [DF__RValidac__Valida__4495F89D]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RValidac] ADD  DEFAULT (' ') FOR [Validacion]
GO
/****** Object:  Default [DF__RValidac__Mens_e__458A1CD6]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RValidac] ADD  DEFAULT (' ') FOR [Mens_error]
GO
/****** Object:  Default [DF__RValidac__Tipo__467E410F]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RValidac] ADD  DEFAULT (' ') FOR [Tipo]
GO
/****** Object:  Default [DF__RVerRep__reg_rep__47726548]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RVerRep] ADD  DEFAULT (' ') FOR [reg_rep]
GO
/****** Object:  Default [DF__RVerRep__ver_rep__48668981]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RVerRep] ADD  DEFAULT ((0)) FOR [ver_rep]
GO
/****** Object:  Default [DF__RVerRep__fecha_e__495AADBA]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RVerRep] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [fecha_eje]
GO
/****** Object:  Default [DF__RVerRep__usuario__4A4ED1F3]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RVerRep] ADD  DEFAULT (' ') FOR [usuario]
GO
/****** Object:  Default [DF__RVerRep__Jdd__4B42F62C]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[RVerRep] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__Sindices__Jdd__4C371A65]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Sindices] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__Sindices__Ames__4D2B3E9E]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Sindices] ADD  DEFAULT (' ') FOR [Ames]
GO
/****** Object:  Default [DF__Sindices__Uf__4E1F62D7]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Sindices] ADD  DEFAULT ((0)) FOR [Uf]
GO
/****** Object:  Default [DF__Sindices__Utm__4F138710]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Sindices] ADD  DEFAULT ((0)) FOR [Utm]
GO
/****** Object:  Default [DF__tbcas__IDCliente__5007AB49]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbcas] ADD  DEFAULT ((0)) FOR [IDCliente]
GO
/****** Object:  Default [DF__tbcas__procid__50FBCF82]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbcas] ADD  DEFAULT ((0)) FOR [procid]
GO
/****** Object:  Default [DF__tbcas__casver__51EFF3BB]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbcas] ADD  DEFAULT (' ') FOR [casver]
GO
/****** Object:  Default [DF__tbcas__casreloj__52E417F4]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbcas] ADD  DEFAULT ((0)) FOR [casreloj]
GO
/****** Object:  Default [DF__tbcas__casdll__53D83C2D]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbcas] ADD  DEFAULT (' ') FOR [casdll]
GO
/****** Object:  Default [DF__tbcas__cassp__54CC6066]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbcas] ADD  DEFAULT ((0)) FOR [cassp]
GO
/****** Object:  Default [DF__tbcas__casspesp__55C0849F]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbcas] ADD  DEFAULT ((0)) FOR [casspesp]
GO
/****** Object:  Default [DF__tbcas__casrelgen__56B4A8D8]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbcas] ADD  DEFAULT ((0)) FOR [casrelgen]
GO
/****** Object:  Default [DF__tbcas__casrelvig__57A8CD11]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbcas] ADD  DEFAULT ((0)) FOR [casrelviga]
GO
/****** Object:  Default [DF__tbcas__casrellog__589CF14A]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbcas] ADD  DEFAULT ((0)) FOR [casrellogam]
GO
/****** Object:  Default [DF__tbcas__casrelotr__59911583]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbcas] ADD  DEFAULT (' ') FOR [casrelotro]
GO
/****** Object:  Default [DF__tbcas__casmarman__5A8539BC]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbcas] ADD  DEFAULT ((0)) FOR [casmarmanu]
GO
/****** Object:  Default [DF__tbcas__casmarlin__5B795DF5]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbcas] ADD  DEFAULT ((0)) FOR [casmarlinea]
GO
/****** Object:  Default [DF__tbcas__casmarcas__5C6D822E]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbcas] ADD  DEFAULT ((0)) FOR [casmarcasi]
GO
/****** Object:  Default [DF__tbcas__casmarpay__5D61A667]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbcas] ADD  DEFAULT ((0)) FOR [casmarpay]
GO
/****** Object:  Default [DF__tbcas__casmarotr__5E55CAA0]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbcas] ADD  DEFAULT (' ') FOR [casmarotr]
GO
/****** Object:  Default [DF__tbcas__Jdd__5F49EED9]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbcas] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__tbcasacc__codigo__603E1312]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbcasacc] ADD  DEFAULT (' ') FOR [codigo]
GO
/****** Object:  Default [DF__tbcasacc__fecha__6132374B]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbcasacc] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [fecha]
GO
/****** Object:  Default [DF__tbcasacc__hora__62265B84]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbcasacc] ADD  DEFAULT (' ') FOR [hora]
GO
/****** Object:  Default [DF__tbcasacc__punto__631A7FBD]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbcasacc] ADD  DEFAULT ((0)) FOR [punto]
GO
/****** Object:  Default [DF__tbcasacc__result__640EA3F6]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbcasacc] ADD  DEFAULT (' ') FOR [resultado]
GO
/****** Object:  Default [DF__tbcasacc__creden__6502C82F]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbcasacc] ADD  DEFAULT (' ') FOR [credencial]
GO
/****** Object:  Default [DF__tbcasacc__clave__65F6EC68]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbcasacc] ADD  DEFAULT (' ') FOR [clave]
GO
/****** Object:  Default [DF__tbcasacc__Jdd__66EB10A1]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbcasacc] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__TBCASAPA__apacod__67DF34DA]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBCASAPA] ADD  DEFAULT ((0)) FOR [apacodigo]
GO
/****** Object:  Default [DF__TBCASAPA__apaleg__68D35913]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBCASAPA] ADD  DEFAULT (' ') FOR [apalegajo]
GO
/****** Object:  Default [DF__TBCASAPA__apafec__69C77D4C]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBCASAPA] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [apafecha]
GO
/****** Object:  Default [DF__TBCASAPA__apahor__6ABBA185]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBCASAPA] ADD  DEFAULT (' ') FOR [apahorae]
GO
/****** Object:  Default [DF__TBCASAPA__apahor__6BAFC5BE]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBCASAPA] ADD  DEFAULT (' ') FOR [apahoras]
GO
/****** Object:  Default [DF__TBCASAPA__apaest__6CA3E9F7]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBCASAPA] ADD  DEFAULT ((0)) FOR [apaestado]
GO
/****** Object:  Default [DF__TBCASAPA__apacen__6D980E30]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBCASAPA] ADD  DEFAULT ((0)) FOR [apacencos]
GO
/****** Object:  Default [DF__TBCASAPA__apaobs__6E8C3269]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBCASAPA] ADD  DEFAULT (' ') FOR [apaobserv]
GO
/****** Object:  Default [DF__TBCASAPA__apatip__6F8056A2]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBCASAPA] ADD  DEFAULT (' ') FOR [apatipo]
GO
/****** Object:  Default [DF__TBCASAPA__aparel__70747ADB]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBCASAPA] ADD  DEFAULT (' ') FOR [aparelE]
GO
/****** Object:  Default [DF__TBCASAPA__aparel__71689F14]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBCASAPA] ADD  DEFAULT (' ') FOR [aparelS]
GO
/****** Object:  Default [DF__TBCASAPA__Jdd__725CC34D]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBCASAPA] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__TBCASAPH__aphcod__7350E786]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBCASAPH] ADD  DEFAULT ((0)) FOR [aphcodigo]
GO
/****** Object:  Default [DF__TBCASAPH__aphleg__74450BBF]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBCASAPH] ADD  DEFAULT (' ') FOR [aphlegajo]
GO
/****** Object:  Default [DF__TBCASAPH__aphfec__75392FF8]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBCASAPH] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [aphfecha]
GO
/****** Object:  Default [DF__TBCASAPH__aphhor__762D5431]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBCASAPH] ADD  DEFAULT (' ') FOR [aphhorae]
GO
/****** Object:  Default [DF__TBCASAPH__aphhor__7721786A]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBCASAPH] ADD  DEFAULT (' ') FOR [aphhoras]
GO
/****** Object:  Default [DF__TBCASAPH__aphest__78159CA3]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBCASAPH] ADD  DEFAULT ((0)) FOR [aphestado]
GO
/****** Object:  Default [DF__TBCASAPH__aphcen__7909C0DC]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBCASAPH] ADD  DEFAULT ((0)) FOR [aphcencos]
GO
/****** Object:  Default [DF__TBCASAPH__aphobs__79FDE515]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBCASAPH] ADD  DEFAULT (' ') FOR [aphobserv]
GO
/****** Object:  Default [DF__TBCASAPH__aphtip__7AF2094E]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBCASAPH] ADD  DEFAULT (' ') FOR [aphtipo]
GO
/****** Object:  Default [DF__TBCASAPH__aphrel__7BE62D87]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBCASAPH] ADD  DEFAULT (' ') FOR [aphrelE]
GO
/****** Object:  Default [DF__TBCASAPH__aphrel__7CDA51C0]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBCASAPH] ADD  DEFAULT (' ') FOR [aphrelS]
GO
/****** Object:  Default [DF__TBCASAPH__Jdd__7DCE75F9]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBCASAPH] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__tbcasbla__codigo__7EC29A32]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbcasbla] ADD  DEFAULT (' ') FOR [codigo]
GO
/****** Object:  Default [DF__tbcasbla__punto__7FB6BE6B]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbcasbla] ADD  DEFAULT ((0)) FOR [punto]
GO
/****** Object:  Default [DF__tbcasbla__Jdd__00AAE2A4]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbcasbla] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__TBCASCAT__catfec__019F06DD]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBCASCAT] ADD  DEFAULT (getdate()) FOR [catfecha]
GO
/****** Object:  Default [DF__TBCASCAT__catesq__02932B16]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBCASCAT] ADD  DEFAULT (' ') FOR [catesqtur]
GO
/****** Object:  Default [DF__TBCASCAT__cattra__03874F4F]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBCASCAT] ADD  DEFAULT (' ') FOR [cattramo]
GO
/****** Object:  Default [DF__TBCASCAT__Jdd__047B7388]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBCASCAT] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__tbcascco__ccoleg__056F97C1]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbcascco] ADD  DEFAULT (' ') FOR [ccolegajo]
GO
/****** Object:  Default [DF__tbcascco__ccofec__0663BBFA]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbcascco] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [ccofecha]
GO
/****** Object:  Default [DF__tbcascco__ccocch__0757E033]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbcascco] ADD  DEFAULT ((0)) FOR [ccocch1]
GO
/****** Object:  Default [DF__tbcascco__ccocch__084C046C]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbcascco] ADD  DEFAULT ((0)) FOR [ccocch2]
GO
/****** Object:  Default [DF__tbcascco__ccocch__094028A5]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbcascco] ADD  DEFAULT ((0)) FOR [ccocch3]
GO
/****** Object:  Default [DF__tbcascco__ccocch__0A344CDE]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbcascco] ADD  DEFAULT ((0)) FOR [ccocch4]
GO
/****** Object:  Default [DF__tbcascco__ccocch__0B287117]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbcascco] ADD  DEFAULT ((0)) FOR [ccocch5]
GO
/****** Object:  Default [DF__tbcascco__ccocch__0C1C9550]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbcascco] ADD  DEFAULT ((0)) FOR [ccocch6]
GO
/****** Object:  Default [DF__tbcascco__ccocch__0D10B989]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbcascco] ADD  DEFAULT ((0)) FOR [ccocch7]
GO
/****** Object:  Default [DF__tbcascco__ccocch__0E04DDC2]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbcascco] ADD  DEFAULT ((0)) FOR [ccocch8]
GO
/****** Object:  Default [DF__tbcascco__ccocch__0EF901FB]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbcascco] ADD  DEFAULT ((0)) FOR [ccocch9]
GO
/****** Object:  Default [DF__tbcascco__ccocch__0FED2634]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbcascco] ADD  DEFAULT ((0)) FOR [ccocch10]
GO
/****** Object:  Default [DF__tbcascco__ccotip__10E14A6D]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbcascco] ADD  DEFAULT (' ') FOR [ccotipo]
GO
/****** Object:  Default [DF__tbcascco__ccoobs__11D56EA6]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbcascco] ADD  DEFAULT (' ') FOR [ccoobs]
GO
/****** Object:  Default [DF__tbcascco__Jdd__12C992DF]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbcascco] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__tbcascex__cexcod__13BDB718]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbcascex] ADD  DEFAULT ((0)) FOR [cexcodnov]
GO
/****** Object:  Default [DF__tbcascex__cexord__14B1DB51]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbcascex] ADD  DEFAULT ((0)) FOR [cexorden]
GO
/****** Object:  Default [DF__tbcascex__cexmot__15A5FF8A]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbcascex] ADD  DEFAULT ((0)) FOR [cexmotivo]
GO
/****** Object:  Default [DF__tbcascex__cexcod__169A23C3]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbcascex] ADD  DEFAULT (' ') FOR [cexcodigo]
GO
/****** Object:  Default [DF__tbcascex__Jdd__178E47FC]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbcascex] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__TBCASCFG__clave__18826C35]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBCASCFG] ADD  DEFAULT ((0)) FOR [clave]
GO
/****** Object:  Default [DF__TBCASCFG__valor__1976906E]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBCASCFG] ADD  DEFAULT (' ') FOR [valor]
GO
/****** Object:  Default [DF__TBCASCFG__valor2__1A6AB4A7]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBCASCFG] ADD  DEFAULT (' ') FOR [valor2]
GO
/****** Object:  Default [DF__TBCASCFG__Jdd__1B5ED8E0]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBCASCFG] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__TBCASCLK__clkcod__1C52FD19]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBCASCLK] ADD  DEFAULT (' ') FOR [clkcodigo]
GO
/****** Object:  Default [DF__TBCASCLK__clkdes__1D472152]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBCASCLK] ADD  DEFAULT (' ') FOR [clkdescrip]
GO
/****** Object:  Default [DF__TBCASCLK__clktip__1E3B458B]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBCASCLK] ADD  DEFAULT ((0)) FOR [clktipocom]
GO
/****** Object:  Default [DF__TBCASCLK__clkpor__1F2F69C4]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBCASCLK] ADD  DEFAULT (' ') FOR [clkportcom]
GO
/****** Object:  Default [DF__TBCASCLK__clkdir__20238DFD]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBCASCLK] ADD  DEFAULT (' ') FOR [clkdirec]
GO
/****** Object:  Default [DF__TBCASCLK__clkcon__2117B236]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBCASCLK] ADD  DEFAULT (' ') FOR [clkconect]
GO
/****** Object:  Default [DF__TBCASCLK__clkcen__220BD66F]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBCASCLK] ADD  DEFAULT (' ') FOR [clkcencos]
GO
/****** Object:  Default [DF__TBCASCLK__clkmod__22FFFAA8]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBCASCLK] ADD  DEFAULT ((0)) FOR [clkmodelo]
GO
/****** Object:  Default [DF__TBCASCLK__clkhab__23F41EE1]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBCASCLK] ADD  DEFAULT ((0)) FOR [clkhabilit]
GO
/****** Object:  Default [DF__TBCASCLK__clkufe__24E8431A]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBCASCLK] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [clkufecha]
GO
/****** Object:  Default [DF__TBCASCLK__clkuho__25DC6753]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBCASCLK] ADD  DEFAULT (' ') FOR [clkuhor]
GO
/****** Object:  Default [DF__TBCASCLK__clkmai__26D08B8C]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBCASCLK] ADD  DEFAULT (' ') FOR [clkmail]
GO
/****** Object:  Default [DF__TBCASCLK__clktip__27C4AFC5]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBCASCLK] ADD  DEFAULT (' ') FOR [clktipo]
GO
/****** Object:  Default [DF__TBCASCLK__clkcon__28B8D3FE]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBCASCLK] ADD  DEFAULT (' ') FOR [clkcondic]
GO
/****** Object:  Default [DF__TBCASCLK__Jdd__29ACF837]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBCASCLK] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__tbcascoh__cohcod__2AA11C70]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbcascoh] ADD  DEFAULT ((0)) FOR [cohcodigo]
GO
/****** Object:  Default [DF__tbcascoh__cohleg__2B9540A9]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbcascoh] ADD  DEFAULT (' ') FOR [cohlegajo]
GO
/****** Object:  Default [DF__tbcascoh__cohfec__2C8964E2]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbcascoh] ADD  DEFAULT (getdate()) FOR [cohfecha]
GO
/****** Object:  Default [DF__tbcascoh__cohhor__2D7D891B]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbcascoh] ADD  DEFAULT (' ') FOR [cohhora]
GO
/****** Object:  Default [DF__tbcascoh__cohtip__2E71AD54]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbcascoh] ADD  DEFAULT (' ') FOR [cohtipomov]
GO
/****** Object:  Default [DF__tbcascoh__cohrac__2F65D18D]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbcascoh] ADD  DEFAULT ((0)) FOR [cohracion]
GO
/****** Object:  Default [DF__tbcascoh__cohdia__3059F5C6]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbcascoh] ADD  DEFAULT ((0)) FOR [cohdiaan]
GO
/****** Object:  Default [DF__tbcascoh__cohtic__314E19FF]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbcascoh] ADD  DEFAULT ((0)) FOR [cohticket]
GO
/****** Object:  Default [DF__tbcascoh__cohman__32423E38]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbcascoh] ADD  DEFAULT (' ') FOR [cohmanaut]
GO
/****** Object:  Default [DF__tbcascoh__cohrel__33366271]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbcascoh] ADD  DEFAULT (' ') FOR [cohreloj]
GO
/****** Object:  Default [DF__tbcascoh__Jdd__342A86AA]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbcascoh] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__tbcascom__comcod__351EAAE3]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbcascom] ADD  DEFAULT ((0)) FOR [comcodigo]
GO
/****** Object:  Default [DF__tbcascom__comleg__3612CF1C]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbcascom] ADD  DEFAULT (' ') FOR [comlegajo]
GO
/****** Object:  Default [DF__tbcascom__comfec__3706F355]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbcascom] ADD  DEFAULT (getdate()) FOR [comfecha]
GO
/****** Object:  Default [DF__tbcascom__comhor__37FB178E]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbcascom] ADD  DEFAULT (' ') FOR [comhora]
GO
/****** Object:  Default [DF__tbcascom__comtip__38EF3BC7]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbcascom] ADD  DEFAULT (' ') FOR [comtipomov]
GO
/****** Object:  Default [DF__tbcascom__comrac__39E36000]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbcascom] ADD  DEFAULT ((0)) FOR [comracion]
GO
/****** Object:  Default [DF__tbcascom__comdia__3AD78439]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbcascom] ADD  DEFAULT ((0)) FOR [comdiaan]
GO
/****** Object:  Default [DF__tbcascom__comtic__3BCBA872]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbcascom] ADD  DEFAULT ((0)) FOR [comticket]
GO
/****** Object:  Default [DF__tbcascom__comman__3CBFCCAB]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbcascom] ADD  DEFAULT (' ') FOR [commanaut]
GO
/****** Object:  Default [DF__tbcascom__comrel__3DB3F0E4]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbcascom] ADD  DEFAULT (' ') FOR [comreloj]
GO
/****** Object:  Default [DF__tbcascom__Jdd__3EA8151D]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbcascom] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__tbcascre__crecod__3F9C3956]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbcascre] ADD  DEFAULT ((0)) FOR [crecodigo]
GO
/****** Object:  Default [DF__tbcascre__cretar__40905D8F]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbcascre] ADD  DEFAULT (' ') FOR [cretarjeta]
GO
/****** Object:  Default [DF__tbcascre__crefec__418481C8]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbcascre] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [crefecha]
GO
/****** Object:  Default [DF__tbcascre__crehor__4278A601]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbcascre] ADD  DEFAULT (' ') FOR [crehora]
GO
/****** Object:  Default [DF__tbcascre__cretip__436CCA3A]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbcascre] ADD  DEFAULT (' ') FOR [cretipomov]
GO
/****** Object:  Default [DF__tbcascre__crerel__4460EE73]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbcascre] ADD  DEFAULT (' ') FOR [crereloj]
GO
/****** Object:  Default [DF__tbcascre__crenoa__455512AC]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbcascre] ADD  DEFAULT ((0)) FOR [crenoapa]
GO
/****** Object:  Default [DF__tbcascre__Jdd__464936E5]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbcascre] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__tbcaselm__elmnov__473D5B1E]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbcaselm] ADD  DEFAULT ((0)) FOR [elmnovedad]
GO
/****** Object:  Default [DF__tbcaselm__elmord__48317F57]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbcaselm] ADD  DEFAULT ((0)) FOR [elmorden]
GO
/****** Object:  Default [DF__tbcaselm__elmval__4925A390]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbcaselm] ADD  DEFAULT (' ') FOR [elmvalor]
GO
/****** Object:  Default [DF__tbcaselm__Jdd__4A19C7C9]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbcaselm] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__tbcasera__codigo__4B0DEC02]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbcasera] ADD  DEFAULT (' ') FOR [codigo]
GO
/****** Object:  Default [DF__tbcasera__racion__4C02103B]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbcasera] ADD  DEFAULT ((0)) FOR [racion]
GO
/****** Object:  Default [DF__tbcasera__multip__4CF63474]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbcasera] ADD  DEFAULT (getdate()) FOR [multiples]
GO
/****** Object:  Default [DF__tbcasera__Jdd__4DEA58AD]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbcasera] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__TBCASERO__erocod__4EDE7CE6]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBCASERO] ADD  DEFAULT (' ') FOR [erocodigo]
GO
/****** Object:  Default [DF__TBCASERO__erodes__4FD2A11F]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBCASERO] ADD  DEFAULT (' ') FOR [erodescrip]
GO
/****** Object:  Default [DF__TBCASERO__Jdd__50C6C558]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBCASERO] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__TBCASERT__ertesq__51BAE991]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBCASERT] ADD  DEFAULT (' ') FOR [ertesqrot]
GO
/****** Object:  Default [DF__TBCASERT__erttra__52AF0DCA]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBCASERT] ADD  DEFAULT (' ') FOR [erttramo]
GO
/****** Object:  Default [DF__TBCASERT__ertsec__53A33203]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBCASERT] ADD  DEFAULT ((0)) FOR [ertsecuenc]
GO
/****** Object:  Default [DF__TBCASERT__ertdia__5497563C]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBCASERT] ADD  DEFAULT ((0)) FOR [ertdias]
GO
/****** Object:  Default [DF__TBCASERT__Jdd__558B7A75]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBCASERT] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__TBCASETR__etrleg__567F9EAE]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBCASETR] ADD  DEFAULT (' ') FOR [etrlegajo]
GO
/****** Object:  Default [DF__TBCASETR__etrfec__5773C2E7]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBCASETR] ADD  DEFAULT (getdate()) FOR [etrfecha]
GO
/****** Object:  Default [DF__TBCASETR__etrtra__5867E720]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBCASETR] ADD  DEFAULT (' ') FOR [etrtramo]
GO
/****** Object:  Default [DF__TBCASETR__etresq__595C0B59]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBCASETR] ADD  DEFAULT (' ') FOR [etresqtur]
GO
/****** Object:  Default [DF__TBCASETR__etrent__5A502F92]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBCASETR] ADD  DEFAULT (' ') FOR [etrent]
GO
/****** Object:  Default [DF__TBCASETR__etrsal__5B4453CB]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBCASETR] ADD  DEFAULT (' ') FOR [etrsal]
GO
/****** Object:  Default [DF__TBCASETR__etrent__5C387804]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBCASETR] ADD  DEFAULT (' ') FOR [etrent1]
GO
/****** Object:  Default [DF__TBCASETR__etrsal__5D2C9C3D]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBCASETR] ADD  DEFAULT (' ') FOR [etrsal1]
GO
/****** Object:  Default [DF__TBCASETR__Jdd__5E20C076]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBCASETR] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__TBCASETU__etucod__5F14E4AF]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBCASETU] ADD  DEFAULT (' ') FOR [etucodigo]
GO
/****** Object:  Default [DF__TBCASETU__etudes__600908E8]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBCASETU] ADD  DEFAULT (' ') FOR [etudescrip]
GO
/****** Object:  Default [DF__TBCASETU__etuini__60FD2D21]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBCASETU] ADD  DEFAULT (getdate()) FOR [etuinicio]
GO
/****** Object:  Default [DF__TBCASETU__etuesq__61F1515A]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBCASETU] ADD  DEFAULT (' ') FOR [etuesqrot]
GO
/****** Object:  Default [DF__TBCASETU__etusec__62E57593]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBCASETU] ADD  DEFAULT ((0)) FOR [etusecini]
GO
/****** Object:  Default [DF__TBCASETU__etudia__63D999CC]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBCASETU] ADD  DEFAULT ((0)) FOR [etudiaini]
GO
/****** Object:  Default [DF__TBCASETU__Jdd__64CDBE05]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBCASETU] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__TbCasEva__EvaTar__6D6DF0FE]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TbCasEva] ADD  DEFAULT ((0)) FOR [EvaTareo]
GO
/****** Object:  Default [DF__TbCasEva__EvaFec__6E621537]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TbCasEva] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [EvaFecha]
GO
/****** Object:  Default [DF__TbCasEva__EvaUsu__6F563970]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TbCasEva] ADD  DEFAULT (' ') FOR [EvaUsuario]
GO
/****** Object:  Default [DF__TbCasEva__EvaEst__704A5DA9]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TbCasEva] ADD  DEFAULT (' ') FOR [EvaEstado]
GO
/****** Object:  Default [DF__TbCasEva__EvaObs__713E81E2]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TbCasEva] ADD  DEFAULT (' ') FOR [EvaObserv]
GO
/****** Object:  Default [DF__TbCasEva__Jdd__7232A61B]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TbCasEva] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__TBCASLIQ__codigo__65C1E23E]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBCASLIQ] ADD  DEFAULT (' ') FOR [codigo]
GO
/****** Object:  Default [DF__TBCASLIQ__dia__66B60677]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBCASLIQ] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [dia]
GO
/****** Object:  Default [DF__TBCASLIQ__cohade__67AA2AB0]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBCASLIQ] ADD  DEFAULT (' ') FOR [cohade]
GO
/****** Object:  Default [DF__TBCASLIQ__horas__689E4EE9]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBCASLIQ] ADD  DEFAULT ((0)) FOR [horas]
GO
/****** Object:  Default [DF__TBCASLIQ__tipo__69927322]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBCASLIQ] ADD  DEFAULT (' ') FOR [tipo]
GO
/****** Object:  Default [DF__TBCASLIQ__cencos__6A86975B]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBCASLIQ] ADD  DEFAULT ((0)) FOR [cencos]
GO
/****** Object:  Default [DF__TBCASLIQ__cerrad__6B7ABB94]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBCASLIQ] ADD  DEFAULT (' ') FOR [cerrado]
GO
/****** Object:  Default [DF__TBCASLIQ__modifi__6C6EDFCD]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBCASLIQ] ADD  DEFAULT ((0)) FOR [modificado]
GO
/****** Object:  Default [DF__TBCASLIQ__Jdd__6D630406]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBCASLIQ] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__tbcasneg__codigo__6E57283F]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbcasneg] ADD  DEFAULT (' ') FOR [codigo]
GO
/****** Object:  Default [DF__tbcasneg__punto__6F4B4C78]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbcasneg] ADD  DEFAULT ((0)) FOR [punto]
GO
/****** Object:  Default [DF__tbcasneg__Jdd__703F70B1]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbcasneg] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__tbcasnmh__nmhnov__713394EA]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbcasnmh] ADD  DEFAULT ((0)) FOR [nmhnovedad]
GO
/****** Object:  Default [DF__tbcasnmh__nmhord__7227B923]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbcasnmh] ADD  DEFAULT ((0)) FOR [nmhordenpr]
GO
/****** Object:  Default [DF__tbcasnmh__nmhfec__731BDD5C]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbcasnmh] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [nmhfecha]
GO
/****** Object:  Default [DF__tbcasnmh__nmhleg__74100195]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbcasnmh] ADD  DEFAULT (' ') FOR [nmhlegajo]
GO
/****** Object:  Default [DF__tbcasnmh__nmhhor__750425CE]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbcasnmh] ADD  DEFAULT (' ') FOR [nmhhoraini]
GO
/****** Object:  Default [DF__tbcasnmh__nmhhor__75F84A07]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbcasnmh] ADD  DEFAULT (' ') FOR [nmhhorafin]
GO
/****** Object:  Default [DF__tbcasnmh__nmhtip__76EC6E40]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbcasnmh] ADD  DEFAULT (' ') FOR [nmhtipo]
GO
/****** Object:  Default [DF__tbcasnmh__nmhult__77E09279]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbcasnmh] ADD  DEFAULT ((0)) FOR [nmhultimo]
GO
/****** Object:  Default [DF__tbcasnmh__nmhcex__78D4B6B2]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbcasnmh] ADD  DEFAULT (' ') FOR [nmhcex]
GO
/****** Object:  Default [DF__tbcasnmh__nmhaut__79C8DAEB]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbcasnmh] ADD  DEFAULT (getdate()) FOR [nmhautfech]
GO
/****** Object:  Default [DF__tbcasnmh__nmhaut__7ABCFF24]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbcasnmh] ADD  DEFAULT (' ') FOR [nmhautusr]
GO
/****** Object:  Default [DF__tbcasnmh__nmhapr__7BB1235D]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbcasnmh] ADD  DEFAULT (getdate()) FOR [nmhaprfech]
GO
/****** Object:  Default [DF__tbcasnmh__nmhapr__7CA54796]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbcasnmh] ADD  DEFAULT (' ') FOR [nmhaprusr]
GO
/****** Object:  Default [DF__tbcasnmh__nmhcen__7D996BCF]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbcasnmh] ADD  DEFAULT ((0)) FOR [nmhcencos]
GO
/****** Object:  Default [DF__tbcasnmh__nmhrec__7E8D9008]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbcasnmh] ADD  DEFAULT (getdate()) FOR [nmhrecfech]
GO
/****** Object:  Default [DF__tbcasnmh__nmhrec__7F81B441]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbcasnmh] ADD  DEFAULT (' ') FOR [nmhrecusr]
GO
/****** Object:  Default [DF__tbcasnmh__nmhaut__0075D87A]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbcasnmh] ADD  DEFAULT (' ') FOR [nmhautoriz]
GO
/****** Object:  Default [DF__tbcasnmh__Jdd__0169FCB3]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbcasnmh] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__tbcasnmo__nmonov__025E20EC]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbcasnmo] ADD  DEFAULT ((0)) FOR [nmonovedad]
GO
/****** Object:  Default [DF__tbcasnmo__nmoord__03524525]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbcasnmo] ADD  DEFAULT ((0)) FOR [nmoordenpr]
GO
/****** Object:  Default [DF__tbcasnmo__nmofec__0446695E]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbcasnmo] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [nmofecha]
GO
/****** Object:  Default [DF__tbcasnmo__nmoleg__053A8D97]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbcasnmo] ADD  DEFAULT (' ') FOR [nmolegajo]
GO
/****** Object:  Default [DF__tbcasnmo__nmohor__062EB1D0]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbcasnmo] ADD  DEFAULT (' ') FOR [nmohoraini]
GO
/****** Object:  Default [DF__tbcasnmo__nmohor__0722D609]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbcasnmo] ADD  DEFAULT (' ') FOR [nmohorafin]
GO
/****** Object:  Default [DF__tbcasnmo__nmotip__0816FA42]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbcasnmo] ADD  DEFAULT (' ') FOR [nmotipo]
GO
/****** Object:  Default [DF__tbcasnmo__nmoult__090B1E7B]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbcasnmo] ADD  DEFAULT ((0)) FOR [nmoultimo]
GO
/****** Object:  Default [DF__tbcasnmo__nmocex__09FF42B4]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbcasnmo] ADD  DEFAULT (' ') FOR [nmocex]
GO
/****** Object:  Default [DF__tbcasnmo__nmoaut__0AF366ED]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbcasnmo] ADD  DEFAULT (getdate()) FOR [nmoautfech]
GO
/****** Object:  Default [DF__tbcasnmo__nmoaut__0BE78B26]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbcasnmo] ADD  DEFAULT (' ') FOR [nmoautusr]
GO
/****** Object:  Default [DF__tbcasnmo__nmoapr__0CDBAF5F]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbcasnmo] ADD  DEFAULT (getdate()) FOR [nmoaprfech]
GO
/****** Object:  Default [DF__tbcasnmo__nmoapr__0DCFD398]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbcasnmo] ADD  DEFAULT (' ') FOR [nmoaprusr]
GO
/****** Object:  Default [DF__tbcasnmo__nmocen__0EC3F7D1]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbcasnmo] ADD  DEFAULT ((0)) FOR [nmocencos]
GO
/****** Object:  Default [DF__tbcasnmo__nmorec__0FB81C0A]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbcasnmo] ADD  DEFAULT (getdate()) FOR [nmorecfech]
GO
/****** Object:  Default [DF__tbcasnmo__nmorec__10AC4043]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbcasnmo] ADD  DEFAULT (' ') FOR [nmorecusr]
GO
/****** Object:  Default [DF__tbcasnmo__nmoaut__11A0647C]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbcasnmo] ADD  DEFAULT (' ') FOR [nmoautoriz]
GO
/****** Object:  Default [DF__tbcasnmo__Jdd__129488B5]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbcasnmo] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__tbcasnoh__nohcod__1388ACEE]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbcasnoh] ADD  DEFAULT ((0)) FOR [nohcodigo]
GO
/****** Object:  Default [DF__tbcasnoh__nohtip__147CD127]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbcasnoh] ADD  DEFAULT ((0)) FOR [nohtipo]
GO
/****** Object:  Default [DF__tbcasnoh__nohcre__1570F560]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbcasnoh] ADD  DEFAULT (getdate()) FOR [nohcrefech]
GO
/****** Object:  Default [DF__tbcasnoh__nohcre__16651999]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbcasnoh] ADD  DEFAULT (' ') FOR [nohcreusr]
GO
/****** Object:  Default [DF__tbcasnoh__nohmot__17593DD2]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbcasnoh] ADD  DEFAULT ((0)) FOR [nohmotivo]
GO
/****** Object:  Default [DF__tbcasnoh__nohobs__184D620B]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbcasnoh] ADD  DEFAULT (' ') FOR [nohobs]
GO
/****** Object:  Default [DF__tbcasnoh__nohtdi__19418644]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbcasnoh] ADD  DEFAULT ((0)) FOR [nohtdia]
GO
/****** Object:  Default [DF__tbcasnoh__nohotr__1A35AA7D]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbcasnoh] ADD  DEFAULT ((0)) FOR [nohotros]
GO
/****** Object:  Default [DF__tbcasnoh__nohnoc__1B29CEB6]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbcasnoh] ADD  DEFAULT (' ') FOR [nohnocas]
GO
/****** Object:  Default [DF__tbcasnoh__Jdd__1C1DF2EF]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbcasnoh] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__tbcasnoh__novnoc__1D121728]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbcasnoh] ADD  DEFAULT (' ') FOR [novnocas]
GO
/****** Object:  Default [DF__tbcasnov__novcod__1E063B61]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbcasnov] ADD  DEFAULT ((0)) FOR [novcodigo]
GO
/****** Object:  Default [DF__tbcasnov__novtip__1EFA5F9A]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbcasnov] ADD  DEFAULT ((0)) FOR [novtipo]
GO
/****** Object:  Default [DF__tbcasnov__novcre__1FEE83D3]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbcasnov] ADD  DEFAULT (getdate()) FOR [novcrefech]
GO
/****** Object:  Default [DF__tbcasnov__novcre__20E2A80C]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbcasnov] ADD  DEFAULT (' ') FOR [novcreusr]
GO
/****** Object:  Default [DF__tbcasnov__novmot__21D6CC45]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbcasnov] ADD  DEFAULT ((0)) FOR [novmotivo]
GO
/****** Object:  Default [DF__tbcasnov__novobs__22CAF07E]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbcasnov] ADD  DEFAULT (' ') FOR [novobs]
GO
/****** Object:  Default [DF__tbcasnov__novtdi__23BF14B7]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbcasnov] ADD  DEFAULT ((0)) FOR [novtdia]
GO
/****** Object:  Default [DF__tbcasnov__novotr__24B338F0]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbcasnov] ADD  DEFAULT ((0)) FOR [novotros]
GO
/****** Object:  Default [DF__tbcasnov__novnoc__25A75D29]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbcasnov] ADD  DEFAULT (' ') FOR [novnocas]
GO
/****** Object:  Default [DF__tbcasnov__Jdd__269B8162]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbcasnov] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__tbcaspac__codigo__278FA59B]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbcaspac] ADD  DEFAULT ((0)) FOR [codigo]
GO
/****** Object:  Default [DF__tbcaspac__descri__2883C9D4]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbcaspac] ADD  DEFAULT (' ') FOR [descrip]
GO
/****** Object:  Default [DF__tbcaspac__lector__2977EE0D]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbcaspac] ADD  DEFAULT ((0)) FOR [lector]
GO
/****** Object:  Default [DF__tbcaspac__tipo__2A6C1246]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbcaspac] ADD  DEFAULT (' ') FOR [tipo]
GO
/****** Object:  Default [DF__tbcaspac__estado__2B60367F]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbcaspac] ADD  DEFAULT (' ') FOR [estado]
GO
/****** Object:  Default [DF__tbcaspac__obs__2C545AB8]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbcaspac] ADD  DEFAULT (' ') FOR [obs]
GO
/****** Object:  Default [DF__tbcaspac__Jdd__2D487EF1]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbcaspac] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__TbCasPdo__PdoAme__2E3CA32A]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TbCasPdo] ADD  DEFAULT (' ') FOR [PdoAmes]
GO
/****** Object:  Default [DF__TbCasPdo__PdoUni__2F30C763]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TbCasPdo] ADD  DEFAULT ((0)) FOR [PdoUnidad]
GO
/****** Object:  Default [DF__TbCasPdo__PdoEst__3024EB9C]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TbCasPdo] ADD  DEFAULT (' ') FOR [PdoEstado]
GO
/****** Object:  Default [DF__TbCasPdo__PdoEmp__31190FD5]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TbCasPdo] ADD  DEFAULT (' ') FOR [PdoEmpMod]
GO
/****** Object:  Default [DF__TbCasPdo__PdoFec__320D340E]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TbCasPdo] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [PdoFecMod]
GO
/****** Object:  Default [DF__TbCasPdo__PdoEmp__33015847]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TbCasPdo] ADD  DEFAULT (' ') FOR [PdoEmpSup]
GO
/****** Object:  Default [DF__TbCasPdo__PdoFec__33F57C80]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TbCasPdo] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [PdoFecSup]
GO
/****** Object:  Default [DF__TbCasPdo__PdoEmp__34E9A0B9]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TbCasPdo] ADD  DEFAULT (' ') FOR [PdoEmpApr1]
GO
/****** Object:  Default [DF__TbCasPdo__PdoFec__35DDC4F2]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TbCasPdo] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [PdoFecApr1]
GO
/****** Object:  Default [DF__TbCasPdo__PdoEmp__36D1E92B]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TbCasPdo] ADD  DEFAULT (' ') FOR [PdoEmpApr2]
GO
/****** Object:  Default [DF__TbCasPdo__PdoFec__37C60D64]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TbCasPdo] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [PdoFecApr2]
GO
/****** Object:  Default [DF__TbCasPdo__PdoEmp__38BA319D]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TbCasPdo] ADD  DEFAULT (' ') FOR [PdoEmpRRHH]
GO
/****** Object:  Default [DF__TbCasPdo__PdoFec__39AE55D6]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TbCasPdo] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [PdoFecRRHH]
GO
/****** Object:  Default [DF__tbcaspen__codigo__3AA27A0F]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbcaspen] ADD  DEFAULT (' ') FOR [codigo]
GO
/****** Object:  Default [DF__tbcaspen__fecha__3B969E48]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbcaspen] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [fecha]
GO
/****** Object:  Default [DF__tbcaspen__estado__3C8AC281]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbcaspen] ADD  DEFAULT (' ') FOR [estado]
GO
/****** Object:  Default [DF__tbcaspen__cr__3D7EE6BA]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbcaspen] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [cr]
GO
/****** Object:  Default [DF__tbcaspen__Jdd__3E730AF3]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbcaspen] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__tbcasper__fecha___3F672F2C]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbcasper] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [fecha_ini]
GO
/****** Object:  Default [DF__tbcasper__fecha___405B5365]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbcasper] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [fecha_fin]
GO
/****** Object:  Default [DF__tbcasper__fecha___414F779E]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbcasper] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [fecha_cie]
GO
/****** Object:  Default [DF__tbcasper__usuari__42439BD7]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbcasper] ADD  DEFAULT (' ') FOR [usuario]
GO
/****** Object:  Default [DF__tbcasper__Jdd__4337C010]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbcasper] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__TBCASRAC__codigo__442BE449]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBCASRAC] ADD  DEFAULT ((0)) FOR [codigo]
GO
/****** Object:  Default [DF__TBCASRAC__descri__45200882]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBCASRAC] ADD  DEFAULT (' ') FOR [descrip]
GO
/****** Object:  Default [DF__TBCASRAC__horari__46142CBB]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBCASRAC] ADD  DEFAULT (' ') FOR [horario1e]
GO
/****** Object:  Default [DF__TBCASRAC__horari__470850F4]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBCASRAC] ADD  DEFAULT (' ') FOR [horario1s]
GO
/****** Object:  Default [DF__TBCASRAC__horari__47FC752D]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBCASRAC] ADD  DEFAULT (' ') FOR [horario2e]
GO
/****** Object:  Default [DF__TBCASRAC__horari__48F09966]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBCASRAC] ADD  DEFAULT (' ') FOR [horario2s]
GO
/****** Object:  Default [DF__TBCASRAC__horari__49E4BD9F]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBCASRAC] ADD  DEFAULT (' ') FOR [horario3e]
GO
/****** Object:  Default [DF__TBCASRAC__horari__4AD8E1D8]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBCASRAC] ADD  DEFAULT (' ') FOR [horario3s]
GO
/****** Object:  Default [DF__TBCASRAC__horari__4BCD0611]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBCASRAC] ADD  DEFAULT (' ') FOR [horario4e]
GO
/****** Object:  Default [DF__TBCASRAC__horari__4CC12A4A]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBCASRAC] ADD  DEFAULT (' ') FOR [horario4s]
GO
/****** Object:  Default [DF__TBCASRAC__valor__4DB54E83]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBCASRAC] ADD  DEFAULT ((0)) FOR [valor]
GO
/****** Object:  Default [DF__TBCASRAC__ant1__4EA972BC]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBCASRAC] ADD  DEFAULT ((0)) FOR [ant1]
GO
/****** Object:  Default [DF__TBCASRAC__ant2__4F9D96F5]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBCASRAC] ADD  DEFAULT ((0)) FOR [ant2]
GO
/****** Object:  Default [DF__TBCASRAC__ant3__5091BB2E]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBCASRAC] ADD  DEFAULT ((0)) FOR [ant3]
GO
/****** Object:  Default [DF__TBCASRAC__ant4__5185DF67]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBCASRAC] ADD  DEFAULT ((0)) FOR [ant4]
GO
/****** Object:  Default [DF__TBCASRAC__reloje__527A03A0]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBCASRAC] ADD  DEFAULT (' ') FOR [relojes]
GO
/****** Object:  Default [DF__TBCASRAC__Jdd__536E27D9]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBCASRAC] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__tbcasrel__relcod__54624C12]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbcasrel] ADD  DEFAULT ((0)) FOR [relcodigo]
GO
/****** Object:  Default [DF__tbcasrel__relleg__5556704B]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbcasrel] ADD  DEFAULT (' ') FOR [rellegajo]
GO
/****** Object:  Default [DF__tbcasrel__relfec__564A9484]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbcasrel] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [relfecha]
GO
/****** Object:  Default [DF__tbcasrel__relhor__573EB8BD]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbcasrel] ADD  DEFAULT (' ') FOR [relhora]
GO
/****** Object:  Default [DF__tbcasrel__reltip__5832DCF6]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbcasrel] ADD  DEFAULT (' ') FOR [reltipomov]
GO
/****** Object:  Default [DF__tbcasrel__relrel__5927012F]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbcasrel] ADD  DEFAULT (' ') FOR [relreloj]
GO
/****** Object:  Default [DF__tbcasrel__Jdd__5A1B2568]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbcasrel] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__TbCasSrA__SraFec__5B0F49A1]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TbCasSrA] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [SraFecha]
GO
/****** Object:  Default [DF__TbCasSrA__SraUni__5C036DDA]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TbCasSrA] ADD  DEFAULT ((0)) FOR [SraUnidad]
GO
/****** Object:  Default [DF__TbCasSrA__SraAme__5CF79213]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TbCasSrA] ADD  DEFAULT (' ') FOR [SraAmes]
GO
/****** Object:  Default [DF__TbCasSrA__SraFec__5DEBB64C]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TbCasSrA] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [SraFecini]
GO
/****** Object:  Default [DF__TbCasSrA__SraFef__5EDFDA85]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TbCasSrA] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [SraFefini]
GO
/****** Object:  Default [DF__TbCasSrA__SraEst__5FD3FEBE]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TbCasSrA] ADD  DEFAULT (' ') FOR [SraEstado]
GO
/****** Object:  Default [DF__TbCasSrA__SraFec__60C822F7]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TbCasSrA] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [SraFecapr]
GO
/****** Object:  Default [DF__TbCasSrA__SraFec__61BC4730]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TbCasSrA] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [SraFecrec]
GO
/****** Object:  Default [DF__TbCasSrA__SraUsu__62B06B69]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TbCasSrA] ADD  DEFAULT (' ') FOR [SraUsuario]
GO
/****** Object:  Default [DF__TbCasSrA__SraUsu__63A48FA2]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TbCasSrA] ADD  DEFAULT (' ') FOR [SraUsuapr]
GO
/****** Object:  Default [DF__TbCasSrA__SraUsu__6498B3DB]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TbCasSrA] ADD  DEFAULT (' ') FOR [SraUsurec]
GO
/****** Object:  Default [DF__TbCasSrA__SraObs__658CD814]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TbCasSrA] ADD  DEFAULT (' ') FOR [SraObserv]
GO
/****** Object:  Default [DF__TbCasSrA__Jdd__6680FC4D]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TbCasSrA] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__TbCasStr__StrFec__67752086]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TbCasStr] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [StrFecha]
GO
/****** Object:  Default [DF__TbCasStr__StrUni__686944BF]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TbCasStr] ADD  DEFAULT ((0)) FOR [StrUnidadO]
GO
/****** Object:  Default [DF__TbCasStr__StrUni__695D68F8]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TbCasStr] ADD  DEFAULT ((0)) FOR [StrUnidadD]
GO
/****** Object:  Default [DF__TbCasStr__StrCod__6A518D31]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TbCasStr] ADD  DEFAULT (' ') FOR [StrCodigo]
GO
/****** Object:  Default [DF__TbCasStr__StrEst__6B45B16A]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TbCasStr] ADD  DEFAULT (' ') FOR [StrEstado]
GO
/****** Object:  Default [DF__TbCasStr__StrFec__6C39D5A3]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TbCasStr] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [StrFecTra]
GO
/****** Object:  Default [DF__TbCasStr__StrFec__6D2DF9DC]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TbCasStr] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [StrFecApr]
GO
/****** Object:  Default [DF__TbCasStr__StrFec__6E221E15]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TbCasStr] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [StrFecRec]
GO
/****** Object:  Default [DF__TbCasStr__StrUsu__6F16424E]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TbCasStr] ADD  DEFAULT (' ') FOR [StrUsuario]
GO
/****** Object:  Default [DF__TbCasStr__StrUsu__700A6687]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TbCasStr] ADD  DEFAULT (' ') FOR [StrUsuApr]
GO
/****** Object:  Default [DF__TbCasStr__StrUsu__70FE8AC0]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TbCasStr] ADD  DEFAULT (' ') FOR [StrUsuRec]
GO
/****** Object:  Default [DF__TbCasStr__StrObs__71F2AEF9]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TbCasStr] ADD  DEFAULT (' ') FOR [StrObserv]
GO
/****** Object:  Default [DF__TbCasStr__Jdd__72E6D332]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TbCasStr] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__TbCasTad__TadAme__38FA28BF]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TbCasTad] ADD  DEFAULT (' ') FOR [TadAmes]
GO
/****** Object:  Default [DF__TbCasTad__TadUni__39EE4CF8]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TbCasTad] ADD  DEFAULT ((0)) FOR [TadUnidad]
GO
/****** Object:  Default [DF__TbCasTad__TadFec__3AE27131]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TbCasTad] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [TadFecha]
GO
/****** Object:  Default [DF__TbCasTad__TadFec__3BD6956A]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TbCasTad] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [TadFecIni]
GO
/****** Object:  Default [DF__TbCasTad__TadFec__3CCAB9A3]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TbCasTad] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [TadFecFin]
GO
/****** Object:  Default [DF__TbCasTad__TadEst__3DBEDDDC]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TbCasTad] ADD  DEFAULT (' ') FOR [TadEstadop]
GO
/****** Object:  Default [DF__TbCasTad__TadEst__3EB30215]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TbCasTad] ADD  DEFAULT (' ') FOR [TadEstador]
GO
/****** Object:  Default [DF__TbCasTad__TadUsu__3FA7264E]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TbCasTad] ADD  DEFAULT (' ') FOR [TadUsuMod]
GO
/****** Object:  Default [DF__TbCasTad__TadFec__409B4A87]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TbCasTad] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [TadFecMod]
GO
/****** Object:  Default [DF__TbCasTad__TadUsu__418F6EC0]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TbCasTad] ADD  DEFAULT (' ') FOR [TadUsuSup]
GO
/****** Object:  Default [DF__TbCasTad__TadFec__428392F9]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TbCasTad] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [TadFecSup]
GO
/****** Object:  Default [DF__TbCasTad__TadUsu__4377B732]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TbCasTad] ADD  DEFAULT (' ') FOR [TadUsuApr1]
GO
/****** Object:  Default [DF__TbCasTad__TadFec__446BDB6B]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TbCasTad] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [TadFecaPr1]
GO
/****** Object:  Default [DF__TbCasTad__TadUsu__455FFFA4]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TbCasTad] ADD  DEFAULT (' ') FOR [TadUsuApr2]
GO
/****** Object:  Default [DF__TbCasTad__TadFec__465423DD]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TbCasTad] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [TadFecApr2]
GO
/****** Object:  Default [DF__TbCasTad__TadUsu__47484816]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TbCasTad] ADD  DEFAULT (' ') FOR [TadUsuRrhh]
GO
/****** Object:  Default [DF__TbCasTad__TadFec__483C6C4F]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TbCasTad] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [TadFecRrhh]
GO
/****** Object:  Default [DF__TbCasTar__TarCod__73DAF76B]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TbCasTar] ADD  DEFAULT (' ') FOR [TarCodigo]
GO
/****** Object:  Default [DF__TbCasTar__TarFec__74CF1BA4]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TbCasTar] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [TarFecha]
GO
/****** Object:  Default [DF__TbCasTar__TarUni__75C33FDD]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TbCasTar] ADD  DEFAULT ((0)) FOR [TarUnidad]
GO
/****** Object:  Default [DF__TbCasTar__TarHor__76B76416]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TbCasTar] ADD  DEFAULT ((0)) FOR [TarHorasP]
GO
/****** Object:  Default [DF__TbCasTar__TarHor__77AB884F]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TbCasTar] ADD  DEFAULT ((0)) FOR [TarHorasR]
GO
/****** Object:  Default [DF__TbCasTar__TarTip__789FAC88]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TbCasTar] ADD  DEFAULT ((0)) FOR [TarTipAsiP]
GO
/****** Object:  Default [DF__TbCasTar__TarTip__7993D0C1]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TbCasTar] ADD  DEFAULT ((0)) FOR [TarTipAsiR]
GO
/****** Object:  Default [DF__tbcastnm__tnmcod__7A87F4FA]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbcastnm] ADD  DEFAULT ((0)) FOR [tnmcodigo]
GO
/****** Object:  Default [DF__tbcastnm__tnmord__7B7C1933]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbcastnm] ADD  DEFAULT ((0)) FOR [tnmorden]
GO
/****** Object:  Default [DF__tbcastnm__tnm_le__7C703D6C]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbcastnm] ADD  DEFAULT (' ') FOR [tnm_legaj]
GO
/****** Object:  Default [DF__tbcastnm__tnm_fe__7D6461A5]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbcastnm] ADD  DEFAULT (' ') FOR [tnm_fecha]
GO
/****** Object:  Default [DF__tbcastnm__tnm_hi__7E5885DE]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbcastnm] ADD  DEFAULT (' ') FOR [tnm_hini]
GO
/****** Object:  Default [DF__tbcastnm__tnm_hf__7F4CAA17]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbcastnm] ADD  DEFAULT (' ') FOR [tnm_hfin]
GO
/****** Object:  Default [DF__tbcastnm__tnm_ti__0040CE50]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbcastnm] ADD  DEFAULT (' ') FOR [tnm_tipo]
GO
/****** Object:  Default [DF__tbcastnm__tnm_ca__0134F289]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbcastnm] ADD  DEFAULT ((0)) FOR [tnm_cam]
GO
/****** Object:  Default [DF__tbcastnm__tnm_ce__022916C2]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbcastnm] ADD  DEFAULT (' ') FOR [tnm_cext]
GO
/****** Object:  Default [DF__tbcastnm__tnm_ex__031D3AFB]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbcastnm] ADD  DEFAULT ((0)) FOR [tnm_excl]
GO
/****** Object:  Default [DF__tbcastnm__tnm_vt__04115F34]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbcastnm] ADD  DEFAULT ((0)) FOR [tnm_vteo]
GO
/****** Object:  Default [DF__tbcastnm__tnm_vn__0505836D]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbcastnm] ADD  DEFAULT ((0)) FOR [tnm_vnov]
GO
/****** Object:  Default [DF__tbcastnm__tnm_td__05F9A7A6]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbcastnm] ADD  DEFAULT ((0)) FOR [tnm_tdia]
GO
/****** Object:  Default [DF__tbcastnm__Jdd__06EDCBDF]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbcastnm] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__tbcastnn__tnncod__07E1F018]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbcastnn] ADD  DEFAULT ((0)) FOR [tnncodigo]
GO
/****** Object:  Default [DF__tbcastnn__tnndes__08D61451]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbcastnn] ADD  DEFAULT (' ') FOR [tnndescrip]
GO
/****** Object:  Default [DF__tbcastnn__tnnord__09CA388A]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbcastnn] ADD  DEFAULT ((0)) FOR [tnnorden]
GO
/****** Object:  Default [DF__tbcastnn__tnnmen__0ABE5CC3]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbcastnn] ADD  DEFAULT (' ') FOR [tnnmenu]
GO
/****** Object:  Default [DF__tbcastnn__tnn_lb__0BB280FC]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbcastnn] ADD  DEFAULT (' ') FOR [tnn_lbl1]
GO
/****** Object:  Default [DF__tbcastnn__tnn_lb__0CA6A535]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbcastnn] ADD  DEFAULT (' ') FOR [tnn_lbl2]
GO
/****** Object:  Default [DF__tbcastnn__tnn_co__0D9AC96E]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbcastnn] ADD  DEFAULT ((0)) FOR [tnn_cotab]
GO
/****** Object:  Default [DF__tbcastnn__tnn_ot__0E8EEDA7]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbcastnn] ADD  DEFAULT ((0)) FOR [tnn_otros]
GO
/****** Object:  Default [DF__tbcastnn__tnnhab__0F8311E0]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbcastnn] ADD  DEFAULT ((0)) FOR [tnnhabilit]
GO
/****** Object:  Default [DF__tbcastnn__tnn_va__10773619]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbcastnn] ADD  DEFAULT ((0)) FOR [tnn_valid]
GO
/****** Object:  Default [DF__tbcastnn__tnn_fr__116B5A52]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbcastnn] ADD  DEFAULT (' ') FOR [tnn_frmext]
GO
/****** Object:  Default [DF__tbcastnn__tnn_co__125F7E8B]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbcastnn] ADD  DEFAULT (' ') FOR [tnn_cols]
GO
/****** Object:  Default [DF__tbcastnn__Jdd__1353A2C4]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbcastnn] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__TBCASTRA__tracod__1447C6FD]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBCASTRA] ADD  DEFAULT (' ') FOR [tracodigo]
GO
/****** Object:  Default [DF__TBCASTRA__trades__153BEB36]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBCASTRA] ADD  DEFAULT (' ') FOR [tradescrip]
GO
/****** Object:  Default [DF__TBCASTRA__trahor__16300F6F]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBCASTRA] ADD  DEFAULT (' ') FOR [trahoraini]
GO
/****** Object:  Default [DF__TBCASTRA__trahor__172433A8]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBCASTRA] ADD  DEFAULT (' ') FOR [trahorafin]
GO
/****** Object:  Default [DF__TBCASTRA__tratip__181857E1]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBCASTRA] ADD  DEFAULT (' ') FOR [tratipo]
GO
/****** Object:  Default [DF__TBCASTRA__tratol__190C7C1A]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBCASTRA] ADD  DEFAULT (' ') FOR [tratolesat]
GO
/****** Object:  Default [DF__TBCASTRA__tratol__1A00A053]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBCASTRA] ADD  DEFAULT (' ') FOR [tratoleshe]
GO
/****** Object:  Default [DF__TBCASTRA__tratol__1AF4C48C]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBCASTRA] ADD  DEFAULT (' ') FOR [tratolssin]
GO
/****** Object:  Default [DF__TBCASTRA__tratol__1BE8E8C5]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBCASTRA] ADD  DEFAULT (' ') FOR [tratolsshe]
GO
/****** Object:  Default [DF__TBCASTRA__tracol__1CDD0CFE]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBCASTRA] ADD  DEFAULT ((0)) FOR [tracolor]
GO
/****** Object:  Default [DF__TBCASTRA__traint__1DD13137]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBCASTRA] ADD  DEFAULT (' ') FOR [traintini]
GO
/****** Object:  Default [DF__TBCASTRA__traint__1EC55570]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBCASTRA] ADD  DEFAULT (' ') FOR [traintfin]
GO
/****** Object:  Default [DF__TBCASTRA__trafla__1FB979A9]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBCASTRA] ADD  DEFAULT ((0)) FOR [traflags]
GO
/****** Object:  Default [DF__TBCASTRA__traent__20AD9DE2]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBCASTRA] ADD  DEFAULT (' ') FOR [traentmax]
GO
/****** Object:  Default [DF__TBCASTRA__traent__21A1C21B]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBCASTRA] ADD  DEFAULT (' ') FOR [traentsup]
GO
/****** Object:  Default [DF__TBCASTRA__tratol__2295E654]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBCASTRA] ADD  DEFAULT (' ') FOR [tratolent]
GO
/****** Object:  Default [DF__TBCASTRA__tratot__238A0A8D]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBCASTRA] ADD  DEFAULT (' ') FOR [tratotnor]
GO
/****** Object:  Default [DF__TBCASTRA__tratol__247E2EC6]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBCASTRA] ADD  DEFAULT (' ') FOR [tratolcol]
GO
/****** Object:  Default [DF__TBCASTRA__traent__257252FF]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBCASTRA] ADD  DEFAULT (' ') FOR [traentlim]
GO
/****** Object:  Default [DF__TBCASTRA__tragru__26667738]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBCASTRA] ADD  DEFAULT ((0)) FOR [tragrupo]
GO
/****** Object:  Default [DF__TBCASTRA__tracon__275A9B71]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBCASTRA] ADD  DEFAULT (' ') FOR [traconjun]
GO
/****** Object:  Default [DF__TBCASTRA__Jdd__284EBFAA]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBCASTRA] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__TBCASTUF__Codigo__2942E3E3]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBCASTUF] ADD  DEFAULT ((0)) FOR [CodigoUF]
GO
/****** Object:  Default [DF__TBCASTUF__Taread__2A37081C]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBCASTUF] ADD  DEFAULT (' ') FOR [Tareador]
GO
/****** Object:  Default [DF__TBCASUFU__Codigo__2B2B2C55]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBCASUFU] ADD  DEFAULT ((0)) FOR [CodigoUF]
GO
/****** Object:  Default [DF__TBCASUFU__Tope__2C1F508E]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBCASUFU] ADD  DEFAULT ((0)) FOR [Tope]
GO
/****** Object:  Default [DF__TBCASUFU__Horas__2D1374C7]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBCASUFU] ADD  DEFAULT ((0)) FOR [Horas]
GO
/****** Object:  Default [DF__TBCASUFU__Aproba__2E079900]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBCASUFU] ADD  DEFAULT (' ') FOR [Aprobador1]
GO
/****** Object:  Default [DF__TBCASUFU__Aproba__2EFBBD39]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBCASUFU] ADD  DEFAULT (' ') FOR [Aprobador2]
GO
/****** Object:  Default [DF__tbcat__catprobli__2FEFE172]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbcat] ADD  DEFAULT ((0)) FOR [catproblid]
GO
/****** Object:  Default [DF__tbcat__cattipoid__30E405AB]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbcat] ADD  DEFAULT ((0)) FOR [cattipoid]
GO
/****** Object:  Default [DF__tbcat__catdet__31D829E4]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbcat] ADD  DEFAULT ((0)) FOR [catdet]
GO
/****** Object:  Default [DF__tbcat__catsoluc__32CC4E1D]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbcat] ADD  DEFAULT (' ') FOR [catsoluc]
GO
/****** Object:  Default [DF__tbcat__Jdd__33C07256]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbcat] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__tbcontemp__prsid__34B4968F]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbcontempr] ADD  DEFAULT ((0)) FOR [prsid]
GO
/****** Object:  Default [DF__tbcontemp__IDCli__35A8BAC8]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbcontempr] ADD  DEFAULT ((0)) FOR [IDCliente]
GO
/****** Object:  Default [DF__tbcontemp__conte__369CDF01]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbcontempr] ADD  DEFAULT (getdate()) FOR [contemprfechact]
GO
/****** Object:  Default [DF__tbcontemp__conte__3791033A]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbcontempr] ADD  DEFAULT ((0)) FOR [contemprcargo]
GO
/****** Object:  Default [DF__tbcontemp__conte__38852773]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbcontempr] ADD  DEFAULT (' ') FOR [contemprtel]
GO
/****** Object:  Default [DF__tbcontemp__conte__39794BAC]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbcontempr] ADD  DEFAULT (' ') FOR [contemprcel]
GO
/****** Object:  Default [DF__tbcontemp__conte__3A6D6FE5]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbcontempr] ADD  DEFAULT ((0)) FOR [contemprestado]
GO
/****** Object:  Default [DF__tbcontemp__fechi__3B61941E]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbcontempr] ADD  DEFAULT (getdate()) FOR [fechini]
GO
/****** Object:  Default [DF__tbcontemp__fechf__3C55B857]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbcontempr] ADD  DEFAULT (getdate()) FOR [fechfin]
GO
/****** Object:  Default [DF__tbcontempr__Jdd__3D49DC90]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbcontempr] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__TBEVA_RHU__Modul__3E3E00C9]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVA_RHU] ADD  DEFAULT (' ') FOR [Modulo]
GO
/****** Object:  Default [DF__TBEVA_RHU__Descr__3F322502]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVA_RHU] ADD  DEFAULT (' ') FOR [Descrip]
GO
/****** Object:  Default [DF__TBEVA_RHU__Tipo__4026493B]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVA_RHU] ADD  DEFAULT (' ') FOR [Tipo]
GO
/****** Object:  Default [DF__TBEVA_RHU__Campo__411A6D74]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVA_RHU] ADD  DEFAULT (' ') FOR [Campos]
GO
/****** Object:  Default [DF__TBEVA_RHU__Desde__420E91AD]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVA_RHU] ADD  DEFAULT (' ') FOR [Desde]
GO
/****** Object:  Default [DF__TBEVA_RHU__Filtr__4302B5E6]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVA_RHU] ADD  DEFAULT (' ') FOR [Filtro]
GO
/****** Object:  Default [DF__TBEVA_RHU__Agrup__43F6DA1F]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVA_RHU] ADD  DEFAULT (' ') FOR [Agrupa]
GO
/****** Object:  Default [DF__TBEVA_RHU__Orden__44EAFE58]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVA_RHU] ADD  DEFAULT (' ') FOR [Orden]
GO
/****** Object:  Default [DF__TBEVA_RHU__Tippe__45DF2291]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVA_RHU] ADD  DEFAULT ((0)) FOR [Tipper]
GO
/****** Object:  Default [DF__TBEVA_RHU__Cohad__46D346CA]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVA_RHU] ADD  DEFAULT (' ') FOR [Cohades]
GO
/****** Object:  Default [DF__TBEVA_RHU__Usuar__47C76B03]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVA_RHU] ADD  DEFAULT (' ') FOR [Usuario]
GO
/****** Object:  Default [DF__TBEVA_RHU__Indir__48BB8F3C]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVA_RHU] ADD  DEFAULT ((0)) FOR [Indir]
GO
/****** Object:  Default [DF__TBEVA_RHU__Direc__49AFB375]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVA_RHU] ADD  DEFAULT (' ') FOR [Directa]
GO
/****** Object:  Default [DF__TBEVA_RHU__Swher__4AA3D7AE]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVA_RHU] ADD  DEFAULT (' ') FOR [Swhere]
GO
/****** Object:  Default [DF__TBEVA_RHU__Pwher__4B97FBE7]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVA_RHU] ADD  DEFAULT (' ') FOR [Pwhere]
GO
/****** Object:  Default [DF__TBEVA_RHU__org__4C8C2020]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVA_RHU] ADD  DEFAULT (' ') FOR [org]
GO
/****** Object:  Default [DF__TBEVA_RHU__cabec__4D804459]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVA_RHU] ADD  DEFAULT (' ') FOR [cabecera]
GO
/****** Object:  Default [DF__TBEVA_RHU__visib__4E746892]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVA_RHU] ADD  DEFAULT (' ') FOR [visibles]
GO
/****** Object:  Default [DF__TBEVA_RHU__nperi__4F688CCB]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVA_RHU] ADD  DEFAULT ((0)) FOR [nperiodo]
GO
/****** Object:  Default [DF__TBEVA_RHU__Pexpr__505CB104]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVA_RHU] ADD  DEFAULT (' ') FOR [Pexpre]
GO
/****** Object:  Default [DF__TBEVA_RHU__Clasi__5150D53D]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVA_RHU] ADD  DEFAULT ((0)) FOR [Clasif]
GO
/****** Object:  Default [DF__TBEVA_RHU__grupo__5244F976]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVA_RHU] ADD  DEFAULT (' ') FOR [grupos]
GO
/****** Object:  Default [DF__TBEVA_RHU__dueno__53391DAF]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVA_RHU] ADD  DEFAULT (' ') FOR [dueno]
GO
/****** Object:  Default [DF__TBEVA_RHU__Jdd__542D41E8]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVA_RHU] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__TBEVAAPM__APMGRU__55216621]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAAPM] ADD  DEFAULT ((0)) FOR [APMGRUPO]
GO
/****** Object:  Default [DF__TBEVAAPM__APMEST__56158A5A]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAAPM] ADD  DEFAULT ((0)) FOR [APMESTADO]
GO
/****** Object:  Default [DF__TBEVAAPM__APMEVA__5709AE93]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAAPM] ADD  DEFAULT ((0)) FOR [APMEVALUA]
GO
/****** Object:  Default [DF__TBEVAAPM__APMSUP__57FDD2CC]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAAPM] ADD  DEFAULT ((0)) FOR [APMSUPERI]
GO
/****** Object:  Default [DF__TBEVAAPM__APMREV__58F1F705]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAAPM] ADD  DEFAULT ((0)) FOR [APMREVIS1]
GO
/****** Object:  Default [DF__TBEVAAPM__APMREV__59E61B3E]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAAPM] ADD  DEFAULT ((0)) FOR [APMREVIS2]
GO
/****** Object:  Default [DF__TBEVAAPM__APMRRH__5ADA3F77]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAAPM] ADD  DEFAULT ((0)) FOR [APMRRHH]
GO
/****** Object:  Default [DF__TBEVAAPM__APMEVD__5BCE63B0]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAAPM] ADD  DEFAULT ((0)) FOR [APMEVDCOD]
GO
/****** Object:  Default [DF__TBEVAAPM__Jdd__5CC287E9]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAAPM] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__TBEVACAT__codigo__5DB6AC22]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVACAT] ADD  DEFAULT ((0)) FOR [codigo]
GO
/****** Object:  Default [DF__TBEVACAT__codvar__5EAAD05B]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVACAT] ADD  DEFAULT (' ') FOR [codvar]
GO
/****** Object:  Default [DF__TBEVACAT__archiv__5F9EF494]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVACAT] ADD  DEFAULT (' ') FOR [archivo]
GO
/****** Object:  Default [DF__TBEVACAT__clasif__609318CD]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVACAT] ADD  DEFAULT (' ') FOR [clasif]
GO
/****** Object:  Default [DF__TBEVACAT__campo__61873D06]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVACAT] ADD  DEFAULT (' ') FOR [campo]
GO
/****** Object:  Default [DF__TBEVACAT__captio__627B613F]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVACAT] ADD  DEFAULT (' ') FOR [caption]
GO
/****** Object:  Default [DF__TBEVACAT__descri__636F8578]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVACAT] ADD  DEFAULT (' ') FOR [descrip]
GO
/****** Object:  Default [DF__TBEVACAT__alias__6463A9B1]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVACAT] ADD  DEFAULT (' ') FOR [alias]
GO
/****** Object:  Default [DF__TBEVACAT__tabla__6557CDEA]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVACAT] ADD  DEFAULT ((0)) FOR [tabla]
GO
/****** Object:  Default [DF__TBEVACAT__rtcodi__664BF223]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVACAT] ADD  DEFAULT ((0)) FOR [rtcodigo]
GO
/****** Object:  Default [DF__TBEVACAT__contab__6740165C]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVACAT] ADD  DEFAULT (' ') FOR [contab]
GO
/****** Object:  Default [DF__TBEVACAT__calcul__68343A95]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVACAT] ADD  DEFAULT (' ') FOR [calculo]
GO
/****** Object:  Default [DF__TBEVACAT__tipo__69285ECE]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVACAT] ADD  DEFAULT (' ') FOR [tipo]
GO
/****** Object:  Default [DF__TBEVACAT__largo__6A1C8307]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVACAT] ADD  DEFAULT ((0)) FOR [largo]
GO
/****** Object:  Default [DF__TBEVACAT__deci__6B10A740]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVACAT] ADD  DEFAULT ((0)) FOR [deci]
GO
/****** Object:  Default [DF__TBEVACAT__format__6C04CB79]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVACAT] ADD  DEFAULT (' ') FOR [format]
GO
/****** Object:  Default [DF__TBEVACAT__pic__6CF8EFB2]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVACAT] ADD  DEFAULT (' ') FOR [pic]
GO
/****** Object:  Default [DF__TBEVACAT__valida__6DED13EB]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVACAT] ADD  DEFAULT (' ') FOR [valida]
GO
/****** Object:  Default [DF__TBEVACAT__busca__6EE13824]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVACAT] ADD  DEFAULT (' ') FOR [busca]
GO
/****** Object:  Default [DF__TBEVACAT__modi__6FD55C5D]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVACAT] ADD  DEFAULT (' ') FOR [modi]
GO
/****** Object:  Default [DF__TBEVACAT__histor__70C98096]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVACAT] ADD  DEFAULT (' ') FOR [histor]
GO
/****** Object:  Default [DF__TBEVACAT__lisord__71BDA4CF]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVACAT] ADD  DEFAULT (' ') FOR [lisord]
GO
/****** Object:  Default [DF__TBEVACAT__Jdd__72B1C908]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVACAT] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__TBEVACEM__cemCOD__73A5ED41]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVACEM] ADD  DEFAULT ((0)) FOR [cemCODEVD]
GO
/****** Object:  Default [DF__TBEVACEM__cemLEG__749A117A]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVACEM] ADD  DEFAULT (' ') FOR [cemLEGAJO]
GO
/****** Object:  Default [DF__TBEVACEM__cemMET__758E35B3]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVACEM] ADD  DEFAULT ((0)) FOR [cemMETCOD]
GO
/****** Object:  Default [DF__TBEVACEM__cemGRU__768259EC]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVACEM] ADD  DEFAULT ((0)) FOR [cemGRUPO]
GO
/****** Object:  Default [DF__TBEVACEM__cemCOD__77767E25]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVACEM] ADD  DEFAULT ((0)) FOR [cemCODIGO]
GO
/****** Object:  Default [DF__TBEVACEM__cemFEC__786AA25E]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVACEM] ADD  DEFAULT (getdate()) FOR [cemFECHA]
GO
/****** Object:  Default [DF__TBEVACEM__cemCOM__795EC697]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVACEM] ADD  DEFAULT (' ') FOR [cemCOMENT]
GO
/****** Object:  Default [DF__TBEVACEM__cemANO__7A52EAD0]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVACEM] ADD  DEFAULT (' ') FOR [cemANOT]
GO
/****** Object:  Default [DF__TBEVACEM__cemPOS__7B470F09]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVACEM] ADD  DEFAULT (' ') FOR [cemPOSNEG]
GO
/****** Object:  Default [DF__TBEVACEM__cemREQ__7C3B3342]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVACEM] ADD  DEFAULT ((0)) FOR [cemREQCAP]
GO
/****** Object:  Default [DF__TBEVACEM__cemPOR__7D2F577B]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVACEM] ADD  DEFAULT ((0)) FOR [cemPORC]
GO
/****** Object:  Default [DF__TBEVACEM__Jdd__7E237BB4]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVACEM] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__TBEVACES__cesnum__7F179FED]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVACES] ADD  DEFAULT ((0)) FOR [cesnumero]
GO
/****** Object:  Default [DF__TBEVACES__ceseva__000BC426]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVACES] ADD  DEFAULT ((0)) FOR [cesevaluac]
GO
/****** Object:  Default [DF__TBEVACES__cesgru__00FFE85F]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVACES] ADD  DEFAULT ((0)) FOR [cesgrupo]
GO
/****** Object:  Default [DF__TBEVACES__cesvot__01F40C98]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVACES] ADD  DEFAULT ((0)) FOR [cesvotante]
GO
/****** Object:  Default [DF__TBEVACES__cestip__02E830D1]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVACES] ADD  DEFAULT ((0)) FOR [cestipovot]
GO
/****** Object:  Default [DF__TBEVACES__cesfac__03DC550A]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVACES] ADD  DEFAULT (' ') FOR [cesfactor]
GO
/****** Object:  Default [DF__TBEVACES__cessub__04D07943]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVACES] ADD  DEFAULT (' ') FOR [cessubfac]
GO
/****** Object:  Default [DF__TBEVACES__cesfec__05C49D7C]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVACES] ADD  DEFAULT (getdate()) FOR [cesfecha]
GO
/****** Object:  Default [DF__TBEVACES__cesano__06B8C1B5]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVACES] ADD  DEFAULT (' ') FOR [cesanot]
GO
/****** Object:  Default [DF__TBEVACES__cescom__07ACE5EE]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVACES] ADD  DEFAULT (' ') FOR [cescoment]
GO
/****** Object:  Default [DF__TBEVACES__cespos__08A10A27]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVACES] ADD  DEFAULT (' ') FOR [cesposneg]
GO
/****** Object:  Default [DF__TBEVACES__cesreq__09952E60]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVACES] ADD  DEFAULT ((0)) FOR [cesreqcap]
GO
/****** Object:  Default [DF__TBEVACES__cespos__0A895299]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVACES] ADD  DEFAULT ((0)) FOR [cesposneg2]
GO
/****** Object:  Default [DF__TBEVACES__Jdd__0B7D76D2]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVACES] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__TBEVACFG__CFGFOR__0C719B0B]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVACFG] ADD  DEFAULT (' ') FOR [CFGFORM]
GO
/****** Object:  Default [DF__TBEVACFG__CFGVAL__0D65BF44]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVACFG] ADD  DEFAULT ((0)) FOR [CFGVALOR]
GO
/****** Object:  Default [DF__TBEVACFG__CFGVAL__0E59E37D]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVACFG] ADD  DEFAULT (' ') FOR [CFGVALOR2]
GO
/****** Object:  Default [DF__TBEVACFG__Jdd__0F4E07B6]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVACFG] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__TBEVACGR__cgrnum__10422BEF]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVACGR] ADD  DEFAULT ((0)) FOR [cgrnumero]
GO
/****** Object:  Default [DF__TBEVACGR__cgreva__11365028]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVACGR] ADD  DEFAULT ((0)) FOR [cgrevaluac]
GO
/****** Object:  Default [DF__TBEVACGR__cgrgru__122A7461]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVACGR] ADD  DEFAULT ((0)) FOR [cgrgrupo]
GO
/****** Object:  Default [DF__TBEVACGR__cgrvot__131E989A]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVACGR] ADD  DEFAULT ((0)) FOR [cgrvotante]
GO
/****** Object:  Default [DF__TBEVACGR__cgrtip__1412BCD3]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVACGR] ADD  DEFAULT ((0)) FOR [cgrtipovot]
GO
/****** Object:  Default [DF__TBEVACGR__cgrfec__1506E10C]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVACGR] ADD  DEFAULT (getdate()) FOR [cgrfecha]
GO
/****** Object:  Default [DF__TBEVACGR__cgrano__15FB0545]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVACGR] ADD  DEFAULT (' ') FOR [cgranot]
GO
/****** Object:  Default [DF__TBEVACGR__cgrcom__16EF297E]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVACGR] ADD  DEFAULT (' ') FOR [cgrcoment]
GO
/****** Object:  Default [DF__TBEVACGR__Jdd__17E34DB7]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVACGR] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__TBEVACON__CONCOD__18D771F0]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVACON] ADD  DEFAULT ((0)) FOR [CONCODINC]
GO
/****** Object:  Default [DF__TBEVACON__CONCOD__19CB9629]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVACON] ADD  DEFAULT ((0)) FOR [CONCODIGO]
GO
/****** Object:  Default [DF__TBEVACON__CONPOR__1ABFBA62]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVACON] ADD  DEFAULT ((0)) FOR [CONPORCENT]
GO
/****** Object:  Default [DF__TBEVACON__CONPRO__1BB3DE9B]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVACON] ADD  DEFAULT (' ') FOR [CONPROCED]
GO
/****** Object:  Default [DF__TBEVACON__CONAPL__1CA802D4]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVACON] ADD  DEFAULT ((0)) FOR [CONAPLICA]
GO
/****** Object:  Default [DF__TBEVACON__CONTEX__1D9C270D]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVACON] ADD  DEFAULT ((0)) FOR [CONTEXCLU]
GO
/****** Object:  Default [DF__TBEVACON__CONHAB__1E904B46]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVACON] ADD  DEFAULT ((0)) FOR [CONHABILIT]
GO
/****** Object:  Default [DF__TBEVACON__CONDES__1F846F7F]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVACON] ADD  DEFAULT (' ') FOR [CONDESCRIP]
GO
/****** Object:  Default [DF__TBEVACON__CONCON__207893B8]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVACON] ADD  DEFAULT (' ') FOR [CONCONDIC]
GO
/****** Object:  Default [DF__TBEVACON__CONDES__216CB7F1]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVACON] ADD  DEFAULT (' ') FOR [CONDESCAD]
GO
/****** Object:  Default [DF__TBEVACON__CONVER__2260DC2A]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVACON] ADD  DEFAULT ((0)) FOR [CONVER]
GO
/****** Object:  Default [DF__TBEVACON__CONT1E__23550063]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVACON] ADD  DEFAULT ((0)) FOR [CONT1E]
GO
/****** Object:  Default [DF__TBEVACON__CONT1A__2449249C]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVACON] ADD  DEFAULT ((0)) FOR [CONT1A]
GO
/****** Object:  Default [DF__TBEVACON__CONT2E__253D48D5]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVACON] ADD  DEFAULT ((0)) FOR [CONT2E]
GO
/****** Object:  Default [DF__TBEVACON__CONT2A__26316D0E]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVACON] ADD  DEFAULT ((0)) FOR [CONT2A]
GO
/****** Object:  Default [DF__TBEVACON__CONT3E__27259147]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVACON] ADD  DEFAULT ((0)) FOR [CONT3E]
GO
/****** Object:  Default [DF__TBEVACON__CONT3A__2819B580]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVACON] ADD  DEFAULT ((0)) FOR [CONT3A]
GO
/****** Object:  Default [DF__TBEVACON__CONT4E__290DD9B9]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVACON] ADD  DEFAULT ((0)) FOR [CONT4E]
GO
/****** Object:  Default [DF__TBEVACON__CONT4A__2A01FDF2]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVACON] ADD  DEFAULT ((0)) FOR [CONT4A]
GO
/****** Object:  Default [DF__TBEVACON__CONT5E__2AF6222B]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVACON] ADD  DEFAULT ((0)) FOR [CONT5E]
GO
/****** Object:  Default [DF__TBEVACON__CONT5A__2BEA4664]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVACON] ADD  DEFAULT ((0)) FOR [CONT5A]
GO
/****** Object:  Default [DF__TBEVACON__CONT6E__2CDE6A9D]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVACON] ADD  DEFAULT ((0)) FOR [CONT6E]
GO
/****** Object:  Default [DF__TBEVACON__CONT6A__2DD28ED6]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVACON] ADD  DEFAULT ((0)) FOR [CONT6A]
GO
/****** Object:  Default [DF__TBEVACON__CONT7E__2EC6B30F]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVACON] ADD  DEFAULT ((0)) FOR [CONT7E]
GO
/****** Object:  Default [DF__TBEVACON__CONT7A__2FBAD748]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVACON] ADD  DEFAULT ((0)) FOR [CONT7A]
GO
/****** Object:  Default [DF__TBEVACON__CONT8E__30AEFB81]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVACON] ADD  DEFAULT ((0)) FOR [CONT8E]
GO
/****** Object:  Default [DF__TBEVACON__CONT8A__31A31FBA]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVACON] ADD  DEFAULT ((0)) FOR [CONT8A]
GO
/****** Object:  Default [DF__TBEVACON__CONT9E__329743F3]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVACON] ADD  DEFAULT ((0)) FOR [CONT9E]
GO
/****** Object:  Default [DF__TBEVACON__CONT9A__338B682C]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVACON] ADD  DEFAULT ((0)) FOR [CONT9A]
GO
/****** Object:  Default [DF__TBEVACON__CONT10__347F8C65]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVACON] ADD  DEFAULT ((0)) FOR [CONT10E]
GO
/****** Object:  Default [DF__TBEVACON__CONT10__3573B09E]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVACON] ADD  DEFAULT ((0)) FOR [CONT10A]
GO
/****** Object:  Default [DF__TBEVACON__CONT11__3667D4D7]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVACON] ADD  DEFAULT ((0)) FOR [CONT11E]
GO
/****** Object:  Default [DF__TBEVACON__CONT11__375BF910]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVACON] ADD  DEFAULT ((0)) FOR [CONT11A]
GO
/****** Object:  Default [DF__TBEVACON__CONT12__38501D49]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVACON] ADD  DEFAULT ((0)) FOR [CONT12E]
GO
/****** Object:  Default [DF__TBEVACON__CONT12__39444182]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVACON] ADD  DEFAULT ((0)) FOR [CONT12A]
GO
/****** Object:  Default [DF__TBEVACON__CONT13__3A3865BB]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVACON] ADD  DEFAULT ((0)) FOR [CONT13E]
GO
/****** Object:  Default [DF__TBEVACON__CONT13__3B2C89F4]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVACON] ADD  DEFAULT ((0)) FOR [CONT13A]
GO
/****** Object:  Default [DF__TBEVACON__CONT14__3C20AE2D]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVACON] ADD  DEFAULT ((0)) FOR [CONT14E]
GO
/****** Object:  Default [DF__TBEVACON__CONT14__3D14D266]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVACON] ADD  DEFAULT ((0)) FOR [CONT14A]
GO
/****** Object:  Default [DF__TBEVACON__CONT15__3E08F69F]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVACON] ADD  DEFAULT ((0)) FOR [CONT15E]
GO
/****** Object:  Default [DF__TBEVACON__CONT15__3EFD1AD8]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVACON] ADD  DEFAULT ((0)) FOR [CONT15A]
GO
/****** Object:  Default [DF__TBEVACON__CONTIP__3FF13F11]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVACON] ADD  DEFAULT ((0)) FOR [CONTIPO]
GO
/****** Object:  Default [DF__TBEVACON__CONTIP__40E5634A]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVACON] ADD  DEFAULT ((0)) FOR [CONTIPOCAL]
GO
/****** Object:  Default [DF__TBEVACON__CONCOD__41D98783]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVACON] ADD  DEFAULT ((0)) FOR [CONCODEVA]
GO
/****** Object:  Default [DF__TBEVACON__Jdd__42CDABBC]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVACON] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__TBEVADEF__DEFCOD__43C1CFF5]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVADEF] ADD  DEFAULT ((0)) FOR [DEFCODIGO]
GO
/****** Object:  Default [DF__TBEVADEF__DEFCOD__44B5F42E]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVADEF] ADD  DEFAULT (' ') FOR [DEFCODFMT]
GO
/****** Object:  Default [DF__TBEVADEF__DEFCOD__45AA1867]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVADEF] ADD  DEFAULT (' ') FOR [DEFCODFAC]
GO
/****** Object:  Default [DF__TBEVADEF__DEFPUN__469E3CA0]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVADEF] ADD  DEFAULT ((0)) FOR [DEFPUNTOSA]
GO
/****** Object:  Default [DF__TBEVADEF__DEFPUN__479260D9]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVADEF] ADD  DEFAULT ((0)) FOR [DEFPUNTOSE]
GO
/****** Object:  Default [DF__TBEVADEF__DEFPUN__48868512]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVADEF] ADD  DEFAULT ((0)) FOR [DEFPUNTOSC]
GO
/****** Object:  Default [DF__TBEVADEF__DEFPTS__497AA94B]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVADEF] ADD  DEFAULT ((0)) FOR [DEFPTSPAR]
GO
/****** Object:  Default [DF__TBEVADEF__DEFPTS__4A6ECD84]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVADEF] ADD  DEFAULT ((0)) FOR [DEFPTSSUP]
GO
/****** Object:  Default [DF__TBEVADEF__DEFPTS__4B62F1BD]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVADEF] ADD  DEFAULT ((0)) FOR [DEFPTSEMS]
GO
/****** Object:  Default [DF__TBEVADEF__DEFPTS__4C5715F6]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVADEF] ADD  DEFAULT ((0)) FOR [DEFPTSCLI]
GO
/****** Object:  Default [DF__TBEVADEF__DEFPTS__4D4B3A2F]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVADEF] ADD  DEFAULT ((0)) FOR [DEFPTSPRO]
GO
/****** Object:  Default [DF__TBEVADEF__defpts__4E3F5E68]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVADEF] ADD  DEFAULT ((0)) FOR [defptsotr]
GO
/****** Object:  Default [DF__TBEVADEF__Jdd__4F3382A1]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVADEF] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__TBEVADEP__DEPCOD__5027A6DA]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVADEP] ADD  DEFAULT ((0)) FOR [DEPCODIGO]
GO
/****** Object:  Default [DF__TBEVADEP__DEPCOD__511BCB13]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVADEP] ADD  DEFAULT (' ') FOR [DEPCODFMT]
GO
/****** Object:  Default [DF__TBEVADEP__DEPCOD__520FEF4C]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVADEP] ADD  DEFAULT (' ') FOR [DEPCODFAC]
GO
/****** Object:  Default [DF__TBEVADEP__DEPCOD__53041385]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVADEP] ADD  DEFAULT (' ') FOR [DEPCODSFA]
GO
/****** Object:  Default [DF__TBEVADEP__DEPLEG__53F837BE]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVADEP] ADD  DEFAULT (' ') FOR [DEPLEGAJO]
GO
/****** Object:  Default [DF__TBEVADEP__DEPPUN__54EC5BF7]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVADEP] ADD  DEFAULT ((0)) FOR [DEPPUNSUP]
GO
/****** Object:  Default [DF__TBEVADEP__DEPPUN__55E08030]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVADEP] ADD  DEFAULT ((0)) FOR [DEPPUNAUT]
GO
/****** Object:  Default [DF__TBEVADEP__DEPPUN__56D4A469]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVADEP] ADD  DEFAULT ((0)) FOR [DEPPUNPAR]
GO
/****** Object:  Default [DF__TBEVADEP__DEPPUN__57C8C8A2]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVADEP] ADD  DEFAULT ((0)) FOR [DEPPUNCOL]
GO
/****** Object:  Default [DF__TBEVADEP__DEPPUN__58BCECDB]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVADEP] ADD  DEFAULT ((0)) FOR [DEPPUNCLI]
GO
/****** Object:  Default [DF__TBEVADEP__DEPPUN__59B11114]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVADEP] ADD  DEFAULT ((0)) FOR [DEPPUNJSU]
GO
/****** Object:  Default [DF__TBEVADEP__DEPPUN__5AA5354D]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVADEP] ADD  DEFAULT ((0)) FOR [DEPPUNOTR]
GO
/****** Object:  Default [DF__TBEVADEP__DEPPUN__5B995986]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVADEP] ADD  DEFAULT ((0)) FOR [DEPPUNCLE]
GO
/****** Object:  Default [DF__TBEVADEP__DEPPUN__5C8D7DBF]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVADEP] ADD  DEFAULT ((0)) FOR [DEPPUNPRO]
GO
/****** Object:  Default [DF__TBEVADEP__DEPOBS__5D81A1F8]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVADEP] ADD  DEFAULT (' ') FOR [DEPOBSERVA]
GO
/****** Object:  Default [DF__TBEVADEP__DEPOBS__5E75C631]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVADEP] ADD  DEFAULT (' ') FOR [DEPOBSERVE]
GO
/****** Object:  Default [DF__TBEVADEP__DEPOBS__5F69EA6A]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVADEP] ADD  DEFAULT (' ') FOR [DEPOBSERVC]
GO
/****** Object:  Default [DF__TBEVADEP__DEPOBS__605E0EA3]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVADEP] ADD  DEFAULT (' ') FOR [DEPOBSPAR]
GO
/****** Object:  Default [DF__TBEVADEP__DEPOBS__615232DC]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVADEP] ADD  DEFAULT (' ') FOR [DEPOBSSUP]
GO
/****** Object:  Default [DF__TBEVADEP__DEPOBS__62465715]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVADEP] ADD  DEFAULT (' ') FOR [DEPOBSEMS]
GO
/****** Object:  Default [DF__TBEVADEP__DEPOBS__633A7B4E]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVADEP] ADD  DEFAULT (' ') FOR [DEPOBSCLI]
GO
/****** Object:  Default [DF__TBEVADEP__DEPOBS__642E9F87]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVADEP] ADD  DEFAULT (' ') FOR [DEPOBSPRO]
GO
/****** Object:  Default [DF__TBEVADEP__DEPOBS__6522C3C0]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVADEP] ADD  DEFAULT (' ') FOR [DEPOBSotr]
GO
/****** Object:  Default [DF__TBEVADEP__DEPCOM__6616E7F9]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVADEP] ADD  DEFAULT (' ') FOR [DEPCOMENTA]
GO
/****** Object:  Default [DF__TBEVADEP__DEPCOM__670B0C32]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVADEP] ADD  DEFAULT (' ') FOR [DEPCOMENTE]
GO
/****** Object:  Default [DF__TBEVADEP__DEPCOM__67FF306B]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVADEP] ADD  DEFAULT (' ') FOR [DEPCOMENTC]
GO
/****** Object:  Default [DF__TBEVADEP__DEPCOM__68F354A4]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVADEP] ADD  DEFAULT (' ') FOR [DEPCOMPAR]
GO
/****** Object:  Default [DF__TBEVADEP__DEPCOM__69E778DD]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVADEP] ADD  DEFAULT (' ') FOR [DEPCOMSUP]
GO
/****** Object:  Default [DF__TBEVADEP__DEPCOM__6ADB9D16]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVADEP] ADD  DEFAULT (' ') FOR [DEPCOMEMS]
GO
/****** Object:  Default [DF__TBEVADEP__DEPCOM__6BCFC14F]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVADEP] ADD  DEFAULT (' ') FOR [DEPCOMCLI]
GO
/****** Object:  Default [DF__TBEVADEP__DEPCOM__6CC3E588]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVADEP] ADD  DEFAULT (' ') FOR [DEPCOMPRO]
GO
/****** Object:  Default [DF__TBEVADEP__DEPCOM__6DB809C1]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVADEP] ADD  DEFAULT (' ') FOR [DEPCOMotr]
GO
/****** Object:  Default [DF__TBEVADEP__DEPPTS__6EAC2DFA]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVADEP] ADD  DEFAULT ((0)) FOR [DEPPTSRFIN]
GO
/****** Object:  Default [DF__TBEVADEP__Jdd__6FA05233]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVADEP] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__TBEVADPR__dprcod__7094766C]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVADPR] ADD  DEFAULT ((0)) FOR [dprcodigo]
GO
/****** Object:  Default [DF__TBEVADPR__dprcod__71889AA5]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVADPR] ADD  DEFAULT (' ') FOR [dprcodfac]
GO
/****** Object:  Default [DF__TBEVADPR__dprcod__727CBEDE]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVADPR] ADD  DEFAULT (' ') FOR [dprcodsfa]
GO
/****** Object:  Default [DF__TBEVADPR__dprgru__7370E317]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVADPR] ADD  DEFAULT ((0)) FOR [dprgrupo]
GO
/****** Object:  Default [DF__TBEVADPR__dprsub__74650750]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVADPR] ADD  DEFAULT ((0)) FOR [dprsubcod]
GO
/****** Object:  Default [DF__TBEVADPR__dprcod__75592B89]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVADPR] ADD  DEFAULT ((0)) FOR [dprcodgrd]
GO
/****** Object:  Default [DF__TBEVADPR__dprcod__764D4FC2]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVADPR] ADD  DEFAULT (' ') FOR [dprcodfac2]
GO
/****** Object:  Default [DF__TBEVADPR__dprcod__774173FB]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVADPR] ADD  DEFAULT (' ') FOR [dprcodsfa2]
GO
/****** Object:  Default [DF__TBEVADPR__dpropc__78359834]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVADPR] ADD  DEFAULT ((0)) FOR [dpropcion]
GO
/****** Object:  Default [DF__TBEVADPR__Jdd__7929BC6D]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVADPR] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__TBEVAEMP__EMPCOD__7A1DE0A6]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAEMP] ADD  DEFAULT ((0)) FOR [EMPCODEVA]
GO
/****** Object:  Default [DF__TBEVAEMP__CODIGO__7B1204DF]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAEMP] ADD  DEFAULT (' ') FOR [CODIGO]
GO
/****** Object:  Default [DF__TBEVAEMP__EMPLEG__7C062918]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAEMP] ADD  DEFAULT (' ') FOR [EMPLEGAJOS]
GO
/****** Object:  Default [DF__TBEVAEMP__EMPLEG__7CFA4D51]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAEMP] ADD  DEFAULT (' ') FOR [EMPLEGAJOE]
GO
/****** Object:  Default [DF__TBEVAEMP__EMPCOD__7DEE718A]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAEMP] ADD  DEFAULT (' ') FOR [EMPCODPER]
GO
/****** Object:  Default [DF__TBEVAEMP__EMPCOD__7EE295C3]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAEMP] ADD  DEFAULT (' ') FOR [EMPCODFMT]
GO
/****** Object:  Default [DF__TBEVAEMP__EMPFEC__7FD6B9FC]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAEMP] ADD  DEFAULT (getdate()) FOR [EMPFECENV]
GO
/****** Object:  Default [DF__TBEVAEMP__EMPFEC__00CADE35]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAEMP] ADD  DEFAULT (getdate()) FOR [EMPFECREC]
GO
/****** Object:  Default [DF__TBEVAEMP__EMPEST__01BF026E]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAEMP] ADD  DEFAULT ((0)) FOR [EMPESTADO]
GO
/****** Object:  Default [DF__TBEVAEMP__EMPOBS__02B326A7]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAEMP] ADD  DEFAULT (' ') FOR [EMPOBSAPE]
GO
/****** Object:  Default [DF__TBEVAEMP__EMPNOR__03A74AE0]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAEMP] ADD  DEFAULT ((0)) FOR [EMPNORMAL]
GO
/****** Object:  Default [DF__TBEVAEMP__EMPFOR__049B6F19]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAEMP] ADD  DEFAULT ((0)) FOR [EMPFORZADA]
GO
/****** Object:  Default [DF__TBEVAEMP__EMPCOM__058F9352]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAEMP] ADD  DEFAULT (' ') FOR [EMPCOMLEG1]
GO
/****** Object:  Default [DF__TBEVAEMP__EMPCOM__0683B78B]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAEMP] ADD  DEFAULT (' ') FOR [EMPCOMLEG2]
GO
/****** Object:  Default [DF__TBEVAEMP__EMPEVA__0777DBC4]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAEMP] ADD  DEFAULT ((0)) FOR [EMPEVALUAC]
GO
/****** Object:  Default [DF__TBEVAEMP__EMPMET__086BFFFD]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAEMP] ADD  DEFAULT ((0)) FOR [EMPMETA]
GO
/****** Object:  Default [DF__TBEVAEMP__EMPPON__09602436]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAEMP] ADD  DEFAULT ((0)) FOR [EMPPONDERA]
GO
/****** Object:  Default [DF__TBEVAEMP__EMPRES__0A54486F]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAEMP] ADD  DEFAULT (' ') FOR [EMPRESA]
GO
/****** Object:  Default [DF__TBEVAEMP__CARGO__0B486CA8]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAEMP] ADD  DEFAULT ((0)) FOR [CARGO]
GO
/****** Object:  Default [DF__TBEVAEMP__OFICIN__0C3C90E1]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAEMP] ADD  DEFAULT ((0)) FOR [OFICINA]
GO
/****** Object:  Default [DF__TBEVAEMP__CENCOS__0D30B51A]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAEMP] ADD  DEFAULT ((0)) FOR [CENCOS]
GO
/****** Object:  Default [DF__TBEVAEMP__UNIDAD__0E24D953]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAEMP] ADD  DEFAULT ((0)) FOR [UNIDAD]
GO
/****** Object:  Default [DF__TBEVAEMP__EMPCOD__0F18FD8C]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAEMP] ADD  DEFAULT ((0)) FOR [EMPCODIREA]
GO
/****** Object:  Default [DF__TBEVAEMP__EMPCOD__100D21C5]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAEMP] ADD  DEFAULT ((0)) FOR [EMPCODIREE]
GO
/****** Object:  Default [DF__TBEVAEMP__EMPCOD__110145FE]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAEMP] ADD  DEFAULT ((0)) FOR [EMPCODIREC]
GO
/****** Object:  Default [DF__TBEVAEMP__EMPIRE__11F56A37]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAEMP] ADD  DEFAULT ((0)) FOR [EMPIREPAR]
GO
/****** Object:  Default [DF__TBEVAEMP__EMPIRE__12E98E70]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAEMP] ADD  DEFAULT ((0)) FOR [EMPIREEMP]
GO
/****** Object:  Default [DF__TBEVAEMP__EMPIRE__13DDB2A9]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAEMP] ADD  DEFAULT ((0)) FOR [EMPIRECLI]
GO
/****** Object:  Default [DF__TBEVAEMP__EMPIRE__14D1D6E2]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAEMP] ADD  DEFAULT ((0)) FOR [EMPIREPRO]
GO
/****** Object:  Default [DF__TBEVAEMP__EMPIRE__15C5FB1B]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAEMP] ADD  DEFAULT ((0)) FOR [EMPIREotr]
GO
/****** Object:  Default [DF__TBEVAEMP__EMPIRE__16BA1F54]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAEMP] ADD  DEFAULT ((0)) FOR [EMPIRESUP]
GO
/****** Object:  Default [DF__TBEVAEMP__EMPIRE__17AE438D]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAEMP] ADD  DEFAULT ((0)) FOR [EMPIRERES]
GO
/****** Object:  Default [DF__TBEVAEMP__EMPCER__18A267C6]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAEMP] ADD  DEFAULT ((0)) FOR [EMPCERRAR]
GO
/****** Object:  Default [DF__TBEVAEMP__EMP_WE__19968BFF]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAEMP] ADD  DEFAULT ((0)) FOR [EMP_WEB]
GO
/****** Object:  Default [DF__TBEVAEMP__EMPNOT__1A8AB038]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAEMP] ADD  DEFAULT ((0)) FOR [EMPNOTTSUP]
GO
/****** Object:  Default [DF__TBEVAEMP__EMPNOT__1B7ED471]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAEMP] ADD  DEFAULT ((0)) FOR [EMPNOTTAUT]
GO
/****** Object:  Default [DF__TBEVAEMP__EMPNOT__1C72F8AA]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAEMP] ADD  DEFAULT ((0)) FOR [EMPNOTTPAR]
GO
/****** Object:  Default [DF__TBEVAEMP__EMPNOT__1D671CE3]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAEMP] ADD  DEFAULT ((0)) FOR [EMPNOTTCOL]
GO
/****** Object:  Default [DF__TBEVAEMP__EMPNOT__1E5B411C]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAEMP] ADD  DEFAULT ((0)) FOR [EMPNOTTCLI]
GO
/****** Object:  Default [DF__TBEVAEMP__EMPNOT__1F4F6555]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAEMP] ADD  DEFAULT ((0)) FOR [EMPNOTTJSU]
GO
/****** Object:  Default [DF__TBEVAEMP__EMPNOT__2043898E]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAEMP] ADD  DEFAULT ((0)) FOR [EMPNOTTCLE]
GO
/****** Object:  Default [DF__TBEVAEMP__EMPNOT__2137ADC7]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAEMP] ADD  DEFAULT ((0)) FOR [EMPNOTTPRO]
GO
/****** Object:  Default [DF__TBEVAEMP__EMPNOT__222BD200]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAEMP] ADD  DEFAULT ((0)) FOR [EMPNOTTotr]
GO
/****** Object:  Default [DF__TBEVAEMP__EMPNOT__231FF639]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAEMP] ADD  DEFAULT ((0)) FOR [EMPNOTTFIN]
GO
/****** Object:  Default [DF__TBEVAEMP__EMPNOT__24141A72]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAEMP] ADD  DEFAULT ((0)) FOR [EMPNOTFSUP]
GO
/****** Object:  Default [DF__TBEVAEMP__EMPNOT__25083EAB]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAEMP] ADD  DEFAULT ((0)) FOR [EMPNOTFAUT]
GO
/****** Object:  Default [DF__TBEVAEMP__EMPNOT__25FC62E4]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAEMP] ADD  DEFAULT ((0)) FOR [EMPNOTFPAR]
GO
/****** Object:  Default [DF__TBEVAEMP__EMPNOT__26F0871D]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAEMP] ADD  DEFAULT ((0)) FOR [EMPNOTFCOL]
GO
/****** Object:  Default [DF__TBEVAEMP__EMPNOT__27E4AB56]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAEMP] ADD  DEFAULT ((0)) FOR [EMPNOTFCLI]
GO
/****** Object:  Default [DF__TBEVAEMP__EMPNOT__28D8CF8F]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAEMP] ADD  DEFAULT ((0)) FOR [EMPNOTFSJU]
GO
/****** Object:  Default [DF__TBEVAEMP__EMPNOT__29CCF3C8]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAEMP] ADD  DEFAULT ((0)) FOR [EMPNOTFOTR]
GO
/****** Object:  Default [DF__TBEVAEMP__EMPNOT__2AC11801]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAEMP] ADD  DEFAULT ((0)) FOR [EMPNOTFCLE]
GO
/****** Object:  Default [DF__TBEVAEMP__EMPNOT__2BB53C3A]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAEMP] ADD  DEFAULT ((0)) FOR [EMPNOTFPRO]
GO
/****** Object:  Default [DF__TBEVAEMP__EMPNOT__2CA96073]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAEMP] ADD  DEFAULT ((0)) FOR [EMPNOTFFIN]
GO
/****** Object:  Default [DF__TBEVAEMP__EMPNOT__2D9D84AC]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAEMP] ADD  DEFAULT ((0)) FOR [EMPNOTMSUP]
GO
/****** Object:  Default [DF__TBEVAEMP__EMPNOT__2E91A8E5]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAEMP] ADD  DEFAULT ((0)) FOR [EMPNOTCAUT]
GO
/****** Object:  Default [DF__TBEVAEMP__EMPNOT__2F85CD1E]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAEMP] ADD  DEFAULT ((0)) FOR [EMPNOTCPAR]
GO
/****** Object:  Default [DF__TBEVAEMP__EMPNOT__3079F157]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAEMP] ADD  DEFAULT ((0)) FOR [EMPNOTCSUP]
GO
/****** Object:  Default [DF__TBEVAEMP__EMPNOT__316E1590]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAEMP] ADD  DEFAULT ((0)) FOR [EMPNOTCCOL]
GO
/****** Object:  Default [DF__TBEVAEMP__EMPNOT__326239C9]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAEMP] ADD  DEFAULT ((0)) FOR [EMPNOTCCLI]
GO
/****** Object:  Default [DF__TBEVAEMP__EMPNOT__33565E02]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAEMP] ADD  DEFAULT ((0)) FOR [EMPNOTCJSU]
GO
/****** Object:  Default [DF__TBEVAEMP__EMPNOT__344A823B]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAEMP] ADD  DEFAULT ((0)) FOR [EMPNOTCOTR]
GO
/****** Object:  Default [DF__TBEVAEMP__EMPNOT__353EA674]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAEMP] ADD  DEFAULT ((0)) FOR [EMPNOTCCLE]
GO
/****** Object:  Default [DF__TBEVAEMP__EMPNOT__3632CAAD]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAEMP] ADD  DEFAULT ((0)) FOR [EMPNOTCPRO]
GO
/****** Object:  Default [DF__TBEVAEMP__EMPNOT__3726EEE6]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAEMP] ADD  DEFAULT ((0)) FOR [EMPNOTCFIN]
GO
/****** Object:  Default [DF__TBEVAEMP__EMPNOT__381B131F]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAEMP] ADD  DEFAULT ((0)) FOR [EMPNOTMAUT]
GO
/****** Object:  Default [DF__TBEVAEMP__EMPNOT__390F3758]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAEMP] ADD  DEFAULT ((0)) FOR [EMPNOTMPAR]
GO
/****** Object:  Default [DF__TBEVAEMP__EMPNOT__3A035B91]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAEMP] ADD  DEFAULT ((0)) FOR [EMPNOTMCOL]
GO
/****** Object:  Default [DF__TBEVAEMP__EMPNOT__3AF77FCA]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAEMP] ADD  DEFAULT ((0)) FOR [EMPNOTMCLI]
GO
/****** Object:  Default [DF__TBEVAEMP__EMPNOT__3BEBA403]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAEMP] ADD  DEFAULT ((0)) FOR [EMPNOTMJSU]
GO
/****** Object:  Default [DF__TBEVAEMP__EMPNOT__3CDFC83C]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAEMP] ADD  DEFAULT ((0)) FOR [EMPNOTMOTR]
GO
/****** Object:  Default [DF__TBEVAEMP__EMPNOT__3DD3EC75]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAEMP] ADD  DEFAULT ((0)) FOR [EMPNOTMCLE]
GO
/****** Object:  Default [DF__TBEVAEMP__EMPNOT__3EC810AE]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAEMP] ADD  DEFAULT ((0)) FOR [EMPNOTMPRO]
GO
/****** Object:  Default [DF__TBEVAEMP__EMPNOT__3FBC34E7]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAEMP] ADD  DEFAULT ((0)) FOR [EMPNOTMFIN]
GO
/****** Object:  Default [DF__TBEVAEMP__empfec__40B05920]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAEMP] ADD  DEFAULT (getdate()) FOR [empfeccer]
GO
/****** Object:  Default [DF__TBEVAEMP__EMPCOM__41A47D59]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAEMP] ADD  DEFAULT (' ') FOR [EMPCOMENT]
GO
/****** Object:  Default [DF__TBEVAEMP__Jdd__4298A192]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAEMP] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__TBEVAEVD__EVDCOD__438CC5CB]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAEVD] ADD  DEFAULT ((0)) FOR [EVDCODIGO]
GO
/****** Object:  Default [DF__TBEVAEVD__EVDFEC__4480EA04]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAEVD] ADD  DEFAULT (getdate()) FOR [EVDFECHA]
GO
/****** Object:  Default [DF__TBEVAEVD__EVDTIP__45750E3D]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAEVD] ADD  DEFAULT ((0)) FOR [EVDTIPO]
GO
/****** Object:  Default [DF__TBEVAEVD__EVDCAR__46693276]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAEVD] ADD  DEFAULT ((0)) FOR [EVDCARGO]
GO
/****** Object:  Default [DF__TBEVAEVD__EVDDES__475D56AF]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAEVD] ADD  DEFAULT (' ') FOR [EVDDESCAD]
GO
/****** Object:  Default [DF__TBEVAEVD__EVDEVA__48517AE8]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAEVD] ADD  DEFAULT ((0)) FOR [EVDEVAANT]
GO
/****** Object:  Default [DF__TBEVAEVD__EVDPFM__49459F21]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAEVD] ADD  DEFAULT ((0)) FOR [EVDPFMT]
GO
/****** Object:  Default [DF__TBEVAEVD__EVDPME__4A39C35A]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAEVD] ADD  DEFAULT ((0)) FOR [EVDPMETA]
GO
/****** Object:  Default [DF__TBEVAEVD__EVDPON__4B2DE793]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAEVD] ADD  DEFAULT ((0)) FOR [EVDPONSUP]
GO
/****** Object:  Default [DF__TBEVAEVD__EVDPON__4C220BCC]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAEVD] ADD  DEFAULT ((0)) FOR [EVDPONAUT]
GO
/****** Object:  Default [DF__TBEVAEVD__EVDPON__4D163005]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAEVD] ADD  DEFAULT ((0)) FOR [EVDPONPAR]
GO
/****** Object:  Default [DF__TBEVAEVD__EVDPON__4E0A543E]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAEVD] ADD  DEFAULT ((0)) FOR [EVDPONCOL]
GO
/****** Object:  Default [DF__TBEVAEVD__EVDPON__4EFE7877]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAEVD] ADD  DEFAULT ((0)) FOR [EVDPONCLI]
GO
/****** Object:  Default [DF__TBEVAEVD__EVDPON__4FF29CB0]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAEVD] ADD  DEFAULT ((0)) FOR [EVDPONJSU]
GO
/****** Object:  Default [DF__TBEVAEVD__EVDPON__50E6C0E9]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAEVD] ADD  DEFAULT ((0)) FOR [EVDPONOTR]
GO
/****** Object:  Default [DF__TBEVAEVD__EVDPON__51DAE522]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAEVD] ADD  DEFAULT ((0)) FOR [EVDPONCLE]
GO
/****** Object:  Default [DF__TBEVAEVD__EVDPON__52CF095B]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAEVD] ADD  DEFAULT ((0)) FOR [EVDPONPRO]
GO
/****** Object:  Default [DF__TBEVAEVD__EVDVER__53C32D94]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAEVD] ADD  DEFAULT ((0)) FOR [EVDVERAUT]
GO
/****** Object:  Default [DF__TBEVAEVD__EVDVER__54B751CD]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAEVD] ADD  DEFAULT ((0)) FOR [EVDVERjsu]
GO
/****** Object:  Default [DF__TBEVAEVD__EVDVER__55AB7606]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAEVD] ADD  DEFAULT ((0)) FOR [EVDVERotr]
GO
/****** Object:  Default [DF__TBEVAEVD__EVDVER__569F9A3F]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAEVD] ADD  DEFAULT ((0)) FOR [EVDVERPAR]
GO
/****** Object:  Default [DF__TBEVAEVD__EVDVER__5793BE78]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAEVD] ADD  DEFAULT ((0)) FOR [EVDVERSUP]
GO
/****** Object:  Default [DF__TBEVAEVD__EVDVER__5887E2B1]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAEVD] ADD  DEFAULT ((0)) FOR [EVDVERcol]
GO
/****** Object:  Default [DF__TBEVAEVD__EVDVER__597C06EA]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAEVD] ADD  DEFAULT ((0)) FOR [EVDVERCLI]
GO
/****** Object:  Default [DF__TBEVAEVD__EVDVER__5A702B23]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAEVD] ADD  DEFAULT ((0)) FOR [EVDVERPRO]
GO
/****** Object:  Default [DF__TBEVAEVD__EVDVER__5B644F5C]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAEVD] ADD  DEFAULT ((0)) FOR [EVDVERcle]
GO
/****** Object:  Default [DF__TBEVAEVD__EVDUSO__5C587395]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAEVD] ADD  DEFAULT ((0)) FOR [EVDUSOSUP]
GO
/****** Object:  Default [DF__TBEVAEVD__EVDUSO__5D4C97CE]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAEVD] ADD  DEFAULT ((0)) FOR [EVDUSOAUT]
GO
/****** Object:  Default [DF__TBEVAEVD__EVDUSO__5E40BC07]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAEVD] ADD  DEFAULT ((0)) FOR [EVDUSOPAR]
GO
/****** Object:  Default [DF__TBEVAEVD__EVDUSO__5F34E040]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAEVD] ADD  DEFAULT ((0)) FOR [EVDUSOCOL]
GO
/****** Object:  Default [DF__TBEVAEVD__EVDUSO__60290479]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAEVD] ADD  DEFAULT ((0)) FOR [EVDUSOCLI]
GO
/****** Object:  Default [DF__TBEVAEVD__EVDUSO__611D28B2]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAEVD] ADD  DEFAULT ((0)) FOR [EVDUSOJSU]
GO
/****** Object:  Default [DF__TBEVAEVD__EVDUSO__62114CEB]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAEVD] ADD  DEFAULT ((0)) FOR [EVDUSOOTR]
GO
/****** Object:  Default [DF__TBEVAEVD__EVDUSO__63057124]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAEVD] ADD  DEFAULT ((0)) FOR [EVDUSOCLE]
GO
/****** Object:  Default [DF__TBEVAEVD__EVDUSO__63F9955D]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAEVD] ADD  DEFAULT ((0)) FOR [EVDUSOPRO]
GO
/****** Object:  Default [DF__TBEVAEVD__evdfch__64EDB996]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAEVD] ADD  DEFAULT (getdate()) FOR [evdfchter]
GO
/****** Object:  Default [DF__TBEVAEVD__evdfch__65E1DDCF]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAEVD] ADD  DEFAULT (getdate()) FOR [evdfchlim]
GO
/****** Object:  Default [DF__TBEVAEVD__evdfch__66D60208]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAEVD] ADD  DEFAULT (getdate()) FOR [evdfchpin]
GO
/****** Object:  Default [DF__TBEVAEVD__evdfch__67CA2641]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAEVD] ADD  DEFAULT (getdate()) FOR [evdfchpfn]
GO
/****** Object:  Default [DF__TBEVAEVD__evdtit__68BE4A7A]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAEVD] ADD  DEFAULT (' ') FOR [evdtitulo]
GO
/****** Object:  Default [DF__TBEVAEVD__evdest__69B26EB3]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAEVD] ADD  DEFAULT ((0)) FOR [evdestado]
GO
/****** Object:  Default [DF__TBEVAEVD__EVDHAB__6AA692EC]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAEVD] ADD  DEFAULT ((0)) FOR [EVDHABCIC]
GO
/****** Object:  Default [DF__TBEVAEVD__EVDHAB__6B9AB725]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAEVD] ADD  DEFAULT ((0)) FOR [EVDHABMAIL]
GO
/****** Object:  Default [DF__TBEVAEVD__EVDHAB__6C8EDB5E]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAEVD] ADD  DEFAULT ((0)) FOR [EVDHABGAC]
GO
/****** Object:  Default [DF__TBEVAEVD__EVDOCU__6D82FF97]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAEVD] ADD  DEFAULT ((0)) FOR [EVDOCUCG]
GO
/****** Object:  Default [DF__TBEVAEVD__EVDHAM__6E7723D0]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAEVD] ADD  DEFAULT ((0)) FOR [EVDHAMEPA]
GO
/****** Object:  Default [DF__TBEVAEVD__EVDMOD__6F6B4809]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAEVD] ADD  DEFAULT ((0)) FOR [EVDMODOBS]
GO
/****** Object:  Default [DF__TBEVAEVD__EVDOCP__705F6C42]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAEVD] ADD  DEFAULT ((0)) FOR [EVDOCPONAC]
GO
/****** Object:  Default [DF__TBEVAEVD__EVDAAS__7153907B]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAEVD] ADD  DEFAULT ((0)) FOR [EVDAASS]
GO
/****** Object:  Default [DF__TBEVAEVD__EVDPME__7247B4B4]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAEVD] ADD  DEFAULT ((0)) FOR [EVDPMETCR]
GO
/****** Object:  Default [DF__TBEVAEVD__EVDPME__733BD8ED]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAEVD] ADD  DEFAULT ((0)) FOR [EVDPMETCO]
GO
/****** Object:  Default [DF__TBEVAEVD__EVDORA__742FFD26]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAEVD] ADD  DEFAULT ((0)) FOR [EVDORAP]
GO
/****** Object:  Default [DF__TBEVAEVD__EVDCFA__7524215F]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAEVD] ADD  DEFAULT ((0)) FOR [EVDCFAENT]
GO
/****** Object:  Default [DF__TBEVAEVD__EVDCAM__76184598]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAEVD] ADD  DEFAULT ((0)) FOR [EVDCAMEVA]
GO
/****** Object:  Default [DF__TBEVAEVD__EVDSUC__770C69D1]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAEVD] ADD  DEFAULT ((0)) FOR [EVDSUCESI]
GO
/****** Object:  Default [DF__TBEVAEVD__EVDREQ__78008E0A]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAEVD] ADD  DEFAULT ((0)) FOR [EVDREQAUT]
GO
/****** Object:  Default [DF__TBEVAEVD__EVDREQ__78F4B243]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAEVD] ADD  DEFAULT ((0)) FOR [EVDREQAU2]
GO
/****** Object:  Default [DF__TBEVAEVD__EVDREV__79E8D67C]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAEVD] ADD  DEFAULT ((0)) FOR [EVDREVIS1]
GO
/****** Object:  Default [DF__TBEVAEVD__EVDRE1__7ADCFAB5]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAEVD] ADD  DEFAULT (' ') FOR [EVDRE1OTR]
GO
/****** Object:  Default [DF__TBEVAEVD__EVDRE1__7BD11EEE]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAEVD] ADD  DEFAULT ((0)) FOR [EVDRE1TIP]
GO
/****** Object:  Default [DF__TBEVAEVD__EVDREV__7CC54327]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAEVD] ADD  DEFAULT ((0)) FOR [EVDREVIS2]
GO
/****** Object:  Default [DF__TBEVAEVD__EVDRE2__7DB96760]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAEVD] ADD  DEFAULT (' ') FOR [EVDRE2OTR]
GO
/****** Object:  Default [DF__TBEVAEVD__EVDRE2__7EAD8B99]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAEVD] ADD  DEFAULT ((0)) FOR [EVDRE2TIP]
GO
/****** Object:  Default [DF__TBEVAEVD__EVDRE2__7FA1AFD2]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAEVD] ADD  DEFAULT (' ') FOR [EVDRE2MAI]
GO
/****** Object:  Default [DF__TBEVAEVD__EVDRE1__0095D40B]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAEVD] ADD  DEFAULT (' ') FOR [EVDRE1MAI]
GO
/****** Object:  Default [DF__TBEVAEVD__EVDRER__0189F844]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAEVD] ADD  DEFAULT ((0)) FOR [EVDRERRHH]
GO
/****** Object:  Default [DF__TBEVAEVD__EVDINF__027E1C7D]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAEVD] ADD  DEFAULT ((0)) FOR [EVDINFEEN]
GO
/****** Object:  Default [DF__TBEVAEVD__EVDFEE__037240B6]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAEVD] ADD  DEFAULT ((0)) FOR [EVDFEENFU]
GO
/****** Object:  Default [DF__TBEVAEVD__EVDOCU__046664EF]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAEVD] ADD  DEFAULT ((0)) FOR [EVDOCUSUC]
GO
/****** Object:  Default [DF__TBEVAEVD__EVDOCU__055A8928]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAEVD] ADD  DEFAULT ((0)) FOR [EVDOCUFOR]
GO
/****** Object:  Default [DF__TBEVAEVD__Jdd__064EAD61]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAEVD] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__TBEVAEVP__EVPCOD__0742D19A]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAEVP] ADD  DEFAULT ((0)) FOR [EVPCODIGO]
GO
/****** Object:  Default [DF__TBEVAEVP__EVPLEG__0836F5D3]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAEVP] ADD  DEFAULT (' ') FOR [EVPLEGAJO]
GO
/****** Object:  Default [DF__TBEVAEVP__EVPCOD__092B1A0C]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAEVP] ADD  DEFAULT (' ') FOR [EVPCODFMT]
GO
/****** Object:  Default [DF__TBEVAEVP__EVPFEC__0A1F3E45]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAEVP] ADD  DEFAULT (getdate()) FOR [EVPFECHA]
GO
/****** Object:  Default [DF__TBEVAEVP__EVPOBS__0B13627E]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAEVP] ADD  DEFAULT (' ') FOR [EVPOBSERV]
GO
/****** Object:  Default [DF__TBEVAEVP__EVPHEC__0C0786B7]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAEVP] ADD  DEFAULT (' ') FOR [EVPHECSOB]
GO
/****** Object:  Default [DF__TBEVAEVP__EVPPLA__0CFBAAF0]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAEVP] ADD  DEFAULT (' ') FOR [EVPPLAFUT]
GO
/****** Object:  Default [DF__TBEVAEVP__EVPCOM__0DEFCF29]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAEVP] ADD  DEFAULT (' ') FOR [EVPCOMEVA]
GO
/****** Object:  Default [DF__TBEVAEVP__EVPCOM__0EE3F362]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAEVP] ADD  DEFAULT (' ') FOR [EVPCOMEVO]
GO
/****** Object:  Default [DF__TBEVAEVP__EVPEST__0FD8179B]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAEVP] ADD  DEFAULT ((0)) FOR [EVPESTADO]
GO
/****** Object:  Default [DF__TBEVAEVP__EVPTOT__10CC3BD4]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAEVP] ADD  DEFAULT ((0)) FOR [EVPTOTALA]
GO
/****** Object:  Default [DF__TBEVAEVP__EVPTOT__11C0600D]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAEVP] ADD  DEFAULT ((0)) FOR [EVPTOTALE]
GO
/****** Object:  Default [DF__TBEVAEVP__EVPTOT__12B48446]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAEVP] ADD  DEFAULT ((0)) FOR [EVPTOTALC]
GO
/****** Object:  Default [DF__TBEVAEVP__EVPTOT__13A8A87F]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAEVP] ADD  DEFAULT ((0)) FOR [EVPTOTALPA]
GO
/****** Object:  Default [DF__TBEVAEVP__EVPTOT__149CCCB8]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAEVP] ADD  DEFAULT ((0)) FOR [EVPTOTALSU]
GO
/****** Object:  Default [DF__TBEVAEVP__EVPTOT__1590F0F1]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAEVP] ADD  DEFAULT ((0)) FOR [EVPTOTALES]
GO
/****** Object:  Default [DF__TBEVAEVP__EVPTOT__1685152A]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAEVP] ADD  DEFAULT ((0)) FOR [EVPTOTALCL]
GO
/****** Object:  Default [DF__TBEVAEVP__EVPTOT__17793963]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAEVP] ADD  DEFAULT ((0)) FOR [EVPTOTALPR]
GO
/****** Object:  Default [DF__TBEVAEVP__EVPTOT__186D5D9C]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAEVP] ADD  DEFAULT ((0)) FOR [EVPTOTALFI]
GO
/****** Object:  Default [DF__TBEVAEVP__EVPTOT__196181D5]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAEVP] ADD  DEFAULT ((0)) FOR [EVPTOTALot]
GO
/****** Object:  Default [DF__TBEVAEVP__Jdd__1A55A60E]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAEVP] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__TBEVAFCD__FCDCOD__1B49CA47]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAFCD] ADD  DEFAULT (' ') FOR [FCDCODFAC]
GO
/****** Object:  Default [DF__TBEVAFCD__FCDPOS__1C3DEE80]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAFCD] ADD  DEFAULT ((0)) FOR [FCDPOSICIO]
GO
/****** Object:  Default [DF__TBEVAFCD__FCDTEX__1D3212B9]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAFCD] ADD  DEFAULT (' ') FOR [FCDTEXTO]
GO
/****** Object:  Default [DF__TBEVAFCD__Jdd__1E2636F2]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAFCD] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__TBEVAFCP__FCPFAC__1F1A5B2B]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAFCP] ADD  DEFAULT (' ') FOR [FCPFACCOD]
GO
/****** Object:  Default [DF__TBEVAFCP__FCPPON__200E7F64]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAFCP] ADD  DEFAULT ((0)) FOR [FCPPONDERA]
GO
/****** Object:  Default [DF__TBEVAFCP__FCPDES__2102A39D]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAFCP] ADD  DEFAULT (' ') FOR [FCPDESCRIP]
GO
/****** Object:  Default [DF__TBEVAFCP__Jdd__21F6C7D6]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAFCP] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__TBEVAFCT__FCTCOD__22EAEC0F]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAFCT] ADD  DEFAULT (' ') FOR [FCTCODIGO]
GO
/****** Object:  Default [DF__TBEVAFCT__FCTDES__23DF1048]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAFCT] ADD  DEFAULT (' ') FOR [FCTDESCRIP]
GO
/****** Object:  Default [DF__TBEVAFCT__FCTDES__24D33481]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAFCT] ADD  DEFAULT (' ') FOR [FCTDESADI]
GO
/****** Object:  Default [DF__TBEVAFCT__FCTTIP__25C758BA]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAFCT] ADD  DEFAULT ((0)) FOR [FCTTIPO]
GO
/****** Object:  Default [DF__TBEVAFCT__FCTPOR__26BB7CF3]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAFCT] ADD  DEFAULT ((0)) FOR [FCTPORCENT]
GO
/****** Object:  Default [DF__TBEVAFCT__FCTPJE__27AFA12C]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAFCT] ADD  DEFAULT ((0)) FOR [FCTPJEMIN]
GO
/****** Object:  Default [DF__TBEVAFCT__FCTCOM__28A3C565]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAFCT] ADD  DEFAULT ((0)) FOR [FCTCOMP]
GO
/****** Object:  Default [DF__TBEVAFCT__FCTMOD__2997E99E]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAFCT] ADD  DEFAULT ((0)) FOR [FCTMODO]
GO
/****** Object:  Default [DF__TBEVAFCT__FCTTIP__2A8C0DD7]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAFCT] ADD  DEFAULT ((0)) FOR [FCTTIPCAL]
GO
/****** Object:  Default [DF__TBEVAFCT__Jdd__2B803210]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAFCT] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__TBEVAFFA__FFAFMT__2C745649]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAFFA] ADD  DEFAULT (' ') FOR [FFAFMTCOD]
GO
/****** Object:  Default [DF__TBEVAFFA__FFAFAC__2D687A82]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAFFA] ADD  DEFAULT (' ') FOR [FFAFACCOD]
GO
/****** Object:  Default [DF__TBEVAFFA__FFAP1__2E5C9EBB]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAFFA] ADD  DEFAULT ((0)) FOR [FFAP1]
GO
/****** Object:  Default [DF__TBEVAFFA__FFAP2__2F50C2F4]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAFFA] ADD  DEFAULT ((0)) FOR [FFAP2]
GO
/****** Object:  Default [DF__TBEVAFFA__FFAP3__3044E72D]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAFFA] ADD  DEFAULT ((0)) FOR [FFAP3]
GO
/****** Object:  Default [DF__TBEVAFFA__FFAP4__31390B66]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAFFA] ADD  DEFAULT ((0)) FOR [FFAP4]
GO
/****** Object:  Default [DF__TBEVAFFA__FFAP5__322D2F9F]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAFFA] ADD  DEFAULT ((0)) FOR [FFAP5]
GO
/****** Object:  Default [DF__TBEVAFFA__FFAP6__332153D8]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAFFA] ADD  DEFAULT ((0)) FOR [FFAP6]
GO
/****** Object:  Default [DF__TBEVAFFA__FFAP7__34157811]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAFFA] ADD  DEFAULT ((0)) FOR [FFAP7]
GO
/****** Object:  Default [DF__TBEVAFFA__FFAP8__35099C4A]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAFFA] ADD  DEFAULT ((0)) FOR [FFAP8]
GO
/****** Object:  Default [DF__TBEVAFFA__FFAP9__35FDC083]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAFFA] ADD  DEFAULT ((0)) FOR [FFAP9]
GO
/****** Object:  Default [DF__TBEVAFFA__FFAP10__36F1E4BC]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAFFA] ADD  DEFAULT ((0)) FOR [FFAP10]
GO
/****** Object:  Default [DF__TBEVAFFA__FFAP11__37E608F5]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAFFA] ADD  DEFAULT ((0)) FOR [FFAP11]
GO
/****** Object:  Default [DF__TBEVAFFA__FFAP12__38DA2D2E]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAFFA] ADD  DEFAULT ((0)) FOR [FFAP12]
GO
/****** Object:  Default [DF__TBEVAFFA__FFAP13__39CE5167]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAFFA] ADD  DEFAULT ((0)) FOR [FFAP13]
GO
/****** Object:  Default [DF__TBEVAFFA__FFAP14__3AC275A0]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAFFA] ADD  DEFAULT ((0)) FOR [FFAP14]
GO
/****** Object:  Default [DF__TBEVAFFA__FFAP15__3BB699D9]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAFFA] ADD  DEFAULT ((0)) FOR [FFAP15]
GO
/****** Object:  Default [DF__TBEVAFFA__FFapor__3CAABE12]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAFFA] ADD  DEFAULT ((0)) FOR [FFaporcent]
GO
/****** Object:  Default [DF__TBEVAFFA__ffapje__3D9EE24B]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAFFA] ADD  DEFAULT ((0)) FOR [ffapjemin]
GO
/****** Object:  Default [DF__TBEVAFFA__Jdd__3E930684]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAFFA] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__TBEVAFGR__FGRFAC__3F872ABD]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAFGR] ADD  DEFAULT (' ') FOR [FGRFACTOR]
GO
/****** Object:  Default [DF__TBEVAFGR__FGRSUB__407B4EF6]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAFGR] ADD  DEFAULT (' ') FOR [FGRSUBFAC]
GO
/****** Object:  Default [DF__TBEVAFGR__FGRNUM__416F732F]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAFGR] ADD  DEFAULT ((0)) FOR [FGRNUMERO]
GO
/****** Object:  Default [DF__TBEVAFGR__FGRDES__42639768]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAFGR] ADD  DEFAULT (' ') FOR [FGRDESADI]
GO
/****** Object:  Default [DF__TBEVAFGR__fgrcod__4357BBA1]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAFGR] ADD  DEFAULT ((0)) FOR [fgrcodigo]
GO
/****** Object:  Default [DF__TBEVAFGR__fgrcod__444BDFDA]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAFGR] ADD  DEFAULT (' ') FOR [fgrcodfac]
GO
/****** Object:  Default [DF__TBEVAFGR__fgruso__45400413]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAFGR] ADD  DEFAULT ((0)) FOR [fgruso]
GO
/****** Object:  Default [DF__TBEVAFGR__Jdd__4634284C]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAFGR] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__TBEVAFMD__FMDCOD__47284C85]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAFMD] ADD  DEFAULT (' ') FOR [FMDCODIGO]
GO
/****** Object:  Default [DF__TBEVAFMD__ID__481C70BE]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAFMD] ADD  DEFAULT ((0)) FOR [ID]
GO
/****** Object:  Default [DF__TBEVAFMD__DESCRI__491094F7]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAFMD] ADD  DEFAULT (' ') FOR [DESCRIP]
GO
/****** Object:  Default [DF__TBEVAFMD__Jdd__4A04B930]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAFMD] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__TBEVAFMT__FMTCOD__4AF8DD69]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAFMT] ADD  DEFAULT (' ') FOR [FMTCODIGO]
GO
/****** Object:  Default [DF__TBEVAFMT__FMTDES__4BED01A2]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAFMT] ADD  DEFAULT (' ') FOR [FMTDESCRIP]
GO
/****** Object:  Default [DF__TBEVAFMT__FMTAPL__4CE125DB]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAFMT] ADD  DEFAULT ((0)) FOR [FMTAPLICA]
GO
/****** Object:  Default [DF__TBEVAFMT__FMTTIP__4DD54A14]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAFMT] ADD  DEFAULT ((0)) FOR [FMTTIPO]
GO
/****** Object:  Default [DF__TBEVAFMT__FMTFEC__4EC96E4D]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAFMT] ADD  DEFAULT (getdate()) FOR [FMTFECHA]
GO
/****** Object:  Default [DF__TBEVAFMT__FMTCON__4FBD9286]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAFMT] ADD  DEFAULT ((0)) FOR [FMTCONVENI]
GO
/****** Object:  Default [DF__TBEVAFMT__FMTNOT__50B1B6BF]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAFMT] ADD  DEFAULT ((0)) FOR [FMTNOTA]
GO
/****** Object:  Default [DF__TBEVAFMT__FMTNIV__51A5DAF8]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAFMT] ADD  DEFAULT ((0)) FOR [FMTNIVEL]
GO
/****** Object:  Default [DF__TBEVAFMT__FMTOBS__5299FF31]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAFMT] ADD  DEFAULT (' ') FOR [FMTOBSAPLI]
GO
/****** Object:  Default [DF__TBEVAFMT__FMTTIP__538E236A]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAFMT] ADD  DEFAULT ((0)) FOR [FMTTIPFAC]
GO
/****** Object:  Default [DF__TBEVAFMT__FMTFAC__548247A3]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAFMT] ADD  DEFAULT ((0)) FOR [FMTFACPOND]
GO
/****** Object:  Default [DF__TBEVAFMT__FMTSFC__55766BDC]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAFMT] ADD  DEFAULT ((0)) FOR [FMTSFCPOND]
GO
/****** Object:  Default [DF__TBEVAFMT__FMTEST__566A9015]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAFMT] ADD  DEFAULT ((0)) FOR [FMTESTADO]
GO
/****** Object:  Default [DF__TBEVAFMT__Jdd__575EB44E]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAFMT] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__TBEVAFPO__FPOFMT__5852D887]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAFPO] ADD  DEFAULT (' ') FOR [FPOFMTCOD]
GO
/****** Object:  Default [DF__TBEVAFPO__FPOPON__5946FCC0]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAFPO] ADD  DEFAULT ((0)) FOR [FPOPONDERA]
GO
/****** Object:  Default [DF__TBEVAFPO__FPODES__5A3B20F9]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAFPO] ADD  DEFAULT (' ') FOR [FPODESCRIP]
GO
/****** Object:  Default [DF__TBEVAFPO__Jdd__5B2F4532]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAFPO] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__TBEVAINC__INCCOD__5C23696B]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAINC] ADD  DEFAULT ((0)) FOR [INCCODIGO]
GO
/****** Object:  Default [DF__TBEVAINC__INCTIP__5D178DA4]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAINC] ADD  DEFAULT ((0)) FOR [INCTIPO]
GO
/****** Object:  Default [DF__TBEVAINC__INCCAN__5E0BB1DD]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAINC] ADD  DEFAULT ((0)) FOR [INCCANTID]
GO
/****** Object:  Default [DF__TBEVAINC__INCFEC__5EFFD616]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAINC] ADD  DEFAULT (getdate()) FOR [INCFECHA]
GO
/****** Object:  Default [DF__TBEVAINC__INCDES__5FF3FA4F]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAINC] ADD  DEFAULT (' ') FOR [INCDESCRIP]
GO
/****** Object:  Default [DF__TBEVAINC__INCFEC__60E81E88]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAINC] ADD  DEFAULT (getdate()) FOR [INCFECVEN]
GO
/****** Object:  Default [DF__TBEVAINC__INCVAL__61DC42C1]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAINC] ADD  DEFAULT ((0)) FOR [INCVALITEM]
GO
/****** Object:  Default [DF__TBEVAINC__INCITE__62D066FA]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAINC] ADD  DEFAULT (' ') FOR [INCITEM]
GO
/****** Object:  Default [DF__TBEVAINC__Jdd__63C48B33]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAINC] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__TBEVAINP__INPCOD__64B8AF6C]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAINP] ADD  DEFAULT ((0)) FOR [INPCODINC]
GO
/****** Object:  Default [DF__TBEVAINP__INPLEG__65ACD3A5]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAINP] ADD  DEFAULT (' ') FOR [INPLEGAJO]
GO
/****** Object:  Default [DF__TBEVAINP__INPCOD__66A0F7DE]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAINP] ADD  DEFAULT ((0)) FOR [INPCODEVA]
GO
/****** Object:  Default [DF__TBEVAINP__INPFEC__67951C17]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAINP] ADD  DEFAULT (getdate()) FOR [INPFECHA]
GO
/****** Object:  Default [DF__TBEVAINP__INPPUN__68894050]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAINP] ADD  DEFAULT ((0)) FOR [INPPUNTOS]
GO
/****** Object:  Default [DF__TBEVAINP__INPEST__697D6489]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAINP] ADD  DEFAULT ((0)) FOR [INPESTADO]
GO
/****** Object:  Default [DF__TBEVAINP__INPFEC__6A7188C2]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAINP] ADD  DEFAULT (getdate()) FOR [INPFECASIG]
GO
/****** Object:  Default [DF__TBEVAINP__INPCAN__6B65ACFB]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAINP] ADD  DEFAULT ((0)) FOR [INPCANTI]
GO
/****** Object:  Default [DF__TBEVAINP__Jdd__6C59D134]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAINP] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__TBEVAIRE__irecod__6D4DF56D]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAIRE] ADD  DEFAULT ((0)) FOR [irecodigo]
GO
/****** Object:  Default [DF__TBEVAIRE__ireevd__6E4219A6]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAIRE] ADD  DEFAULT ((0)) FOR [ireevdcod]
GO
/****** Object:  Default [DF__TBEVAIRE__iretip__6F363DDF]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAIRE] ADD  DEFAULT ((0)) FOR [iretipo]
GO
/****** Object:  Default [DF__TBEVAIRE__ireran__702A6218]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAIRE] ADD  DEFAULT ((0)) FOR [irerangode]
GO
/****** Object:  Default [DF__TBEVAIRE__ireran__711E8651]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAIRE] ADD  DEFAULT ((0)) FOR [irerangoha]
GO
/****** Object:  Default [DF__TBEVAIRE__iredes__7212AA8A]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAIRE] ADD  DEFAULT (' ') FOR [iredescrip]
GO
/****** Object:  Default [DF__TBEVAIRE__iredia__7306CEC3]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAIRE] ADD  DEFAULT (' ') FOR [irediagnos]
GO
/****** Object:  Default [DF__TBEVAIRE__ireacc__73FAF2FC]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAIRE] ADD  DEFAULT (' ') FOR [ireaccrec]
GO
/****** Object:  Default [DF__TBEVAIRE__irecol__74EF1735]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAIRE] ADD  DEFAULT ((0)) FOR [irecolor]
GO
/****** Object:  Default [DF__TBEVAIRE__Jdd__75E33B6E]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAIRE] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__TBEVAMCG__MCGCOD__76D75FA7]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAMCG] ADD  DEFAULT ((0)) FOR [MCGCODEVD]
GO
/****** Object:  Default [DF__TBEVAMCG__MCGLEG__77CB83E0]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAMCG] ADD  DEFAULT (' ') FOR [MCGLEGAJO]
GO
/****** Object:  Default [DF__TBEVAMCG__MCGCOD__78BFA819]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAMCG] ADD  DEFAULT ((0)) FOR [MCGCODIGO]
GO
/****** Object:  Default [DF__TBEVAMCG__MCGCLA__79B3CC52]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAMCG] ADD  DEFAULT ((0)) FOR [MCGCLASE]
GO
/****** Object:  Default [DF__TBEVAMCG__MCGCON__7AA7F08B]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAMCG] ADD  DEFAULT ((0)) FOR [MCGCONSEC]
GO
/****** Object:  Default [DF__TBEVAMCG__MCGLEG__7B9C14C4]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAMCG] ADD  DEFAULT (' ') FOR [MCGLEGORI]
GO
/****** Object:  Default [DF__TBEVAMCG__MCGCOD__7C9038FD]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAMCG] ADD  DEFAULT ((0)) FOR [MCGCODORI]
GO
/****** Object:  Default [DF__TBEVAMCG__MCGMET__7D845D36]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAMCG] ADD  DEFAULT (' ') FOR [MCGMETAPER]
GO
/****** Object:  Default [DF__TBEVAMCG__MCGSAT__7E78816F]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAMCG] ADD  DEFAULT (' ') FOR [MCGSATPER]
GO
/****** Object:  Default [DF__TBEVAMCG__MCGNOT__7F6CA5A8]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAMCG] ADD  DEFAULT ((0)) FOR [MCGNOTSUP]
GO
/****** Object:  Default [DF__TBEVAMCG__MCGNOT__0060C9E1]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAMCG] ADD  DEFAULT ((0)) FOR [MCGNOTAUT]
GO
/****** Object:  Default [DF__TBEVAMCG__MCGNOT__0154EE1A]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAMCG] ADD  DEFAULT ((0)) FOR [MCGNOTPAR]
GO
/****** Object:  Default [DF__TBEVAMCG__MCGNOT__02491253]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAMCG] ADD  DEFAULT ((0)) FOR [MCGNOTCOL]
GO
/****** Object:  Default [DF__TBEVAMCG__MCGNOT__033D368C]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAMCG] ADD  DEFAULT ((0)) FOR [MCGNOTCLI]
GO
/****** Object:  Default [DF__TBEVAMCG__MCGNOT__04315AC5]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAMCG] ADD  DEFAULT ((0)) FOR [MCGNOTJSU]
GO
/****** Object:  Default [DF__TBEVAMCG__MCGNOT__05257EFE]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAMCG] ADD  DEFAULT ((0)) FOR [MCGNOTOTR]
GO
/****** Object:  Default [DF__TBEVAMCG__MCGNOT__0619A337]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAMCG] ADD  DEFAULT ((0)) FOR [MCGNOTCLE]
GO
/****** Object:  Default [DF__TBEVAMCG__MCGNOT__070DC770]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAMCG] ADD  DEFAULT ((0)) FOR [MCGNOTPRO]
GO
/****** Object:  Default [DF__TBEVAMCG__MCGNOT__0801EBA9]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAMCG] ADD  DEFAULT ((0)) FOR [MCGNOTFIN]
GO
/****** Object:  Default [DF__TBEVAMCG__MCGTIP__08F60FE2]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAMCG] ADD  DEFAULT ((0)) FOR [MCGTIPO]
GO
/****** Object:  Default [DF__TBEVAMCG__MCGOBS__09EA341B]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAMCG] ADD  DEFAULT (' ') FOR [MCGOBSSUP]
GO
/****** Object:  Default [DF__TBEVAMCG__MCGOBS__0ADE5854]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAMCG] ADD  DEFAULT (' ') FOR [MCGOBSAUT]
GO
/****** Object:  Default [DF__TBEVAMCG__MCGOBS__0BD27C8D]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAMCG] ADD  DEFAULT (' ') FOR [MCGOBSPAR]
GO
/****** Object:  Default [DF__TBEVAMCG__MCGOBS__0CC6A0C6]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAMCG] ADD  DEFAULT (' ') FOR [MCGOBSCOL]
GO
/****** Object:  Default [DF__TBEVAMCG__MCGOBS__0DBAC4FF]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAMCG] ADD  DEFAULT (' ') FOR [MCGOBSCLI]
GO
/****** Object:  Default [DF__TBEVAMCG__MCGOBS__0EAEE938]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAMCG] ADD  DEFAULT (' ') FOR [MCGOBSJSU]
GO
/****** Object:  Default [DF__TBEVAMCG__MCGOBS__0FA30D71]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAMCG] ADD  DEFAULT (' ') FOR [MCGOBSOTR]
GO
/****** Object:  Default [DF__TBEVAMCG__MCGOBS__109731AA]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAMCG] ADD  DEFAULT (' ') FOR [MCGOBSPRO]
GO
/****** Object:  Default [DF__TBEVAMCG__MCGOBS__118B55E3]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAMCG] ADD  DEFAULT (' ') FOR [MCGOBSCLE]
GO
/****** Object:  Default [DF__TBEVAMCG__MCGOBJ__127F7A1C]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAMCG] ADD  DEFAULT ((0)) FOR [MCGOBJETI]
GO
/****** Object:  Default [DF__TBEVAMCG__MCGOTR__13739E55]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAMCG] ADD  DEFAULT (' ') FOR [MCGOTROOBJ]
GO
/****** Object:  Default [DF__TBEVAMCG__MCGTEM__1467C28E]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAMCG] ADD  DEFAULT (' ') FOR [MCGTEMA]
GO
/****** Object:  Default [DF__TBEVAMCG__MCGPON__155BE6C7]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAMCG] ADD  DEFAULT ((0)) FOR [MCGPOND]
GO
/****** Object:  Default [DF__TBEVAMCG__MCGNOT__16500B00]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAMCG] ADD  DEFAULT ((0)) FOR [MCGNOTAPON]
GO
/****** Object:  Default [DF__TBEVAMCG__MCGAFE__17442F39]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAMCG] ADD  DEFAULT (getdate()) FOR [MCGAFECHA]
GO
/****** Object:  Default [DF__TBEVAMCG__MCGFEC__18385372]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAMCG] ADD  DEFAULT (getdate()) FOR [MCGFECUM]
GO
/****** Object:  Default [DF__TBEVAMCG__Jdd__192C77AB]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAMCG] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__TBEVAMET__METCOD__1A209BE4]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAMET] ADD  DEFAULT ((0)) FOR [METCODEVD]
GO
/****** Object:  Default [DF__TBEVAMET__METLEG__1B14C01D]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAMET] ADD  DEFAULT (' ') FOR [METLEGAJO]
GO
/****** Object:  Default [DF__TBEVAMET__METCOD__1C08E456]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAMET] ADD  DEFAULT ((0)) FOR [METCODIGO]
GO
/****** Object:  Default [DF__TBEVAMET__METMET__1CFD088F]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAMET] ADD  DEFAULT (' ') FOR [METMETAPER]
GO
/****** Object:  Default [DF__TBEVAMET__METSAT__1DF12CC8]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAMET] ADD  DEFAULT (' ') FOR [METSATPER]
GO
/****** Object:  Default [DF__TBEVAMET__METNOT__1EE55101]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAMET] ADD  DEFAULT ((0)) FOR [METNOTSUP]
GO
/****** Object:  Default [DF__TBEVAMET__METNOT__1FD9753A]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAMET] ADD  DEFAULT ((0)) FOR [METNOTAUT]
GO
/****** Object:  Default [DF__TBEVAMET__METNOT__20CD9973]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAMET] ADD  DEFAULT ((0)) FOR [METNOTPAR]
GO
/****** Object:  Default [DF__TBEVAMET__METNOT__21C1BDAC]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAMET] ADD  DEFAULT ((0)) FOR [METNOTCOL]
GO
/****** Object:  Default [DF__TBEVAMET__METNOT__22B5E1E5]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAMET] ADD  DEFAULT ((0)) FOR [METNOTCLI]
GO
/****** Object:  Default [DF__TBEVAMET__METNOT__23AA061E]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAMET] ADD  DEFAULT ((0)) FOR [METNOTJSU]
GO
/****** Object:  Default [DF__TBEVAMET__METNOT__249E2A57]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAMET] ADD  DEFAULT ((0)) FOR [METNOTOTR]
GO
/****** Object:  Default [DF__TBEVAMET__METNOT__25924E90]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAMET] ADD  DEFAULT ((0)) FOR [METNOTCLE]
GO
/****** Object:  Default [DF__TBEVAMET__METNOT__268672C9]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAMET] ADD  DEFAULT ((0)) FOR [METNOTPRO]
GO
/****** Object:  Default [DF__TBEVAMET__METMCG__277A9702]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAMET] ADD  DEFAULT ((0)) FOR [METMCGORI]
GO
/****** Object:  Default [DF__TBEVAMET__METMCG__286EBB3B]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAMET] ADD  DEFAULT (' ') FOR [METMCGLEG]
GO
/****** Object:  Default [DF__TBEVAMET__METNOT__2962DF74]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAMET] ADD  DEFAULT ((0)) FOR [METNOTFIN]
GO
/****** Object:  Default [DF__TBEVAMET__METTIP__2A5703AD]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAMET] ADD  DEFAULT ((0)) FOR [METTIPO]
GO
/****** Object:  Default [DF__TBEVAMET__METOBS__2B4B27E6]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAMET] ADD  DEFAULT (' ') FOR [METOBSSUP]
GO
/****** Object:  Default [DF__TBEVAMET__METOBS__2C3F4C1F]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAMET] ADD  DEFAULT (' ') FOR [METOBSAUT]
GO
/****** Object:  Default [DF__TBEVAMET__METOBS__2D337058]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAMET] ADD  DEFAULT (' ') FOR [METOBSPAR]
GO
/****** Object:  Default [DF__TBEVAMET__METOBS__2E279491]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAMET] ADD  DEFAULT (' ') FOR [METOBSCOL]
GO
/****** Object:  Default [DF__TBEVAMET__METOBS__2F1BB8CA]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAMET] ADD  DEFAULT (' ') FOR [METOBSCLI]
GO
/****** Object:  Default [DF__TBEVAMET__METOBS__300FDD03]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAMET] ADD  DEFAULT (' ') FOR [METOBSJSU]
GO
/****** Object:  Default [DF__TBEVAMET__METOBS__3104013C]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAMET] ADD  DEFAULT (' ') FOR [METOBSOTR]
GO
/****** Object:  Default [DF__TBEVAMET__METOBS__31F82575]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAMET] ADD  DEFAULT (' ') FOR [METOBSPRO]
GO
/****** Object:  Default [DF__TBEVAMET__METOBS__32EC49AE]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAMET] ADD  DEFAULT (' ') FOR [METOBSCLE]
GO
/****** Object:  Default [DF__TBEVAMET__METOBJ__33E06DE7]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAMET] ADD  DEFAULT ((0)) FOR [METOBJETI]
GO
/****** Object:  Default [DF__TBEVAMET__METOTR__34D49220]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAMET] ADD  DEFAULT (' ') FOR [METOTROOBJ]
GO
/****** Object:  Default [DF__TBEVAMET__METTEM__35C8B659]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAMET] ADD  DEFAULT (' ') FOR [METTEMA]
GO
/****** Object:  Default [DF__TBEVAMET__METPON__36BCDA92]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAMET] ADD  DEFAULT ((0)) FOR [METPOND]
GO
/****** Object:  Default [DF__TBEVAMET__METNOT__37B0FECB]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAMET] ADD  DEFAULT ((0)) FOR [METNOTAPON]
GO
/****** Object:  Default [DF__TBEVAMET__METAFE__38A52304]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAMET] ADD  DEFAULT (getdate()) FOR [METAFECHA]
GO
/****** Object:  Default [DF__TBEVAMET__METFEC__3999473D]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAMET] ADD  DEFAULT (getdate()) FOR [METFECUM]
GO
/****** Object:  Default [DF__TBEVAMET__Jdd__3A8D6B76]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAMET] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__TBEVAMGR__MGRCOD__3B818FAF]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAMGR] ADD  DEFAULT ((0)) FOR [MGRCODEVD]
GO
/****** Object:  Default [DF__TBEVAMGR__MGRLEG__3C75B3E8]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAMGR] ADD  DEFAULT (' ') FOR [MGRLEGAJO]
GO
/****** Object:  Default [DF__TBEVAMGR__MGRCOD__3D69D821]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAMGR] ADD  DEFAULT ((0)) FOR [MGRCODMET]
GO
/****** Object:  Default [DF__TBEVAMGR__MGRCOD__3E5DFC5A]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAMGR] ADD  DEFAULT ((0)) FOR [MGRCODIGO]
GO
/****** Object:  Default [DF__TBEVAMGR__Jdd__3F522093]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAMGR] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__TBEVAMTA__mtatip__404644CC]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAMTA] ADD  DEFAULT (' ') FOR [mtatipcod]
GO
/****** Object:  Default [DF__TBEVAMTA__mtacod__413A6905]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAMTA] ADD  DEFAULT (' ') FOR [mtacodigo]
GO
/****** Object:  Default [DF__TBEVAMTA__mtapor__422E8D3E]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAMTA] ADD  DEFAULT ((0)) FOR [mtaporc]
GO
/****** Object:  Default [DF__TBEVAMTA__mtades__4322B177]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAMTA] ADD  DEFAULT (' ') FOR [mtadescrip]
GO
/****** Object:  Default [DF__TBEVAMTA__mtacon__4416D5B0]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAMTA] ADD  DEFAULT (' ') FOR [mtaconsat]
GO
/****** Object:  Default [DF__TBEVAMTA__mtafcu__450AF9E9]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAMTA] ADD  DEFAULT (getdate()) FOR [mtafcumpli]
GO
/****** Object:  Default [DF__TBEVAMTA__Jdd__45FF1E22]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAMTA] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__TBEVANOT__NOTLEG__46F3425B]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVANOT] ADD  DEFAULT (' ') FOR [NOTLEGAJO]
GO
/****** Object:  Default [DF__TBEVANOT__NOTFEC__47E76694]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVANOT] ADD  DEFAULT (getdate()) FOR [NOTFECHA]
GO
/****** Object:  Default [DF__TBEVANOT__NOTNOT__48DB8ACD]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVANOT] ADD  DEFAULT (' ') FOR [NOTNOTAPOS]
GO
/****** Object:  Default [DF__TBEVANOT__NOTNOT__49CFAF06]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVANOT] ADD  DEFAULT (' ') FOR [NOTNOTANEG]
GO
/****** Object:  Default [DF__TBEVANOT__Jdd__4AC3D33F]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVANOT] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__TBEVAOBJ__objcod__4BB7F778]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAOBJ] ADD  DEFAULT (' ') FOR [objcodmta]
GO
/****** Object:  Default [DF__TBEVAOBJ__objcod__4CAC1BB1]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAOBJ] ADD  DEFAULT ((0)) FOR [objcodobj]
GO
/****** Object:  Default [DF__TBEVAOBJ__objcod__4DA03FEA]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAOBJ] ADD  DEFAULT (' ') FOR [objcodper]
GO
/****** Object:  Default [DF__TBEVAOBJ__objpor__4E946423]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAOBJ] ADD  DEFAULT ((0)) FOR [objporce]
GO
/****** Object:  Default [DF__TBEVAOBJ__objest__4F88885C]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAOBJ] ADD  DEFAULT ((0)) FOR [objestado]
GO
/****** Object:  Default [DF__TBEVAOBJ__Jdd__507CAC95]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAOBJ] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__TBEVAPSF__PSFFMT__5170D0CE]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAPSF] ADD  DEFAULT (' ') FOR [PSFFMT]
GO
/****** Object:  Default [DF__TBEVAPSF__PSFFAC__5264F507]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAPSF] ADD  DEFAULT (' ') FOR [PSFFACTOR]
GO
/****** Object:  Default [DF__TBEVAPSF__PSFSUB__53591940]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAPSF] ADD  DEFAULT (' ') FOR [PSFSUBFAC]
GO
/****** Object:  Default [DF__TBEVAPSF__SFAP1__544D3D79]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAPSF] ADD  DEFAULT ((0)) FOR [SFAP1]
GO
/****** Object:  Default [DF__TBEVAPSF__SFAP2__554161B2]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAPSF] ADD  DEFAULT ((0)) FOR [SFAP2]
GO
/****** Object:  Default [DF__TBEVAPSF__SFAP3__563585EB]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAPSF] ADD  DEFAULT ((0)) FOR [SFAP3]
GO
/****** Object:  Default [DF__TBEVAPSF__SFAP4__5729AA24]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAPSF] ADD  DEFAULT ((0)) FOR [SFAP4]
GO
/****** Object:  Default [DF__TBEVAPSF__SFAP5__581DCE5D]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAPSF] ADD  DEFAULT ((0)) FOR [SFAP5]
GO
/****** Object:  Default [DF__TBEVAPSF__SFAP6__5911F296]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAPSF] ADD  DEFAULT ((0)) FOR [SFAP6]
GO
/****** Object:  Default [DF__TBEVAPSF__SFAP7__5A0616CF]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAPSF] ADD  DEFAULT ((0)) FOR [SFAP7]
GO
/****** Object:  Default [DF__TBEVAPSF__SFAP8__5AFA3B08]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAPSF] ADD  DEFAULT ((0)) FOR [SFAP8]
GO
/****** Object:  Default [DF__TBEVAPSF__SFAP9__5BEE5F41]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAPSF] ADD  DEFAULT ((0)) FOR [SFAP9]
GO
/****** Object:  Default [DF__TBEVAPSF__SFAP10__5CE2837A]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAPSF] ADD  DEFAULT ((0)) FOR [SFAP10]
GO
/****** Object:  Default [DF__TBEVAPSF__SFAP11__5DD6A7B3]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAPSF] ADD  DEFAULT ((0)) FOR [SFAP11]
GO
/****** Object:  Default [DF__TBEVAPSF__SFAP12__5ECACBEC]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAPSF] ADD  DEFAULT ((0)) FOR [SFAP12]
GO
/****** Object:  Default [DF__TBEVAPSF__SFAP13__5FBEF025]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAPSF] ADD  DEFAULT ((0)) FOR [SFAP13]
GO
/****** Object:  Default [DF__TBEVAPSF__SFAP14__60B3145E]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAPSF] ADD  DEFAULT ((0)) FOR [SFAP14]
GO
/****** Object:  Default [DF__TBEVAPSF__SFAP15__61A73897]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAPSF] ADD  DEFAULT ((0)) FOR [SFAP15]
GO
/****** Object:  Default [DF__TBEVAPSF__Jdd__629B5CD0]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAPSF] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__TBEVARDF__rdfnum__638F8109]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVARDF] ADD  DEFAULT ((0)) FOR [rdfnumero]
GO
/****** Object:  Default [DF__TBEVARDF__rdfleg__6483A542]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVARDF] ADD  DEFAULT (' ') FOR [rdflegajo]
GO
/****** Object:  Default [DF__TBEVARDF__rdfeva__6577C97B]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVARDF] ADD  DEFAULT ((0)) FOR [rdfevaluac]
GO
/****** Object:  Default [DF__TBEVARDF__rdfleg__666BEDB4]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVARDF] ADD  DEFAULT (' ') FOR [rdflegvot]
GO
/****** Object:  Default [DF__TBEVARDF__rdfgru__676011ED]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVARDF] ADD  DEFAULT ((0)) FOR [rdfgrupo]
GO
/****** Object:  Default [DF__TBEVARDF__rdfreg__68543626]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVARDF] ADD  DEFAULT (' ') FOR [rdfregist]
GO
/****** Object:  Default [DF__TBEVARDF__rdfcom__69485A5F]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVARDF] ADD  DEFAULT (' ') FOR [rdfcoment]
GO
/****** Object:  Default [DF__TBEVARDF__rdffec__6A3C7E98]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVARDF] ADD  DEFAULT (getdate()) FOR [rdffecha]
GO
/****** Object:  Default [DF__TBEVARDF__rdfest__6B30A2D1]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVARDF] ADD  DEFAULT ((0)) FOR [rdfestado]
GO
/****** Object:  Default [DF__TBEVARDF__rdfusu__6C24C70A]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVARDF] ADD  DEFAULT (' ') FOR [rdfusuario]
GO
/****** Object:  Default [DF__TBEVARDF__Jdd__6D18EB43]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVARDF] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__TBEVASFA__SFAFAC__6E0D0F7C]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVASFA] ADD  DEFAULT (' ') FOR [SFAFACCOD]
GO
/****** Object:  Default [DF__TBEVASFA__SFACOD__6F0133B5]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVASFA] ADD  DEFAULT (' ') FOR [SFACODIGO]
GO
/****** Object:  Default [DF__TBEVASFA__SFADES__6FF557EE]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVASFA] ADD  DEFAULT (' ') FOR [SFADESCRIP]
GO
/****** Object:  Default [DF__TBEVASFA__SFADES__70E97C27]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVASFA] ADD  DEFAULT (' ') FOR [SFADESADI]
GO
/****** Object:  Default [DF__TBEVASFA__SFAPOR__71DDA060]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVASFA] ADD  DEFAULT ((0)) FOR [SFAPORCENT]
GO
/****** Object:  Default [DF__TBEVASFA__SFADES__72D1C499]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVASFA] ADD  DEFAULT (' ') FOR [SFADESCAPL]
GO
/****** Object:  Default [DF__TBEVASFA__SFAOPC__73C5E8D2]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVASFA] ADD  DEFAULT ((0)) FOR [SFAOPCION]
GO
/****** Object:  Default [DF__TBEVASFA__Jdd__74BA0D0B]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVASFA] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__TBEVASFD__SFDCOD__75AE3144]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVASFD] ADD  DEFAULT (' ') FOR [SFDCODFAC]
GO
/****** Object:  Default [DF__TBEVASFD__SFDCOD__76A2557D]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVASFD] ADD  DEFAULT (' ') FOR [SFDCODIGO]
GO
/****** Object:  Default [DF__TBEVASFD__ID__779679B6]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVASFD] ADD  DEFAULT ((0)) FOR [ID]
GO
/****** Object:  Default [DF__TBEVASFD__DESCRI__788A9DEF]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVASFD] ADD  DEFAULT (' ') FOR [DESCRIP]
GO
/****** Object:  Default [DF__TBEVASFD__Jdd__797EC228]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVASFD] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__TBEVASUC__SUCCAR__7A72E661]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVASUC] ADD  DEFAULT ((0)) FOR [SUCCARGOE]
GO
/****** Object:  Default [DF__TBEVASUC__SUCOPC__7B670A9A]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVASUC] ADD  DEFAULT ((0)) FOR [SUCOPCION]
GO
/****** Object:  Default [DF__TBEVASUC__SUCCAR__7C5B2ED3]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVASUC] ADD  DEFAULT ((0)) FOR [SUCCARGOS]
GO
/****** Object:  Default [DF__TBEVASUC__Jdd__7D4F530C]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVASUC] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__TBEVATDM__tdmcod__7E437745]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVATDM] ADD  DEFAULT (' ') FOR [tdmcodigo]
GO
/****** Object:  Default [DF__TBEVATDM__tdmdes__7F379B7E]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVATDM] ADD  DEFAULT (' ') FOR [tdmdescrip]
GO
/****** Object:  Default [DF__TBEVATDM__tdmpor__002BBFB7]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVATDM] ADD  DEFAULT ((0)) FOR [tdmporc]
GO
/****** Object:  Default [DF__TBEVATDM__Jdd__011FE3F0]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVATDM] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__TBEVAVOT__votcod__02140829]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAVOT] ADD  DEFAULT ((0)) FOR [votcodigo]
GO
/****** Object:  Default [DF__TBEVAVOT__votgru__03082C62]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAVOT] ADD  DEFAULT ((0)) FOR [votgrupo]
GO
/****** Object:  Default [DF__TBEVAVOT__votvot__03FC509B]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAVOT] ADD  DEFAULT ((0)) FOR [votvotante]
GO
/****** Object:  Default [DF__TBEVAVOT__vottip__04F074D4]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAVOT] ADD  DEFAULT ((0)) FOR [vottipo]
GO
/****** Object:  Default [DF__TBEVAVOT__votleg__05E4990D]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAVOT] ADD  DEFAULT (' ') FOR [votlegajo]
GO
/****** Object:  Default [DF__TBEVAVOT__votnom__06D8BD46]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAVOT] ADD  DEFAULT (' ') FOR [votnombre]
GO
/****** Object:  Default [DF__TBEVAVOT__votcla__07CCE17F]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAVOT] ADD  DEFAULT (' ') FOR [votclave]
GO
/****** Object:  Default [DF__TBEVAVOT__votcla__08C105B8]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAVOT] ADD  DEFAULT (' ') FOR [votclave2]
GO
/****** Object:  Default [DF__TBEVAVOT__votest__09B529F1]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAVOT] ADD  DEFAULT ((0)) FOR [votestado]
GO
/****** Object:  Default [DF__TBEVAVOT__votcan__0AA94E2A]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAVOT] ADD  DEFAULT ((0)) FOR [votcantap]
GO
/****** Object:  Default [DF__TBEVAVOT__votcod__0B9D7263]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAVOT] ADD  DEFAULT ((0)) FOR [votcodeva]
GO
/****** Object:  Default [DF__TBEVAVOT__votfec__0C91969C]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAVOT] ADD  DEFAULT (getdate()) FOR [votfecent]
GO
/****** Object:  Default [DF__TBEVAVOT__votfor__0D85BAD5]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAVOT] ADD  DEFAULT (' ') FOR [votfortale]
GO
/****** Object:  Default [DF__TBEVAVOT__votasp__0E79DF0E]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAVOT] ADD  DEFAULT (' ') FOR [votaspecto]
GO
/****** Object:  Default [DF__TBEVAVOT__votsuc__0F6E0347]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAVOT] ADD  DEFAULT ((0)) FOR [votsuceci]
GO
/****** Object:  Default [DF__TBEVAVOT__votfun__10622780]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAVOT] ADD  DEFAULT ((0)) FOR [votfuncio]
GO
/****** Object:  Default [DF__TBEVAVOT__vot_ti__11564BB9]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAVOT] ADD  DEFAULT ((0)) FOR [vot_tipo]
GO
/****** Object:  Default [DF__TBEVAVOT__vot_ni__124A6FF2]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAVOT] ADD  DEFAULT ((0)) FOR [vot_nivel]
GO
/****** Object:  Default [DF__TBEVAVOT__votare__133E942B]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAVOT] ADD  DEFAULT (' ') FOR [votarea]
GO
/****** Object:  Default [DF__TBEVAVOT__Jdd__1432B864]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBEVAVOT] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__tbllam__tkid__1526DC9D]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbllam] ADD  DEFAULT ((0)) FOR [tkid]
GO
/****** Object:  Default [DF__tbllam__llamhrin__161B00D6]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbllam] ADD  DEFAULT (getdate()) FOR [llamhrini]
GO
/****** Object:  Default [DF__tbllam__llamhrfi__170F250F]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbllam] ADD  DEFAULT (getdate()) FOR [llamhrfin]
GO
/****** Object:  Default [DF__tbllam__llamdet__18034948]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbllam] ADD  DEFAULT (' ') FOR [llamdet]
GO
/****** Object:  Default [DF__tbllam__Usuario__18F76D81]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbllam] ADD  DEFAULT (' ') FOR [Usuario]
GO
/****** Object:  Default [DF__tbllam__prsid__19EB91BA]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbllam] ADD  DEFAULT ((0)) FOR [prsid]
GO
/****** Object:  Default [DF__tbllam__llamnum__1ADFB5F3]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbllam] ADD  DEFAULT ((0)) FOR [llamnum]
GO
/****** Object:  Default [DF__tbllam__llamivr__1BD3DA2C]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbllam] ADD  DEFAULT (' ') FOR [llamivr]
GO
/****** Object:  Default [DF__tbllam__Jdd__1CC7FE65]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbllam] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__tbmens__IDClient__1DBC229E]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbmens] ADD  DEFAULT ((0)) FOR [IDCliente]
GO
/****** Object:  Default [DF__tbmens__mensfech__1EB046D7]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbmens] ADD  DEFAULT (getdate()) FOR [mensfechini]
GO
/****** Object:  Default [DF__tbmens__mensfech__1FA46B10]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbmens] ADD  DEFAULT (getdate()) FOR [mensfechfin]
GO
/****** Object:  Default [DF__tbmens__mensdeta__20988F49]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbmens] ADD  DEFAULT (' ') FOR [mensdetall]
GO
/****** Object:  Default [DF__tbmens__Jdd__218CB382]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbmens] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__tbpcparc__nomCar__2280D7BB]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbpcparc] ADD  DEFAULT (' ') FOR [nomCarga]
GO
/****** Object:  Default [DF__tbpcparc__nomArc__2374FBF4]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbpcparc] ADD  DEFAULT (' ') FOR [nomArch]
GO
/****** Object:  Default [DF__tbpcparc__extArc__2469202D]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbpcparc] ADD  DEFAULT (' ') FOR [extArch]
GO
/****** Object:  Default [DF__tbpcparc__comArc__255D4466]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbpcparc] ADD  DEFAULT (' ') FOR [comArch]
GO
/****** Object:  Default [DF__tbpcparc__tipArc__2651689F]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbpcparc] ADD  DEFAULT ((0)) FOR [tipArch]
GO
/****** Object:  Default [DF__tbpcparc__idEsta__27458CD8]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbpcparc] ADD  DEFAULT ((0)) FOR [idEstado]
GO
/****** Object:  Default [DF__tbpcparc__UsuarA__2839B111]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbpcparc] ADD  DEFAULT (' ') FOR [UsuarAlta]
GO
/****** Object:  Default [DF__tbpcparc__fechAl__292DD54A]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbpcparc] ADD  DEFAULT (getdate()) FOR [fechAlta]
GO
/****** Object:  Default [DF__tbpcparc__UsuarU__2A21F983]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbpcparc] ADD  DEFAULT (' ') FOR [UsuarUltM]
GO
/****** Object:  Default [DF__tbpcparc__fechUl__2B161DBC]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbpcparc] ADD  DEFAULT (getdate()) FOR [fechUltM]
GO
/****** Object:  Default [DF__tbpcparc__archiv__2C0A41F5]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbpcparc] ADD  DEFAULT ((0)) FOR [archivo]
GO
/****** Object:  Default [DF__tbplantil__idPla__2CFE662E]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbplantillas] ADD  DEFAULT ((0)) FOR [idPlantilla]
GO
/****** Object:  Default [DF__tbplantil__nomPl__2DF28A67]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbplantillas] ADD  DEFAULT (' ') FOR [nomPlantilla]
GO
/****** Object:  Default [DF__tbplantil__plant__2EE6AEA0]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbplantillas] ADD  DEFAULT ((0)) FOR [plantilla]
GO
/****** Object:  Default [DF__tbplantil__extPl__2FDAD2D9]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbplantillas] ADD  DEFAULT (' ') FOR [extPlantilla]
GO
/****** Object:  Default [DF__tbplantil__idTip__30CEF712]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbplantillas] ADD  DEFAULT ((0)) FOR [idTipoArchivo]
GO
/****** Object:  Default [DF__Tbporact__actcod__31C31B4B]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Tbporact] ADD  DEFAULT ((0)) FOR [actcodcgo]
GO
/****** Object:  Default [DF__Tbporact__actcod__32B73F84]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Tbporact] ADD  DEFAULT ((0)) FOR [actcodigo]
GO
/****** Object:  Default [DF__Tbporact__actpor__33AB63BD]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Tbporact] ADD  DEFAULT ((0)) FOR [actporcent]
GO
/****** Object:  Default [DF__Tbporact__acttex__349F87F6]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Tbporact] ADD  DEFAULT ((0)) FOR [acttexclu]
GO
/****** Object:  Default [DF__Tbporact__acthab__3593AC2F]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Tbporact] ADD  DEFAULT ((0)) FOR [acthabilit]
GO
/****** Object:  Default [DF__Tbporact__actdes__3687D068]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Tbporact] ADD  DEFAULT (' ') FOR [actdescrip]
GO
/****** Object:  Default [DF__Tbporact__actcon__377BF4A1]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Tbporact] ADD  DEFAULT (' ') FOR [actcondic]
GO
/****** Object:  Default [DF__Tbporact__actdes__387018DA]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Tbporact] ADD  DEFAULT (' ') FOR [actdescad]
GO
/****** Object:  Default [DF__Tbporact__acttip__39643D13]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Tbporact] ADD  DEFAULT ((0)) FOR [acttipo]
GO
/****** Object:  Default [DF__Tbporact__actver__3A58614C]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Tbporact] ADD  DEFAULT ((0)) FOR [actver]
GO
/****** Object:  Default [DF__Tbporact__Jdd__3B4C8585]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Tbporact] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__Tbporadi__codigo__3C40A9BE]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Tbporadi] ADD  DEFAULT ((0)) FOR [codigo]
GO
/****** Object:  Default [DF__Tbporadi__codcam__3D34CDF7]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Tbporadi] ADD  DEFAULT ((0)) FOR [codcam]
GO
/****** Object:  Default [DF__Tbporadi__valorn__3E28F230]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Tbporadi] ADD  DEFAULT ((0)) FOR [valorn]
GO
/****** Object:  Default [DF__Tbporadi__valorf__3F1D1669]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Tbporadi] ADD  DEFAULT (getdate()) FOR [valorf]
GO
/****** Object:  Default [DF__Tbporadi__valorc__40113AA2]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Tbporadi] ADD  DEFAULT (' ') FOR [valorc]
GO
/****** Object:  Default [DF__Tbporadi__Jdd__41055EDB]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Tbporadi] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__Tbporbdp__BDPCOD__41F98314]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Tbporbdp] ADD  DEFAULT ((0)) FOR [BDPCODCGO]
GO
/****** Object:  Default [DF__Tbporbdp__BDPCOD__42EDA74D]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Tbporbdp] ADD  DEFAULT ((0)) FOR [BDPCODBdp]
GO
/****** Object:  Default [DF__Tbporbdp__BDPVAL__43E1CB86]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Tbporbdp] ADD  DEFAULT ((0)) FOR [BDPVALOR]
GO
/****** Object:  Default [DF__Tbporbdp__BDPTEX__44D5EFBF]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Tbporbdp] ADD  DEFAULT (' ') FOR [BDPTEXLIB]
GO
/****** Object:  Default [DF__Tbporbdp__Jdd__45CA13F8]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Tbporbdp] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__Tbporcgo__cgocod__46BE3831]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Tbporcgo] ADD  DEFAULT ((0)) FOR [cgocodigo]
GO
/****** Object:  Default [DF__Tbporcgo__cgoniv__47B25C6A]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Tbporcgo] ADD  DEFAULT ((0)) FOR [cgonivjer]
GO
/****** Object:  Default [DF__Tbporcgo__cgoesc__48A680A3]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Tbporcgo] ADD  DEFAULT ((0)) FOR [cgoescalaf]
GO
/****** Object:  Default [DF__Tbporcgo__cgopje__499AA4DC]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Tbporcgo] ADD  DEFAULT ((0)) FOR [cgopjeeval]
GO
/****** Object:  Default [DF__Tbporcgo__cgogra__4A8EC915]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Tbporcgo] ADD  DEFAULT (' ') FOR [cgogrado]
GO
/****** Object:  Default [DF__Tbporcgo__cgosta__4B82ED4E]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Tbporcgo] ADD  DEFAULT ((0)) FOR [cgostaff]
GO
/****** Object:  Default [DF__Tbporcgo__cgosup__4C771187]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Tbporcgo] ADD  DEFAULT ((0)) FOR [cgosuperv]
GO
/****** Object:  Default [DF__Tbporcgo__cgofmt__4D6B35C0]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Tbporcgo] ADD  DEFAULT (' ') FOR [cgofmteval]
GO
/****** Object:  Default [DF__Tbporcgo__cgocar__4E5F59F9]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Tbporcgo] ADD  DEFAULT ((0)) FOR [cgocardes]
GO
/****** Object:  Default [DF__Tbporcgo__cgotip__4F537E32]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Tbporcgo] ADD  DEFAULT ((0)) FOR [cgotipodes]
GO
/****** Object:  Default [DF__Tbporcgo__cgofec__5047A26B]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Tbporcgo] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [cgofecdesc]
GO
/****** Object:  Default [DF__Tbporcgo__cgotip__513BC6A4]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Tbporcgo] ADD  DEFAULT ((0)) FOR [cgotipo]
GO
/****** Object:  Default [DF__Tbporcgo__cgodes__522FEADD]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Tbporcgo] ADD  DEFAULT ((0)) FOR [cgodesctor]
GO
/****** Object:  Default [DF__Tbporcgo__cgoobj__53240F16]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Tbporcgo] ADD  DEFAULT (' ') FOR [cgoobjetiv]
GO
/****** Object:  Default [DF__Tbporcgo__cgoptj__5418334F]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Tbporcgo] ADD  DEFAULT ((0)) FOR [cgoptjeval]
GO
/****** Object:  Default [DF__Tbporcgo__cgotip__550C5788]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Tbporcgo] ADD  DEFAULT ((0)) FOR [cgotipctr]
GO
/****** Object:  Default [DF__Tbporcgo__cgodur__56007BC1]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Tbporcgo] ADD  DEFAULT ((0)) FOR [cgodurctr]
GO
/****** Object:  Default [DF__Tbporcgo__cgotip__56F49FFA]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Tbporcgo] ADD  DEFAULT ((0)) FOR [cgotiprem]
GO
/****** Object:  Default [DF__Tbporcgo__cgohor__57E8C433]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Tbporcgo] ADD  DEFAULT ((0)) FOR [cgohorario]
GO
/****** Object:  Default [DF__Tbporcgo__cgomer__58DCE86C]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Tbporcgo] ADD  DEFAULT ((0)) FOR [cgomercado]
GO
/****** Object:  Default [DF__Tbporcgo__cgofac__59D10CA5]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Tbporcgo] ADD  DEFAULT ((0)) FOR [cgofactor]
GO
/****** Object:  Default [DF__Tbporcgo__cgofun__5AC530DE]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Tbporcgo] ADD  DEFAULT (' ') FOR [cgofuncion]
GO
/****** Object:  Default [DF__Tbporcgo__cgogrd__5BB95517]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Tbporcgo] ADD  DEFAULT ((0)) FOR [cgogrd]
GO
/****** Object:  Default [DF__Tbporcgo__cgocla__5CAD7950]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Tbporcgo] ADD  DEFAULT ((0)) FOR [cgoclase]
GO
/****** Object:  Default [DF__Tbporcgo__cgoamb__5DA19D89]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Tbporcgo] ADD  DEFAULT (' ') FOR [cgoamb_la]
GO
/****** Object:  Default [DF__Tbporcgo__cgodat__5E95C1C2]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Tbporcgo] ADD  DEFAULT (' ') FOR [cgodatosad]
GO
/****** Object:  Default [DF__Tbporcgo__cgoben__5F89E5FB]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Tbporcgo] ADD  DEFAULT ((0)) FOR [cgobenefi1]
GO
/****** Object:  Default [DF__Tbporcgo__cgoben__607E0A34]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Tbporcgo] ADD  DEFAULT ((0)) FOR [cgobenefi2]
GO
/****** Object:  Default [DF__Tbporcgo__cgoben__61722E6D]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Tbporcgo] ADD  DEFAULT ((0)) FOR [cgobenefi3]
GO
/****** Object:  Default [DF__Tbporcgo__cgoben__626652A6]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Tbporcgo] ADD  DEFAULT ((0)) FOR [cgobenefi4]
GO
/****** Object:  Default [DF__Tbporcgo__cgoben__635A76DF]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Tbporcgo] ADD  DEFAULT ((0)) FOR [cgobenefi5]
GO
/****** Object:  Default [DF__Tbporcgo__cgoinc__644E9B18]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Tbporcgo] ADD  DEFAULT ((0)) FOR [cgoincon]
GO
/****** Object:  Default [DF__Tbporcgo__cgocen__6542BF51]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Tbporcgo] ADD  DEFAULT ((0)) FOR [cgocencos]
GO
/****** Object:  Default [DF__Tbporcgo__cgosec__6636E38A]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Tbporcgo] ADD  DEFAULT ((0)) FOR [cgosector]
GO
/****** Object:  Default [DF__Tbporcgo__cgoper__672B07C3]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Tbporcgo] ADD  DEFAULT ((0)) FOR [cgoperiod]
GO
/****** Object:  Default [DF__Tbporcgo__CGOTIP__681F2BFC]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Tbporcgo] ADD  DEFAULT ((0)) FOR [CGOTIPOCON]
GO
/****** Object:  Default [DF__Tbporcgo__CGOARE__69135035]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Tbporcgo] ADD  DEFAULT ((0)) FOR [CGOAREARP]
GO
/****** Object:  Default [DF__Tbporcgo__CGOMOT__6A07746E]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Tbporcgo] ADD  DEFAULT ((0)) FOR [CGOMOTRP]
GO
/****** Object:  Default [DF__Tbporcgo__cgoobj__6AFB98A7]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Tbporcgo] ADD  DEFAULT (' ') FOR [cgoobjtar]
GO
/****** Object:  Default [DF__Tbporcgo__cgomer__6BEFBCE0]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Tbporcgo] ADD  DEFAULT ((0)) FOR [cgomerc]
GO
/****** Object:  Default [DF__Tbporcgo__cgoapr__6CE3E119]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Tbporcgo] ADD  DEFAULT ((0)) FOR [cgoaprob]
GO
/****** Object:  Default [DF__Tbporcgo__Jdd__6DD80552]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Tbporcgo] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__Tbporcgo__cgodes__6ECC298B]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Tbporcgo] ADD  DEFAULT (' ') FOR [cgodescrip]
GO
/****** Object:  Default [DF__Tbporcom__comcar__6FC04DC4]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Tbporcom] ADD  DEFAULT ((0)) FOR [comcargo]
GO
/****** Object:  Default [DF__Tbporcom__comcod__70B471FD]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Tbporcom] ADD  DEFAULT (' ') FOR [comcodfac]
GO
/****** Object:  Default [DF__Tbporcom__comcod__71A89636]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Tbporcom] ADD  DEFAULT (' ') FOR [comcodsfa]
GO
/****** Object:  Default [DF__Tbporcom__comcod__729CBA6F]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Tbporcom] ADD  DEFAULT ((0)) FOR [comcodgrd]
GO
/****** Object:  Default [DF__Tbporcom__comdes__7390DEA8]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Tbporcom] ADD  DEFAULT (' ') FOR [comdescrip]
GO
/****** Object:  Default [DF__Tbporcom__comhab__748502E1]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Tbporcom] ADD  DEFAULT ((0)) FOR [comhabilit]
GO
/****** Object:  Default [DF__Tbporcom__comexc__7579271A]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Tbporcom] ADD  DEFAULT ((0)) FOR [comexclu]
GO
/****** Object:  Default [DF__Tbporcom__compes__766D4B53]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Tbporcom] ADD  DEFAULT ((0)) FOR [compesorel]
GO
/****** Object:  Default [DF__Tbporcom__Jdd__77616F8C]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Tbporcom] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__Tbpordmp__DMPCOD__785593C5]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Tbpordmp] ADD  DEFAULT ((0)) FOR [DMPCODCGO]
GO
/****** Object:  Default [DF__Tbpordmp__DMPCAR__7949B7FE]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Tbpordmp] ADD  DEFAULT ((0)) FOR [DMPCAREXT]
GO
/****** Object:  Default [DF__Tbpordmp__DMPREM__7A3DDC37]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Tbpordmp] ADD  DEFAULT ((0)) FOR [DMPREMEMP]
GO
/****** Object:  Default [DF__Tbpordmp__Jdd__7B320070]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Tbpordmp] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__Tbpordoc__CGOCOD__7C2624A9]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Tbpordoc] ADD  DEFAULT ((0)) FOR [CGOCODIGO]
GO
/****** Object:  Default [DF__Tbpordoc__Fecha___7D1A48E2]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Tbpordoc] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [Fecha_doc]
GO
/****** Object:  Default [DF__Tbpordoc__Tipo__7E0E6D1B]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Tbpordoc] ADD  DEFAULT ((0)) FOR [Tipo]
GO
/****** Object:  Default [DF__Tbpordoc__Descri__7F029154]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Tbpordoc] ADD  DEFAULT (' ') FOR [Descrip]
GO
/****** Object:  Default [DF__Tbpordoc__Nombre__7FF6B58D]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Tbpordoc] ADD  DEFAULT (' ') FOR [Nombre]
GO
/****** Object:  Default [DF__Tbpordoc__Fecha___00EAD9C6]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Tbpordoc] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [Fecha_car]
GO
/****** Object:  Default [DF__Tbpordoc__Elemen__01DEFDFF]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Tbpordoc] ADD  DEFAULT ((0)) FOR [Elemento]
GO
/****** Object:  Default [DF__Tbpordoc__Dire__02D32238]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Tbpordoc] ADD  DEFAULT (' ') FOR [Dire]
GO
/****** Object:  Default [DF__Tbpordoc__Dtipo__03C74671]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Tbpordoc] ADD  DEFAULT (' ') FOR [Dtipo]
GO
/****** Object:  Default [DF__Tbpordoc__Jdd__04BB6AAA]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Tbpordoc] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__Tbpordto__DTOCOD__05AF8EE3]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Tbpordto] ADD  DEFAULT ((0)) FOR [DTOCODCGO]
GO
/****** Object:  Default [DF__Tbpordto__DTOID__06A3B31C]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Tbpordto] ADD  DEFAULT ((0)) FOR [DTOID]
GO
/****** Object:  Default [DF__Tbpordto__DTOTAR__0797D755]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Tbpordto] ADD  DEFAULT (' ') FOR [DTOTAREA]
GO
/****** Object:  Default [DF__Tbpordto__DTOOBJ__088BFB8E]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Tbpordto] ADD  DEFAULT (' ') FOR [DTOOBJETI]
GO
/****** Object:  Default [DF__Tbpordto__DTONRO__09801FC7]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Tbpordto] ADD  DEFAULT ((0)) FOR [DTONRO]
GO
/****** Object:  Default [DF__Tbpordto__EVALUA__0A744400]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Tbpordto] ADD  DEFAULT ((0)) FOR [EVALUA]
GO
/****** Object:  Default [DF__Tbpordto__GRADOS__0B686839]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Tbpordto] ADD  DEFAULT ((0)) FOR [GRADOS]
GO
/****** Object:  Default [DF__Tbpordto__CALIFI__0C5C8C72]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Tbpordto] ADD  DEFAULT (' ') FOR [CALIFIC]
GO
/****** Object:  Default [DF__Tbpordto__Jdd__0D50B0AB]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Tbpordto] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__Tbporexa__exacod__0E44D4E4]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Tbporexa] ADD  DEFAULT ((0)) FOR [exacodcgo]
GO
/****** Object:  Default [DF__Tbporexa__exacod__0F38F91D]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Tbporexa] ADD  DEFAULT ((0)) FOR [exacodigo]
GO
/****** Object:  Default [DF__Tbporexa__exaapl__102D1D56]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Tbporexa] ADD  DEFAULT ((0)) FOR [exaaplica]
GO
/****** Object:  Default [DF__Tbporexa__exapor__1121418F]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Tbporexa] ADD  DEFAULT ((0)) FOR [exaporcent]
GO
/****** Object:  Default [DF__Tbporexa__exafin__121565C8]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Tbporexa] ADD  DEFAULT ((0)) FOR [exafin]
GO
/****** Object:  Default [DF__Tbporexa__exaper__13098A01]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Tbporexa] ADD  DEFAULT ((0)) FOR [exaperio]
GO
/****** Object:  Default [DF__Tbporexa__exaord__13FDAE3A]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Tbporexa] ADD  DEFAULT ((0)) FOR [exaorden]
GO
/****** Object:  Default [DF__Tbporexa__Jdd__14F1D273]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Tbporexa] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__Tbporpun__ID__15E5F6AC]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Tbporpun] ADD  DEFAULT ((0)) FOR [ID]
GO
/****** Object:  Default [DF__Tbporpun__GRADO__16DA1AE5]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Tbporpun] ADD  DEFAULT ((0)) FOR [GRADO]
GO
/****** Object:  Default [DF__Tbporpun__FACTOR__17CE3F1E]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Tbporpun] ADD  DEFAULT ((0)) FOR [FACTOR]
GO
/****** Object:  Default [DF__Tbporpun__PUNTAJ__18C26357]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Tbporpun] ADD  DEFAULT ((0)) FOR [PUNTAJE]
GO
/****** Object:  Default [DF__Tbporpun__Jdd__19B68790]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Tbporpun] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__Tbporrca__ID__1AAAABC9]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Tbporrca] ADD  DEFAULT ((0)) FOR [ID]
GO
/****** Object:  Default [DF__Tbporrca__CODCAT__1B9ED002]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Tbporrca] ADD  DEFAULT ((0)) FOR [CODCAT]
GO
/****** Object:  Default [DF__Tbporrca__MINIMO__1C92F43B]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Tbporrca] ADD  DEFAULT ((0)) FOR [MINIMO]
GO
/****** Object:  Default [DF__Tbporrca__MAXIMO__1D871874]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Tbporrca] ADD  DEFAULT ((0)) FOR [MAXIMO]
GO
/****** Object:  Default [DF__Tbporrca__Jdd__1E7B3CAD]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Tbporrca] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__Tbporrdp__RDPCOD__1F6F60E6]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Tbporrdp] ADD  DEFAULT ((0)) FOR [RDPCODCGO]
GO
/****** Object:  Default [DF__Tbporrdp__RDPTIP__2063851F]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Tbporrdp] ADD  DEFAULT ((0)) FOR [RDPTIPOCON]
GO
/****** Object:  Default [DF__Tbporrdp__RDPPER__2157A958]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Tbporrdp] ADD  DEFAULT ((0)) FOR [RDPPERIOD]
GO
/****** Object:  Default [DF__Tbporrdp__RDPARE__224BCD91]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Tbporrdp] ADD  DEFAULT (' ') FOR [RDPAREA]
GO
/****** Object:  Default [DF__Tbporrdp__RDPMOT__233FF1CA]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Tbporrdp] ADD  DEFAULT (' ') FOR [RDPMOTIVO]
GO
/****** Object:  Default [DF__Tbporrdp__Jdd__24341603]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Tbporrdp] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__Tbporrec__reccod__25283A3C]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Tbporrec] ADD  DEFAULT ((0)) FOR [reccodcgo]
GO
/****** Object:  Default [DF__Tbporrec__reccod__261C5E75]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Tbporrec] ADD  DEFAULT ((0)) FOR [reccodigo]
GO
/****** Object:  Default [DF__Tbporrec__recpor__271082AE]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Tbporrec] ADD  DEFAULT ((0)) FOR [recporcent]
GO
/****** Object:  Default [DF__Tbporrec__rectex__2804A6E7]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Tbporrec] ADD  DEFAULT ((0)) FOR [rectexclu]
GO
/****** Object:  Default [DF__Tbporrec__rechab__28F8CB20]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Tbporrec] ADD  DEFAULT ((0)) FOR [rechabilit]
GO
/****** Object:  Default [DF__Tbporrec__recdes__29ECEF59]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Tbporrec] ADD  DEFAULT (' ') FOR [recdescrip]
GO
/****** Object:  Default [DF__Tbporrec__reccon__2AE11392]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Tbporrec] ADD  DEFAULT (' ') FOR [reccondic]
GO
/****** Object:  Default [DF__Tbporrec__recdes__2BD537CB]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Tbporrec] ADD  DEFAULT (' ') FOR [recdescad]
GO
/****** Object:  Default [DF__Tbporrec__rectip__2CC95C04]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Tbporrec] ADD  DEFAULT ((0)) FOR [rectipo]
GO
/****** Object:  Default [DF__Tbporrec__recver__2DBD803D]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Tbporrec] ADD  DEFAULT ((0)) FOR [recver]
GO
/****** Object:  Default [DF__Tbporrec__Jdd__2EB1A476]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Tbporrec] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__Tbporrsa__ID__2FA5C8AF]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Tbporrsa] ADD  DEFAULT ((0)) FOR [ID]
GO
/****** Object:  Default [DF__Tbporrsa__CODCAT__3099ECE8]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Tbporrsa] ADD  DEFAULT ((0)) FOR [CODCAT]
GO
/****** Object:  Default [DF__Tbporrsa__perc25__318E1121]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Tbporrsa] ADD  DEFAULT ((0)) FOR [perc25]
GO
/****** Object:  Default [DF__Tbporrsa__perc50__3282355A]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Tbporrsa] ADD  DEFAULT ((0)) FOR [perc50]
GO
/****** Object:  Default [DF__Tbporrsa__perc75__33765993]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Tbporrsa] ADD  DEFAULT ((0)) FOR [perc75]
GO
/****** Object:  Default [DF__Tbporrsa__fecha__346A7DCC]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Tbporrsa] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [fecha]
GO
/****** Object:  Default [DF__Tbporrsa__pmedio__355EA205]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Tbporrsa] ADD  DEFAULT ((0)) FOR [pmedio]
GO
/****** Object:  Default [DF__Tbporrsa__porcen__3652C63E]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Tbporrsa] ADD  DEFAULT ((0)) FOR [porcen1]
GO
/****** Object:  Default [DF__Tbporrsa__porcen__3746EA77]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Tbporrsa] ADD  DEFAULT ((0)) FOR [porcen2]
GO
/****** Object:  Default [DF__Tbporrsa__CODCAT__383B0EB0]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Tbporrsa] ADD  DEFAULT ((0)) FOR [CODCATANT]
GO
/****** Object:  Default [DF__Tbporrsa__Jdd__392F32E9]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Tbporrsa] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__Tbporvdp__VDPCOD__3A235722]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Tbporvdp] ADD  DEFAULT ((0)) FOR [VDPCODCGO]
GO
/****** Object:  Default [DF__Tbporvdp__VDPCOD__3B177B5B]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Tbporvdp] ADD  DEFAULT ((0)) FOR [VDPCODVDP]
GO
/****** Object:  Default [DF__Tbporvdp__VDPVAL__3C0B9F94]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Tbporvdp] ADD  DEFAULT ((0)) FOR [VDPVALOR]
GO
/****** Object:  Default [DF__Tbporvdp__VDPSEN__3CFFC3CD]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Tbporvdp] ADD  DEFAULT ((0)) FOR [VDPSENSIB]
GO
/****** Object:  Default [DF__Tbporvdp__Jdd__3DF3E806]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Tbporvdp] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__tbproc__procnom__3EE80C3F]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbproc] ADD  DEFAULT (' ') FOR [procnom]
GO
/****** Object:  Default [DF__tbproc__Jdd__3FDC3078]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbproc] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__tbprs__prsrut__40D054B1]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbprs] ADD  DEFAULT (' ') FOR [prsrut]
GO
/****** Object:  Default [DF__tbprs__prsnom__41C478EA]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbprs] ADD  DEFAULT (' ') FOR [prsnom]
GO
/****** Object:  Default [DF__tbprs__prsapepat__42B89D23]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbprs] ADD  DEFAULT (' ') FOR [prsapepat]
GO
/****** Object:  Default [DF__tbprs__prsapemat__43ACC15C]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbprs] ADD  DEFAULT (' ') FOR [prsapemat]
GO
/****** Object:  Default [DF__tbprs__prsemail__44A0E595]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbprs] ADD  DEFAULT (' ') FOR [prsemail]
GO
/****** Object:  Default [DF__tbprs__prsfechna__459509CE]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbprs] ADD  DEFAULT (getdate()) FOR [prsfechnac]
GO
/****** Object:  Default [DF__tbprs__Jdd__46892E07]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbprs] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__TBRHUCAT__catmod__477D5240]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBRHUCAT] ADD  DEFAULT (' ') FOR [catmodulo]
GO
/****** Object:  Default [DF__TBRHUCAT__catnom__48717679]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBRHUCAT] ADD  DEFAULT (' ') FOR [catnombre]
GO
/****** Object:  Default [DF__TBRHUCAT__catcap__49659AB2]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBRHUCAT] ADD  DEFAULT (' ') FOR [catcaption]
GO
/****** Object:  Default [DF__TBRHUCAT__catdes__4A59BEEB]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBRHUCAT] ADD  DEFAULT (' ') FOR [catdescrip]
GO
/****** Object:  Default [DF__TBRHUCAT__catfor__4B4DE324]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBRHUCAT] ADD  DEFAULT (' ') FOR [catform]
GO
/****** Object:  Default [DF__TBRHUCAT__catori__4C42075D]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBRHUCAT] ADD  DEFAULT (' ') FOR [catoricap]
GO
/****** Object:  Default [DF__TBRHUCAT__catori__4D362B96]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBRHUCAT] ADD  DEFAULT (' ') FOR [catorides]
GO
/****** Object:  Default [DF__TBRHUCAT__Jdd__4E2A4FCF]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[TBRHUCAT] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__Tbrhuids__tabla__4F1E7408]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Tbrhuids] ADD  DEFAULT (' ') FOR [tabla]
GO
/****** Object:  Default [DF__Tbrhuids__LastID__50129841]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Tbrhuids] ADD  DEFAULT ((0)) FOR [LastID]
GO
/****** Object:  Default [DF__Tbrhuids__Jdd__5106BC7A]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[Tbrhuids] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__tbtk__IDCliente__51FAE0B3]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbtk] ADD  DEFAULT ((0)) FOR [IDCliente]
GO
/****** Object:  Default [DF__tbtk__catid__52EF04EC]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbtk] ADD  DEFAULT ((0)) FOR [catid]
GO
/****** Object:  Default [DF__tbtk__tkorigid__53E32925]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbtk] ADD  DEFAULT ((0)) FOR [tkorigid]
GO
/****** Object:  Default [DF__tbtk__tkfechcre__54D74D5E]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbtk] ADD  DEFAULT (getdate()) FOR [tkfechcre]
GO
/****** Object:  Default [DF__tbtk__tkfechini__55CB7197]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbtk] ADD  DEFAULT (getdate()) FOR [tkfechini]
GO
/****** Object:  Default [DF__tbtk__tkfechresp__56BF95D0]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbtk] ADD  DEFAULT (getdate()) FOR [tkfechresp]
GO
/****** Object:  Default [DF__tbtk__tksolentr__57B3BA09]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbtk] ADD  DEFAULT (' ') FOR [tksolentr]
GO
/****** Object:  Default [DF__tbtk__tkivt__58A7DE42]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbtk] ADD  DEFAULT ((0)) FOR [tkivt]
GO
/****** Object:  Default [DF__tbtk__tkivtptotr__599C027B]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbtk] ADD  DEFAULT (' ') FOR [tkivtptotrat]
GO
/****** Object:  Default [DF__tbtk__tkivttarea__5A9026B4]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbtk] ADD  DEFAULT (' ') FOR [tkivttareal]
GO
/****** Object:  Default [DF__tbtk__Usuario__5B844AED]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbtk] ADD  DEFAULT (' ') FOR [Usuario]
GO
/****** Object:  Default [DF__tbtk__estid__5C786F26]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbtk] ADD  DEFAULT ((0)) FOR [estid]
GO
/****** Object:  Default [DF__tbtk__tkhrini__5D6C935F]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbtk] ADD  DEFAULT (getdate()) FOR [tkhrini]
GO
/****** Object:  Default [DF__tbtk__tkivthrfin__5E60B798]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbtk] ADD  DEFAULT (getdate()) FOR [tkivthrfin]
GO
/****** Object:  Default [DF__tbtk__UsuarioNom__5F54DBD1]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbtk] ADD  DEFAULT (' ') FOR [UsuarioNom]
GO
/****** Object:  Default [DF__tbtk__prsid__6049000A]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbtk] ADD  DEFAULT ((0)) FOR [prsid]
GO
/****** Object:  Default [DF__tbtk__IDproducto__613D2443]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbtk] ADD  DEFAULT ((0)) FOR [IDproducto]
GO
/****** Object:  Default [DF__tbtk__tkfechcier__6231487C]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbtk] ADD  DEFAULT (getdate()) FOR [tkfechcierr]
GO
/****** Object:  Default [DF__tbtk__urlavi__63256CB5]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbtk] ADD  DEFAULT (' ') FOR [urlavi]
GO
/****** Object:  Default [DF__tbtk__tkadjunto__641990EE]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbtk] ADD  DEFAULT (' ') FOR [tkadjunto]
GO
/****** Object:  Default [DF__tbtk__tkivtfechf__650DB527]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbtk] ADD  DEFAULT (getdate()) FOR [tkivtfechfin]
GO
/****** Object:  Default [DF__tbtk__Jdd__6601D960]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbtk] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__tbtransf__transf__66F5FD99]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbtransf] ADD  DEFAULT ((0)) FOR [transftipo]
GO
/****** Object:  Default [DF__tbtransf__transf__67EA21D2]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbtransf] ADD  DEFAULT (' ') FOR [transfobs]
GO
/****** Object:  Default [DF__tbtransf__transf__68DE460B]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbtransf] ADD  DEFAULT (' ') FOR [transfver]
GO
/****** Object:  Default [DF__tbtransf__transf__69D26A44]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbtransf] ADD  DEFAULT ((0)) FOR [transfelim]
GO
/****** Object:  Default [DF__tbtransf__transf__6AC68E7D]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbtransf] ADD  DEFAULT ((0)) FOR [transfentid]
GO
/****** Object:  Default [DF__tbtransf__Jdd__6BBAB2B6]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbtransf] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__tbtransfe__trans__6CAED6EF]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbtransfempr] ADD  DEFAULT ((0)) FOR [transfid]
GO
/****** Object:  Default [DF__tbtransfe__IDCli__6DA2FB28]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbtransfempr] ADD  DEFAULT ((0)) FOR [IDCliente]
GO
/****** Object:  Default [DF__tbtransfemp__Jdd__6E971F61]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbtransfempr] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  ForeignKey [FK__pcpCargEs__idCar__6F8B439A]    Script Date: 04/12/2016 17:51:07 ******/
ALTER TABLE [dbo].[pcpCargEst]  WITH CHECK ADD FOREIGN KEY([idCarga])
REFERENCES [dbo].[pcpCargas] ([idCarga])
GO
/****** Object:  ForeignKey [FK_idcliente]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbcas]  WITH CHECK ADD  CONSTRAINT [FK_idcliente] FOREIGN KEY([IDCliente])
REFERENCES [dbo].[rclientes] ([IDCliente])
GO
ALTER TABLE [dbo].[tbcas] CHECK CONSTRAINT [FK_idcliente]
GO
/****** Object:  ForeignKey [FK_procid]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbcas]  WITH CHECK ADD  CONSTRAINT [FK_procid] FOREIGN KEY([procid])
REFERENCES [dbo].[tbproc] ([procid])
GO
ALTER TABLE [dbo].[tbcas] CHECK CONSTRAINT [FK_procid]
GO
/****** Object:  ForeignKey [FK_idcliente2]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbcontempr]  WITH CHECK ADD  CONSTRAINT [FK_idcliente2] FOREIGN KEY([IDCliente])
REFERENCES [dbo].[rclientes] ([IDCliente])
GO
ALTER TABLE [dbo].[tbcontempr] CHECK CONSTRAINT [FK_idcliente2]
GO
/****** Object:  ForeignKey [FK_idprs]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbcontempr]  WITH CHECK ADD  CONSTRAINT [FK_idprs] FOREIGN KEY([prsid])
REFERENCES [dbo].[tbprs] ([prsrid])
GO
ALTER TABLE [dbo].[tbcontempr] CHECK CONSTRAINT [FK_idprs]
GO
/****** Object:  ForeignKey [FK_tbtk2]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbllam]  WITH CHECK ADD  CONSTRAINT [FK_tbtk2] FOREIGN KEY([tkid])
REFERENCES [dbo].[tbtk] ([tkid])
GO
ALTER TABLE [dbo].[tbllam] CHECK CONSTRAINT [FK_tbtk2]
GO
/****** Object:  ForeignKey [FK_catid]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbtk]  WITH CHECK ADD  CONSTRAINT [FK_catid] FOREIGN KEY([catid])
REFERENCES [dbo].[tbcat] ([catid])
GO
ALTER TABLE [dbo].[tbtk] CHECK CONSTRAINT [FK_catid]
GO
/****** Object:  ForeignKey [FK_tk]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbtk]  WITH CHECK ADD  CONSTRAINT [FK_tk] FOREIGN KEY([IDCliente])
REFERENCES [dbo].[rclientes] ([IDCliente])
GO
ALTER TABLE [dbo].[tbtk] CHECK CONSTRAINT [FK_tk]
GO
/****** Object:  ForeignKey [FK_IDCLiente3]    Script Date: 04/12/2016 17:51:08 ******/
ALTER TABLE [dbo].[tbtransfempr]  WITH CHECK ADD  CONSTRAINT [FK_IDCLiente3] FOREIGN KEY([IDCliente])
REFERENCES [dbo].[rclientes] ([IDCliente])
GO
ALTER TABLE [dbo].[tbtransfempr] CHECK CONSTRAINT [FK_IDCLiente3]
GO
