USE [master]
GO
CREATE DATABASE [Entertainment]
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
	[Agent_Commission_Rate] [float] NOT NULL,
	CONSTRAINT PK_Agents PRIMARY KEY (Agent_ID),
	CONSTRAINT chk_Agent_ID CHECK(SUBSTRING(Agent_ID,1,1) = 'A' AND (CAST(SUBSTRING(Agent_ID, 2,2) AS INTEGER) BETWEEN 0 AND 9999)),
	CONSTRAINT chk_Agent_State CHECK(Agent_State IN ('AL', 'AK', 'AZ', 'AR', 'CA', 'CO', 'CT', 'DE', 'DC', 'FL', 'GA',
	'HI', 'ID', 'IL', 'IN', 'IA', 'KS', 'KY', 'LA', 'ME', 'MD', 'MA', 'MI', 'MN', 'MS', 'MO', 'MT', 'NE', 'NV', 'NH',
	'NJ', 'NM', 'NY', 'NC', 'ND', 'OH', 'OK', 'OK', 'OR', 'PA', 'RI', 'SC', 'SD', 'TN', 'TX', 'UT', 'VT', 'VA', 'WA', 'WV',
	'WI', 'WY')),
	CONSTRAINT chk_Zip_Code CHECK ([Agent_Zip_Code] LIKE '[0-9][0-9][0-9][0-9][0-9]'),
	CONSTRAINT chk_Agent_Phone_Number CHECK ([Agent_Phone_Number] LIKE '[0-9][0-9][0-9]-[0-9][0-9][0-9][0-9]')
	) ON [PRIMARY]
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
	[Cust_Phone_Number] [varchar](8) NOT NULL,
	CONSTRAINT PK_Cust PRIMARY KEY (Cust_ID),
	CONSTRAINT chk_Cust_ID CHECK(SUBSTRING(Cust_ID,1,1) = 'C' AND (CAST(SUBSTRING(Cust_ID, 2,2) AS INTEGER) BETWEEN 0 AND 9999)),
	CONSTRAINT chk_Cust_State CHECK(Cust_State IN ('AL', 'AK', 'AZ', 'AR', 'CA', 'CO', 'CT', 'DE', 'DC', 'FL', 'GA',
	'HI', 'ID', 'IL', 'IN', 'IA', 'KS', 'KY', 'LA', 'ME', 'MD', 'MA', 'MI', 'MN', 'MS', 'MO', 'MT', 'NE', 'NV', 'NH',
	'NJ', 'NM', 'NY', 'NC', 'ND', 'OH', 'OK', 'OK', 'OR', 'PA', 'RI', 'SC', 'SD', 'TN', 'TX', 'UT', 'VT', 'VA', 'WA', 'WV',
	'WI', 'WY')),
	CONSTRAINT chk_Cust_Zip_Code CHECK ([Cust_Zip_Code] LIKE '[0-9][0-9][0-9][0-9][0-9]'),
	CONSTRAINT chk_Cust_Phone_Number CHECK ([Cust_Phone_Number] LIKE '[0-9][0-9][0-9]-[0-9][0-9][0-9][0-9]')
) ON [PRIMARY]
GO

SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Music_Style](
	[Music_Style_ID] [varchar](5) NOT NULL,
	[Music_Style_Name] [varchar](50) NOT NULL,
	CONSTRAINT PK_Style PRIMARY KEY (Music_Style_ID),
	CONSTRAINT chk_Style_ID CHECK(SUBSTRING(Music_Style_ID,1,1) = 'S' AND (CAST(SUBSTRING(Music_Style_ID, 2,2) AS INTEGER) BETWEEN 0 AND 9999))
) ON [PRIMARY]
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
	[Entertainer_Date_Entered] [date] NOT NULL,
	CONSTRAINT PK_Entertainer PRIMARY KEY (Entertainer_ID),
	CONSTRAINT chk_Entertainer_ID CHECK(SUBSTRING(Entertainer_ID,1,1) = 'E' AND (CAST(SUBSTRING(Entertainer_ID, 2,2) AS INTEGER) BETWEEN 0 AND 9999)),
	CONSTRAINT chk_SSN CHECK ([Entertainer_SSN] like '[0-9][0-9][0-9]-[0-9][0-9]-[0-9][0-9][0-9][0-9]'),
	CONSTRAINT chk_Entertainer_State CHECK(Entertainer_State IN ('AL', 'AK', 'AZ', 'AR', 'CA', 'CO', 'CT', 'DE', 'DC', 'FL', 'GA',
	'HI', 'ID', 'IL', 'IN', 'IA', 'KS', 'KY', 'LA', 'ME', 'MD', 'MA', 'MI', 'MN', 'MS', 'MO', 'MT', 'NE', 'NV', 'NH',
	'NJ', 'NM', 'NY', 'NC', 'ND', 'OH', 'OK', 'OK', 'OR', 'PA', 'RI', 'SC', 'SD', 'TN', 'TX', 'UT', 'VT', 'VA', 'WA', 'WV',
	'WI', 'WY')),
	CONSTRAINT chk_Entertainer_Zip_Code CHECK ([Entertainer_Zip_Code] LIKE '[0-9][0-9][0-9][0-9][0-9]'),
	CONSTRAINT chk_Entertainer_Phone_Number CHECK ([Entertainer_Phone_Number] LIKE '[0-9][0-9][0-9]-[0-9][0-9][0-9][0-9]'),
) ON [PRIMARY]
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
	CONSTRAINT PK_Member PRIMARY KEY (Mbr_ID),
	CONSTRAINT chk_Member_ID CHECK(SUBSTRING(Mbr_ID,1,1) = 'M' AND (CAST(SUBSTRING(Mbr_ID, 2,2) AS INTEGER) BETWEEN 0 AND 9999)),
	CONSTRAINT chk_Member_Phone_Number CHECK ([Mbr_Phone_Number] LIKE '[0-9][0-9][0-9]-[0-9][0-9][0-9][0-9]'),
	CONSTRAINT chk_Member_Gender CHECK(Mbr_Gender IN ('M', 'F')) 
) ON [PRIMARY]
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
	[Entertainer_ID] [varchar](5) NOT NULL,
	CONSTRAINT PK_Engag PRIMARY KEY (Engag_Number),
	CONSTRAINT FK_Cust FOREIGN KEY (Cust_ID) REFERENCES Customers(Cust_ID),
	CONSTRAINT FK_Agent FOREIGN KEY (Agent_ID) REFERENCES Agents(Agent_ID),
	CONSTRAINT FK_Entertainer FOREIGN KEY (Entertainer_ID) REFERENCES Entertainers(Entertainer_ID)
) ON [PRIMARY]
GO

--Linking Tables
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Entertainers_Members](
	[Entertainer_ID] [varchar](5) NOT NULL,
	[Mbr_ID] [varchar](5) NOT NULL,
	[Entertainer_Members_Status] [smallint] NOT NULL,
	CONSTRAINT PK_EM PRIMARY KEY CLUSTERED ([Entertainer_ID],[Mbr_ID]),
	CONSTRAINT FK_EM_Entertainer FOREIGN KEY (Entertainer_ID) REFERENCES Entertainers(Entertainer_ID),
	CONSTRAINT FK_EM_Member FOREIGN KEY (Mbr_ID) REFERENCES Members(Mbr_ID)
) ON [PRIMARY]
GO

SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Entertainers_Style](
	[Entertainer_ID] [varchar](5) NOT NULL,
	[Music_Style_ID] [varchar](5) NOT NULL,
	[Member_Style_Strength] [SMALLINT] NOT NULL,
	CONSTRAINT PK_ES PRIMARY KEY CLUSTERED ([Entertainer_ID],[Music_Style_ID]),
	CONSTRAINT FK_ES_Entertainer FOREIGN KEY (Entertainer_ID) REFERENCES Entertainers(Entertainer_ID),
	CONSTRAINT FK_ES_Style FOREIGN KEY (Music_Style_ID) REFERENCES Music_Style(Music_Style_ID)
) ON [PRIMARY]
GO

SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cust_Mus_Preferences](
	[Cust_ID] [varchar](5) NOT NULL,
	[Music_Style_ID] [varchar](5) NOT NULL,
	[Cust_Mus_Preferences_Rating] [smallint] NOT NULL
	CONSTRAINT PK_CMP PRIMARY KEY (Cust_ID,Music_Style_ID),
	CONSTRAINT FK_CMP_Cust FOREIGN KEY (Cust_ID) REFERENCES Customers(Cust_ID),
	CONSTRAINT FK_CMP_Style FOREIGN KEY (Music_Style_ID) REFERENCES Music_Style(Music_Style_ID)
) ON [PRIMARY]
GO

USE [master]
GO
ALTER DATABASE [Entertainment] SET READ_WRITE 
GO