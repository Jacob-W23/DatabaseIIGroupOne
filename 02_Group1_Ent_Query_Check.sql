--1. Create an agent phone list
SELECT Agent_ID, Agent_F_Name, Agent_L_Name, Agent_Phone_Number FROM Agents;

--2. Create a list of customers by city
SELECT Cust_City, Cust_F_Name, Cust_L_Name FROM Customers 
GROUP BY Cust_City, Cust_F_Name, Cust_L_Name;

--3. Create a list of when an agent received their first review (180 days after being hired)
SELECT Agent_ID, Agent_F_Name, Agent_L_Name, Agent_Date_Hired, DATEADD(day, 180, Agent_Date_Hired) as [Agent First Review Date] FROM Agents;

--4. Create a report of the net price per contract that lists our fee (contract price * our fee (12%)) and the net amount
--per contract (contract price - (contract price * our fee (12%))
SELECT (Engag_Contract_Price * 0.12) AS [Net Price], (Engag_Contract_Price-(Engag_Contract_Price * 0.12)) AS [Net Amount] FROM Engagements;

--5. Create a report of all engagements that last more than 3 days
SELECT * FROM Engagements
WHERE DATEDIFF(day, Engag_Start_Date, Engag_End_Date) > 3;

--6. Create a report of all October engagments that occured in 2017
SELECT * FROM Engagements 
WHERE Engag_Start_Date >'2017-09-30' AND Engag_Start_Date <'2017-11-01';

--7. Create a report of all October engagements that occured between noon and five pm
SELECT * FROM Engagements 
WHERE (Engag_Start_Date BETWEEN '2017-10-01' AND '2017-10-31') AND (Engag_Start_Time BETWEEN '12:00:00' AND '17:00:00');

--8. Create a list of all customers and the groups they have booked
SELECT Customers.Cust_ID, Cust_F_Name, Cust_L_Name, Entertainers.Entertainer_ID, Entertainers.Entertainer_Stage_Name FROM Customers
INNER JOIN Engagements ON Customers.Cust_ID = Engagements.Cust_ID
INNER JOIN Entertainers ON Entertainers.Entertainer_ID = Engagements.Entertainer_ID
ORDER BY Customers.Cust_ID ASC;

--9. Create a list of all agents that have no contracts
SELECT Agents.Agent_ID, Agent_F_Name, Agent_L_Name, Engag_Number AS [Contracts] FROM Agents
LEFT JOIN  Engagements ON Agents.Agent_ID = Engagements.Agent_ID
WHERE Engagements.Agent_ID IS NULL;

--10. Create a list of all customers with no bookings
SELECT Customers.Cust_ID, Cust_F_Name, Cust_L_Name, Engagements.Engag_Number AS [Booking] FROM Customers
LEFT JOIN  Engagements ON Customers.Cust_ID = Engagements.Cust_ID
WHERE Engagements.Cust_ID IS NULL;

--11. Create a list of all performers that have never been booked
SELECT Entertainers.Entertainer_ID, Entertainer_Stage_Name, Entertainer_SSN, Entertainer_Street_Address, Entertainer_City FROM Entertainers
LEFT JOIN  Engagements ON Entertainers.Entertainer_ID = Engagements.Entertainer_ID
WHERE Engagements.Cust_ID IS NULL;

--12. Create a list of each customers last booking
SELECT Customers.Cust_ID, (Cust_F_Name + ' ' + Cust_L_Name) AS [Customer], MAX(Engag_Start_Date) AS [Last Booking] FROM Customers
INNER JOIN Engagements ON Customers.Cust_ID = Engagements.Cust_ID
GROUP BY Customers.Cust_ID, (Cust_F_Name + ' ' + Cust_L_Name)
ORDER BY Customers.Cust_ID ASC;

--13. Create a list of customers who like country or country rock
SELECT Cust_Mus_Preferences.Cust_ID, Cust_F_Name, Cust_L_Name, Music_Style_Name FROM Customers
INNER JOIN Cust_Mus_Preferences ON Customers.Cust_ID = Cust_Mus_Preferences.Cust_ID
INNER JOIN Music_Style ON Cust_Mus_Preferences.Music_Style_ID = Music_Style.Music_Style_ID
WHERE Music_Style_Name = 'Country' OR Music_Style_Name = 'Country Rock' ;

--14. Create a report of the number of engagements each group has performed for us
SELECT Entertainer_ID, Count(Entertainer_ID) AS [Number of Engagements] FROM Engagements
GROUP BY Entertainer_ID;

--15. Create a report of the average agent salary
SELECT AVG(Agent_Salary) AS [Average Agent Salary] FROM Agents;

--16. Show our earliest October engagment in 2017
SELECT MIN(Engag_Start_Date) AS [Earliest October 2017 Engagment] FROM Engagements WHERE Engag_Start_Date BETWEEN '2017-10-01' AND '2017-10-31';

--17. Show the value of our October 2017 bookings
SELECT SUM(Engag_Contract_Price) AS [Value of Bookings in October 2017] FROM Engagements 
WHERE Engag_Start_Date BETWEEN '2017-10-01' AND '2017-10-31';

--18. Create a report of our agent sales and commissions. Report should have agent full name, the total contract price for that agent, and the earned commission for that agent
SELECT (Agent_F_Name + ' ' + Agent_L_Name) AS [Agent Full Name], SUM(Engagements.Engag_Contract_Price) AS [Total Contract Price], (SUM(Engagements.Engag_Contract_Price) * Agent_Commission_Rate) AS [Earned Commission] FROM Agents
INNER JOIN Engagements ON Agents.Agent_ID = Engagements.Agent_ID
GROUP BY (Agent_F_Name + ' ' + Agent_L_Name), Agent_Commission_Rate;

--19. Show only those agents who have a commission greater than $1000
SELECT Agent_ID, Agent_F_Name, Agent_L_Name, [Agent_Street_ Address] , Agent_City, Agent_State, (Agent_Salary*Agent_Commission_Rate) AS [Commission above $1000] FROM Agents
WHERE (Agent_Salary * Agent_Commission_Rate) > 1000