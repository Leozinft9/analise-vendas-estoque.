-- 1. Faturamento total
SELECT ROUND(SUM(iv.quantidade * iv.preco_unitario), 2) AS faturamento_total
FROM itens_venda iv;

-- 2. Quantidade de vendas
SELECT COUNT(*) AS total_vendas
FROM vendas;

-- 3. Faturamento por mês
SELECT
    strftime('%Y-%m', v.data_venda) AS mes,
    ROUND(SUM(iv.quantidade * iv.preco_unitario), 2) AS faturamento
FROM vendas v
JOIN itens_venda iv ON v.venda_id = iv.venda_id
GROUP BY mes
ORDER BY mes;

-- 4. Produtos mais vendidos (por unidades)
SELECT
    p.produto,
    SUM(iv.quantidade) AS unidades_vendidas
FROM itens_venda iv
JOIN produtos p ON iv.produto_id = p.produto_id
GROUP BY p.produto
ORDER BY unidades_vendidas DESC
LIMIT 10;

-- 5. Faturamento por categoria
SELECT
    p.categoria,
    ROUND(SUM(iv.quantidade * iv.preco_unitario), 2) AS faturamento
FROM itens_venda iv
JOIN produtos p ON iv.produto_id = p.produto_id
GROUP BY p.categoria
ORDER BY faturamento DESC;

-- 6. Produtos que precisam de reposição
SELECT
    produto,
    estoque_atual,
    estoque_minimo
FROM produtos
WHERE estoque_atual <= estoque_minimo
ORDER BY estoque_atual ASC;

-- 7. Margem bruta estimada por produto
SELECT
    p.produto,
    ROUND(SUM(iv.quantidade * (iv.preco_unitario - p.custo_unitario)), 2) AS margem_bruta
FROM itens_venda iv
JOIN produtos p ON iv.produto_id = p.produto_id
GROUP BY p.produto
ORDER BY margem_bruta DESC;

-- 8. Formas de pagamento mais utilizadas
SELECT
    v.forma_pagamento,
    COUNT(DISTINCT v.venda_id) AS quantidade_vendas
FROM vendas v
GROUP BY v.forma_pagamento
ORDER BY quantidade_vendas DESC;

-- 9. Produtos sem vendas registradas
SELECT p.produto
FROM produtos p
LEFT JOIN itens_venda iv ON p.produto_id = iv.produto_id
WHERE iv.produto_id IS NULL;

-- 10. Ticket médio por venda
SELECT
    ROUND(SUM(total_venda) / COUNT(*), 2) AS ticket_medio
FROM (
    SELECT v.venda_id, SUM(iv.quantidade * iv.preco_unitario) AS total_venda
    FROM vendas v
    JOIN itens_venda iv ON v.venda_id = iv.venda_id
    GROUP BY v.venda_id
);
