*Settings*
Documentation       Aqui é onde tudo  começa

Library     RequestsLibrary

*Variables*
${BASE_URI}             http://marvel.qaninja.academy

*Keywords*
Set Client Key
    [Arguments]         ${email}

    &{usuario}          Create Dictionary       email=${email}

    ${response}         POST
    ...                 ${BASE_URI}/accounts      
    ...                 json=${usuario}

    ${client_key}       Set Variable        ${response.json()}[client_key]
    &{HEADERS}          Create Dictionary   client_key=${client_key}

    Set Suite Variable  ${HEADERS}

    