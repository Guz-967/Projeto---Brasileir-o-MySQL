# Setup do Banco
DROP DATABASE IF EXISTS BRASILEIRAO_2026;
CREATE DATABASE BRASILEIRAO_2026;
USE BRASILEIRAO_2026;

/*SHOW DATABASES*/

DROP TABLE IF EXISTS FORMACOES;
CREATE TABLE FORMACOES
(
ID_FORMACOES int not null auto_increment PRIMARY KEY,
MENTALIDADE_PADRAO enum('DEFENSIVA','OFENSIVA','EQUILIBRADA') not null,
ESTILO_JOGO varchar(300) not null,
ESQUEMA_TATICO varchar(300) not null,
DATA_REGISTRO datetime not null
);

# INSERT FORMACOES
INSERT INTO FORMACOES
(MENTALIDADE_PADRAO,ESTILO_JOGO,ESQUEMA_TATICO,DATA_REGISTRO)
VALUES
('EQUILIBRADA', 'Reativo/Transição Rápida', '4-2-3-1', NOW()),
('OFENSIVA', 'Posicional', '4-3-3', NOW()),
('DEFENSIVA', 'Organização Defensiva/Contra-ataque', '4-2-3-1', NOW()),
('EQUILIBRADA', 'Jogo de Transição/Pressão Média', '4-3-3', NOW()),
('EQUILIBRADA', 'Controle de Jogo/Equilíbrio', '4-3-3', NOW()),
('OFENSIVA', 'Aposicional (Dinizismo)', '4-2-3-1', NOW()),
('OFENSIVA', 'Jogo de Posição/Construção', '4-3-3', NOW()),
('OFENSIVA', 'Intensidade/Vertical/Pressão Alta', '4-1-3-2', NOW()),
('OFENSIVA', 'Vertical/Ataque Total', '4-2-4', NOW()),
('OFENSIVA', 'Jogo de Aproximação e Liberdade', '4-2-3-1', NOW());

UPDATE FORMACOES
SET MENTALIDADE_PADRAO = 'OFENSIVA'
WHERE ESTILO_JOGO = 'Reativo/Transição Rápida';

UPDATE FORMACOES
SET ESQUEMA_TATICO = '3-4-3'
WHERE ESTILO_JOGO = 'Posicional';

UPDATE FORMACOES
SET ESTILO_JOGO = 'Contra-ataque Compacto'
WHERE ESTILO_JOGO = 'Organização Defensiva/Contra-ataque';

UPDATE FORMACOES
SET MENTALIDADE_PADRAO = 'EQUILIBRADA'
WHERE ESTILO_JOGO = 'Jogo de Transição/Pressão Média';

UPDATE FORMACOES
SET ESQUEMA_TATICO = '4-1-3-2'
WHERE ESTILO_JOGO = 'Jogo de Posição/Construção';

SELECT * FROM FORMACOES;

DROP TABLE IF EXISTS TECNICOS;
CREATE TABLE TECNICOS
(
	ID_TECNICOS int not null auto_increment primary key,
    CNRM_TECNICO varchar(300) not null,
    NUM_CARTOES_AMAR int default "0",
	NUM_VITORIA int default "0",
    NUM_TITULOS int default "0",
	NUM_DERROTAS int default "0",
    TEMPO_CONTRATO_MESES int default "0",
    DATA_NASCIMENTO date not null,
    DATA_INICIO_CONTRATO date not null,	
    DATA_FIM_CONTRATO date not null,
    NUM_CARTOES_VERM int default "0",
	NUM_PARTIDAS int not null,
    CPF_TECNICO varchar(300) not null,
    NOME_TECNICO varchar(300) not null,
    NUM_EXPULSOES int default "0",
    DATA_REGISTRO datetime not null
);

# INSERT TECNICOS
INSERT INTO TECNICOS
(CNRM_TECNICO, NUM_CARTOES_AMAR,NUM_VITORIA, NUM_TITULOS,NUM_DERROTAS,TEMPO_CONTRATO_MESES,DATA_NASCIMENTO,DATA_INICIO_CONTRATO,DATA_FIM_CONTRATO,NUM_CARTOES_VERM,NUM_PARTIDAS,CPF_TECNICO,NOME_TECNICO,NUM_EXPULSOES,DATA_REGISTRO)
VALUES
('CNRM-4455', 3, 6, 12, 1, 24, '1978-12-22', '2025-12-01', '2027-12-31', 0, 9, '00011122233', 'Abel Ferreira', 9, NOW()), 	
('CNRM-2233', 1, 5, 2, 2, 12, '1975-04-25', '2026-01-05', '2027-01-05', 0, 9, '44455566677', 'Roger Machado', 0, NOW()),
('CNRM-1122', 2, 3, 4, 3, 12, '1973-09-26', '2025-12-15', '2026-12-15', 0, 8, '11122233300', 'Fábio Carille', 0, NOW()),
('CNRM-3344', 4, 4, 1, 3, 18, '1982-10-09', '2025-06-01', '2026-12-31', 1, 9, '33344455511', 'António Oliveira', 1, NOW()),
('CNRM-8080', 0, 7, 16, 1, 24, '1961-05-25', '2025-01-01', '2026-12-31', 0, 9, '67890123456', 'Adenor Leonardo Bachi', 0, NOW()),
('CNRM-6060', 5, 4, 4, 3, 24, '1974-03-27', '2024-12-10', '2026-12-10', 1, 9, '45678901234', 'Fernando Diniz', 5, NOW()),
('CNRM-7766', 1, 5, 2, 2, 24, '1961-09-03', '2025-12-15', '2027-12-31', 0, 9, '22233344455', 'Luís Castro', 0, NOW()),
('CNRM-7070', 3, 5, 1, 2, 12, '1974-09-12', '2026-01-10', '2026-12-31', 0, 9, '56789012345', 'Eduardo Coudet', 0, NOW()),
('CNRM-5050', 2, 6, 1, 2, 18, '1972-01-01', '2025-04-01', '2026-10-01', 0, 9, '34567890123', 'Artur Jorge', 0, NOW()),
('CNRM-9988', 2, 3, 5, 4, 9, '1962-09-09', '2026-03-20', '2026-12-31', 1, 7, '88899900011', 'Renato Portaluppi', 1, NOW());

# UPDATE TECNICOS
UPDATE TECNICOS
SET CNRM_TECNICO = 0
WHERE ID_TECNICOS IN (2,3,5,6,10);

UPDATE TECNICOS
SET CPF_TECNICO = 0
WHERE ID_TECNICOS IN (1,4,7,8,9);

SELECT * FROM TECNICOS;

DROP TABLE IF EXISTS TECNICOS_FORMACOES;
CREATE TABLE TECNICOS_FORMACOES
(
ID_TECNICOS_FORMACOES int not null auto_increment PRIMARY KEY,
ID_TECNICOS int not null,
ID_FORMACOES int not null,
DATA_REGISTRO datetime,
FOREIGN KEY (ID_TECNICOS) REFERENCES TECNICOS(ID_TECNICOS),
FOREIGN KEY (ID_FORMACOES) REFERENCES FORMACOES(ID_FORMACOES)
);

# INSERT TECNICOS_FORMACOES
INSERT INTO TECNICOS_FORMACOES
(ID_TECNICOS,ID_FORMACOES,DATA_REGISTRO)
VALUES
(1,8,NOW()),
(2,5,NOW()),
(3,3,NOW()),
(4,7,NOW()),
(5,9,NOW()),
(6,6,NOW()),
(7,2,NOW()),
(8,1,NOW()),
(9,7,NOW()),
(10,4,NOW());

# UPDATE TECNICOS_FORMACOES
UPDATE TECNICOS_FORMACOES
SET ID_FORMACOES = 1
WHERE ID_TECNICOS = 1;

UPDATE TECNICOS_FORMACOES
SET ID_FORMACOES = 2
WHERE ID_TECNICOS = 2;

UPDATE TECNICOS_FORMACOES
SET ID_FORMACOES = 3
WHERE ID_TECNICOS = 3;


UPDATE TECNICOS_FORMACOES
SET ID_FORMACOES = 4
WHERE ID_TECNICOS = 4;

UPDATE TECNICOS_FORMACOES
SET ID_FORMACOES = 5
WHERE ID_TECNICOS = 5;

SELECT * FROM TECNICOS_FORMACOES;

DROP TABLE IF EXISTS PRESIDENTES;
CREATE TABLE PRESIDENTES 
(
	ID_PRESIDENTES int not null auto_increment PRIMARY KEY,
    CPF_PRESIDENTE varchar(300) not null,
    DATA_INICIO_MANDATO date not null,
    DATA_FIM_MANDATO date not null,
    TIPO_ENTIDADE enum('DEMOCRACIA','SAF') not null,
    DATA_NASCIMENTO date not null,
    SEXO enum('M','F') not null,
    NOME_PRESIDENTE varchar (300) not null,
    DATA_REGISTRO datetime not null
);

# INSERT PRESIDENTES
INSERT INTO PRESIDENTES
(ID_PRESIDENTES, CPF_PRESIDENTE, DATA_INICIO_MANDATO, DATA_FIM_MANDATO, TIPO_ENTIDADE, DATA_NASCIMENTO, SEXO, NOME_PRESIDENTE, DATA_REGISTRO)
VALUES
(1, '123.456.789-01', '2021-01-01', '2024-12-31', 'DEMOCRACIA', '1962-04-18', 'M', 'Julio Casares', NOW()),
(2, '345.736.809-02', '2021-01-01', '2023-12-31', 'DEMOCRACIA', '1959-08-10', 'M', 'Andres Rueda', NOW()),
(3, '289.447.525-03', '2024-01-01', '2026-12-31', 'DEMOCRACIA', '1974-02-15', 'M', 'Augusto Melo', NOW()),
(4, '113.950.333-04', '2022-01-01', '2024-12-31', 'DEMOCRACIA', '1964-09-22', 'M', 'Leila Pereira', NOW()),
(5, '564.135.572-05', '2023-01-01', '2025-12-31', 'SAF', '1961-11-02', 'M', 'Alberto Guerra', NOW()),
(6, '742.220.436-06', '2024-01-01', '2026-12-31', 'DEMOCRACIA', '1969-05-20', 'M', 'Alessandro Barcellos', NOW()),
(7, '126.164.873-07', '2019-01-01', '2024-12-31', 'DEMOCRACIA', '1976-12-25', 'M', 'Rodolfo Landim', NOW()),
(8, '253.777.352-08', '2022-01-01', '2025-12-31', 'DEMOCRACIA', '1970-03-11', 'M', 'Mário Bittencourt', NOW()),
(9, '367.677.732-09', '2022-01-01', '2025-12-31', 'SAF', '1978-07-30', 'M', 'John Textor', NOW()),
(10, '123.456.789-10', '2024-01-01', '2026-12-31', 'SAF', '1977-04-13', 'M', 'Pedrinho', NOW());

# UPDATE PRESIDENTES
UPDATE PRESIDENTES
	SET CPF_PRESIDENTE = '345.678.910-01'
WHERE ID_PRESIDENTES = 1;

UPDATE PRESIDENTES
	SET 
    NOME_PRESIDENTE = 'Marcelo Teixeira', 
    DATA_INICIO_MANDATO = '2024-01-01', 
    DATA_FIM_MANDATO = '2027-12-31'
WHERE ID_PRESIDENTES = 2;

UPDATE PRESIDENTES
SET
    SEXO = 'F',
    DATA_NASCIMENTO = '1965-11-28'
WHERE ID_PRESIDENTES = 4;

UPDATE PRESIDENTES
SET
    TIPO_ENTIDADE = 'DEMOCRACIA',
    DATA_FIM_MANDATO = '2026-12-31'
WHERE ID_PRESIDENTES = 5;

UPDATE PRESIDENTES
SET
    TIPO_ENTIDADE = 'DEMOCRACIA',
    DATA_INICIO_MANDATO = '2025-01-01',
    DATA_FIM_MANDATO = '2027-12-31'
WHERE ID_PRESIDENTES = 10;

SELECT * FROM PRESIDENTES;

DROP TABLE IF EXISTS FORNECEDORES;
CREATE TABLE FORNECEDORES 
(
	ID_FORNECEDORES int not null auto_increment PRIMARY KEY,
    NOME_FORNECEDORES varchar(300) not null,
    SITE_FORNECEDORES varchar(300) default('0'),
    PAIS_ORIGEM varchar(300) not null,
    NUM_CLUBES int not null,
    LOGO blob default('0'),
    DATA_FUNDACAO date not null,
    CNPJ_FORNECEDORES varchar(300) not null,
    DATA_REGISTRO datetime not null
);

# INSERT FORNECEDORES
INSERT INTO FORNECEDORES 
(NOME_FORNECEDORES, PAIS_ORIGEM, NUM_CLUBES, DATA_FUNDACAO, CNPJ_FORNECEDORES, DATA_REGISTRO) 
VALUES
('New Balance', 'EUA', 12, '1906-01-01', '11.111.111/0001-01', NOW()),
('Umbro', 'Inglaterra', 40, '1924-05-23', '22.222.222/0001-02', NOW()),
('Nike', 'EUA', 60, '1964-01-25', '33.333.333/0001-03', NOW()),
('Puma', 'Brasil', 35, '1948-10-01', '44.444.444/0001-04', NOW()),
('Umbro', 'Inglaterra', 40, '1924-05-23', '22.222.222/0001-05', NOW()),
('Adidas', 'Alemanha', 55, '1949-08-18', '55.555.555/0001-06', NOW()),
('Adidas', 'Alemanha', 55, '1949-08-18', '55.555.555/0001-07', NOW()),
('Umbro', 'Inglaterra', 40, '1924-05-23', '22.222.222/0001-08', NOW()),
('Reebok', 'EUA', 15, '1958-01-01', '66.666.666/0001-09', NOW()),
('Kappa', 'Italia', 25, '1916-01-01', '77.777.777/0001-10', NOW());

# UPDATE FORNECEDORES
UPDATE FORNECEDORES
   SET DATA_FUNDACAO = '1998-12-13'
 WHERE ID_FORNECEDORES = 3;

UPDATE FORNECEDORES
   SET NUM_CLUBES = 58
 WHERE ID_FORNECEDORES = 6;

