SELECT procpid,
       START,
       now() - START AS lap,
       current_query
FROM (
         SELECT backendid,
                pg_stat_get_backend_pid(S.backendid)            AS procpid,
                pg_stat_get_backend_activity_start(S.backendid) AS START,
                pg_stat_get_backend_activity(S.backendid)       AS current_query
         FROM (
                  SELECT pg_stat_get_backend_idset() AS backendid
              ) AS S
     ) AS S
WHERE current_query <> '<IDLE>' and START IS NOT NULL
ORDER BY lap DESC;
