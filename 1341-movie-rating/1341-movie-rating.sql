# Write your MySQL query statement below
(
    SELECT u.name as results
    FROM Users as u
    JOIN 
    MovieRating as mr
        ON u.user_id = mr.user_id
    GROUP BY u.user_id, u.name
    ORDER BY COUNT(mr.movie_id) DESC, u.name ASC
    LIMIT 1
)
UNION ALL
(
    SELECT m.title as results
    FROM Movies as m
    JOIN 
    MovieRating as mr
        ON m.movie_id = mr.movie_id
    WHERE mr.created_at >= '2020-02-01'and mr.created_at < '2020-03-01'
    GROUP BY m.movie_id, m.title
    ORDER BY AVG(mr.rating) DESC, m.title ASC
    LIMIT 1
)