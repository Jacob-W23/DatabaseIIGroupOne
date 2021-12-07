CREATE DATABASE Doomsday
GO

USE Doomsday
GO


CREATE TABLE Settlements
(
	SettlementID varchar(5) NOT NULL Unique,
	SettlementLocation text NOT NULL,
	SettlementSecurityLevel tinyint NOT NULL,
	CONSTRAINT PK_SettlementID PRIMARY KEY (SettlementID)
);
GO

CREATE TABLE People
(
	PeopleID varchar(5) NOT NULL UNIQUE,
	PeopleFirstName varchar(50) NOT NULL,
	PeopleLastName varchar(50) NOT NULL,
	PeopleDateOfBirth date NOT NULL,
	CONSTRAINT PK_PeopleID PRIMARY KEY (PeopleID)
);
GO


CREATE TABLE PeopleSettlements
(
	SettlementID varchar(5),
	PeopleID varchar(5),
	CONSTRAINT PK_People_Settlement PRIMARY KEY (PeopleID, SettlementID),
	CONSTRAINT FK_SettlementID FOREIGN KEY (SettlementID) REFERENCES Settlements(SettlementID),
	CONSTRAINT FK_PeopleID FOREIGN KEY (PeopleID) REFERENCES People(PeopleID)
);
GO


CREATE TABLE Jobs
(
	JobID varchar(5) NOT NULL UNIQUE,
	JobDescription varchar(50) NOT NULL,
	JobBasePayPerDay money NOT NULL,
	CONSTRAINT PK_JobID PRIMARY KEY (JobID)
);
GO



CREATE TABLE PeopleJobs
(
	PeopleID varchar(5) NOT NULL,
	JobID varchar(5) NOT NULL,
	CONSTRAINT PK_People_Job PRIMARY KEY (PeopleID, JobID),
	CONSTRAINT FK_JobID FOREIGN KEY (JobID) REFERENCES Jobs(JobID)
);
GO

CREATE TABLE InventoryDescription
(
	InvID varchar(5) NOT NULL UNIQUE,
	InvDescription text NOT NULL,
	InvPrice money NOT NULL,
	CONSTRAINT PK_InvID PRIMARY KEY (InvID)
);
GO

CREATE TABLE SettlementInventory
(
	SettlementID varchar(5) NOT NULL,
	InvID varchar(5) NOT NULL,
	Quantity int NOT NULL,
	CONSTRAINT PK_Settlement_Inv PRIMARY KEY (SettlementID, InvID),
	CONSTRAINT FK_InvID FOREIGN KEY (InvID) REFERENCES InventoryDescription(InvID)
);
GO

CREATE TABLE Weapons
(
	WeaponID varchar(5) UNIQUE NOT NULL,
	WeaponDescription text NOT NULL,
	WeaponPrice money NOT NULL,
	CONSTRAINT PK_WeaponID PRIMARY KEY (WeaponID)
);
GO

CREATE TABLE Food
(
	FoodID varchar(5) UNIQUE NOT NULL,
	FoodDeascription text NOT NULL,
	FoodPrice money NOT NULL,
	CONSTRAINT PK_FoodID PRIMARY KEY (FoodID)
);
GO

CREATE TABLE Vehicles
(
	VehicleID varchar(5) UNIQUE NOT NULL,
	VehicleDescription text NOT NULL,
	VehiclePrice money NOT NULL,
	CONSTRAINT PK_VehicleID PRIMARY KEY (VehicleID)
);
GO

CREATE TABLE Medicine
(
	MedicineID varchar(5) UNIQUE NOT NULL,
	MedicineDescription text NOT NULL,
	MedicinePrice money NOT NULL,
	CONSTRAINT PK_MedicineID PRIMARY KEY (MedicineID)
);
GO

CREATE TABLE Housing
(
	HousingID varchar(5) UNIQUE NOT NULL,
	HousingDescription text NOT NULL,
	HousingPrice money NOT NULL,
	CONSTRAINT PK_HousingID PRIMARY KEY (HousingID)
);
GO

CREATE TABLE Transactions
(
	TransID varchar(5) UNIQUE NOT NULL,
	PeopleID varchar(5) FOREIGN KEY (PeopleID) REFERENCES People(PeopleID) NOT NULL,
	TransDateStamp date NOT NULL,
	TransTimeStamp time NOT NULL,
	CONSTRAINT PK_TransID PRIMARY KEY (TransID),
);
GO

CREATE TABLE TransactionDetails
(
	TransID varchar(5) UNIQUE NOT NULL,
	WeaponID varchar(5) FOREIGN KEY (WeaponID) REFERENCES Weapons(WeaponID),
	FoodID varchar(5) FOREIGN KEY (FoodID) REFERENCES Food(FoodID),
	VehicleID varchar(5) FOREIGN KEY (VehicleID) REFERENCES Vehicles(VehicleID),
	MedicineID varchar(5) FOREIGN KEY (MedicineID) REFERENCES Medicine(MedicineID),
	HousingID varchar(5) FOREIGN KEY (HousingID) REFERENCES Housing(HousingID),
	Quantity tinyint NOT NULL,
	CONSTRAINT FK_TransID FOREIGN KEY (TransID) REFERENCES Transactions(TransID)
);
GO

CREATE TABLE Zombies
(
	ZombieID varchar(5) UNIQUE NOT NULL,
	ZombieDescription text NOT NULL,
	ZombiePricePerKill money NOT NULL,
	CONSTRAINT PK_ZombieID PRIMARY KEY (ZombieID)
);
GO

CREATE TABLE Missions
(
	MissionID varchar(5) UNIQUE NOT NULL,
	MissionDate date NOT NULL,
	MissionObjective text NOT NULL,
	ZombieID varchar(5) FOREIGN KEY (ZombieID) REFERENCES Zombies(ZombieID)
);
GO

CREATE TABLE PeopleMissions
(
	PeopleID varchar(5) FOREIGN KEY (PeopleID) REFERENCES People(PeopleID) NOT NULL,
	MissionID varchar(5) FOREIGN KEY (MissionID) REFERENCES Missions(MissionID) NOT NULL
);
GO