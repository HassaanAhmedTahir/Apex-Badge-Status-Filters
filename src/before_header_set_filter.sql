-- =====================================================
-- PAGE 20 | Get Selected Filter Display Data
-- Process  : Before Header
-- Purpose  : Sets current filter chip label and color
-- =====================================================
BEGIN

    IF :P20_SQL_FILTER_OPTION = 'ALL' THEN

        SELECT
            '📊 All (' || COUNT(*) || ')'
          , '#6FAED9'
        INTO
            :P20_SUM_STATUS_NAME
          , :P20_SUM_STATUS_NAME_COLOR
        FROM EMPLOYEE;

    ELSIF :P20_SQL_FILTER_OPTION = 'ACTIVE' THEN

        SELECT
            '✅ Active (' || COUNT(*) || ')'
          , '#7BC6A4'
        INTO
            :P20_SUM_STATUS_NAME
          , :P20_SUM_STATUS_NAME_COLOR
        FROM EMPLOYEE
        WHERE EMPL_ACTIVE_YN  = 'YES'
        AND   EMPL_DELETED_YN = 'NO';

    ELSIF :P20_SQL_FILTER_OPTION = 'INACTIVE' THEN

        SELECT
            '❌ Inactive (' || COUNT(*) || ')'
          , '#E1E1E2'
        INTO
            :P20_SUM_STATUS_NAME
          , :P20_SUM_STATUS_NAME_COLOR
        FROM EMPLOYEE
        WHERE EMPL_ACTIVE_YN  = 'NO'
        AND   EMPL_DELETED_YN = 'NO';

    ELSIF :P20_SQL_FILTER_OPTION = 'DELETED' THEN

        SELECT
            '🗑️ Deleted (' || COUNT(*) || ')'
          , '#E6A8A8'
        INTO
            :P20_SUM_STATUS_NAME
          , :P20_SUM_STATUS_NAME_COLOR
        FROM EMPLOYEE
        WHERE EMPL_DELETED_YN = 'YES';

    ELSE
        -- Safety fallback
        :P20_SUM_STATUS_NAME       := '—';
        :P20_SUM_STATUS_NAME_COLOR := '#9CA3AF';
    END IF;

END;
