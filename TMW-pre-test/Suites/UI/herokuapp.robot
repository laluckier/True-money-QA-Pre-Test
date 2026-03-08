*** Settings ***
Resource              ../../Resources/Keywords/common.resource
Resource              ../../Resources/Keywords/login_page.resource
Test Setup            common.Open Herokuapp Web
Test Teardown         common.Close All Web Browser

*** Test Cases ***
TC001 Login success
    [Tags]    TC001
    [Documentation]    To verify that a user can login successfully
    ...    when they put a correct username and password.
    login_page.Verify Elements On Login Page
    login_page.Login With Username And Password    ${users.valid}
    login_page.Verify Login Status    ${messages.successful.login}
    login_page.Logout And Verify That User Is Logged Out

TC002 Login failed - Password incorrect
    [Tags]    TC002
    [Documentation]    To verify that a user can login unsuccessfully
    ...    when they puta correct username but wrong password.
    login_page.Verify Elements On Login Page
    login_page.Login With Username And Password    ${users.incorrect_password}
    login_page.Verify Login Status    ${messages.invalid.password}

TC003 Login failed - Username not found
    [Tags]    TC003
    [Documentation]    To verify that a user can login unsuccessfully
    ...    when they put a username that did not exist.
    login_page.Verify Elements On Login Page
    login_page.Login With Username And Password    ${users.not_registered}
    login_page.Verify Login Status    ${messages.invalid.username}
