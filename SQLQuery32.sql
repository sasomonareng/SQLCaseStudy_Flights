--Q2 Total number of tickets sold per airline

SELECT a.Name AS Airline, COUNT(*) AS TicketSold
FROM Flights f
JOIN Airlines a
ON f.AirlineID  = a.AirlineID
JOIN Tickets t
ON f.FlightID = t.FlightID
GROUP BY a.Name
ORDER BY TicketSold DESC
