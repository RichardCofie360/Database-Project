---verifying the right data was inported
select*
from Portfolio_project.dbo.['owid-covid-data (1)$']
Where continent is not null
order by 3,4


select*
from Portfolio_project.dbo.['owid-covid-vacination$']
order by 3,4

---select data that we are going to be using
select location,date,new_cases,total_deaths,population
from Portfolio_project.dbo.['owid-covid-data (1)$']
order by 1,2

---looking at total of cases VS total death
select location,date,new_cases,total_deaths,
(total_deaths/new_cases)*100 as Death_percentage 
from Portfolio_project.dbo.['owid-covid-data (1)$']
order by 1,2

---looking at total cases VS population
---shows what population got covid
select location,date,new_cases,population,
(new_cases/population)*100 as covid_population_percentage
from Portfolio_project.dbo.['owid-covid-data (1)$']
Where continent is not null
order by 1,2

---looking at countries with the highest infection rate compared to population
select location,MAX(new_cases) as MAX_cases,population,
MAX((new_cases/population))*100 as covid_infection_rate_percentage
from Portfolio_project.dbo.['owid-covid-data (1)$']
Group by location,population
order by covid_infection_rate_percentage desc

---showing countries with the highest death count per population
Select location,Max(cast(total_deaths as int)) as MAX_death
from Portfolio_project.dbo.['owid-covid-data (1)$']
Where continent is not null
Group by location
order by MAX_death desc

---Let's break things down by continent
Select location,continent,Max(cast(total_deaths as int)) as MAX_death
from Portfolio_project.dbo.['owid-covid-data (1)$']
Where continent is not null
Group by location,continent
order by MAX_death desc

--- comparing continents
select continent,Max(cast(total_deaths as int)) as MAX_death
from Portfolio_project.dbo.['owid-covid-data (1)$']
Where continent is not null
Group by continent
order by MAX_death desc