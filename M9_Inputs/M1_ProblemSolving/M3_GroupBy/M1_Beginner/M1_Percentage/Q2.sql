/*

CTR (Click Through Rate)

*/

CREATE or replace TABLE Temp (
    ad_id INT,
    user_id INT,
    event_type VARCHAR(20),
    event_date DATE
);

INSERT INTO Temp VALUES
(101, 1, 'impression', '2026-01-01'),
(101, 1, 'click', '2026-01-01'),
(101, 2, 'impression', '2026-01-01'),
(101, 3, 'impression', '2026-01-01'),
(102, 4, 'impression', '2026-01-01'),
(102, 4, 'click', '2026-01-01');


SELECT
    ad_id,
    SUM(CASE WHEN event_type = 'click' THEN 1 ELSE 0 END) * 100.0 /
    SUM(CASE WHEN event_type = 'impression' THEN 1 ELSE 0 END) AS ctr_percentage
FROM Temp
GROUP BY ad_id;



SELECT
    ad_id,
    ROUND(
        SUM(CASE WHEN event_type = 'click' THEN 1 ELSE 0 END) * 100.0 /
        NULLIF(SUM(CASE WHEN event_type = 'impression' THEN 1 ELSE 0 END), 0),
        2
    ) AS ctr_percentage
FROM Temp
GROUP BY ad_id;


/* CTR Per Day (Common in Projects) */

SELECT
    ad_id,
    event_date,
    ROUND(
        SUM(CASE WHEN event_type='click' THEN 1 ELSE 0 END) * 100.0 /
        NULLIF(SUM(CASE WHEN event_type='impression' THEN 1 ELSE 0 END),0),
        2
    ) AS ctr
FROM Temp
GROUP BY ad_id, event_date;
