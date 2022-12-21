.mode columns
.headers on
.nullvalue NULL

SELECT nome, golosMarcados, golosSofridos, jogosGanhos, jogosEmpatados
FROM Equipa
WHERE nome = 'Benfica' or nome = 'SC Braga/AAUM';

INSERT INTO Jogo  VALUES (200, '25/06', 4, 3, 'Benfica', 'SC Braga/AAUM', 215, NULL, 'FINAL');

SELECT nome, golosMarcados, golosSofridos, jogosGanhos, jogosEmpatados
FROM Equipa
WHERE nome = 'Benfica' or nome = 'SC Braga/AAUM';