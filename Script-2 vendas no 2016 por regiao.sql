--Exercício 1) Considerando o schema db_star_sales, liste as vendas realizadas em 2018 e o quanto elas 
--representam (em porcentagem) no total de vendas do ano? 
select 
sum(s.transaction_amount) as total
from 
db_star_sales."time" t 
inner join db_star_sales.sales s 
on t.time_id = s.time_id 

select 
s.*,
(
	select 
		sum(s.transaction_amount) as total
	from 
		db_star_sales."time" t 
	inner join db_star_sales.sales s 
	on t.time_id = s.time_id 
	where 
		t.time_year = '2018'
		) as total_2018,
	100*cast(s.transaction_amount as numeric)/(select 
		sum(s.transaction_amount) as total
	from 
		db_star_sales."time" t 
	inner join db_star_sales.sales s 
	on t.time_id = s.time_id 
	where 
		t.time_year = '2018'
		) as Porc_vendas_2018
	from 
	db_star_sales.sales s 
	inner join db_star_sales."time" t 
	on s.time_id = t.time_id
	where 
	t.time_year = '2018'
	

--Exercício 2) Considerando o schema- db_star_sales, 
--liste as vendas realizadas em 2016 e o quanto elas representam (em porcentagem) no total de vendas da região para este ano? 

	-- consultamos as informações que apressentam as tabelas para posteriormente realizar uma conjunção das mesmas
/*select
	*
	from 
	db_star_sales.sales s 
	limit
	5
select
	*
	from 
	db_star_sales."time" t 
	limit
	5*/
--
--resolução
with total_por_regiao as(
	select
	s.region_id,
	sum(s.transaction_amount) as vendas_regiao
	from 
	db_star_sales.sales s 
	inner join db_star_sales."time" t 
	on s.time_id = t.time_id
	where 
	t.time_year = '2016'
	group by 
	s.region_id
	)
	select 
	s.*,
	s.region_id,
	tr.region_id,
	100*cast(s.transaction_amount as numeric)/(tr.vendas_regiao) as porc_vendas_por_region
	from 
	db_star_sales.sales s
	inner join db_star_sales."time" t 
	on s.time_id = t.time_id 
	left join total_por_regiao tr
	on s.region_id = tr.region_id
	where 
	t.time_year = '2016'
	order by 
	s.region_id 
	
	
	
	





	
	
	
	
	
	
	
	
	