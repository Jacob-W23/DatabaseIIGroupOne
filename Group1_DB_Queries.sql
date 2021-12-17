--Query 1 Which people have which weapons

SELECT DISTINCT PeopleFirstName, PeopleLastName, WeaponDescription FROM People a 
INNER JOIN Transactions b ON b.PeopleID = a.PeopleID
INNER JOIN TransactionDetails c ON c.TransID = b.TransID
INNER JOIN Weapons d ON d.WeaponID = c.WeaponID

--Query 2 Which people have which jobs

SELECT DISTINCT PeopleFirstName, PeopleLastName, JobDescription FROM People a 
INNER JOIN PeopleJobs b ON b.PeopleID = a.PeopleID
INNER JOIN Jobs c ON c.JobID = b.JobID

--Query 3 Which people own which item.

SELECT DISTINCT PeopleFirstName, PeopleLastName, MiscDescription, MedicineDescription, VehicleDescription, WeaponDescription, FoodDescription FROM People a 
INNER JOIN Transactions b ON b.PeopleID = a.PeopleID
INNER JOIN TransactionDetails c ON c.TransID = b.TransID
INNER JOIN Weapons d ON d.WeaponID = c.WeaponID
INNER JOIN Food e ON e.FoodID = c.FoodID
INNER JOIN Misc f ON f.MiscID = c.MiscID
INNER JOIN Weapons g ON g.VehicleID = c.VehicleID
INNER JOIN Weapons h ON h.MedicineID = c.MedicineID

--Query 4 How many weapons in each settlement.


--Query 5 Total Number of people in each settlement. 

SELECT DISTINCT SettlementLocation, Count(PeopleID) AS NumberOfPeople FROM Settlements a 
INNER JOIN PeopleSettlements b ON b.SettlementID = a.SettlementID

--Query 6 Which people on which missions

SELECT DISTINCT PeopleFirstName, PeopleLastName, MissionObjective FROM People a
INNER JOIN PeopleMissions b ON b.PeopleID = a.PeopleID
INNER JOIN Missions c ON c.MissionID = b.MissionID

--Query 7 Which zombie on which mission

SELECT DISTINCT MissionObjective, ZombieDescription FROM Missions a 
INNER JOIN Zombies b ON b.ZombieID = a.ZombieID

--Query 8 Wage for each person

SELECT DISTINCT PeopleFirstName, PeopleLastName, Wage FROM People a 
INNER JOIN PeopleJobs b ON b.PeopleID = a.PeopleID

--Query 9 Which weapon takes which ammunition


--Query 10 Amount per item that each settlement has.


--Query 11 Types of Zombies

SELECT DISTINCT ZombieID, ZombieDescription FROM Zombies

--Query 12 Types of job

SELECT DISTINCT JobID, JobDescription, JobBasePay/Day FROM Jobs

--Query 13 Items that can be purchased

SELECT DISTINCT MedicineDescription, MiscDescription, FoodDescription, VehicleDescription, WeaponDescription FROM Medicine a
INNER JOIN TransactionDetails b ON b.MedicineID = a.MedicineID
INNER JOIN Misc c ON c.MiscID = b.MiscID
INNER JOIN Food d ON d.FoodID = b.FoodID
INNER JOIN Vehicles e ON e.VehicleID = b.VehicleID
INNER JOIN Weapons f ON f.WeaponID = b.WeaponID

--Query 14 Settlement and type of housing used

SELECT DISTINCT SettlementLocation, TypeOfHousing FROM Settlements

--Query 15 Settlement and Security Level

SELECT DISTINCT SettlementLocation, SettlementSecurityLevel FROM Settlements

--Query 16 Food and Food Price

SELECT DISTINCT FoodDescription, FoodPrice FROM Food

--Query 17 Weapons and Weapon Price

SELECT DISTINCT WeaponDescription, WeaponPrice FROM Weapons

--Query 18 Medicine and Medicine Price

SELECT DISTINCT MedicineDescription, MedicinePrice FROM Medicine

--Query 19 Vehicles and Vehicle Price

SELECT DISTINCT VehicleDescription, VehiclePrice FROM Vehicles

--Query 20 Items and Where they are stored

SELECT DISTINCT MedicineDescription, MiscDescription, FoodDescription, VehicleDescription, WeaponDescription, Stored FROM Medicine a
INNER JOIN TransactionDetails b ON b.MedicineID = a.MedicineID
INNER JOIN Misc c ON c.MiscID = b.MiscID
INNER JOIN Food d ON d.FoodID = b.FoodID
INNER JOIN Vehicles e ON e.VehicleID = b.VehicleID
INNER JOIN Weapons f ON f.WeaponID = b.WeaponID 

--Query 21 Transaction with date and time

SELECT DISTINCT TransID, PeopleID, TransDateStamp, TransTimeStamp FROM Transaction

--Query 22 Items and Quantity Available 

SELECT DISTINCT MedicineDescription, MiscDescription, FoodDescription, VehicleDescription, WeaponDescription, Quantity FROM Medicine a
INNER JOIN TransactionDetails b ON b.MedicineID = a.MedicineID
INNER JOIN Misc c ON c.MiscID = b.MiscID
INNER JOIN Food d ON d.FoodID = b.FoodID
INNER JOIN Vehicles e ON e.VehicleID = b.VehicleID
INNER JOIN Weapons f ON f.WeaponID = b.WeaponID 