# language: pt

Funcionalidade: Testes de API - BookStore e Account
  Como Analista de Qualidade (QA)
  Quero validar as chamadas de criação de usuário, autenticação e aluguel de livros
  Para garantir o funcionamento correto da API e os retornos de status code esperados

  Cenário: Fluxo completo de criação de usuário, token e aluguel de livros
    Dado que crio um novo usuário válido no endpoint "/Account/v1/User"
    Quando gero o token de acesso e confirmo a autorização da conta
    E consulto a lista de livros disponíveis na BookStore
    E realizo o aluguel de dois livros para o usuário criado
    Então a consulta do perfil deve retornar status 200 com os dois livros vinculados

  # Obs. de levantamento de cenários: Além do fluxo principal solicitado, mapeei abaixo
  # alguns cenários alternativos, de exceção e validações de status code de erro 
  # essenciais para garantir a cobertura de testes da API.

  Cenário: Cadastro de usuário com senha inválida (Cenário de Exceção)
    Dado que envio uma requisição POST para "/Account/v1/User" com uma senha fora do padrão
    Quando a API processa a solicitação
    Então deve retornar status 400 (Bad Request) recusando o cadastro

  Cenário: Aluguel de livro sem envio de token (Cenário de Exceção)
    Dado que tento alugar um livro sem enviar o Bearer Token de autenticação
    Quando aciono o endpoint "/BookStore/v1/Books"
    Então a API deve bloquear a requisição retornando status 401 (Unauthorized)

  Cenário: Aluguel de livro com código ISBN inválido (Cenário Alternativo)
    Dado que estou autenticado com um token válido
    Quando envio uma requisição de aluguel informando um código ISBN inexistente
    Então a API deve retornar status 400 (Bad Request) informando que o livro não foi encontrado
