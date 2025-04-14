--Problema: Comparacao das vendas nos dias das maes (10-05-2015) e dia dos namorados (12-06-2015), por tipo de pizzas.

-- dia das maes*/
with 
maes_dia as(
	select
		p.pizza_type_id,
		sum(od.quantity) as quantidade_de_vendas_dia_das_maes
	from 
		db_pizza_sales.order_details od 
		inner join db_pizza_sales.orders o 
		on od.order_id = o.order_id 
		left join db_pizza_sales.pizzas p
		on od.pizza_id = p.pizza_id 
	where
		o.date = '2015-05-10'
	group by 
		p.pizza_type_id
) 
--dia dos namorados
, dias_namorados as(
	select
		p.pizza_type_id,
		sum(od.quantity) as quantidade_de_vendas_dia_namorados
	from 
		db_pizza_sales.order_details od 
		inner join db_pizza_sales.orders o 
		on od.order_id = o.order_id 
		left join db_pizza_sales.pizzas p
		on od.pizza_id = p.pizza_id 
	where
		o.date = '2015-06-12'
	group by 
		p.pizza_type_id
)
--combinação das tabelas
select 
	coalesce(m.pizza_type_id , n.pizza_type_id) as tipo_de_pizzas,
	m.quantidade_de_vendas_dia_das_maes,
	n.quantidade_de_vendas_dia_namorados,
	m.quantidade_de_vendas_dia_das_maes-n.quantidade_de_vendas_dia_namorados as diferenca
from 
	maes_dia m 
	full join dias_namorados n
	on m.pizza_type_id = n.pizza_type_id
order by 
diferenca desc 



	








