--SELECT  basics
--1
SELECT population FROM world
  WHERE name = 'Germany';

--2
SELECT name, population FROM world
  WHERE name IN ('Sweden', 'Norway', 'Denmark');

--3
SELECT name, area FROM world
  WHERE area BETWEEN 200000 AND 250000;

--SELECT names
--1
SELECT name FROM world
  WHERE name LIKE 'Y%';

--2
SELECT name FROM world
  WHERE name LIKE '%Y';

--3
SELECT name FROM world
  WHERE name LIKE '%X%';

--4
SELECT name FROM world
  WHERE name LIKE '%land';

--5
SELECT name FROM world
  WHERE name LIKE 'c%ia';

--6
SELECT name FROM world
  WHERE name LIKE '%oo%';

--7
SELECT name FROM world
  WHERE name LIKE '%a%a%a%';

--8
SELECT name FROM world
 WHERE name LIKE '_t%'
ORDER BY name;

--9
SELECT name FROM world
 WHERE name LIKE '%o__o%';

--10
SELECT name FROM world
 WHERE name LIKE '____';

--11
SELECT name
  FROM world
 WHERE name = capital;

--12
SELECT name
  FROM world
 WHERE concat(name, ' City') = Capital;

--13
SELECT capital, name
FROM world
WHERE capital like concat('%', name, '%');

--14
SELECT capital, name
FROM world
WHERE capital like concat('%', name, '%') AND len(capital) > len(name);

--15
SELECT name, REPLACE(capital, name, '') FROM world
WHERE capital like concat(name, '%')AND len(capital) > len(name);

--SELECT form WORLD Tutorial

--1
SELECT name, continent, population FROM world;

--2
SELECT name
  FROM world
 WHERE population >= 200000000;

 --3
SELECT name, gdp/population
  FROM world
 WHERE population >= 200000000;

 --4
 SELECT name, population/1000000 FROM world
WHERE continent LIKE 'South America';

--5
SELECT name, population FROM world
  WHERE name IN ('France', 'Germany', 'Italy');

--6
SELECT name FROM world
WHERE name LIKE 'United%';

--7
SELECT name, population, area FROM world
WHERE population > 250000000 OR area > 3000000;

--8
SELECT name, population, area FROM world
WHERE (area > 3000000 AND population < 250000000)
    OR (area < 3000000 AND population > 250000000);

--9
SELECT name, ROUND(population/1000000, 2), ROUND(gdp/1000000000, 2) FROM world;
WHERE continent LIKE 'South America';

--10
SELECT name, ROUND(gdp/population, -3) FROM  world
WHERE gdp >= 1000000000000;

--11
SELECT name, capital
  FROM world
 WHERE LEN(name) = LEN(capital);

--12
SELECT name, capital
FROM world
WHERE capital LIKE concat(LEFT(name,1), '%') AND capital <> name;

SELECT name
   FROM world
WHERE name LIKE '%a%'
  AND name LIKE '%e%'
  AND name LIKE '%i%'
  AND name LIKE '%o%'
  AND name LIKE '%u%'
  AND name NOT LIKE '% %';

--SELECT from Nobel Tutorial
--1
SELECT yr, subject, winner
  FROM nobel
 WHERE yr = 1950;

--2
SELECT winner
  FROM nobel
 WHERE yr = 1962
   AND subject = 'Literature';

--3
SELECT yr, subject FROM nobel
WHERE winner = 'Albert Einstein';

--4
SELECT winner FROM nobel
WHERE yr >= 2000 and subject = 'Peace';

--5
SELECT * FROM nobel
WHERE yr >= 1980 
AND yr <= 1989 
AND subject = 'Literature';

--6
SELECT * FROM nobel
 WHERE winner IN ('Theodore Roosevelt',
                  'Woodrow Wilson',
                  'Jimmy Carter', 'Barack Obama');

--7
SELECT winner FROM nobel
WHERE winner LIKE 'John%';

--8
SELECT * FROM nobel
WHERE (yr = 1980 AND subject LIKE 'Physics')
OR (yr = 1984 AND subject LIKE 'Chemistry');

--9
SELECT * FROM nobel
WHERE yr = 1980 
AND subject NOT LIKE 'Chemistry'
AND subject NOT LIKE 'Medicine';

--10
SELECT * FROM nobel
WHERE (subject LIKE 'Medicine' AND yr < 1910)
OR (subject LIKE 'Literature' AND yr >= 2004);

--11
SELECT * FROM nobel
WHERE winner LIKE 'PETER GRÜNBERG';

--12
SELECT * FROM nobel
WHERE winner = 'EUGENE O''NEILL';

--13
SELECT winner, yr, subject FROM nobel
WHERE winner LIKE 'Sir%'
ORDER BY -yr

