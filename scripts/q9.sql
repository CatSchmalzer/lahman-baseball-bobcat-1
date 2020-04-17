--Question 9
--Which managers have won the TSN Manager of the Year award in both the National League (NL) 
--and the American League (AL)? Give their full name and the teams that they were managing when 
--they won the award.
-- SELECT *
-- FROM awardsmanagers
-- WHERE awardid ILIKE '%TSN%';
-- --i found johnsda02 and leylaji99 just by looking at list, might be more
-- SELECT playerid, lgid, awardid, yearid
-- 	FROM awardsmanagers
-- 	WHERE awardid ILIKE '%TSN%' and yearid > 1985
-- 	ORDER BY playerid;

SELECT playerid, yearid, teamid, lgid, inseason
FROM managers
WHERE yearid > 1985
AND inseason ='1';