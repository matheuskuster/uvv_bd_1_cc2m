-- -----------------------------------------------------------------------------------
-- Design e Desenvolvimento de Banco de Dados (PSET1) - POSTGRES
-- 0010 - Adiciona índices únicos, afim de ter Alternate Keys (AK)
-- -----------------------------------------------------------------------------------
-- Por: Matheus Kuster Rosa (CC2M)
--      matheuskuster@hotmail.com
-- -----------------------------------------------------------------------------------

-- Adiciona um índice único chamado departamento_idx na coluna nome_departamento da tabela departamento
CREATE UNIQUE INDEX departamento_idx
 ON departamento ( nome_departamento );

-- Adiciona um índice único chamado projeto_idx na coluna nome_projeto da tabela projeto
CREATE UNIQUE INDEX projeto_idx
 ON projeto ( nome_projeto );
