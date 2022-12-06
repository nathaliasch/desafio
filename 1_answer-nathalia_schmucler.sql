SELECT f.title, COUNT(rental_id) AS rent_count
FROM film as f
	INNER JOIN inventory as i 
		ON i.film_id = f.film_id
	INNER JOIN rental as r 
		ON i.inventory_id = r.inventory_id
GROUP BY f.title
HAVING count (*)> 1
ORDER BY rent_count desc
limit 2;