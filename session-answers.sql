use movie_database;
select * from movie;
select * from actor;
select * from movie_cast;
select * from reviewer;
select * from rating;

-- display all Female actors
SELECT *  
FROM actor  
WHERE act_gender = 'Female';

-- display movies released sfter 2005
select * from movie where mov_year>2005;

-- Get all actors with the movies they starred in.
select a.act_fname, a.act_lname, m.mov_title
		from actor a 
        inner join movie_cast mc on a.act_id = mc.act_id
        inner join movie m on mc.mov_id = m.mov_id;

-- Get all movies and the actors that starred in them (including movies with no actors).
select a.act_fname, a.act_lname, m.mov_title
		from movie m
        left join movie_cast mc on m.mov_id = mc.mov_id
        left join actor a on a.act_id = mc.act_id;
        
-- Get all movies and the actors that starred in them (including actors with no movie).
select a.act_fname, a.act_lname, m.mov_title
		from movie m
        right join movie_cast mc on m.mov_id = mc.mov_id
        right join actor a on a.act_id = mc.act_id;
        
-- display all the reviews  posted by a particular reviewer for the movies
select r.rev_id, r.rev_name, m.mov_title, ra.rev_stars 
			from reviewer r 
            inner join rating ra on r.rev_id = ra.rev_id
            inner join movie m on m.mov_id = ra.mov_id
            where r.rev_id = 1;

-- write a SQL query to find all the movies with year, genres, and name of the director.
select m.mov_title, m.mov_year, g.gen_title, d.dir_fname, d.dir_lname 
	from movie m
    inner join movie_genres mg on mg.mov_id = m.mov_id
    inner join genres g on g.gen_id = mg.gen_id
    inner join movie_direction md on md.mov_id = m.mov_id
    inner join director d on d.dir_id = md.dir_id;
    
-- display movie id whose ratings are above average
-- display movie id whose ratings are above 4
select mov_id, rev_stars from rating where rev_stars >4; 

-- display movie id whose ratings are above average rating

select m.mov_id, m.mov_title, r.rev_stars 
		from rating r 
        inner join movie m on m.mov_id=r.mov_id
        where r.rev_stars > (select avg(rev_stars) from rating); 
        
-- write a  SQL query to find the movies directed by 'James Cameron'. Return movie title.
select mov_title from movie where mov_id in 
		(select mov_id from movie_direction where dir_id in 
			(select dir_id from director where dir_fname='James' and dir_lname='Cameron'));
            
-- write a SQL query to find all reviewers who rated the movie 'Inception'. Return reviewer name.
select rev_name from reviewer where rev_id in 
(select rev_id from rating where mov_id in 
		(select mov_id from movie where mov_title = 'Titanic'));
