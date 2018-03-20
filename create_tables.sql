CREATE TABLE artist(
id SERIAL PRIMARY KEY,
name TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS country (
id SERIAL PRIMARY KEY,
name TEXT UNIQUE
);

CREATE TABLE IF NOT EXISTS subscription (
id SERIAL PRIMARY KEY,
type TEXT UNIQUE,
price DECIMAL(12, 2) CHECK (price > 0.00)
);

CREATE TABLE genre(
id SERIAL PRIMARY KEY,
name TEXT NOT NULL UNIQUE
);

CREATE TABLE album(
id SERIAL PRIMARY KEY,
name TEXT NOT NULL,
release_date DATE NOT NULL
);

CREATE TABLE IF NOT EXISTS spotify_user (
id SERIAL PRIMARY KEY,
full_name TEXT NOT NULL,
birth_date DATE NOT NULL,
country_id INTEGER REFERENCES country (id),
email TEXT UNIQUE CHECK (email ~* '^[A-Za-z0-9._%-]+@[A-Za-z0-9.-]+[.][A-Za-z]+$'),
login TEXT UNIQUE,
password TEXT
);

CREATE TABLE playlist(
id SERIAL PRIMARY KEY,
owner_id INTEGER REFERENCES spotify_user(id),
title TEXT NOT NUll
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

CREATE TABLE playlist_observer(
id SERIAL PRIMARY KEY,
playlist_id INTEGER REFERENCES playlist(id),
user_id INTEGER REFERENCES spotify_user(id)
);

CREATE TABLE artist_observer(
id SERIAL PRIMARY KEY,
artist_id INTEGER REFERENCES artist(id),
user_id INTEGER REFERENCES spotify_user(id)
);

CREATE TABLE album_to_artist(
id SERIAL PRIMARY KEY,
artist_id INTEGER REFERENCES artist(id),
album_id INTEGER REFERENCES album(id)
);

CREATE TABLE user_subscription(
id SERIAL PRIMARY KEY,
user_id INTEGER REFERENCES spotify_user(id),
subscription_id INTEGER REFERENCES subscription(id),
start_date DATE NOT NULL
);