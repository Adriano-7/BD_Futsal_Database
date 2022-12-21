PRAGMA foreign_keys = ON;

--Trigger para quando um golo for marcado, incrementar golosMarcadosVisitante se o jogador for da equipaVisitante e golosMarcadosVisitado se o jogador for da equipaVisitada
CREATE TRIGGER gatilho2
AFTER INSERT ON GoloMarcado
BEGIN
    UPDATE Jogo 
    SET golosMarcadosVisitante = golosMarcadosVisitante + 1 WHERE idJogo = NEW.idJogo AND NEW.idJogador IN (SELECT idJogador FROM Jogador WHERE equipa = (SELECT nomeEquipaVisitante FROM Jogo WHERE idJogo = NEW.idJogo));
    UPDATE Jogo 
    SET golosMarcadosVisitado = golosMarcadosVisitado + 1 WHERE idJogo = NEW.idJogo AND NEW.idJogador IN (SELECT idJogador FROM Jogador WHERE equipa = (SELECT nomeEquipaVisitada FROM Jogo WHERE idJogo = NEW.idJogo));
END;