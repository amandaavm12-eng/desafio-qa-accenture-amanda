# language: pt

Funcionalidade: Testes Funcionais Web - Portal DemoQA
  Como Analista de Qualidade (QA)
  Quero validar os fluxos principais das funcionalidades do portal DemoQA
  Para garantir o funcionamento correto das telas, formulários e interações do usuário

  # =====================================================================
  # 1. FORMULÁRIO
  # =====================================================================

  Cenário: Preenchimento e envio do formulário com anexo (Caminho Feliz)
    Dado que acesso o site DemoQA, escolho a opção "Forms" (Formulários) e clico em "Practice Form" (Formulário de Prática)
    Quando preencho todo o formulário com valores aleatórios válidos
    E faço o upload de um arquivo de texto (.txt) válido
    E clico no botão "Submit" (Enviar) para submeter o formulário
    Então deve abrir um pop-up na tela confirmando os dados enviados
    E fecho o pop-up exibido

  # =====================================================================
  # 2. JANELAS DO NAVEGADOR
  # =====================================================================

  Cenário: Abertura e validação de texto em nova janela (Caminho Feliz)
    Dado que acesso o site DemoQA, escolho "Alerts, Frame & Windows" (Alertas, Frames e Janelas) e clico em "Browser Windows" (Janelas do Navegador)
    Quando clico no botão "New Window" (Nova Janela)
    Então uma nova janela deve ser aberta exibindo a mensagem "This is a sample page"
    E fecho a nova janela aberta retornando para a tela anterior

  # =====================================================================
  # 3. TABELA DINÂMICA
  # =====================================================================

  Cenário: Criação, edição e exclusão de registro na tabela (Caminho Feliz)
    Dado que acesso o site DemoQA, escolho "Elements" (Elementos) e clico em "Web Tables" (Tabelas Web)
    Quando crio um novo registro preenchendo os dados solicitados
    E edito esse novo registro criado
    E deleto o registro da tabela
    Então o registro não deve mais aparecer na listagem

  # =====================================================================
  # 4. BARRA DE PROGRESSO
  # =====================================================================

  Cenário: Controle de progresso e reset da barra (Caminho Feliz)
    Dado que acesso o site DemoQA, escolho "Widgets" (Componentes) e clico em "Progress Bar" (Barra de Progresso)
    Quando clico no botão "Start" (Iniciar) e paro o carregamento antes dos 25%
    Então valido que o valor exibido na progress bar é menor ou igual a 25%
    Quando aperto "Start" (Iniciar) novamente até atingir 100%
    Então clico em "Reset" (Reiniciar) para zerar a barra novamente

  # Obs. de levantamento de cenários: Além dos fluxos principais solicitados, mapeei abaixo
  # alguns cenários alternativos e de exceção importantes para validar as regras das telas.

  Cenário: Tentativa de envio do formulário sem preencher campos obrigatórios (Cenário de Exceção)
    Dado que estou na tela "Practice Form" (Formulário de Prática)
    Quando tento submeter o formulário deixando campos obrigatórios em branco
    Então o sistema deve impedir o envio e destacar os campos obrigatórios em vermelho

  Cenário: Tentativa de upload de arquivo com formato não permitido (Cenário Alternativo)
    Dado que estou na tela "Practice Form" (Formulário de Prática)
    Quando tento anexar um arquivo com extensão inválida no campo de upload
    Então o sistema deve bloquear o anexo ou exibir mensagem de erro

  Cenário: Tentativa de salvar registro na tabela com e-mail em formato inválido (Cenário de Exceção)
    Dado que abro o pop-up de cadastro na tela "Web Tables" (Tabelas Web)
    Quando preencho o campo de e-mail sem o formato padrão (ex: sem @) e tento salvar
    Então o formulário deve bloquear o salvamento destacando o campo inválido
