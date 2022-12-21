.mode columns
.header on
.nullvalue NULL

-- Equipas que marcaram pelo menos um golo em todos os jogos em que participaram

SELECT nome FROM Equipa 
WHERE NOT EXISTS (
    SELECT * FROM Jogo WHERE (nomeEquipaVisitante = nome AND golosMarcadosVisitante = 0) 
    OR (nomeEquipaVisitada = nome AND golosMarcadosVisitado = 0)
);
