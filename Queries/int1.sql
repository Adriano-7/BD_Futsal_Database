.mode columns
.header on
.nullvalue NULL

-- Melhor marcador de cada equipa

select nome, primeiroNome, segundoNome, max(golos) as golos
from
(
select Equipa.nome, Pessoa.primeiroNome, Pessoa.segundoNome ,count(GoloMarcado.idGolo) as golos
from GoloMarcado
inner join Jogador on Jogador.idJogador = GoloMarcado.idJogador
inner join Pessoa on Jogador.idJogador = Pessoa.idPessoa
inner join Equipa on Jogador.equipa = Equipa.nome
group by Jogador.idJogador
)
GROUP BY nome