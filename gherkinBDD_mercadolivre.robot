*** Settings ***
Documentation    Essa suíte testa o site do mercadolivre.com.br
Resource         mercadolivre_resources.robot
Test Setup       Abrir o navegador
Test Teardown    Fechar o navegador

*** Test Cases ***
Test Case 1 - Acesso ao menu Eletrônicos
    [Documentation]    Esse teste verifica o menu Ofertas do dia do site Mercado Livre
    [Tags]             menus_gherkin    
    Dado que estou na home page do mercadolivre.com.br
    Quando acessar o menu "Ofertas do dia"
    Então o título da página deve ficar "Ofertas do dia | Mercadolivre Brasil"
    E o texto "Todas as ofertas" deve ser exibido na página
    E a categoria "Smartphones" deve ser exibida na página

Test Case 2 - Pesquisa de um Produto   
    [Documentation]    Esse teste verifica a busca de um produto
    [Tags]             busca_produtos_gherkin
    Dado que estou na home page do mercadolivre.com.br
    Quando pesquisar pelo produto "Xbox Series S"
    Então o título da página deve ficar "Xbox series s | Mercado Livre 📦"
    E um produto da linha "Xbox Series S" deve ser mostrado na página