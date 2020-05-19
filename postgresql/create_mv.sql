create materialized view mv_token_ranking as
    select token_address, count(*) as count
from token_transfers
where block_timestamp > now() - '1 months'::interval
group by token_address
order by count desc
limit 10;
-- refresh materialized view mv_token_ranking;
