-- from the terminal run:
-- psql < craigslist_db.sql

DROP DATABASE IF EXISTS craigslist_db;

CREATE DATABASE craigslist_db;

\c craigslist_db


CREATE TABLE regions
(id SERIAL PRIMARY KEY,
region TEXT UNIQUE NOT NULL
);

CREATE TABLE categories
(id SERIAL PRIMARY KEY,
category TEXT UNIQUE NOT NULL
);

CREATE TABLE users
(id SERIAL PRIMARY KEY, 
username VARCHAR(15) UNIQUE NOT NULL,
first_name TEXT NOT NULL,
last_name TEXT NOT NULL,
city TEXT NOT NULL,
state_ TEXT NOT NULL,
pref_region_id INTEGER REFERENCES regions(id)
-- pref_region TEXT NOT NULL
);

CREATE TABLE posts
(id SERIAL PRIMARY KEY,
title VARCHAR(30) NOT NULL,
text VARCHAR(1000) NOT NULL,
user_id INTEGER,
city TEXT,
state_ TEXT,
region_id INTEGER REFERENCES regions(id),
category_id INTEGER REFERENCES categories(id)
);



INSERT INTO regions
(region)
VALUES
('northeast'), 
('southeast'), 
('midwest'),
('southwest'), 
('northwest');


INSERT INTO categories
(category)
VALUES
('community'), 
('housing'), 
('for_sale'),
('jobs'), 
('scams');


INSERT INTO users 
(username, first_name, last_name, city, state_, pref_region_id)
VALUES
('cheapCarParts', 'freddy', 'jones', 'austin', 'tx', '2'),
('girlygirl_10', 'marla', 'malone', 'miami', 'fl', '1'),
('patrick2287', 'patrick', 'foreman', 'reno', 'nv', '3'),
('jo-delivers1', 'josepi', 'cincilla', 'brooklin', 'ny', '4');


INSERT INTO posts 
(user_id, title, text, city, state_, region_id, category_id)
VALUES
(3, '2-BR house for rent', '2-bedroom house for rent in great neighborhood', 'miami', 'fl', '1','4'),
(1, 'transmission for parts', '02q 6-speed vw transmissiion clutch for parts', 'burbank', 'ca', '3','2'),
(2, 'looking for gamers', 'new to the area and looking for fellow gamers', 'ames', 'ia', '2','4'),
(4, 'we delivery everything', 'need it deliverd. Call us.  We delivery anything', 'brooklyn', 'ny', '4','4'
);
