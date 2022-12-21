PRAGMA foreign_keys = ON;

CREATE TRIGGER gatilho2
AFTER INSERT ON GoloMarcado
BEGIN
    UPDATE Jogo 
    SET golosMarcadosVisitante = golosMarcadosVisitante + 1 WHERE idJogo = NEW.idJogo AND NEW.idJogador IN (SELECT idJogador FROM Jogador WHERE equipa = (SELECT nomeEquipaVisitante FROM Jogo WHERE idJogo = NEW.idJogo));
    UPDATE Jogo 
    SET golosMarcadosVisitado = golosMarcadosVisitado + 1 WHERE idJogo = NEW.idJogo AND NEW.idJogador IN (SELECT idJogador FROM Jogador WHERE equipa = (SELECT nomeEquipaVisitada FROM Jogo WHERE idJogo = NEW.idJogo));
END;