UPDATE FORNECEDORES
   SET PAIS_ORIGEM = 'Alemanha'
 WHERE ID_FORNECEDORES = 4;

UPDATE FORNECEDORES
   SET CNPJ_FORNECEDORES = '22.222.222/0001-99'
 WHERE ID_FORNECEDORES = 8;

UPDATE FORNECEDORES
   SET 
   NOME_FORNECEDORES = 'Reebok',
   PAIS_ORIGEM = 'EUA',
   NUM_CLUBES = 16,
   DATA_FUNDACAO = '1958-08-10',
   CNPJ_FORNECEDORES = '88.888.888/0001-88'
 WHERE ID_FORNECEDORES = 7;
 
SELECT * FROM FORNECEDORES;

DROP TABLE IF EXISTS ESTADIOS;
CREATE TABLE ESTADIOS
(
	ID_ESTADIOS int not null auto_increment PRIMARY KEY,
	CAPACIDADE_MAXIMA int not null,
	CIDADE varchar(300) not null,
	NIVEL_ILUMINACAO float not null,
	ALTITUDE float not null,
	DIMENSOES_CAMPO float not null,
	TIPO_GRAMADO varchar(300) not null,
	ENDERECO varchar(300) not null,
	POSSUI_VAR boolean not null,
	VALOR_DE_CONSTRUCAO float not null,
	NOME_OFICIAL varchar(300) not null,
	NOME_POPULAR varchar(300) not null,
	DATA_REGISTRO datetime not null
);

# INSERT ESTADIOS
INSERT INTO ESTADIOS
(CAPACIDADE_MAXIMA, CIDADE, NIVEL_ILUMINACAO, ALTITUDE, DIMENSOES_CAMPO, TIPO_GRAMADO, ENDERECO, POSSUI_VAR, VALOR_DE_CONSTRUCAO, NOME_OFICIAL, NOME_POPULAR, DATA_REGISTRO)
VALUES
(66795, 'São Paulo', 2500.0, 760.0, 105.0, 'Natural', 'Praça Roberto Gomes Pedrosa, 1', true, 150000000.0, 'Cícero Pompeu de Toledo', 'Morumbis (São Paulo)', NOW()),
(47605, 'São Paulo', 3000.0, 760.0, 105.0, 'Híbrida', 'Av. Miguel Ignácio Curi, 111', true, 1100000000.0, 'Neo Química Arena', 'Arena Corinthians', NOW()),
(44335, 'São Paulo', 2800.0, 760.0, 105.0, 'Sintético', 'Rua Palestra Itália, 200', true, 660000000.0, 'Allianz Parque', 'Arena Palmeiras', NOW()),
(16062, 'Santos', 1800.0, 2.0, 105.0, 'Natural', 'Rua Princesa Isabel, s/n', true, 50000000.0, 'Urbano Caldeira', 'Vila Belmiro (Santos)', NOW()),
(44661, 'Rio de Janeiro', 2200.0, 5.0, 105.0, 'Sintético', 'Rua José dos Reis, 425', true, 380000000.0, 'Nilton Santos', 'Engenhão (Botafogo)', NOW()),
(78838, 'Rio de Janeiro', 3000.0, 2.0, 105.0, 'Natural', 'Av. Pres. Castelo Branco, s/n', true, 1200000000.0, 'Jornalista Mário Filho', 'Maracanã (Flamengo)', NOW()),
(42000, 'Curitiba', 2000.0, 935.0, 105.0, 'Sintético', 'Rua Buenos Aires, 1260', true, 390000000.0, 'Mário Celso Petraglia', 'Arena da Baixada', NOW()),
(21880, 'Rio de Janeiro', 1500.0, 5.0, 105.0, 'Natural', 'Rua General Almério de Moura, 131', false, 80000000.0, 'São Januário', 'Caldeirão (Vasco)', NOW()),
(55662, 'Porto Alegre', 2100.0, 10.0, 105.0, 'Híbrida', 'Av. Padre Leopoldo Brentano, 110', true, 600000000.0, 'Arena do Grêmio', 'Arena do Grêmio', NOW()),
(50842, 'Porto Alegre', 2000.0, 10.0, 105.0, 'Natural', 'Av. Padre Cacique, 891', true, 330000000.0, 'José Pinheiro Borda', 'Beira-Rio (Internacional)', NOW());

# UPDATE ESTADIOS
UPDATE ESTADIOS
SET NOME_POPULAR = 'Maracanã (Flamengo) (Fluminense)'
WHERE NOME_OFICIAL = 'Jornalista Mário Filho';

UPDATE ESTADIOS
SET TIPO_GRAMADO = 'Natural'
WHERE TIPO_GRAMADO = 'Híbrida';

UPDATE ESTADIOS
SET POSSUI_VAR = true
WHERE NOME_OFICIAL = 'São Januário';

UPDATE ESTADIOS
SET NOME_POPULAR = 'Nubank Parque'
WHERE NOME_OFICIAL = 'Allianz Parque';

UPDATE ESTADIOS
SET ENDERECO = 'Rua Princesa Isabel'
WHERE CIDADE = 'Santos';

SELECT * FROM ESTADIOS;

DROP TABLE IF EXISTS CLUBES;
CREATE TABLE CLUBES
(
	ID_CLUBES int not null auto_increment PRIMARY KEY,
    ID_PRESIDENTES int not null,
    ID_TECNICOS int not null,
    ID_FORNECEDORES int not null,
    ID_ESTADIOS int not null,
    NOME_CLUBES varchar (300) not null,
	ESTADOS_CLUBES varchar (300) not null, 
    NUM_CARTOES_AMAR int default '0', 
    NUM_CARTOES_VERM int default '0', 
    CIDADE_CLUBES varchar (300) not null, 
    NUM_JOGADORES int not null, 
    CNPJ_CLUBES varchar (300) not null,
    ESCUDO_CLUBES blob not null,   
    NUM_TITULOS int not null, 
    DIRETORIA_CLUBES varchar (300) not null, 
    DATA_FUNDACAO date not null, 
    NUM_COMISSAO_TECNICA int not null,
	DATA_REGISTRO datetime not null,
    FOREIGN KEY (ID_PRESIDENTES) REFERENCES PRESIDENTES(ID_PRESIDENTES),
    FOREIGN KEY (ID_TECNICOS) REFERENCES TECNICOS(ID_TECNICOS),
    FOREIGN KEY (ID_FORNECEDORES) REFERENCES FORNECEDORES(ID_FORNECEDORES),
    FOREIGN KEY (ID_ESTADIOS) REFERENCES ESTADIOS(ID_ESTADIOS)
);

# INSERT CLUBES
INSERT INTO CLUBES
(ID_PRESIDENTES, ID_TECNICOS, ID_FORNECEDORES,ID_ESTADIOS, NOME_CLUBES, ESTADOS_CLUBES, NUM_CARTOES_AMAR, NUM_CARTOES_VERM, CIDADE_CLUBES, NUM_JOGADORES, CNPJ_CLUBES, ESCUDO_CLUBES, NUM_TITULOS, DIRETORIA_CLUBES, DATA_FUNDACAO, NUM_COMISSAO_TECNICA, DATA_REGISTRO)
VALUES
(1, 1, 1, 1, 'São Paulo Futebol Clube', 'SP', 42, 2, 'São Paulo', 35, '60.527.985/0001-34', 'https://path.to/spfc.png', 48, 'Diretoria Executiva', '1930-01-25', 18, NOW()),
(2, 2, 2, 2, 'Santos Futebol Clube', 'Santos', 38, 1, 'Santos', 31, '58.200.015/0001-45', 'https://path.to/sfc.png', 42, 'Comitê de Gestão', '1912-04-14', 14, NOW()),
(3, 3, 3, 3, 'Sport Club Corinthians Paulista', 'SP', 60, 5, 'São Paulo', 36, '61.902.722/0001-12', 'https://path.to/sccp.png', 45, 'Diretoria de Futebol', '1910-09-01', 17, NOW()),
(4, 4, 4, 4, 'Sociedade Esportiva Palmeiras', 'SP', 48, 3, 'São Paulo', 34, '62.465.747/0001-31', 'https://path.to/sep.png', 51, 'Presidência Executiva', '1914-08-26', 19, NOW()),
(5, 5, 5, 5, 'Grêmio FBPA', 'RJ', 50, 4, 'Porto Alegre', 35, '92.771.695/0001-40', 'https://path.to/gremio.png', 43, 'Conselho de Administração', '1903-09-15', 18, NOW()),
(6, 6, 6, 6, 'Sport Club Internacional', 'RS', 53, 5, 'Porto Alegre', 34, '92.894.216/0001-31', 'https://path.to/sci.png', 45, 'Diretoria Geral', '1909-04-04', 16, NOW()),
(7, 7, 7, 7, 'Clube de Regatas do Flamengo', 'RJ', 55, 4, 'Rio de Janeiro', 38, '33.649.575/0001-99', 'https://path.to/fla.png', 52, 'Conselho Diretor', '1895-11-17', 20, NOW()),
(8, 8, 8, 8, 'Fluminense Football Club', 'RJ', 44, 3, 'Rio de Janeiro', 33, '33.647.553/0001-90', 'https://path.to/ffc.png', 34, 'Presidência', '1902-07-21', 15, NOW()),
(9, 9, 9, 9, 'Botafogo de Futebol e Regatas', 'RJ', 39, 2, 'Rio de Janeiro', 30, '33.641.747/0001-69', 'https://path.to/bfr.png', 21, 'Gestão SAF', '1904-08-12', 14, NOW()),
(10, 10, 10, 10, 'Club de Regatas Vasco da Gama', 'RJ', 57, 6, 'Rio de Janeiro', 32, '33.617.465/0001-45', 'https://path.to/crvg.png', 24, 'Gestão SAF', '1898-08-21', 16, NOW());

# UPDATE CLUBES
UPDATE CLUBES
SET ESTADOS_CLUBES = 'SP'
WHERE NOME_CLUBES = 'Santos Futebol Clube';

UPDATE CLUBES
SET NUM_TITULOS = 999
WHERE NOME_CLUBES = 'Sport Club Internacional';

UPDATE CLUBES
SET DIRETORIA_CLUBES = 'Presidência Executiva'
WHERE NOME_CLUBES = 'Club de Regatas Vasco da Gama';

UPDATE CLUBES
SET ESTADOS_CLUBES = 'RS'
WHERE NOME_CLUBES = 'Grêmio FBPA';

UPDATE CLUBES
SET NUM_COMISSAO_TECNICA = 20
WHERE NOME_CLUBES = 'Botafogo de Futebol e Regatas';

SELECT * FROM CLUBES;

DROP TABLE IF EXISTS JOGOS;
CREATE TABLE JOGOS
(
	ID_JOGOS int not null auto_increment PRIMARY KEY,
	ID_ESTADIOS int not null,
    HORARIO_INICIO datetime not null,
    HORARIO_TERMINO datetime not null,
    DATA_DO_JOGO date not null,
    PLACAR VARCHAR(300) not null,
    TEMPO_DURACAO time, 
    CLUBE_CASA VARCHAR(300) not null,
    CLUBE_FORA VARCHAR(300) not null,
    RODADA int not null,
    VAR_1 VARCHAR(300) not null,
    VAR_2 VARCHAR(300) not null,
    VAR_3 VARCHAR(300) not null,
    VAR_4 VARCHAR(300) not null,
    BANDEIRINHA_1 VARCHAR(300) not null,
    BANDEIRINHA_2 VARCHAR(300) not null,
	DATA_REGISTRO datetime not null,
    FOREIGN KEY (ID_ESTADIOS) REFERENCES ESTADIOS (ID_ESTADIOS)
);
    
# INSERT JOGOS
INSERT INTO JOGOS 
(ID_ESTADIOS, HORARIO_INICIO, HORARIO_TERMINO, DATA_DO_JOGO, PLACAR, TEMPO_DURACAO, CLUBE_CASA, CLUBE_FORA, RODADA,VAR_1, VAR_2, VAR_3,VAR_4, BANDEIRINHA_1, BANDEIRINHA_2, DATA_REGISTRO)
VALUES
-- JOGO 1: Palmeiras x Corinthians
(1,'2026-03-06 16:00:00','2026-03-06 18:00:00','2026-03-06','2x1','01:50:00','Palmeiras','Palmeiras',1,'João Silva','Carlos Lima','Renato Alves','Marcos Pinto','Pedro Rocha','Lucas Nunes',NOW()),

-- JOGO 2: São Paulo x Santos
(2,'2026-05-02 20:30:00','2026-03-06 22:30:00','2026-03-06','0x0','01:50:00','São Paulo','Santos',1,'André Costa','Bruno Viana','Felipe Souza','Rafael Moraes','Igor Teixeira','Daniel Azevedo',NOW()),

-- JOGO 3: Flamengo x Vasco da Gama
(3,'2026-03-07 13:00:00','2026-03-07 15:00:00','2026-03-07','3x2','01:55:00','Flamengo','Vasco da Gama',1,'Ricardo Pires','Leandro Faria','Paulo Rios','Thiago Melo','Victor Lopes','Henrique Barros',NOW()),

-- JOGO 4: Grêmio x Internacional
(4,'2026-03-07 17:30:00','2026-03-07 19:30:00','2026-03-07','1x1','01:48:00','Grêmio','Internacional',2,'Eduardo Matos','Sérgio Cunha','Alan Guedes','Otávio Reis','Caio Martins','Bruno Freitas',NOW()),

-- JOGO 5: Vasco da Gama x Botafogo
(5,'2026-03-07 20:00:00','2026-03-07 22:00:00','2026-03-07','2x0','01:52:00','Vasco da Gama','Botafogo',2,'Marcelo Pacheco','Diego Antunes','Luciano Peixoto','Robson Figueiredo','Fábio Teles','Gabriel Prado',NOW()),

-- JOGO 6: Palmeiras x Flamengo
(10,'2026-03-10 19:00:00','2026-03-10 21:00:00','2026-03-10','0x1','01:52:00','Palmeiras','Flamengo',2,'Nelson Araújo','Vitor Dantas','Márcio Leite','Alex Guimarães','Thiago Fonseca','Ruan Batista',NOW()),

