/*
    This view retrieves all the latest events for a booking (DELETED: 0) where a VSA has been allocated
    or the ATF has cancelled the event for billing purposes.

    This version of the view does not hardcode the schema to use
*/
CREATE OR REPLACE VIEW daily_booking_alterations AS
SELECT
    s.C_ID,
    st.STAFF_ID,
    se.STATUS,
    se.EVENT_DATE,
    se.EVENT_START,
    se.EVENT_END
FROM NGT_SITE_EVENTS se
JOIN NGT_SITE s
    ON se.SITE_ID = s.SITE_ID
JOIN NGT_STAFF st
    ON se.STAFF_ID = st.STAFF_ID
WHERE (
    (se.STATUS = 'ALLOCATED')
    OR 
    (se.CREATED BETWEEN DATE(se.EVENT_DATE - INTERVAL 6 DAY) AND DATE(se.EVENT_DATE)
    AND se.STATUS = 'ATF CANCELLED')
)
AND se.DELETED = 0
ORDER BY s.SITE_ID;
