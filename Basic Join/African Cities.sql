select city.name
from city
Join country on CITY.CountryCode=COUNTRY.Code
where country.continent='Africa';
