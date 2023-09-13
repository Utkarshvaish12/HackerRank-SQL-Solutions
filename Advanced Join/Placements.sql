SELECT S.Name
FROM Students AS S
JOIN Friends AS F ON S.ID = F.ID
JOIN Packages AS P1 ON F.Friend_ID = P1.ID
JOIN Packages AS P2 ON S.ID = P2.ID
WHERE P1.Salary > P2.Salary
ORDER BY P1.Salary;
