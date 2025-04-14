/*Exercício 1) Qual o total de vendas por ano, considerando a tabela tb_vendas?



Exercício 2) Qual a quantidade de vendas por ano, considerando a tabela tb_vendas?*/




select 
min("Data"),max("Data")
from 
tb_vendas

select 
case
	when "Data">='2016-01-01' and "Data"<'2017-01-01' then 2016
	when "Data">='2017-01-01' and "Data"<'2018-01-01' then 2017
	when "Data">='2018-01-01' and "Data"<'2019-01-01' then 2018
	when "Data">='2019-01-01' and "Data"<'2020-01-01' then 2019
	when "Data">='2020-01-01' and "Data"<'2021-01-01' then 2020
	when "Data">='2021-01-01' and "Data"<'2022-01-01' then 2021
end as ano,
sum("Valor") as total_de_vendas,
count("Data") as num_de_vendas
from 
tb_vendas
group by
1
order by 
ano
