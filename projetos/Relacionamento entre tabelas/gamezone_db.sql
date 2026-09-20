CREATE DATABASE gamezone_db;

USE gamezone_db;

CREATE TABLE servidores (
    id_servidor INT PRIMARY KEY AUTO_INCREMENT,
    nome_jogo VARCHAR(60) NOT NULL,
    mapa VARCHAR(50) NOT NULL,
    regiao VARCHAR(30) NOT NULL
);

CREATE TABLE jogadores (
    id_jogador INT PRIMARY KEY AUTO_INCREMENT,
    nickname VARCHAR(50) NOT NULL,
    nivel INT NOT NULL,
    moedas INT NOT NULL,
    id_servidor INT,
    FOREIGN KEY (id_servidor) REFERENCES servidores(id_servidor)
);

CREATE TABLE itens (
    id_item INT PRIMARY KEY AUTO_INCREMENT,
    nome_item VARCHAR(60) NOT NULL,
    raridade VARCHAR(30) NOT NULL,
    id_jogador INT,
    FOREIGN KEY (id_jogador) REFERENCES jogadores(id_jogador)
);

CREATE TABLE penalidades (
    id_penalidade INT PRIMARY KEY AUTO_INCREMENT,
    motivo VARCHAR(150) NOT NULL,
    tipo VARCHAR(30) NOT NULL,
    id_jogador INT,
    FOREIGN KEY (id_jogador) REFERENCES jogadores(id_jogador)
);

INSERT INTO servidores (nome_jogo, mapa, regiao) VALUES
('Battle Arena', 'Ruinas Antigas', 'Brasil'),
('City Life', 'Centro Urbano', 'America do Sul'),
('Monster Quest', 'Floresta Sombria', 'Europa'),
('Racing Extreme', 'Circuito Neon', 'Brasil'),
('Pirate World', 'Ilha Perdida', 'America do Norte'),
('Fantasy Kingdom', 'Castelo Real', 'Europa'),
('Space Wars', 'Estacao Orbital', 'Asia'),
('Zombie Survival', 'Cidade Abandonada', 'Brasil');

INSERT INTO jogadores
(nickname, nivel, moedas, id_servidor)
VALUES
('ShadowBR', 45, 3200, 1),
('LunaPlayer', 72, 8500, 3),
('SpeedKing', 31, 1900, 4),
('DarkKnight', 88, 12400, 6),
('NoobMaster', 12, 300, 2),
('DragonSlayer', 95, 15600, 3),
('PixelGirl', 54, 4700, 8),
('RacerX', 67, 6200, 4),
('CaptainJack', 39, 2800, 5),
('StarHunter', 81, 9100, 7),
('ZombieKiller', 63, 5300, 8),
('KnightBR', 27, 1500, 6),
('GhostPlayer', 76, 7200, 1),
('CyberWolf', 91, 13900, 7),
('MiniGamer', 18, 800, 2);

INSERT INTO itens
(nome_item, raridade, id_jogador)
VALUES
('Espada Sombria', 'Lendario', 4),
('Armadura de Dragao', 'Mitico', 6),
('Capacete Neon', 'Raro', 3),
('Coroa Real', 'Lendario', 4),
('Blaster Plasma', 'Epico', 10),
('Mascote Fantasma', 'Raro', 13),
('Asas Celestiais', 'Mitico', 2),
('Moto Neon', 'Epico', 8),
('Sabre Pirata', 'Comum', 9),
('Machado Congelado', 'Raro', 12),
('Mascote Zumbi', 'Lendario', 11),
('Armadura Cyber', 'Mitico', 14);

INSERT INTO penalidades
(motivo, tipo, id_jogador)
VALUES
('Uso de programa externo durante a partida', 'Suspensao', 1),
('Abandono repetitivo de partidas', 'Advertencia', 3),
('Tentativa de fraude na troca de itens', 'Banimento', 6),
('Comportamento inadequado no chat', 'Advertencia', 5),
('Uso de vantagem ilegal', 'Banimento', 11),
('Divulgacao de links suspeitos', 'Suspensao', 14);

select * from servidores;
select * from jogadores;
select * from penalidades;
select * from itens;

select nickname, nome_jogo from jogadores
inner join servidores on (servidores.id_servidor = jogadores.id_servidor);

#Nessa consulta, faço uma relação entre as tabelas jogadores e servidores.
#A tabela servidores possui a chave primária id_servidor, enquanto a tabela jogadores
#possui id_servidor como chave estrangeira, referenciando a chave primária da tabela servidores.
#Por meio do INNER JOIN, relaciono os registros das duas tabelas quando o valor de id_servidor 
#da tabela jogadores corresponde ao valor de id_servidor da tabela servidores.
#Dessa forma, consigo utilizar informações das duas tabelas na mesma consulta, relacionando cada 
#jogador ao servidor em que ele está conectado.

select nickname, mapa, regiao from jogadores
inner join servidores on (servidores.id_servidor = jogadores.id_servidor);

#Nome, mapa e região de onde os jogadores se encontram.

select nickname, nome_item from jogadores
inner join itens on (jogadores.id_jogador = itens.id_jogador);

#Nome e o nome do item que cada jogador tem.

select nickname, nome_item, raridade from jogadores
inner join itens on (jogadores.id_jogador = itens.id_jogador)
where raridade = 'Lendario';

#Uma consulta que se parece com as outras, a única diferença é que como tenho que
#buscar apenas os itens no qual a raridade de itens seja apenas Lendario.

select nickname, nivel, nome_jogo, regiao from jogadores
inner join servidores on (servidores.id_servidor = jogadores.id_servidor)
where regiao = 'Brasil';

#Listagem do nickname, nível, nome do jogo e região de apenas aqueles jogadores que estão
#no servidor do Brasil.

select nickname, moedas, nome_jogo from jogadores
inner join servidores on (servidores.id_servidor = jogadores.id_servidor)
where moedas > 6000;

#Nome, quantidade de moedas e o jogo no qual jogadores com um quantidade maior de 6000
#moedas estão no momento.

select nickname, motivo, tipo, nome_jogo from jogadores
inner join penalidades on (jogadores.id_jogador = penalidades.id_jogador)
inner join servidores on (servidores.id_servidor = jogadores.id_servidor)
where tipo = 'Banimento';

#Nome, motivo do banimento, tipo de banimento e o nome do jogo onde os playes
#estavam quando tomaram banimento.

select nickname, nivel, nome_jogo, mapa from jogadores
inner join servidores on (servidores.id_servidor = jogadores.id_servidor)
order by nivel desc;

#Nome, nível, nome do jogo e mapa onde se encontram os jogadores de maior nivel
#até o de menor nível.

select nome_item, raridade, nickname from itens
inner join jogadores on (jogadores.id_jogador = itens.id_jogador)
order by nome_item asc;

#Nome do item, raridade e nome do jogador que pussi o item, de A a Z.

select nickname, nivel, nome_jogo, mapa, nome_item, tipo, motivo from jogadores
inner join servidores on (servidores.id_servidor = jogadores.id_servidor)
left join itens on (jogadores.id_jogador = itens.id_jogador)
inner join penalidades on (jogadores.id_jogador = penalidades.id_jogador)
order by nickname asc;

#2 inner joins e 1 left join, pra pegar o nome do jogo e mapa aonde se 
#encontrava o jogador, left join para permitir que jogadores sem nenhum 
#item também apareçam na consulta, tipo e motivo do banimento do jogador
#de acordo com o nickname em ordem alfabética.
