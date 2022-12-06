SELECT (CONCAT(a.first_name,' ', a.last_name)) as actor_name
FROM actor as a
	LEFT JOIN film_actor as t 
		ON t.actor_id = a.actor_id
	LEFT JOIN inventory as i 
		ON i.film_id = t.film_id
	LEFT JOIN rental as r 
		ON i.inventory_id = r.inventory_id
GROUP BY actor_name
HAVING COUNT(*)>1
ORDER BY COUNT(rental_id) desc limit 16;
