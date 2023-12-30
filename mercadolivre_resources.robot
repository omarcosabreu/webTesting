*** Settings ***
Library    SeleniumLibrary
*** Variables ***
${URL}                  https://www.mercadolivre.com.br/
${ofertas}              //a[contains(.,'Ofertas do dia')]
${todasOfertas}         //p[@class='title'][contains(.,'Todas as ofertas')]

*** Keywords ***
Abrir o navegador
    Open Browser        browser=chrome
    Maximize Browser Window

Fechar o navegador
    Capture Page Screenshot
    Close Browser    
Acessar a home page do site mercadolivre.com.br
    Go To                            url=${URL} 
    Wait Until Element Is Visible    locator=${ofertas} 

Entrar no menu "Ofertas do dia"
    Click Element    locator=${ofertas} 

Verificar se aparece a frase "${frase}"         
    Wait Until Page Contains         text=${frase}
    Wait Until Element Is Visible    locator=${todasOfertas}

Verificar se o título da página fica "${title}"   
    Title Should Be    title=${title}   

Verificar se aparece a categoria "${nomeCategoria}"
    Element Should Be Visible         //img[contains(@alt,'${nomeCategoria}')]

# Test Case 2
Digitar o nome de produto "${produto}" no campo de pesquisa  
    Input Text    locator=cb1-edit    text=${produto} 

Clicar no botão de Pesquisa
    Click Element    locator=//div[contains(@role,'img')] 

Verificar o resultado da pesquisa se está listando o produto "${PRODUTO}"
    Wait Until Element Is Visible    locator=//a[contains(@title,'${PRODUTO}')]        

# Test Case 3
Adicionar o produto "Microsoft Xbox Series S 512gb Standard Cor Branco" no carrinho
    Click Element    locator=//section[contains(@id,':R1agl9b9:')]

# Verificar se o produto "Microsoft Xbox Series S 512gb Standard Cor Branco" foi adicionado com sucesso
    





    #Gherkin Steps

Dado que estou na home page do mercadolivre.com.br
    Acessar a home page do site mercadolivre.com.br

Quando acessar o menu "Ofertas do dia"
    Entrar no menu "Ofertas do dia"

Então o título da página deve ficar "Ofertas do dia | Mercadolivre Brasil"
    Verificar se o título da página fica "Ofertas do dia | Mercadolivre Brasil"

E o texto "Todas as ofertas" deve ser exibido na página
    Verificar se aparece a frase "Todas as ofertas"
E a categoria "Smartphones" deve ser exibida na página
    Verificar se aparece a categoria "Smartphones"

Quando pesquisar pelo produto "Xbox Series S"
    Digitar o nome de produto "Xbox Series S" no campo de pesquisa
    Clicar no botão de Pesquisa

Então o título da página deve ficar "Xbox series s | Mercado Livre 📦"
    Verificar se o título da página fica "Xbox series s | Mercado Livre 📦" 

E um produto da linha "Xbox Series S" deve ser mostrado na página
    Verificar o resultado da pesquisa se está listando o produto "Xbox Series S"                           