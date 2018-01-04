USE [FITAR]
GO
/****** Object:  Table [dbo].[Rtablas]    Script Date: 01/04/2018 18:16:33 ******/
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
	[Jdd] [int] NOT NULL,
	[Estado] [char](1) NOT NULL,
 CONSTRAINT [Rtablas_PK] PRIMARY KEY CLUSTERED 
(
	[Jdd] ASC,
	[Cotab] ASC,
	[Codigo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Rtablas] ([Tipo], [Cotab], [Codigo], [Descrip], [Valor], [Valor2], [ValorC], [Valor4], [CodAl], [ValorG], [Jdd], [Estado]) VALUES (N'T', 3, 0, N'CÓDIGOS DE CONVENIOS VACACIONES         ', 0.0000, 0.0000, N'                                                                                                                                                                                                        ', N'               ', N'          ', N'', 0, N'S')
INSERT [dbo].[Rtablas] ([Tipo], [Cotab], [Codigo], [Descrip], [Valor], [Valor2], [ValorC], [Valor4], [CodAl], [ValorG], [Jdd], [Estado]) VALUES (N'C', 3, 1, N'Convenio X                              ', 1.0000, 0.0000, N'                                                                                                                                                                                                        ', N'               ', N'          ', N'', 0, N'S')
INSERT [dbo].[Rtablas] ([Tipo], [Cotab], [Codigo], [Descrip], [Valor], [Valor2], [ValorC], [Valor4], [CodAl], [ValorG], [Jdd], [Estado]) VALUES (N'C', 3, 2, N'Convenio Y                              ', 2.0000, 0.0000, N'                                                                                                                                                                                                        ', N'               ', N'          ', N'', 0, N'S')
INSERT [dbo].[Rtablas] ([Tipo], [Cotab], [Codigo], [Descrip], [Valor], [Valor2], [ValorC], [Valor4], [CodAl], [ValorG], [Jdd], [Estado]) VALUES (N'C', 3, 3, N'Convenio Z                              ', 3.0000, 0.0000, N'                                                                                                                                                                                                        ', N'               ', N'          ', N'', 0, N'S')
INSERT [dbo].[Rtablas] ([Tipo], [Cotab], [Codigo], [Descrip], [Valor], [Valor2], [ValorC], [Valor4], [CodAl], [ValorG], [Jdd], [Estado]) VALUES (N'T', 4, 0, N'TIPO DIAS VACACIONES                    ', 0.0000, 0.0000, N'                                                                                                                                                                                                        ', N'               ', N'          ', N'', 0, N'S')
INSERT [dbo].[Rtablas] ([Tipo], [Cotab], [Codigo], [Descrip], [Valor], [Valor2], [ValorC], [Valor4], [CodAl], [ValorG], [Jdd], [Estado]) VALUES (N'C', 4, 1, N'Corridos                                ', 0.0000, 0.0000, N'                                                                                                                                                                                                        ', N'               ', N'          ', N'', 0, N'S')
INSERT [dbo].[Rtablas] ([Tipo], [Cotab], [Codigo], [Descrip], [Valor], [Valor2], [ValorC], [Valor4], [CodAl], [ValorG], [Jdd], [Estado]) VALUES (N'C', 4, 2, N'Progresivos                             ', 0.0000, 0.0000, N'                                                                                                                                                                                                        ', N'               ', N'          ', N'', 0, N'S')
INSERT [dbo].[Rtablas] ([Tipo], [Cotab], [Codigo], [Descrip], [Valor], [Valor2], [ValorC], [Valor4], [CodAl], [ValorG], [Jdd], [Estado]) VALUES (N'C', 4, 3, N'Ganados                                 ', 0.0000, 0.0000, N'                                                                                                                                                                                                        ', N'               ', N'          ', N'', 0, N'S')

/****** Object:  Default [DF__Rtablas__Tipo__60882BD5]    Script Date: 01/04/2018 18:16:33 ******/
ALTER TABLE [dbo].[Rtablas] ADD  DEFAULT (' ') FOR [Tipo]
GO
/****** Object:  Default [DF__Rtablas__Cotab__617C500E]    Script Date: 01/04/2018 18:16:33 ******/
ALTER TABLE [dbo].[Rtablas] ADD  DEFAULT ((0)) FOR [Cotab]
GO
/****** Object:  Default [DF__Rtablas__Codigo__62707447]    Script Date: 01/04/2018 18:16:33 ******/
ALTER TABLE [dbo].[Rtablas] ADD  DEFAULT ((0)) FOR [Codigo]
GO
/****** Object:  Default [DF__Rtablas__Descrip__63649880]    Script Date: 01/04/2018 18:16:33 ******/
ALTER TABLE [dbo].[Rtablas] ADD  DEFAULT (' ') FOR [Descrip]
GO
/****** Object:  Default [DF__Rtablas__Valor__6458BCB9]    Script Date: 01/04/2018 18:16:33 ******/
ALTER TABLE [dbo].[Rtablas] ADD  DEFAULT ((0)) FOR [Valor]
GO
/****** Object:  Default [DF__Rtablas__Valor2__654CE0F2]    Script Date: 01/04/2018 18:16:33 ******/
ALTER TABLE [dbo].[Rtablas] ADD  DEFAULT ((0)) FOR [Valor2]
GO
/****** Object:  Default [DF__Rtablas__ValorC__6641052B]    Script Date: 01/04/2018 18:16:33 ******/
ALTER TABLE [dbo].[Rtablas] ADD  DEFAULT (' ') FOR [ValorC]
GO
/****** Object:  Default [DF__Rtablas__Valor4__67352964]    Script Date: 01/04/2018 18:16:33 ******/
ALTER TABLE [dbo].[Rtablas] ADD  DEFAULT (' ') FOR [Valor4]
GO
/****** Object:  Default [DF__Rtablas__CodAl__68294D9D]    Script Date: 01/04/2018 18:16:33 ******/
ALTER TABLE [dbo].[Rtablas] ADD  DEFAULT (' ') FOR [CodAl]
GO
/****** Object:  Default [DF__Rtablas__ValorG__691D71D6]    Script Date: 01/04/2018 18:16:33 ******/
ALTER TABLE [dbo].[Rtablas] ADD  DEFAULT (' ') FOR [ValorG]
GO
/****** Object:  Default [DF__Rtablas__Jdd__6A11960F]    Script Date: 01/04/2018 18:16:33 ******/
ALTER TABLE [dbo].[Rtablas] ADD  DEFAULT ((0)) FOR [Jdd]
GO
/****** Object:  Default [DF__Rtablas__Estado__1452B3F5]    Script Date: 01/04/2018 18:16:33 ******/
ALTER TABLE [dbo].[Rtablas] ADD  DEFAULT ('A') FOR [Estado]
GO
