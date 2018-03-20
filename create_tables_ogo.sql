CREATE TABLE IF NOT EXISTS spotify_user (
  id SERIAL PRIMARY KEY,
  full_name TEXT NOT NULL,
  birth_date DATE NOT NULL,
  country_id INTEGER REFERENCES country (id),
  email TEXT UNIQUE CHECK (email ~* '^[A-Za-z0-9._%-]+@[A-Za-z0-9.-]+[.][A-Za-z]+$'),
  login TEXT UNIQUE,
  password TEXT
);

CREATE TABLE IF NOT EXISTS country (
  id SERIAL PRIMARY KEY,
  name TEXT UNIQUE
);

CREATE TABLE IF NOT EXISTS subscription (
  id SERIAL PRIMARY KEY,
  type TEXT UNIQUE,
  price MONEY CHECK (price > 0)
)