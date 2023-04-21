--1

SELECT DISTINCT name, lastname, nickname, city
FROM players
INNER JOIN reviews
ON players.id = reviews.player_id


--2

SELECT DISTINCT videogames.name, CAST(overview AS varchar(max)), release_date
FROM videogames
INNER JOIN tournament_videogame
ON videogames.id = videogame_id
INNER JOIN tournaments
ON tournament_id = tournaments.id
WHERE year = 2016;


--3

SELECT videogames.name, release_date, categories.name, description
FROM videogames
INNER JOIN category_videogame
ON videogames.id = category_id
INNER JOIN categories
ON category_id = categories.id


--4

SELECT DISTINCT software_houses.name, tax_id, city, country
FROM software_houses
INNER JOIN videogames
ON software_houses.id = software_house_id
WHERE CAST(LEFT(release_date, 4) AS int) > 2020


--5

SELECT software_houses.name, videogames.name, awards.name
FROM videogames
INNER JOIN software_houses
ON software_house_id = software_houses.id
INNER JOIN award_videogame
ON videogame_id = videogames.id
INNER JOIN awards 
ON awards.id = award_id


--6

SELECT DISTINCT videogames.name, categories.name, pegi_labels.name
FROM videogames
INNER JOIN category_videogame
ON category_videogame.videogame_id = videogames.id
INNER JOIN categories
ON category_id = categories.id
INNER JOIN pegi_label_videogame 
ON pegi_label_videogame.videogame_id = videogames.id
INNER JOIN pegi_labels 
ON pegi_label_id = pegi_labels.id
INNER JOIN reviews 
ON reviews.videogame_id = videogames.id
WHERE rating >= 4


--7

SELECT DISTINCT videogames.name
FROM videogames
INNER JOIN tournament_videogame
ON tournament_videogame.videogame_id = videogames.id
INNER JOIN tournaments
ON tournament_videogame.tournament_id = tournaments.id
INNER JOIN player_tournament 
ON player_tournament.tournament_id = tournaments.id
INNER JOIN players 
ON player_id = players.id
WHERE LEFT(players.name, 1) = 'S'


--8

SELECT DISTINCT videogames.name, tournaments.city, awards.name, tournaments.year
FROM videogames
INNER JOIN tournament_videogame
ON tournament_videogame.videogame_id = videogames.id
INNER JOIN tournaments
ON tournament_id = tournaments.id
INNER JOIN award_videogame 
ON award_videogame.videogame_id = videogames.id
INNER JOIN awards 
ON award_videogame.award_id = awards.id
WHERE award_videogame.year = 2018 AND awards.id = 1


--9

SELECT players.id, players.name
FROM videogames
INNER JOIN tournament_videogame
ON tournament_videogame.videogame_id = videogames.id
INNER JOIN tournaments
ON tournament_id = tournaments.id
INNER JOIN award_videogame 
ON award_videogame.videogame_id = videogames.id
INNER JOIN awards 
ON award_videogame.award_id = awards.id
INNER JOIN player_tournament 
ON player_tournament.tournament_id = tournaments.id
INNER JOIN players 
ON player_tournament.player_id = players.id
WHERE award_videogame.year = 2018 AND awards.id = 1 AND tournaments.year = 2019 