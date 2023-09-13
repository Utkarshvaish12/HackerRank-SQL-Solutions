SELECT c1.contest_id, c1.hacker_id, c1.name, SUM(sg.total_submissions), SUM(sg.total_accepted_submissions),
SUM(vg.total_views), SUM(vg.total_unique_views)
FROM Contests AS c1 
JOIN Colleges AS c2
ON c1.contest_id = c2.contest_id
JOIN Challenges AS c3 
ON c3.college_id = c2.college_id
LEFT JOIN
(SELECT ss.challenge_id, SUM(ss.total_submissions) AS total_submissions, SUM(ss.total_accepted_submissions) AS total_accepted_submissions FROM 
Submission_Stats AS ss GROUP BY ss.challenge_id) AS sg
ON c3.challenge_id = sg.challenge_id
LEFT JOIN
(SELECT vs.challenge_id, SUM(vs.total_views) AS total_views, SUM(total_unique_views) AS total_unique_views FROM View_Stats AS vs GROUP BY vs.challenge_id) AS vg
ON c3.challenge_id = vg.challenge_id
GROUP BY c1.contest_id, c1.hacker_id, c1.name
HAVING SUM(sg.total_submissions)+
       SUM(sg.total_accepted_submissions)+
       SUM(vg.total_views)+
       SUM(vg.total_unique_views) > 0
ORDER BY c1.contest_id;
