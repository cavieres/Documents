/****** Object:  Table [dbo].[nAndS_UserIdByAssociateoId]    Script Date: 04/12/2016 20:28:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[nAndS_UserIdByAssociateoId](
	[ComposedKey] [varchar](256) NOT NULL,
	[AssociateoId] [varchar](256) NULL,
	[OrganizationoId] [varchar](256) NULL,
	[CompanyoId] [varchar](256) NULL,
	[UserId] [varchar](256) NULL,
	[Login] [varchar](256) NULL,
PRIMARY KEY CLUSTERED 
(
	[ComposedKey] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[nAndS_Payroll5Id2AdpId]    Script Date: 04/12/2016 20:28:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[nAndS_Payroll5Id2AdpId](
	[Payroll5Id] [varchar](256) NOT NULL,
	[AdpId] [varchar](256) NULL,
PRIMARY KEY CLUSTERED 
(
	[Payroll5Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[nAndS_OrganizationoId2DataSetByDomain]    Script Date: 04/12/2016 20:28:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[nAndS_OrganizationoId2DataSetByDomain](
	[OrganizationoId] [varchar](256) NOT NULL,
	[Domain] [varchar](256) NOT NULL,
	[Dataset] [varchar](256) NOT NULL,
 CONSTRAINT [PK_nAndS_OrganizationoId2DataSetByDomain] PRIMARY KEY CLUSTERED 
(
	[OrganizationoId] ASC,
	[Domain] ASC,
	[Dataset] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[nAndS_DatasetByCompanyoId]    Script Date: 04/12/2016 20:28:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[nAndS_DatasetByCompanyoId](
	[CompanyoId] [varchar](256) NOT NULL,
	[Domain] [varchar](256) NULL,
	[Dataset] [varchar](256) NULL,
PRIMARY KEY CLUSTERED 
(
	[CompanyoId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[nAndS_CountryId2DomainByOrganization]    Script Date: 04/12/2016 20:28:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[nAndS_CountryId2DomainByOrganization](
	[OrganizationoId] [varchar](256) NOT NULL,
	[CountryId] [char](2) NOT NULL,
	[Domain] [varchar](256) NULL,
PRIMARY KEY CLUSTERED 
(
	[OrganizationoId] ASC,
	[CountryId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[nAndS_CompanyoId2Company]    Script Date: 04/12/2016 20:28:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[nAndS_CompanyoId2Company](
	[CompanyoId] [varchar](256) NOT NULL,
	[Company] [varchar](256) NULL,
PRIMARY KEY CLUSTERED 
(
	[CompanyoId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[nAndS_CompaniesByAssociate]    Script Date: 04/12/2016 20:28:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[nAndS_CompaniesByAssociate](
	[AssociateoId] [varchar](256) NOT NULL,
	[CompanyoId] [varchar](256) NOT NULL,
	[OrganizationoId] [varchar](256) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[AssociateoId] ASC,
	[CompanyoId] ASC,
	[OrganizationoId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[nAndS_AssociateoId2UserId]    Script Date: 04/12/2016 20:28:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[nAndS_AssociateoId2UserId](
	[AssociateoId] [varchar](256) NOT NULL,
	[UserId] [varchar](256) NOT NULL,
	[Domain] [varchar](125) NOT NULL,
	[Dataset] [varchar](125) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[AssociateoId] ASC,
	[UserId] ASC,
	[Domain] ASC,
	[Dataset] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
