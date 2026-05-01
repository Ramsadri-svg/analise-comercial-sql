CREATE TABLE clientes (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(50),
    cidade VARCHAR(50)
);

CREATE TABLE produtos (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(50),
    preco DECIMAL(10,2)
);

CREATE TABLE vendas (
    id SERIAL PRIMARY KEY,
    data DATE,
    cliente_id INT,
    produto_id INT,
    quantidade INT
);