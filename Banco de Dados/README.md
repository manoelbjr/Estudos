# Projeto da Disciplina Banco de Dados

## Introdução:

Este Projeto foi elaborado como trabalho de conclusão da disciplina Banco de Dados do Instituto Metrópole Digital. Trata-se de uma aplicação destinado a um sistema de gestão de chamados e incidentes de Ti para uma empresa.

O Projeto é baseado nas melhores práticas do framework de gestão de serviços de TI ITIL V3. Para tanto implementa a gestão de nível de serviço (SLA - Service Level Agreement), Catálogo de Serviços, Inserção de ações nos chamados que permitem agendamento, Formas de solicitação de um chamado e pesquisa de satisfação com o usuário que registrou o chamado.

A gestão de chamados e incidentes que utiliza o modelo do ITIL V3 permite uma direção estratégica dos serviços de TI, beneficiando a organização através de melhoria continuada, acompanhando os incidentes por todo o seu ciclo de vida.

## Objetivos do Sistema: 

Nesse sistema, usuários e analistas de TI podem abrir chamados, mas apenas os analistas possuem acesso à interface para encerra-los. Os chamados possuem Descrição, Tipo [Incidente, Problema, Solicitação, Erro Conhecido], Forma de Solicitação [Telefone, Email, Frontend, Pessoalmente], estado (se está aberto ou fechado). Os chamados estão associados a um catálogo de serviços que definem supergrupos genéricos de incidentes onde cada tupla tem um tempo de SLA associado. 

Cada chamado possui uma ou mais ações, que indicam o que foi executado pela(s) equipe(s). Se um chamado não possui ação, ele ainda não está em atendimento. Cada tupla das ações possui agendamento ou não, quando o analista informa qual o horário poderá executar o atendimento. Além disso as ações possuem descrição (onde o analista detalha o que foi executado nessa ação), hora/data de inicio e hora/data de fim, que é apontará o tempo despendido para executar determinada ação.

Ao encerrar o chamado, o usuário receberá uma pesquisa de satisfação. Todos os chamados encerrados têm uma pesquisa de satisfação associada.
As regras de negócio da aplicação foram todas implementadas no código SQL. Essas regras estão detalhadas através de comentários dos códigos, verificar a seção Script de Criação dos Elementos do BD.

## Detalhes da Tecnologia e Conceitos aplicados

Utilizado o SGBD PostgreSQL

-[x] Regra de negócio implementada no BD atraves de Triggers e Procedures;
-[x] Normalização de Banco;
-[x] Chaves compostas;
-[x] Função com expressão regular para checagem do CPF;
-[x] Função com expressão regular para checagem de padrão de email;
-[x] RegEx para checagem de formato de usuário
-[x] Funções em PlpgSQL atendendo conceitos de *ACID*
