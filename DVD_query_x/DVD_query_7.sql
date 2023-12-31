-- Check out the top 10 customer rent DVD
SELECT 	FIRST_NAME,
	LAST_NAME,
 	(SELECT COUNT(*)
		FROM RENTAL
		WHERE RENTAL.CUSTOMER_ID = CUSTOMER.CUSTOMER_ID) AS RENTAL_COUNT
FROM CUSTOMER
ORDER BY RENTAL_COUNT DESC
LIMIT 10;