/*
SCRIPT PARA POPULAR O BANCO CRIADO
*/

INSERT INTO GrupoUsuario(grupo) values('Admin');
INSERT INTO GrupoUsuario(grupo) values('User');

INSERT INTO FormaSolicitacao(forma) values('Telefone');
INSERT INTO FormaSolicitacao(forma) values('Email');
INSERT INTO FormaSolicitacao(forma) values('Frontend');
INSERT INTO FormaSolicitacao(forma) values('Pessoalmente');

INSERT INTO CatalogoServicos(descricao,SLA) values('Assuntos Administrativos',10080);
-- SLA em minutos, 7 dias
INSERT INTO CatalogoServicos(descricao,SLA) values('Automação de TI',240);
-- SLA 4 HORAS
INSERT INTO CatalogoServicos(descricao,SLA) values('Dispositivos Móveis',120);
-- SLA 2 HORAS
INSERT INTO CatalogoServicos(descricao,SLA) values('Gestão de Acesso',1440);
-- SLA 1 DIA
INSERT INTO CatalogoServicos(descricao,SLA) values('Infraestrutura',60);
-- SLA 1 HORA
INSERT INTO CatalogoServicos(descricao,SLA) values('Datacenter',90);
-- SLA 1 HORA E 30 MIN
INSERT INTO CatalogoServicos(descricao,SLA) values('Pacote MS Office',180);
-- SLA 3 HORAS
INSERT INTO CatalogoServicos(descricao,SLA) values('Rede-Conectividade',45);
-- SLA 45 MINUTOS
INSERT INTO CatalogoServicos(descricao,SLA) values('E-MAIL',150);
-- SLA 2 HORAS E 30 MIN
INSERT INTO CatalogoServicos(descricao,SLA) values('Segurança da Informação',80);
-- SLA 1 HORA E 20 MIN
INSERT INTO CatalogoServicos(descricao,SLA) values('Dúvida-Consultoria',300);
-- SLA 5 horas
INSERT INTO CatalogoServicos(descricao,SLA) values('Softwares',330);
-- SLA 5 HORAS E 30 MIN
INSERT INTO CatalogoServicos(descricao,SLA) values('Sistemas',210);
-- SLA 3 HORAS E 30 MIN
INSERT INTO CatalogoServicos(descricao,SLA) values('Telefonia',2880);
-- SLA 2 DIAS

