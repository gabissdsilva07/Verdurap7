CREATE DATABASE IF NOT EXISTS Verdurao7;
USE Verdurao7;

CREATE TABLE categorias (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL
);

CREATE TABLE produtos (
    id_produto INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    categoria_id INT NOT NULL,
    preco DECIMAL(10,2) NOT NULL,
    calorias INT NOT NULL,
    vitamina_a INT NOT NULL,
    vitamina_c INT NOT NULL,
    ferro INT NOT NULL,
    fibra INT NOT NULL,
    FOREIGN KEY (categoria_id)
        REFERENCES categorias(id_categoria)
);

CREATE TABLE clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    idade INT NOT NULL,
    objetivo VARCHAR(50) NOT NULL
);

CREATE TABLE compras (
    id_compra INT AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT NOT NULL,
    data_compra DATE NOT NULL,
    FOREIGN KEY (cliente_id)
        REFERENCES clientes(id_cliente)
);

CREATE TABLE itens_compra (
    id_item INT AUTO_INCREMENT PRIMARY KEY,
    compra_id INT NOT NULL,
    produto_id INT NOT NULL,
    quantidade INT NOT NULL,
    FOREIGN KEY (compra_id)
        REFERENCES compras(id_compra),
    FOREIGN KEY (produto_id)
        REFERENCES produtos(id_produto)
);

SELECT
    c.nome AS cliente,
    c.objetivo,
    p.nome AS produto,
    p.ferro,
    p.vitamina_c
FROM clientes c
JOIN compras co
    ON c.id_cliente = co.cliente_id
JOIN itens_compra ic
    ON co.id_compra = ic.compra_id
JOIN produtos p
    ON ic.produto_id = p.id_produto;