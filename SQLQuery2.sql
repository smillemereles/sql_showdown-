SELECT top 100 Posts.Title, Users.DisplayName
FROM Posts
JOIN Users ON Posts.OwnerUserId = Users.Id;