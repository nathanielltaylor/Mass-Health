-- WRITE YOUR QUERIES HERE
-- * What 3 towns have the highest population of citizens that are 65 years and older?
select city as town, senior_pop as seniors
from town_health_record
order by senior_pop desc
limit 3;
-- * What 3 towns have the highest population of citizens that are 19 years and younger?
select city as town, minor_pop as minors
from town_health_record
order by minor_pop desc
limit 3;
-- * What 5 towns have the lowest per capita income?
select city as town, income
from town_health_record
order by income
limit 5;
-- * Omitting Boston, Becket, and Beverly, what town has the highest percentage of teen births?
select city, percent_teen_births
from town_health_record
where percent_teen_births != 'NA'
and city != 'Boston' and city != 'Becket' and city != 'Beverly'
order by percent_teen_births desc
limit 1;
-- * Omitting Boston, what town has the highest number of infant mortalities?
select city, infant_deaths
from town_health_record
where city != 'Boston'
order by infant_deaths desc
limit 1;
