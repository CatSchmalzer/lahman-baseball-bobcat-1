
--Q1 What range of years does the provided database cover?
/*
Select min (birthyear), max(birthyear),
		min(deathyear), max(deathyear)
from people;
*/
-- ranges from 1820-2017


--Q2 Find the name and height of the shortest player in the database. 
--How many games did he play in? 
--What is the name of the team for which he played?
/*
SELECT concat(namefirst,' ', namelast) as full_name, MIN(height) as short_player_inches,
		g_all as games_played, teams.name as team_name
FROM people as p
LEFT JOIN appearances as a on a.playerid = p.playerid
JOIN teams ON teams.teamid = a.teamid
GROUP BY teams.name, g_all, namefirst, namelast
ORDER BY short_player_inches
LIMIT 1;
*/
-- Eddie Gaedel, 43 inches, played 1 game, team St. Louis Browns


--Q 3 Find all players in the database who played at Vanderbilt University. 
--Create a list showing each player’s first and last names as well as the total salary they earned in the major leagues.
--Sort this list in descending order by the total salary earned. Which Vanderbilt player earned the most money in the majors?
----------------------------------------------------------------------------------------------------------------------------


--Q4 Using the fielding table, group players into three groups based on their position: 
		--label players with position OF as "Outfield", 
		--those with position "SS", "1B", "2B", and "3B" as "Infield", 
		--and those with position "P" or "C" as "Battery". 
--Determine the number of putouts made by each of these three groups in 2016.
 
--select * from fielding;
/*
select position_groups, count(po) as groups_putout
-- create a subquery for game postions 
from (select distinct playerid, po, yearid,
	   case when fielding.pos = 'OF' then 'outfield' 
	   		when fielding.pos in ('SS', '2B', '3B') then 'Infield'
			when fielding.pos in ('P', 'C') then 'Battery'
			end as position_groups
	from fielding ) as p_groups
where position_groups is not null
and yearid = '2016'
group by position_groups
order by groups_putout desc;
*/

-- Q 5 Find the average number of strikeouts per game by decade since 1920. 
--Round the numbers you report to 2 decimal places. 
--Do the same for home runs per game. Do you see any trends?
-------------------------------------------------------------------------------



--Q 6 Find the player who had the most success stealing bases in 2016,
--where success is measured as the percentage of stolen base attempts which are successful.
--(A stolen base attempt results either in a stolen base or being caught stealing.) 
--Consider only players who attempted at least 20 stolen bases. 
/*
 Select namelast, namefirst, sb, cs, (sb::numeric+cs::numeric) as total_attempts, 
 		cast(sb::numeric/(sb::numeric+cs::numeric) as decimal(5,4)) as percent_stolen
 FROM batting inner join people on batting.playerid = people.playerid
 where cs >0
 and (sb::numeric+cs::numeric) >= 20
 order by percent_stolen desc;
 */
 
-- Q 7 From 1970 – 2016, what is the largest number of wins for a team that did not win the world series? 
--What is the smallest number of wins for a team that did win the world series? 
--Doing this will probably result in an unusually small number of wins for a world series champion – determine why this is the case. 
--Then redo your query, excluding the problem year. 
--How often from 1970 – 2016 was it the case that a team with the most wins also won the world series? What percentage of the time?
------------------------------------------------------------------------------------------------------------------------------------


-- Q 8 Using the ATTENDANCE figures from the homegames table
-- find the TEAMs and PARKs which had the TOP 5 AVERAGE attendance per game in 2016 
	--(where average attendance is defined as total attendance divided by number of games). 
-- Only consider parks where there were at least 10 games played. (where park is >=10)
-- Report the park name, team name, and average attendance. 

-- Select * from homegames
--Select * from teams
--Select * from parks

-- the top 5 average attendance
/*
Select distinct ps.park_name, ts.name as team_name,  hg.attendance/hg.games as avg_attendance 
from homegames as hg
left join parks as ps on hg.park = ps.park
left join teams as ts on hg.team = ts.teamid and ts.yearid = hg.year
where hg.year = 2016 and hg.games >= 10
order by avg_attendance desc
limit 5;
*/

-- the lowest 5 average attendance
/*
Select distinct ps.park_name, ts.name as team_name,  hg.attendance/hg.games as avg_attendance 
from homegames as hg
left join parks as ps on hg.park = ps.park
left join teams as ts on hg.team = ts.teamid and ts.yearid = hg.year
where hg.year = 2016 and hg.games >= 10
order by avg_attendance asc
limit 5;
*/

-- Q 9 Which managers have won the TSN Manager of the Year award in both the National League (NL) and the American League (AL)? 
--Give their full name and the teams that they were managing when they won the award.
-----------------------------------------------------------------------------------------------------------------------------------
