# Write your MySQL query statement below
select
    case
        when id % 2 = 1 and id < (SELECT MAX(id) FROM Seat) then id + 1
        when id % 2 = 0 then id - 1
        else id
    end as id,student
FROM Seat
ORDER BY id