USE [master]
GO
/****** Object:  Database [Condos]    Script Date: 9/20/2021 4:44:58 PM ******/
CREATE DATABASE [Condos]
GO

USE [Condos]
GO
/****** Object:  Table [dbo].[au_orders]    Script Date: 9/20/2021 4:44:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[au_orders](
	[title_id] [char](3) NULL,
	[author1] [char](3) NULL,
	[author2] [char](3) NULL,
	[author3] [char](3) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[authors]    Script Date: 9/20/2021 4:44:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[authors](
	[au_id] [char](3) NOT NULL,
	[au_fname] [varchar](15) NOT NULL,
	[au_lname] [varchar](15) NOT NULL,
	[phone] [varchar](12) NULL,
	[address] [varchar](20) NULL,
	[city] [varchar](15) NULL,
	[state] [char](2) NULL,
	[zip] [char](5) NULL,
 CONSTRAINT [pk_authors] PRIMARY KEY CLUSTERED 
(
	[au_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CONDO_UNIT]    Script Date: 9/20/2021 4:44:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CONDO_UNIT](
	[CONDO_ID] [decimal](4, 0) NOT NULL,
	[LOCATION_NUM] [decimal](2, 0) NULL,
	[UNIT_NUM] [char](3) NULL,
	[SQR_FT] [decimal](5, 0) NULL,
	[BDRMS] [decimal](2, 0) NULL,
	[BATHS] [decimal](2, 0) NULL,
	[CONDO_FEE] [decimal](6, 2) NULL,
	[OWNER_NUM] [char](5) NULL,
PRIMARY KEY CLUSTERED 
(
	[CONDO_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dups]    Script Date: 9/20/2021 4:44:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dups](
	[id] [int] NULL,
	[title_name] [varchar](40) NULL,
	[type] [varchar](10) NULL,
	[price] [decimal](5, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[employees]    Script Date: 9/20/2021 4:44:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[employees](
	[emp_id] [char](3) NOT NULL,
	[emp_name] [varchar](20) NOT NULL,
	[boss_id] [char](3) NULL,
PRIMARY KEY CLUSTERED 
(
	[emp_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[empsales]    Script Date: 9/20/2021 4:44:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[empsales](
	[emp_id] [char](3) NOT NULL,
	[sales] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[emp_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[hier]    Script Date: 9/20/2021 4:44:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[hier](
	[emp_id] [char](3) NOT NULL,
	[emp_title] [varchar](20) NOT NULL,
	[boss_id] [char](3) NULL,
PRIMARY KEY CLUSTERED 
(
	[emp_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LOCATION]    Script Date: 9/20/2021 4:44:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LOCATION](
	[LOCATION_NUM] [decimal](2, 0) NOT NULL,
	[LOCATION_NAME] [char](25) NULL,
	[ADDRESS] [char](25) NULL,
	[CITY] [char](25) NULL,
	[STATE] [char](2) NULL,
	[POSTAL_CODE] [char](5) NULL,
PRIMARY KEY CLUSTERED 
(
	[LOCATION_NUM] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OWNER]    Script Date: 9/20/2021 4:44:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OWNER](
	[OWNER_NUM] [char](5) NOT NULL,
	[LAST_NAME] [char](25) NULL,
	[FIRST_NAME] [char](25) NULL,
	[ADDRESS] [char](25) NULL,
	[CITY] [char](25) NULL,
	[STATE] [char](2) NULL,
	[POSTAL_CODE] [char](5) NULL,
PRIMARY KEY CLUSTERED 
(
	[OWNER_NUM] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[publishers]    Script Date: 9/20/2021 4:44:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[publishers](
	[pub_id] [char](3) NOT NULL,
	[pub_name] [varchar](20) NOT NULL,
	[city] [varchar](15) NOT NULL,
	[state] [char](2) NULL,
	[country] [varchar](15) NOT NULL,
 CONSTRAINT [pk_publishers] PRIMARY KEY CLUSTERED 
(
	[pub_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[roadtrip]    Script Date: 9/20/2021 4:44:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[roadtrip](
	[seq] [int] NOT NULL,
	[city] [varchar](17) NOT NULL,
	[miles] [real] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[seq] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[royalties]    Script Date: 9/20/2021 4:44:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[royalties](
	[title_id] [char](3) NOT NULL,
	[advance] [decimal](9, 2) NULL,
	[royalty_rate] [decimal](5, 2) NULL,
 CONSTRAINT [pk_royalties] PRIMARY KEY CLUSTERED 
(
	[title_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SERVICE_CATEGORY]    Script Date: 9/20/2021 4:44:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SERVICE_CATEGORY](
	[CATEGORY_NUM] [decimal](4, 0) NOT NULL,
	[CATEGORY_DESCRIPTION] [char](35) NULL,
PRIMARY KEY CLUSTERED 
(
	[CATEGORY_NUM] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SERVICE_REQUEST]    Script Date: 9/20/2021 4:44:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SERVICE_REQUEST](
	[SERVICE_ID] [decimal](4, 0) NOT NULL,
	[CONDO_ID] [decimal](4, 0) NULL,
	[CATEGORY_NUM] [decimal](4, 0) NULL,
	[DESCRIPTION] [char](255) NULL,
	[STATUS] [char](255) NULL,
	[EST_HOURS] [decimal](4, 2) NULL,
	[SPENT_HOURS] [decimal](4, 2) NULL,
	[NEXT_SERVICE_DATE] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[SERVICE_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[telephones]    Script Date: 9/20/2021 4:44:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[telephones](
	[au_id] [char](3) NOT NULL,
	[tel_type] [char](1) NOT NULL,
	[tel_no] [char](12) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[au_id] ASC,
	[tel_type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[temps]    Script Date: 9/20/2021 4:44:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[temps](
	[id] [int] NOT NULL,
	[hi_temp] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[time_series]    Script Date: 9/20/2021 4:44:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[time_series](
	[seq] [int] NOT NULL,
	[price] [real] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[seq] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[title_authors]    Script Date: 9/20/2021 4:44:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[title_authors](
	[title_id] [char](3) NOT NULL,
	[au_id] [char](3) NOT NULL,
	[au_order] [smallint] NOT NULL,
	[royalty_share] [decimal](5, 2) NOT NULL,
 CONSTRAINT [pk_title_authors] PRIMARY KEY CLUSTERED 
(
	[title_id] ASC,
	[au_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[titles]    Script Date: 9/20/2021 4:44:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[titles](
	[title_id] [char](3) NOT NULL,
	[title_name] [varchar](40) NOT NULL,
	[type] [varchar](10) NULL,
	[pub_id] [char](3) NOT NULL,
	[pages] [int] NULL,
	[price] [decimal](5, 2) NULL,
	[sales] [int] NULL,
	[pubdate] [date] NULL,
	[contract] [smallint] NOT NULL,
 CONSTRAINT [pk_titles] PRIMARY KEY CLUSTERED 
(
	[title_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
USE [master]
GO
ALTER DATABASE [Condos] SET  READ_WRITE 
GO
