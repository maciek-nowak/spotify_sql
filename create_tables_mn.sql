CREATE TABLE genre(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL UNIQUE
);

CREATE TABLE album(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  release_date DATE NOT NULL
);

CREATE TABLE song(
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL,
  genre_id INT REFERENCES genre (id)
);

CREATE TABLE album_content(
  id SERIAL PRIMARY KEY,
  song_id INT REFERENCES song (id),
  album_id INT REFERENCES album (id)
);

CREATE TABLE playlist_content(
  id SERIAL PRIMARY KEY,
  song_id INT REFERENCES song (id),
  playlist_id INT REFERENCES playlist (id)
);

