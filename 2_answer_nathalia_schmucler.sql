/* concatenei as colunas first_name e last_name para projetar o nome completo dos atores da tabela actor
fiz a junção com as tabelas film_actor, inventory e rental
fiz um left join para mostrar todos os registros da tabela actor
agrupei pelo nome completo do atores
ordenei pela contagem maior que um dos ids do aluguel em ordem descrecente limitado a 16 registros 
*/

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
