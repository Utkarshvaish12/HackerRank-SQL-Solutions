SELECT H.hacker_id, H.name, COUNT(C.challenge_id) as no_of_challenges
FROM Hackers H
JOIN Challenges C ON H.hacker_id = C.hacker_id
GROUP BY H.hacker_id, H.name
HAVING no_of_challenges = (SELECT count(challenge_id) AS max_count FROM Challenges GROUP BY hacker_id ORDER BY max_count DESC LIMIT 1)
OR no_of_challenges IN (SELECT t.cnt FROM (SELECT count(challenge_id) AS cnt FROM Challenges GROUP BY hacker_id) t GROUP BY t.cnt HAVING COUNT(t.cnt) = 1)
ORDER BY no_of_challenges DESC, H.hacker_id ASC;