*** Settings ***
Documentation    Essa suite testa o site da Amazon.com.br
Resource         AmazonResources.robot
Test Setup       Abrir o navegador
Test Teardown    Fechar o navegador

*** Test Cases ***
Caso de Teste 01 - Acesso ao meunu "Eletrônicos"
    [Documentation]  Esse teste verifica o menu eletrônicos do site da Amazon.com.br
    ...              e verifica a categoria Computadores e Informática
    [Tags]           menu  categorias
    Acessar o site da Amazon.com.br
    Verificar se o título da página é "Amazon.com.br | Tudo pra você, de A a Z."
    Entrar no menu eletrônicos
    Verificar se aparece a frase "Eletrônicos e TVs"
    Verificar se o título da página é "Black Friday 2024 | Amazon.com.br"
    Verificar se o botão "Informática" aparece na página

Caso de Teste 02 - Pesquisa de um Produto
    [Documentation]  Esse teste verifica a pesquisa de um produto no site da Amazon.com.br
    ...              e verifica se o produto pesquisado é exibido na tela
    [Tags]           pesquisa_produtos  lista_busca
    Acessar o site da Amazon.com.br
    Verificar se o título da página é "Amazon.com.br | Tudo pra você, de A a Z."
    Pesquisar o produto "PlayStation 5" no campo de pesquisa
    Clicar no botão de pesquisa
    Verificar se o resultado da pesquisa está listando o produto "PlayStation®5 Slim Edição Digital com 2 Jogos"
