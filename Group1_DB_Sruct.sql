USE [master]
GO
CREATE DATABASE [Doomsday]
GO
USE [Doomsday]
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Foods](
	[FoodID] [nvarchar](255) NOT NULL,
	[FoodDescription] [nvarchar](255) NOT NULL,
	[FoodPrice] [money] NOT NULL,
	[Stored] [nvarchar](255) NOT NULL,
	[Quantity] [float] NOT NULL,
	CONSTRAINT PK_Food PRIMARY KEY (FoodID),
	CONSTRAINT [chk_FoodID] CHECK  ((substring([FoodID],(1),(1))='F' AND 
	(CONVERT([int],substring([FoodID],(2),(2)))>=(0) AND CONVERT([int],substring([FoodID],(2),(2)))<=(9999))))
) ON [PRIMARY]
GO

SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inventory](
	[InvID] [nvarchar](255) NOT NULL,
	[InvDescription] [nvarchar](255) NOT NULL,
	[F3] [nvarchar](255) NOT NULL,
	[F4] [nvarchar](255) NOT NULL,
	[F5] [nvarchar](255) NOT NULL,
	[F6] [money] NOT NULL,
	[F7] [nvarchar](255) NOT NULL,
	CONSTRAINT PK_Inventory PRIMARY KEY (InvID),
	CONSTRAINT [chk_InvID] CHECK  ((substring([InvID],(1),(1))='I' AND 
	(CONVERT([int],substring([InvID],(2),(2)))>=(0) AND CONVERT([int],substring([InvID],(2),(2)))<=(9999))))
) ON [PRIMARY]
GO

SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Jobs](
	[JobID] [nvarchar](255) NOT NULL,
	[JobDescription] [nvarchar](255) NOT NULL,
	[BasePay/Day] [money] NOT NULL,
	CONSTRAINT PK_Job PRIMARY KEY (JobID),
	CONSTRAINT [chk_JobID] CHECK  ((substring([JobID],(1),(1))='J' AND 
	(CONVERT([int],substring([JobID],(2),(2)))>=(0) AND CONVERT([int],substring([JobID],(2),(2)))<=(999))))
) ON [PRIMARY]
GO

SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Medicine](
	[MedicineID] [nvarchar](255) NOT NULL,
	[MedicineDescription] [nvarchar](255) NOT NULL,
	[MedicinePrice] [money] NOT NULL,
	[Stored] [nvarchar](255) NOT NULL,
	[Quantity] [float] NOT NULL,
	CONSTRAINT PK_Medicine PRIMARY KEY (MedicineID),
	CONSTRAINT [chk_MedicineID] CHECK  ((substring([MedicineID],(1),(1))='M' AND 
	(CONVERT([int],substring([MedicineID],(2),(2)))>=(0) AND CONVERT([int],substring([MedicineID],(2),(2)))<=(9999))))
) ON [PRIMARY]
GO

SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Misc](
	[MiscID] [nvarchar](255) NOT NULL,
	[MiscDescription] [nvarchar](255) NOT NULL,
	[InvPrice] [money] NOT NULL,
	[Unit] [nvarchar](255) NOT NULL,
	[Stored] [nvarchar](255) NOT NULL,
	[Quantity] [float] NOT NULL,
	CONSTRAINT PK_Misc PRIMARY KEY (MiscID),
	CONSTRAINT [chk_HousingID] CHECK  ((substring([MiscID],(1),(1))='M' AND 
	(CONVERT([int],substring([MiscID],(2),(2)))>=(0) AND CONVERT([int],substring([MiscID],(2),(2)))<=(9999))))
) ON [PRIMARY]
GO

SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Zombies](
	[ZombieID] [nvarchar](255) NOT NULL,
	[ZombieDescription] [nvarchar](255) NOT NULL,
	[ZombiePricePerKill] [money] NOT NULL,
	CONSTRAINT PK_Zombies PRIMARY KEY (ZombieID),
	CONSTRAINT [chk_ZombieID] CHECK  ((substring([ZombieID],(1),(1))='Z' AND 
	(CONVERT([int],substring([ZombieID],(2),(2)))>=(0) AND CONVERT([int],substring([ZombieID],(2),(2)))<=(9999))))
) ON [PRIMARY]
GO

SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Missions](
	[MissionID] [nvarchar](255) NOT NULL,
	[MissionDate] [datetime] NOT NULL,
	[MissionObjective] [nvarchar](255) NOT NULL,
	[ZombieID] [nvarchar](255) NOT NULL,
	[PayPerPerson] [money] NOT NULL,
	CONSTRAINT PK_MissionID PRIMARY KEY (MissionID),
	CONSTRAINT FK_Zombies FOREIGN KEY (ZombieID) REFERENCES Zombies(ZombieID),
	CONSTRAINT [chk_MissionID] CHECK  ((substring([MissionID],(1),(1))='M' AND 
	(CONVERT([int],substring([MissionID],(2),(2)))>=(0) AND CONVERT([int],substring([MissionID],(2),(2)))<=(9999))))
) ON [PRIMARY]
GO

SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[People](
	[PeopleID] [nvarchar](255) NOT NULL,
	[PeopleFirstName] [nvarchar](255) NOT NULL,
	[PeopleLastName] [nvarchar](255) NOT NULL,
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
	[PeopleID] [nvarchar](255) NOT NULL,
	[JobID] [nvarchar](255) NOT NULL,
	[Wage] [money] NOT NULL,
	CONSTRAINT PK_PeopleJobs PRIMARY KEY (PeopleID, JobID)
) ON [PRIMARY]
GO

SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PeopleMissions](
	[PeopleID] [nvarchar](255) NOT NULL,
	[MissionID] [nvarchar](255) NOT NULL,
	CONSTRAINT PK_PeopleMissions PRIMARY KEY (PeopleID, MissionID)	
) ON [PRIMARY]
GO

SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PeopleSettlements](
	[PeopleID] [nvarchar](255) NOT NULL,
	[SettlementID] [nvarchar](255) NOT NULL,
	CONSTRAINT PK_PeopleSettlements PRIMARY KEY (PeopleID, SettlementID)
) ON [PRIMARY]
GO

SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SettlementInventory](
	[SettlementID] [nvarchar](255) NOT NULL,
	[InvID] [nvarchar](255) NOT NULL,
	[Quanitity] [float] NOT NULL,
	CONSTRAINT PK_SettlementInventory PRIMARY KEY (SettlementID, InvID)
) ON [PRIMARY]
GO

SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Settlements](
	[SettlementID] [nvarchar](255) NOT NULL,
	[SettlementLocation] [nvarchar](255) NOT NULL,
	[SettlementSecurityLevel] [float] NOT NULL,
	[TypeOfHousing] [nvarchar](255) NOT NULL,
	CONSTRAINT PK_Settlement PRIMARY KEY (SettlementID),
	CONSTRAINT [chk_SettlementID] CHECK  ((substring([SettlementID],(1),(1))='S' AND 
	(CONVERT([int],substring([SettlementID],(2),(2)))>=(0) AND CONVERT([int],substring([SettlementID],(2),(2)))<=(9999))))
) ON [PRIMARY]
GO

SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transactions](
	[TransID] [nvarchar](255) NOT NULL,
	[PeopleID] [nvarchar](255) NOT NULL,
	[TransDateStamp] [datetime] NOT NULL,
	[TransTimeStamp] [float] NOT NULL,
	CONSTRAINT PK_Transaction PRIMARY KEY (TransID),
	CONSTRAINT FK_People FOREIGN KEY (PeopleID) REFERENCES People(PeopleID)
) ON [PRIMARY]
GO

SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Weapons](
	[WeaponID] [nvarchar](255) NOT NULL,
	[WeaponDescription] [nvarchar](255) NOT NULL,
	[WeaponPrice] [money] NOT NULL,
	[Stored] [nvarchar](255) NOT NULL,
	[Quantity] [float] NOT NULL,
	CONSTRAINT PK_Weapons PRIMARY KEY (WeaponID),
	CONSTRAINT [chk_WeaponID] CHECK  ((substring([WeaponID],(1),(1))='W' AND 
	(CONVERT([int],substring([WeaponID],(2),(2)))>=(0) AND CONVERT([int],substring([WeaponID],(2),(2)))<=(9999))))
) ON [PRIMARY]
GO

SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vehicles](
	[VehicleID] [nvarchar](255) NOT NULL,
	[VehicleDescription] [nvarchar](255) NOT NULL,
	[VehiclePrice] [money] NOT NULL,
	[Stored] [nvarchar](255) NOT NULL,
	[Quantity] [float] NOT NULL,
	CONSTRAINT PK_Vehicles PRIMARY KEY (VehicleID),
	CONSTRAINT [chk_VehicleID] CHECK  ((substring([VehicleID],(1),(1))='V' AND 
	(CONVERT([int],substring([VehicleID],(2),(2)))>=(0) AND CONVERT([int],substring([VehicleID],(2),(2)))<=(9999))))
) ON [PRIMARY]
GO

SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TransactionDetails](
	[TransID] [nvarchar](255) NOT NULL,
	[VehicleID] [nvarchar](255) NOT NULL,
	[MedicineID] [nvarchar](255) NOT NULL,
	[FoodID] [nvarchar](255) NOT NULL,
	[WeaponID] [nvarchar](255) NOT NULL,
	[MiscID] [nvarchar](255) NOT NULL,
	[Quantity] [float] NOT NULL,
	CONSTRAINT PK_TransactionDetails PRIMARY KEY (TransID),
	CONSTRAINT FK_Weapon FOREIGN KEY (WeaponID) REFERENCES Weapons(WeaponID),
	CONSTRAINT FK_Food FOREIGN KEY (FoodID) REFERENCES Foods(FoodID),
	CONSTRAINT FK_Vehicles FOREIGN KEY (VehicleID) REFERENCES Vehicles(VehicleID),
	CONSTRAINT FK_Medicine FOREIGN KEY (MedicineID) REFERENCES Medicine(MedicineID),
	CONSTRAINT FK_Misc FOREIGN KEY (MiscID) REFERENCES Misc(MiscID)
) ON [PRIMARY]
GO

USE [master]
GO
ALTER DATABASE [Doomsday] SET  READ_WRITE 
GO
