.mode columns
.headers on
.nullvalue NULL

select nomeEquipaVisitada, golosMarcadosVisitado, nomeEquipaVisitante, golosMarcadosVisitante
from Jogo
Where idJogo = 199;

select nome, pontuacaoTotal, golosMarcados, golosSofridos, diferencaGolos, jogosGanhos, jogosEmpatados
from Equipa
where nome = 'Sporting' or nome = 'Benfica';

UPDATE Jogo
SET golosMarcadosVisitante = golosMarcadosVisitante + 1
WHERE idJogo = 199;

select nomeEquipaVisitada, golosMarcadosVisitado, nomeEquipaVisitante, golosMarcadosVisitante
from Jogo
Where idJogo = 199;

select nome, pontuacaoTotal, golosMarcados, golosSofridos, diferencaGolos, jogosGanhos, jogosEmpatados
from Equipa
where nome = 'Sporting' or nome = 'Benfica';