Begin Transaction;
    INSERT INTO Funcionarios(GrupoUsuario_idGrupo,cpf,nome, login,setor, email) VALUES (1,'074.320.414-07','Manoel Barros','Manoel.Barros','Tecnologia da Informação','manoel.barros@empresa.com.br');
    INSERT INTO Funcionarios(GrupoUsuario_idGrupo,cpf,nome, login,setor, email) VALUES (1,'690.586.070-03','Joao Silva','Joao.Silva','Tecnologia da Informação','joao.silva@empresa.com.br');
    INSERT INTO Funcionarios(GrupoUsuario_idGrupo,cpf,nome, login,setor, email) VALUES (1,'661.002.164-34','Alex Andrade','Alex.Andrade','Tecnologia da Informação','Alex.Andrade@empresa.com.br');
    INSERT INTO Funcionarios (GrupoUsuario_idGrupo,cpf,nome, login,setor, email) VALUES (2,'901.314.110-20','Maria Siqueira','maria.siqueira','Controladoria','maria.siqueira@empresa.com.br');
    INSERT INTO Funcionarios (GrupoUsuario_idGrupo,cpf,nome, login,setor, email) VALUES (2,'725.633.070-74','Antonio Andrade','antonio.andrade','Controladoria','antonio.andrade@empresa.com.br');
    INSERT INTO Funcionarios (GrupoUsuario_idGrupo,cpf,nome, login,setor, email) VALUES (2,'428.525.960-59','Jaqueline Santos','jaqueline.santos','Controladoria','jaqueline.santos@empresa.com.br');
    INSERT INTO Funcionarios (GrupoUsuario_idGrupo,cpf,nome, login,setor, email) VALUES (2,'823.137.610-02','Alberto Batista','alberto.batista','Almoxarifado','alberto.batista@empresa.com.br');
    INSERT INTO Funcionarios (GrupoUsuario_idGrupo,cpf,nome, login,setor, email) VALUES (2,'469.388.360-35','Maria Roberta Junqueira','maria.junqueira','Almoxarifado','maria.junqueira@empresa.com.br');
    INSERT INTO Funcionarios (GrupoUsuario_idGrupo,cpf,nome, login,setor, email) VALUES (2,'566.683.220-42','Hudson Macedo','hudson.macedo','Recursos Humanos','hudson.macedo@empresa.com.br');
    INSERT INTO Funcionarios (GrupoUsuario_idGrupo,cpf,nome, login,setor, email) VALUES (2,'892.659.380-05','Erick Bento Campos','erick.campos','Recursos Humanos','erick.campos@empresa.com.br');
    INSERT INTO Funcionarios (GrupoUsuario_idGrupo,cpf,nome, login,setor, email) VALUES (2,'020.735.350-62','Thales Raul Manoel Caldeira','tales.caldeira','Recursos Humanos','tales.caldeira@empresa.com.br');
    INSERT INTO Funcionarios (GrupoUsuario_idGrupo,cpf,nome, login,setor, email) VALUES (2,'645.895.790-49','Eduarda Bianca Stefany Galvão','eduarda.galvao','Financeiro','eduarda.galvao@empresa.com.br');
    INSERT INTO Funcionarios (GrupoUsuario_idGrupo,cpf,nome, login,setor, email) VALUES (2,'384.780.150-35','Milena Tereza Fátima Aragão','milena.aragao','Comercial','milena.aragao@empresa.com.br');
    INSERT INTO Funcionarios (GrupoUsuario_idGrupo,cpf,nome, login,setor, email) VALUES (2,'060.599.740-31','Clarice Sara Luiza Brito','clarice.brito','Financeiro','clarice.brito@empresa.com.br');
    INSERT INTO Funcionarios (GrupoUsuario_idGrupo,cpf,nome, login,setor, email) VALUES (2,'912.029.130-24','Pietro Tiago Diogo Fernandes','pietro.fernandes','Almoxarifado','pietro.fernandes@empresa.com.br');
    INSERT INTO Funcionarios (GrupoUsuario_idGrupo,cpf,nome, login,setor, email) VALUES (2,'686.439.190-63','Tiago César Fogaça','tiago.fogaca','Estoque','tiago.fogaca@empresa.com.br');
    INSERT INTO Funcionarios (GrupoUsuario_idGrupo,cpf,nome, login,setor, email) VALUES (2,'568.805.520-05','Jéssica Luiza Viana','jessica.viana','Manutenção','jessica.viana@empresa.com.br');
    INSERT INTO Funcionarios (GrupoUsuario_idGrupo,cpf,nome, login,setor, email) VALUES (2,'388.628.550-28','Levi Bernardo Vicente Rezende','levi.rezende','Manutenção','levi.rezende@empresa.com.br');
    INSERT INTO Funcionarios (GrupoUsuario_idGrupo,cpf,nome, login,setor, email) VALUES (2,'234.844.930-70','Juliana Betina Cavalcanti','juliana.cavalcanti','Comercial','juliana.cavalcanti@empresa.com.br');
    INSERT INTO Funcionarios (GrupoUsuario_idGrupo,cpf,nome, login,setor, email) VALUES (2,'752.017.800-59','Nicole Manuela Camila Araújo','nicole.araujo','Recepção','nicole.araujo@empresa.com.br');
    INSERT INTO Funcionarios (GrupoUsuario_idGrupo,cpf,nome, login,setor, email) VALUES (2,'446.027.590-25','Luiza Daiane','luiza.daiane','Recepção','luiza.daiane@empresa.com.br');
    INSERT INTO Funcionarios (GrupoUsuario_idGrupo,cpf,nome, login,setor, email) VALUES (2,'914.218.260-38','Daniel Benedito dos Santos','daniel.santos','Segurança do Trabalho','daniel.santos@empresa.com.br');
    INSERT INTO Funcionarios (GrupoUsuario_idGrupo,cpf,nome, login,setor, email) VALUES (2,'297.240.740-72','Renata Stefany Analu Freitas','renata.freitas','Ambulatório','renata.freitas@empresa.com.br');
    INSERT INTO Funcionarios (GrupoUsuario_idGrupo,cpf,nome, login,setor, email) VALUES (2,'955.118.430-08','Brenda Luciana Daniela da Paz','brenda.paz','Segurança do Trabalho','brenda.paz@empresa.com.br');
    INSERT INTO Funcionarios (GrupoUsuario_idGrupo,cpf,nome, login,setor, email) VALUES (2,'151.618.940-08','Iago Renan Nelson Sales','iago.sales','Ambulatório','iago.sales@empresa.com.br');
    INSERT INTO Funcionarios (GrupoUsuario_idGrupo,cpf,nome, login,setor, email) VALUES (2,'442.027.520-07','Rafael Lorenzo Dias','rafael.dias','Ambulatório','rafael.dias@empresa.com.br');
    INSERT INTO Funcionarios (GrupoUsuario_idGrupo,cpf,nome, login,setor, email) VALUES (2,'705.055.590-80','Bruno Sebastião Cardoso','bruno.cardoso','Segurança do Trabalho','bruno.cardoso@empresa.com.br');
    INSERT INTO Funcionarios (GrupoUsuario_idGrupo,cpf,nome, login,setor, email) VALUES (2,'022.942.990-43','Patrícia Rosa Batista','patricia.batista','Compras','patricia.batista@empresa.com.br');
    INSERT INTO Funcionarios (GrupoUsuario_idGrupo,cpf,nome, login,setor, email) VALUES (2,'741.099.160-70','Leonardo Isaac Gustavo da Rocha','leandro.rocha','Comercial','leandro.rocha@empresa.com.br');
