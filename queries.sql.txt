-- Faturamento total
SELECT 
    SUM(v.quantidade * p.preco) AS faturamento_total
FROM vendas v
JOIN produtos p ON v.produto_id = p.id;

-- Faturamento por cliente
SELECT 
    c.nome,
    SUM(v.quantidade * p.preco) AS faturamento
FROM vendas v
JOIN clientes c ON v.cliente_id = c.id
JOIN produtos p ON v.produto_id = p.id
GROUP BY c.nome
ORDER BY faturamento DESC;

-- Produto mais vendido
SELECT 
    p.nome,
    SUM(v.quantidade) AS total_vendido
FROM vendas v
JOIN produtos p ON v.produto_id = p.id
GROUP BY p.nome
ORDER BY total_vendido DESC;

-- Clientes sem compra
SELECT 
    c.nome
FROM clientes c
LEFT JOIN vendas v ON c.id = v.cliente_id
WHERE v.id IS NULL;

-- Classificação de clientes
SELECT 
    c.nome,
    SUM(v.quantidade * p.preco) AS faturamento,
    CASE 
        WHEN SUM(v.quantidade * p.preco) > 3000 THEN 'Alto'
        ELSE 'Baixo'
    END AS classificacao
FROM vendas v
JOIN clientes c ON v.cliente_id = c.id
JOIN produtos p ON v.produto_id = p.id
GROUP BY c.nome;