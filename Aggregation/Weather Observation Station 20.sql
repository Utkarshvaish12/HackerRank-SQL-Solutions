WITH M AS (
  SELECT MAX(Row_Num) AS mr
  FROM (
    SELECT ROW_NUMBER() OVER (ORDER BY LAT_N) AS Row_Num
    FROM station
  ) AS RankedData
),
RankedData AS (
  SELECT
    ROW_NUMBER() OVER (ORDER BY LAT_N) AS Row_Num,
    LAT_N
  FROM station
)

SELECT
 Round( CASE
    WHEN M.mr % 2 = 0 THEN
      (SELECT AVG(LAT_N)
       FROM RankedData
       WHERE Row_Num IN (M.mr / 2, M.mr / 2 + 1))
    WHEN M.mr % 2 != 0 THEN
      (SELECT LAT_N
       FROM RankedData
       WHERE Row_Num = (M.mr + 1) / 2)
  END ,4) AS median
FROM RankedData,M
LIMIT 1;
