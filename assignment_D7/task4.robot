*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${rise_button}  //div[@class='btn-purchase__text_wrapper' and contains(.,'Rise')]
${email}    //input[@type='email']
${symbolButton}    //div[@class='cq-symbol-select-btn']
${duration}    //input[@name='duration']

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

Trade Types
    Click Element    //div[@class='contract-type-widget__display']
    Click Element    dt_contract_high_low_item

Set Duration
    Press Keys    ${duration}    BACKSPACE    BACKSPACE    
    Input Text    ${duration}    4
    Press Keys    //input[@name='barrier_1']    HOME    SHIFT+=
    Click Element    dc_payout_toggle_item

Set Payout
    Press Keys    //input[@type='tel']    BACKSPACE    BACKSPACE
    Input Text    //input[@type='tel']    10.00

Validation
    Wait Until Page Contains Element    //div[@class='trade-container__fieldset-wrapper trade-container__fieldset-wrapper--disabled' and contains(.,'Lower')]   30

*** Test Cases ***
Task4

Open Deriv page 
    Open page

Login To Deriv
    Login

Change to Demo account & validate
   Virtual

Choose Forex Market
    Forex Market

Choose High/Low Types
    Trade Types

Trade Conditions
    Set Duration
    Set Payout
    Validation