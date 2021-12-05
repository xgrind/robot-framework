*Settings*
Documentation    Suite de Teste do cadastro de personagens na API da Marvel

Library     RequestsLibrary
Library     ${EXECDIR}/resources/factories/Thanos.py

*Test Cases*
Deve cadastrar um personagem  

    Set Client Key      xgrind@gmail.com

    &{personagem}       Factory Thanos
   
    POST    
    ...                 http://marvel.qaninja.academy/characters
    ...                 json=${personagem}
    ...                 headers=${headers}

*Keywords*
Set Client Key
    [Arguments]         ${email}

    &{usuario}          Create Dictionary       email=${email}

    ${response}         POST
    ...                 http://marvel.qaninja.academy/accounts      
    ...                 json=${usuario}

    ${client_key}       Set Variable        ${response.json()}[client_key]
    &{HEADERS}          Create Dictionary   client_key=${client_key}

    Set Suite Variable  ${HEADERS}

    