*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${rise_button}  //div[@class='btn-purchase__text_wrapper' and contains(.,'Rise')]

*** Keywords ***
Open Deriv page 
    Open Browser    https://app.deriv.com/    chrome
    Maximize Browser Window
    Wait Until Page Contains Element    ${rise_button}    30
    Click Element    dt_login_button
    Wait Until Page Contains Element    //input[@type='email']    10

Login to Deriv 
    Input Text    //input[@type='email']    umairatul@besquare.com.my
    Input Text    //input[@type='password']    Umairatul2020# 
    Click Element    //button[@type='submit']

Virtual 
    Wait Until Page Contains Element    ${rise_button}   30
    Click Element    dt_core_account-info_acc-info 
    Click Element    dt_core_account-switcher_demo-tab
    Click Element    dt_VRTC6202252
    Wait Until Page Contains Element    ${rise_button}   30

Choose Market
    Wait Until Page Contains Element    //div[@class='cq-symbol-select-btn']    30
    Click Element    //div[@class='cq-symbol-select-btn']
    Wait Until Page Contains Element    //div[@class='sc-mcd__filter__item sc-mcd__filter__item--selected']    30
    Wait Until Page Contains Element    //div[@class='sc-mcd__filter__item ']    30
    Click Element    //div[@class='sc-mcd__filter__item ' and contains(.,'Forex')]
    Click Element    //div[@class='sc-mcd__item sc-mcd__item--frxAUDUSD ']
    Wait Until Page Contains Element    ${rise_button}   30

Trade Types
    Click Element    //div[@class='contract-type-widget__display']
    Click Element    dt_contract_high_low_item

Trade Condition
    Press Keys    //input[@name='duration']    BACKSPACE    BACKSPACE    
    Input Text    //input[@name='duration']    4
    Press Keys    //input[@name='barrier_1']    HOME    SHIFT+=
    Click Element    dc_payout_toggle_item
    Press Keys    //input[@type='tel']    BACKSPACE    BACKSPACE
    Input Text    //input[@type='tel']    10.00

Validation
    Wait Until Page Contains Element    //div[@class='trade-container__fieldset-wrapper trade-container__fieldset-wrapper--disabled' and contains(.,'Lower')]   30

*** Test Cases ***
Task4
    Open Deriv page 
    Login To Deriv
    Virtual
    Choose Market
    Trade Types
    Trade Condition
    Validation