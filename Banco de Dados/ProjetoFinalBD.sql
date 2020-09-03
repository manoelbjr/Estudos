--Cria o Banco de dados Projeto Final
CREATE DATABASE "ProjetoFinal"
    WITH 
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'Portuguese_Brazil.1252'
    LC_CTYPE = 'Portuguese_Brazil.1252'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1;

-- ***************************
--  Criação das tabelas      *
-- ***************************

-- Cria a tabela catálogo de Serviços: Tipos genéricos de Problemas.
-- CRIAR REGRA: PERMITIR INSERÇÃO NESSA TABELA APENAS ADMIN
CREATE TABLE CatalogoServicos (
  idCatalogoServicos SERIAL NOT NULL UNIQUE,
  descricao VARCHAR(50) NOT NULL,
  SLA INTEGER NOT NULL,
PRIMARY KEY(idCatalogoServicos));

-- Cria a tabela Forma de Solicitação.
-- Telefone, email, frontend, pessoalmente (APENAS)
CREATE TABLE FormaSolicitacao (
  idFormaSolicitacao SERIAL NOT NULL UNIQUE,
  forma VARCHAR(15) NOT NULL,
PRIMARY KEY(idFormaSolicitacao));

-- ------------------------------------------------------------
-- User
-- or
-- Admin
-- ------------------------------------------------------------

-- O usuário pode ser um usuário comum OU Admin (Analista de TI)
CREATE TABLE GrupoUsuario (
  idGrupo SERIAL NOT NULL UNIQUE,
  grupo VARCHAR(10) NOT NULL,
PRIMARY KEY(idGrupo));

-- O usuário pode ser um usuário comum OU Admin (Analista de TI)
COMMENT ON TABLE GrupoUsuario IS 'O usuário pode ser um usuário comum ou Admin (Analista de TI) - User  or  Admin';

/*
Cria a tabela de Funcionário. Nas Nossas regras de negócio, não importa o cargo do colaborador
há uma chave estrangeira para o grupo do colaborador, que pode ser ADMIN, Comum
*/

CREATE TABLE Funcionarios (
  idFuncionario SERIAL NOT NULL UNIQUE,
  GrupoUsuario_idGrupo INTEGER NULL,
  cpf VARCHAR(14) UNIQUE,
  nome VARCHAR(50),
  login VARCHAR(40),
  setor VARCHAR(40),
  email VARCHAR(40),
PRIMARY KEY(idFuncionario),
FOREIGN KEY(GrupoUsuario_idGrupo) REFERENCES GrupoUsuario(idGrupo));

-- Um chamado possui uma forma de solicitação, um Serviço genérico, um funcionário atrelado e ações
CREATE TABLE Chamados (
  idChamado SERIAL NOT NULL UNIQUE,
  FormaSolicitacao_idFormaSolicitacao INTEGER NOT NULL,
  CatalogoServico_idCatalogoServicos INTEGER NOT NULL ,
  Funcionario_idFuncionario INTEGER NOT NULL,
  tipoChamado VARCHAR(15) check(
    tipoChamado = 'Incidente' or
    tipoChamado = 'Problema' or
    tipoChamado = 'Solicitação'
  ),
  descricao TEXT,
  estado VARCHAR(15),
PRIMARY KEY(idChamado),
  FOREIGN KEY(Funcionario_idFuncionario)
    REFERENCES Funcionarios(idFuncionario),
  FOREIGN KEY(CatalogoServico_idCatalogoServicos)
    REFERENCES CatalogoServicos(idCatalogoServicos),
  FOREIGN KEY(FormaSolicitacao_idFormaSolicitacao)
    REFERENCES FormaSolicitacao(idFormaSolicitacao));

-- Cria a tabela Ações. Uma ação trata-se de um dos apontamentos de um chamado. Uma ação pode ou não ter um agendamento.
CREATE TABLE Acoes (
  idAcoes SERIAL NOT NULL UNIQUE,
  Chamado_idChamado INTEGER NOT NULL ,
  descricao TEXT,
  horaInicio TIME,
  dataInicio DATE,
  horaFim TIME,
  dataFim DATE,
PRIMARY KEY(idAcoes),
  FOREIGN KEY(Chamado_idChamado)
    REFERENCES Chamados(idChamado));

