USE [master]
GO
USE [Entertainment]
GO
CREATE TABLE [dbo].[Agents](
	[Agent_ID] [varchar](5) NOT NULL,
	[Agent_F_Name] [varchar](50) NOT NULL,
	[Agent_L_Name] [varchar](50) NOT NULL,
	[Agent_Street_ Address] [varchar](50) NOT NULL,
	[Agent_City] [varchar](15) NOT NULL,
	[Agent_State] [varchar](2) NOT NULL,
	[Agent_Zip_Code] [varchar](5) NOT NULL,
	[Agent_Phone_Number] [varchar](8) NOT NULL,
	[Agent_Date_Hired] [date] NOT NULL,
	[Agent_Salary] [money] NOT NULL,
	[Agent_Commission_Rate] [decimal] NOT NULL
) ON [PRIMARY]
GO

SET ANSI_NOT NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cust_Mus_Preferences](
	[Cust_ID] [varchar](5) NOT NULL,
	[Music_Style_ID] [varchar](5) NOT NULL,
	[Cust_Mus_Preferences_Rating] [smallint] NOT NULL
) ON [PRIMARY]
GO

SET ANSI_NOT NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[Cust_ID] [varchar](5) NOT NULL,
	[Cust_F_Name] [varchar](50) NOT NULL,
	[Cust_L_Name] [varchar](50) NOT NULL,
	[Cust_Street_Address] [varchar](50) NOT NULL,
	[Cust_City] [varchar](15) NOT NULL,
	[Cust_State] [varchar](2) NOT NULL,
	[Cust_Zip_Code] [varchar](5) NOT NULL,
	[Cust_Phone_Number] [varchar](8) NOT NULL
) ON [PRIMARY]
GO

SET ANSI_NOT NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Engagements](
	[Engag_Number] [varchar](5) NOT NULL,
	[Engag_Start_Date] [date] NOT NULL,
	[Engag_End_Date] [date] NOT NULL,
	[Engag_Start_Time] [time] NOT NULL,
	[Engag_Stop_Time] [time] NOT NULL,
	[Engag_Contract_Price] [money] NOT NULL,
	[Cust_ID] [varchar](5) NOT NULL,
	[Agent_ID] [varchar](5) NOT NULL,
	[Entertainer_ID] [varchar](5) NOT NULL
) ON [PRIMARY]
GO

SET ANSI_NOT NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Entertainers](
	[Entertainer_ID] [varchar](5) NOT NULL,
	[Entertainer_Stage_Name] [varchar](50) NOT NULL,
	[Entertainer_SSN] [varchar](11) NOT NULL,
	[Entertainer_Street_Address] [varchar](50) NOT NULL,
	[Entertainer_City] [varchar](15) NOT NULL,
	[Entertainer_State] [varchar](2) NOT NULL,
	[Entertainer_Zip_Code] [varchar](5) NOT NULL,
	[Entertainer_Phone_Number] [varchar](8) NOT NULL,
	[Entertainer_Page] [varchar](50) NOT NULL,
	[Entertainer_Email] [varchar](50) NOT NULL,
	[Entertainer_Date_Entered] [date] NOT NULL
) ON [PRIMARY]
GO

SET ANSI_NOT NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Entertainers_Members](
	[Entertainer_ID] [varchar](5) NOT NULL,
	[Mbr_ID] [varchar](5) NOT NULL,
	[Entertainer_Members_Status] [smallint] NOT NULL
) ON [PRIMARY]
GO

SET ANSI_NOT NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Entertainers_Style](
	[Entertainer_ID] [varchar](5) NOT NULL,
	[Music_Style_ID] [varchar](5) NOT NULL,
	[Member_Style_Strength] [SMALLINT] NOT NULL
) ON [PRIMARY]
GO

SET ANSI_NOT NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Members](
	[Mbr_ID] [varchar](5) NOT NULL,
	[Mbr_F_Name] [varchar](50) NOT NULL,
	[Mbr_L_Name] [varchar](50) NOT NULL,
	[Mbr_Title] [varchar](5) NULL,
	[Mbr_Phone_Number] [varchar](8) NOT NULL,
	[Mbr_Gender] [varchar](1) NOT NULL
) ON [PRIMARY]
GO

SET ANSI_NOT NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Music_Style](
	[Music_Style_ID] [varchar](5) NOT NULL,
	[Music_Style_Name] [varchar](50) NOT NULL
) ON [PRIMARY]
GO
USE [master]
GO
ALTER DATABASE [Entertainment] SET  READ_WRITE 
GO
