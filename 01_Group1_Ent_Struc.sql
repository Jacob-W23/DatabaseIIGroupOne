USE [master]
GO
USE [Entertainment]
GO
CREATE TABLE [dbo].[Agents](
	[Agent_ID] [nvarchar](255) NULL,
	[Agent_F_Name] [nvarchar](255) NULL,
	[Agent_L_Name] [nvarchar](255) NULL,
	[Agent_Street_ Address] [nvarchar](255) NULL,
	[Agent_City] [nvarchar](255) NULL,
	[Agent_State] [nvarchar](255) NULL,
	[Agent_Zip_Code] [float] NULL,
	[Agent_Phone_Number] [nvarchar](255) NULL,
	[Agent_Date_Hired] [datetime] NULL,
	[Agent_Salary] [money] NULL,
	[Agent_Commission_Rate] [float] NULL
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cust_Mus_Preferences](
	[Cust_ID] [nvarchar](255) NULL,
	[Music_Style_ID] [nvarchar](255) NULL,
	[Cust_Mus_Preferences_Rating] [float] NULL
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[Cust_ID] [nvarchar](255) NULL,
	[Cust_F_Name] [nvarchar](255) NULL,
	[Cust_L_Name] [nvarchar](255) NULL,
	[Cust_Street_Address] [nvarchar](255) NULL,
	[Cust_City] [nvarchar](255) NULL,
	[Cust_State] [nvarchar](255) NULL,
	[Cust_Zip_Code] [float] NULL,
	[Cust_Phone_Number] [nvarchar](255) NULL
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Engagements](
	[Engag_Number] [float] NULL,
	[Engag_Start_Date] [datetime] NULL,
	[Engag_End_Date] [datetime] NULL,
	[Engag_Start_Time] [datetime] NULL,
	[Engag_Stop_Time] [datetime] NULL,
	[Engag_Contract_Price] [money] NULL,
	[Cust_ID] [nvarchar](255) NULL,
	[Agent_ID] [nvarchar](255) NULL,
	[Entertainer_ID] [nvarchar](255) NULL
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Entertainers](
	[Entertainer_ID] [nvarchar](255) NULL,
	[Entertainer_Stage_Name] [nvarchar](255) NULL,
	[Entertainer_SSN] [nvarchar](255) NULL,
	[Entertainer_Street_Address] [nvarchar](255) NULL,
	[Entertainer_City] [nvarchar](255) NULL,
	[Entertainer_State] [nvarchar](255) NULL,
	[Entertainer_Zip_Code] [float] NULL,
	[Entertainer_Phone_Number] [nvarchar](255) NULL,
	[Entertainer_Page] [nvarchar](255) NULL,
	[Entertainer_Email] [nvarchar](255) NULL,
	[Entertainer_Date_Entered] [datetime] NULL
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Entertainers_Members](
	[Entertainer_ID] [nvarchar](255) NULL,
	[Mbr_ID] [nvarchar](255) NULL,
	[Entertainer_Members_Status] [float] NULL
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Entertainers_Style](
	[Entertainer_ID] [nvarchar](255) NULL,
	[Music_Style_ID] [nvarchar](255) NULL,
	[Member_Style_Strength] [float] NULL
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Members](
	[Mbr_ID] [nvarchar](255) NULL,
	[Mbr_F_Name] [nvarchar](255) NULL,
	[Mbr_L_Name] [nvarchar](255) NULL,
	[Mbr_Title] [nvarchar](255) NULL,
	[Mbr_Phone_Number] [nvarchar](255) NULL,
	[Mbr_Gender] [nvarchar](255) NULL
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Music_Style](
	[Music_Style_ID] [nvarchar](255) NULL,
	[Music_Style_Name] [nvarchar](255) NULL
) ON [PRIMARY]
GO
USE [master]
GO
ALTER DATABASE [Entertainment] SET  READ_WRITE 
GO
