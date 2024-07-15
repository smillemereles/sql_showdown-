SELECT Users.DisplayName
FROM Users
WHERE Users.Id IN (
    SELECT UserId
    FROM Comments
    GROUP BY UserId
    HAVING COUNT(*) > 100
)