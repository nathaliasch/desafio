select extract (month from rental_date) as mes_entrada_cliente, count (distinct customer_id) as quantidade_de_cliente 
from rental
group by mes_entrada_cliente
order by mes_entrada_cliente desc limit 3;
