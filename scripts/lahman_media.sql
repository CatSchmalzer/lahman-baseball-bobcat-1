/*
--Q1 What range of years does the provided database cover?

Select min (birthyear), max(birthyear),
		min(deathyear), max(deathyear)
from people;
-- ranges from 1820-2017
*/

/*
--Q2 Find the name and height of the shortest player in the database. 
--How many games did he play in? 
--What is the name of the team for which he played?

SELECT concat(namefirst,' ', namelast), MIN(height) as short_player_inches,  g_all, teams.name
FROM people as p
LEFT JOIN appearances as a on a.playerid = p.playerid
JOIN teams ON teams.teamid = a.teamid
GROUP BY teams.name, g_all, namefirst, namelast
ORDER BY short_player_inches
LIMIT 1;
-- Eddie Gaedel, 43 inches, played 1 game, team St. Louis Browns
*/

/*
--Q4 Using the fielding table, group players into three groups based on their position: 
		--label players with position OF as "Outfield", 
		--those with position "SS", "1B", "2B", and "3B" as "Infield", 
		--and those with position "P" or "C" as "Battery". 
--Determine the number of putouts made by each of these three groups in 2016.
 
--select * from fielding;

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

-- Q7 Using the ATTENDANCE figures from the homegames table
-- find the TEAMs and PARKs which had the TOP 5 AVERAGE attendance per game in 2016 
	--(where average attendance is defined as total attendance divided by number of games). 
-- Only consider parks where there were at least 10 games played. (where park is >=10)
-- Report the park name, team name, and average attendance. 
-- Repeat for the lowest 5 average attendance.

-- Select * from homegames
select * from teams

select park, team, avg(attendance) as  avg_attendance

