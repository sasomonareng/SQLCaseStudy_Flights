--Q5 For each flight, show time taken in hours and categorize it as Short (<2h), Medium (2-5h), or Long (> 5h)

SELECT FlightID, DepartureTime, ArrivalTime,
CASE 
	WHEN DATEDIFF(hour, DepartureTime, ArrivalTime) < 2 THEN 'Short'
	WHEN DATEDIFF(hour, DepartureTime, ArrivalTime) BETWEEN 2 AND 5 THEN 'Medium'
	ELSE 'Long'
END AS Flight_Duration_Category
FROM Flights