-- CRIA TABELA ANGENDAMENTO. Nem todA AÇÃO tem agendamento, MAS TODO AGENDAMENTO TEM UMA AÇÃO
CREATE TABLE Agendamentos (
  idAgendamento SERIAL NOT NULL UNIQUE,
  Acoes_idAcoes INTEGER NOT NULL,
  dataFim DATE,
  horaFim TIME,
PRIMARY KEY(idAgendamento),
  FOREIGN KEY(Acoes_idAcoes)
    REFERENCES Acoes(idAcoes));

/* 
Cria Tabela Pesquisa de Satisfacao. 
Toda pesquisa de satisfação está associada a um chamado.
A aplicação só insere a pesquisa de satisfação após o encerramento de um chamado.
Enquanto o chamado estiver aberto, não haverá pesquisa preenchida.
*/

CREATE TABLE Satisfacao (
  idSatisfacao SERIAL NOT NULL UNIQUE,
  Chamado_idChamado INTEGER NOT NULL,
  descricao TEXT,
PRIMARY KEY(idSatisfacao)  ,
  FOREIGN KEY(Chamado_idChamado)
    REFERENCES Chamados(idChamado));

-- **************************************
--  FIM -- Criação das tabelas -- FIM   *
-- **************************************

-- VIEW 01 -- Todos Colaboradores do RH
CREATE VIEW view_funcionarios_RH as 
SELECT * FROM funcionarios f WHERE f.setor='Recursos Humanos';
------------------------------------------------------------
-- VIEW 02 -- Visualizar todos os chamados em aberto
CREATE VIEW view_chamados_abertos as 
SELECT * FROM Chamados c WHERE c.estado='Aberto';
------------------------------------------------------------
-- VIEW 03 -- VISUALIZAR CHAMADOS ENCERRADOS
CREATE VIEW view_chamados_fechados as 
SELECT * FROM Chamados c WHERE c.estado='Fechado';
------------------------------------------------------------
-- VIEW 04 - TABELA DE CHAMADOS ABERTOS FORMATADA
CREATE VIEW view_abertos_formato as
SELECT chamados.idchamado, formasolicitacao.forma, chamados.tipochamado, chamados.descricao, funcionarios.nome 
FROM chamados,funcionarios,formasolicitacao, catalogoservicos
WHERE chamados.estado='Aberto' 
AND chamados.funcionario_idfuncionario=funcionarios.idfuncionario 
AND chamados.formasolicitacao_idformasolicitacao=formasolicitacao.idformasolicitacao
AND catalogoservicos.idcatalogoservicos = chamados.catalogoservico_idcatalogoservicos;
--------------------------------------------------------------
-- VIEW 05 - TABELA DE CHAMADOS ABERTOS FORMATADA (Faz consulta semelhante anterior, mas utilizando INNER JOIN)
CREATE VIEW view_fechados_formato as
SELECT chamados.idchamado, formasolicitacao.forma, chamados.tipochamado, chamados.descricao, funcionarios.nome 
FROM chamados
INNER JOIN funcionarios ON funcionarios.idfuncionario=chamados.funcionario_idfuncionario
INNER JOIN formasolicitacao ON chamados.formasolicitacao_idformasolicitacao=formasolicitacao.idformasolicitacao
INNER JOIN catalogoservicos ON  catalogoservicos.idcatalogoservicos = chamados.catalogoservico_idcatalogoservicos
WHERE chamados.estado='Fechado';
--------------------------------------------------------------
-- VIEW 06 - VISUALIZAR PESQUISAS DE SATISFACAO
-- Exibe Problema do chamado e a pesquisa de satisfacao para chamados encerrados
--------------------------------------------------------------
CREATE VIEW view_satisfacao as
SELECT chamados.idchamado, funcionarios.nome, Chamados.descricao, Satisfacao.descricao
FROM chamados
INNER JOIN funcionarios ON funcionarios.idfuncionario=chamados.funcionario_idfuncionario
INNER JOIN Satisfacao on satisfacao.Chamado_idChamado=chamados.idchamado
WHERE chamados.estado='Fechado';

-------------------------------------------------------------------------------------------
-- FUNÇÃO/TRIGGER VERIFICAR PADRÃO DE EXPRESSAO REGULAR PARA CPF, pattern 123.456.789-10 --
-------------------------------------------------------------------------------------------
CREATE FUNCTION check_CPF_Regex() RETURNS Trigger AS $check_CPF_Regex$
BEGIN
    IF NEW.cpf NOT SIMILAR TO '[0-9]{3}\.[0-9]{3}\.[0-9]{3}\-[0-9]{2}' THEN
    RAISE EXCEPTION 'PADRAO REGEX INCORRETO PARA O CPF';
    END IF; 
