-- create database movie_database;

-- Description of tables:

-- actor:

-- act_id – this is a unique ID for each actor
-- act_fname – this is the first name of each actor
-- act_lname – this is the last name of each actor
-- act_gender – this is the gender of each actor
-- genres:

-- gen_id – this is a unique ID for each genres
-- gen_title – this is the description of the genres
-- director:

-- dir_id – this is a unique ID for each director
-- dir_fname – this is the first name of the director
-- dir_lname – this is the last name of the director
-- movie:

-- mov_id – this is the unique ID for each movie
-- mov_title – this column represents the name of the movie
-- mov_year – this is the year of making the movie
-- mov_time – duration of the movie i.e. how long it was running
-- mov_lang – the language in which movie was casted
-- mov_dt_rel – this is the release date of the movie
-- mov_rel_country – this is the name of the country(s) where the movie was released
-- movie_genres:

-- mov_id – this is the ID of the movie, which is referencing the mov_id column of the table movie
-- gen_id – this is the ID of each genres, which is referencing the gen_id column of the table genres
-- movie_direction:

-- dir_id – this is the ID for each director, which is referencing the dir_id column of the table director
-- mov_id – this is the ID of the movie, which is referencing the mov_id column of the table movie
-- reviewer:

-- rev_id – this is the unique ID for each reviewer
-- rev_name – this is the name of the reviewer
-- rating:

-- mov_id –this is the ID of the movie, which is referencing the mov_id column of the table movie
-- rev_id – this is the ID of the reviewer, which is referencing the rev_id column of the table reviewer
-- rev_stars – this is indicates how many stars a reviewer rated for a review of a movie
-- num_o_rating – this indicates how many ratings a movie achieved till date
-- movie_cast:

-- act_id – this is ID of actor, which is referencing the act_id column of actor table
-- mov_id – this is the ID of the movie, which is referencing the mov_id column of the table movie
-- role – this is the name of a character in the movie, an actor acted for that character

use movie_database;

CREATE TABLE actor (
    act_id INT PRIMARY KEY,           -- Unique ID for each actor
    act_fname VARCHAR(100),           -- First name of the actor
    act_lname VARCHAR(100),           -- Last name of the actor
    act_gender VARCHAR(10)            -- Gender of the actor
);

CREATE TABLE genres (
    gen_id INT PRIMARY KEY,           -- Unique ID for each genre
    gen_title VARCHAR(100)            -- Description of the genre
);

CREATE TABLE director (
    dir_id INT PRIMARY KEY,           -- Unique ID for each director
    dir_fname VARCHAR(100),           -- First name of the director
    dir_lname VARCHAR(100)            -- Last name of the director
);

CREATE TABLE movie (
    mov_id INT PRIMARY KEY,           -- Unique ID for each movie
    mov_title VARCHAR(255),           -- Title of the movie
    mov_year INT,                     -- Year of making the movie
    mov_time INT,                     -- Duration (running time) of the movie in minutes
    mov_lang VARCHAR(50),             -- Language in which the movie was casted
    mov_dt_rel DATE,                  -- Release date of the movie
    mov_rel_country VARCHAR(255)      -- Country(s) where the movie was released
);

CREATE TABLE movie_genres (
    mov_id INT,                       -- ID of the movie (foreign key)
    gen_id INT,                       -- ID of the genre (foreign key)
    PRIMARY KEY (mov_id, gen_id),     -- Composite primary key (combination of movie ID and genre ID)
    FOREIGN KEY (mov_id) REFERENCES movie(mov_id),  -- Foreign key to movie table
    FOREIGN KEY (gen_id) REFERENCES genres(gen_id)   -- Foreign key to genres table
);

CREATE TABLE movie_direction (
    dir_id INT,                       -- ID of the director (foreign key)
    mov_id INT,                       -- ID of the movie (foreign key)
    PRIMARY KEY (dir_id, mov_id),     -- Composite primary key (combination of director ID and movie ID)
    FOREIGN KEY (dir_id) REFERENCES director(dir_id), -- Foreign key to director table
    FOREIGN KEY (mov_id) REFERENCES movie(mov_id)     -- Foreign key to movie table
);

CREATE TABLE reviewer (
    rev_id INT PRIMARY KEY,           -- Unique ID for each reviewer
    rev_name VARCHAR(255)             -- Name of the reviewer
);

CREATE TABLE rating (
    mov_id INT,                       -- ID of the movie (foreign key)
    rev_id INT,                       -- ID of the reviewer (foreign key)
    rev_stars INT,                    -- Number of stars given by the reviewer
    num_o_rating INT,                 -- Number of ratings the movie has received
    PRIMARY KEY (mov_id, rev_id),     -- Composite primary key (combination of movie ID and reviewer ID)
    FOREIGN KEY (mov_id) REFERENCES movie(mov_id),    -- Foreign key to movie table
    FOREIGN KEY (rev_id) REFERENCES reviewer(rev_id)  -- Foreign key to reviewer table
);

CREATE TABLE movie_cast (
    act_id INT,                       -- ID of the actor (foreign key)
    mov_id INT,                       -- ID of the movie (foreign key)
    role VARCHAR(255),                 -- Role played by the actor in the movie
    PRIMARY KEY (act_id, mov_id),     -- Composite primary key (combination of actor ID and movie ID)
    FOREIGN KEY (act_id) REFERENCES actor(act_id),    -- Foreign key to actor table
    FOREIGN KEY (mov_id) REFERENCES movie(mov_id)     -- Foreign key to movie table
);
