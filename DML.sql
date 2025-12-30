-- Get all medal winners

SELECT a.FullName, r.Medal, e.Name AS EventName
FROM result r
JOIN athlete a ON r.AthleteID = a.AthleteID
JOIN event e ON r.EventID = e.EventID
WHERE r.Medal IS NOT NULL;

--  View ticket sales per user

SELECT u.Username, t.SeatNumber, s.Quantity, s.SaleDate
FROM sales s
JOIN users u ON s.UserID = u.UserID
JOIN ticket t ON s.TicketID = t.TicketID;

-- Medal Summary Per Country with Athlete Names

SELECT 
    n.country,
    a.FullName AS Athlete,
    e.Name AS Event,
    r.Medal
FROM result r
JOIN athlete a ON r.AthleteID = a.AthleteID
JOIN national_olympic_committees n ON a.NOC_ID = n.NOC_ID
JOIN event e ON r.EventID = e.EventID
WHERE r.Medal IS NOT NULL
ORDER BY n.country, r.Medal DESC;

-- Total Medals by Country with Aggregation
SELECT 
    n.country,
    SUM(CASE WHEN r.Medal = 'Gold' THEN 1 ELSE 0 END) AS Golds,
    SUM(CASE WHEN r.Medal = 'Silver' THEN 1 ELSE 0 END) AS Silvers,
    SUM(CASE WHEN r.Medal = 'Bronze' THEN 1 ELSE 0 END) AS Bronzes,
    COUNT(r.Medal) AS Total
FROM national_olympic_committees  n
LEFT JOIN athlete a ON a.NOC_ID = n.NOC_ID
LEFT JOIN result r ON a.AthleteID = r.AthleteID
GROUP BY n.country
ORDER BY Golds DESC, Silvers DESC, Bronzes DESC








