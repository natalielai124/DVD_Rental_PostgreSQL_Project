-- CROSS JOIN WITH ACTOR & FILM TABLE
-- SELECT A.FIRST_NAME, A.LAST_NAME, F.TITLE
-- FROM ACTOR A
-- CROSS JOIN FILM F
 
 
--Sub-Query in a SELECT CLAUSE
-- SELECT CUSTOMER_ID,
-- 	FIRST_NAME,
-- 	LAST_NAME,
 -- 	(SELECT COUNT(*)
-- 		FROM RENTAL
-- 		WHERE RENTAL.CUSTOMER_ID = CUSTOMER.CUSTOMER_ID) AS RENTAL_COUNT
-- FROM CUSTOMER;


-- Sub-Query in FROM CLAUSE
-- SELECT AVG(RENTAL_COUNT)
-- FROM
-- 	(SELECT CUSTOMER_ID,
-- 			COUNT(*) AS RENTAL_COUNT
-- 		FROM RENTAL
-- 		GROUP BY CUSTOMER_ID) AS AVG_RENTAL_COUNTS;
 

-- Sub-Query in WHERE CLAUSE
-- SELECT CUSTOMER_ID,
-- 	FIRST_NAME,
-- 	LAST_NAME
-- FROM CUSTOMER
-- WHERE CUSTOMER_ID IN
-- 		(SELECT CUSTOMER_ID
-- 			FROM RENTAL
-- 			WHERE RETURN_DATE IS NULL );
			
			
-- More advanced Group By
-- SELECT CT.CITY,
-- 	EXTRACT(MONTH
-- 									FROM P.PAYMENT_DATE) AS MONTH,
-- 	SUM(P.AMOUNT) AS TOTAL_PAYMENT
-- FROM PAYMENT P
-- JOIN CUSTOMER C ON P.CUSTOMER_ID = C.CUSTOMER_ID
-- JOIN ADDRESS A ON C.ADDRESS_ID = A.ADDRESS_ID
-- JOIN CITY CT ON A.CITY_ID = CT.CITY_ID
-- GROUP BY CT.CITY,
-- 	EXTRACT(MONTH
-- 									FROM P.PAYMENT_DATE)
-- HAVING SUM(P.AMOUNT) > 31
-- ORDER BY TOTAL_PAYMENT DESC;


-- Window Function using OVER clause
-- SELECT TITLE,
-- 	RENTAL_DURATION, 
-- 	AVG(RENTAL_DURATION) OVER() AS OVERALL_AVGERAGE
-- FROM FILM;

-- SELECT AMOUNT,
-- 	CUSTOMER_ID,
-- 	AVG(AMOUNT) OVER (PARTITION BY EXTRACT(MONTH FROM PAYMENT_DATE)) AS MONTH_AVERAGE,
-- 	EXTRACT(MONTH FROM PAYMENT_DATE) AS MONTH
-- FROM PAYMENT
-- ORDER BY MONTH DESC;


-- CTE'S
-- WITH film_rentals AS (
--   SELECT inventory.film_id, COUNT(*) AS rental_count
--   FROM rental
--   JOIN inventory ON rental.inventory_id = inventory.inventory_id
--   GROUP BY inventory.film_id
-- )
-- SELECT f.title, fr.rental_count
-- FROM film f
-- JOIN film_rentals fr ON f.film_id = fr.film_id
-- WHERE fr.rental_count > 1;


-- Pairing customer avg payment for the month with avg payment for the month
-- We can get this query working strictly with window functions. 
-- I find it to be fairly difficult to think of how to get it working this way though:
-- SELECT distinct avg(amount) OVER (PARTITION BY EXTRACT(MONTH FROM payment_date), 
-- 								  customer_id) as cu_average, 
-- 								  customer_id, 
-- avg(amount) OVER (PARTITION BY EXTRACT(MONTH FROM payment_date)) as month_average, EXTRACT(month FROM payment_date) as month
-- FROM payment
-- --group by customer_id, month
-- ORDER BY customer_id, month asc;

-- In contrast we can get the same thing working with CTE’s and 
-- I find it to be much more straightforward figuring out how the whole thing will work:

-- WITH CUSTOMER_MONTH_AVG AS
-- 	(SELECT AVG(AMOUNT) CUST_MONTH_AVG,
-- 			CUSTOMER_ID,
-- 			EXTRACT(MONTH
-- 											FROM PAYMENT_DATE) AS MONTH
-- 		FROM PAYMENT
-- 		GROUP BY CUSTOMER_ID,
-- 			MONTH
-- 		ORDER BY CUSTOMER_ID,
-- 			MONTH),
-- 	MONTH_AVG AS
-- 	(SELECT AVG(AMOUNT) AS MONTH_AVG,
-- 			EXTRACT(MONTH
-- 											FROM PAYMENT_DATE) AS MONTH
-- 		FROM PAYMENT
-- 		GROUP BY EXTRACT(MONTH
-- 																			FROM PAYMENT_DATE)
-- 		ORDER BY MONTH ASC)
-- SELECT C.CUST_MONTH_AVG,
-- 	C.CUSTOMER_ID,
-- 	C.MONTH,
-- 	M.MONTH_AVG
-- FROM CUSTOMER_MONTH_AVG C
-- JOIN MONTH_AVG M ON M.MONTH = C.MONTH



WITH PAYMENT_DATA AS
	(SELECT P.AMOUNT,
			R.RENTAL_DATE - R.RETURN_DATE AS TIME_PERIOD,
			R.RENTAL_DATE,
			R.RENTAL_DATE
		FROM PAYMENT P
		JOIN RENTAL R ON R.RENTAL_ID = P.RENTAL_ID
		JOIN INVENTORY I ON R.INVENTORY_ID = I.INVENTORY_ID
		JOIN FILM F ON I.FILM_ID = F.FILM_ID)
SELECT INVENTORY_ID,
	AMOUNT,
	EXTRACT(DAY
									FROM TIM_PEROID) AS DAYS,
	EXTRACT(HOUR
									FROM TIME_PERIOD) AS HOURS,
FROM PAYMENT_DATA
WHERE EXTRACT(DAY
														FROM TIME_PERIOD) >= RENTAL_DURATION
ORDER BY INVENTORY_ID














