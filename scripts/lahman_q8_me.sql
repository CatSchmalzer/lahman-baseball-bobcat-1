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