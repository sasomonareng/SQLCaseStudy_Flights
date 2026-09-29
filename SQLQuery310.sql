--Q10 For each passenger, identify their most frequently used airlines. If a passenger has multiple airlines with the highest usage, 
-- show all such airlines

With AirlineFlights AS (
SELECT p.PassengerID AS PassengerID, 
    p.Name AS Passenger_Name, 
    a.Name AS Airline_Name, 
    COUNT(*) AS Number_Of_Flights_per_Passenger
FROM Flights f
JOIN Tickets t
ON t.FlightID = f.FlightID
JOIN Airlines a
ON f.AirlineID = a.AirlineID
JOIN Passengers p
ON t.PassengerID = p.PassengerID
GROUP BY p.PassengerID, p.Name, a.Name
),

FlightRankings AS (
SELECT 
    PassengerID, 
    Passenger_Name,
    Airline_Name,
    Number_Of_Flights_per_Passenger, 
    DENSE_RANK() OVER (PARTITION BY PassengerID ORDER BY Number_Of_Flights_per_Passenger DESC) AS rn
FROM AirlineFlights 
)

SELECT 
    PassengerID, 
    Passenger_Name, 
    Airline_Name,
    Number_Of_Flights_per_Passenger
FROM FlightRankings
WHERE rn = 1




















