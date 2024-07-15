WITH PostCounts AS (
    SELECT TOP 1000 OwnerUserId, COUNT(*) AS PostCount
    FROM Posts
    GROUP BY OwnerUserId
),
CommentCounts AS (
    SELECT TOP 1000 UserId, COUNT(*) AS CommentCount
    FROM Comments
    GROUP BY UserId
),
BadgeCounts AS (
    SELECT TOP 1000 UserId, COUNT(*) AS BadgeCount
    FROM Badges
    GROUP BY UserId
)
SELECT TOP 100
    u.DisplayName,
    ISNULL(p.PostCount, 0) AS TotalPosts,
    ISNULL(c.CommentCount, 0) AS TotalComments,
    ISNULL(b.BadgeCount, 0) AS TotalBadges
FROM Users u
LEFT JOIN PostCounts p ON u.Id = p.OwnerUserId
LEFT JOIN CommentCounts c ON u.Id = c.UserId
LEFT JOIN BadgeCounts b ON u.Id = b.UserId
ORDER BY (ISNULL(p.PostCount, 0) + ISNULL(c.CommentCount, 0) + ISNULL(b.BadgeCount, 0)) DESC