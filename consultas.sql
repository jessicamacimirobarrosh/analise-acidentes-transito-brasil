--Vusialização geralda tabela
select * from acidentes
limit 5

--Quantos acidentes existem na base?
select 
	count(*) 
	from acidentes
	
--Quantos estados (UFs) aparecem?
select 
count(distinct uf)
from acidentes

--Quantos municípios diferentes existem?
select 
count(distinct municipio)
from acidentes

--Quantos acidentes ocorreram em cada estado?
select
count(*),
uf
from acidentes
group by uf

--Quais são as causas de acidentes registradas na base?
select 
count(*) as num_acidentes,
causa_acidente
from acidentes
group by causa_acidente
order by num_acidentes

--Quais são as cinco causas mais frequentes?
select 
count(*) as num_acidentes,
causa_acidente
from acidentes
group by causa_acidente
order by num_acidentes desc
limit 5

--Quantos acidentes tiveram vítimas fatais?
select
count(*) as acidentes_com_vitimas_fatais
from acidentes
where mortos >0

--Qual foi o mês com maior número de acidentes?
select
extract(month from data_inversa) as mes,
count(*) as quantidade_de_acidentes
from acidentes
group by mes
order by quantidade_de_acidentes desc;

--Quais municípios tiveram mais acidentes?
select
municipio,
count(*)  as quantidade_acidentes
from acidentes
group by municipio
order by quantidade_acidentes desc
limit 10

--Qual é a quantidade média de vítimas por acidente?
select
avg(feridos + mortos) as media_vitimas_por_acidente
from acidentes

--Qual estado apresenta a maior quantidade de acidentes com vítimas fatais?
select
sum(mortos),
uf
from acidentes
group by uf