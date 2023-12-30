*** Settings ***
Documentation    Essa suíte testa o site do mercadolivre.com.br
Resource         mercadolivre_resources.robot
Test Setup       Abrir o navegador
# Test Teardown    Fechar o navegador

*** Test Cases ***
Test Case 1 - Acesso ao menu Eletrônicos
    [Documentation]    Esse teste verifica o menu Ofertas do dia do site Mercado Livre
    [Tags]             menus    
    Acessar a home page do site mercadolivre.com.br
    Entrar no menu "Ofertas do dia"
    Verificar se aparece a frase "Todas as ofertas"
    Verificar se o título da página fica "Ofertas do dia | Mercadolivre Brasil"
    Verificar se aparece a categoria "Smartphones"
    Verificar se aparece a categoria "Bebidas"

Test Case 2 - Pesquisa de um Produto   
    [Documentation]    Esse teste verifica a busca de um produto
    [Tags]             busca_produtos
    Acessar a home page do site mercadolivre.com.br
    Digitar o nome de produto "Xbox Series S" no campo de pesquisa
    Clicar no botão de Pesquisa
    Verificar o resultado da pesquisa se está listando o produto "Xbox Series S"