*** Settings ***
Resource           ../../Resources/Keywords/common.resource    
Resource           ../Repositories/herokuapp.resource
Variables          ../../Config/default_config.yaml
Variables          ../Testdata/herokuapp_testdata.yaml

*** Keywords ***
Verify Elements On Login Page
    [Documentation]    Verify that all elements on login page are displayed
    common.Wait Until Element Is Visible    ${lbl_login_title}
    common.Wait Until Element Is Visible    ${lbl_username}
    common.Wait Until Element Is Visible    ${txt_username}
    common.Wait Until Element Is Visible    ${lbl_password}
    common.Wait Until Element Is Visible    ${txt_password}
    common.Wait Until Element Is Visible    ${btn_login}

Login With Username And Password
    [Documentation]    Login to the website using username and password
    [Arguments]    ${users}
    common.Clear And Input Text    ${txt_username}    ${users.username}
    common.Clear And Input Text    ${txt_password}    ${users.password}
    common.Click Element           ${btn_login}

Verify Login Status
    [Documentation]    Verify that the login is successful by checking the success message
    [Arguments]    ${warning_message}
    ${msg_login_status}    common.Build Locator    ${lbl_warning_message}    {{warning_message}}    ${warning_message}
    common.Wait Until Element Is Visible    ${msg_login_status}

Logout And Verify That User Is Logged Out
    [Documentation]    Logout from the website and verify that the logout is successful by checking the success message
    common.Click Element           ${btn_logout}
    ${msg_logout_status}    common.Build Locator    ${lbl_warning_message}    {{warning_message}}    ${messages.successful.logout}
    common.Wait Until Element Is Visible    ${msg_logout_status}
