/*Maior diferença de golos num jogo entre as duas equipas*/
select (select max(golosMarcadosVisitante - golosMarcadosVisitado) from Jogo) as dg, nomeEquipaVisitante, golosMarcadosVisitante, nomeEquipaVisitada, golosMarcadosVisitado
from Jogo
where golosMarcadosVisitante - golosMarcadosVisitado = (select max(golosMarcadosVisitante - golosMarcadosVisitado) from Jogo);