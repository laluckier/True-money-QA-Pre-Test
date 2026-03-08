*** Settings ***
Variables          ../../Resources/Testdata/hogwarts_testdata.yaml
Resource           ../../Resources/Keywords/hogwarts_api.resource

*** Test Cases ***
TC001 Get house data success
    [Tags]    TC001
    [Documentation]    To verify get house data api will return correct data.
    ${house_response}    Get Hogwarts House Data    3
    Verify Hogwarts House Data Is Correct    ${house_response}    ${Slytherin}

TC002 Get house data but user not found
    [Tags]    TC002
    [Documentation]    To verify get house data api from invalid index.
    ...    The api will return 404 not found.
    ${house_response}    Get Hogwarts House Data    5    expected_status=404
    Verify Hogwarts House Data Not Found    ${house_response}    ${response_404.error}