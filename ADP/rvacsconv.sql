USE [oraclear]
GO
/****** Object:  Table [dbo].[RVACSCONV]    Script Date: 01/04/2018 18:15:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RVACSCONV](
	[CodConv] [int] NOT NULL,
	[Tramo] [int] NOT NULL,
	[Dias] [int] NULL,
	[TipoDias] [int] NULL,
	[IniVigncia] [datetime] NULL,
	[FinVigncia] [datetime] NULL,
	[Jdd] [int] NOT NULL,
 CONSTRAINT [PK_VacsConv] PRIMARY KEY CLUSTERED 
(
	[CodConv] ASC,
	[Tramo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[RVACSCONV] ([CodConv], [Tramo], [Dias], [TipoDias], [IniVigncia], [FinVigncia], [Jdd]) VALUES (1, 12, 3, 3, CAST(0x0000A85B00000000 AS DateTime), CAST(0x0000A86C00000000 AS DateTime), 0)
INSERT [dbo].[RVACSCONV] ([CodConv], [Tramo], [Dias], [TipoDias], [IniVigncia], [FinVigncia], [Jdd]) VALUES (1, 13, 9, 1, CAST(0x0000A86C00000000 AS DateTime), CAST(0x0000A87400000000 AS DateTime), 0)
INSERT [dbo].[RVACSCONV] ([CodConv], [Tramo], [Dias], [TipoDias], [IniVigncia], [FinVigncia], [Jdd]) VALUES (1, 16, 9, 2, CAST(0x0000A85B00000000 AS DateTime), CAST(0x0000A86C00000000 AS DateTime), 0)
