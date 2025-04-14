/*Compreender os padrões de vendas durante dias específicos da semana auxilia no 
 planejamento de promoções. Formule uma consulta que obtenha o número total de vendas realizadas às 
 segundas-feiras em todos os anos disponíveis utilizando as tabelas 'sales' e 'time' do schema db_star_sales.*/
select 
t.time_day_of_week,
SUM(S.transaction_amount) as total_vendas,
count(s.sales_id) as quant_vendas,
avg(s.transaction_amount) as media_das_vendas 
from 
db_star_sales.sales s 
inner join db_star_sales."time" t 
on s.time_id = t.time_id 
where 
t.time_day_of_week ='2'
group by
t.time_day_of_week 





/*Utilizando as tabelas 'sales' e 'products' do schema db_star_sales, 
construa uma consulta SQL que identifique os 5 produtos com os maiores valores de transação. 
Mostre os nomes dos produtos e seus respectivos valores totais de transação*/
select 
*
from 
db_star_sales.sales s 
inner join db_star_sales.products p 
on s.product_id = p.product_id 
order by 
s.transaction_amount desc 
limit 
5


/*Utilizando o schema db_star_sales, verifique a quantidade de vendas realizadas por ano.*/
select 
sum(s.sales_id),
t.time_year as ano
from 
db_star_sales.sales s 
inner join db_star_sales."time" t
on s.time_id = t.time_id 
group by 
t.time_year



/*Utilizando o schema db_star_sales, 
 desenvolva uma consulta SQL que recupere as 3 regiões com os maiores valores totais de transação às terças feiras. 
 Apresente os nomes das regiões e seus respectivos valores totais de vendas.*/
select 
sum(s.transaction_amount) as suma_total,
r.region_name 
from 
db_star_sales.sales s 
inner join db_star_sales.regions r 
on s.region_id = r.region_id 
inner join db_star_sales."time" t 
on s.time_id = t.time_id 
where 
t.time_day_of_week ='3' 
group by 
r.region_name 
order by 
suma_total desc 
limit 
3







 

