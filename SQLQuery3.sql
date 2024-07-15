SELECT Users.DisplayName, AVG(Posts.Score) AS PromedioScore
FROM Users
JOIN Posts ON Users.Id = Posts.OwnerUserId
GROUP BY Users.DisplayName;