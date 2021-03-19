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

