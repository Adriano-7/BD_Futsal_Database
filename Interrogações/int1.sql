/** Quantos golos cada jogador marcou, ordenado por ordem decrescente. **/
.mode columns
.header on
.nullvalue NULL

select p.primeiroNome, p.segundoNome, count(g.idGolo) as golosMarcados
from Jogador j
join GoloMarcado g on j.idJogador = g.idJogador
join  Pessoa p on p.idPessoa = j.idJogador
where j.idJogador = g.idJogador
group by p.primeiroNome, p.segundoNome
order by golosMarcados desc;


