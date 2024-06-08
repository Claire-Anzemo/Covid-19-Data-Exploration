select * from PortfolioProject..CovidVaccinations
ORDER BY 3,4


select * from PortfolioProject..CovidDeaths
WHERE continent is NOT NULL
ORDER BY 3,4


--Select data that we are going to be using
SELECT location,date,total_cases,new_cases,total_deaths,population
FROM PortfolioProject..CovidDeaths
ORDER BY 1,2


--Looking at Tolal Cases VS Total Deaths 
--shows the likelyhood of dying if you contract covid in your country
SELECT location,date,total_cases,total_deaths,(total_deaths/total_cases)*100 AS DeathPercentage
FROM PortfolioProject..CovidDeaths
WHERE location like '%states%'
ORDER BY 1,2


--looking at the total cases vs population
--Shows what % of population got covid
SELECT location,date,total_cases,population,(total_cases/population)*100 AS DeathPercentage
FROM PortfolioProject..CovidDeaths
WHERE location like '%states%'
ORDER BY 1,2


--Looking at countries with highest infection rate compared to population
SELECT location,MAX (total_cases) AS HighestInfectionCount,population,MAX((total_cases/population))*100 AS PercentagePopulationInfected
FROM PortfolioProject..CovidDeaths
GROUP BY population,location
--WHERE location like '%states%'
ORDER BY PercentagePopulationInfected DESC


--Showing countries with highest death count per population
SELECT location, MAX(cast(total_deaths AS int)) AS TotalDeathCount
FROM PortfolioProject..CovidDeaths
WHERE Continent is NOT NULL
GROUP BY location
--WHERE location like '%states%'
ORDER BY TotalDeathCount DESC


--GROUPING BY CONTINENT
--showing continents with highest death count
SELECT continent, MAX(cast(total_deaths AS int)) AS TotalDeathCount
FROM PortfolioProject..CovidDeaths
WHERE Continent is NOT NULL
GROUP BY continent
--WHERE location like '%states%'
ORDER BY TotalDeathCount DESC


--GLOBAL NUMBERS
SELECT  SUM(new_cases) AS totalCases,SUM(CAST(new_deaths as int)) AS TotalDeaths,SUM(CAST(new_deaths AS int))/SUM(new_cases)*100 AS DeathPercentage
FROM PortfolioProject..CovidDeaths
WHERE continent is NOT NULL 
--group by date
ORDER BY 1,2


--Looking at total population vs vaccination
SELECT Dea.continent,Dea.location,Dea.date,Dea.population ,Vac.new_vaccinations
FROM PortfolioProject..CovidDeaths Dea
JOIN PortfolioProject..CovidVaccinations Vac
     ON Dea.location = Vac.location
     AND Dea.date = Dea.date
WHERE Dea.continent IS NOT NULL
ORDER BY 1,2,3


