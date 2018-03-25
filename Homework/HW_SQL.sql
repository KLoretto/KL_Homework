USE sakila;

## 1a 
SELECT first_name, last_name
FROM actor;

## 1b
SELECT concat(first_name," ",last_name) AS Actor
FROM actor;
 
 ## 2a
 SELECT actor_id, first_name, last_name
 FROM actor
 WHERE first_name = 'Joe';
 
 ##2b
 SELECT actor_id, first_name, last_name
 FROM actor
 WHERE last_name LIKE '%GEN%';
 
 ## 2c
 SELECT actor_id, first_name, last_name
 FROM actor
 WHERE last_name LIKE '%LI%'
 ORDER BY last_name, first_name;
 
 ## 2d
SELECT country_id, country
FROM country 
WHERE country IN ('Afghanistan', 'Bangladesh', 'China')

## 3a
ALTER TABLE actor
ADD COLUMN middle_name VARCHAR(30)
AFTER first_name; 
## 3a Check to see middle_name column added
select *
FROM actor

#3b
ALTER TABLE actor
MODIFY middle_name blob;
## 3b Check to see type change
describe actor;

#3c
ALTER TABLE actor
DROP COLUMN middle_name;
## 3c Check to see middle_name column deleted
select *
FROM actor

#4a
SELECT last_name, COUNT(last_name)
FROM actor
GROUP BY last_name;

#4b
SELECT last_name, COUNT(last_name)
FROM actor
GROUP BY last_name
HAVING COUNT(last_name) >= 2;

#4c
UPDATE actor
SET first_name = 'Harpo'
WHERE first_name = 'Groucho' AND last_name = 'Williams';

#4d
UPDATE actor
SET first_name = if ('Harpo','GROUCHO', 'MUCHO GROUCHO') 
WHERE first_name = 'Harpo' AND last_name = 'Williams';

#5a
describe address;


#6a
SELECT first_name, last_name, address
FROM staff JOIN address;

#6b
SELECT first_name, last_name, amount, payment_date
FROM staff JOIN payment
WHERE payment.payment_date LIKE '2005-08%'; 
 
#6c
SELECT title, COUNT(actor_id)
FROM film
INNER JOIN film_actor
ON film.film_id = film_actor.film_id
GROUP BY title;

#6d
SELECT film.film_id, title, COUNT(title)
FROM film JOIN inventory
WHERE title = 'Hunchback Impossible';

#6e
SELECT customer.first_name, customer.last_name, SUM(amount) AS 'Total Amount Paid'
FROM payment 
LEFT JOIN customer
ON payment.customer_id = customer.customer_id
GROUP BY payment.customer_id
ORDER BY customer.last_name;

#7a
SELECT title, name
FROM film, language
WHERE (title Like 'K%'
OR title like 'Q%')
AND name = 'English';

#7b
SELECT first_name, last_name, film.title
FROM actor, film_actor, film
WHERE film.title = 'Alone Trip';

#7c
SELECT customer.first_name, customer.last_name, customer.email, country.country
FROM customer
JOIN country
WHERE country = 'Canada';

#7d
SELECT title, name
FROM film, category
WHERE name = 'Family';

#7e
SELECT rental.inventory_id, inventory.film_id, film.title, COUNT(title)
FROM rental, inventory, film
WHERE (rental.inventory_id = inventory.inventory_id)
AND (inventory.film_id = film.film_id)
GROUP BY title
ORDER BY COUNT(title) desc;

#7f
SELECT store.store_id, SUM(amount)
FROM store, payment, staff
WHERE store.manager_staff_id = payment.staff_id
GROUP BY store_id;

#7g
SELECT store.store_id, city.city, country.country
FROM store, city, country, address
WHERE (store.address_id = address.address_id)
AND (address.city_id = city.city_id)
AND (city.country_id = country.country_id);


#7h
SELECT category.name, COUNT(payment.amount) AS 'GROSS'
FROM category, film_category, inventory, payment, rental
WHERE (payment.rental_id = rental.rental_id)
AND (rental.inventory_id = inventory.inventory_id)
AND (inventory.film_id = film_category.film_id)
AND (film_category.category_id = category.category_id)
GROUP BY category.name
ORDER BY GROSS DESC
LIMIT 5;


#8a
CREATE VIEW Top_Genre AS
SELECT category.name, COUNT(payment.amount) AS 'GROSS'
FROM category, film_category, inventory, payment, rental
WHERE (payment.rental_id = rental.rental_id)
AND (rental.inventory_id = inventory.inventory_id)
AND (inventory.film_id = film_category.film_id)
AND (film_category.category_id = category.category_id)
GROUP BY category.name
ORDER BY GROSS DESC
LIMIT 5;

#8b
SELECT *
FROM Top_Genre;

#8c
DROP VIEW Top_Genre;
