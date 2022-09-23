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
    Wait Until Page Contains Element    //div[@class='sc-mcd__item sc-mcd__item--R_50 ']    30
    Click Element    //div[@class='sc-mcd__item__name' and contains(.,'Volatility 50 Index')]    
    Wait Until Page Contains Element    ${rise_button}   30

Trade Types
    Click Element    //div[@class='contract-type-widget__display']
    Click Element    dt_contract_multiplier_item
Validate Payout None
    Element Should Not Contain    //div[@class='trade-container__fieldset-header trade-container__fieldset-header--inline']    Payout
Condition
    Click Element    //input[@id='dt_cancellation-checkbox_input']/../span
    Click Element    //input[@id='dc_stop_loss-checkbox_input']/../span
    Checkbox Should Be Selected    dc_stop_loss-checkbox_input
    Checkbox Should Not Be Selected    dt_cancellation-checkbox_input
    Click Element    //input[@id='dc_stop_loss-checkbox_input']/../span
    Click Element    //input[@id='dt_cancellation-checkbox_input']/../span


*** Test Cases ***
Task5
    Open Deriv page 
    Login To Deriv
    Virtual
    Choose Market
    Trade Types
    Validate Payout None