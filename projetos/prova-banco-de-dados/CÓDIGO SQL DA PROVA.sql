BANCO DE DADOS
CREATE DATABASE lavajato_sys;
USE lavajato_sys;
CREATE TABLE RegistroLavagem (
 id_lavagem INT PRIMARY KEY,
 lavador VARCHAR(50),
 tipo_veiculo VARCHAR(50),
 litros_agua INT,
 pausas_cafe INT
);
INSERT INTO RegistroLavagem (id_lavagem, lavador, tipo_veiculo, litros_agua, pausas_cafe) VALUES
(1, 'Marujo', 'SUV', 250, 4),
(2, 'Marujo', 'Moto', 80, 2),
(3, 'Pirata', 'Carro', 150, 1),
(4, 'Pirata', 'SUV', 300, 5),
(5, 'Corsario', 'Moto', 90, 3),
(6, 'Corsario', 'Carro', 180, 2),
(7, 'Borracheiro', 'SUV', 220, 0),
(8, 'Borracheiro', 'Moto', 70, 1),
(9, 'Pirata', 'Moto', 60, 2),
(10, 'Marujo', 'Carro', 160, 3);

select * from registrolavagem;

select lavador, tipo_veiculo, sum(litros_agua) from registrolavagem
where tipo_veiculo like 'SUV' or tipo_veiculo like 'Carro'
group by lavador
having sum(litros_agua) >= 400;

select tipo_veiculo, avg(pausas_cafe) from registrolavagem
group by tipo_veiculo
having avg(pausas_cafe) > 2.0;

select lavador, max(litros_agua), min(pausas_cafe) from registrolavagem
group by lavador
having min(pausas_cafe) = 0 or max(litros_agua) >= 300;

select lavador, avg(litros_agua) from registrolavagem
group by lavador
having avg(litros_agua) > 150.0
order by lavador desc;