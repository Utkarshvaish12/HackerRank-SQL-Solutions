SELECT DISTINCT city
FROM station
WHERE LOWER(substr(city, 1, 1)) NOT IN ('a', 'e', 'i', 'o', 'u')
  AND LOWER(substr(city, -1, 1)) NOT IN ('a', 'e', 'i', 'o', 'u');
