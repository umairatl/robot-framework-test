*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${rise_button}  //div[@class='btn-purchase__text_wrapper' and contains(.,'Rise')]
${email}    //input[@type='email']
${symbolButton}    //div[@class='cq-symbol-select-btn']

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

Forex Market
    Wait Until Page Contains Element    ${symbolButton}    30
    Click Element    ${symbolButton}
    Wait Until Page Contains Element    //div[@class='sc-mcd__filter__item sc-mcd__filter__item--selected']    30
    Wait Until Page Contains Element    //div[@class='sc-mcd__filter__item ']    30
    Click Element    //div[@class='sc-mcd__filter__item ' and contains(.,'Forex')]
    Click Element    //div[@class='sc-mcd__item sc-mcd__item--frxAUDUSD ']
    Wait Until Page Contains Element    ${rise_button}   30

High/Low Trade
    Click Element    //div[@class='contract-type-widget__display']
    Click Element    dt_contract_high_low_item

Duration
    Press Keys    //input[@name='duration']    BACKSPACE    BACKSPACE
    Input Text    //input[@name='duration']    4
    Click Element    dc_payout_toggle_item
Payout
    Press Keys    //input[@type='tel']    BACKSPACE    BACKSPACE
    Input Text    //input[@type='tel']    15.50

Trade Rise
    Wait Until Page Contains Element    //button[@class='btn-purchase btn-purchase--2' and contains(.,'Lower')]   30
    Click Element    //button[@class='btn-purchase btn-purchase--2' and contains(.,'Lower')]

*** Test Cases ***
Task3
Open Deriv page 
    Open page

Login To Deriv
    Login

Change To Demo Account
    Virtual

Set Forex Market
    Forex Market
    
Set Trade Condition
    Duration
    Payout

Trade on Rise
    Trade Rise