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

/*Ver a tabela de classificação final 
lugar, equipa, pontos, jogos, vitorias, empates, derrotas, golos marcados, golos sofridos, diferença de golos
em caso de empate, a classificação é feita pela maior diferença entre o número de golos marcados e o número de golos
sofridos pelos clubes empatados, nos jogos que realizaram entre si
*/
select e.nome, e.pontuacaoTotal, e.jogosGanhos, e.jogosEmpatados, e.golosMarcados, e.golosSofridos, e.diferencaGolos
from equipa e
order by e.pontuacaoTotal desc, e.diferencaGolos desc;
