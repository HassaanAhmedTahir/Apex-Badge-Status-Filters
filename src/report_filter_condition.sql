-----------------------------------------------------------------------------
-- Dynamic Filter Options
-----------------------------------------------------------------------------
WHERE (
       :P20_SQL_FILTER_OPTION = 'ALL'

    OR ( :P20_SQL_FILTER_OPTION = 'ACTIVE'
         AND EMPL_ACTIVE_YN = 'YES'
       )

    OR ( :P20_SQL_FILTER_OPTION = 'INACTIVE'
         AND EMPL_ACTIVE_YN = 'NO'
        AND EMPL_DELETED_YN = 'NO'
       )

    OR ( :P20_SQL_FILTER_OPTION = 'DELETED'
         AND EMPL_DELETED_YN = 'YES'
       )
   )
ORDER BY EMPL_CREATED DESC;
