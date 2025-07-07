DROP TABLE IF EXISTS itens_carrinho;
DROP TABLE IF EXISTS carrinhos;
DROP TABLE IF EXISTS usuarios;

CREATE TABLE usuarios (
    id_usuario INT PRIMARY KEY,
    nome VARCHAR(255),
    email VARCHAR(255),
    canal_origem VARCHAR(255)
);

CREATE TABLE carrinhos (
    id_carrinho INT PRIMARY KEY,
    id_usuario INT,
    data_criacao DATE,
    valor_total DECIMAL(10,2),
    finalizado BOOLEAN,
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario)
);

CREATE TABLE itens_carrinho (
    id_item INT PRIMARY KEY,
    id_carrinho INT,
    nome_produto VARCHAR(255),
    categoria VARCHAR(255),
    preco_unitario DECIMAL(10,2),
    quantidade INT,
    FOREIGN KEY (id_carrinho) REFERENCES carrinhos(id_carrinho)
);

-- Usuários
INSERT INTO usuarios (id_usuario, nome, email, canal_origem) VALUES
(1, 'Ana', 'ana@email.com', 'Google Ads'),
(2, 'Bruno', 'bruno@email.com', 'Facebook'),
(3, 'Carlos', 'carlos@email.com', 'Instagram'),
(4, 'Daniela', 'daniela@email.com', 'Orgânico'),
(5, 'Eduardo', 'eduardo@email.com', 'Indicação'),
(6, 'Fernanda', 'fernanda@email.com', 'Facebook'),
(7, 'Gabriel', 'gabriel@email.com', 'Orgânico'),
(8, 'Helena', 'helena@email.com', 'Google Ads'),
(9, 'Igor', 'igor@email.com', 'Instagram'),
(10, 'Joana', 'joana@email.com', 'Orgânico');

-- Carrinhos
INSERT INTO carrinhos (id_carrinho, id_usuario, data_criacao, valor_total, finalizado) VALUES
(1, 1, '2024-01-05', 230.50, 0),
(2, 2, '2024-01-10', 120.00, 1),
(3, 3, '2024-02-12', 460.75, 0),
(4, 4, '2024-02-20', 89.99, 1),
(5, 5, '2024-03-02', 210.10, 1),
(6, 6, '2024-03-15', 305.60, 0),
(7, 7, '2024-03-30', 80.00, 0),
(8, 8, '2024-04-10', 512.30, 1),
(9, 9, '2024-04-20', 130.00, 0),
(10, 10, '2024-05-01', 270.90, 1),
(11, 1, '2024-05-10', 190.00, 1),
(12, 2, '2024-05-15', 99.99, 0),
(13, 3, '2024-06-02', 410.75, 0),
(14, 4, '2024-06-11', 350.00, 1),
(15, 5, '2024-06-19', 220.10, 1),
(16, 6, '2024-07-01', 205.60, 0),
(17, 7, '2024-07-03', 150.00, 0),
(18, 8, '2024-07-05', 312.30, 1),
(19, 9, '2024-07-06', 140.00, 0),
(20, 10, '2024-07-07', 275.90, 1);

-- Itens
INSERT INTO itens_carrinho (id_item, id_carrinho, nome_produto, categoria, preco_unitario, quantidade) VALUES
(1, 1, 'Camisa Polo', 'Moda', 115.25, 2),
(2, 2, 'Tênis Esportivo', 'Calçados', 120.00, 1),
(3, 3, 'Notebook', 'Eletrônicos', 460.75, 1),
(4, 4, 'Livro de Finanças', 'Livros', 89.99, 1),
(5, 5, 'Fone Bluetooth', 'Eletrônicos', 105.05, 2),
(6, 6, 'Relógio Smart', 'Acessórios', 305.60, 1),
(7, 7, 'Shorts Fitness', 'Moda', 80.00, 1),
(8, 8, 'Tablet', 'Eletrônicos', 512.30, 1),
(9, 9, 'Boné Esportivo', 'Moda', 65.00, 2),
(10, 10, 'Calça Jeans', 'Moda', 135.45, 2),
(11, 11, 'Mochila Casual', 'Acessórios', 190.00, 1),
(12, 12, 'Sandália', 'Calçados', 99.99, 1),
(13, 13, 'Monitor', 'Eletrônicos', 410.75, 1),
(14, 14, 'Óculos de Sol', 'Acessórios', 175.00, 2),
(15, 15, 'Tênis Casual', 'Calçados', 110.05, 2),
(16, 16, 'Camiseta Estampada', 'Moda', 102.80, 2),
(17, 17, 'Bermuda Jeans', 'Moda', 150.00, 1),
(18, 18, 'Headset Gamer', 'Eletrônicos', 312.30, 1),
(19, 19, 'Regata', 'Moda', 70.00, 2),
(20, 20, 'Jaqueta Corta-Vento', 'Moda', 275.90, 1);
