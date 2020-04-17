--Question 2
--Find the name and height of the shortest player in the database. 
	--Eddie Gaedel is shortest player in database. he was 43 inches tall or 3'7".
--How many games did he play in? What is the name of the team for which he played?
	-- He played one game for St. Louis Browns. 


SELECT concat(namefirst,' ', namelast) as full_name, MIN(height) as short_player_inches,  g_all as games_played, teams.name as team_name
FROM people as p
LEFT JOIN appearances as a on a.playerid = p.playerid
JOIN teams ON teams.teamid = a.teamid
GROUP BY teams.name, g_all, namefirst, namelast
ORDER BY short_player_inches
LIMIT 1;