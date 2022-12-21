.mode columns
.header on
.nullvalue NULL

--Equipa que sofreu menos golos

select nome, golosSofridos
from Equipa
order by golosSofridos asc
limit 1;