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

CREATE TABLE artist(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE album_to_artist(
  id SERIAL PRIMARY KEY,
  artist_id INTEGER REFERENCES artist(id),
  album_id INTEGER REFERENCES album(id)
);

CREATE TABLE playlist(
  id SERIAL PRIMARY KEY,
  owner_id INTEGER REFERENCES spotify_user(id),
  title TEXT NOT NUll
);

CREATE TABLE user_subscription(
  id SERIAL PRIMARY KEY,
  user_id INTEGER REFERENCES spotify_user(id),
  subscription_id INTEGER REFERENCES subscription(id),
  start_date DATE NOT NULL
);
