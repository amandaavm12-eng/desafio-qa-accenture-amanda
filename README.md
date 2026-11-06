# Desafio Técnico QA - Accenture

Repositório criado para a entrega do desafio técnico de Qualidade de Software.

## Parte 1 - Testes de API (BookStore / Account)
* **Ferramenta utilizada:** Postman Web
* **Arquivo da Collection:** `Desafio API Accenture - Amanda.postman_collection.json`
* **Cobertura:** Execução do fluxo completo (criação de usuário, geração de token, autorização, listagem de livros, aluguel de 2 livros e consulta do perfil) + mapeamento de cenários alternativos e de exceção em BDD/Gherkin (`cenarios-bdd/desafio-qa.feature`).

### Observação sobre o ambiente (API)
* A página visual do Swagger (`://demoqa.com`) apresentou instabilidade e não carregou a tela no navegador durante os testes (apesar do retorno HTTP 200 na rede). Segui com a validação diretamente no Postman utilizando os endpoints do desafio.