RETURN NEW;
END;
$check_CPF_Regex$ LANGUAGE plpgsql;

CREATE Trigger cpf_insert BEFORE INSERT OR UPDATE
ON Funcionarios
FOR EACH ROW EXECUTE
PROCEDURE check_CPF_Regex();
---------------------------------------------------------------------------------------------
-- VERIFICAR PADRÃO DE EXPRESSAO REGULAR PARA EMAIL, pattern nome.sobrenome@empresa.com.br --
---------------------------------------------------------------------------------------------
CREATE FUNCTION check_email_Regex() RETURNS Trigger AS $check_email_Regex$
BEGIN
    IF NEW.email NOT SIMILAR TO '%\.%\@empresa.com.br' THEN
    RAISE EXCEPTION 'PADRAO REGEX INCORRETO PARA O EMAIL';
    END IF; 
RETURN NEW;
END;
$check_email_Regex$ LANGUAGE plpgsql;

CREATE Trigger email_insert BEFORE INSERT OR UPDATE
ON Funcionarios
FOR EACH ROW EXECUTE
PROCEDURE check_email_Regex();
------------------------------------------------------------------------------
-- VERIFICAR PADRAO DE EXPRESSÃo REGULAR PARA LOGIN, pattern nome.sobrenome --
------------------------------------------------------------------------------
CREATE FUNCTION check_login_Regex() RETURNS Trigger AS $check_login_Regex$
BEGIN
    IF NEW.login NOT SIMILAR TO '%\.%' THEN
    RAISE EXCEPTION 'PADRAO REGEX INCORRETO PARA O LOGIN';
    END IF; 
RETURN NEW;
END;
$check_login_Regex$ LANGUAGE plpgsql;

CREATE Trigger login_insert BEFORE INSERT OR UPDATE
ON Funcionarios
FOR EACH ROW EXECUTE
PROCEDURE check_login_Regex();

------------------------------------------------------------------------------
-- FUNÇÃO EM Pl/pgSQL PARA ENCERRAR CHAMADO                                 --
-- Utilizado na aplicação como "SELECT encerrar_chamado();"
------------------------------------------------------------------------------
CREATE FUNCTION encerrar_chamado(chamado INTEGER) RETURNS void AS $$
BEGIN
  UPDATE Chamados
  SET estado = 'Fechado'
  WHERE chamados.idChamado=chamado;
END;
$$ LANGUAGE plpgsql;

/****************************************************************************
FUNÇÃO EM Pl/pgSQL para Cadastrar novo funcionário
*****************************************************************************/
CREATE FUNCTION cadastrar_funcionario_comum(_cpf VARCHAR(14),_nome VARCHAR(50), _login VARCHAR(40), _setor VARCHAR(40), _email VARCHAR(40)) 
RETURNS void AS $$
DECLARE
  grupo INTEGER  := 2;
BEGIN
  INSERT INTO Funcionarios(grupo,cpf,nome, login,setor, email) VALUES (grupo, _cpf, _nome, _login, _setor, _email);
END;
$$ LANGUAGE plpgsql;

/****************************************************************************
  NÃO AUTORIZAR DELETE na tabela AÇÕES
*****************************************************************************/
CREATE FUNCTION undelete_acoes() RETURNS Trigger AS $undelete_acoes$
BEGIN
  RAISE EXCEPTION 'NÃO É PERMITIDO APAGAR ACOES';
END;
$undelete_acoes$ LANGUAGE plpgsql;

CREATE TRIGGER delete_acao BEFORE DELETE
ON Acoes
FOR EACH ROW EXECUTE
PROCEDURE undelete_acoes();

/****************************************************************************
  NÃO AUTORIZAR DELETE na tabela CHAMADOS
*****************************************************************************/
CREATE FUNCTION undelete_chamados() RETURNS Trigger AS $undelete_chamados$
BEGIN
  RAISE EXCEPTION 'NÃO É PERMITIDO APAGAR CHAMADOS.';
END;
$undelete_chamados$ LANGUAGE plpgsql;

CREATE TRIGGER delete_chamado BEFORE DELETE
ON Chamados
FOR EACH ROW EXECUTE
PROCEDURE undelete_chamados();