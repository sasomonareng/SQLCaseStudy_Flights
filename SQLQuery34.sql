--Q4 For each airport, show the top airline by number of flights departing from there

WITH FlightRank AS (

SELECT *, RANK() OVER (PARTITION BY Origin ORDER BY Number_Of_Flights DESC) AS rn
FROM (
SELECT f.Origin, f.AirlineID, COUNT(*) AS Number_Of_Flights
FROM Flights f
GROUP BY f.Origin, f.AirlineID
	) t
)

SELECT orig.Name, a.Name, r.Number_Of_Flights 
FROM FlightRank r
JOIN Airlines a
ON r.AirlineID = a.AirlineID
JOIN Airports orig
ON r.Origin = orig.AirportID 
WHERE rn  = 1


SELECT *, RANK() OVER (PARTITION BY Origin ORDER BY Number_Of_Flights DESC) 
FROM (
SELECT f.Origin, f.AirlineID, COUNT(*) AS Number_Of_Flights
FROM Flights f
GROUP BY f.Origin, f.AirlineID
) t



  
  








































  
WITH Planes AS(
SELECT orig.Name AS Airport, a.Name AS Airline
FROM Flights f
JOIN Airlines a
ON f.AirlineID = a.AirlineID
JOIN Airports orig
ON f.Origin = orig.AirportID
--ORDER BY Airport
)
