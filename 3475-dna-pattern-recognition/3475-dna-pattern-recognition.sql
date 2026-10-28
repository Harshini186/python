# Write your MySQL query statement below
select sample_id,dna_sequence,species,
    case
        when dna_sequence like 'ATG%' then 1
        else 0
    end as has_start,
    case
        when REGEXP_LIKE(dna_sequence, '(TAA|TAG|TGA)$', 'c') then 1
        else 0
    end as has_stop,
    case
        when dna_sequence like '%ATAT%' then 1
        else 0
    end as has_atat,
    case
        when dna_sequence like '%GGG%' then 1
        else 0
    end as has_ggg
from Samples
order by sample_id
