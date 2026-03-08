*** Settings ***
Library            RequestsLibrary
Library            Collections
Variables          ../../Config/default_config.yaml

*** Keywords ***
Get Hogwarts House Data
    [Documentation]    Get data of Hogwarts house by house id.
    [Arguments]    ${house_id}    ${expected_status}=200
    Create Session    hogwart    ${API.url_potterapi}
    ${url}         Set Variable    ?index=${house_id}
    ${response}    GET On Session    hogwart    ${url}    expected_status=${expected_status}
    ${house_response}        Set Variable    ${response.json()}
    RETURN    ${house_response}

Verify Hogwarts House Data Is Correct
    [Documentation]    Verify the retrieved house data.
    [Arguments]    ${house_response}    ${expected_house_data}
    Should Be Equal As Strings    ${house_response}[house]        ${expected_house_data}[house]
    Should Be Equal As Strings    ${house_response}[emoji]        ${expected_house_data}[emoji]
    Should Be Equal As Strings    ${house_response}[founder]      ${expected_house_data}[founder]
    Should Be Equal As Strings    ${house_response}[colors][0]    ${expected_house_data}[colors][0]
    Should Be Equal As Strings    ${house_response}[colors][1]    ${expected_house_data}[colors][1]
    Should Be Equal As Strings    ${house_response}[animal]       ${expected_house_data}[animal]

Verify Hogwarts House Data Not Found
    [Documentation]    Verify error response when house data not found.
    [Arguments]    ${house_response}    ${expected_error}
    Dictionary Should Contain Key    ${house_response}    error
    Should Be Equal As Strings       ${house_response}[error]    ${expected_error}
