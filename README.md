# Desafio Técnico QA - Accenture

Repositório criado para a entrega do desafio técnico de Qualidade de Software.

## Parte 1 - Testes de API (BookStore / Account)
* **Ferramenta utilizada:** Postman Web
* **Arquivo da Collection:** `Desafio API Accenture - Amanda.postman_collection.json`
* **Cobertura:** Execução do fluxo completo (criação de usuário, geração de token, autorização, listagem de livros, aluguel de 2 livros e consulta do perfil) + mapeamento de cenários alternativos e de exceção em BDD/Gherkin (`cenarios-bdd/desafio-qa.feature`).

### Observação sobre o ambiente (API)
* A página visual do Swagger (`://demoqa.com/swagger/`) apresentou instabilidade e não carregou a tela no navegador durante os testes (apesar do retorno HTTP 200 na rede). Segui com a validação diretamente no Postman utilizando os endpoints do desafio.

---

## Parte 2 - Testes Web Frontend (DemoQA)
* **Documentação BDD:** Mapeamento dos cenários principais (caminho feliz) e cenários alternativos/exceção em Gherkin (`cenarios-bdd/parte2-web.feature`).
* **Automação Web (Base Conceitual):** Estruturação de teste automatizado básico com Cypress (`cypress/e2e/practice-form.cy.js`) cobrindo o preenchimento do formulário `Practice Form`, anexo de arquivo de texto (`cypress/fixtures/arquivo-teste.txt`) e validação do pop-up de confirmação.
