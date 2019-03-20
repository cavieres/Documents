/****** Object:  Table [dbo].[nAndS_ImportationStatus]    Script Date: 07/01/2017 19:35:37 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[nAndS_ImportationStatus](
	[Record_type] [varchar](250) NULL,
	[CU_LAHC_ID] [varchar](250) NULL,
	[OU_Status] [varchar](250) NULL,
	[OU_NameLabel] [varchar](250) NULL,
	[Access_URL] [varchar](250) NULL,
	[External_REST_Base_URL] [varchar](250) NULL,
	[Internal_REST_Base_URL] [varchar](250) NULL,
	[Database_Name] [varchar](250) NULL,
	[Database_Host] [varchar](250) NULL,
	[Database_Port] [varchar](250) NULL,
	[Database_user] [varchar](250) NULL,
	[User_Login] [varchar](250) NOT NULL,
	[First_Name] [varchar](250) NOT NULL,
	[Last_Name] [varchar](250) NOT NULL,
	[User_Email] [varchar](250) NOT NULL,
	[Document] [varchar](250) NOT NULL,
	[Second_Document] [varchar](250) NOT NULL,
	[Company_ID] [varchar](250) NOT NULL,
	[Passaport] [varchar](250) NOT NULL,
	[Mobile_phone_number] [varchar](250) NOT NULL,
	[Notification_mode] [varchar](250) NOT NULL,
	[Language_Of_Choice] [varchar](250) NOT NULL,
	[Birth_date] [varchar](250) NOT NULL,
	[Hiring_date] [varchar](250) NOT NULL,
	[Employee_number] [varchar](250) NOT NULL,
	[Global_employee_number] [varchar](250) NOT NULL,
	[mother_name] [varchar](250) NOT NULL,
	[country_code] [varchar](250) NOT NULL,
	[Domain] [varchar](250) NOT NULL,
	[Dataset] [varchar](250) NOT NULL,
	[Expert_UserId] [varchar](250) NOT NULL,
	[CountryId] [varchar](250) NOT NULL,
	[state] [varchar](250) NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO