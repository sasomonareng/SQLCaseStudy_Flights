--Q8 Find the highest spending passenger in each frequent Flyer Status group

WITH FlyerStatus AS(
SELECT p.PassengerID, p.Name, p.FrequentFlyerStatus, SUM(t.Price) AS Total_Spend 
FROM Passengers p
JOIN Tickets t
ON p.PassengerID = t.PassengerID
GROUP BY p.PassengerID, p.Name, p.FrequentFlyerStatus
),

SpendRanking AS(
SELECT PassengerID, Name, FrequentFlyerStatus, Total_Spend, DENSE_RANK () OVER (PARTITION BY FrequentFlyerStatus ORDER BY Total_Spend DESC) AS rn 
FROM FlyerStatus 
)

SELECT PassengerID, Name, FrequentFlyerStatus, Total_Spend
FROM SpendRanking
WHERE rn = 1

