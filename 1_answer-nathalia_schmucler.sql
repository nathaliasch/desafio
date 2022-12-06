/* projetei os titulos dos filmes da tabela film e fiz uma contagem dos ids do aluguel da tabela rental
fiz uma junção das tabelas film com inventory e rental pelas foreign keys
agrupei pelos títulos dos filmes para mostrar as que a contagem é maior que 1 
e ordenei pela contagem dos ids do aluguel em ordem descrescente limitado a 2 registros
 */

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