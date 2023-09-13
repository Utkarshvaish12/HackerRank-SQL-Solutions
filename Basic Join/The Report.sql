SELECT 
    CASE WHEN g.Grade >= 8 THEN s.Name ELSE 'NULL' END AS N,
    g.Grade,
    s.Marks
FROM Students AS s
JOIN Grades as g ON s.Marks >=g.Min_Mark and s.Marks <=g.Max_Mark
order by g.Grade DESC,N ASC,s.Marks ASC; 