-- JOGO 7: Internacional x Corinthians
(7,'2026-03-10 21:30:00','2026-03-07 23:30:00','2026-03-10','4x1','01:54:00','Internacional','Corinthians',3,'Rodrigo Lemos','Caetano Siqueira','Hugo Pimenta','Renato Afonso','Samuel Ribeiro','Diego Paiva',NOW()),

-- JOGO 8: Botafogo x Fluminense
(8,'2026-03-13 13:00:00','2026-03-13 15:00:00','2026-03-13','1x0','01:50:00','Botafogo','Fluminense',3,'Luiz Fernando','Adriano Neves','Pedro Furtado','Gustavo Meireles','Rafael Cunha','Felipe Dorneles',NOW()),

-- JOGO 9: Santos x Fluminense
(9,'2026-03-13 18:30:00','2026-03-13 20:30:00','2026-03-13','2x2','01:55:00','Santos','Fluminense',3,'William Rocha','Jorge Pinheiro','Danilo Rocha','Caio Vasconcelos','Bruno Torres','Matheus Abreu',NOW()),

-- JOGO 10: Botafogo x São Paulo
(8,'2026-03-13 21:00:00','2026-03-13 23:00:00','2026-03-13','3x0','01:49:00','Botafogo','São Paulo',4,'Alex Sandro','Leonardo Motta','Renan Pacheco','Sérgio Lopes','Igor Farias','Eduardo Lima',NOW());

# UPDATE JOGOS
UPDATE JOGOS
SET PLACAR = '1x9'
WHERE ID_JOGOS = 4;

UPDATE JOGOS
SET RODADA = 3
WHERE ID_JOGOS = 10;

UPDATE JOGOS
SET BANDEIRINHA_1 = 'Anderson Daronco'
WHERE CLUBE_CASA = 'Grêmio';

UPDATE JOGOS
SET CLUBE_FORA = 'Corinthians'
WHERE ID_JOGOS = 1;

UPDATE JOGOS
SET TEMPO_DURACAO = '01:50:00'
WHERE ID_JOGOS = 5;

SELECT * FROM JOGOS;

DROP TABLE IF EXISTS JOGADORES;
CREATE TABLE JOGADORES
(
	ID_JOGADORES int not null auto_increment PRIMARY KEY,
    ID_CLUBES int not null,
    NOME_COMPLETO varchar (300) not null,
	NUM_GOLS_TOTAIS_CAMP int default '0',
	NUM_FINALIZACOES int default '0',
    IDADE int not null,
    PESO DECIMAL(20,2) not null,
    NUM_TITULARIDADES int default '0',
    NUM_DRIBLES int default '0',
    ALTURA DECIMAL(20,2),
    NUM_DESARMES int default '0',
    NUM_FALTAS_COMETIDAS int default '0',
    NUM_FALTAS_SOFRIDAS int default '0',
    NUM_MINUTOS_JOGADOS int default '0',
    NUMERO_CAMISA int not null, 
    NUM_LESOES int default '0',
    EXPULSOES_TOTAIS int default '0',
    NUM_TITULOS int default '0',
    NUM_GOLS_PER_JOGO int default '0',
    PERNA_DOMINANTE ENUM('DIREITA','ESQUERDA'), 
    NUM_SUBSTITUICOES_RECEBIDAS int default '0',
    NUM_CARTOES_VERMELHOS int default '0',
    PAIS_ORIGEM varchar (300) not null,
    NUM_PARTIDAS_JOGADAS int default '0',
    NUM_SUBSTITUICOES_REALIZADAS int default '0',
    NUM_CARTOES_AMARELOS int default '0',
    NUM_ASSISTENCIAS int default '0',
    DATA_REGISTRO datetime not null,
    FOREIGN KEY (ID_CLUBES) REFERENCES CLUBES(ID_CLUBES)
);

