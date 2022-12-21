.mode columns
.header on
.nullvalue NULL

--Equipa mais Jovem e a equipa mais velha do campeonato

select nome, idadeMedia from
(
select e.nome, round(avg(p.idade),1) as idadeMedia
from Equipa e
join Jogador j on e.nome = j.equipa
join Pessoa p on p.idPessoa = j.idJogador
group by e.nome
order by idadeMedia asc
limit 1
)
union
select nome, idadeMedia from
(
select e.nome, round(avg(p.idade),1) as idadeMedia
from Equipa e
join Jogador j on e.nome = j.equipa
join Pessoa p on p.idPessoa = j.idJogador
group by e.nome
order by idadeMedia desc
limit 1
);