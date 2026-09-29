--Q7 Find flights with the highest price ticket sold for each route (origin -> destination)

WITH TicketPrice AS (
SELECT f.FlightID, f.Origin, a1.Name AS Departure, a2.Name AS Arrival, Destination,t.price, 
DENSE_RANK() OVER (PARTITION BY f.FlightID ORDER BY t.price DESC) AS rn
FROM Flights f
JOIN Tickets t
ON f.FlightID = t.FlightID
JOIN Airports a1
ON f.Origin = a1.AirportID
JOIN Airports a2
ON f.Destination = a2.AirportID
)

SELECT FlightID, Departure, Arrival, Price
FROM TicketPrice tp
WHERE rn = 1


