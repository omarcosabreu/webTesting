*** Settings ***
Documentation    Essa suíte testa o site da amazon.com.br
Resource         amazon_resources.robot
Test Setup       Abrir o navegador
Test Teardown    Fechar o navegador

*** Test Cases ***
Test Case 3 - Adicionar Produto no Carrinho
    [Documentation]    Esse teste verifica a adição de um produto no carrinho de compras
    [Tags]             adicionaCarrinho   
    Dado que estou na home page do amazon.com.br
    E pesquise o nome de produto "Xbox Series S"
    Quando clicar para adicionar o produto ao carrinho 
    Então o produto deve ser adicionado ao carrinho

Test Case 4 - Remover Produto do Carrinho
    [Documentation]    Esse teste verifica a remoção de um produto no carrinho de compras
    [Tags]             removeCaarrinho
    Dado que estou na home page do amazon.com.br
    E existe o produto "Console Xbox Series S" no carrinho
    Quando remover o produto "Console Xbox Series S" do carrinho
    Então o carrinho deve ficar vazio
