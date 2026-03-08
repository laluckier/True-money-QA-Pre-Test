*** Variables ***
${lbl_login_title}             xpath=//div[@id="content"]//h2
${lbl_username}                xpath=//label[@for="username"]
${txt_username}                xpath=//input[@id="username"]
${lbl_password}                xpath=//label[@for="password"]
${txt_password}                xpath=//input[@id="password"]
${btn_login}                   xpath=//button[@type="submit"]
${btn_logout}                  xpath=//a[@href="/logout"]
${lbl_warning_message}         xpath=//div[@id="flash" and contains(text(), "{{warning_message}}")]
