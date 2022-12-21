.mode columns
.header on
.nullvalue NULL

--Maior diferença de golos num jogo

select (select max(golosMarcadosVisitante - golosMarcadosVisitado) from Jogo) as dg, nomeEquipaVisitante, golosMarcadosVisitante, nomeEquipaVisitada, golosMarcadosVisitado
from Jogo
where golosMarcadosVisitante - golosMarcadosVisitado = (select max(golosMarcadosVisitante - golosMarcadosVisitado) from Jogo);