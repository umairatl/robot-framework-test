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
    Wait Until Page Contains Element    ${rise_button}   30
    Click Element    dt_core_account-info_acc-info 
    Click Element    dt_core_account-switcher_demo-tab
    Click Element    dt_VRTC6202252
    Wait Until Page Contains Element    ${rise_button}   30

Synthetic Market
    Wait Until Page Contains Element    //div[@class='cq-symbol-select-btn']    30
    Click Element    //div[@class='cq-symbol-select-btn']
    Wait Until Page Contains Element    //div[@class='sc-mcd__filter__item sc-mcd__filter__item--selected']    50
    Click Element    //div[@class='sc-mcd__item sc-mcd__item--1HZ10V ']
    Wait Until Page Contains Element    ${rise_button}   30

Set Stake
    Press Keys    //input[@type='tel']    BACKSPACE    BACKSPACE
    Input Text    //input[@type='tel']    10

Set Duration
    Click Element    //span[@data-testid='tick_step_1']
    Click Element    //span[@data-testid='tick_step_5']

Trade Rise
    Wait Until Page Contains Element    dt_purchase_call_button    30
    Click Element    dt_purchase_call_button

*** Test Cases ***
Task2
Open Deriv page 
    Open page

Login To Deriv
    Login

Change to Demo account
    Virtual

Validate Synthetic Indices
    Synthetic Market

Set Duration 
    Set Stake

Validate to 5 Ticks
    Set Duration

Trade on Rise
    Trade Rise