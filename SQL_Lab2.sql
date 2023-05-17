USE sakila;

-- Select all the actors with the first name ‘Scarlett’.
SELECT * FROM sakila.actor
WHERE first_name = "Scarlett";

-- How many physical copies of movies are available for rent in the store's inventory? How many unique movie titles are available?
SELECT COUNT(fild_id) FROM film;
SELECT COUNT(DISTINCT title) FROM film; 

-- What are the shortest and longest movie duration? Name the values max_duration and min_duration
SELECT min(length) AS min_duration, max(length) AS max_duration FROM film;

#What is the average movie duration expressed in format (hours, minutes)?

SELECT AVG(length) , CONCAT(FLOOR(Avg(length)/60),'h ',round(MOD(Avg(length),60)),'m') AS "Avg duration (HH:MM)"
FROM film;

-- How many distinct (different) actors' last names are there?
SELECT COUNT(DISTINCT last_name) from actor;

-- How many days was the company operating? Assume the last rental date was their closing date. (check DATEDIFF() function)
SELECT DATEDIFF(max(rental_date), min(rental_date)) FROM rental;

-- Show rental info with additional columns month and weekday. Get 20 results.
SELECT *, MONTH (rental_date) AS rental_month, WEEKDAY(rental_date) AS weekday FROM rental;  


-- Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.

SELECT *,
case when weekday(rental_date) = 5 or weekday(rental_date) = 6 then "weekend"
else "weekday"
end as day_type
From rental
order by rental_date;

# Get release years
SELECT distinct release_year FROM film;

-- Get all films with ARMAGEDDON in the title.
SELECT * 
FROM film
WHERE title LIKE "%ARMAGEDDON%";

-- Get all films which title ends with APOLLO.

SELECT *
FROM film
WHERE title LIKE "%APOLLO"; 

# Get 10 the longest films.
SELECT * 
FROM film
ORDER by length DESC
LIMIT 10;

 
# 13. How many films include Behind the Scenes content?
SELECT *
FROM film
WHERE special_features = "Behind the Scenes";



