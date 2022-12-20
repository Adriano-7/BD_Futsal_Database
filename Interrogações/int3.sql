/** Quais as 3 equipas com jogadores mais jovens, tendo em conta a idade média dos seus constituintes, com 1 casa decimal.  **/

.mode columns
.header on
.nullvalue NULL

select e.nome, round(avg(p.idade),1) as idadeMedia
from Equipa e
join Jogador j on e.nome = j.equipa
join Pessoa p on p.idPessoa = j.idJogador
group by e.nome
order by idadeMedia asc
limit 3;
