# Write your MySQL query statement below
select s.student_id,s.subject,
    MIN(CASE
        WHEN s.exam_date = d.first_date THEN s.score
    END) AS first_score,
    MIN(CASE
        WHEN s.exam_date = d.latest_date THEN s.score
    END) AS latest_score
FROM Scores as s
JOIN (
    select student_id,subject,
        MIN(exam_date) AS first_date,
        MAX(exam_date) AS latest_date,
        COUNT(*) AS exam_count
    FROM Scores
    GROUP BY student_id, subject
) as d
ON s.student_id = d.student_id and s.subject = d.subject
WHERE d.exam_count >= 2
GROUP BY s.student_id, s.subject
HAVING latest_score > first_score
ORDER BY s.student_id,s.subject