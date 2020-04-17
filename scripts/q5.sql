--Question 5
--Find the average number of strikeouts per game by decade since 1920. Round the numbers you report to 2 decimal places. Do the same for home runs per game. Do you see any trends?
select floor(yearid/10)*10 as decade, 
round(avg(hr/2),2) as avg_homerun_pergame, 
round(avg(so/2),2) as avg_strikeouts_pergame
from batting
where yearid >= 1920
group by decade;
