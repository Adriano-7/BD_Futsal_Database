.mode columns
.headers on
.nullvalue NULL


SELECT nomeEquipaVisitante, nomeEquipaVisitada, golosMarcadosVisitante, golosMarcadosVisitado FROM Jogo WHERE idJogo = 174;

INSERT INTO GoloMarcado (idGolo, minuto, idJogador, idJogo) VALUES (1165, 10, 74, 174);

SELECT nomeEquipaVisitante, nomeEquipaVisitada, golosMarcadosVisitante, golosMarcadosVisitado FROM Jogo WHERE idJogo = 174;