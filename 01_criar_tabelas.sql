-- Projeto: Análise de Vendas e Gestão de Estoque
-- Banco de dados: SQLite

DROP TABLE IF EXISTS itens_venda;
DROP TABLE IF EXISTS vendas;
DROP TABLE IF EXISTS produtos;

CREATE TABLE produtos (
    produto_id INTEGER PRIMARY KEY,
    produto TEXT NOT NULL,
    categoria TEXT NOT NULL,
    custo_unitario REAL NOT NULL,
    preco_venda REAL NOT NULL,
    estoque_atual INTEGER NOT NULL,
    estoque_minimo INTEGER NOT NULL
);

CREATE TABLE vendas (
    venda_id INTEGER PRIMARY KEY,
    data_venda TEXT NOT NULL, -- formato YYYY-MM-DD
    cliente TEXT NOT NULL,
    forma_pagamento TEXT NOT NULL
);

CREATE TABLE itens_venda (
    item_id INTEGER PRIMARY KEY,
    venda_id INTEGER NOT NULL,
    produto_id INTEGER NOT NULL,
    quantidade INTEGER NOT NULL,
    preco_unitario REAL NOT NULL,
    FOREIGN KEY (venda_id) REFERENCES vendas(venda_id),
    FOREIGN KEY (produto_id) REFERENCES produtos(produto_id)
);

-- Após criar as tabelas, importe os CSVs da pasta dados:
-- produtos.csv -> produtos
-- vendas.csv -> vendas
-- itens_venda.csv -> itens_venda
