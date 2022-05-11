SELECT d.nome_departamento
, p.nome_projeto
, SUM(t.horas) AS horas_totais
FROM elmasri.departamento AS d
JOIN elmasri.projeto AS p
ON d.numero_departamento = p.numero_departamento
JOIN elmasri.trabalha_em AS t
ON t.numero_projeto = p.numero_projeto
GROUP BY d.nome_departamento, p.nome_projeto
ORDER BY d.nome_departamento ASC;
