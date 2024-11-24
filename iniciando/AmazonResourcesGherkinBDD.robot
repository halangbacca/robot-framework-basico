*** Settings ***
Library           SeleniumLibrary
Resource          AmazonResources.robot

*** Keywords ***

Dado que estou na home page da Amazon.com.br
    Acessar o site da Amazon.com.br
    Verificar se o título da página é "Amazon.com.br | Tudo pra você, de A a Z."

Quando acessar o menu "Eletrônicos"
    Entrar no menu eletrônicos

Então o título da página deve ser "Black Friday 2024 | Amazon.com.br"
    Verificar se o título da página é "Black Friday 2024 | Amazon.com.br"

E o texto "Eletrônicos e TVs" deve aparecer na tela
    Verificar se aparece a frase "Eletrônicos e TVs"

E o botão "Informática" deve aparecer na página
    Verificar se o botão "Informática" aparece na página

Quando pesquisar por "PlayStation 5"
    Pesquisar o produto "PlayStation 5" no campo de pesquisa
    Clicar no botão de pesquisa

Então o título da página deve ser "Amazon.com.br : PlayStation 5"
    Verificar se o título da página é "Amazon.com.br : PlayStation 5"

Então o produto "PlayStation 5" deve aparecer na tela
    Verificar se o resultado da pesquisa está listando o produto "PlayStation®5 Slim Edição Digital com 2 Jogos"
