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