Commit Transaction;

-- TIPOChamados: INCIDENTE, PROBLEMA, SOLICITAÇÃO
INSERT INTO Chamados (FormaSolicitacao_idFormaSolicitacao,CatalogoServico_idCatalogoServicos,Funcionario_idFuncionario,tipoChamado,descricao,estado)
VALUES (1,5,12,'Incidente','Por gentileza, substituir meu mouse que está dando clique duplo','Aberto');

INSERT INTO Chamados (FormaSolicitacao_idFormaSolicitacao,CatalogoServico_idCatalogoServicos,Funcionario_idFuncionario,tipoChamado,descricao,estado)
VALUES (2,4,20,'Incidente','Não consigo logar na máquina','Aberto');

INSERT INTO Chamados (FormaSolicitacao_idFormaSolicitacao,CatalogoServico_idCatalogoServicos,Funcionario_idFuncionario,tipoChamado,descricao,estado)
VALUES (2,14,19,'Problema','Não consigo acessar o facebook','Aberto');

INSERT INTO Chamados (FormaSolicitacao_idFormaSolicitacao,CatalogoServico_idCatalogoServicos,Funcionario_idFuncionario,tipoChamado,descricao,estado)
VALUES (4,4,11,'Solicitação','Atualizar o Office para versão 365','Aberto');

INSERT INTO Chamados (FormaSolicitacao_idFormaSolicitacao,CatalogoServico_idCatalogoServicos,Funcionario_idFuncionario,tipoChamado,descricao,estado)
VALUES (3,3,7,'Incidente','Celular da empresa não faz lgação','Aberto');

INSERT INTO Chamados (FormaSolicitacao_idFormaSolicitacao,CatalogoServico_idCatalogoServicos,Funcionario_idFuncionario,tipoChamado,descricao,estado)
VALUES (3,13,8,'Problema','ERP não abre no meu perfil','Fechado');

INSERT INTO Chamados (FormaSolicitacao_idFormaSolicitacao,CatalogoServico_idCatalogoServicos,Funcionario_idFuncionario,tipoChamado,descricao,estado)
VALUES (4,10,9,'Solicitação','Verificar email recebido - phishing','Fechado');

INSERT INTO Chamados (FormaSolicitacao_idFormaSolicitacao,CatalogoServico_idCatalogoServicos,Funcionario_idFuncionario,tipoChamado,descricao,estado)
VALUES (3,13,15,'Problema','Aparelho Telefonico está mudo.','Fechado');
---------------------------------------------------------------------------------
----- no insert final, corrigir o valor Chamado_idChamado de 12 para 6
INSERT INTO Satisfacao (Chamado_idChamado,descricao) VALUES (6,'Fui muito bem atendido, equipe solucionou rapidamente.');
----- no insert final, corrigir o valor Chamado_idChamado de 13 para 7
INSERT INTO Satisfacao (Chamado_idChamado,descricao) VALUES (7,'Equipe encerrou o chamado sem atender o incidente.');
----- no insert final, corrigir o valor Chamado_idChamado de 14 para 8
INSERT INTO Satisfacao (Chamado_idChamado,descricao) VALUES (8,'Substituíram por um telefone novo, com mais funções que o anterior. Nota 10');
---------------------------------------------------------------------------------

