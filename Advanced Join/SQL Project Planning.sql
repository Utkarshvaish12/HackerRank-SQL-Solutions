Select Start_Date, MIN(End_Date)
From
    (Select b.Start_Date
    From Projects as a
    RIGHT Join Projects as b
    ON b.Start_Date = a.End_Date
    WHERE a.Start_Date IS NULL
    ) sd,
    (Select a.End_Date
    From Projects as a
    Left Join Projects as b
    ON b.Start_Date = a.End_Date
    WHERE b.End_Date IS NULL
    ) ed
Where Start_Date < End_Date
GROUP BY Start_Date
ORDER BY (MIN(End_Date)-Start_Date), Start_Date;