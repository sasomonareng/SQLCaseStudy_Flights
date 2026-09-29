--Q3 List all flights operated by 'Indigo' with airport names (origin and destination)

SELECT f.FlightID, a.Name, orig.Name AS OriginName, dest.Name AS DestinationName
FROM Flights f
JOIN Airports orig
ON f.Origin = orig.AirportID
JOIN Airports dest
ON f.Destination = dest.AirportID
JOIN Airlines a
ON f.AirlineID = a.AirlineID
WHERE a.name = 'IndiGo'

















