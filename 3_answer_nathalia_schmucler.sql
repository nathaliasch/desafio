/*projetei a coluna rental_date da coluna rental mas extraí dela o mês já que o formato dessa coluna é timestamp
fiz um alias para renomear a coluna
fiz também a contagem dos costumer_id mas para não contar os registros que se repetem e fiz um alias para renomear a coluna
agrupei e ordenei pela coluna mes em ordem descrescente
como a minha query apareceu 5 linhas e o desafio pediu uma respota com 3 linhas, limitei
*/

select extract (month from rental_date) as mes_entrada_cliente, count (distinct customer_id) as quantidade_de_cliente 
from rental
group by mes_entrada_cliente
order by mes_entrada_cliente desc limit 3;
