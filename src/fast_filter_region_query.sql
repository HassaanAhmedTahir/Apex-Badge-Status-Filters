-- =====================================================
-- EMPLOYEE KPI Overview (Soft Colors + Icons)
-- =====================================================

SELECT
    '📊 All (' || COUNT(*) || ')'        AS SUM_STATUS
  , 'ALL'                                AS SQL_FILTER_OPTION
  , 1                                    AS SORT_ORDER
  , '#6FAED9'                            AS COLOR
FROM EMPLOYEE
JOIN COMPANY ON COMP_ID = EMPL_COMP_FK

UNION ALL

SELECT
    '✅ Active (' || COUNT(*) || ')'     AS SUM_STATUS
  , 'ACTIVE'                             AS SQL_FILTER_OPTION
  , 2                                    AS SORT_ORDER
  , '#7BC6A4'                            AS COLOR
FROM EMPLOYEE
JOIN COMPANY ON COMP_ID = EMPL_COMP_FK
WHERE EMPL_ACTIVE_YN  = 'YES'
AND   EMPL_DELETED_YN = 'NO'

UNION ALL

SELECT
    '❌ Inactive (' || COUNT(*) || ')'   AS SUM_STATUS
  , 'INACTIVE'                           AS SQL_FILTER_OPTION
  , 3                                    AS SORT_ORDER
  , '#E1E1E2'                            AS COLOR
FROM EMPLOYEE
JOIN COMPANY ON COMP_ID = EMPL_COMP_FK
WHERE EMPL_ACTIVE_YN  = 'NO'
AND   EMPL_DELETED_YN = 'NO'

UNION ALL

SELECT
    '🗑️ Deleted (' || COUNT(*) || ')'    AS SUM_STATUS
  , 'DELETED'                            AS SQL_FILTER_OPTION
  , 4                                    AS SORT_ORDER
  , '#E6A8A8'                            AS COLOR
FROM EMPLOYEE
JOIN COMPANY ON COMP_ID = EMPL_COMP_FK
WHERE EMPL_DELETED_YN = 'YES'

ORDER BY SORT_ORDER ASC