SELECT winner, subject
FROM nobel
WHERE yr=1984
ORDER BY subject IN ('Physics','Chemistry'), subject,winner

--SELECT within SELECT Tutorial
--1
SELECT name FROM world
  WHERE population >
     (SELECT population FROM world
      WHERE name='Russia');

--2
SELECT name FROM world
  WHERE gdp/population > (SELECT gdp/population FROM world
                          WHERE name = 'United Kingdom')
  AND continent = 'Europe';

--3
SELECT name, continent FROM world 
WHERE continent = (SELECT continent FROM world WHERE name = 'Argentina') 
OR continent = (SELECT continent FROM world WHERE name = 'Australia');

--4
SELECT name, population FROM world
WHERE (population > (SELECT population FROM world WHERE name = 'Canada'))
AND (population < (SELECT population FROM world WHERE name = 'Poland'));

--5
SELECT name,REPLACE(CONCAT( ROUND(population/(SELECT population FROM world WHERE name='Germany')*100, 0), '%'), '.000000000000', '')
FROM world
WHERE continent='Europe'

--6
SELECT name FROM world
WHERE gdp > ALL (SELECT gdp FROM world WHERE continent = 'Europe' AND gdp > 0);

--7
SELECT continent, name, area FROM world x
  WHERE area >= ALL
    (SELECT area FROM world y
        WHERE y.continent=x.continent
          AND area>0);

--8
SELECT continent, name FROM world x
WHERE name <= ALL 
(SELECT name FROM world y
WHERE y.continent = x.continent);

--9
SELECT name, continent, population FROM world x
WHERE 25000000 >= ALL(SELECT population FROM world y
                      WHERE y.continent = x.continent);

--10
SELECT name, continent FROM world x
WHERE population >= ALL(SELECT 3*population FROM world y
                        WHERE y.continent = x.continent  AND x.name<>y.name);

--SUM and COUNT
--1
SELECT SUM(population)
FROM world;

--2
SELECT DISTINCT continent FROM world;

--3
SELECT SUM(gdp)
FROM world
WHERE continent LIKE 'Africa';

--4
SELECT COUNT(name) FROM world
WHERE area >= 1000000;

--5
SELECT SUM(population) FROM  world
WHERE name IN('Estonia', 'Latvia', 'Lithuania');

--6
SELECT continent, Count(name) FROM world 
GROUP BY continent;

--7
SELECT continent, Count(name) FROM world 
WHERE population >= 10000000
GROUP BY continent;

--8
SELECT continent FROM world 
GROUP BY continent
HAVING SUM(population) >= 100000000;

--The JOIN operation
--1
SELECT matchid, player FROM goal 
WHERE teamid = 'GER';

--2
SELECT id,stadium,team1,team2
  FROM game
  WHERE id = 1012;

--3
SELECT player, teamid, stadium, mdate
  FROM game JOIN goal ON (id=matchid)
  WHERE teamid = 'GER';

--4
SELECT team1, team2, player
  FROM game JOIN goal ON (id=matchid)
  WHERE player LIKE 'Mario%'

--5
SELECT player, teamid, coach, gtime
  FROM goal JOIN eteam on teamid = id
 WHERE gtime<=10

--6
SELECT mdate, teamname FROM game JOIN eteam ON (team1 = eteam.id)
 WHERE coach LIKE 'Fernando Santos';

--7
SELECT player FROM goal JOIN game ON matchid = id
WHERE stadium = 'National Stadium, Warsaw';

--8
SELECT DISTINCT player
  FROM game JOIN goal ON matchid = id 
    WHERE (teamid !='GER' AND team1='GER') OR (teamid !='GER' AND team2='GER');

--9
SELECT teamname, COUNT(player)
  FROM eteam JOIN goal ON id=teamid
  GROUP BY teamname;

--10
SELECT stadium, COUNT(player) 
FROM game JOIN goal ON id = matchid
GROUP BY  stadium;

--11
SELECT matchid,mdate, count(player)
  FROM game JOIN goal ON matchid = id 
 WHERE (team1 = 'POL' OR team2 = 'POL')
 GROUP BY mdate, matchid;
 
--12
SELECT matchid,mdate, count(player)
  FROM game JOIN goal ON matchid = id 
 WHERE (teamid = 'GER')
 GROUP BY mdate, matchid;

 --13
 SELECT mdate,
  team1,
  SUM(CASE WHEN teamid=team1 THEN 1 ELSE 0 END) score1, team2,
  SUM(CASE WHEN teamid=team2 THEN 1 ELSE 0 END) score2
  FROM game JOIN goal ON matchid = id
  GROUP BY mdate, team1, team2
  ORDER BY mdate, goal.matchid, team1, team2