# INSERT JOGADORES
INSERT INTO Jogadores
(ID_CLUBES, NOME_COMPLETO, NUM_GOLS_TOTAIS_CAMP, NUM_FINALIZACOES, IDADE, PESO, NUM_TITULARIDADES, NUM_DRIBLES, ALTURA, NUM_DESARMES, NUM_FALTAS_COMETIDAS, NUM_FALTAS_SOFRIDAS, NUM_MINUTOS_JOGADOS, NUMERO_CAMISA, NUM_LESOES, EXPULSOES_TOTAIS, NUM_TITULOS, NUM_GOLS_PER_JOGO, PERNA_DOMINANTE, NUM_SUBSTITUICOES_RECEBIDAS, NUM_CARTOES_VERMELHOS, PAIS_ORIGEM, NUM_PARTIDAS_JOGADAS, NUM_SUBSTITUICOES_REALIZADAS, NUM_CARTOES_AMARELOS, NUM_ASSISTENCIAS, DATA_REGISTRO)
VALUES
-- 1 - São Paulo
(1, 'Rafael Pires', 0, 0, 34, 88.00, 20, 0, 1.92, 2, 1, 5, 1800, 1, 0, 0, 2, 0, 'DIREITA', 0, 0, 'Brasil', 20, 0, 1, 0, NOW()),
(1, 'Igor Vinicius', 1, 12, 27, 74.00, 15, 25, 1.74, 30, 18, 12, 1350, 2, 1, 0, 3, 0, 'DIREITA', 4, 0, 'Brasil', 18, 2, 3, 5, NOW()),
(1, 'Robert Arboleda', 2, 8, 32, 82.00, 19, 2, 1.89, 45, 12, 8, 1710, 5, 1, 0, 5, 0, 'DIREITA', 1, 0, 'Equador', 19, 0, 4, 1, NOW()),
(1, 'Alan Franco', 1, 5, 27, 78.00, 18, 3, 1.83, 38, 15, 10, 1620, 28, 0, 0, 2, 0, 'DIREITA', 2, 0, 'Argentina', 18, 0, 5, 0, NOW()),
(1, 'Welington Santos', 0, 10, 23, 70.00, 16, 28, 1.75, 35, 20, 15, 1440, 6, 0, 0, 2, 0, 'ESQUERDA', 3, 0, 'Brasil', 17, 3, 2, 4, NOW()),
(1, 'Pablo Maia', 2, 20, 22, 78.00, 20, 12, 1.78, 60, 35, 18, 1800, 29, 0, 0, 3, 0, 'DIREITA', 1, 0, 'Brasil', 20, 0, 6, 2, NOW()),
(1, 'Alisson Euler', 3, 25, 30, 73.00, 18, 15, 1.74, 40, 22, 14, 1600, 25, 0, 0, 4, 0, 'DIREITA', 5, 0, 'Brasil', 19, 2, 3, 6, NOW()),
(1, 'Lucas Moura', 6, 35, 31, 72.00, 14, 55, 1.72, 12, 10, 40, 1260, 7, 1, 0, 15, 0, 'DIREITA', 6, 0, 'Brasil', 15, 5, 2, 4, NOW()),
(1, 'Rodrigo Nestor', 2, 18, 23, 71.00, 12, 22, 1.74, 15, 14, 20, 1080, 11, 1, 0, 3, 0, 'ESQUERDA', 8, 0, 'Brasil', 16, 7, 1, 8, NOW()),
(1, 'Luciano Neves', 8, 40, 31, 77.00, 17, 18, 1.81, 10, 28, 25, 1530, 10, 0, 0, 6, 0, 'ESQUERDA', 9, 0, 'Brasil', 19, 6, 8, 3, NOW()),
(1, 'Jonathan Calleri', 10, 50, 30, 84.00, 18, 5, 1.79, 5, 30, 35, 1620, 9, 1, 0, 4, 1, 'DIREITA', 4, 0, 'Argentina', 18, 0, 5, 2, NOW()),
-- 2 - SANTOS
(2, 'João Paulo', 0, 0, 28, 86.00, 20, 0, 1.88, 1, 0, 4, 1800, 1, 0, 0, 1, 0, 'DIREITA', 0, 0, 'Brasil', 20, 0, 1, 0, NOW()),
(2, 'Aderlan Silva', 1, 8, 33, 75.00, 15, 12, 1.80, 32, 22, 10, 1350, 4, 1, 0, 2, 0, 'DIREITA', 5, 0, 'Brasil', 17, 4, 4, 3, NOW()),
(2, 'Gil Nascimento', 2, 6, 36, 85.00, 19, 1, 1.92, 48, 15, 7, 1710, 3, 0, 0, 10, 0, 'DIREITA', 1, 0, 'Brasil', 19, 0, 2, 1, NOW()),
(2, 'Joaquim Henrique', 1, 7, 25, 80.00, 18, 2, 1.87, 50, 25, 9, 1620, 6, 0, 0, 1, 0, 'DIREITA', 2, 1, 'Brasil', 18, 0, 6, 0, NOW()),
(2, 'Gonzalo Escobar', 0, 9, 27, 72.00, 14, 15, 1.76, 28, 18, 12, 1260, 31, 0, 0, 2, 0, 'ESQUERDA', 4, 0, 'Argentina', 15, 3, 3, 2, NOW()),
(2, 'João Schmidt', 1, 15, 31, 79.00, 19, 8, 1.83, 55, 30, 14, 1710, 5, 0, 0, 3, 0, 'ESQUERDA', 3, 0, 'Brasil', 19, 1, 5, 2, NOW()),
(2, 'Diego Pituca', 2, 22, 31, 70.00, 18, 18, 1.75, 42, 28, 20, 1620, 21, 0, 0, 2, 0, 'ESQUERDA', 4, 0, 'Brasil', 18, 2, 7, 4, NOW()),
(2, 'Giuliano de Paula', 4, 28, 33, 76.00, 15, 20, 1.72, 15, 12, 18, 1350, 10, 1, 0, 5, 0, 'DIREITA', 8, 0, 'Brasil', 17, 6, 1, 7, NOW()),
(2, 'Rómulo Otero', 3, 35, 31, 70.00, 12, 25, 1.65, 10, 15, 22, 1080, 22, 0, 0, 3, 0, 'DIREITA', 7, 0, 'Venezuela', 16, 5, 2, 6, NOW()),
(2, 'Guilherme Augusto', 5, 38, 29, 74.00, 17, 40, 1.80, 12, 14, 25, 1530, 11, 0, 0, 1, 0, 'DIREITA', 6, 0, 'Brasil', 19, 4, 3, 5, NOW()),
(2, 'Julio Furch', 7, 45, 34, 88.00, 13, 3, 1.89, 4, 20, 18, 1170, 9, 1, 0, 4, 0, 'DIREITA', 10, 0, 'Argentina', 16, 8, 2, 1, NOW()),
-- 3 - CORINTHIANS
(3, 'Hugo Souza', 0, 0, 25, 90.00, 15, 0, 1.99, 1, 1, 6, 1350, 1, 0, 0, 4, 0, 'DIREITA', 0, 0, 'Brasil', 15, 0, 2, 0, NOW()),
(3, 'Matheuzinho', 1, 10, 23, 70.00, 12, 30, 1.71, 25, 15, 18, 1080, 2, 1, 0, 5, 0, 'DIREITA', 5, 0, 'Brasil', 14, 4, 3, 4, NOW()),
(3, 'André Ramalho', 1, 6, 32, 81.00, 14, 4, 1.82, 40, 12, 8, 1260, 5, 0, 0, 8, 0, 'DIREITA', 1, 0, 'Brasil', 14, 0, 2, 1, NOW()),
(3, 'Cacá', 2, 9, 25, 83.00, 15, 2, 1.85, 38, 20, 10, 1350, 25, 0, 1, 2, 0, 'DIREITA', 2, 1, 'Brasil', 16, 1, 5, 0, NOW()),
(3, 'Hugo Ferreira', 0, 7, 26, 75.00, 16, 15, 1.79, 35, 18, 12, 1440, 46, 0, 0, 1, 0, 'ESQUERDA', 3, 0, 'Brasil', 17, 2, 3, 3, NOW()),
(3, 'Raniele Almeida', 1, 12, 27, 80.00, 18, 10, 1.84, 55, 35, 15, 1620, 14, 0, 0, 2, 0, 'DIREITA', 2, 0, 'Brasil', 18, 1, 8, 1, NOW()),
(3, 'Alex Santana', 2, 18, 29, 82.00, 10, 12, 1.82, 28, 22, 14, 900, 80, 1, 0, 3, 0, 'DIREITA', 4, 0, 'Brasil', 12, 5, 4, 2, NOW()),
(3, 'Rodrigo Garro', 4, 30, 26, 72.00, 19, 45, 1.74, 18, 15, 35, 1710, 10, 0, 0, 2, 0, 'ESQUERDA', 6, 0, 'Argentina', 19, 3, 4, 9, NOW()),
(3, 'Igor Coronado', 3, 20, 31, 68.00, 8, 35, 1.70, 10, 8, 20, 720, 77, 1, 0, 5, 0, 'DIREITA', 10, 0, 'Brasil', 15, 12, 1, 6, NOW()),
(3, 'Ángel Romero', 7, 35, 31, 75.00, 15, 18, 1.77, 15, 20, 28, 1350, 11, 0, 0, 4, 0, 'DIREITA', 8, 0, 'Paraguai', 18, 7, 5, 4, NOW()),
(3, 'Yuri Alberto', 9, 55, 23, 78.00, 17, 22, 1.83, 8, 25, 20, 1530, 9, 1, 0, 2, 0, 'DIREITA', 7, 0, 'Brasil', 19, 4, 3, 2, NOW()),
-- 4 - PALMEIRAS
(4, 'Weverton Pereira', 0, 0, 36, 91.00, 20, 0, 1.89, 2, 1, 7, 1800, 21, 0, 0, 12, 0, 'DIREITA', 0, 0, 'Brasil', 20, 0, 1, 0, NOW()),
(4, 'Mayke Rocha', 1, 15, 31, 72.00, 15, 22, 1.78, 35, 12, 14, 1350, 12, 1, 0, 10, 0, 'DIREITA', 5, 0, 'Brasil', 17, 4, 2, 5, NOW()),
(4, 'Gustavo Gómez', 3, 12, 31, 85.00, 19, 2, 1.85, 55, 22, 10, 1710, 15, 0, 1, 11, 0, 'DIREITA', 0, 1, 'Paraguai', 19, 0, 6, 1, NOW()),
(4, 'Murilo Cerqueira', 2, 10, 27, 86.00, 18, 1, 1.88, 48, 18, 8, 1620, 26, 0, 0, 6, 0, 'DIREITA', 1, 0, 'Brasil', 18, 0, 3, 1, NOW()),
(4, 'Joaquín Piquerez', 1, 20, 25, 79.00, 16, 25, 1.84, 38, 20, 15, 1440, 22, 1, 0, 5, 0, 'ESQUERDA', 3, 0, 'Uruguai', 17, 2, 4, 6, NOW()),
(4, 'Aníbal Moreno', 2, 18, 25, 77.00, 19, 15, 1.78, 62, 35, 12, 1710, 5, 0, 0, 2, 0, 'DIREITA', 2, 0, 'Argentina', 19, 1, 7, 2, NOW()),
(4, 'Richard Ríos', 2, 28, 24, 78.00, 14, 48, 1.85, 32, 28, 25, 1260, 27, 0, 0, 1, 0, 'DIREITA', 6, 0, 'Colômbia', 18, 5, 5, 3, NOW()),
(4, 'Raphael Veiga', 8, 45, 28, 76.00, 18, 20, 1.78, 15, 10, 30, 1620, 23, 0, 0, 10, 0, 'ESQUERDA', 8, 0, 'Brasil', 19, 4, 2, 10, NOW()),
(4, 'Estêvão Willian', 7, 38, 17, 68.00, 12, 70, 1.76, 10, 8, 45, 1080, 41, 0, 0, 1, 0, 'ESQUERDA', 9, 0, 'Brasil', 15, 6, 1, 6, NOW()),
(4, 'Felipe Anderson', 4, 30, 31, 70.00, 10, 35, 1.75, 18, 12, 22, 900, 9, 0, 0, 5, 0, 'DIREITA', 7, 0, 'Brasil', 12, 5, 1, 4, NOW()),
(4, 'Flaco López', 12, 60, 23, 82.00, 16, 10, 1.90, 5, 25, 18, 1440, 42, 0, 0, 2, 1, 'ESQUERDA', 8, 0, 'Argentina', 19, 5, 3, 2, NOW()),
-- 5 - GRÊMIO
(5, 'Agustín Marchesín', 0, 0, 36, 83.00, 18, 0, 1.88, 1, 1, 5, 1620, 1, 1, 0, 8, 0, 'DIREITA', 0, 0, 'Argentina', 18, 0, 2, 0, NOW()),
(5, 'João Pedro', 1, 12, 27, 75.00, 17, 20, 1.79, 38, 22, 15, 1530, 18, 0, 0, 3, 0, 'DIREITA', 3, 0, 'Brasil', 19, 2, 4, 4, NOW()),
(5, 'Geromel', 1, 5, 38, 84.00, 12, 1, 1.90, 35, 10, 6, 1080, 3, 2, 0, 12, 0, 'DIREITA', 2, 0, 'Brasil', 13, 1, 2, 0, NOW()),
(5, 'Walter Kannemann', 0, 4, 33, 83.00, 15, 1, 1.84, 52, 45, 12, 1350, 4, 1, 2, 9, 0, 'ESQUERDA', 1, 2, 'Argentina', 16, 0, 12, 1, NOW()),
(5, 'Reinaldo Silva', 3, 22, 34, 79.00, 18, 18, 1.78, 30, 25, 20, 1620, 6, 0, 0, 5, 0, 'ESQUERDA', 2, 0, 'Brasil', 19, 1, 6, 7, NOW()),
(5, 'Mathias Villasanti', 2, 18, 27, 76.00, 20, 15, 1.78, 65, 38, 22, 1800, 20, 0, 0, 3, 0, 'DIREITA', 1, 0, 'Paraguai', 20, 0, 5, 3, NOW()),
(5, 'Dodi', 1, 10, 28, 70.00, 14, 22, 1.69, 45, 30, 14, 1260, 17, 0, 0, 2, 0, 'DIREITA', 5, 0, 'Brasil', 18, 6, 4, 2, NOW()),
(5, 'Franco Cristaldo', 7, 42, 27, 74.00, 19, 28, 1.75, 15, 12, 28, 1710, 10, 0, 0, 2, 0, 'DIREITA', 7, 0, 'Argentina', 19, 4, 2, 9, NOW()),
(5, 'Yeferson Soteldo', 4, 30, 26, 65.00, 15, 80, 1.60, 8, 10, 55, 1350, 7, 1, 0, 4, 0, 'DIREITA', 8, 0, 'Venezuela', 17, 6, 3, 6, NOW()),
(5, 'Cristian Pavón', 5, 35, 28, 76.00, 13, 35, 1.74, 12, 15, 18, 1170, 21, 0, 0, 6, 0, 'DIREITA', 9, 0, 'Argentina', 16, 7, 2, 5, NOW()),
(5, 'Martin Braithwaite', 6, 40, 33, 80.00, 8, 15, 1.80, 4, 12, 15, 720, 22, 0, 0, 4, 0, 'DIREITA', 5, 0, 'Dinamarca', 10, 4, 1, 1, NOW()),
-- 6 - INTERNACIONAL
(6, 'Sergio Rochet', 0, 0, 31, 86.00, 18, 0, 1.90, 1, 0, 8, 1620, 1, 1, 0, 5, 0, 'DIREITA', 0, 0, 'Uruguai', 18, 0, 2, 0, NOW()),
(6, 'Fabricio Bustos', 1, 10, 28, 72.00, 19, 25, 1.67, 42, 18, 14, 1710, 16, 0, 0, 4, 0, 'DIREITA', 3, 0, 'Argentina', 19, 2, 4, 5, NOW()),
(6, 'Vitão', 1, 5, 24, 82.00, 20, 2, 1.86, 48, 14, 7, 1800, 4, 0, 0, 2, 0, 'DIREITA', 0, 0, 'Brasil', 20, 0, 3, 0, NOW()),
(6, 'Gabriel Mercado', 2, 8, 37, 84.00, 15, 1, 1.81, 35, 28, 10, 1350, 25, 0, 1, 12, 0, 'DIREITA', 2, 1, 'Argentina', 16, 1, 8, 1, NOW()),
(6, 'Renê Rodrigues', 0, 6, 31, 74.00, 17, 12, 1.74, 38, 20, 15, 1530, 6, 0, 0, 6, 0, 'ESQUERDA', 2, 0, 'Brasil', 18, 2, 3, 3, NOW()),
(6, 'Fernando Reges', 1, 12, 36, 82.00, 16, 8, 1.83, 55, 32, 12, 1440, 5, 1, 0, 15, 0, 'DIREITA', 4, 0, 'Brasil', 17, 3, 5, 2, NOW()),
(6, 'Bruno Henrique', 3, 25, 34, 76.00, 14, 15, 1.79, 28, 22, 18, 1260, 8, 0, 0, 8, 0, 'DIREITA', 6, 0, 'Brasil', 18, 5, 4, 4, NOW()),
(6, 'Alan Patrick', 8, 45, 32, 75.00, 17, 40, 1.78, 12, 10, 42, 1530, 10, 1, 0, 7, 0, 'DIREITA', 8, 0, 'Brasil', 18, 4, 2, 11, NOW()),
(6, 'Wesley Ribeiro', 5, 38, 25, 71.00, 15, 65, 1.75, 15, 14, 35, 1350, 21, 0, 0, 2, 0, 'DIREITA', 7, 0, 'Brasil', 19, 8, 3, 5, NOW()),
(6, 'Wanderson Campos', 4, 32, 29, 73.00, 13, 50, 1.76, 20, 12, 28, 1170, 11, 1, 0, 3, 0, 'DIREITA', 9, 0, 'Brasil', 16, 7, 1, 6, NOW()),
(6, 'Enner Valencia', 11, 58, 34, 80.00, 16, 18, 1.77, 4, 18, 22, 1440, 13, 1, 0, 6, 1, 'DIREITA', 6, 0, 'Equador', 17, 4, 4, 2, NOW()),
-- 7 - FLAMENGO
(7, 'Agustín Rossi', 0, 0, 28, 88.00, 20, 0, 1.93, 1, 0, 6, 1800, 1, 0, 0, 5, 0, 'DIREITA', 0, 0, 'Argentina', 20, 0, 1, 0, NOW()),
(7, 'Guillermo Varela', 1, 8, 31, 75.00, 15, 18, 1.73, 32, 15, 12, 1350, 2, 1, 0, 6, 0, 'DIREITA', 5, 0, 'Uruguai', 17, 4, 3, 3, NOW()),
(7, 'Fabrício Bruno', 1, 7, 28, 84.00, 19, 2, 1.92, 50, 14, 8, 1710, 15, 0, 0, 4, 0, 'DIREITA', 1, 0, 'Brasil', 19, 0, 2, 1, NOW()),
(7, 'Léo Pereira', 2, 10, 28, 83.00, 18, 3, 1.89, 45, 18, 10, 1620, 4, 0, 0, 7, 0, 'ESQUERDA', 2, 0, 'Brasil', 18, 0, 4, 1, NOW()),
(7, 'Ayrton Lucas', 3, 20, 26, 74.00, 17, 35, 1.80, 35, 20, 15, 1530, 6, 0, 0, 5, 0, 'ESQUERDA', 4, 0, 'Brasil', 19, 3, 3, 5, NOW()),
(7, 'Erick Pulgar', 2, 15, 30, 78.00, 18, 10, 1.87, 58, 35, 14, 1620, 5, 0, 0, 6, 0, 'DIREITA', 3, 0, 'Chile', 18, 1, 7, 4, NOW()),
(7, 'Gerson Santos', 4, 28, 27, 80.00, 19, 45, 1.84, 40, 25, 35, 1710, 8, 1, 0, 10, 0, 'ESQUERDA', 5, 0, 'Brasil', 19, 2, 5, 6, NOW()),
(7, 'De Arrascaeta', 9, 45, 29, 73.00, 16, 40, 1.73, 12, 8, 40, 1440, 14, 1, 0, 12, 0, 'DIREITA', 10, 0, 'Uruguai', 17, 8, 1, 12, NOW()),
(7, 'Nicolás de la Cruz', 5, 35, 27, 70.00, 17, 38, 1.67, 35, 22, 30, 1530, 18, 0, 0, 8, 0, 'DIREITA', 6, 0, 'Uruguai', 18, 4, 4, 8, NOW()),
(7, 'Everton Cebolinha', 6, 40, 28, 75.00, 14, 65, 1.74, 15, 12, 32, 1260, 11, 1, 0, 8, 0, 'DIREITA', 8, 0, 'Brasil', 16, 7, 2, 7, NOW()),
(7, 'Pedro', 15, 65, 26, 82.00, 18, 12, 1.85, 5, 15, 25, 1620, 9, 0, 0, 9, 1, 'DIREITA', 6, 0, 'Brasil', 19, 4, 1, 3, NOW()),
-- 8 - FLUMINENSE
(8, 'Fábio Lopes', 0, 0, 43, 85.00, 20, 0, 1.88, 1, 0, 5, 1800, 1, 0, 0, 15, 0, 'DIREITA', 0, 0, 'Brasil', 20, 0, 1, 0, NOW()),
(8, 'Samuel Xavier', 1, 12, 33, 72.00, 16, 20, 1.68, 38, 22, 14, 1440, 2, 1, 0, 5, 0, 'DIREITA', 4, 0, 'Brasil', 17, 2, 5, 4, NOW()),
(8, 'Thiago Silva', 1, 6, 39, 79.00, 10, 2, 1.83, 35, 10, 8, 900, 3, 0, 0, 30, 0, 'DIREITA', 1, 0, 'Brasil', 10, 0, 1, 1, NOW()),
(8, 'Felipe Melo', 1, 5, 40, 85.00, 12, 1, 1.83, 30, 45, 10, 1080, 30, 1, 1, 20, 0, 'DIREITA', 5, 2, 'Brasil', 14, 4, 10, 0, NOW()),
(8, 'Marcelo Vieira', 2, 18, 36, 75.00, 13, 45, 1.74, 25, 15, 20, 1170, 12, 1, 0, 28, 0, 'ESQUERDA', 7, 0, 'Brasil', 15, 6, 3, 5, NOW()),
(8, 'André Trindade', 1, 15, 22, 77.00, 19, 35, 1.76, 68, 32, 25, 1710, 7, 0, 0, 4, 0, 'DIREITA', 1, 0, 'Brasil', 19, 0, 6, 2, NOW()),
(8, 'Martinelli', 2, 20, 22, 74.00, 18, 22, 1.78, 45, 25, 18, 1620, 8, 0, 0, 3, 0, 'DIREITA', 3, 0, 'Brasil', 19, 2, 4, 3, NOW()),
(8, 'Ganso', 3, 28, 34, 78.00, 17, 30, 1.84, 12, 10, 35, 1530, 10, 0, 0, 10, 0, 'ESQUERDA', 9, 0, 'Brasil', 18, 8, 2, 10, NOW()),
(8, 'Jhon Arias', 7, 45, 26, 70.00, 19, 55, 1.68, 30, 18, 40, 1710, 21, 0, 0, 4, 0, 'DIREITA', 5, 0, 'Colômbia', 20, 3, 3, 9, NOW()),
(8, 'Keno', 5, 38, 34, 72.00, 14, 50, 1.78, 15, 14, 28, 1260, 11, 1, 0, 6, 0, 'DIREITA', 8, 0, 'Brasil', 16, 7, 2, 5, NOW()),
(8, 'Germán Cano', 18, 80, 36, 81.00, 19, 5, 1.76, 3, 12, 20, 1710, 14, 0, 0, 5, 1, 'DIREITA', 5, 0, 'Argentina', 20, 4, 1, 2, NOW()),
-- 9 - BOTAFOGO
(9, 'John Victor', 0, 0, 28, 87.00, 15, 0, 1.94, 1, 0, 4, 1350, 1, 0, 0, 1, 0, 'DIREITA', 0, 0, 'Brasil', 15, 0, 1, 0, NOW()),
(9, 'Mateo Ponte', 1, 8, 20, 74.00, 12, 20, 1.83, 25, 18, 10, 1080, 4, 0, 0, 1, 0, 'DIREITA', 5, 0, 'Uruguai', 14, 4, 3, 2, NOW()),
(9, 'Bastos', 2, 10, 32, 80.00, 18, 2, 1.84, 42, 22, 9, 1620, 15, 0, 0, 3, 0, 'DIREITA', 1, 0, 'Angola', 18, 0, 5, 1, NOW()),
(9, 'Alexander Barboza', 1, 12, 29, 88.00, 17, 3, 1.93, 38, 35, 12, 1530, 20, 0, 1, 2, 0, 'ESQUERDA', 2, 1, 'Argentina', 17, 1, 8, 1, NOW()),
(9, 'Cuiabano', 2, 15, 21, 73.00, 14, 30, 1.79, 32, 20, 18, 1260, 66, 1, 0, 1, 0, 'ESQUERDA', 4, 0, 'Brasil', 15, 3, 4, 4, NOW()),
(9, 'Gregore', 0, 8, 30, 78.00, 16, 12, 1.81, 65, 42, 20, 1440, 5, 0, 0, 2, 0, 'DIREITA', 3, 0, 'Brasil', 17, 2, 7, 1, NOW()),
(9, 'Marlon Freitas', 3, 25, 29, 76.00, 19, 25, 1.85, 45, 28, 22, 1710, 17, 0, 0, 2, 0, 'DIREITA', 2, 0, 'Brasil', 20, 1, 5, 6, NOW()),
(9, 'Thiago Almada', 5, 35, 23, 68.00, 8, 50, 1.71, 10, 8, 35, 720, 23, 0, 0, 5, 0, 'DIREITA', 5, 0, 'Argentina', 10, 3, 1, 4, NOW()),
(9, 'Luiz Henrique', 7, 48, 23, 76.00, 18, 85, 1.82, 20, 15, 45, 1620, 7, 0, 0, 2, 0, 'DIREITA', 6, 0, 'Brasil', 19, 5, 3, 7, NOW()),
(9, 'Jefferson Savarino', 6, 42, 27, 69.00, 17, 45, 1.69, 15, 10, 28, 1530, 10, 0, 0, 4, 0, 'DIREITA', 8, 0, 'Venezuela', 18, 7, 2, 8, NOW()),
(9, 'Tiquinho Soares', 12, 55, 33, 86.00, 16, 15, 1.87, 8, 25, 40, 1440, 9, 1, 0, 3, 1, 'DIREITA', 7, 0, 'Brasil', 17, 6, 4, 5, NOW()),
-- 10 - VASCO DA GAMA
(10, 'Léo Jardim', 0, 0, 29, 85.00, 20, 0, 1.88, 1, 0, 10, 1800, 1, 0, 0, 2, 0, 'DIREITA', 0, 0, 'Brasil', 20, 0, 1, 0, NOW()),
(10, 'Paulo Henrique', 1, 10, 27, 73.00, 17, 28, 1.78, 35, 20, 15, 1530, 96, 0, 0, 1, 0, 'DIREITA', 3, 0, 'Brasil', 18, 2, 4, 3, NOW()),
(10, 'João Victor', 1, 6, 25, 80.00, 15, 5, 1.87, 40, 18, 8, 1350, 38, 1, 0, 5, 0, 'DIREITA', 1, 0, 'Brasil', 16, 0, 5, 1, NOW()),
(10, 'Léo Pelé', 0, 5, 28, 79.00, 18, 8, 1.83, 35, 22, 12, 1620, 3, 0, 0, 5, 0, 'ESQUERDA', 2, 0, 'Brasil', 19, 1, 3, 1, NOW()),
(10, 'Lucas Piton', 2, 22, 23, 72.00, 19, 32, 1.75, 30, 15, 18, 1710, 6, 0, 0, 1, 0, 'ESQUERDA', 2, 0, 'Brasil', 20, 1, 2, 8, NOW()),
(10, 'Hugo Moura', 1, 15, 26, 80.00, 14, 10, 1.77, 52, 38, 14, 1260, 25, 0, 1, 5, 0, 'DIREITA', 4, 1, 'Brasil', 16, 3, 7, 2, NOW()),
(10, 'Mateus Carvalho', 1, 12, 22, 75.00, 12, 15, 1.76, 45, 30, 12, 1080, 8, 0, 0, 1, 0, 'DIREITA', 6, 0, 'Brasil', 15, 5, 5, 1, NOW()),
(10, 'Philippe Coutinho', 3, 20, 31, 68.00, 5, 30, 1.72, 8, 5, 15, 450, 11, 1, 0, 15, 0, 'DIREITA', 5, 0, 'Brasil', 7, 4, 1, 3, NOW()),
(10, 'Dimitri Payet', 4, 30, 37, 78.00, 12, 35, 1.75, 10, 8, 25, 1080, 10, 1, 0, 5, 0, 'DIREITA', 9, 0, 'França', 15, 10, 2, 7, NOW()),
(10, 'David Correa', 5, 32, 28, 78.00, 13, 22, 1.79, 15, 18, 20, 1170, 7, 0, 0, 2, 0, 'DIREITA', 8, 0, 'Brasil', 17, 7, 3, 4, NOW()),
(10, 'Pablo Vegetti', 12, 62, 35, 88.00, 19, 5, 1.87, 5, 28, 45, 1710, 99, 0, 0, 3, 1, 'DIREITA', 3, 0, 'Argentina', 20, 2, 6, 2, NOW());

