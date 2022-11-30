SET @max_id = CAST((SELECT MAX(ID) FROM NGT_SITE_EVENTS) AS UNSIGNED);
SET @row_number = 0; 
SET @first_date_offset_from_today = 0;
INSERT INTO NGT_SITE_EVENTS
(
	ID
	,SITE_EVENT_ID
	,SITE_ID
	,CMS_ORG_ID
	,SITE_TYPE
	,SKILLS_GROUP
	,EVENT_DATE
	,EVENT_START
	,EVENT_END
	,EVENT_DURATION
	,DURATIONM
	,STATUS
	,WORKFLOW_STAGE
	,P_BOOKED
	,CONFIRMED_FLAG
	,TYPE_BOOKING
	,SCHEDULED
	,STAFF_ID
	,CNX_EMAIL
	,NSE_ORDER_NUM
	,NSE_SPLIT_EVENT
	,NSE_MULTI
	,ON_CALL_COMPLETED
	,DELETED
	,CREATED
	,CREATED_BY
)
SELECT
	@max_id + pno_rownums.rownum AS ID
    ,@max_id + pno_rownums.rownum AS SITE_EVENT_ID
    ,s.ID AS SITE_ID
    ,s.ID AS CMS_ORG_ID
    ,'ATF3' AS SITE_TYPE
    ,'ANNUAL' AS SKILLS_GROUP
    ,DATE(NOW() + INTERVAL date_adjuster DAY) AS EVENT_DATE
    ,'08:00:00' AS EVENT_START
    ,'18:30:00' AS EVENT_END
    ,'10.5' AS EVENT_DURATION
	,630 AS DURATIONM
    ,'ALLOCATED' AS STATUS
    ,1.1 AS WORKFLOW_STAGE
    ,0 AS P_BOOKED
    ,0 AS CONFIRMED_FLAG
    ,'MANUAL' AS TYPE_BOOKING
    ,0 AS SCHEDULED
    ,10000002 AS STAFF_ID
    ,0 AS CNX_EMAIL
    ,CONCAT('WMSEVENT ', pno_rownums.pno) AS NSE_ORDER_NUM
    ,0 AS NSE_SPLIT_EVENT
    ,0 AS NSE_MULTI
    ,0 AS ON_CALL_COMPLETED
    ,0 AS DELETED
	,CURRENT_TIMESTAMP AS CREATED
    ,replace(pno_rownums.pno,'Z','') AS CREATED_BY
FROM (
	SELECT 
		(@row_number:=@row_number + 1) AS rownum, 
		pno,
        date_adjuster
	FROM
		(SELECT 'Z00001' AS pno UNION
			SELECT 'Z00002' AS pno UNION
			SELECT 'Z00003' AS pno UNION
			SELECT 'Z00004' AS pno UNION
			SELECT 'Z00005' AS pno UNION
			SELECT 'Z00006' AS pno UNION
			SELECT 'Z00007' AS pno UNION
			SELECT 'Z00008' AS pno UNION
			SELECT 'Z00009' AS pno UNION
			SELECT 'Z00010' AS pno UNION
			SELECT 'Z00011' AS pno UNION
			SELECT 'Z00012' AS pno UNION
			SELECT 'Z00013' AS pno UNION
			SELECT 'Z00014' AS pno UNION
			SELECT 'Z00015' AS pno UNION
			SELECT 'Z00016' AS pno UNION
			SELECT 'Z00017' AS pno UNION
			SELECT 'Z00018' AS pno UNION
			SELECT 'Z00019' AS pno UNION
			SELECT 'Z00020' AS pno
		)  pnos 
	JOIN 
		(
			SELECT @first_date_offset_from_today + 0 AS date_adjuster UNION
			SELECT @first_date_offset_from_today + 1 AS date_adjuster UNION
			SELECT @first_date_offset_from_today + 2 AS date_adjuster UNION
			SELECT @first_date_offset_from_today + 3 AS date_adjuster UNION
			SELECT @first_date_offset_from_today + 4 AS date_adjuster 
		) date_adjustments
) pno_rownums
JOIN NGT_SITE s ON pno_rownums.pno = s.C_ID

;