/**Quantos golos foram marcados em cada pavilhão **/

.mode columns
.header on
.nullvalue NULL

select p.nome, count(g.idGolo) as golosMarcados
from Pavilhao p
join Equipa e on p.equipa = e.nome
join Jogo j on e.nome = j.nomeEquipaVisitada
join GoloMarcado g on j.idJogo = g.idJogo
group by p.nome
order by golosMarcados desc;

