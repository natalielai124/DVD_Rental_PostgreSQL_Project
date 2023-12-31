-- Check out which actor(s) participated the most film production?
SELECT A.FIRST_NAME,
	A.LAST_NAME,
	(SELECT COUNT(FILM_ID) FROM FILM_ACTOR FA
	WHERE A.ACTOR_ID = FA.ACTOR_ID) AS NO_OF_PERFORMANCE
FROM ACTOR A
ORDER BY NO_OF_PERFORMANCE DESC

