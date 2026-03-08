*** Settings ***
Library            SeleniumLibrary
Library            DateTime
Library            String
Variables          ../../Config/default_config.yaml

*** Keywords ***
Open Herokuapp Web
    [Documentation]    Open Herokuapp Website
    [Arguments]    ${browser}=${browser} 
    SeleniumLibrary.Open Browser    url=${url_herokuapp}     browser=${browser}
    SeleniumLibrary.Maximize Browser Window

Close All Web Browser
    [Documentation]    Close all opened browsers
    Run Keyword If Test Failed    Capture Screenshot    status=Failed
    Run Keyword If Test Passed    Capture Screenshot
    SeleniumLibrary.Close All Browsers

Capture Screenshot
    [Documentation]    Capture screenshot and save to the specified path
    [Arguments]    ${status}=Passed
    ${current_date_time}    DateTime.Get Current Date    result_format=%d-%m-%Y_%H-%M-%S
    @{split_suite_name}     String.Split String    ${SUITE_NAME}    .
    ${suite_image_name}     Set Variable           ${split_suite_name}[0]
    @{split_test_name}      String.Split String    ${TEST_NAME}    ${SPACE}
    ${testcase_id}          Set Variable           ${split_test_name}[0]
    SeleniumLibrary.Capture Page Screenshot    screenshorts${/}${suite_image_name}/${status}-${testcase_id}-screenshot-${current_date_time}.png

Wait Until Element Is Visible
    [Documentation]    Wait until the specified element is visible on the page
    [Arguments]    ${locator}    ${timeout}=${BrowserTimeout}
    SeleniumLibrary.Wait Until Element Is Visible    ${locator}    timeout=${timeout}
    ...    error=Element with locator '${locator}' is not visible after ${timeout}.

Clear And Input Text
    [Documentation]    Clear the text field and input the specified text
    [Arguments]    ${locator}    ${text}    ${clear}=True    ${timeout}=${BrowserTimeout}
    SeleniumLibrary.Wait Until Element Is Visible    ${locator}    timeout=${timeout}
    ...    error=Element with locator '${locator}' is not visible after ${timeout}.
    SeleniumLibrary.Input Text         ${locator}    ${text}    clear=${clear}

Click Element
    [Documentation]    Click the specified element
    [Arguments]    ${locator}    ${timeout}=${BrowserTimeout}
    SeleniumLibrary.Wait Until Element Is Visible    ${locator}    timeout=${timeout}
    ...    error=Element with locator '${locator}' is not visible after ${timeout}.
    SeleniumLibrary.Click Element      ${locator}

Build Locator
    [Documentation]    Build a locator string based on the provided type and value
    [Arguments]    ${locator}    ${search_for}    ${replace_with}
    ${locator}    String.Replace String    ${locator}    ${search_for}    ${replace_with}
    RETURN    ${locator}
