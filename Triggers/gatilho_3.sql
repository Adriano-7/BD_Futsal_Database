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

DROP TRIGGER IF EXISTS gatilho3;
PRAGMA foreign_keys = ON;

--Trigger 
