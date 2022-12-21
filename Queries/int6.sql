.mode columns
.header on
.nullvalue NULL

--Classificação final

SELECT rank() OVER (ORDER BY pontuacaoTotal DESC, diferencaGolos DESC) as position, nome, pontuacaoTotal, jogosGanhos, jogosEmpatados, golosMarcados, golosSofridos, diferencaGolos
FROM Equipa
ORDER BY pontuacaoTotal DESC, diferencaGolos DESC;