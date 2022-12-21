.mode columns
.header on
.nullvalue NULL

-- Cinco árbitros com mais jogos arbitrados

select p.primeiroNome, p.segundoNome, count(j.idJogo) as jogosArbitrados
from Pessoa p
join Arbitro a on p.idPessoa = a.idArbitro
join Jogo j on a.idArbitro = j.arbitro
group by p.primeiroNome, p.segundoNome
order by count(j.idJogo) desc
limit 5;