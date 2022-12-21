PRAGMA foreign_keys = ON;

CREATE TRIGGER gatilho1
AFTER INSERT ON Jogo
FOR EACH ROW
BEGIN
    UPDATE Equipa
    SET pontuacaoTotal = pontuacaoTotal + (CASE WHEN nome = NEW.nomeEquipaVisitante AND NEW.golosMarcadosVisitante > NEW.golosMarcadosVisitado THEN 3
                                                WHEN nome = NEW.nomeEquipaVisitada AND NEW.golosMarcadosVisitado > NEW.golosMarcadosVisitante THEN 3
                                                ELSE (CASE WHEN NEW.golosMarcadosVisitante = NEW.golosMarcadosVisitado THEN 1 ELSE 0 END) END),

        golosMarcados = golosMarcados + (CASE WHEN nome = NEW.nomeEquipaVisitante THEN NEW.golosMarcadosVisitante ELSE (CASE WHEN nome = NEW.nomeEquipaVisitada THEN NEW.golosMarcadosVisitado ELSE 0 END) END),
        golosSofridos = golosSofridos + (CASE WHEN nome = NEW.nomeEquipaVisitante THEN NEW.golosMarcadosVisitado ELSE (CASE WHEN nome = NEW.nomeEquipaVisitada THEN NEW.golosMarcadosVisitante ELSE 0 END) END),
        jogosGanhos = jogosGanhos + (CASE WHEN nome = NEW.nomeEquipaVisitante AND NEW.golosMarcadosVisitante > NEW.golosMarcadosVisitado THEN 1
                                         WHEN nome = NEW.nomeEquipaVisitada AND NEW.golosMarcadosVisitado > NEW.golosMarcadosVisitante THEN 1 ELSE 0 END),
        jogosEmpatados = jogosEmpatados + (CASE WHEN NEW.golosMarcadosVisitante = NEW.golosMarcadosVisitado THEN 1 ELSE 0 END)
    WHERE nome IN (NEW.nomeEquipaVisitante, NEW.nomeEquipaVisitada);
END;