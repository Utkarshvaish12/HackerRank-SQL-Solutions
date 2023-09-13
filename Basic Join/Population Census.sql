SELECT SUM(city.population)
FROM city
JOIN country ON city.CountryCode = country.Code
WHERE country.continent = 'Asia';
