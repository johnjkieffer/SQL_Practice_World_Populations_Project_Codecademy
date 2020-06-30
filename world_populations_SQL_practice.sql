--What was the total population of each continent in 2010?
with country_population_2010 as (select *
from countries
join population_years
on countries.id = population_years.country_id
where population_years.year = 2010)

select continent, round(sum(country_population_2010.population),2) as 'Total Population 2010 (in millions)'
from country_population_2010
group by 1;
--Africa 1015.48
--Asia 4133.09
--Europe 723.06
--North America 539.79
--Oceania 34.96
--South America 396.58

--What is the average population of Poland during the time period covered by this dataset?
select count(*) as 'Number of countries with "The" in their name'
from countries
where countries.name like '% The%';
--38.56068


with poland_population as (select countries.name, population_years.population, population_years.year
from countries
join population_years
on countries.id = population_years.country_id
where countries.name = 'Poland')

select round(avg(poland_population.population),5) as 'Avg Population of Poland (in millions)'
from poland_population;

-- What country had the smallest population in 2007?
with country_populations_2007 as (select countries.name as 'Country', population_years.population, population_years.year
from countries
join population_years
on countries.id = population_years.country_id
where population_years.year = 2007)

select *
from country_populations_2007
where population is not null
order by country_populations_2007.population 
limit 1;
-- Niue: 0.00216


-- What is the average population of countries in South America is 2003?
with South_America_2003 as (select countries.name, population_years.year, population_years.population
from countries
join population_years
on countries.id = population_years.country_id
where countries.continent = 'South America'
and population_years.year = 2003)

select round(avg(population),5) as 'Average Population of a South American Country in 2003 (in millions) '
from South_America_2003;
-- 25.89065


-- What was the total population of the continent of Oceania in 2005?
with Oceania_2005 as (select countries.name, population_years.year, population_years.population
from countries
join population_years
on countries.id = population_years.country_id
where countries.continent = 'Oceania'
and population_years.year = 2005)

select round(sum(Oceania_2005.population),5) as 'Total Population of Oceania in 2005 (in millions)'
from Oceania_2005;
-- 32.66417


-- How many countries in the table are from Africa?
select count(*) as 'Number of African Countries in "Countries" Table'
from countries
where continent = 'Africa';
-- 56