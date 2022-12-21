PRAGMA foreign_keys = ON;

BEFORE INSERT ON Jogador
FOR EACH ROW
BEGIN
    SELECT
        CASE
            WHEN (SELECT COUNT(*) FROM Treinador WHERE idTreinador = NEW.idJogador) > 0 OR
                 (SELECT COUNT(*) FROM Arbitro WHERE idArbitro = NEW.idJogador) > 0 THEN
                RAISE(ABORT, 'Não é possível inserir um jogador com o mesmo id de um treinador ou árbitro.')
        END;
END;