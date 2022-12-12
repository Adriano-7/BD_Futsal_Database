/*Percentagem de vitórias em casa e fora de cada equipa*/

select nome, ROUND((jogosGanhosCasa*100.0/nJogosCasa),2) as percentagemVitoriasCasa, ROUND((jogosGanhosFora*100.0/nJogosFora),2) as percentagemVitoriasFora
from
(
select nomeEquipaVisitada ,count(*) as jogosGanhosCasa
from Jogo
where golosMarcadosVisitante < golosMarcadosVisitado
group by nomeEquipaVisitada
)
join
(
select nomeEquipaVisitante ,count(*) as jogosGanhosFora
from Jogo
where golosMarcadosVisitante > golosMarcadosVisitado
group by nomeEquipaVisitante
)
on nomeEquipaVisitada = nomeEquipaVisitante
join
(
select nomeEquipaVisitada as NVisitada ,count(*) as nJogosCasa
from Jogo
group by nomeEquipaVisitada
)
on NVisitada = nomeEquipaVisitante
join
(
select nomeEquipaVisitante as nome ,count(*) as nJogosFora
from Jogo
group by nomeEquipaVisitante
)
on NVisitada = nome
