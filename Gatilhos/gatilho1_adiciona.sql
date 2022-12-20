/** I want to create a trigger that will update the table Equipa whenever a new row is inserted into the table Jogo. The trigger should update the fields pontuacaoTotal, golosMarcados, golosSofridos, diferencaGolos, jogosGanhos, jogosEmpatados and jogosPerdidos of the table Equipa. **/
/** If a team wins it get 3 points, if it loses 0, it its a tie 1 point. **/

PRAGMA foreign_keys = ON;

CREATE TRIGGER gatilho1
AFTER INSERT ON Jogo
BEGIN
   UPDATE Equipa
    SET pontuacaoTotal = pontuacaoTotal + (SELECT CASE WHEN NEW.golosMarcadosVisitante > NEW.golosMarcadosVisitado THEN 3 WHEN NEW.golosMarcadosVisitante < NEW.golosMarcadosVisitado THEN 0 ELSE 1 END),
    golosMarcados = golosMarcados + NEW.golosMarcadosVisitante,
    golosSofridos = golosSofridos + NEW.golosMarcadosVisitado,
    jogosGanhos = jogosGanhos + (SELECT CASE WHEN NEW.golosMarcadosVisitante > NEW.golosMarcadosVisitado THEN 1 ELSE 0 END),
    jogosEmpatados = jogosEmpatados + (SELECT CASE WHEN NEW.golosMarcadosVisitante = NEW.golosMarcadosVisitado THEN 1 ELSE 0 END)
    WHERE nome = NEW.nomeEquipaVisitante;
END;
