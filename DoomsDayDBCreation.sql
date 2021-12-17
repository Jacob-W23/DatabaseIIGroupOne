CREATE DATABASE Doomsday
GO

USE Doomsday
GO


CREATE TABLE Settlements
(
	SettlementID varchar(5) NOT NULL Unique,
	SettlementLocation text NOT NULL,
	SettlementSecurityLevel tinyint NOT NULL,
	TypeOfHousing varchar(50) NOT NULL,
	CONSTRAINT PK_Settlement PRIMARY KEY (SettlementID),
	CONSTRAINT [chk_SettlementID] CHECK  ((substring([SettlementID],(1),(1))='S' AND 
	(CONVERT([int],substring([SettlementID],(2),(2)))>=(0) AND CONVERT([int],substring([SettlementID],(2),(2)))<=(9999))))
);
GO

CREATE TABLE People
(
	PeopleID varchar(5) NOT NULL UNIQUE,
	PeopleFirstName varchar(50) NOT NULL,
	PeopleLastName varchar(50) NOT NULL,
	PeopleDateOfBirth date NOT NULL,
	AmountOfMoney money NOT NULL,
	CONSTRAINT PK_People PRIMARY KEY (PeopleID),
	CONSTRAINT [chk_PeopleID] CHECK  ((substring([PeopleID],(1),(1))='P' AND 
	(CONVERT([int],substring([PeopleID],(2),(2)))>=(0) AND CONVERT([int],substring([PeopleID],(2),(2)))<=(9999))))

);
GO


CREATE TABLE PeopleSettlements
(
	PeopleID varchar(5) NOT NULL,
	SettlementID varchar(5) NOT NULL,
	CONSTRAINT PK_PeopleSettlements PRIMARY KEY (PeopleID, SettlementID)
);
GO


CREATE TABLE Jobs
(
	JobID varchar(4) NOT NULL UNIQUE,
	JobDescription varchar(50) NOT NULL,
	JobBasePayPerDay money NOT NULL,
	CONSTRAINT PK_Job PRIMARY KEY (JobID),
	CONSTRAINT [chk_JobID] CHECK  ((substring([JobID],(1),(1))='J' AND 
	(CONVERT([int],substring([JobID],(2),(2)))>=(0) AND CONVERT([int],substring([JobID],(2),(2)))<=(999))))
);
GO



CREATE TABLE PeopleJobs
(
	PeopleID varchar(5) NOT NULL,
	JobID varchar(5) NOT NULL,
	Wage money NOT NULL,
	CONSTRAINT PK_PeopleJobs PRIMARY KEY (PeopleID, JobID)
);
GO

CREATE TABLE Inventory
(
	InvID varchar(5) NOT NULL UNIQUE,
	InvDescription text NOT NULL,
	CONSTRAINT PK_Inventory PRIMARY KEY (InvID),
	CONSTRAINT [chk_InvID] CHECK  ((substring([InvID],(1),(1))='I' AND 
	(CONVERT([int],substring([InvID],(2),(2)))>=(0) AND CONVERT([int],substring([InvID],(2),(2)))<=(9999))))
);
GO

CREATE TABLE SettlementInventory
(
	SettlementID varchar(5) NOT NULL,
	InvID varchar(5) NOT NULL,
	Quantity int NOT NULL,
	CONSTRAINT PK_SettlementInventory PRIMARY KEY (SettlementID, InvID)
);
GO

CREATE TABLE Weapons
(
	WeaponID varchar(5) UNIQUE NOT NULL,
	WeaponDescription text NOT NULL,
	WeaponPrice money NOT NULL,
	CONSTRAINT PK_Weapons PRIMARY KEY (WeaponID),
	CONSTRAINT [chk_WeaponID] CHECK  ((substring([WeaponID],(1),(1))='W' AND 
	(CONVERT([int],substring([WeaponID],(2),(2)))>=(0) AND CONVERT([int],substring([WeaponID],(2),(2)))<=(9999))))
);
GO

CREATE TABLE Food
(
	FoodID varchar(5) UNIQUE NOT NULL,
	FoodDeascription text NOT NULL,
	FoodPrice money NOT NULL,
	CONSTRAINT PK_Food PRIMARY KEY (FoodID),
	CONSTRAINT [chk_FoodID] CHECK  ((substring([FoodID],(1),(1))='F' AND 
	(CONVERT([int],substring([FoodID],(2),(2)))>=(0) AND CONVERT([int],substring([FoodID],(2),(2)))<=(9999))))
);
GO

