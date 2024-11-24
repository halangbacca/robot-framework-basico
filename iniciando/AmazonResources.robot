*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${BROWSER}                Chrome
${URL}                    https://www.amazon.com.br/
${LOGO_AMAZON}            //a[contains(@class,'nav-logo-link nav-progressive-attribute')]
${BOTAO_ELETRONICOS}      //img[@alt='Eletrônicos']
${BOTAO_ELETRONICOS_TVS}  (//span[contains(.,'Eletrônicos e TVs')])[2]

*** Keywords ***
Abrir o navegador
    Open Browser    browser=${BROWSER}
    Maximize Browser Window

Fechar o navegador
    Capture Page Screenshot
    Close Browser

Acessar o site da Amazon.com.br
    Go To    ${URL}
    Wait Until Element Is Visible    locator=${LOGO_AMAZON}    

Entrar no menu eletrônicos
    Click Element    locator=${BOTAO_ELETRONICOS}

Verificar se aparece a frase "${TEXTO_ELETRONICOS}"
    Wait Until Page Contains        text=${TEXTO_ELETRONICOS}
    Wait Until Element Is Visible   ${BOTAO_ELETRONICOS_TVS}

Verificar se o título da página é "${TITULO_PAGINA}"
    Title Should Be    title=${TITULO_PAGINA}

Verificar se o botão "${BOTAO_INFORMATICA}" aparece na página
    Element Should Be Visible    locator=//button[contains(.,'${BOTAO_INFORMATICA}')]

Pesquisar o produto "${NOME_PRODUTO}" no campo de pesquisa
    Input Text    id=twotabsearchtextbox    ${NOME_PRODUTO}

Clicar no botão de pesquisa
    Click Element    xpath=//input[contains(@type,'submit')]

Verificar se o resultado da pesquisa está listando o produto "${NOME_PRODUTO}"
    Wait Until Element Is Visible    locator=(//span[contains(.,'${NOME_PRODUTO}')])[3]