-- select sum(amount) from payment


-- select sum(amount)
-- where payment_date between '2007-02-28' and '2007-0315')


-- select stddev(length) as sd, avg(length) as mean, min(length) as max 
-- from film

-- select * from payment 
-- order by rental_id asc

-- select count(rental_id) from payment


-- select distinct count(rental_id) from payment


-- select c.first_name, p.amount
-- from customer c join payment p on p.customer_id = c.customer_id 
-- group by c.first_name, p.amount
-- order by p.amount desc;

-- select fc.category_id, c.name, count(*) as category_count
-- from film_category fc
-- join category c on fc.category_id = c.category_id
-- group by fc.category_id, c.name
-- order by category_count;


-- select rating, count(*) 
-- from film
-- group by rating
	

--Seeing total count and total amount for each genre
-- Simply the code
-- SELECT c.category_id, c.name AS category_name, 
-- 	COUNT(f.film_id) AS film_count, SUM(p.amount) AS total_amount
-- FROM category c
-- JOIN film_category fc ON c.category_id = fc.category_id
-- JOIN film f ON fc.film_id = f.film_id
-- JOIN inventory i ON f.film_id = i.film_id
-- JOIN rental r ON i.inventory_id = r.inventory_id
-- JOIN payment p ON r.rental_id = p.rental_id
-- GROUP BY c.category_id, c.name
-- ORDER BY total_amount DESC;

-- optimised performance
--Simplfied the sql by adusting the count(), group by, and join table
-- SELECT c.category_id, c.name AS category_name, 
-- 	COUNT(1) AS film_count, SUM(p.amount) AS total_amount
-- FROM category c
-- JOIN film_category fc ON c.category_id = fc.category_id
-- -- JOIN film f ON fc.film_id = f.film_id
-- JOIN inventory i ON fc.film_id = i.film_id
-- JOIN rental r ON i.inventory_id = r.inventory_id
-- JOIN payment p ON r.rental_id = p.rental_id
-- GROUP BY c.category_id
-- ORDER BY total_amount DESC;


-- geting revenue by ratnig type
-- SELECT f.rating, SUM(p.amount) AS total_revenue
-- FROM film f
-- JOIN inventory i ON f.film_id = i.film_id
-- JOIN rental r ON i.inventory_id = r.inventory_id
-- JOIN payment p ON r.rental_id = p.rental_id
-- GROUP BY f.rating
-- ORDER BY total_revenue DESC;


-- select *, (return_date - rental_date) as rental_period, r.inventory_id from rental r
-- where r.rental_id not in(select p.rental_id from payment p)


-- select *, (return_date - rental_date) as rental_period, r.inventory_id,
-- 	p.amount
-- from rental r
-- join payment p on r.rental_id = p.rental_id


-- select 24*(extract(day from(return_date - rental_date)) + extract(hour from(return_date - rental_date))) as rental_period, 
-- 	r.inventory_id, 
-- 	p.amount, 
-- 	p.amount/ extract(day from(return_date - rental_date)) as rate
-- from rental r join payment p on r.rental_id = p.rental_id
-- where extract (day from(return_date - rental_date)) <>0
-- order by inventory_id


-- SELECT c.customer_id, c.first_name, c.last_name, COUNT(1) AS rental_count
-- FROM customer c
-- JOIN rental r ON c.customer_id = r.customer_id
-- GROUP BY c.customer_id, c.first_name, c.last_name
-- HAVING COUNT(*) > 30;



-- SELECT f.rating, SUM(p.amount) AS total_revenue
-- FROM film f
-- JOIN inventory i ON f.film_id = i.film_id
-- JOIN rental r ON i.inventory_id = r.inventory_id
-- JOIN payment p ON r.rental_id = p.rental_id
-- GROUP BY f.rating
-- HAVING SUM(p.amount) > 13000
-- ORDER BY total_revenue DESC;



-- select * from inventory
-- where inventory_id not in (select inventory_id from rental)



-- investigate the decision rule 
-- SELECT*, (return_date - rental_date) as rental_period FROM rental r
-- WHERE r.rental_id NOT IN (SELECT p.rental_id FROM payment p)

-- SELECT*FROM payment
-- ORDER BY rental_id asc

-- SELECT distinct count(rental_id) FROM payment
;
-- SELECT return_date, 24*(EXTRACT(DAY FROM (r.return_date - r.rental_date)))+ EXTRACT(HOUR FROM (r.return_date - r.rental_date)) as rental_period, r.inventory_id, p.amount, p.amount/(24*(EXTRACT(DAY FROM (r.return_date - r.rental_date)))+ EXTRACT(HOUR FROM (r.return_date - r.rental_date))) as rate 
-- FROM rental r
-- JOIN payment p ON r.rental_id = p.rental_id
-- --WHERE EXTRACT(DAY FROM (r.return_date - r.rental_date)) <> 0
-- ORDER BY inventory_id

-- select avg(rental_count)
-- from (
-- 	select customer_id, count(*) as rental_count
-- 	from rental
-- 	group by customer_id
-- ) as avg_rental_rental_counts;







	