CREATE TABLE Vehicles
(
	VehicleID varchar(5) UNIQUE NOT NULL,
	VehicleDescription text NOT NULL,
	VehiclePrice money NOT NULL,
	CONSTRAINT PK_Vehicles PRIMARY KEY (VehicleID),
	CONSTRAINT [chk_VehicleID] CHECK  ((substring([VehicleID],(1),(1))='V' AND 
	(CONVERT([int],substring([VehicleID],(2),(2)))>=(0) AND CONVERT([int],substring([VehicleID],(2),(2)))<=(9999))))
);
GO

CREATE TABLE Medicine
(
	MedicineID varchar(5) UNIQUE NOT NULL,
	MedicineDescription text NOT NULL,
	MedicinePrice money NOT NULL,
	CONSTRAINT PK_Medicine PRIMARY KEY (MedicineID),
	CONSTRAINT [chk_MedicineID] CHECK  ((substring([MedicineID],(1),(1))='M' AND 
	(CONVERT([int],substring([MedicineID],(2),(2)))>=(0) AND CONVERT([int],substring([MedicineID],(2),(2)))<=(9999))))
);
GO

CREATE TABLE Misc
(
	MiscID varchar(5) UNIQUE NOT NULL,
	MiscPrice money NOT NULL,
	CONSTRAINT PK_Misc PRIMARY KEY (MiscID),
	CONSTRAINT [chk_HousingID] CHECK  ((substring([MiscID],(1),(1))='M' AND 
	(CONVERT([int],substring([MiscID],(2),(2)))>=(0) AND CONVERT([int],substring([MiscID],(2),(2)))<=(9999))))
);
GO

CREATE TABLE Transactions
(
	TransID varchar(5) UNIQUE NOT NULL,
	PeopleID varchar(5) NOT NULL,
	TransDateStamp date NOT NULL,
	TransTimeStamp time NOT NULL,
	CONSTRAINT PK_Transaction PRIMARY KEY (TransID),
	CONSTRAINT FK_People FOREIGN KEY (PeopleID) REFERENCES People(PeopleID)
);
GO

CREATE TABLE TransactionDetails
(
	TransID varchar(5) UNIQUE NOT NULL,
	WeaponID varchar(5) FOREIGN KEY (WeaponID) REFERENCES Weapons(WeaponID),
	FoodID varchar(5) FOREIGN KEY (FoodID) REFERENCES Food(FoodID),
	VehicleID varchar(5) FOREIGN KEY (VehicleID) REFERENCES Vehicles(VehicleID),
	MedicineID varchar(5) FOREIGN KEY (MedicineID) REFERENCES Medicine(MedicineID),
	MiscID varchar(5) FOREIGN KEY (MiscID) REFERENCES Misc(MiscID),
	Quantity tinyint NOT NULL,
	CONSTRAINT PK_TransactionDetails PRIMARY KEY (TransID),
	CONSTRAINT FK_Weapon FOREIGN KEY (WeaponID) REFERENCES Weapons(WeaponID),
	CONSTRAINT FK_Food FOREIGN KEY (FoodID) REFERENCES Food(FoodID),
	CONSTRAINT FK_Vehicles FOREIGN KEY (VehicleID) REFERENCES Vehicles(VehicleID),
	CONSTRAINT FK_Medicine FOREIGN KEY (MedicineID) REFERENCES Medicine(MedicineID),
	CONSTRAINT FK_Misc FOREIGN KEY (MiscID) REFERENCES Misc(MiscID)
);
GO

CREATE TABLE Zombies
(
	ZombieID varchar(5) UNIQUE NOT NULL,
	ZombieDescription text NOT NULL,
	ZombiePricePerKill money NOT NULL,
	CONSTRAINT PK_Zombies PRIMARY KEY (ZombieID),
	CONSTRAINT [chk_ZombieID] CHECK  ((substring([ZombieID],(1),(1))='Z' AND 
	(CONVERT([int],substring([ZombieID],(2),(2)))>=(0) AND CONVERT([int],substring([ZombieID],(2),(2)))<=(9999))))

);
GO

CREATE TABLE Missions
(
	MissionID varchar(5) UNIQUE NOT NULL,
	MissionDate date NOT NULL,
	MissionObjective text NOT NULL,
	ZombieID varchar(5) ,
	CONSTRAINT PK_MissionID PRIMARY KEY (MissionID),
	CONSTRAINT FK_Zombies FOREIGN KEY (ZombieID) REFERENCES Zombies(ZombieID),
	CONSTRAINT [chk_MissionID] CHECK  ((substring([MissionID],(1),(1))='M' AND 
	(CONVERT([int],substring([MissionID],(2),(2)))>=(0) AND CONVERT([int],substring([MissionID],(2),(2)))<=(9999))))
);
GO

CREATE TABLE PeopleMissions
(
	PeopleID varchar(5) NOT NULL,
	MissionID varchar(5)  NOT NULL,
	CONSTRAINT PK_PeopleMissions PRIMARY KEY (PeopleID, MissionID)	
);
GO