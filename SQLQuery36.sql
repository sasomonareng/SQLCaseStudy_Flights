--Q6 Show each passenger's first and last flight dates and number of flights

SELECT DISTINCT p.Name, MIN(f.DepartureTime) OVER (PARTITION BY t.PassengerID) AS First_Fly_Date, MAX(f.DepartureTime) OVER (PARTITION BY t.PassengerID) AS Last_Fly_Date,
COUNT(*) OVER (PARTITION BY t.PassengerID) AS Flights_Numbers 
FROM Flights f
JOIN Tickets t
ON f.FlightID = t.FlightID
JOIN Passengers p
ON t.PassengerID = p.PassengerID


WITH Planes AS (
SELECT t.PassengerID, MIN(f.DepartureTime) AS First_Fly_Date, MAX(f.ArrivalTime) AS Last_Fly_Date, COUNT(*) AS Flights_Numbers
FROM Tickets t
JOIN Flights f
ON t.FlightID = f.FlightID
GROUP BY PassengerID
)

SELECT p.Name AS Name, First_Fly_Date, Last_Fly_Date 
FROM Planes s
JOIN Passengers p
ON s.PassengerID = p.PassengerID













SELECT PassengerID, MIN(f.DepartureTime) AS First_Fly_Date, MAX(f.DepartureTime) AS Last_Fly_Date
FROM Tickets t
JOIN Flights f ON t.FlightID = f.FlightID
GROUP BY PassengerID