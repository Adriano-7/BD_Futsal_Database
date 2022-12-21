.mode columns
.headers on
.nullvalue NULL

/*Quais as 3 equipas que sofreram menos golos na fase regular do campeonato*/
SELECT nome, golosSofridos
FROM Equipa
ORDER BY golosSofridos
LIMIT 3;