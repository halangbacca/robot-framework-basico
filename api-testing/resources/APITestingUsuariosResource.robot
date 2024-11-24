*** Settings ***
Library           RequestsLibrary
Library           String
Library           Collections

*** Keywords ***
Criar um usuário novo
    ${palavraAleatoria}    Generate Random String    length=4    chars=LETTERS
    ${palavraAleatoria}    Convert To Lower Case    string=${palavraAleatoria}
    Set Test Variable    ${EMAIL_TESTE}    ${palavraAleatoria}@teste.com
    Log    ${EMAIL_TESTE}

Cadastrar o usuário criado na ServeRest
    [Arguments]   ${email}    ${status_code_desejado}
    ${body}    Create Dictionary
    ...    nome=Fulano da Silva
    ...    email=${email}
    ...    password=1234
    ...    administrador=true
    Criar sessão na ServeRest
    ${response}   POST On Session
    ...    alias=ServeRest
    ...    url=/usuarios
    ...    json=${body}
    ...    expected_status=${status_code_desejado}
    Log    ${response.json()}

    IF   ${response.status_code} == 201
        Set Test Variable    ${ID_USUARIO}    ${response.json()["_id"]}
    END
    
    Set Test Variable    ${RESPOSTA}    ${response.json()}

Criar sessão na ServeRest
    ${headers}    Create Dictionary
    ...    accept=application/json
    ...    Content-Type=application/json
    Create Session    alias=ServeRest    url=https://serverest.dev    headers=${headers}

Repetir o cadastro com o mesmo e-mail
    Cadastrar o usuário criado na ServeRest    email=${EMAIL_TESTE}    status_code_desejado=400
     
Conferir se o usuário foi cadastrado corretamente
    Dictionary Should Contain Item    ${RESPOSTA}    message    Cadastro realizado com sucesso
    Dictionary Should Contain Key     ${RESPOSTA}    _id
    Should Be Equal As Strings    ${RESPOSTA['message']}    Cadastro realizado com sucesso

Conferir a mensagem de erro de e-mail duplicado
    Dictionary Should Contain Item    ${RESPOSTA}    message    Este email já está sendo usado
    Dictionary Should Contain Key     ${RESPOSTA}    message
    Should Be Equal As Strings    ${RESPOSTA['message']}    Este email já está sendo usado

Consultar os dados do novo usuário
    ${resposta_consulta}  GET On Session    alias=ServeRest    url=/usuarios/${ID_USUARIO}    expected_status=200
    Set Test Variable    ${RESP_CONSULTA}    ${resposta_consulta.json()}

Conferir os dados retornados da API
    LOG    ${RESP_CONSULTA}

    Dictionary Should Contain Item    ${RESP_CONSULTA}    nome             Fulano da Silva
    Dictionary Should Contain Item    ${RESP_CONSULTA}    email            ${EMAIL_TESTE}
    Dictionary Should Contain Item    ${RESP_CONSULTA}    password         1234
    Dictionary Should Contain Item    ${RESP_CONSULTA}    administrador    true
    Dictionary Should Contain Key     ${RESP_CONSULTA}    _id

    Should Be Equal As Strings    ${RESP_CONSULTA['nome']}             Fulano da Silva
    Should Be Equal As Strings    ${RESP_CONSULTA['email']}            ${EMAIL_TESTE}
    Should Be Equal As Strings    ${RESP_CONSULTA['password']}         1234
    Should Be Equal As Strings    ${RESP_CONSULTA['administrador']}    true
