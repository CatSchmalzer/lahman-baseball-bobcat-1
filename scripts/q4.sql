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