/*
idAcoes SERIAL NOT NULL UNIQUE,
  Chamado_idChamado INTEGER NOT NULL ,
  descricao TEXT,
  horaInicio TIME,
  dataInicio DATE,
  horaFim TIME,
  dataFim DATE,
*/
INSERT INTO acoes (Chamado_idChamado,descricao,horaInicio,dataInicio,horaFim,dataFim) VALUES (1,'Usuário estava ausente','15:30','05-11-2018','15:50','05-11-2018');
INSERT INTO acoes (Chamado_idChamado,descricao,horaInicio,dataInicio,horaFim,dataFim) VALUES (1,'Efetuada substituição do mouse','07:30','06-11-2018','07:50','06-11-2018');
INSERT INTO acoes (Chamado_idChamado,descricao,horaInicio,dataInicio,horaFim,dataFim) VALUES (2,'Verificado ponto de rede, falha não identificada','09:00','04-11-2018','09:15','04-11-2018');
INSERT INTO acoes (Chamado_idChamado,descricao,horaInicio,dataInicio,horaFim,dataFim) VALUES (2,'Identificado cabo rompido, será substituido','12:20','04-11-2018','12:30','04-11-2018');
INSERT INTO acoes (Chamado_idChamado,descricao,horaInicio,dataInicio,horaFim,dataFim) VALUES (3,'Usuário foi orientado sobre o bloqueio de Redes sociais ','09:34','05-11-2018','09:39','05-11-2018');
INSERT INTO acoes (Chamado_idChamado,descricao,horaInicio,dataInicio,horaFim,dataFim) VALUES (4,'Realizada tentativa de atualização sem sucesso','10:23','05-11-2018','11:07','05-11-2018');
INSERT INTO acoes (Chamado_idChamado,descricao,horaInicio,dataInicio,horaFim,dataFim) VALUES (5,'Indentificamos que colaborador danificou o equipamento','09:00','06-11-2018','09:15','06-11-2018');
INSERT INTO acoes (Chamado_idChamado,descricao,horaInicio,dataInicio,horaFim,dataFim) VALUES (5,'Realizada substituição do aparelho','10:15','06-11-2018','10:45','06-11-2018');
INSERT INTO acoes (Chamado_idChamado,descricao,horaInicio,dataInicio,horaFim,dataFim) VALUES (6,'Reinstalada aplicação, funcionou corretamente','09:25','06-11-2018','09:45','06-11-2018');
INSERT INTO acoes (Chamado_idChamado,descricao,horaInicio,dataInicio,horaFim,dataFim) VALUES (7,'Identificado que colaborador usa o email da empresa para se cadastrar em promoções','13:28','06-11-2018','13:32','06-11-2018');
INSERT INTO acoes (Chamado_idChamado,descricao,horaInicio,dataInicio,horaFim,dataFim) VALUES (7,'Orientamos o colaborador sobre a boa postura de utilizacao dos recursos da empresa','16:16','06-11-2018','16:42','06-11-2018');
INSERT INTO acoes (Chamado_idChamado,descricao,horaInicio,dataInicio,horaFim,dataFim) VALUES (7,'Colaborador Insistiu em descumprir as boas práticas dos recursos de informatica, chamado encerrado','07:21','07-11-2018','07:25','06-11-2018');
INSERT INTO acoes (Chamado_idChamado,descricao,horaInicio,dataInicio,horaFim,dataFim) VALUES (8,'Identificado defeito no aparelho de ramal, será substituido','14:28','06-11-2018','15:13','06-11-2018');
INSERT INTO acoes (Chamado_idChamado,descricao,horaInicio,dataInicio,horaFim,dataFim) VALUES (8,'Aparelho foi substituido','08:56','07-11-2018','09:23','07-11-2018');

/*
CREATE TABLE Agendamentos (
  idAgendamento SERIAL NOT NULL UNIQUE,
  Acoes_idAcoes INTEGER NOT NULL,
  dataFim DATE,
  horaFim TIME,
PRIMARY KEY(idAgendamento),
  FOREIGN KEY(Acoes_idAcoes)
    REFERENCES Acoes(idAcoes));
*/
-- no insert definitivo, alterar Acoes_idAcoes de 2 pra 1
INSERT INTO Agendamentos (Acoes_idAcoes,dataFim,horaFim) values (1,'05-11-2018','09:00');
-- no insert definitivo, alterar Acoes_idAcoes de 4 pra 3
INSERT INTO Agendamentos (Acoes_idAcoes,dataFim,horaFim) values (3,'04-11-2018','12:00');
-- no insert definitivo, alterar Acoes_idAcoes de 12 pra 11
INSERT INTO Agendamentos (Acoes_idAcoes,dataFim,horaFim) values (11,'05-11-2018','07:00');