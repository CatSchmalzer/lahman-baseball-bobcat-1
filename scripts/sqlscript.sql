-- Question 1
--What range of years does the provided database cover?

--Question 2
-- Find the name and height of the shortest player in the database. How many games did he play in? What is the name of the team for which he played?
-- SELECT concat(namefirst,' ', namelast), MIN(height) as shortest_player,  g_all, teamid
-- FROM people as p
-- LEFT JOIN appearances as a on a.playerid = p.playerid
-- GROUP BY teamid, g_all, namefirst, namelast
-- ORDER BY shortest_player
-- LIMIT 1;

--Question 3
-- Find all players in the database who played at Vanderbilt University. Create a list showing each player’s first and last names as well as the total salary they earned in the major leagues. Sort this list in descending order by the total salary earned. Which Vanderbilt player earned the most money in the majors?
--Please run outer query and CTE run individually to see result. CTE gets total salary by player id, and outer query gets Vandy players. How do I link them? Do I need a partition window function to sum each player's salary? :flushed:
-- WITH total_pro_salary AS (SELECT playerid, SUM(salary) as total_salary
-- 						FROM salaries
-- 						WHERE salary IS NOT null
-- 						GROUP BY playerid
-- 						ORDER BY total_salary DESC)		
-- SELECT DISTINCT concat(namefirst,' ', namelast) AS full_name, schoolid, --salary
-- FROM people AS p
-- 	INNER JOIN collegeplaying AS c ON c.playerid = p.playerid
-- 	INNER JOIN salaries ON salaries.playerid = c.playerid
-- WHERE schoolid = 'vandy'
-- ORDER BY full_name
--Question 4
-- Using the fielding table, group players into three groups based on their position: label players with position OF as "Outfield", those with position "SS", "1B", "2B", and "3B" as "Infield", and those with position "P" or "C" as "Battery". Determine the number of putouts made by each of these three groups in 2016.
-- select position_groups, count(po) as groups_putout
-- from (select distinct playerid, po, yearid,
-- 	   case when fielding.pos = 'OF' then 'outfield'
-- 	   		when fielding.pos in ('SS', '2B', '3B') then 'Infield'
-- 			when fielding.pos in ('P', 'C') then 'Battery'
-- 			end as position_groups
-- 	from fielding ) as p_groups
-- where position_groups is not null
-- and yearid = '2016'
-- group by position_groups
-- order by groups_putout desc;
--Question 5
-- Find the average number of strikeouts per game by decade since 1920. Round the numbers you report to 2 decimal places. Do the same for home runs per game. Do you see any trends?
-- select floor(yearid/10)*10 as decade, round(avg(hr),2) as avg_homerun, round(avg(so),2) as avg_strikeouts
-- 	from batting
-- 	where yearid >= 1920
-- 	group by decade;

--Question 6
-- Find the player who had the most success stealing bases in 2016, where success is measured as the percentage of stolen base attempts which are successful. (A stolen base attempt results either in a stolen base or being caught stealing.) Consider only players who attempted at least 20 stolen bases.

--Question 7
-- From 1970 – 2016, what is the largest number of wins for a team that did not win the world series? What is the smallest number of wins for a team that did win the world series? Doing this will probably result in an unusually small number of wins for a world series champion – determine why this is the case. Then redo your query, excluding the problem year. How often from 1970 – 2016 was it the case that a team with the most wins also won the world series? What percentage of the time?

--Question 8
-- Using the attendance figures from the homegames table, find the teams and parks which had the top 5 average attendance per game in 2016 (where average attendance is defined as total attendance divided by number of games). Only consider parks where there were at least 10 games played. Report the park name, team name, and average attendance. Repeat for the lowest 5 average attendance.

--Question 9
-- Which managers have won the TSN Manager of the Year award in both the National League (NL) and the American League (AL)? Give their full name and the teams that they were managing when they won the award.
-- SELECT playerid, lgid, awardid, yearid
-- 	FROM awardsmanagers
-- 	WHERE awardid ilike ‘TSN Manager of the year’
-- 	AND lgid = ‘NL’
-- 	OR lgid = ‘AL’
-- 	AND awardid Not ilike ‘BBWAA Manager of the year’
-- 	Group by awardsmanagers.playerid, awardsmanagers.lgid, awardsmanagers.awardid, yearid
-- 	order by yearid;
--I believe we can exclude everything before 1986 when it was all major league (ML) baseball and before AL and NL were created

-- Open-ended questions

--Question 10
-- Analyze all the colleges in the state of Tennessee. Which college has had the most success in the major leagues. Use whatever metric for success you like - number of players, number of games, salaries, world series wins, etc.

--Question 11
-- Is there any correlation between number of wins and team salary? Use data from 2000 and later to answer this question. As you do this analysis, keep in mind that salaries across the whole league tend to increase together, so you may want to look on a year-by-year basis.

--Question 12
-- In this question, you will explore the connection between number of wins and attendance.

--Question 13
-- Does there appear to be any correlation between attendance at home games and number of wins?
-- Do teams that win the world series see a boost in attendance the following year? What about teams that made the playoffs? Making the playoffs means either being a division winner or a wild card winner.
-- It is thought that since left-handed pitchers are more rare, causing batters to face them less often, that they are more effective. Investigate this claim and present evidence to either support or dispute this claim. First, determine just how rare left-handed pitchers are compared with right-handed pitchers. Are left-handed pitchers more likely to win the Cy Young Award? Are they more likely to make it into the hall of fame?
