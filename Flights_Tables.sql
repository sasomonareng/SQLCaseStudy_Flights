SELECT * FROM Airports
SELECT * FROM Airlines
SELECT * FROM Flights
SELECT * FROM Passengers
SELECT * FROM Tickets

SELECT * FROM Airports
SELECT * FROM Flights

SELECT a.Name, f.Origin
FROM Flights f
JOIN Airports a
ON f.Origin = a.AirportID
ORDER BY f.Origin

SELECT TOP 1 a.Name, COUNT(*) AS NumberOfFlights
FROM Flights f
JOIN Airports a
ON f.Origin = a.AirportID
GROUP BY a.Name
ORDER BY NumberOfFlights DESC


