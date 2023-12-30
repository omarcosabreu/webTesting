*** Setting ***
Library  SeleniumLibrary

*** Variables ***
${URL}                   https://www.amazon.com.br/
${LOGO}                  //a[contains(@class,'nav-logo-link nav-progressive-attribute')]
${MENU_ELETRONICOS}
${HEADER_ELETRONICOS}    //h1[contains(.,'Eletrônicos e Tecnologia')]
*** Keywords ***
Abrir o navegador 
    Open Browser  browser=chrome
    # Maximize Browser Window

Fechar o navegador
    Capture Page Screenshot
    Close Browser

Acessar a home page do site Amazon.com.br
    Go to    url=${URL}
    Wait Until Element Is Visible    locator=${LOGO} 
Entrar no menu "Eletrônicos"
    Click Element    locator=${MENU_ELETRONICOS}
    Wait Until Element Is Visible    locator=${MENU_ELETRONICOS} 

Verificar se aparece a frase "${FRASE}"
    Wait Until Page Contains    text=${FRASE} 
    Wait Until Element Is Enabled   locator=${MENU_ELETRONICOS}

Verificar se o título da página fica "${TITULO}"
    Title Should Be    title=${TITULO}

Verificar se aparece a categoria "${NOME_CATEGORIA}" 
    Element Should Be Visible  locator=//a[@aria-label='${NOME_CATEGORIA}']
                            

Digitar o nome de produto "${PRODUTO}" no campo de pesquisa
    Input Text    locator=twotabsearchtextbox    text=${PRODUTO}

Clicar no botão de pesquisa
    Click Element    locator=nav-search-submit-button

Verificar o resultado da pesquisa se está listando o produto "${PRODUTO}"
    Wait Until Element Is Visible   locator=//span[@class='a-size-base-plus a-color-base a-text-normal'][contains(.,'${PRODUTO}')]

# Test Case 3 e 4

Adicionar o produto "${PRODUTO}" no carrinho
    Click Element    locator=//img[@alt="${PRODUTO}"]
    Wait Until Element Is Visible    locator=//input[@name='submit.add-to-cart']
    Click Element    locator=//input[@name='submit.add-to-cart']

Verificar se o produto "${PRODUTO}" foi adicionado com sucesso  
    Click Element    locator=//span[@aria-hidden='true'][contains(.,'Carrinho')]
    Wait Until Element Is Visible    locator=//h1[contains(.,'Carrinho de compras')]
    Element Should Be Visible    locator=//span[@class='a-truncate-cut'][contains(.,'${PRODUTO}')]


Remover o produto "Console Xbox Series S" do carrinho
    Click Element   locator=//input[contains(@name,'submit.delete.2f9cef66-9508-4e91-9dba-d92db30a81f6')]
    
Verificar se o carrinho fica vazio
    Element Should Be Visible    locator=//div[@class='a-padding-medium'][contains(.,'foi removido de Carrinho de compras.')]


    #Gherkin Steps


Dado que estou na home page do amazon.com.br
    Acessar a home page do site Amazon.com.br
E pesquise o nome de produto "Xbox Series S"
    Digitar o nome de produto "Xbox Series S" no campo de pesquisa
    Clicar no botão de pesquisa
    Verificar o resultado da pesquisa se está listando o produto "Console Xbox Series S"
Quando clicar para adicionar o produto ao carrinho 
    Adicionar o produto "Console Xbox Series S" no carrinho
Então o produto deve ser adicionado ao carrinho
    Verificar se o produto "Console Xbox Series S" foi adicionado com sucesso


E existe o produto "Console Xbox Series S" no carrinho
    Verificar se o produto "Console Xbox Series S" foi adicionado com sucesso
Quando remover o produto "Console Xbox Series S" do carrinho
    Remover o produto "Console Xbox Series S" do carrinho
Então o carrinho deve ficar vazio   
    Verificar se o carrinho fica vazio 
