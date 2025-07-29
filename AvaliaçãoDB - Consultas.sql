-- PARTE II da Avaliação.
-- 1. 2 consultas com SELECT e WHERE
SELECT * FROM Agendamento
WHERE status = 'Confirmado';

SELECT * FROM Animal
WHERE especie = 'Cão';

-- 2. 2 consultas com GROUP BY e ORDER BY com funções de agregação
-- Total de agendamentos por espécie de animal, ordenados pelo total
SELECT especie, COUNT(*) AS total_agendamentos
FROM Animal
GROUP BY especie
ORDER BY total_agendamentos DESC;

-- Média de duração dos atendimentos por tipo de serviço
SELECT tipo, AVG(duracao) AS media_duracao
FROM Servico
GROUP BY tipo
ORDER BY media_duracao DESC;

-- 3. 3 consultas com operadores de comparação (=, !=, <, >, etc.)
-- Animais com idade maior que 5 anos
SELECT * FROM Animal
WHERE idade > 5;

-- Serviços com duração menor que 30 minutos
SELECT * FROM Servico
WHERE duracao < 30;

-- Clientes com o nome diferente de 'José'
SELECT * FROM Cliente
WHERE nome != 'José';

-- 4. 3 consultas com operadores lógicos (AND, OR)
-- Animais da espécie "Cão" com idade maior que 4 anos
SELECT * FROM Animal
WHERE especie = 'Cão' AND idade > 4;

-- Serviços com preço maior que 50 OU duração menor que 20 minutos
SELECT * FROM Servico
WHERE preco > 50.00 OR duracao < 20;

-- Clientes com nome começando com 'J' E telefone iniciando com '2195'
SELECT * FROM Cliente
WHERE nome LIKE 'J%' AND Telefone LIKE '2195%';

-- 5. 3 consultas com o operador NOT
-- Animais que NÃO são da espécie "Gato"
SELECT * FROM Animal
WHERE NOT especie = 'Gato';

-- Serviços que NÃO têm duração igual a 30 minutos
SELECT * FROM Servico
WHERE NOT duracao = 30;

-- Clientes cujo nome NÃO termina com 'a'
SELECT * FROM Cliente
WHERE NOT nome LIKE '%a';

-- 6. 3 consultas com ORDER BY
-- Lista de animais ordenados pela idade (do mais novo pro mais velho)
SELECT * FROM Animal
ORDER BY idade ASC;

-- Lista de serviços ordenados pelo preço (do mais caro pro mais barato)
SELECT * FROM Servico
ORDER BY preco DESC;

-- Lista de clientes ordenados pelo nome em ordem alfabética
SELECT * FROM Cliente
ORDER BY nome ASC;

-- 7. 3 consultas com operadores auxiliares (IS NULL, BETWEEN, LIKE, IN)
-- Animais sem raça cadastrada (IS NULL)
SELECT * FROM Animal
WHERE raca IS NULL;

-- Serviços com preço entre 30 e 80 reais (BETWEEN)
SELECT * FROM Servico
WHERE preco BETWEEN 30 AND 80;

-- Clientes cujo nome contém 'Mar' (LIKE) e moram em bairros específicos (IN)
SELECT * FROM Cliente
WHERE nome LIKE '%Mar%';

-- 8. 3 consultas com funções de agregação (SUM(), AVG(), MAX(), etc.)
-- Soma total de preços dos serviços oferecidos
SELECT SUM(preco) AS total_receita
FROM Servico;

-- Média de idade dos animais cadastrados
SELECT AVG(idade) AS idade_media
FROM Animal;

-- Maior valor de preço por tipo de serviço
SELECT tipo, MAX(preco) AS maior_preco
FROM Servico
GROUP BY tipo;

-- 9. 2 consultas com funções de datas (NOW(), DATE(), YEAR(), etc.)
-- Agendamentos marcados entre os dias 1 e 5 de agosto de 2025 usando função DATE()
SELECT *
FROM Agendamento
WHERE DATE(data) BETWEEN '2025-08-01' AND '2025-08-05';

