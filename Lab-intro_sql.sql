-- 2.5 at top, lab 2.6 below

use sakila;

-- 1
SELECT first_name, last_name
FROM actor
WHERE first_name = 'Scarlett';
-- 2
SELECT COUNT(*) from sakila.film;

SELECT rental_duration, film_id
FROM film;
-- 3
SELECT max(rental_duratio) as max_duration, min(rental_duration) as min_duration 
FROM sakila.film; 

-- 4 
SELECT floor(avg(length)/60) as hours, round(avg(length)%60) as minutes
FROM sakila.film;

-- 5 
SELECT COUNT(distinct last_name)
FROM actor; 

-- 6
SELECT DATEDIFF (MAX(return_date), MIN(rental_date)) as datenew
FROM rental; 


-- 7
SELECT *, date_format(rental_date, '%M') as month, date_format(rental_date, '%W') as weekday
FROM rental
LIMIT 20;

-- 8
SELECT *, case when date_format(rental_date, '%W') in ('Saturday', 'Sunday')


	then 'weekend'
    else 'workday' end as day_type
FROM rental;

-- 9


-- LESSON 2.6

-- 1
USE sakila;
SELECT release_year
FROM film;
-- 2
SELECT title
FROM film
WHERE title regexp 'Armageddon';
-- 3
SELECT title
FROM film
WHERE title regexp 'APOLLO$';
-- 4
SELECT length
FROM film
ORDER BY length DESC
LIMIT 10;

-- 5
SELECT title
FROM film
WHERE title regexp 'behind the scenes';

-- 6
ALTER TABLE staff
DROP COLUMN picture;

-- 7
SELECT *
FROM customer
WHERE first_name= 'Tammy' and last_name = 'Sanders';

INSERT INTO staff (first_name, last_name, address_id, email, store_id, username)
VALUES ('TAMMY', 'SANDER', '79' , 'TAMMY.SANDERS@sakilacustomer.org', '1', 'bla');

-- 8
select customer_id from sakila.customer
where first_name = 'CHARLOTTE' and last_name = 'HUNTER';

select * from sakila.film
where title = 'Academy Dinosaur';

select * from sakila.rental
where film_id = '1';

INSERT INTO rental (customer_id, rental_date, rental_id, inventory_id, staff_id)
VALUES ('130', '2021-01-21', '79' , '2', '1');

-- 9

drop table if exists deleted_users;

CREATE TABLE sakila.deleted_users(
customer_id int UNIQUE NOT NULL,
email varchar(255) UNIQUE NOT NULL,
delete_date date);

Insert into deleted_users
select customer_id, email, curdate()
from sakila.customer
where active = 0; 

SELECT * 
FROM sakila.deleted_users;

delete from customer where active = 0;



 
