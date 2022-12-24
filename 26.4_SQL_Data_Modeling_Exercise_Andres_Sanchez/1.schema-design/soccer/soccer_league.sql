-- In terminal, run:
-- psql < soccer_league.sql;

DROP DATABASE IF EXISTS soccer_league;

CREATE DATABASE soccer_league;

\c soccer_league;

CREATE TABLE teams
(id SERIAL PRIMARY KEY,
team_name TEXT NOT NULL,
city TEXT NOT NULL
);


CREATE TABLE referees
(id SERIAL PRIMARY KEY,
first_name TEXT NOT NULL,
last_name TEXT NOT NULL
);


CREATE TABLE seasons
(id SERIAL PRIMARY KEY,
start_date DATE NOT NULL,
end_date DATE NOT NULL);


CREATE TABLE players
(id SERIAL PRIMARY KEY,
first_name TEXT NOT NULL,
last_name TEXT NOT NULL,
country TEXT NOT NULL,
current_team_id INTEGER REFERENCES teams(id)
);


CREATE TABLE matches
(id SERIAL PRIMARY KEY,
date DATE NOT NULL,
location TEXT NOT NULL,
start_time TIME NOT NULL,
season_id INTEGER REFERENCES seasons(id),
home_team_id INTEGER REFERENCES teams(id),
away_team_id INTEGER REFERENCES teams(id),
head_ref_id INTEGER REFERENCES referees(id),
assist_ref_1 INTEGER REFERENCES referees(id),
assist_ref_2 INTEGER REFERENCES referees(id)
);


CREATE TABLE goals
(id SERIAL PRIMARY KEY,
player_id INTEGER  REFERENCES players(id),
match_id INTEGER REFERENCES matches(id)
);


CREATE TABLE results
(id SERIAL PRIMARY KEY,
team_id INTEGER REFERENCES teams(id),
match_id INTEGER REFERENCES matches(id),
result TEXT NOT NULL);


CREATE TABLE lineups
(id SERIAL PRIMARY KEY,
match_id INTEGER REFERENCES matches(id),
team_id INTEGER REFERENCES teams(id),
player_id INTEGER REFERENCES players(id)
);



INSERT INTO teams 
(team_name, city)
VALUES
('rowdies', 'tampa'),
('hooligans', 'london'),
('alpacas', 'lima'),
('jaguars', 'moscow'),
('ganadores', 'buenos aires');


INSERT INTO referees
(first_name, last_name)
VALUES
('tomas', 'torquemada'),
('jesus', 'segundo'),
('torta', 'guillotine'),
('elanor', 'clancy'),
('pablo', 'escobar');


INSERT INTO seasons
(start_date, end_date)
VALUES
('2019-01-01', '2020-12-31'),
('2018-01-01', '2020-12-31'),
('2017-01-01', '2020-12-31'),
('2016-01-01', '2020-12-31'),
('2015-01-01', '2020-12-31');


INSERT INTO players
(first_name, last_name, country, current_team_id)
VALUES
('chapo', 'guzman', 'fedpen', 2),
('cindy', 'lauper', 'usa', 3),
('sancho', 'panza', 'mexico', 2),
('pedro', 'paramo', 'mexico', 3),
('rinconete', 'cortadillo', 'elbarrio', 1);


INSERT INTO matches
(date, location, start_time, season_id, home_team_id,away_team_id, head_ref_id, assist_ref_1, assist_ref_2)
VALUES
('2019-01-05', 'madrid', '13:30:00', 1, 2, 5, 1, 2, 3),
('2018-04-20', 'berlin', '08:00:00', 2, 1, 3, 5, 2, 3),
('2019-11-17', 'culucan', '10:30:00', 3, 4, 3, 4, 2, 1),
('2019-02-28', 'sao paolo', '00:30:00', 2, 4, 1, 3, 2, 5),
('2018-07-13', 'athens', '20:00:00', 4, 2, 1, 3, 2, 5);


INSERT INTO goals
(player_id, match_id)
VALUES
(5, 1), 
(1, 3), 
(4, 2), 
(4, 5), 
(5, 3), 
(2, 5), 
(3, 4);


INSERT INTO results
(team_id, match_id, result)
VALUES
(2, 1, 'w'),
(3, 2, 'l'),
(4, 3, 'd'),
(1, 4, 'w');