WITH RECURSIVE arvore_classificacoes (codigo, nome) AS
(
	SELECT codigo, nome, nome::varchar AS path FROM classificacao WHERE codigo_pai IS NULL
	UNION ALL
	SELECT
  	classificacao.codigo,
  	classificacao.nome,
  	arvore_classificacoes.path || ' -> ' || classificacao.nome
  FROM classificacao
  JOIN arvore_classificacoes ON classificacao.codigo_pai = arvore_classificacoes.codigo
)
SELECT path from arvore_classificacoes
ORDER BY codigo;
