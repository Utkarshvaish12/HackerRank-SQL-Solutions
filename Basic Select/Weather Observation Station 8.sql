SELECT CITY
FROM STATION 
WHERE LEFT(CITY,1) IN ('a','e','i','o','u')

intersect

SELECT CITY
FROM STATION 
WHERE right(CITY,1) IN ('a','e','i','o','u');
