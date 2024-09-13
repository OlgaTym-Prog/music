-- Название и продолжительность самого длительного трека

SELECT title, duration 
  FROM tracks
 WHERE duration = (SELECT MAX(duration) FROM tracks);

-- Названия треков, продолжительность которых не менее 3,5 минут

SELECT title
  FROM tracks
 WHERE duration >= '210';

-- Названия сборников, вышедших в период с 2018 по 2020 год включительно

SELECT name 
  FROM collection 
 WHERE release_year BETWEEN '2018-01-01' AND '2020-12-31' ;

-- Исполнители, чьё имя состоит из одного слова

SELECT name 
  FROM artists
 WHERE name NOT LIKE '% %' ;

-- Названия треков, которые содержат слово "мой" или "my"

SELECT title
  FROM tracks
 WHERE title ILIKE 'мой %'
    OR title ILIKE '% мой'
    OR title ILIKE '% мой %'
    OR title ILIKE 'мой'
    OR title ILIKE 'my %'
    OR title ILIKE '% my'
    OR title ILIKE '% my %'
    OR title ILIKE 'my' ;
   
-- Количество исполнителей в каждом жанре
   
SELECT g.name AS genre_name, COUNT(ag.artist_id) AS artist_count 
  FROM genres AS g
       INNER JOIN artistgenres AS ag 
       ON g.genre_id = ag.genre_id 
 GROUP BY g.name;

-- Количество треков, вошедших в альбомы 2019-2020 годов

SELECT COUNT(t.track_id) AS track_count
  FROM tracks AS t
       INNER JOIN albums AS a 
       ON t.album_id = a.album_id 
 WHERE a.release_year BETWEEN '2019-01-01' AND '2020-12-31' ;

-- Средняя продолжительность по каждому альбому

SELECT a.album_id, a.title AS album_title, AVG(t.duration) AS average_duration
  FROM albums AS a
       INNER JOIN tracks AS t
       ON t.album_id = a.album_id 
 GROUP BY a.album_id, a.title
 ORDER BY album_id ASC;

-- Все исполнители, которые не выпустили альбомы в 2020 году

SELECT a.name
  FROM artists AS a 
 WHERE a.artist_id NOT IN (
       SELECT aa.artist_id
         FROM artistalbums AS aa
              JOIN albums AS al
              ON aa.album_id = al.album_id
        WHERE EXTRACT(YEAR FROM al.release_year) = 2020
);

-- Названия сборников, в которых присутствует конкретный исполнитель

SELECT DISTINCT c.name AS collection_name
  FROM collection AS c
       JOIN collectiontrack AS ct 
       ON c.collection_id = ct.collection_id 
       JOIN tracks AS t
       ON ct.track_id = t.track_id 
       JOIN albums AS al 
       ON t.album_id = al.album_id 
       JOIN artistalbums AS aa 
       ON al.album_id = aa.album_id 
       JOIN artists AS ar 
       ON aa.artist_id = ar.artist_id 
 WHERE ar.name = 'Linkin park' ;




   


   


 
