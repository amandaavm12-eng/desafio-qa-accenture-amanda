# language: pt

Funcionalidade: Testes de API - BookStore e Account
  Como Analista de Qualidade (QA)
  Quero validar as chamadas de criação de usuário, autenticação e aluguel de livros
  Para garantir o funcionamento correto da API e os retornos de status code esperados

  Cenário: Fluxo completo de criação de usuário, token e aluguel de livros (Caminho Feliz)
    Dado que crio um novo usuário válido no endpoint "/Account/v1/User" recebendo status 201 e o userID
    Quando gero o token de acesso e confirmo que o usuário está autorizado
    E consulto a lista de livros disponíveis na BookStore
    E realizo o aluguel de dois livros para o usuário criado recebendo status 201
    Então a consulta do perfil deve retornar status 200 com os dois livros vinculados

  # Obs. de levantamento de cenários: Além do fluxo principal solicitado, mapeei abaixo
  # alguns cenários alternativos, de exceção e validações de status code de erro 
  # essenciais para garantir a cobertura de testes da API.

  Cenário: Cadastro de usuário com campos em branco (Cenário de Exceção)
    Dado que envio uma requisição POST para "/Account/v1/User" sem preencher usuário ou senha
    Quando a API processa a solicitação
    Então deve retornar status 400 (Bad Request) recusando o cadastro

  Cenário: Cadastro de usuário com senha fora do padrão (Cenário de Exceção)
    Dado que envio uma requisição POST para "/Account/v1/User" com uma senha fora do padrão
    Quando a API processa a solicitação
    Então deve retornar status 400 (Bad Request) informando que a senha não atende aos critérios

  Cenário: Aluguel de livro sem envio de token (Cenário de Exceção)
    Dado que tento alugar um livro sem enviar o Bearer Token de autenticação
    Quando aciono o endpoint "/BookStore/v1/Books"
    Então a API deve bloquear a requisição retornando status 401 (Unauthorized)

  Cenário: Aluguel de livro com código ISBN inexistente (Cenário Alternativo)
    Dado que estou autenticado com um token válido
    Quando envio uma requisição de aluguel informando um código ISBN que não existe na lista
    Então a API deve retornar status 400 (Bad Request) informando que o livro não foi encontrado

  Cenário: Tentativa de alugar um livro já vinculado ao usuário (Cenário Alternativo)
    Dado que estou autenticado e já possuo um livro alugado na minha conta
    Quando tento enviar uma nova requisição POST para "/BookStore/v1/Books" com o mesmo ISBN
    Então a API deve impedir a duplicidade retornando status 400 (Bad Request)

  Cenário: Consulta de usuário inexistente (Cenário Alternativo)
    Dado que estou autenticado com um token válido
    Quando consulto o endpoint "/Account/v1/User/{userID}" informando um ID não cadastrado
    Então a API deve retornar status 401 ou 404 indicando que o usuário não foi localizado

  Cenário: Falha de conexão ou indisponibilidade do servidor (Cenário de Exceção)
    Dado que ocorre uma instabilidade ou queda no servidor da API
    Quando envio qualquer requisição para os serviços
    Então o sistema deve retornar erro do grupo 5xx (500 ou 503)
