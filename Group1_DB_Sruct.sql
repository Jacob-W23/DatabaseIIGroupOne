
USE [master]
GO

CREATE DATABASE [Doomsday]
GO
USE [Doomsday]
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Foods](
	[FoodID] [nvarchar](5) NOT NULL,
	[FoodDescription] [text] NOT NULL,
	[FoodPrice] [money] NOT NULL,
	[FoodStored] [text] NOT NULL,
	[FoodQuantity] [Int] NOT NULL,
	CONSTRAINT PK_Food PRIMARY KEY (FoodID),
	CONSTRAINT [chk_FoodID] CHECK  ((substring([FoodID],(1),(1))='F' AND 
	(CONVERT([int],substring([FoodID],(2),(2)))>=(0) AND CONVERT([int],substring([FoodID],(2),(2)))<=(9999))))
) ON [PRIMARY]
GO

SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inventory](
	[InvID] [nvarchar](5) NOT NULL,
	[InvDescription] [text] NOT NULL,
	CONSTRAINT PK_Inventory PRIMARY KEY (InvID),
	CONSTRAINT [chk_InvID] CHECK  ((substring([InvID],(1),(1))='I' AND 
	(CONVERT([int],substring([InvID],(2),(2)))>=(0) AND CONVERT([int],substring([InvID],(2),(2)))<=(9999))))
) ON [PRIMARY]
GO

SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Jobs](
	[JobID] [nvarchar](5) NOT NULL,
	[JobDescription] [varchar] (50) NOT NULL,
	[JobBasePayPerDay] [money] NOT NULL,
	CONSTRAINT PK_Job PRIMARY KEY (JobID),
	CONSTRAINT [chk_JobID] CHECK  ((substring([JobID],(1),(1))='J' AND 
	(CONVERT([int],substring([JobID],(2),(2)))>=(0) AND CONVERT([int],substring([JobID],(2),(2)))<=(9999))))
) ON [PRIMARY]
GO

SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Medicine](
	[MedicineID] [nvarchar](5) NOT NULL,
	[MedicineDescription] [text] NOT NULL,
	[MedicinePrice] [money] NOT NULL,
	[MedicineStored] [text] NOT NULL,
	[MedicineQuantity] [Int] NOT NULL,
	CONSTRAINT PK_Medicine PRIMARY KEY (MedicineID),
	CONSTRAINT [chk_MedicineID] CHECK  ((substring([MedicineID],(1),(1))='M' AND 
	(CONVERT([int],substring([MedicineID],(2),(2)))>=(0) AND CONVERT([int],substring([MedicineID],(2),(2)))<=(9999))))
) ON [PRIMARY]
GO

SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Misc](
	[MiscID] [nvarchar](5) NOT NULL,
	[MiscDescription] [text] NOT NULL,
	[MiscPrice] [money] NOT NULL,
	[MiscStored] [text] NOT NULL,
	[MiscQuantity] [Int] NOT NULL,
	CONSTRAINT PK_Misc PRIMARY KEY (MiscID),
	CONSTRAINT [chk_MiscID] CHECK  ((substring([MiscID],(1),(1))='U' AND 
	(CONVERT([int],substring([MiscID],(2),(2)))>=(0) AND CONVERT([int],substring([MiscID],(2),(2)))<=(9999))))
) ON [PRIMARY]
GO

SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Zombies](
	[ZombieID] [nvarchar](5) NOT NULL,
	[ZombieDescription] [text] NOT NULL,
	[ZombiePricePerKill] [money] NOT NULL,
	CONSTRAINT PK_Zombies PRIMARY KEY (ZombieID),
	CONSTRAINT [chk_ZombieID] CHECK  ((substring([ZombieID],(1),(1))='Z' AND 
	(CONVERT([int],substring([ZombieID],(2),(2)))>=(0) AND CONVERT([int],substring([ZombieID],(2),(2)))<=(9999))))
) ON [PRIMARY]
GO

SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Missions](
	[MissionID] [nvarchar](5) NOT NULL,
	[MissionDate] [datetime] NOT NULL,
	[MissionObjective] [text] NOT NULL,
	[ZombieID] [nvarchar](5) NOT NULL,
	[PayPerPerson] [money] NOT NULL,
	CONSTRAINT PK_MissionID PRIMARY KEY (MissionID),
	CONSTRAINT [chk_MissionID] CHECK  ((substring([MissionID],(1),(1))='Q' AND 
	(CONVERT([int],substring([MissionID],(2),(2)))>=(0) AND CONVERT([int],substring([MissionID],(2),(2)))<=(9999))))
) ON [PRIMARY]
GO

SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[People](
	[PeopleID] [nvarchar](5) NOT NULL,
	[PeopleFirstName] [nvarchar](50) NOT NULL,
	[PeopleLastName] [nvarchar](50) NOT NULL,
	[PeopleDateOfBirth] [datetime] NOT NULL,
	[AmountOfMoney] [money] NOT NULL,
	CONSTRAINT PK_People PRIMARY KEY (PeopleID),
	CONSTRAINT [chk_PeopleID] CHECK  ((substring([PeopleID],(1),(1))='P' AND 
	(CONVERT([int],substring([PeopleID],(2),(2)))>=(0) AND CONVERT([int],substring([PeopleID],(2),(2)))<=(9999))))
) ON [PRIMARY]
GO

SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PeopleJobs](
	[PeopleID] [nvarchar](5) NOT NULL,
	[JobID] [nvarchar](5) NOT NULL,
	[Wage] [money] NOT NULL,
	CONSTRAINT PK_PeopleJobs PRIMARY KEY (PeopleID, JobID)
) ON [PRIMARY]
GO

SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PeopleMissions](
	[PeopleID] [nvarchar](5) NOT NULL,
	[MissionID] [nvarchar](5) NOT NULL,
	CONSTRAINT PK_PeopleMissions PRIMARY KEY (PeopleID, MissionID)	
) ON [PRIMARY]
GO

SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PeopleSettlements](
	[PeopleID] [nvarchar](5) NOT NULL,
	[SettlementID] [nvarchar](5) NOT NULL,
	CONSTRAINT PK_PeopleSettlements PRIMARY KEY (PeopleID, SettlementID)
) ON [PRIMARY]
GO

SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SettlementInventory](
	[SettlementID] [nvarchar](5) NOT NULL,
	[InvID] [nvarchar](5) NOT NULL,
	[SetQuantity] [Int] NOT NULL,
	CONSTRAINT PK_SettlementInventory PRIMARY KEY (SettlementID, InvID)
) ON [PRIMARY]
GO

SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Settlements](
	[SettlementID] [nvarchar](5) NOT NULL,
	[SettlementLocation] [text] NOT NULL,
	[SettlementSecurityLevel] [Int] NOT NULL,
	[TypeOfHousing] [text] NOT NULL,
	CONSTRAINT PK_Settlement PRIMARY KEY (SettlementID),
	CONSTRAINT [chk_SettlementID] CHECK  ((substring([SettlementID],(1),(1))='S' AND 
	(CONVERT([int],substring([SettlementID],(2),(2)))>=(0) AND CONVERT([int],substring([SettlementID],(2),(2)))<=(9999))))
) ON [PRIMARY]
GO

SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transactions](
	[TransID] [nvarchar](5) NOT NULL,
	[PeopleID] [nvarchar](5) NOT NULL,
	[TransDateStamp] [date] NOT NULL,
	[TransTimeStamp] [time] NOT NULL,
	CONSTRAINT [chk_TransID] CHECK  ((substring([TransID],(1),(1))='T' AND
	(CONVERT([int],substring([TransID],(2),(2)))>=(0) AND CONVERT([int],substring([TransID],(2),(2)))<=(9999)))),
	CONSTRAINT PK_Transactions PRIMARY KEY (TransID),
	CONSTRAINT FK_Transactions FOREIGN KEY (TransID) REFERENCES Transactions(TransID)
) ON [PRIMARY]
GO

SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Weapons](
	[WeaponID] [nvarchar](5) NOT NULL,
	[WeaponDescription] [text] NOT NULL,
	[WeaponPrice] [money] NOT NULL,
	[WeaponStored] [text] NOT NULL,
	[WeaponQuantity] [Int] NOT NULL,
	CONSTRAINT PK_Weapons PRIMARY KEY (WeaponID),
	CONSTRAINT [chk_WeaponID] CHECK  ((substring([WeaponID],(1),(1))='W' AND 
	(CONVERT([int],substring([WeaponID],(2),(2)))>=(0) AND CONVERT([int],substring([WeaponID],(2),(2)))<=(9999))))
) ON [PRIMARY]
GO

SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vehicles](
	[VehicleID] [nvarchar](5) NOT NULL,
	[VehicleDescription] [text] NOT NULL,
	[VehiclePrice] [money] NOT NULL,
	[VehicleStored] [text] NOT NULL,
	[VehicleQuantity] [Int] NOT NULL,
	CONSTRAINT PK_Vehicles PRIMARY KEY (VehicleID),
	CONSTRAINT [chk_VehicleID] CHECK  ((substring([VehicleID],(1),(1))='V' AND 
	(CONVERT([int],substring([VehicleID],(2),(2)))>=(0) AND CONVERT([int],substring([VehicleID],(2),(2)))<=(9999))))
) ON [PRIMARY]
GO

SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TransactionDetails](
	[TransID] [nvarchar](5) NOT NULL,
	[VehicleID] [nvarchar](5) NULL,
	[MedicineID] [nvarchar](5) NULL,
	[FoodID] [nvarchar](5) NULL,
	[WeaponID] [nvarchar](5) NULL,
	[MiscID] [nvarchar](5) NULL,
	[QuantityBought] [Int] NULL,
) ON [PRIMARY]
GO

USE [master]
GO
ALTER DATABASE [Doomsday] SET  READ_WRITE 
GO