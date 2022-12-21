PRAGMA foreign_keys = ON;

CREATE TRIGGER gatilho1
AFTER UPDATE ON Jogo
FOR EACH ROW
BEGIN
    UPDATE Equipa
    SET pontuacaoTotal = pontuacaoTotal + (CASE WHEN nome = NEW.nomeEquipaVisitante AND NEW.golosMarcadosVisitante > NEW.golosMarcadosVisitado THEN 3
                                                WHEN nome = NEW.nomeEquipaVisitada AND NEW.golosMarcadosVisitado > NEW.golosMarcadosVisitante THEN 3
                                                ELSE (CASE WHEN NEW.golosMarcadosVisitante = NEW.golosMarcadosVisitado THEN 1 ELSE 0 END) END) 
                                                                            - 
                                            (CASE WHEN nome = OLD.nomeEquipaVisitante AND OLD.golosMarcadosVisitante > OLD.golosMarcadosVisitado THEN 3
                                                WHEN nome = OLD.nomeEquipaVisitada AND OLD.golosMarcadosVisitado > OLD.golosMarcadosVisitante THEN 3
                                                ELSE (CASE WHEN OLD.golosMarcadosVisitante = OLD.golosMarcadosVisitado THEN 1 ELSE 0 END) END),

        golosMarcados = golosMarcados + (CASE WHEN nome = NEW.nomeEquipaVisitante THEN NEW.golosMarcadosVisitante ELSE (CASE WHEN nome = NEW.nomeEquipaVisitada THEN NEW.golosMarcadosVisitado ELSE 0 END) END)
                                                                            - 
                                        (CASE WHEN nome = OLD.nomeEquipaVisitante THEN OLD.golosMarcadosVisitante ELSE (CASE WHEN nome = OLD.nomeEquipaVisitada THEN OLD.golosMarcadosVisitado ELSE 0 END) END),
                                        
        golosSofridos = golosSofridos + (CASE WHEN nome = NEW.nomeEquipaVisitante THEN NEW.golosMarcadosVisitado ELSE (CASE WHEN nome = NEW.nomeEquipaVisitada THEN NEW.golosMarcadosVisitante ELSE 0 END) END) 
                                                                            - 
                                        (CASE WHEN nome = OLD.nomeEquipaVisitante THEN OLD.golosMarcadosVisitado ELSE (CASE WHEN nome = OLD.nomeEquipaVisitada THEN OLD.golosMarcadosVisitante ELSE 0 END) END),
        
        diferencaGolos = golosMarcados - golosSofridos,

        jogosGanhos = jogosGanhos + (CASE WHEN nome = NEW.nomeEquipaVisitante AND NEW.golosMarcadosVisitante > NEW.golosMarcadosVisitado THEN 1
                                     WHEN nome = NEW.nomeEquipaVisitada AND NEW.golosMarcadosVisitado > NEW.golosMarcadosVisitante THEN 1 ELSE 0 END)
                                                                           - 
                                    (CASE WHEN nome = OLD.nomeEquipaVisitante AND OLD.golosMarcadosVisitante > OLD.golosMarcadosVisitado THEN 1
                                    WHEN nome = OLD.nomeEquipaVisitada AND OLD.golosMarcadosVisitado > OLD.golosMarcadosVisitante THEN 1 ELSE 0 END),

        jogosEmpatados = jogosEmpatados + (CASE WHEN NEW.golosMarcadosVisitante = NEW.golosMarcadosVisitado THEN 1 ELSE 0 END)
                                                                         - 
                                            (CASE WHEN OLD.golosMarcadosVisitante = OLD.golosMarcadosVisitado THEN 1 ELSE 0 END)
        WHERE nome IN (NEW.nomeEquipaVisitante, NEW.nomeEquipaVisitada);
END;