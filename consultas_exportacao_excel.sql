-- 1. Taxa de abandono por canal de origem
SELECT
  u.canal_origem,
  COUNT(*) AS total_carrinhos,
  SUM(CASE WHEN c.finalizado = 0 THEN 1 ELSE 0 END) AS qtd_abandonos,
  ROUND(SUM(CASE WHEN c.finalizado = 0 THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS taxa_abandono_pct
FROM carrinhos c
JOIN usuarios u ON c.id_usuario = u.id_usuario
GROUP BY u.canal_origem;

-- 2. Valor médio dos carrinhos abandonados
SELECT
  ROUND(AVG(valor_total), 2) AS valor_medio_abandonado
FROM carrinhos
WHERE finalizado = 0;

-- 3. Categorias mais abandonadas (baseado em itens dos carrinhos)
SELECT
  ic.categoria,
  COUNT(*) AS qtd_abandonos
FROM itens_carrinho ic
JOIN carrinhos c ON ic.id_carrinho = c.id_carrinho
WHERE c.finalizado = 0
GROUP BY ic.categoria
ORDER BY qtd_abandonos DESC;

-- 4. Evolução mensal da taxa de abandono
SELECT
  DATE_FORMAT(data_criacao, '%Y-%m') AS mes,
  COUNT(*) AS total_carrinhos,
  SUM(CASE WHEN finalizado = 0 THEN 1 ELSE 0 END) AS abandonados,
  ROUND(SUM(CASE WHEN finalizado = 0 THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS taxa_abandono_pct
FROM carrinhos
GROUP BY mes
ORDER BY mes;
