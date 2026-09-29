--Q9 Find the total revenue and number of tickets sold for each airline, and rank the airlines based on total revenue

WITH AirlineRevenue AS(
SELECT a.Name AS Airline, SUM(t.Price) AS Revenue, COUNT(t.TicketID) AS Tickets_Sold
FROM Flights f
JOIN Tickets t
ON f.FlightID = t.FlightID
JOIN Airlines a
ON f.AirlineID = a.AirlineID
GROUP BY a.Name
)

SELECT Airline, Tickets_Sold, Revenue, DENSE_RANK() OVER (ORDER BY Revenue DESC) AS Revenue_Rankings
FROM AirlineRevenue


