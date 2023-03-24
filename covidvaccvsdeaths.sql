select location,date, total_cases, new_cases, total_deaths,population 
from coviddeaths
order by 1,2

select * 
from covidvacc



select location,date, total_cases, total_deaths, total_cases/total_deaths
from coviddeaths
order by 1,2



select location,date, total_cases, total_deaths
from coviddeaths
where location like '%egy%'
order by 1,2



select location,date, total_cases,population, (cast(total_cases as int))/(cast(population as int))
from coviddeaths
where location like '%egy%' and continent is not null
order by 1,2





select location, max(cast(total_deaths as int)) as totadeathcount
from coviddeaths
where continent is not null
group by location
order by totadeathcount desc





select continent, max(cast(total_deaths as int)) as totadeathcount
from coviddeaths
where continent is not null
group by continent
order by totadeathcount desc



select date, sum(cast(new_cases as int)) as total_cases, sum(cast(new_deaths as int)) as total_deaths
from coviddeaths
where continent is not null
group by date
order by 1,2



select dea.continent, dea.location,dea.date, dea.population , vacc.new_vaccinations
,sum(cast(vacc.new_vaccinations as int)) over (partition by dea.location order by dea.location, dea.date) as rollingpeoplevaccinated
from coviddeaths dea join covidvacc vacc
on dea.location = vacc.location  and dea.date = vacc.date
where dea.continent is not null
order by 2,3




create view percentpeoplevaccinated as 
select dea.continent, dea.location,dea.date, dea.population , vacc.new_vaccinations
,sum(cast(vacc.new_vaccinations as int)) over (partition by dea.location order by dea.location, dea.date) as rollingpeoplevaccinated
from coviddeaths dea join covidvacc vacc
on dea.location = vacc.location  and dea.date = vacc.date
where dea.continent is not null

