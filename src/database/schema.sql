CREATE TABLE IF NOT EXISTS genre (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  name TEXT NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS developer (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  name TEXT NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS game (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  title TEXT NOT NULL,
  release_date DATE
);

CREATE TABLE IF NOT EXISTS game_genre (
  game_id UUID NOT NULL,
  genre_id UUID NOT NULL,
  PRIMARY KEY (game_id, genre_id),
  FOREIGN KEY (game_id) REFERENCES game(id) ON DELETE CASCADE,
  FOREIGN KEY (genre_id) REFERENCES genre(id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS game_developer (
  game_id UUID NOT NULL,
  developer_id UUID NOT NULL,
  PRIMARY KEY (game_id, developer_id),
  FOREIGN KEY (game_id) REFERENCES game(id) ON DELETE CASCADE,
  FOREIGN KEY (developer_id) REFERENCES developer(id) ON DELETE CASCADE
);