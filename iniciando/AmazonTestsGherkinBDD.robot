*** Settings ***
Documentation    Essa suite testa o site da Amazon.com.br
Resource         AmazonResourcesGherkinBDD.robot
Test Setup       Abrir o navegador
Test Teardown    Fechar o navegador

*** Test Cases ***
Caso de Teste 01 - Acesso ao meunu "Eletrônicos"
    [Documentation]  Esse teste verifica o menu eletrônicos do site da Amazon.com.br
    ...              e verifica a categoria Computadores e Informática
    [Tags]           menu  categorias
    Dado que estou na home page da Amazon.com.br
    Quando acessar o menu "Eletrônicos"
    Então o título da página deve ser "Black Friday 2024 | Amazon.com.br"
    E o texto "Eletrônicos e TVs" deve aparecer na tela
    E o botão "Informática" deve aparecer na página
    
Caso de Teste 02 - Pesquisa de um Produto
    [Documentation]  Esse teste verifica a pesquisa de um produto no site da Amazon.com.br
    ...              e verifica se o produto pesquisado é exibido na tela
    [Tags]           pesquisa_produtos  lista_busca
    Dado que estou na home page da Amazon.com.br
    Quando pesquisar por "PlayStation 5"
    Então o título da página deve ser "Amazon.com.br : PlayStation 5"
    Então o produto "PlayStation 5" deve aparecer na tela