-- Contagem de agendamentos por status em agosto de 2025
SELECT status, COUNT(*) AS total
FROM Agendamento
WHERE MONTH(data) = 8 AND YEAR(data) = 2025
GROUP BY status;

-- 10. 3 sub-consultas com agrupamento e união de dados
-- Mostrar o tipo de serviço com maior número de agendamentos
SELECT tipo, total_agendamentos
FROM (
    SELECT Servico.tipo, COUNT(*) AS total_agendamentos
    FROM Agendamento
    JOIN Servico ON Agendamento.idServico = Servico.id
    GROUP BY Servico.tipo
) AS subconsulta
ORDER BY total_agendamentos DESC;

-- Clientes com número de agendamentos confirmados
SELECT nome, total_confirmados
FROM (
    SELECT Cliente.nome, COUNT(*) AS total_confirmados
    FROM Cliente
    JOIN Animal ON Animal.idCliente = Cliente.id
    JOIN Agendamento ON Agendamento.idAnimal = Animal.id
    WHERE Agendamento.status = 'Confirmado'
    GROUP BY Cliente.nome
) AS clientes_ativos
ORDER BY total_confirmados DESC;

-- Mostrar os serviços cujo preço é acima da média de todos os serviços
SELECT tipo, preco
FROM Servico
WHERE preco > (
    SELECT AVG(preco)
    FROM Servico
);

-- 11. 3 consultas com JOIN e visualização de tabelas
-- Mostrar dados do agendamento junto com nome do animal e tipo de serviço
SELECT 
    Agendamento.data,
    Agendamento.horario,
    Animal.nome AS nome_animal,
    Servico.tipo AS tipo_servico,
    Agendamento.status
FROM Agendamento
JOIN Animal ON Agendamento.idAnimal = Animal.id
JOIN Servico ON Agendamento.idServico = Servico.id;

-- Listar clientes com seus animais e respectivos serviços agendados
SELECT 
    Cliente.nome AS nome_cliente,
    Animal.nome AS nome_animal,
    Servico.tipo AS servico_marcado,
    Agendamento.data,
    Agendamento.status
FROM Cliente
JOIN Animal ON Animal.idCliente = Cliente.id
JOIN Agendamento ON Agendamento.idAnimal = Animal.id
JOIN Servico ON Agendamento.idServico = Servico.id;

-- Visualizar quantidade de agendamentos por tipo de serviço com nomes dos serviços
SELECT 
    Servico.tipo AS nome_servico,
    COUNT(*) AS total_agendamentos
FROM Servico
JOIN Agendamento ON Agendamento.idServico = Servico.id
GROUP BY Servico.id, Servico.tipo;

-- 12. 4 consultas com tipos de JOIN: INNER, LEFT, RIGHT
-- INNER JOIN: Mostrar agendamentos com dados completos de animal e serviço
SELECT 
    Agendamento.data,
    Agendamento.horario,
    Animal.nome AS nome_animal,
    Servico.tipo AS tipo_servico,
    Agendamento.status
FROM Agendamento
INNER JOIN Animal ON Agendamento.idAnimal = Animal.id
INNER JOIN Servico ON Agendamento.idServico = Servico.id;

-- LEFT JOIN: Mostrar todos os animais, mesmo sem agendamento
SELECT 
    Animal.nome,
    Agendamento.data,
    Agendamento.status
FROM Animal
LEFT JOIN Agendamento ON Agendamento.idAnimal = Animal.id;

-- RIGHT JOIN: Mostrar todos os serviços, mesmo sem terem sido agendados
SELECT 
    Servico.tipo,
    Agendamento.data,
    Agendamento.status
FROM Agendamento
RIGHT JOIN Servico ON Agendamento.idServico = Servico.id;

-- RIGHT JOIN: Mostrar todos os clientes, mesmo que não tenham animais cadastrados
SELECT 
    Cliente.nome,
    Animal.nome AS nome_animal
FROM Animal
RIGHT JOIN Cliente ON Animal.idCliente = Cliente.id;