#noinspection CucumberUndefinedStep
Feature: Cadastro de Estúdio de Tatuagem
  Como um tatuador, dono de estúdio
  Quero poder cadastrar meu estúdio de tatuagem
  Para que eu possa adicionar meus funcionarios

  Scenario: Cadastrar Estúdio com Dados Válidos
    Given que estou logado como um tatuador
    When preencher os campos obrigatórios com dados válidos
    And clicar em "Cadastrar Estúdio"
    Then o sistema deve salvar o estúdio no sistema
    And exibir uma mensagem de sucesso

  Scenario: Cadastrar Estúdio com Dados Inválidos
    Given que estou logado como um tatuador
    When preencher os campos obrigatórios com dados inválidos
    And clicar em "Cadastrar Estúdio"
    Then o sistema deve exibir mensagens de erro nos campos incorretos

