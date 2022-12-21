.mode columns
.headers on
.nullvalue NULL


INSERT INTO Equipa (nome, email, telefone, morada, pontuacaoTotal, golosMarcados, golosSofridos, jogosGanhos, jogosEmpatados) VALUES ('Dummy Club', 'hey@gmail.com', '223475842', 'Rua João Franco 6230-363 Almada', 0, 0, 0, 0, 0);
INSERT INTO Pessoa (idPessoa, primeiroNome, segundoNome, idade, pais) VALUES (291, 'Alvaro', 'Gonçalves', 40, 'Portugal');
INSERT INTO Pessoa (idPessoa, primeiroNome, segundoNome, idade, pais) VALUES (292, 'Adriano', 'Pereira', 32, 'Portugal');
INSERT INTO Jogador (idJogador, numeroCamisola, posicao, equipa) VALUES (291, 14, 'Pivot', 'Dummy Club');
INSERT INTO Jogador (idJogador, numeroCamisola, posicao, equipa) VALUES (292, 14, 'Ala', 'Dummy Club');