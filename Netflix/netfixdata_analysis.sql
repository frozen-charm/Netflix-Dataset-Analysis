Create database Netflix;
use Netflix;

select* from netflixdata;

 #1.General Statistics
 -- Number of shows and movies
create view  num_shows_movies as 
SELECT type, COUNT(*) AS total_count
FROM netflixdata
GROUP BY type;

select * from num_shows_movies;

-- total number of records
select count(*) from netflixdata;

#2.Top Content Insights
-- Top 10 directors by the number of shows/movies:

SELECT director, COUNT(*) AS total_count
FROM netflixdata
WHERE director IS NOT NULL
GROUP BY director
ORDER BY total_count DESC
LIMIT 10;

-- Most common genres:

SELECT listed_in, COUNT(*) AS total_count
FROM netflixdata
GROUP BY listed_in
ORDER BY total_count DESC;

-- Top 10 countries producing the most content:

SELECT country, COUNT(*) AS total_count
FROM netflixdata
GROUP BY country
ORDER BY total_count DESC
LIMIT 10;

# 3. Yearly Trends

-- Number of shows/movies added each year:
SELECT YEAR(date_added) AS year_added, COUNT(*) AS total_count
FROM netflixdata
WHERE date_added IS NOT NULL
GROUP BY YEAR(date_added)
ORDER BY year_added;

-- Number of releases by year:

select release_year ,count(*) as number_of_release
from netflixdata
where date_added is not null
group by release_year
order by release_year desc;

#4. Content Duration Analysis
-- Average duration of movies:
SELECT AVG(CAST(SUBSTRING_INDEX(duration, ' ', 1) AS UNSIGNED)) AS avg_duration
FROM netflixdata
WHERE type = 'Movie';

-- Distribution of TV show seasons:


SELECT duration, COUNT(*) AS total_count
FROM netflixdata
WHERE type = 'TV Show'
GROUP BY duration
ORDER BY total_count DESC;

#5. Content Ratings
-- Count of shows/movies by rating:

SELECT rating, COUNT(*) AS total_count
FROM netflixdata
GROUP BY rating
ORDER BY total_count DESC;

-- Top-rated movies/shows (assuming "top-rated" is based on a specific rating or other criteria in the dataset):

SELECT title, rating, listed_in
FROM netflixdata
WHERE rating IN ('TV-MA', 'R', 'PG-13')
ORDER BY title;

#6.Country-Specific Insights
-- Content produced by a specific country:
SELECT title, type, listed_in
FROM netflixdata
WHERE country = 'India'; 

-- Top countries producing movies:

SELECT country, COUNT(*) AS total_movies
FROM netflixdata
WHERE type = 'Movie'
GROUP BY country
having country is not null
ORDER BY total_movies DESC
LIMIT 10;

#7. Recent Additions
-- Shows or movies added in the last year:

select title, type, YEAR(date_added) as yr
from netflixdata
where YEAR(date_added) in (
select max(YEAR(date_added)) 
from netflixdata
);

















