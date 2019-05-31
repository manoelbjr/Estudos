# Desafio de WebScrapping em Python

Neste repositório estou apresentando minha solução para o desafio de WebScrapping proposto pela RCTech.
O desafio solicitado pede que se desenvolva um algoritmo que busque Títulos de notícia e o link correspondente no site https://tecmundo.com.br.

## Pre-requisitos

É necessário que o utilizador tenha instalado o Python em sua máquina. Além disso, esse projeto utiliza o framework de densenvolvimento para web Django.

> Instalador e procedimentos para o Python: https://www.python.org/

> Instalador e Procedimentos para o Django: https://www.djangoproject.com/

## Lista de Tarefas

Segue detalhamento do que foi solicitado. Abaixo, estão marcados apenas os itens que consegui chegar a um resultado.

- [x] <strike>Precisa ser implementado em Django usando Python 2 ou 3;</strike>
- [x] <strike>Precisa ter um arquivo requirements.txt com as dependências do projeto;</strike>
- [x] <strike>Deve ser criado um django command chamado "capturar_noticias", de tal forma que para alimentar o banco de dados com as notícias dos portais basta rodar o comando "./manage.py capturar_noticias";</strike>
- [ ] O banco de dados pode ser qualquer um compatível com o Django. (sugestão: sqlite)

**OBS:** O 4º item foi cumprido parcialmente. Consegui implementar o _Model_ da tabela, criei a tabela, ficou faltando o código que realiza os _INSERTS_.

|  **Id**  |  new_title  |  url  |
|----------|-------------|-------|
| Autoincrement| _Titulo1_| _Url1_|
| ""|_Titulo2_|_Url2_|
|...|...|...


### Autor

* Manoel Barros Jr.