UPDATE JOGADORES
SET NUM_GOLS_TOTAIS_CAMP = 2
WHERE ID_JOGADORES = 5;

UPDATE JOGADORES
SET NUM_FINALIZACOES = 15
WHERE NOME_COMPLETO = 'Igor Vinicius';

UPDATE JOGADORES
SET 
	NOME_COMPLETO = 'Raphael Borré',
    PAIS_ORIGEM = 'Colômbia'
WHERE ID_CLUBES = 6 AND PAIS_ORIGEM = 'Equadro';

UPDATE JOGADORES
SET PERNA_DOMINANTE = 'DIREITA'
WHERE NOME_COMPLETO = 'Yuri Alberto';

UPDATE JOGADORES
SET NUM_GOLS_TOTAIS_CAMP = 99
WHERE NOME_COMPLETO = 'Pedro' AND ID_CLUBES = 7;

SELECT * FROM JOGADORES;

DROP TABLE IF EXISTS JOGOS_JOGADORES;
CREATE TABLE JOGOS_JOGADORES
(
	ID_JOGOS_JOGADORES int not null auto_increment PRIMARY KEY,
	ID_JOGOS int not null,
    ID_JOGADORES int not null,
    FOREIGN KEY (ID_JOGOS) REFERENCES JOGOS(ID_JOGOS), 
    FOREIGN KEY (ID_JOGADORES) REFERENCES JOGADORES(ID_JOGADORES)
);

# INSERT JOGOS_JOGADORES
INSERT INTO JOGOS_JOGADORES (ID_JOGOS, ID_JOGADORES) 
VALUES 
(8, 1),
(8, 2),
(8, 3),
(8, 4),
(8, 5),
(8, 6),
(8, 7),
(8, 8),
(8, 9),
(8, 10);

# UPDATE JOGOS_JOGADORES
UPDATE JOGOS_JOGADORES
SET ID_JOGOS = 7
WHERE ID_JOGADORES < 11;

SELECT * FROM JOGOS_JOGADORES;

DROP TABLE IF EXISTS JUIZES;
CREATE TABLE JUIZES
(
	ID_JUIZES int not null auto_increment PRIMARY KEY,
	FEDERACAO varchar (300) not null,
	ANOS_EXPERIENCIA int not null,
	NOME_JUIZ varchar (300) not null,
	DATA_NASCIMENTO datetime not null,
	CATEGORIA varchar (300) not null,
	DATA_REGISTRO datetime not null
);

# INSERT JUIZES
INSERT INTO JUIZES
(FEDERACAO, ANOS_EXPERIENCIA, NOME_JUIZ, DATA_NASCIMENTO, CATEGORIA, DATA_REGISTRO)
VALUES
('GO', '20', 'Wilton Pereira Sampaio', '1981-12-28 00:00:00', 'FIFA', NOW()),
('RS', '18', 'Anderson Daronco', '1981-01-05 00:00:00', 'FIFA', NOW()),
('SC', '15', 'Ramon Abatti Abel', '1989-09-02 00:00:00', 'FIFA', NOW()),
('SP', '14', 'Flavio Rodrigues de Souza', '1980-07-13 00:00:00', 'CBF', NOW()),
('RJ', '16', 'Bruno Arleu de Araujo', '1983-03-01 00:00:00', 'CBF', NOW()),
('DF', '15', 'Savio Pereira Sampaio', '1985-04-22 00:00:00', 'CBF', NOW()),
('PR', '13', 'Rodrigo Jose Pereira de Lima', '1987-08-10 00:00:00', 'CBF', NOW()),
('MG', '12', 'Felipe Fernandes de Lima', '1987-11-20 00:00:00', 'CBF', NOW()),
('SP', '8', 'Matheus Delgado Candancan', '1998-02-14 00:00:00', 'CBF', NOW()),
('GO', '11', 'Paulo Cesar Zanovelli', '1989-01-01 00:00:00', 'CBF', NOW()),
('ES', '9', 'Davi de Oliveira Lacerda', '1995-06-18 00:00:00', 'CBF', NOW()),
('RJ', '17', 'Alex Gomes Stefano', '1988-09-12 00:00:00', 'CBF', NOW());

# UPDATE JUIZES
UPDATE JUIZES
SET NOME_JUIZ = 'Raphael Claus'
WHERE ID_JUIZES = 5;

UPDATE JUIZES
SET FEDERACAO = 'SP'
WHERE NOME_JUIZ = 'Raphael Claus';

UPDATE JUIZES
SET CATEGORIA = 'FIFA'
WHERE NOME_JUIZ = 'Raphael Claus';

UPDATE JUIZES
SET ANOS_EXPERIENCIA = 15
WHERE NOME_JUIZ = 'Raphael Claus';

UPDATE JUIZES
SET CATEGORIA = 'FIFA'
WHERE ID_JUIZES = 4;

SELECT * FROM JUIZES;

DROP TABLE IF EXISTS JOGOS_JUIZES;
CREATE TABLE JOGOS_JUIZES 
(
    ID_JOGOS_JUIZES int not null auto_increment PRIMARY KEY,
    ID_JUIZES int not null,
    ID_JOGOS int not null,
    DATA_REGISTRO datetime not null,
    FOREIGN KEY (ID_JUIZES) REFERENCES JUIZES (ID_JUIZES),
    FOREIGN KEY (ID_JOGOS) REFERENCES JOGOS(ID_JOGOS)
);

# INSERT JOGOS_JUIZES
INSERT INTO JOGOS_JUIZES
(ID_JUIZES,ID_JOGOS,DATA_REGISTRO)
VALUES
(2,1,NOW()),
(3,2,NOW()),
(4,3,NOW()),
(3,4,NOW()),
(2,5,NOW()),
(6,6,NOW()),
(10,7,NOW()),
(9,8,NOW()),
(7,9,NOW()),
(7,10,NOW());

# UPDATE JOGOS_JUIZES
UPDATE JOGOS_JUIZES
SET ID_JUIZES = 1
WHERE ID_JOGOS = 1;

UPDATE JOGOS_JUIZES
SET ID_JUIZES = 2
WHERE ID_JOGOS = 2;

UPDATE JOGOS_JUIZES
SET ID_JUIZES = 3
WHERE ID_JOGOS = 3;

UPDATE JOGOS_JUIZES
SET ID_JUIZES = 4
WHERE ID_JOGOS = 4;

UPDATE JOGOS_JUIZES
SET ID_JUIZES = 5
WHERE ID_JOGOS = 5;

SELECT * FROM JOGOS_JUIZES;

DROP TABLE IF EXISTS SOCIOS ;
CREATE TABLE  SOCIOS
(
	ID_SOCIOS int not null auto_increment PRIMARY KEY,								
	ID_CLUBES int not null,
	SEXO enum('M','F') not null,
	STATUS_PAGAMENTO boolean not null,
	DATA_ADESAO date not null,
	CATEGORIA_PLANO enum('1','2','3') not null, 
	CPF_SOCIO varchar(300) default '', #not null
	METODO_PAGAMENTO enum('DEBITO', 'CREDITO', 'PIX','BOLETO'),
	NUM_VALOR_MENSALIDADE float,
	NOME_SOCIO varchar(300) not null,
	FOREIGN KEY(ID_CLUBES) REFERENCES CLUBES(ID_CLUBES),
	DATA_REGISTRO datetime not null
);

# INSERT SOCIOS
INSERT INTO SOCIOS
(ID_CLUBES, NOME_SOCIO, SEXO, STATUS_PAGAMENTO, DATA_ADESAO, CPF_SOCIO, METODO_PAGAMENTO, NUM_VALOR_MENSALIDADE, CATEGORIA_PLANO,DATA_REGISTRO )
VALUES
(1, 'Rogério Silva', 'M', true, '2026-01-01', '111.111.111-11', 'CREDITO', 120.00, 1, NOW()),
(2, 'Cássio Ramos Jr', 'M', true, '2026-02-15','222.222.222-22', 'PIX', 80.00, 2, NOW()),
(3, 'Marcos Ademir Palestra', 'M', true, '2026-03-10','333.333.333-33', 'DEBITO', 150.00, 2, NOW()),
(4, 'Edson Arantes Torcedor', 'M', true, '2026-01-20','444.444.444-44', 'BOLETO', 40.00, 3, NOW()),
(5, 'Garrincha Santos Maia', 'M', false, '2026-05-01','555.555.555-55', 'PIX', 75.00, 2, NOW()),
(6, 'Zico Arthur Antunes', 'M', true, '2026-04-12','666.666.666-66', 'CREDITO', 200.00, 2, NOW()),
(7, 'Fred Castilho das Laranjeiras', 'M', true, '2026-02-28','777.777.777-77', 'DEBITO', 90.00, 3, NOW()),
(8, 'Roberto Dinamite Cruzmaltino', 'M', true, '2026-03-05','888.888.888-88', 'BOLETO', 50.00, 1, NOW()),
(9, 'Renato Portaluppi Gaúcho', 'M', true, '2026-01-10','999.999.999-99', 'PIX', 130.00, 1, NOW()),
(10, 'Fernandão Eterno Colorado', 'M', true, '2026-04-20','000.000.000-00', 'CREDITO', 85.00, 3, NOW());

