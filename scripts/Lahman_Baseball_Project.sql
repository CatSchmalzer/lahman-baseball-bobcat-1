--Question 1
--What range of years does the provided database cover?

SELECT DISTINCT birthyear
FROM people
ORDER BY birthyear DESC;
--Answer 1820-1996

--or this? Use max and min? Then answer is 1871-2016
SELECT max(year)
FROM homegames

--Question 2
--Find the name and height of the shortest player in the database. 
--How many games did he play in? What is the name of the team for which he played?
SELECT *
FROM appearances
LIMIT 5;

SELECT teamid, g_all, namefirst, namelast, MIN(height) as shortest_player
FROM people
LEFT JOIN appearances on appearances.playerid = people.playerid
GROUP BY teamid, g_all, namefirst, namelast
ORDER BY shortest_player
LIMIT 1;


--QUESTION 3
--Find all players in the database who played at Vanderbilt University. 
--Create a list showing each player’s first and last names as well as the total salary they earned in the major leagues. 
--Sort this list in descending order by the total salary earned. 
--Which Vanderbilt player earned the most money in the majors?

--Need to join 'people', 'collegeplaying', and 'schools' tables to get full player name and Vandy. 
--(playerid to playerid then schoolid to schoolid)
--Salary * the number of years he played. (people table: debut to final game)

SeleCT *
FROM salaries
LIMIT 5;

