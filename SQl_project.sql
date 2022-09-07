select * from project.census;

select * from project.census2;

-- number of rows into our dataset

select count(*) from project.census;
select count(*) from project.census2;

-- dataset for Assam and Arunachal pradesh

select * from project.census where state in ('Assam','Arunachal pradesh');
select * from project.census where state in ('Delhi');

-- total population of india

select sum(population) as population from project.census;

-- avg growth

select state,avg(growth)*100 as avg_growth from project.census2 group by state;

-- avg sex ratio

select state,round(avg(Sex_Ratio),0) as sex_ratio from project.census2 group by state order by sex_ratio desc; 

-- avg literacy rate 

select state,round(avg(literacy),0) as avg_literacy from project.census2 
group by state having avg_literacy>65 order by avg_literacy desc;

-- top 5 state having highest growth ratio

select state,round(avg(growth)*100,0) as avg_growth from project.census2 group by state order by avg_growth desc limit 5; 

-- bottom 3 state having lowest growth rate

select state,avg(growth)*100 as avg_growth from project.census2 group by state order by avg_growth asc limit 3;

-- top 3 states showing highest sex ratio

select state,round(avg(sex_ratio),0) as avg_sexratio from project.census2 group by state order by avg_sexratio desc limit 3;

-- lowest and highest literacy rate from census data sheet 1

select min(literacy),max(literacy) from project.census;


select max(literacy), District,State from project.census2;

-- use of inner join

select census.district,census.population from project.census
inner join
project.census2 on census2.population=census.population order by district;


                                       -- VISUALISATION --


-- lowest literacy rate of 15 states from census data 1 where we have to develop the education system

select district,state,round(avg(literacy),0) as avg_literacy
from project.census group by state order by avg_literacy asc limit 15;

-- top 5 states having highest growth of population

select state,round(avg(growth)*100,0) as avg_growth 
from project.census2 group by state order by avg_growth desc limit 5; 


-- comparison of avg growth ratio, avg sex ratio and avg literacy rate from census data 2

select state, round(avg(growth)*100, 0) as avg_growth, 
round(avg(Sex_Ratio),0) as sex_ratio,round(avg(literacy),0) as avg_literacy
from project.census2 group by state;



-- top 10 districts of Arunachal pradesh having highest population along with their area and literacy rate

select district,population,area,literacy from project.census
where state='Arunachal Pradesh'
group by district
order by population desc
limit 10;


-- top 20 states of Assam with population and highest literacy rate

select district as Districts_of_Assam,area,population,literacy 
from project.census
where state='Assam'
group by district
order by literacy desc
limit 20;

-- population of each districts of Tripura along with other information
select * from project.census
where state='Tripura'
group by district
order by area desc
limit 10;

-- district of the states of india having low literacy rate

select * from project.census where project.census.Literacy in (select min(project.census.Literacy) 
from project.census group by project.census.State ) 
order by project.census.state;


