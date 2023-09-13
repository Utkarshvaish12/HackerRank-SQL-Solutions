SELECT temp1.hacker_id, temp1.name, SUM(temp1.score) AS total_score
FROM
   (SELECT Hackers.hacker_id, Hackers.name, Submissions.challenge_id, MAX(score) AS score
    FROM Hackers INNER JOIN Submissions ON Hackers.hacker_id = Submissions.hacker_id
    GROUP BY Hackers.name, Hackers.hacker_id, Submissions.challenge_id) AS temp1
WHERE temp1.hacker_id NOT IN
   (SELECT Hackers.hacker_id
    FROM Hackers INNER JOIN Submissions ON Hackers.hacker_id = Submissions.hacker_id
    GROUP BY Hackers.hacker_id
    HAVING SUM(Submissions.score) = 0)
GROUP BY temp1.hacker_id, temp1.name
ORDER BY total_score DESC, temp1.hacker_id ASC;