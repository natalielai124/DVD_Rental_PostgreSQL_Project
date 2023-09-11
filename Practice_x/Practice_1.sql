-- select 
-- 	f.title, f.description, l.name as Language,  f.rating
-- from 
-- 	film as f left join language as l on f.language_id = l.language_id



-- select * from film
-- where rental_rate > 2.99


-- select distinct rental_rate 
-- from film
-- where (rental_rate = 4.99) AND (length > 5)


-- select * from film 
-- where length between 100 and 120


-- select * from customer c
-- where length(c.last_name) > all(select length(a.first_name) from actor a );


-- select * from customer c
-- where length(c.last_name) > any(select length(a.first_name) from actor a );


-- ??? why need a group by
-- select first_name, min(length(first_name)) from customer 
-- where length(first_name) = 2
-- group by first_name


-- select * from film where description ILIKE '%robot%'


-- select * from film 
-- where(description ILIKE '%robot%') 
-- or (description ILIKE '%andriod%')
-- or (description ILIKE '%machine%') 

-- select * from film 
-- where not title ilike 'a%'

-- top 10 lenghthy films with title, description, film length with a descending order
-- select title, description , length
-- from film
-- order by length desc
-- limit 10;

-- customer who paid $10 or more 
-- SELECT first_name
-- FROM customer
-- WHERE EXISTS (SELECT amount FROM payment 
-- 			  WHERE customer.customer_id = payment.customer_id AND amount > 10);

-- use [1] to remove the {} in the result
-- select special_features from film
-- select special_features[1] from film

-- films & the film id which replacement cost is $20 or more  
-- SELECT film_id, title
-- FROM film
-- WHERE rental_rate > SOME (
--     SELECT rental_rate
--     FROM film
--     WHERE replacement_cost > 20
-- );

-- staff and actor are haivng the same first name
-- SELECT first_name
-- FROM staff
-- WHERE staff.first_name = SOME (
--     SELECT first_name
--     FROM actor);
	
	
-- SELECT c.customer_id, c.first_name, c.last_name, p.amount
-- FROM customer c
-- INNER JOIN payment p ON c.customer_id = p.customer_id;



-- SELECT c.customer_id, c.first_name, c.last_name, COUNT(r.rental_id) AS rental_count
-- FROM customer c
-- LEFT JOIN rental r ON c.customer_id = r.customer_id
-- GROUP BY c.customer_id, c.first_name, c.last_name
-- ORDER BY rental_count DESC;


-- SELECT c.customer_id, c.first_name, c.last_name, COUNT(p.payment_id) AS payment_count
-- FROM customer c
-- LEFT JOIN payment p ON c.customer_id = p.customer_id
-- GROUP BY c.customer_id, c.first_name, c.last_name
-- ORDER BY payment_count DESC;


-- SELECT a.address, s.first_name 
-- FROM address a
-- LEFT JOIN staff s ON a.address_id = s.address_id;


-- SELECT l.language_id, l.name AS language_name, f.film_id, f.title
-- FROM language l
-- FULL OUTER JOIN film f ON l.language_id = f.language_id;


-- select * from film
-- where film.film_id not in (select i.film_id from inventory i) 


select f.title, f.description, i.inventory_id, i.store_id, i.last_update
from film f 
left join inventory i on f.film_id = i.film_id
order by i.inventory_id desc
