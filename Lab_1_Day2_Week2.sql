
#Select all the actors with the first name ‘Scarlett’.
select * from sakila.actor where first_name="Scarlett" ;

#How many films (movies) are available for rent and how many films have been rented?
select (count(rental_date) - count(return_date)) as rented_movies,count(inventory_id) as movies_2_rent from sakila.rental;

#What are the shortest and longest movie duration? Name the values max_duration and min_duration.
select min(length) as min_duration, max(length) as max_duration From sakila.film;

#What's the average movie duration expressed in format (hours, minutes)?
SELECT time_format(avg(length),"%H %i %s") as avg_duration from sakila.film;


#How many distinct (different) actors' last names are there?
select count(distinct last_name) as "lastName" from sakila.actor;


#Since how many days has the company been operating (check DATEDIFF() function)?
select datediff(max(rental_date), min(rental_date)) from sakila.rental;

#Show rental info with additional columns month and weekday. Get 20 results.

select *, date_format(rental_date,"%M") as Mounth ,date_format(rental_date, "%a") as Day 
from sakila.rental limit 20;

#Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.

SELECT *,
CASE
	WHEN date_format(rental_date, '%a') in ('Mon', 'Tue', 'Wed', 'Thu', 'Fri') THEN 'workday'
	WHEN date_format(rental_date, '%a') in ('Sat', 'Sun') THEN 'weekend'
END AS 'day_type'
FROM rental;






SELECT max(rental_date) from sakila.rental;

select date(max(rental_date))- INTERVAL 30 DAY, date(max(rental_date)) #getting the days
from rental;

select count(rental_id) from sakila.rental
where date(rental_date) between date("2006-01-15") and date("2006-02-14"); #182