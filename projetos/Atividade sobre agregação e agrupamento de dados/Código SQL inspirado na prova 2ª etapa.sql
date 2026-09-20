CREATE DATABASE gamestore_db;

USE gamestore_db;

CREATE TABLE RegistroVenda (
    id_venda INT PRIMARY KEY,
    vendedor VARCHAR(50),
    jogo VARCHAR(100),
    genero VARCHAR(50),
    plataforma VARCHAR(30),
    valor_venda DECIMAL(10,2),
    quantidade INT,
    horas_jogadas INT
);

INSERT INTO RegistroVenda
(id_venda, vendedor, jogo, genero, plataforma, valor_venda, quantidade, horas_jogadas)
VALUES
(1, 'Carlos', 'Elden Ring', 'RPG', 'PC', 250.00, 2, 80),
(2, 'Carlos', 'God of War', 'Acao', 'PlayStation', 220.00, 1, 35),
(3, 'Marina', 'Minecraft', 'Sandbox', 'PC', 120.00, 3, 100),
(4, 'Marina', 'FIFA 26', 'Esporte', 'PlayStation', 300.00, 2, 60),
(5, 'Lucas', 'Forza Horizon 5', 'Corrida', 'Xbox', 200.00, 2, 45),
(6, 'Lucas', 'Elden Ring', 'RPG', 'Xbox', 230.00, 1, 90),
(7, 'Ana', 'The Last of Us', 'Acao', 'PlayStation', 180.00, 2, 25),
(8, 'Ana', 'Minecraft', 'Sandbox', 'Xbox', 110.00, 4, 120),
(9, 'Carlos', 'Cyberpunk 2077', 'RPG', 'PC', 210.00, 1, 70),
(10, 'Marina', 'Mario Kart 8', 'Corrida', 'Nintendo Switch', 190.00, 3, 50),
(11, 'Lucas', 'FIFA 26', 'Esporte', 'Xbox', 280.00, 1, 55),
(12, 'Ana', 'Elden Ring', 'RPG', 'PlayStation', 240.00, 2, 75),
(13, 'Carlos', 'Minecraft', 'Sandbox', 'PC', 130.00, 2, 95),
(14, 'Marina', 'God of War', 'Acao', 'PlayStation', 210.00, 1, 40),
(15, 'Lucas', 'Forza Horizon 5', 'Corrida', 'Xbox', 195.00, 3, 65);

select * from RegistroVenda;

select genero, sum(quantidade) from RegistroVenda
group by genero;

#Código para encontrar cada tipo de genero e somara as sumas quantidade de vendas
#group by para juntar qualquer tipo de gênero que seja igual.

select plataforma, sum(quantidade) from RegistroVenda
group by plataforma;

#Quase a mesma coisa da questão de cima, a única diferença é que ele
#pede exclusivamente das plataformas

select vendedor, sum(valor_venda) from RegistroVenda
group by vendedor
order by sum(valor_venda) desc;

#Aqui pede o quanto cada vendedor da loja arrecadou no total, então pra isso
#eu pego vendedor e a soma total do valor de vendas (sum(valor_venda))
#depois agrupo qualquer registro relacionado ao mesmo vendedor e ordeno
#a soma de maior pra menor

select plataforma, avg(valor_venda) from RegistroVenda
group by plataforma
having avg(valor_venda) > 180;

#Seleciono cada plataforma e a média do valor de venda
#Depois agrupo qualquer registro com a mesma plataforma e por fim, faço
#com que a pesquisa apareça apenas se a média for maior que 180.

select genero, sum(quantidade) from RegistroVenda
group by genero
having sum(quantidade) > 5
order by sum(quantidade) desc;

#Seleciono genero, a soma das quantidades totais de vendas por cada genero
#agrupo genero, faço com que na pesquisa aceita somente quantidades
#que sejam acima de 5 e depois ordeno de maior pra menor.

select genero, avg(horas_jogadas) from RegistroVenda
group by genero
having avg(horas_jogadas) > 60;

#Seleciono Genero, média de horas jogadas em cada genero. agrupo cada
#generoe depois faço a filtração de apenas cujo as médias sejam
#superiores a 60.

select vendedor, count(id_venda) from RegistroVenda
group by vendedor
having count(id_venda) >= 3
order by count(id_venda) desc;

#Seleciono Vendedor, Quantidade de vendas registradas
#agrupo cada vendedor, filtro apenas aqueles que tem pelo menos
#3 vendas registradas e depois ordeno de maior pra menor.

select genero, count(id_venda), sum(quantidade), avg(valor_venda), max(valor_venda), min(valor_venda) from RegistroVenda
group by genero
order by avg(valor_venda) desc;

#Relatório final dos gulosos. Basicamente eu seleciono:
#genero, a quantidade de vendas registradas, a soma de
#todas as quantidades, valor médio das vendas, o valor 
#máximo em uma venda e o menor valor em uma venda.
#Agrupo cada genero em 1 só, e depois ordeno de acordo com
#a maior média do valor da venda para o menor.