# UPDATE SOCIOS
UPDATE SOCIOS
SET METODO_PAGAMENTO = 'PIX'
WHERE NOME_SOCIO = 'Zico Arthur Antunes';

UPDATE SOCIOS
SET CATEGORIA_PLANO = 3
WHERE NOME_SOCIO = 'Garrincha Santos Maia';

UPDATE SOCIOS
SET DATA_ADESAO = '2025-08-24'
WHERE ID_SOCIOS = 1;

UPDATE SOCIOS
SET STATUS_PAGAMENTO = true
WHERE ID_SOCIOS = 5;

UPDATE SOCIOS
SET NUM_VALOR_MENSALIDADE = 200.00
WHERE CATEGORIA_PLANO = 3;

SELECT * FROM SOCIOS;

DROP TABLE IF EXISTS PATROCINADORES; 
CREATE TABLE  PATROCINADORES
(
	ID_PATROCINADORES int not null auto_increment PRIMARY KEY,
	RAZAO_SOCIAL varchar(300) not null,
	CNPJ_PATROCINADORES varchar(300) not null,
	SETOR_ATIVIDADE varchar(300) not null,
	SITE_PATROCINADORES varchar(300) not null,
	VALOR_DE_MERCADO double not null,
	DATA_REGISTRO datetime not null
);

# INSERT PATROCINADORES
INSERT INTO PATROCINADORES
(RAZAO_SOCIAL, CNPJ_PATROCINADORES, SETOR_ATIVIDADE, SITE_PATROCINADORES, VALOR_DE_MERCADO, DATA_REGISTRO)
VALUES
('Betano', '12.345.678/0001-01','Apostas Esportivas','https://www.betano.com.br', 850000000.00, NOW()),
('Brahma', '98.765.432/0001-02', 'Bebidas', 'https://www.brahma.com.br', 1200000000.00,  NOW()),
('Pixbet', '11.222.333/0001-03', 'Apostas Esportivas', 'https://www.pixbet.com',  540000000.00, NOW()),
('Sportingbet', '44.555.666/0001-04', 'Apostas Online', 'https://www.sportingbet.com', 730000000.00, NOW()),
('Adidas Brasil','77.888.999/0001-05', 'Material Esportivo', 'https://www.adidas.com.br', 2500000000.00, NOW()),
('Nike Brasil', '66.777.888/0001-06', 'Material Esportivo', 'https://www.nike.com.br', 3200000000.00,  NOW()),
('Claro', '55.444.333/0001-07', 'Telecomunicacoes', 'https://www.claro.com.br', 4100000000.00, NOW()),
('Itaú Unibanco', '22.111.000/0001-08','Financeiro', 'https://www.itau.com.br', 9800000000.00, NOW()),
('Mercado Livre', '33.222.111/0001-09', 'E-commerce', 'https://www.mercadolivre.com.br', 7600000000.00, NOW()),
('Amazon Brasil', '88.999.000/0001-10', 'Tecnologia','https://www.amazon.com.br', 15000000000.00, NOW());

UPDATE PATROCINADORES
SET VALOR_DE_MERCADO = 900000000.00
WHERE ID_PATROCINADORES = 1;

UPDATE PATROCINADORES
SET SETOR_ATIVIDADE = 'Bebidas Premium'
WHERE RAZAO_SOCIAL = 'Brahma';

UPDATE PATROCINADORES
SET SETOR_ATIVIDADE = 'Apostas Online'
WHERE RAZAO_SOCIAL = 'Pixbet';

UPDATE PATROCINADORES
SET SETOR_ATIVIDADE = 'Apostas Esportivas'
WHERE ID_PATROCINADORES = 4;

UPDATE PATROCINADORES
SET VALOR_DE_MERCADO = 3000000000.00
WHERE SETOR_ATIVIDADE = 'Tecnologia';

SELECT * FROM PATROCINADORES;

DROP TABLE IF EXISTS CLUBES_PATROCINADORES;
CREATE TABLE CLUBES_PATROCINADORES
(
	ID_CLUBES_PATROCINADORES int auto_increment PRIMARY KEY,
    ID_CLUBES int not null,
    ID_PATROCINADORES int not null,
    DATA_REGISTRO datetime not null,
    FOREIGN KEY (ID_CLUBES) REFERENCES CLUBES(ID_CLUBES),
    FOREIGN KEY (ID_PATROCINADORES) REFERENCES PATROCINADORES (ID_PATROCINADORES)
);

# INSERT CLUBES_PATROCINADORES
INSERT INTO CLUBES_PATROCINADORES
(ID_CLUBES,ID_PATROCINADORES,DATA_REGISTRO)
VALUES
(2,1,NOW()),
(3,2,NOW()),
(4,3,NOW()),
(3,4,NOW()),
(2,5,NOW()),
(6,6,NOW()),
(7,7,NOW()),
(8,8,NOW()),
(9,9,NOW()),
(10,10,NOW());

# UPDATE CLUBES_PATROCINADORES
UPDATE CLUBES_PATROCINADORES
SET ID_CLUBES = 1
WHERE ID_PATROCINADORES = 1;

UPDATE CLUBES_PATROCINADORES
SET ID_CLUBES = 2
WHERE ID_PATROCINADORES = 2;

UPDATE CLUBES_PATROCINADORES
SET ID_CLUBES = 3
WHERE ID_PATROCINADORES = 3;

UPDATE CLUBES_PATROCINADORES
SET ID_CLUBES = 3
WHERE ID_PATROCINADORES = 3;

UPDATE CLUBES_PATROCINADORES
SET ID_CLUBES = 4
WHERE ID_PATROCINADORES = 4;

UPDATE CLUBES_PATROCINADORES
SET ID_CLUBES = 5
WHERE ID_PATROCINADORES = 5;

SELECT * FROM CLUBES_PATROCINADORES;

DROP TABLE IF EXISTS TELEVISORES;
CREATE TABLE TELEVISORES 
(
	ID_TELEVISORES int not null auto_increment PRIMARY KEY,
    EMPRESA_DETENTORA varchar (300) not null,	
	NOME_TELEVISORES varchar(300), 
	STATUS_TELEVISORES boolean not null,
    DATA_REGISTRO datetime not null
);

# INSERT TELEVISORAS
INSERT INTO TELEVISORES	
(EMPRESA_DETENTORA, NOME_TELEVISORES, STATUS_TELEVISORES, DATA_REGISTRO)
VALUES
('Globo', 'Globo HD Central', TRUE, NOW()),
('SBT', 'SBT News Display', TRUE, NOW()),
('Record', 'Record Ultra Vision', FALSE, NOW()),
('Band', 'Band Sports Panel', TRUE, NOW()),
('RedeTV', 'RedeTV Studio Screen', TRUE, NOW()),
('ESPN Brasil', 'ESPN Match Vision', TRUE, NOW()),
('SporTV', 'SporTV Arena Display', FALSE, NOW()),
('Premiere', 'Premiere VAR Monitor', TRUE, NOW()),
('CNN Brasil', 'CNN Broadcast Screen', TRUE, NOW()),
('Fox Sports', 'Fox Sports Studio TV', FALSE, NOW());

# UPDATE TELEVISORES
UPDATE TELEVISORES
SET NOME_TELEVISORES = 'Premiere Video'
WHERE EMPRESA_DETENTORA = 'Premiere';

UPDATE TELEVISORES
SET STATUS_TELEVISORES = TRUE
WHERE EMPRESA_DETENTORA = 'Record';

UPDATE TELEVISORES
SET STATUS_TELEVISORES = FALSE
WHERE NOME_TELEVISORES = 'RedeTV Studio Screen';

UPDATE TELEVISORES
SET NOME_TELEVISORES = 'Globoplay'
WHERE EMPRESA_DETENTORA = 'Globo';

UPDATE TELEVISORES
SET EMPRESA_DETENTORA = 'Globo'
WHERE ID_TELEVISORES = 8;

SELECT * FROM TELEVISORES;

DROP TABLE IF EXISTS REPORTERES;
CREATE TABLE  REPORTERES
(
	ID_REPORTERES int not null auto_increment PRIMARY KEY,
    ID_TELEVISORES int not null,
    NUM_CREDENCIAL float not null,
    ORGAO_MIDIA varchar (300) not null,
	NOME_REPORTER varchar (300) not null,
	CNPJ varchar (300) not null,
	FUNCAO varchar (300) not null,
	DATA_REGISTRO datetime not null,
    FOREIGN KEY (ID_TELEVISORES) REFERENCES TELEVISORES(ID_TELEVISORES)
);

# INSERT REPORTERES
INSERT INTO REPORTERES
(ID_TELEVISORES, NUM_CREDENCIAL , ORGAO_MIDIA , NOME_REPORTER , CNPJ , FUNCAO , DATA_REGISTRO) 
VALUES 
-- 1. Globo
(1,1076.2, 'Rede Globo', 'Eric Faria', '33.433.386/0001-64', 'Repórter de Campo', NOW()),

-- 2. SporTV
(7,1088.2, 'SporTV', 'André Hernan', '33.433.386/0001-64', 'Repórter Investigativo', NOW()),

-- 3. ESPN
(6,2044.0, 'ESPN Brasil', 'Mendel Bydlowski', '60.393.181/0001-00', 'Repórter de Campo', NOW()),

-- 4. SporTV
(7,3055.1, 'SporTV', 'Monique Danello', '05.215.114/0001-52', 'Repórter de Campo', NOW()),

-- 5. Fox Sports
(10,4012.9, 'Fox Sports', 'Fernando Fernandes', '60.509.232/0001-01', 'Comentarista de Gramado', NOW()),

-- 6. Band
(8,5099.3, 'Band', 'Alê Oliveira', '45.122.333/0001-99', 'Repórter Especial', NOW()),

-- 7. Record
(9,6077.4, 'Record', 'Casimiro Miguel', '32.111.222/0001-88', 'Repórter de Transmissão', NOW()),

-- 8. SBT
(6,7022.8, 'SBT Sports', 'André Galvão', '45.039.237/0001-14', 'Repórter de Campo', NOW()),

-- 9. Rede TV
(10,1056.7, 'Rede TV', 'Nadja Mauad', '33.433.386/0001-64', 'Repórter de Setorismo', NOW()),

-- 10. CNN Brasil
(9,8041.2, 'CNN Brasil', 'Eudes Júnior', '15.436.940/0001-03', 'Repórter de Campo', NOW());

# UPDATE REPORTERES
UPDATE REPORTERES
SET NUM_CREDENCIAL = '7205.5'
WHERE ID_REPORTERES = 5;

UPDATE REPORTERES
SET ORGAO_MIDIA = 'CazéTV'
WHERE NOME_REPORTER = 'Casimirio Miguel';

UPDATE REPORTERES
SET ORGAO_MIDIA = 'CazéTV'
WHERE NOME_REPORTER = 'Fernando Fernandes';

UPDATE REPORTERES
SET ID_TELEVISORES = 8
WHERE ORGAO_MIDIA = 'Band';

UPDATE REPORTERES
SET NOME_REPORTER = 'João Paulo Cappellanes'
WHERE FUNCAO = 'Reporter Especial';

SELECT * FROM REPORTERES;

DROP TABLE IF EXISTS JOGOS_REPORTERES;
CREATE TABLE  JOGOS_REPORTERES
(
	ID_JOGOS_REPORTERES int not null auto_increment PRIMARY KEY,
    ID_JOGOS int not null,
    ID_REPORTERES int not null,
    DATA_REGISTRO datetime not null,
	FOREIGN KEY (ID_JOGOS) REFERENCES JOGOS(ID_JOGOS),
    FOREIGN KEY (ID_REPORTERES) REFERENCES REPORTERES(ID_REPORTERES)
);

# INSERT JOGOS_REPORTERES
INSERT INTO JOGOS_REPORTERES
(ID_JOGOS, ID_REPORTERES, DATA_REGISTRO)
VALUES
(1,3,NOW()),
(2,7,NOW()),
(3,10,NOW()),
(4,1,NOW()),
(5,4,NOW()),
(6,8,NOW()),
(7,7,NOW()),
(8,8,NOW()),
(9,6,NOW()),
(10,9,NOW());

# UPDATE JOGOS_REPORTERES
UPDATE JOGOS_REPORTERES
SET ID_REPORTERES = 1
WHERE ID_JOGOS = 1;

UPDATE JOGOS_REPORTERES
SET ID_REPORTERES = 2
WHERE ID_JOGOS = 2;

UPDATE JOGOS_REPORTERES
SET ID_REPORTERES = 3
WHERE ID_JOGOS = 3;

UPDATE JOGOS_REPORTERES
SET ID_REPORTERES = 4
WHERE ID_JOGOS = 4;

UPDATE JOGOS_REPORTERES
SET ID_REPORTERES = 5
WHERE ID_JOGOS = 5;

SELECT * FROM JOGOS_REPORTERES;

DROP TABLE IF EXISTS UNIFORMES;
CREATE TABLE UNIFORMES
(
ID_UNIFORMES int not null auto_increment PRIMARY KEY,
ID_FORNECEDORES int not null,
ID_CLUBES int not null,
PRECO_OFICIAL float not null,
TIME_UNIFORMES varchar(300) not null, #antigo TIME
TREINO varchar(300) not null,
FORNECEDOR varchar(300) not null,
PATROCINADOR_MASTER varchar(300) not null,
GOLEIRO varchar(300) not null,
COR_UNIFORMES varchar(300) not null,
COR_MEIA_UNIFORMES varchar(300) not null,
DATA_REGISTRO datetime not null,
FOREIGN KEY (ID_CLUBES) REFERENCES CLUBES(ID_CLUBES),
FOREIGN KEY (ID_FORNECEDORES) REFERENCES FORNECEDORES(ID_FORNECEDORES)
);

