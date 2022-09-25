*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${rise_button}  //div[@class='btn-purchase__text_wrapper' and contains(.,'Rise')]
${email}    //input[@type='email']


*** Keywords ***
Open page 
    Open Browser    https://app.deriv.com/    chrome
    Maximize Browser Window
    Wait Until Page Contains Element    ${rise_button}    30
    Click Element    dt_login_button
    Wait Until Page Contains Element    ${email}    10

Login
    Input Text    ${email}    email
    Input Text    //input[@type='password']    password 
    Click Element    //button[@type='submit']

Virtual 
    Wait Until Page Contains Element    ${rise_button}    30
    Click Element    dt_core_account-info_acc-info 
    Click Element    dt_core_account-switcher_demo-tab
    Click Element    dt_VRTC6202252

Validation
    Wait Until Page Contains Element    //div[@class='acc-switcher__list' and contains(.,'Demo')]   30

*** Test Cases ***
Task1
Open Deriv page 
    Open page

Login To Deriv
    Login

Change to Demo account
    Virtual

Validate Demo account
    Validation