CREATE TABLE IF NOT EXISTS Genres (
    genre_ID SERIAL       PRIMARY KEY,
    name     VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS Artists (
    artist_ID SERIAL       PRIMARY KEY,
    name      VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS ArtistGenres (
    artist_ID INTEGER REFERENCES Artists(artist_ID) ON DELETE CASCADE,
    genre_ID  INTEGER REFERENCES Genres(genre_ID)   ON DELETE CASCADE,
              CONSTRAINT artist_genre_pk 
              PRIMARY KEY (artist_ID, genre_ID)
);

CREATE TABLE IF NOT EXISTS Albums (
    album_ID     SERIAL       PRIMARY KEY,
    title        VARCHAR(150) NOT NULL,
    release_year DATE         NOT NULL,
                 CONSTRAINT check_album_year 
                 CHECK (EXTRACT(YEAR FROM release_year) >= 1950)
);

CREATE TABLE IF NOT EXISTS ArtistAlbums (
    artist_ID INTEGER REFERENCES Artists(artist_ID) ON DELETE CASCADE,
    album_ID  INTEGER REFERENCES Albums(album_ID)   ON DELETE CASCADE,
              CONSTRAINT artist_album_pk 
              PRIMARY KEY (artist_ID, album_ID)
);

CREATE TABLE IF NOT EXISTS Tracks (
    track_ID SERIAL      PRIMARY KEY,
    title    VARCHAR(50) NOT NULL,
    duration INTEGER     NOT NULL,
    album_ID INTEGER     REFERENCES Albums(album_ID) ON DELETE CASCADE NOT NULL,
             CONSTRAINT check_track_duration
             CHECK (duration >= 60)
); 

CREATE TABLE IF NOT EXISTS Collection (
    collection_ID SERIAL      PRIMARY KEY,
    name          VARCHAR(50) NOT NULL,
    release_year  DATE        NOT NULL,
                  CONSTRAINT check_collection_year 
                  CHECK (EXTRACT(YEAR FROM release_year) >= 2000)
);

CREATE TABLE IF NOT EXISTS CollectionTrack (
    collection_ID INTEGER REFERENCES Collection(collection_ID) ON DELETE CASCADE,
    track_ID      INTEGER REFERENCES Tracks(track_ID)          ON DELETE CASCADE,
                  CONSTRAINT collection_track_pk 
                  PRIMARY KEY (collection_ID, track_ID)
);