# INSERT UNIFORMES
INSERT INTO UNIFORMES
(ID_CLUBES,ID_FORNECEDORES, PRECO_OFICIAL, TIME_UNIFORMES, TREINO, FORNECEDOR, PATROCINADOR_MASTER, GOLEIRO, COR_UNIFORMES, COR_MEIA_UNIFORMES, DATA_REGISTRO)
VALUES
(2,1,349.90, 'São Paulo', 'Branco e Vermelho', 'New Balance', 'Superbet', 'Preto', 'Branco com listras', 'Branca', NOW()),
(4,2,349.90, 'Corinthians', 'Preto e Dourado', 'Nike', 'VaideBet', 'Laranja', 'Branco Clássico', 'Preta', NOW()),
(7,3,369.90, 'Palmeiras', 'Verde Limão', 'Puma', 'Crefisa', 'Branco', 'Verde Esmeralda', 'Branca', NOW()),
(8,4,299.90, 'Santos', 'Branco e Cinza', 'Umbro', 'Blaze', 'Azul Marinho', 'Branco com detalhes pretos', 'Branca', NOW()),
(3,5,319.90, 'Botafogo', 'Preto', 'Reebok', 'Parimatch', 'Cinza', 'Alvinegro Listrado', 'Preta', NOW()),
(7,6,399.90, 'Flamengo', 'Vermelho e Preto', 'Adidas', 'Pixbet', 'Azul Marinho', 'Rubro-Negro', 'Preta', NOW()),
(6,7,349.90, 'Fluminense', 'Grená e Branco', 'Umbro', 'Superbet', 'Verde Água', 'Tricolor (Verde, Grená e Branco)', 'Branca', NOW()),
(10,8,299.90, 'Vasco da Gama', 'Branco', 'Kappa', 'Betfair', 'Preto', 'Preto com Faixa Transversal', 'Branca', NOW()),
(8,9,319.90, 'Grêmio', 'Azul Celeste', 'Umbro', 'Banrisul', 'Amarelo', 'Tricolor (Azul, Preto e Branco)', 'Branca', NOW()),
(9,10,319.90, 'Internacional', 'Branco', 'Adidas', 'Banrisul', 'Cinza', 'Vermelho Carmim', 'Vermelha', NOW());

# UPDATE UNIFORMES
UPDATE UNIFORMES
SET TREINO = 'Roxo'
WHERE TIME_UNIFORMES = 'Corinthians';

UPDATE UNIFORMES
SET COR_UNIFORMES = 'Preto e Vermelho'
WHERE TIME_UNIFORMES = 'Flamengo';

UPDATE UNIFORMES
SET COR_MEIA_UNIFORMES = 'Branca'
WHERE ID_UNIFORMES = 10;

UPDATE UNIFORMES
SET PRECO_OFICIAL = 412.90
WHERE ID_UNIFORMES = 3;

UPDATE UNIFORMES
SET PATROCINADOR_MASTER = 'Sportingbet'
WHERE TIME_UNIFORMES = 'Palmeiras';

SELECT * FROM UNIFORMES;

DROP TABLE IF EXISTS COMISSAO_TECNICA;
CREATE TABLE COMISSAO_TECNICA
(
ID_COMISSAO_TECNICA int not null auto_increment PRIMARY KEY,
ID_TECNICOS int not null,
ID_CLUBES int not null,
TIPO_DE_DEPARTAMENTO varchar(300) not null,
CPF_COMISSAO_TECNICO varchar(300) not null,
CARGO_FUNCAO varchar(300) not null,
NOME_COMISSAO varchar(300) not null,
DATA_REGISTRO datetime,
FOREIGN KEY (ID_TECNICOS) REFERENCES TECNICOS(ID_TECNICOS),
FOREIGN KEY (ID_CLUBES) REFERENCES CLUBES(ID_CLUBES)
);

# INSERT COMISSAO_TECNICA
INSERT INTO COMISSAO_TECNICA
(TIPO_DE_DEPARTAMENTO,CPF_COMISSAO_TECNICO,ID_TECNICOS,ID_CLUBES,CARGO_FUNCAO,NOME_COMISSAO, DATA_REGISTRO)
VALUES
('Técnico', '11122233344', 1, 1, 'Auxiliar Técnico', 'João Martins', NOW()),
('Saúde e Performance', '22233344455', 5, 5, 'Preparador Físico', 'Fábio Mahseredjian', NOW()),
('Técnico', '33344455566', 4, 4, 'Auxiliar Técnico', 'Gastón Liendo', NOW()),
('Análise', '44455566677', 6, 6, 'Analista de Desempenho', 'Patricio Hernandez', NOW()),
('Técnico', '55566677788', 3, 3, 'Treinador de Goleiros', 'Mauri Lima', NOW()),
('Técnico', '66677788899', 6, 6, 'Auxiliar Técnico', 'Eduardo Barros', NOW()),
('Técnico', '77788899900', 7, 7, 'Auxiliar Técnico', 'Roberto Ribas', NOW()),
('Técnico', '88899900011', 9, 9, 'Prep. de Goleiros', 'Marcelo Grimaldi', NOW()),
('Análise', '99900011122', 10, 10, 'Analista Tático', 'Lucas Oliveira', NOW()),
('Saúde e Performance', '00011122233', 8, 8, 'Coordenador Físico', 'Octavio Manera', NOW());

# UPDATE COMISSAO_TECNICA

UPDATE COMISSAO_TECNICA 
	SET CPF_COMISSAO_TECNICO = '22222233344'
WHERE ID_COMISSAO_TECNICA = '4';

UPDATE COMISSAO_TECNICA
	SET CARGO_FUNCAO = 'Técnico Principal'
WHERE CPF_COMISSAO_TECNICO = '33344455566';

UPDATE COMISSAO_TECNICA
	SET NOME_COMISSAO = 'Fábio Mahseredjian Silva'
WHERE CPF_COMISSAO_TECNICO = '22233344455';

UPDATE COMISSAO_TECNICA
	SET TIPO_DE_DEPARTAMENTO = 'Desempenho e Análise'
WHERE ID_COMISSAO_TECNICA = '4';

UPDATE COMISSAO_TECNICA
	SET TIPO_DE_DEPARTAMENTO = 'Desempenho e análise'
WHERE CPF_COMISSAO_TECNICO = 55566677788;

SELECT * FROM COMISSAO_TECNICA;

DROP TABLE IF EXISTS JOGOS_COMISSAOTECNICA;
CREATE TABLE JOGOS_COMISSAOTECNICA
(
ID_JOGOS_COMISSAOTECNICA int not null auto_increment PRIMARY KEY,
ID_JOGOS int not null,
ID_COMISSAO_TECNICA int not null,
DATA_REGISTRO datetime,
FOREIGN KEY (ID_JOGOS) REFERENCES JOGOS(ID_JOGOS),
FOREIGN KEY (ID_COMISSAO_TECNICA) REFERENCES COMISSAO_TECNICA(ID_COMISSAO_TECNICA)
);

# INSERT JOGOS_COMISSAOTECNICA
INSERT INTO JOGOS_COMISSAOTECNICA
(ID_JOGOS,ID_COMISSAO_TECNICA, DATA_REGISTRO)
VALUES
(1, 1, NOW()), (1, 2, NOW()),
(2, 3, NOW()), (2, 4, NOW()), 
(6, 6, NOW()), (10, 7, NOW()),
(8, 9, NOW()), (9, 10, NOW());

# UPDATE JOGOS_COMISSAOTECNICA
UPDATE JOGOS_COMISSAOTECNICA
SET ID_JOGOS = 10
WHERE ID_COMISSAO_TECNICA = 6 OR ID_COMISSAO_TECNICA = 7;

UPDATE JOGOS_COMISSAOTECNICA
SET ID_JOGOS = 7
WHERE ID_COMISSAO_TECNICA = 9 OR ID_COMISSAO_TECNICA = 10;

SELECT * FROM JOGOS_COMISSAOTECNICA;

# POSIÇÕES DE JOGADORES  

DROP TABLE IF EXISTS ZAGUEIROS;
CREATE TABLE ZAGUEIROS (
	ID_ZAGUEIROS int not null auto_increment PRIMARY KEY,
    ID_JOGADORES int not null,
    NUM_PENALTIS_COMETIDOS int default '0',
    DATA_REGISTRO datetime not null,
    FOREIGN KEY (ID_JOGADORES) REFERENCES JOGADORES(ID_JOGADORES)
);

# INSERT ZAGUEIROS
INSERT INTO ZAGUEIROS 
(ID_JOGADORES, NUM_PENALTIS_COMETIDOS, DATA_REGISTRO)
VALUES
(1, 0, NOW()),
(2, 1, NOW()),
(3, 2, NOW()),
(4, 0, NOW()),
(5, 1, NOW()),
(6, 3, NOW()),
(7, 0, NOW()),
(8, 2, NOW()),
(9, 1, NOW()),
(10, 4, NOW());

# UPDATE ZAGUEIROS
UPDATE ZAGUEIROS
SET NUM_PENALTIS_COMETIDOS = 1
WHERE ID_JOGADORES = 7;

UPDATE ZAGUEIROS
SET NUM_PENALTIS_COMETIDOS = 3
WHERE ID_JOGADORES = 10;

UPDATE ZAGUEIROS
SET NUM_PENALTIS_COMETIDOS = 5
WHERE ID_JOGADORES = 6;

UPDATE ZAGUEIROS
SET NUM_PENALTIS_COMETIDOS = 0
WHERE ID_JOGADORES = 2;

UPDATE ZAGUEIROS
SET NUM_PENALTIS_COMETIDOS = 0
WHERE ID_JOGADORES = 9;

DROP TABLE IF EXISTS GOLEIROS;
CREATE TABLE GOLEIROS (
	ID_GOLEIROS int not null auto_increment PRIMARY KEY,
    ID_JOGADORES int not null,
    NUM_DEFESAS int default '0',
    NUM_PENALTIS_DEFENDIDOS int default '0',
    NUM_GOLS_CONCEDIDOS int default '0',
    DATA_REGISTRO datetime not null,
    FOREIGN KEY (ID_JOGADORES) REFERENCES JOGADORES(ID_JOGADORES)
);

# INSERT GOLEIROS
INSERT INTO GOLEIROS 
(ID_JOGADORES, NUM_DEFESAS, NUM_PENALTIS_DEFENDIDOS, NUM_GOLS_CONCEDIDOS, DATA_REGISTRO)
VALUES
(1, 8, 1, 2, NOW()),
(2, 12, 0, 1, NOW()),
(3, 5, 2, 0, NOW()),
(4, 10, 1, 3, NOW()),
(5, 7, 0, 1, NOW()),
(6, 15, 2, 2, NOW()),
(7, 9, 1, 0, NOW()),
(8, 11, 0, 4, NOW()),
(9, 6, 3, 1, NOW()),
(10, 13, 1, 2, NOW());

# UPDATE GOLEIROS
UPDATE GOLEIROS
SET NUM_DEFESAS = 22
WHERE ID_JOGADORES = 7;

UPDATE GOLEIROS
SET NUM_PENALTIS_DEFENDIDOS = 7
WHERE ID_JOGADORES = 9;

UPDATE GOLEIROS
SET NUM_GOLS_CONCEDIDOS = 18
WHERE ID_JOGADORES = 3;

UPDATE GOLEIROS
SET	
	NUM_DEFESAS = 30,
    NUM_GOLS_CONCEDIDOS = 0
WHERE ID_JOGADORES = 1;

UPDATE GOLEIROS
SET
	NUM_GOLS_CONCEDIDOS = 25,
    NUM_DEFESAS = 10
WHERE ID_JOGADORES = 8;

DROP TABLE IF EXISTS LATERAL_DIR;
CREATE TABLE LATERAL_DIR (
	ID_LATERAL_DIR int not null auto_increment PRIMARY KEY,
    ID_JOGADORES int not null,
    CARACTERISTICA enum('OFENSIVO','DEFENSIVO') not null,
    NUM_CRUZAMENTOS int default '0',
    NUM_DESARMES int default '0',
    DATA_REGISTRO datetime not null,
    FOREIGN KEY (ID_JOGADORES) REFERENCES JOGADORES(ID_JOGADORES)
);

# INSERT LATERAL_DIR
INSERT INTO LATERAL_DIR 
(ID_JOGADORES, CARACTERISTICA, NUM_CRUZAMENTOS, NUM_DESARMES, DATA_REGISTRO)
VALUES
(1, 'OFENSIVO', 15, 3, NOW()),
(2, 'DEFENSIVO', 4, 12, NOW()),
(3, 'OFENSIVO', 20, 5, NOW()),
(4, 'DEFENSIVO', 6, 14, NOW()),
(5, 'OFENSIVO', 18, 7, NOW()),
(6, 'DEFENSIVO', 5, 10, NOW()),
(7, 'OFENSIVO', 22, 4, NOW()),
(8, 'DEFENSIVO', 3, 15, NOW()),
(9, 'OFENSIVO', 17, 6, NOW()),
(10, 'DEFENSIVO', 7, 11, NOW());

# UPDATE LATERAL_DIR
UPDATE LATERAL_DIR
SET NUM_DESARMES = 26
WHERE ID_JOGADORES = 8;

UPDATE LATERAL_DIR
SET CARACTERISTICA = 'OFENSIVO'
WHERE ID_JOGADORES = 3;

UPDATE LATERAL_DIR
SET NUM_CRUZAMENTOS = 5
WHERE ID_JOGADORES = 9;

UPDATE LATERAL_DIR
SET NUM_DESARMES = 39
WHERE ID_JOGADORES = 9;

UPDATE LATERAL_DIR
SET CARACTERISTICA = 'DEFENSIVO'
WHERE ID_JOGADORES = 9;

DROP TABLE IF EXISTS LATERAL_ESQ;
CREATE TABLE LATERAL_ESQ (
	ID_LATERAL_ESQ int not null auto_increment PRIMARY KEY,
    ID_JOGADORES int not null,
    CARACTERISTICA enum('OFENSIVO','DEFENSIVO') not null,
    NUM_CRUZAMENTOS int default '0',
    NUM_DESARMES int default '0',
    DATA_REGISTRO datetime not null,
    FOREIGN KEY (ID_JOGADORES) REFERENCES JOGADORES(ID_JOGADORES)
);

