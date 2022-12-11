/**
Pessoa(idPessoa, primeiroNome, segundoNome, idade, pais)
Treinador(idTreinador -> Pessoa, equipa -> Equipa)
Arbitro(idArbitro -> Pessoa, distrito)
Jogador(idJogador ->Pessoa, numeroCamisola, posicao, equipa -> Equipa)
Equipa (nome,email,telefone,morada, pontuacaoTotal, golosMarcados, golosSofridos, diferencaGolos, jogosGanhos, jogosEmpatados)
Pavilhao(idPavilhao, nome, cidade, lotacao, equipa -> Equipa)
Jogo(idJogo, data, golosMarcadosVisitante, golosMarcadosVisitado, nomeEquipaVisitante ->Equipa, nomeEquipaVisitada -> Equipa, idArbitro -> Arbitro,  numero -> Jornada, fase->Playoff )
GoloMarcado(idGolo, minuto, idJogador->Jogador, idJogo -> Jogo)
Jornada(numero, dataInicio, dataFim)
Playoff(fase, dataInicio, dataFim)
**/

/** Quantos jogos ganhou, empatou e perdeu cada equipa na fase regular do campeonato numa só tabela **/

.mode columns
.header on
.nullvalue NULL

create view v1 as 
select e.nome, count(j.idJogo) as jogosGanhos
from Jogo j
join Equipa e on e.nome = j.nomeEquipaVisitante
where j.golosMarcadosVisitante > j.golosMarcadosVisitado
group by e.nome
order by jogosGanhos desc;

create view v2 as 
select e.nome, count(j.idJogo) as jogosEmpatados
from Jogo j
join Equipa e on e.nome = j.nomeEquipaVisitante
where j.golosMarcadosVisitante = j.golosMarcadosVisitado
group by e.nome
order by jogosEmpatados desc;

create view v3 as 
select e.nome, count(j.idJogo) as jogosPerdidos
from Jogo j
join Equipa e on e.nome = j.nomeEquipaVisitante
where j.golosMarcadosVisitante < j.golosMarcadosVisitado
group by e.nome
order by jogosPerdidos desc;

select v1.nome, jogosGanhos, jogosEmpatados, jogosPerdidos
from v1
join v2 on v1.nome = v2.nome
join v3 on v1.nome = v3.nome
order by jogosGanhos desc;


