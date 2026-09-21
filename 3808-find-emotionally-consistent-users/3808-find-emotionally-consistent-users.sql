# Write your MySQL query statement below
SELECT r.user_id,r.reaction as dominant_reaction,
    ROUND(
        COUNT(*) * 1.0 / (
            SELECT COUNT(*)
            FROM reactions r2
            WHERE r2.user_id = r.user_id
        ),2) as reaction_ratio
FROM reactions as r
GROUP BY r.user_id, r.reaction
HAVING COUNT(*) >= 0.6 * (
           SELECT COUNT(*)
           FROM reactions r3
           WHERE r3.user_id = r.user_id
       )AND (
       SELECT COUNT(DISTINCT content_id)
       FROM reactions r4
       WHERE r4.user_id = r.user_id) >= 5
ORDER BY reaction_ratio DESC, r.user_id ASC