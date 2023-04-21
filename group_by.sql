--1

SELECT country, COUNT (*) AS [Number of software houses]
FROM software_houses
GROUP BY country


--2

SELECT videogame_id, COUNT (*) AS [Number of reviews]
FROM reviews
GROUP BY videogame_id


--3

SELECT pegi_label_id, COUNT (*) AS [Number of videogames]
FROM pegi_label_videogame
GROUP BY pegi_label_id


--4

SELECT LEFT(release_date, 4) AS Year, COUNT (*) AS [Number of videogames]
FROM videogames
GROUP BY LEFT(release_date, 4)


--5

SELECT device_id, COUNT (*) AS [Number of videogames]
FROM device_videogame
GROUP BY device_id


--6

SELECT videogame_id, AVG(CAST(rating AS DECIMAL(10,2))) AS [Average review]
FROM reviews
GROUP BY videogame_id
ORDER BY AVG(CAST(rating AS DECIMAL(10,2))) DESC