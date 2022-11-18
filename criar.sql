DROP TABLE IF EXISTS Arbitro;
DROP TABLE IF EXISTS Equipa;
DROP TABLE IF EXISTS Jogador;
DROP TABLE IF EXISTS Treinador;
DROP TABLE IF EXISTS Pessoa;
DROP TABLE IF EXISTS Pavilhao;
DROP TABLE IF EXISTS Jornada;
DROP TABLE IF EXISTS Playoff;
DROP TABLE IF EXISTS Jogo;
DROP TABLE IF EXISTS GoloMarcado;

CREATE TABLE Arbitro (
    idArbitro INTEGER PRIMARY KEY REFERENCES Pessoa (idPessoa) ON DELETE CASCADE ON UPDATE CASCADE, 
    distrito VARCHAR (75) NOT NULL
);

CREATE TABLE Equipa (
    nome VARCHAR (150) PRIMARY KEY ON CONFLICT IGNORE, 
    email VARCHAR (150) UNIQUE NOT NULL, 
    telefone VARCHAR (150) UNIQUE, 
    morada VARCHAR (150) NOT NULL UNIQUE, 
    pontuacaoTotal INTEGER DEFAULT (0), 
    golosMarcados INTEGER DEFAULT (0), 
    golosSofridos INTEGER DEFAULT (0), 
    diferencaGolos INTEGER AS (golosMarcados - golosSofridos), 
    jogosGanhos INTEGER DEFAULT (0), 
    jogosEmpatados INTEGER DEFAULT (0)
);

CREATE TABLE GoloMarcado (
    idGolo INTEGER PRIMARY KEY, 
    minuto INTEGER NOT NULL, 
    idJogador INTEGER REFERENCES Jogador (idJogador) ON DELETE CASCADE ON UPDATE CASCADE NOT NULL, 
    idJogo INTEGER REFERENCES Jogo (idJogo) ON DELETE CASCADE ON UPDATE CASCADE NOT NULL
);

CREATE TABLE Jogador (
    idJogador INTEGER PRIMARY KEY REFERENCES Pessoa (idPessoa) ON DELETE CASCADE ON UPDATE CASCADE, 
    numeroCamisola INTEGER CHECK (1 < numeroCamisola < 99) NOT NULL, 
    posicao VARCHAR (75) NOT NULL, 
    equipa VARCHAR (75) REFERENCES Equipa (nome) ON DELETE CASCADE ON UPDATE CASCADE NOT NULL
);

CREATE TABLE Jogo (
    idJogo INTEGER PRIMARY KEY, 
    data VARCHAR (75) NOT NULL, 
    golosMarcadosVisitante INTEGER, 
    golosMarcadosVisitada INTEGER, 
    nomeEquipaVisitada VARCHAR (75) REFERENCES Equipa (nome), 
    nomeEquipaVisitante VARCHAR (75) REFERENCES Equipa (nome), 
    arbitro INTEGER REFERENCES Pessoa (idPessoa), 
    numeroJornada INTEGER REFERENCES Jornada (numero), 
    fasePlayOff VARCHAR (75) REFERENCES Playoff (fase)
);

CREATE TABLE Jornada (
    numero INTEGER PRIMARY KEY, 
    dataInicio VARCHAR (75) NOT NULL, 
    dataFim VARCHAR (75) NOT NULL
);

CREATE TABLE Pavilhao (
    idPavilhao INTEGER PRIMARY KEY, 
    nome VARCHAR (75) NOT NULL, 
    cidade VARCHAR (75) NOT NULL, 
    lotacao INTEGER NOT NULL, 
    equipa VARCHAR (75) REFERENCES Equipa (nome) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Pessoa (
    idPessoa INTEGER PRIMARY KEY, 
    primeiroNome VARCHAR (75) NOT NULL, 
    segundoNome VARCHAR (75), 
    idade INTEGER (75) NOT NULL, 
    pais VARCHAR (75) NOT NULL
);

CREATE TABLE Playoff (
    fase VARCHAR (75) PRIMARY KEY NOT NULL, 
    dataInicio VARCHAR (75) NOT NULL, 
    dataFim VARCHAR (75) NOT NULL
);

CREATE TABLE Treinador (
    idTreinador INTEGER PRIMARY KEY REFERENCES Pessoa (idPessoa) ON DELETE CASCADE ON UPDATE CASCADE, 
    equipa VARCHAR (75) REFERENCES Equipa (nome) ON DELETE CASCADE ON UPDATE CASCADE
);
