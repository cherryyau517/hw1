-- In this assignment, you'll be building the domain model, database 
-- structure, and data for "KMDB" (the Kellogg Movie Database).
-- The end product will be a report that prints the movies and the 
-- top-billed cast for each movie in the database.

-- Requirements/assumptions
--
-- - There will only be three movies in the database – the three films
--   that make up Christopher Nolan's Batman trilogy
-- - Movie data includes the movie title, year released, MPAA rating,
--   and director
-- - A movie has a single director
-- - A person can be the director of and/or play a role in a movie
-- - Everything you need to do in this assignment is marked with TODO!

-- Rubric
-- 
-- There are three deliverables for this assignment, all delivered via
-- this file and submitted via GitHub and Canvas:
-- - A domain model, implemented via CREATE TABLE statements for each
--   model/table. Also, include DROP TABLE IF EXISTS statements for each
--   table, so that each run of this script starts with a blank database.
--   (10 points)
-- - Insertion of "Batman" sample data into tables (5 points)
-- - Selection of data, so that something similar to the following sample
--   "report" can be achieved (5 points)

-- Submission
-- 
-- - "Use this template" to create a brand-new "hw1" repository in your
--   personal GitHub account, e.g. https://github.com/<USERNAME>/hw1
-- - Do the assignment, committing and syncing often
-- - When done, commit and sync a final time, before submitting the GitHub
--   URL for the finished "hw1" repository as the "Website URL" for the 
--   Homework 1 assignment in Canvas

-- Successful sample output is as shown:

-- Movies
-- ======

-- Batman Begins          2005           PG-13  Christopher Nolan
-- The Dark Knight        2008           PG-13  Christopher Nolan
-- The Dark Knight Rises  2012           PG-13  Christopher Nolan

-- Top Cast
-- ========

-- Batman Begins          Christian Bale        Bruce Wayne
-- Batman Begins          Michael Caine         Alfred
-- Batman Begins          Liam Neeson           Ra's Al Ghul
-- Batman Begins          Katie Holmes          Rachel Dawes
-- Batman Begins          Gary Oldman           Commissioner Gordon
-- The Dark Knight        Christian Bale        Bruce Wayne
-- The Dark Knight        Heath Ledger          Joker
-- The Dark Knight        Aaron Eckhart         Harvey Dent
-- The Dark Knight        Michael Caine         Alfred
-- The Dark Knight        Maggie Gyllenhaal     Rachel Dawes
-- The Dark Knight Rises  Christian Bale        Bruce Wayne
-- The Dark Knight Rises  Gary Oldman           Commissioner Gordon
-- The Dark Knight Rises  Tom Hardy             Bane
-- The Dark Knight Rises  Joseph Gordon-Levitt  John Blake
-- The Dark Knight Rises  Anne Hathaway         Selina Kyle

-- Turns column mode on but headers off
.mode column on
.headers off
.width 20 20 20

-- Drop existing tables, so you'll start fresh each time this script is run.
-- TODO!
DROP TABLE IF EXISTS movies;
DROP TABLE IF EXISTS actors;
DROP TABLE IF EXISTS directors;
DROP TABLE IF EXISTS casts;
DROP TABLE IF EXISTS roles;

-- Create new tables, according to your domain model
-- TODO!

CREATE TABLE movies (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    title TEXT,
    year_release INTEGER, 
    MPAA_rating TEXT,
    director_id INTEGER
);

CREATE TABLE actors (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT
);

CREATE TABLE directors (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT
);

CREATE TABLE casts (
    id INTEGER PRIMARY KEY AUTOINCREMENT, 
    movie_id INTEGER, 
    actor_id INTEGER, 
    role_id INTEGER
);

CREATE TABLE roles (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT
);

-- Insert data into your database that reflects the sample data shown above
-- Use hard-coded foreign key IDs when necessary
-- TODO!

INSERT INTO directors
VALUES
(1, 'Christopher Nolan');

INSERT INTO movies
VALUES
(1, 'Batman Begins', 2005, 'PG-13', 1 ),
(2, 'The Dark Knight', 2008, 'PG-13', 1), 
(3, 'The Dark Knight Rises', 2012, 'PG-13', 1);

INSERT INTO actors
VALUES 
(1, 'Christian Bale'),
(2, 'Michael Caine'),
(3, 'Liam Neeson'),
(4, 'Katie Holmes'),
(5, 'Gary Oldman'),
(6, 'Heath Ledger'),
(7, 'Aaron Eckhart'),
(8, 'Maggie Gyllenhaal'),
(9, 'Tom Hardy'),
(10, 'Joseph Gordon-Levitt'),
(11, 'Anne Hathaway');

INSERT INTO roles
VALUES
(1, 'Bruce Wayne'),
(2, 'Alfred'),
(3, 'Ra''s Al Ghul'),
(4, 'Rachel Dawes'),
(5, 'Commissioner Gordon'),
(6, 'Joker'),
(7, 'Harvey Dent'),
(8, 'Bane'),
(9, 'John Blake'),
(10, 'Selina Kyle');

INSERT INTO casts
VALUES
(1, 1, 1, 1),
(2, 1, 2, 2),
(3, 1, 3, 3),
(4, 1, 4, 4),
(5, 1, 5, 5),
(6, 2, 1, 1),
(7, 2, 6, 6),
(8, 2, 7, 7),
(9, 2, 2, 2),
(10, 2, 8, 4),
(11, 3, 1, 1),
(12, 3, 5, 5), 
(13, 3, 9, 8),
(14, 3, 10, 9),
(15, 3, 11, 10);

-- Prints a header for the movies output
.print "Movies"
.print "======"
.print ""

-- The SQL statement for the movies output
-- TODO!

SELECT movies.title, movies.year_release, movies.MPAA_rating, directors.name 
FROM movies INNER JOIN directors 
ON movies.director_id = directors.id;

-- Prints a header for the cast output
.print ""
.print "Top Cast"
.print "========"
.print ""


-- The SQL statement for the cast output
-- TODO!

SELECT movies.title, actors.name, roles.name
FROM movies, actors, roles INNER JOIN casts
ON movies.id = casts.movie_id and actors.id = casts.actor_id and casts.role_id = roles.id;