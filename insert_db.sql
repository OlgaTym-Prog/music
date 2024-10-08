INSERT INTO artists (name)
VALUES ('Sinatra'),
       ('Эдуард Хиль'), 
       ('Ярослав Евдокимов'),
       ('Linkin park');

INSERT INTO genres (name)
VALUES ('Джаз'),
       ('Альтернативный рок'),
       ('Эстрада');

INSERT INTO albums (title, release_year)
VALUES ('Meteora', '2003-03-25'),
       ('In the wee small hours', '1955-04-18'),
       ('Фантазёр', '2002-01-01'),
       ('На безымянной высоте', '2020-01-01');

INSERT INTO tracks (title, duration, album_id)
VALUES ('Numb', '184', '1'),
       ('From the inside', '153', '1'),
       ('Breaking the habit', '189', '1'),
       ('Фантазёр', '210', '3'),
       ('Glad to be unhappy', '140', '2'),
       ('Шёл мой солдат', '186', '4');

-- Тестовые данные для проверки корректности работы запроса
  
INSERT INTO tracks (title, duration, album_id) 
VALUES ('my own', 180, 1),
       ('own my', 180, 1),
       ('my', 180, 1),
       ('oh my god', 180, 1),
       ('myself', 180, 1),
       ('by myself', 180, 1),
       ('bemy self', 180, 1),
       ('myself by', 180, 1),
       ('by myself by', 180, 1),
       ('beemy', 180, 1),
       ('premyne', 180, 1);
      
-- Удаление тестовых данных
      
DELETE FROM tracks
 WHERE title IN (
      'my own',
      'own my',
      'my',
      'oh my god',
      'myself',
      'by myself',
      'bemy self',
      'myself by',
      'by myself by',
      'beemy',
      'premyne'
);

INSERT INTO collection (name, release_year)
VALUES ('Studio collection 2000-2012', '2013-05-06'),
       ('Однажды летом', '2019-09-12'),
       ('Хиты прошлых лет', '2000-07-15'),
       ('Золотая коллекция', '2004-06-01');
            
INSERT INTO artistalbums (artist_id, album_id)
VALUES ('1', '2'),
       ('2', '4'),
       ('3', '3'),
       ('4', '1');
       
INSERT INTO artistgenres (artist_id, genre_id)
VALUES ('1', '1'),
       ('2', '3'),
       ('3', '3'),
       ('4', '2');
      
INSERT INTO collectiontrack (collection_id, track_id)
VALUES ('1', '1'),
       ('1', '2'),
       ('1', '3'),
       ('2', '4'),
       ('3', '6'),
       ('4', '5');

