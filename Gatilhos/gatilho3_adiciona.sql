PRAGMA foreign_keys = ON;

CREATE TRIGGER gatilho3
BEFORE INSERT ON Jogador
FOR EACH ROW
BEGIN
  SELECT RAISE(ABORT, 'Já existe um jogador com o número de camisola ')
  FROM Jogador
  WHERE numeroCamisola = NEW.numeroCamisola AND equipa = NEW.equipa;
END;