DROP TRIGGER IF EXISTS gatilho1;
PRAGMA foreign_keys = ON;

--Trigger para quando um golo for marcado, incrementar golosMarcadosVisitante se o jogador for da equipaVisitante e golosMarcadosVisitado se o jogador for da equipaVisitada
CREATE TRIGGER gatilho1 AFTER INSERT ON GoloMarcado
BEGIN
    UPDATE Jogo SET golosMarcadosVisitante = golosMarcadosVisitante + 1 WHERE idJogo = NEW.idJogo AND NEW.idJogador IN (SELECT idJogador FROM Jogador WHERE equipa = (SELECT nomeEquipaVisitante FROM Jogo WHERE idJogo = NEW.idJogo));
    UPDATE Jogo SET golosMarcadosVisitado = golosMarcadosVisitado + 1 WHERE idJogo = NEW.idJogo AND NEW.idJogador IN (SELECT idJogador FROM Jogador WHERE equipa = (SELECT nomeEquipaVisitada FROM Jogo WHERE idJogo = NEW.idJogo));
END;


--Verificar se o trigger funciona
--mostrar o jogo cujo idJogo = 174 (nomeEquipaVisitante, nomeEquipaVisitada, golosMarcadosVisitante, golosMarcadosVisitado)
SELECT nomeEquipaVisitante, nomeEquipaVisitada, golosMarcadosVisitante, golosMarcadosVisitado FROM Jogo WHERE idJogo = 174;
--mostrar os golosMarcados da equipa 'Benfica' e golosSofridos da equipa 'Portimonense'
INSERT INTO GoloMarcado (idGolo, minuto, idJogador, idJogo) VALUES (1165, 10, 74, 174);
--mostrar que o numero de golosMarcadosVisitante e golosMarcadosVisitado e golosMarcados da equipa do jogador que marcou o golo e golosSofridos da outra equipa foi atualizado
SELECT nomeEquipaVisitante, nomeEquipaVisitada, golosMarcadosVisitante, golosMarcadosVisitado FROM Jogo WHERE idJogo = 174;