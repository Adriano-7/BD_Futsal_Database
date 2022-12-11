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

/** Quais os 5 arbitros que arbitraram mais jogos no campeonato **/

.mode columns
.header on
.nullvalue NULL

select p.primeiroNome, p.segundoNome, count(j.idJogo) as jogosArbitrados
from Pessoa p
join Arbitro a on p.idPessoa = a.idArbitro
join Jogo j on a.idArbitro = j.arbitro
group by p.primeiroNome, p.segundoNome
order by count(j.idJogo) desc
limit 5;

