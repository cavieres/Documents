/****** 
Object:  Table RMAPITMBKP
Script Date: 25/02/2016
Description: create new table for rmapitm backup for massive processing
******/

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [RMAPITMBKP](
	[id] [int] IDENTITY(1,1) NOT NULL,
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
	[Fecha_ing] [datetime] NOT NULL,
	[Fecha_apr] [datetime] NOT NULL,
	[Codigo_in] [char](12) NOT NULL,
	[Codigo_ap] [char](12) NOT NULL,
	[Plantilla] [char](10) NOT NULL,
	[Ames] [char](6) NOT NULL,
	[Moti_mod] [int] NOT NULL,
	[Fecha_ult] [datetime] NOT NULL,
	[Jdd] [int] NOT NULL,
	[backup_date] [datetime] NOT NULL,
 CONSTRAINT [PK_RMAPITMBKP] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [RMAPITMBKP] ADD  DEFAULT (' ') FOR [Codigo]
GO

ALTER TABLE [RMAPITMBKP] ADD  DEFAULT (' ') FOR [Cohade]
GO

ALTER TABLE [RMAPITMBKP] ADD  DEFAULT ((0)) FOR [Nro]
GO

ALTER TABLE [RMAPITMBKP] ADD  DEFAULT ((0)) FOR [Tipo]
GO

ALTER TABLE [RMAPITMBKP] ADD  DEFAULT ((0)) FOR [Orden]
GO

ALTER TABLE [RMAPITMBKP] ADD  DEFAULT (' ') FOR [Periodo]
GO

ALTER TABLE [RMAPITMBKP] ADD  DEFAULT (' ') FOR [COFORM]
GO

ALTER TABLE [RMAPITMBKP] ADD  DEFAULT ((0)) FOR [CUOTOT]
GO

ALTER TABLE [RMAPITMBKP] ADD  DEFAULT ((0)) FOR [CUOPAR]
GO

ALTER TABLE [RMAPITMBKP] ADD  DEFAULT ((0)) FOR [Monto]
GO

ALTER TABLE [RMAPITMBKP] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [Fecha_cre]
GO

ALTER TABLE [RMAPITMBKP] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [Fecha_ini]
GO

ALTER TABLE [RMAPITMBKP] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [Fecha_fin]
GO

ALTER TABLE [RMAPITMBKP] ADD  DEFAULT ((0)) FOR [Cencos]
GO

ALTER TABLE [RMAPITMBKP] ADD  DEFAULT (' ') FOR [Cuenta]
GO

ALTER TABLE [RMAPITMBKP] ADD  DEFAULT (' ') FOR [Ticen]
GO

ALTER TABLE [RMAPITMBKP] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(112)),(112))) FOR [Fepro]
GO

ALTER TABLE [RMAPITMBKP] ADD  DEFAULT ((0)) FOR [Codpres]
GO

ALTER TABLE [RMAPITMBKP] ADD  DEFAULT (' ') FOR [Obs]
GO

ALTER TABLE [RMAPITMBKP] ADD  DEFAULT (' ') FOR [Formula]
GO

ALTER TABLE [RMAPITMBKP] ADD  DEFAULT (' ') FOR [Procede]
GO

ALTER TABLE [RMAPITMBKP] ADD  DEFAULT (' ') FOR [Estado]
GO

ALTER TABLE [RMAPITMBKP] ADD  DEFAULT ((0)) FOR [Coinst]
GO

ALTER TABLE [RMAPITMBKP] ADD  DEFAULT ((0)) FOR [PerImp]
GO

ALTER TABLE [RMAPITMBKP] ADD  DEFAULT (' ') FOR [Pone]
GO

ALTER TABLE [RMAPITMBKP] ADD  DEFAULT ((0)) FOR [Acumu]
GO

ALTER TABLE [RMAPITMBKP] ADD  DEFAULT (' ') FOR [Tiacu]
GO

ALTER TABLE [RMAPITMBKP] ADD  DEFAULT ((0)) FOR [MontoC]
GO

ALTER TABLE [RMAPITMBKP] ADD  DEFAULT ((0)) FOR [MontoP]
GO

ALTER TABLE [RMAPITMBKP] ADD  DEFAULT (' ') FOR [Propor]
GO

ALTER TABLE [RMAPITMBKP] ADD  DEFAULT ((0)) FOR [Grupo]
GO

ALTER TABLE [RMAPITMBKP] ADD  DEFAULT (' ') FOR [Condi]
GO

ALTER TABLE [RMAPITMBKP] ADD  DEFAULT (' ') FOR [Simes]
GO

ALTER TABLE [RMAPITMBKP] ADD  DEFAULT (' ') FOR [Queperi]
GO

ALTER TABLE [RMAPITMBKP] ADD  DEFAULT (getdate()) FOR [Fecha_ing]
GO

ALTER TABLE [RMAPITMBKP] ADD  DEFAULT (getdate()) FOR [Fecha_apr]
GO

ALTER TABLE [RMAPITMBKP] ADD  DEFAULT (' ') FOR [Codigo_in]
GO

ALTER TABLE [RMAPITMBKP] ADD  DEFAULT (' ') FOR [Codigo_ap]
GO

ALTER TABLE [RMAPITMBKP] ADD  DEFAULT (' ') FOR [Plantilla]
GO

ALTER TABLE [RMAPITMBKP] ADD  DEFAULT (' ') FOR [Ames]
GO

ALTER TABLE [RMAPITMBKP] ADD  DEFAULT ((0)) FOR [Moti_mod]
GO

ALTER TABLE [RMAPITMBKP] ADD  DEFAULT (getdate()) FOR [Fecha_ult]
GO

ALTER TABLE [RMAPITMBKP] ADD  DEFAULT ((0)) FOR [Jdd]
GO

ALTER TABLE [RMAPITMBKP] ADD  DEFAULT (getdate()) FOR [backup_date]
GO
