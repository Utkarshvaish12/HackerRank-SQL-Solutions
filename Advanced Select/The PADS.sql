SELECT CONCAT(Name,'(',LEFT(Occupation,1),')')
FROM OCCUPATIONS
order by Name;

SELECT concat('There are a total of ',count(Occupation),' ',LOWER(Occupation),'s.')
from occupations
group by Occupation
order by count(Occupation), Occupation;