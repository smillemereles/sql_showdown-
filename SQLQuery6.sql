EXEC sp_columns 'Comments';
SELECT COUNT(*)
FROM Comments
WHERE UserId IN (
    SELECT Id FROM Users WHERE Reputation < 100
);

DELETE FROM Comments
WHERE UserId IN (
    SELECT Id FROM Users WHERE Reputation < 100
);