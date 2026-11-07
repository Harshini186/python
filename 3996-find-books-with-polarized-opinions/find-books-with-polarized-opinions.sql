# Write your MySQL query statement below
select b.book_id,b.title,b.author,b.genre,b.pages,
    MAX(r.session_rating) - MIN(r.session_rating) as rating_spread,
    round(sum(
            case
                when r.session_rating <= 2 or r.session_rating >= 4 then 1
                else 0
            end) / COUNT(*),2) as polarization_score
from books as b
join
reading_sessions as r
on b.book_id = r.book_id
group by b.book_id,b.title,b.author,b.genre,b.pages
having count(*) >= 5 and MAX(r.session_rating) >= 4 and 
min(r.session_rating) <= 2 and polarization_score >= 0.6
order by polarization_score DESC,b.title DESC