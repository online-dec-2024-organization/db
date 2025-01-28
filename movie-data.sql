INSERT INTO actor (act_id, act_fname, act_lname, act_gender)
VALUES
(1, 'Leonardo', 'DiCaprio', 'Male'),
(2, 'Kate', 'Winslet', 'Female'),
(3, 'Brad', 'Pitt', 'Male'),
(4, 'Angelina', 'Jolie', 'Female');

INSERT INTO genres (gen_id, gen_title)
VALUES
(1, 'Action'),
(2, 'Drama'),
(3, 'Romance'),
(4, 'Thriller');

INSERT INTO director (dir_id, dir_fname, dir_lname)
VALUES
(1, 'James', 'Cameron'),
(2, 'Quentin', 'Tarantino'),
(3, 'Christopher', 'Nolan');

INSERT INTO movie (mov_id, mov_title, mov_year, mov_time, mov_lang, mov_dt_rel, mov_rel_country)
VALUES
(1, 'Titanic', 1997, 195, 'English', '1997-12-19', 'USA'),
(2, 'Inception', 2010, 148, 'English', '2010-07-16', 'USA'),
(3, 'Once Upon a Time in Hollywood', 2019, 161, 'English', '2019-07-26', 'USA');

INSERT INTO movie_genres (mov_id, gen_id)
VALUES
(1, 2),  -- Titanic is a Drama
(1, 3),  -- Titanic is also a Romance
(2, 1),  -- Inception is an Action movie
(2, 2),  -- Inception is also a Drama
(3, 1),  -- Once Upon a Time in Hollywood is an Action movie
(3, 4);  -- Once Upon a Time in Hollywood is a Thriller

INSERT INTO movie_direction (dir_id, mov_id)
VALUES
(1, 1),  -- James Cameron directed Titanic
(2, 3),  -- Quentin Tarantino directed Once Upon a Time in Hollywood
(3, 2);  -- Christopher Nolan directed Inception

INSERT INTO reviewer (rev_id, rev_name)
VALUES
(1, 'John Doe'),
(2, 'Jane Smith'),
(3, 'Alice Brown');

INSERT INTO rating (mov_id, rev_id, rev_stars, num_o_rating)
VALUES
(1, 1, 5, 1000),  -- John Doe rated Titanic 5 stars, 1000 ratings total
(1, 2, 4, 1000),  -- Jane Smith rated Titanic 4 stars, 1000 ratings total
(2, 1, 5, 800),   -- John Doe rated Inception 5 stars, 800 ratings total
(3, 3, 4, 500);   -- Alice Brown rated Once Upon a Time in Hollywood 4 stars, 500 ratings total

INSERT INTO movie_cast (act_id, mov_id, role)
VALUES
(1, 1, 'Jack Dawson'),     -- Leonardo DiCaprio played Jack Dawson in Titanic
(2, 1, 'Rose DeWitt Bukater'),  -- Kate Winslet played Rose in Titanic
(1, 2, 'Dom Cobb'),        -- Leonardo DiCaprio played Dom Cobb in Inception
(3, 3, 'Cliff Booth');     -- Brad Pitt played Cliff Booth in Once Upon a Time in Hollywood