# INSERT LATERAL_ESQ
INSERT INTO LATERAL_ESQ
(ID_JOGADORES, CARACTERISTICA, NUM_CRUZAMENTOS, NUM_DESARMES, DATA_REGISTRO)
VALUES
(1,'OFENSIVO', 45, 12, NOW()), 
(2,'DEFENSIVO', 10, 38, NOW()), 
(3,'OFENSIVO', 32, 21, NOW()), 
(4,'DEFENSIVO', 5, 42, NOW()),  
(5,'OFENSIVO', 50, 15, NOW()), 
(6,'OFENSIVO', 28, 19, NOW()), 
(7,'DEFENSIVO', 12, 33, NOW()),
(8,'OFENSIVO', 37, 25, NOW()), 
(9,'DEFENSIVO', 8, 40, NOW()),  
(10,'OFENSIVO', 41, 10, NOW()); 

# UPDATE LATERAL_ESQ
UPDATE LATERAL_ESQ
SET NUM_DESARMES = 32
WHERE ID_JOGADORES = 6;

UPDATE LATERAL_ESQ
SET CARACTERISTICA = 'DEFENSIVO'
WHERE ID_JOGADORES = 6;

UPDATE LATERAL_ESQ
SET NUM_CRUZAMENTOS = 12
WHERE ID_JOGADORES = 4;

UPDATE LATERAL_ESQ
SET NUM_DESARMES = 39
WHERE ID_JOGADORES = 9;

UPDATE LATERAL_ESQ
SET NUM_CRUZAMENTOS = 35
WHERE ID_JOGADORES = 8;

DROP TABLE IF EXISTS MEIO_CAMPO;
CREATE TABLE MEIO_CAMPO (
	ID_MEIO_CAMPO int not null auto_increment PRIMARY KEY,
    ID_JOGADORES int not null,
    NUM_ASSISTENCIAS int default '0',
    DATA_REGISTRO datetime not null,
    FOREIGN KEY (ID_JOGADORES) REFERENCES JOGADORES(ID_JOGADORES)
);

# INSERT MEIO_CAMPO
INSERT INTO MEIO_CAMPO
(ID_JOGADORES, NUM_ASSISTENCIAS, DATA_REGISTRO)
VALUES
(1,12, NOW()),
(2,5, NOW()), 
(3,8, NOW()),  
(4,2, NOW()),  
(5,10, NOW()), 
(6,7, NOW()),  
(7,4, NOW()),  
(8,15, NOW()), 
(9,3, NOW()),  
(10,6, NOW()); 

# UPDATE MEIO_CAMPO
UPDATE MEIO_CAMPO
SET NUM_ASSISTENCIAS = 6
WHERE ID_JOGADORES = 4;

UPDATE MEIO_CAMPO
SET NUM_ASSISTENCIAS = 13
WHERE ID_JOGADORES = 8;

UPDATE MEIO_CAMPO
SET NUM_ASSISTENCIAS = 16
WHERE ID_JOGADORES = 10;

UPDATE MEIO_CAMPO
SET NUM_ASSISTENCIAS = 0
WHERE ID_JOGADORES = 9;

UPDATE MEIO_CAMPO
SET NUM_ASSISTENCIAS = 10
WHERE ID_JOGADORES = 7;

DROP TABLE IF EXISTS CENTROAVANTES;
CREATE TABLE CENTROAVANTES (
	ID_CENTROAVANTES int not null auto_increment PRIMARY KEY,
    ID_JOGADORES int not null,
    NUM_FALTAS_BATIDAS int default '0',
    NUM_PENALTIS_PERDIDOS int default '0',
    DATA_REGISTRO datetime not null,
    FOREIGN KEY (ID_JOGADORES) REFERENCES JOGADORES(ID_JOGADORES)
);

# INSERT CENTROAVANTES
INSERT INTO CENTROAVANTES
(ID_JOGADORES, NUM_FALTAS_BATIDAS, NUM_PENALTIS_PERDIDOS, DATA_REGISTRO)
VALUES
(1, 12, 1, NOW()), 
(2, 5, 0, NOW()),  
(3, 2, 2, NOW()),  
(4, 25, 1, NOW()), 
(5, 0, 0, NOW()),  
(6, 8, 1, NOW()),  
(7, 15, 0, NOW()), 
(8, 4, 3, NOW()), 
(9, 10, 1, NOW()), 
(10, 1, 0, NOW()); 

# UPDATE CENTROAVANTES
UPDATE CENTROAVANTES
SET NUM_FALTAS_BATIDAS = 12
WHERE ID_JOGADORES = 9;

UPDATE CENTROAVANTES
SET NUM_PENALTIS_PERDIDOS = 1
WHERE ID_JOGADORES = 2;

UPDATE CENTROAVANTES
SET NUM_FALTAS_BATIDAS = 22
WHERE ID_JOGADORES = 3;

UPDATE CENTROAVANTES
SET NUM_PENALTIS_PERDIDOS = 0
WHERE ID_JOGADORES = 8;

UPDATE CENTROAVANTES
SET 
	NUM_FALTAS_BATIDAS = 11,
    NUM_PENALTIS_PERDIDOS = 1
WHERE ID_JOGADORES = 10;

DROP TABLE IF EXISTS VOLANTES;
CREATE TABLE VOLANTES (
	ID_VOLANTES int not null auto_increment PRIMARY KEY,
    ID_JOGADORES int not null,
    NUM_BOLAS_CONCEDIDAS int default '0',
    NUM_PASSES int default '0',
    DATA_REGISTRO datetime not null,
    FOREIGN KEY (ID_JOGADORES) REFERENCES JOGADORES(ID_JOGADORES)
);

# INSERT VOLANTES
INSERT INTO VOLANTES
(ID_JOGADORES, NUM_BOLAS_CONCEDIDAS, NUM_PASSES, DATA_REGISTRO)
VALUES
(1, 45, 412, NOW()),
(2, 38, 560, NOW()),
(3, 52, 389, NOW()),
(4, 41, 450, NOW()),
(5, 30, 610, NOW()),
(6, 48, 320, NOW()),
(7, 33, 545, NOW()),
(8, 55, 290, NOW()),
(9, 39, 488, NOW()),
(10, 42, 415, NOW());

# UPDATE VOLANTES
UPDATE VOLANTES
SET NUM_BOLAS_CONCEDIDAS = 47
WHERE ID_JOGADORES = 7;

UPDATE VOLANTES
SET NUM_PASSES = 594
WHERE ID_JOGADORES = 2;

UPDATE VOLANTES
SET NUM_BOLAS_CONCEDIDAS = 45
WHERE ID_JOGADORES = 8;

UPDATE VOLANTES
SET NUM_PASSES = 586
WHERE ID_JOGADORES = 6;

UPDATE VOLANTES
SET 
	NUM_PASSES = 455,
    NUM_BOLAS_CONCEDIDAS = 40
WHERE ID_JOGADORES = 1;

DROP TABLE IF EXISTS PONTA_ESQ;
CREATE TABLE PONTA_ESQ (
	ID_PONTA_ESQ int not null auto_increment PRIMARY KEY,
    ID_JOGADORES int not null,
    NUM_ESCANTEIOS int default '0',
    DATA_REGISTRO datetime not null,
    FOREIGN KEY (ID_JOGADORES) REFERENCES JOGADORES(ID_JOGADORES)
);

# INSERT PONTA_ESQ
INSERT INTO PONTA_ESQ
(ID_JOGADORES, NUM_ESCANTEIOS, DATA_REGISTRO)
VALUES
(1, 5, NOW()),
(2, 18, NOW()),
(3, 4, NOW()),
(4, 11, NOW()),
(5, 9, NOW()),
(6, 16, NOW()),
(7, 3, NOW()),
(8, 10, NOW()),
(9, 12, NOW()),
(10, 7, NOW());

# UPDATE PONTA_ESQ
UPDATE PONTA_ESQ
SET NUM_ESCANTEIOS = 15
WHERE ID_JOGADORES = 10;

UPDATE PONTA_ESQ
SET NUM_ESCANTEIOS = 12
WHERE ID_JOGADORES = 6;

UPDATE PONTA_ESQ
SET NUM_ESCANTEIOS = 10
WHERE ID_JOGADORES = 1;

UPDATE PONTA_ESQ
SET NUM_ESCANTEIOS = 14
WHERE ID_JOGADORES = 5;

UPDATE PONTA_ESQ
SET NUM_ESCANTEIOS = 2
WHERE ID_JOGADORES = 7;

DROP TABLE IF EXISTS PONTA_DIR;
CREATE TABLE PONTA_DIR (
	ID_PONTA_DIR int not null auto_increment PRIMARY KEY,
    ID_JOGADORES int not null,
    NUM_ESCANTEIOS int default '0',
    DATA_REGISTRO datetime not null,
    FOREIGN KEY (ID_JOGADORES) REFERENCES JOGADORES(ID_JOGADORES)
);

# INSERT PONTA_DIR
INSERT INTO PONTA_DIR 
(ID_JOGADORES, NUM_ESCANTEIOS, DATA_REGISTRO)
VALUES
(1, 12, NOW()),
(2, 8, NOW()),
(3, 15, NOW()),
(4, 10, NOW()),
(5, 7, NOW()),
(6, 11, NOW()),
(7, 9, NOW()),
(8, 14, NOW()),
(9, 6, NOW()),
(10, 13, NOW());

# UPDATE PONTA_DIR
UPDATE PONTA_DIR
SET NUM_ESCANTEIOS = 9
WHERE ID_JOGADORES = 1;

UPDATE PONTA_DIR
SET NUM_ESCANTEIOS = 9
WHERE ID_JOGADORES = 7;

UPDATE PONTA_DIR
SET NUM_ESCANTEIOS = 12
WHERE ID_JOGADORES = 8;

UPDATE PONTA_DIR
SET NUM_ESCANTEIOS = 16
WHERE ID_JOGADORES = 4;

UPDATE PONTA_DIR
SET NUM_ESCANTEIOS = 13
WHERE ID_JOGADORES = 1;

# DELETE

# N:N

DELETE FROM CLUBES_PATROCINADORES
	WHERE ID_CLUBES_PATROCINADORES IN (1,2,3,4,5);
        
DELETE FROM JOGOS_JOGADORES
	WHERE ID_JOGOS_JOGADORES BETWEEN 1 AND 10;

DELETE FROM JOGOS_JUIZES
	WHERE ID_JUIZES IN (1,2,3,4,5);
    
DELETE FROM JOGOS_COMISSAOTECNICA
	WHERE ID_JOGOS IN (1,2);

DELETE FROM JOGOS_REPORTERES
	WHERE ID_REPORTERES IN (1,2,3,4,5);
    
DELETE FROM TECNICOS_FORMACOES
	WHERE ID_FORMACOES IN (1,2,3,4,5);
    
# 1:N

# FORMACOES
DELETE FROM FORMACOES
	WHERE MENTALIDADE_PADRAO = 'DEFENSIVA';
DELETE FROM FORMACOES
	WHERE ESQUEMA_TATICO = '4-3-3';
DELETE FROM FORMACOES
	WHERE MENTALIDADE_PADRAO = 'OFENSIVA' AND ID_FORMACOES < 6;
    
# COMISSAO_TECNICA
DELETE FROM COMISSAO_TECNICA
WHERE ID_COMISSAO_TECNICA IN (1,2,3,4,5);

# PATROCINADORES    
DELETE FROM PATROCINADORES
	WHERE ID_PATROCINADORES IN (1,2,3,4,5);

# SOCIOS
DELETE FROM SOCIOS
	WHERE ID_SOCIOS IN (1,2,3,4,5);
    
# UNIFORMES
DELETE FROM UNIFORMES
	WHERE ID_UNIFORMES IN (1,2,3,4,5);
    
SELECT * FROM COMISSAO_TECNICA;

# POSIÇÕES

DELETE FROM GOLEIROS
	WHERE ID_GOLEIROS BETWEEN 1 AND 10;

DELETE FROM ZAGUEIROS
	WHERE ID_ZAGUEIROS BETWEEN 1 AND 10;
    
DELETE FROM LATERAL_ESQ
	WHERE ID_LATERAL_ESQ BETWEEN 1 AND 10;
    
DELETE FROM LATERAL_DIR
	WHERE ID_LATERAL_DIR BETWEEN 1 AND 10;
    
DELETE FROM VOLANTES
	WHERE ID_VOLANTES BETWEEN 1 AND 10;
    
DELETE FROM MEIO_CAMPO
	WHERE ID_MEIO_CAMPO BETWEEN 1 AND 10;
    
DELETE FROM PONTA_ESQ
	WHERE ID_PONTA_ESQ BETWEEN 1 AND 10;
    
DELETE FROM PONTA_DIR
	WHERE ID_PONTA_DIR BETWEEN 1 AND 10;
    
DELETE FROM CENTROAVANTES
	WHERE ID_CENTROAVANTES BETWEEN 1 AND 10;

# JOGADORES
DELETE FROM JOGADORES
	WHERE ID_JOGADORES BETWEEN 1 AND 55;  
    
# CLUBES
DELETE FROM CLUBES
	WHERE ID_CLUBES IN (1,2,3,4,5);

# FORNECEDORES
DELETE FROM FORNECEDORES
 WHERE ID_FORNECEDORES IN (1,2,3,4,5);
 
# PRESIDENTES
DELETE FROM PRESIDENTES
	WHERE ID_PRESIDENTES IN (1, 2, 3, 4, 5);

# JOGOS
DELETE FROM JOGOS
	WHERE ID_JOGOS IN (1,2,3,4,5);

# ESTADIOS
DELETE FROM ESTADIOS
	WHERE ID_ESTADIOS IN (1,2,3,4,5);
    
# JUIZES
DELETE FROM JUIZES
	WHERE CATEGORIA IN ('FIFA');
    
# REPORTERES
DELETE FROM REPORTERES
	WHERE ID_REPORTERES IN (1,2,3,4,5);

# TELEVISORAS
DELETE FROM TELEVISORES
	WHERE ID_TELEVISORES IN (1,2,3,4,5);
    
SELECT * FROM REPORTERES;

# TECNICOS
DELETE FROM TECNICOS
	WHERE ID_TECNICOS IN (1,2,3,4,5);