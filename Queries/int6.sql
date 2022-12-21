.mode columns
.header on
.nullvalue NULL

/*Ver a tabela de classificação final 
lugar, equipa, pontos, jogos, vitorias, empates, derrotas, golos marcados, golos sofridos, diferença de golos
em caso de empate, a classificação é feita pela maior diferença entre o número de golos marcados e o número de golos
sofridos pelos clubes empatados, nos jogos que realizaram entre si
*/
select e.nome, e.pontuacaoTotal, e.jogosGanhos, e.jogosEmpatados, e.golosMarcados, e.golosSofridos, e.diferencaGolos
from equipa e
order by e.pontuacaoTotal desc, e.diferencaGolos desc;
