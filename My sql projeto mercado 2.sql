
CREATE DATABASE sistema_vendas_relacional;
USE sistema_vendas_relacional;


CREATE TABLE Cliente (
    id_cliente_PK INT PRIMARY KEY AUTO_INCREMENT,
    crf VARCHAR(11) NOT NULL UNIQUE,
    nome VARCHAR(45) NOT NULL
);


CREATE TABLE Colaborador (
    id_colaborador_PK INT PRIMARY KEY AUTO_INCREMENT,
    crf VARCHAR(45) NOT NULL UNIQUE,
    nome VARCHAR(45) NOT NULL,
    cargo VARCHAR(45) NOT NULL
);


CREATE TABLE Produto (
    id_produto_PK INT PRIMARY KEY AUTO_INCREMENT,
    nome_comercio VARCHAR(45) NOT NULL,
    Marca VARCHAR(45),
    categoria VARCHAR(45),
    preço FLOAT NOT NULL
);


CREATE TABLE Endereço (
    id_cliente_PK INT PRIMARY KEY,
    Endereço VARCHAR(45) NOT NULL,
    exp INT NOT NULL,
    cidade VARCHAR(45) NOT NULL,
    logadouro VARCHAR(45) NOT NULL,
    cliente_id_cliente_PK INT,
    FOREIGN KEY (cliente_id_cliente_PK) REFERENCES Cliente(id_cliente_PK)
);


CREATE TABLE Telefone (
    id_cliente_PK INT PRIMARY KEY,
    Telefone INT NOT NULL,
    cliente_id_cliente_PK INT,
    FOREIGN KEY (cliente_id_cliente_PK) REFERENCES Cliente(id_cliente_PK)
);


CREATE TABLE Vendas (
    id_vendas_PK INT PRIMARY KEY AUTO_INCREMENT,
    data_DATETIME DATETIME NOT NULL,
    valor_total DECIMAL(20,2) NOT NULL,
    Colaborador_id_colaborador_PK INT NOT NULL,
    cliente_id_cliente_PK INT NOT NULL,
    FOREIGN KEY (Colaborador_id_colaborador_PK) REFERENCES Colaborador(id_colaborador_PK),
    FOREIGN KEY (cliente_id_cliente_PK) REFERENCES Cliente(id_cliente_PK)
);


CREATE TABLE Itens_venda (
    id_Itens_venda_PK INT PRIMARY KEY AUTO_INCREMENT,
    id_vendas_PK INT NOT NULL,
    id_produto_PK INT NOT NULL,
    Vendas_id_vendas_PK INT NOT NULL,
    Produto_id_produto_PK INT NOT NULL,
    quantidade INT NOT NULL DEFAULT 1,
    FOREIGN KEY (id_vendas_PK) REFERENCES Vendas(id_vendas_PK),
    FOREIGN KEY (id_produto_PK) REFERENCES Produto(id_produto_PK),
    FOREIGN KEY (Vendas_id_vendas_PK) REFERENCES Vendas(id_vendas_PK),
    FOREIGN KEY (Produto_id_produto_PK) REFERENCES Produto(id_produto_PK)
);


CREATE INDEX idx_cliente_nome ON Cliente(nome);
CREATE INDEX idx_produto_nome ON Produto(nome_comercio);
CREATE INDEX idx_venda_data ON Vendas(data_DATETIME);
CREATE INDEX idx_venda_cliente ON Vendas(cliente_id_cliente_PK);