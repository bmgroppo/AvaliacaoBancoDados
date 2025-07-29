INSERT INTO Cliente (nome, CPF, Telefone, email) VALUES
('Ana Souza', '12345678901', '21988887777', 'ana.souza@email.com'),
('Carlos Lima', '23456789012', '21977776666', 'carlos.lima@email.com'),
('Fernanda Costa', '34567890123', '21966665555', 'fernanda.costa@email.com'),
('João Ribeiro', '45678901234', '21955554444', 'joao.ribeiro@email.com'),
('Paula Martins', '56789012345', '21944443333', 'paula.martins@email.com'),
('Renato Oliveira', '67890123456', '21933332222', 'renato.oliveira@email.com'),
('Juliana Melo', '78901234567', '21922221111', 'juliana.melo@email.com'),
('Marcelo Cunha', '89012345678', '21911110000', 'marcelo.cunha@email.com'),
('Patrícia Duarte', '90123456789', '21999998888', 'patricia.duarte@email.com'),
('Eduardo Sales', '01234567890', '21900001111', 'eduardo.sales@email.com');

INSERT INTO Animal (nome, especie, raca, idade, idCliente) VALUES
('Bolt', 'Cão', 'Labrador', 4, 1),
('Mimi', 'Gato', 'Siamês', 2, 2),
('Toby', 'Cão', 'Poodle', 3, 3),
('Luna', 'Gato', 'Persa', 5, 4),
('Pipoca', 'Cão', 'Beagle', 2, 5),
('Nina', 'Gato', 'Angorá', 1, 6),
('Rex', 'Cão', 'Pastor Alemão', 6, 7),
('Bidu', 'Cão', 'Bulldog', 4, 8),
('Mel', 'Gato', 'Maine Coon', 3, 9),
('Fred', 'Cão', 'Shih Tzu', 5, 10);

INSERT INTO Servico (tipo, duracao, preco) VALUES
('Banho', 30, 50.00),
('Tosa', 45, 70.00),
('Consulta Veterinária', 60, 120.00),
('Vacinação', 20, 90.00),
('Higienização de Ouvido', 15, 30.00),
('Desparasitação', 25, 85.00),
('Exame de Rotina', 40, 100.00),
('Escovação de Dentes', 20, 60.00),
('Aplicação de Antipulgas', 10, 45.00),
('Microchipagem', 20, 150.00);

INSERT INTO Agendamento (data, horario, status, idAnimal, idServico) VALUES
('2025-08-01', '10:00:00', 'Confirmado', 1, 1),
('2025-08-02', '11:30:00', 'Pendente', 2, 2),
('2025-08-03', '09:15:00', 'Confirmado', 3, 3),
('2025-08-04', '14:00:00', 'Cancelado', 4, 4),
('2025-08-05', '08:30:00', 'Confirmado', 5, 5),
('2025-08-06', '12:00:00', 'Confirmado', 6, 6),
('2025-08-07', '15:45:00', 'Pendente', 7, 7),
('2025-08-08', '13:30:00', 'Confirmado', 8, 8),
('2025-08-09', '16:00:00', 'Cancelado', 9, 9),
('2025-08-10', '10:15:00', 'Pendente', 10, 10);
