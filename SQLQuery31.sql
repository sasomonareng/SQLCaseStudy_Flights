--Q1 Find the busiest airport by the number of flights take off

SELECT TOP 1 a.Name, COUNT(*) AS NumberOfFlights

FROM Flights f

JOIN Airports a 

ON f.Origin = a.AirportID

GROUP BY a.Name

Order BY NumberOfFlights DESC

