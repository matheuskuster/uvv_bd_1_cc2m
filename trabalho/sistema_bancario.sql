BEGIN;


CREATE TABLE IF NOT EXISTS agencias
(
    numero_banco character(3) NOT NULL,
    numero_agencia character(4) NOT NULL,
    nome character varying(50) NOT NULL,
    endereco character varying(100) NOT NULL,
    telefone character(11) NOT NULL,
    CONSTRAINT agencias_pk PRIMARY KEY (numero_banco, numero_agencia)
);

CREATE UNIQUE INDEX IF NOT EXISTS agencias_numero_agencia_idx
    ON public.agencias USING btree
    (numero_agencia COLLATE pg_catalog."default" ASC NULLS LAST)
    TABLESPACE pg_default;

CREATE TABLE IF NOT EXISTS bancos
(
    numero_banco character(3) NOT NULL,
    cnpj character(14) NOT NULL,
    endereco character varying(100) NOT NULL,
    telefone character(11) NOT NULL,
    site character varying(100) NOT NULL,
    razao_social character varying(100) NOT NULL,
    CONSTRAINT bancos_pk PRIMARY KEY (numero_banco, cnpj)
);

CREATE TABLE IF NOT EXISTS clientes
(
    codigo_cliente character(20) NOT NULL,
    nome character varying(50) NOT NULL,
    data_nascimento date NOT NULL,
    sexo character(1) NOT NULL,
    estado_civil character varying(15) NOT NULL,
    endereco character varying(100) NOT NULL,
    CONSTRAINT clientes_pk PRIMARY KEY (codigo_cliente)
);

CREATE TABLE IF NOT EXISTS contas
(
    numero_conta character(9) NOT NULL,
    senha character varying(50) NOT NULL,
    data_abertura date NOT NULL,
    saldo numeric(10, 2) NOT NULL,
    limite_credito numeric(10, 2) NOT NULL,
    CONSTRAINT contas_pk PRIMARY KEY (numero_conta)
);

CREATE TABLE IF NOT EXISTS contratos
(
    numero_contrato character(20) NOT NULL,
    data_assinatura date NOT NULL,
    descricao_contratante character varying(1000) NOT NULL,
    descricao_contratada character varying(1000) NOT NULL,
    CONSTRAINT contratos_pk PRIMARY KEY (numero_contrato)
);

CREATE TABLE IF NOT EXISTS empregados
(
    matricula character(20) NOT NULL,
    nome character varying(50) NOT NULL,
    cargo character varying(50) NOT NULL,
    endereco character varying(100) NOT NULL,
    salario numeric(10, 2) NOT NULL,
    CONSTRAINT empregados_pk PRIMARY KEY (matricula)
);

CREATE TABLE IF NOT EXISTS emprestimos
(
    codigo_emprestimo character(20) NOT NULL,
    data_aquisicao date NOT NULL,
    valor numeric(10, 2) NOT NULL,
    CONSTRAINT emprestimos_pk PRIMARY KEY (codigo_emprestimo)
);

CREATE TABLE IF NOT EXISTS lotacoes
(
    funcao_desempenhada character varying(20) NOT NULL,
    dias_trabalho character(3) NOT NULL,
    horarios_trabalho character varying(10) NOT NULL,
    numero_agencia character(4) NOT NULL,
    matricula_empregado character(20) NOT NULL
);

CREATE UNIQUE INDEX IF NOT EXISTS lotacoes_matricula_empregado_idx
    ON public.lotacoes USING btree
    (matricula_empregado COLLATE pg_catalog."default" ASC NULLS LAST)
    TABLESPACE pg_default;

CREATE TABLE IF NOT EXISTS parcelas
(
    codigo_emprestimo character(1) NOT NULL,
    numero_parcela character(3) NOT NULL,
    valor numeric(10, 2) NOT NULL,
    valor_juros numeric(10, 2),
    valor_multa numeric(10, 2),
    data_vencimento date NOT NULL,
    data_pagamento date NOT NULL,
    CONSTRAINT parcelas_pk PRIMARY KEY (codigo_emprestimo, numero_parcela)
);

CREATE TABLE IF NOT EXISTS servicos
(
    codigo_servico character(20) NOT NULL,
    nome character varying(50) NOT NULL,
    descricao character varying(1000) NOT NULL,
    valor_minimo numeric(10, 2),
    data_inicio_vigencia date,
    data_fim_vigencia date,
    CONSTRAINT servicos_pk PRIMARY KEY (codigo_servico)
);

ALTER TABLE IF EXISTS agencias
    ADD CONSTRAINT bancos_agencias_fk FOREIGN KEY (numero_agencia, numero_banco)
    REFERENCES bancos (cnpj, numero_banco) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;
CREATE INDEX IF NOT EXISTS agencias_pk
    ON agencias(numero_agencia, numero_banco);


ALTER TABLE IF EXISTS agencias
    ADD CONSTRAINT servicos_agencias_fk FOREIGN KEY (numero_banco)
    REFERENCES servicos (codigo_servico) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;


ALTER TABLE IF EXISTS contas
    ADD CONSTRAINT clientes_contas_fk FOREIGN KEY (numero_conta)
    REFERENCES clientes (codigo_cliente) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;
CREATE INDEX IF NOT EXISTS contas_pk
    ON contas(numero_conta);


ALTER TABLE IF EXISTS contratos
    ADD CONSTRAINT servicos_contratos_fk FOREIGN KEY (numero_contrato)
    REFERENCES servicos (codigo_servico) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;
CREATE INDEX IF NOT EXISTS contratos_pk
    ON contratos(numero_contrato);


ALTER TABLE IF EXISTS empregados
    ADD CONSTRAINT lotacoes_empregados_fk FOREIGN KEY (matricula)
    REFERENCES lotacoes (matricula_empregado) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;
CREATE INDEX IF NOT EXISTS empregados_pk
    ON empregados(matricula);


ALTER TABLE IF EXISTS emprestimos
    ADD CONSTRAINT clientes_emprestimos_fk FOREIGN KEY (codigo_emprestimo)
    REFERENCES clientes (codigo_cliente) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;
CREATE INDEX IF NOT EXISTS emprestimos_pk
    ON emprestimos(codigo_emprestimo);


ALTER TABLE IF EXISTS lotacoes
    ADD CONSTRAINT agencias_lotacoes_fk FOREIGN KEY (numero_agencia)
    REFERENCES agencias (numero_agencia) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;


ALTER TABLE IF EXISTS parcelas
    ADD CONSTRAINT emprestimos_parcelas_fk FOREIGN KEY (codigo_emprestimo)
    REFERENCES emprestimos (codigo_emprestimo) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;


ALTER TABLE IF EXISTS servicos
    ADD CONSTRAINT clientes_servicos_fk FOREIGN KEY (codigo_servico)
    REFERENCES clientes (codigo_cliente) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;
CREATE INDEX IF NOT EXISTS servicos_pk
    ON servicos(codigo_servico);


ALTER TABLE IF EXISTS servicos
    ADD CONSTRAINT contas_servicos_fk FOREIGN KEY (codigo_servico)
    REFERENCES contas (numero_conta) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;
CREATE INDEX IF NOT EXISTS servicos_pk
    ON servicos(codigo_servico);

END;
