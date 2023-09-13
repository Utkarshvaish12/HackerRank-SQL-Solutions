SELECT country.continent,floor(AVG(city.population)) AS avg_population
FROM city
JOIN country ON city.CountryCode = country.Code
GROUP BY country.continent
ORDER BY avg_population ASC;
