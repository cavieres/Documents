
/****** 
Object:  Table [dbo].[RFormEsp]
Script Date: 10/08/2015 09:17:15 
Description: Re create Special Formulas Table, adding composite primary keys for: Id JDD, Item Code and Formula Code.
******/


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

-- Deleting table first.
IF EXISTS (SELECT 1 
           FROM INFORMATION_SCHEMA.TABLES 
           WHERE TABLE_NAME='rformesp')
	drop table rformesp;

-- Creating table.
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

ALTER TABLE [dbo].[RFormEsp] ADD  DEFAULT (' ') FOR [IdJdd]
GO

ALTER TABLE [dbo].[RFormEsp] ADD  DEFAULT (' ') FOR [Cohade]
GO

ALTER TABLE [dbo].[RFormEsp] ADD  DEFAULT (' ') FOR [Coform]
GO


