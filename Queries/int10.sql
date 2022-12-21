.mode columns
.header on
.nullvalue NULL

--Equipa que marcou pelo menos um golo em todos os jogos em que participou

SELECT nome FROM Equipa 
WHERE NOT EXISTS (
    SELECT * FROM Jogo WHERE (nomeEquipaVisitante = nome AND golosMarcadosVisitante = 0) 
    OR (nomeEquipaVisitada = nome AND golosMarcadosVisitado = 0)
);
