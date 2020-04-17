--QUESTION 3 DONE!
--Find all players in the database who played at Vanderbilt University. 
--Create a list showing each player’s first and last names as well as the total salary they earned in the major leagues. 
--Sort this list in descending order by the total salary earned. 
--Which Vanderbilt player earned the most money in the majors? David Price

WITH total_pro_salary AS (SELECT playerid, SUM(salary::text::money) as total_salary
						FROM salaries
						WHERE salary IS NOT null
						GROUP BY playerid
						ORDER BY total_salary DESC)		
SELECT DISTINCT concat(namefirst,' ', namelast) AS full_name, schoolid, total_salary
FROM people AS p
	JOIN collegeplaying AS c ON c.playerid = p.playerid
	JOIN total_pro_salary as t ON p.playerid = t.playerid
WHERE schoolid = 'vandy'
ORDER BY total_salary DESC;
