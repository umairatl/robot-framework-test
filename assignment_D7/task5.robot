*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${rise_button}  //div[@class='btn-purchase__text_wrapper' and contains(.,'Rise')]
${email}     //input[@type='email']   
${volatilityIndex}    //div[@class='sc-mcd__item__name' and contains(.,'Volatility 50 Index')] 
${multiplierVal}    //div[@class='dc-themed-scrollbars dc-themed-scrollbars__autohide']
${amountField}    //input[@name='amount']
${actValues}=    20    40    60    100    200
${cancellation}    //div[@class='dc-list dc-list--left']
${cancellationVal}    5    10    15    30    60

*** Keywords ***
Landing Page 
    Set Selenium Speed    0.5
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

Market Type
    Wait Until Page Contains Element    //div[@class='cq-symbol-select-btn']    30
    Click Element    //div[@class='cq-menu-btn']
    Wait Until Page Contains Element    //div[@class='sc-mcd__filter__item sc-mcd__filter__item--selected']    30
    Wait Until Page Contains Element    ${volatilityIndex}    30
    Click Element     ${volatilityIndex}   
    Wait Until Page Contains Element    ${rise_button}   30

Trade Types
    Click Element    //div[@class='contract-type-widget__display']
    Wait Until Page Contains Element    //div[@class='contract-type-list__wrapper']    10
    Click Element    dt_contract_multiplier_item
Validate Only Stake
    Element Should Not Contain    //div[@class='trade-container__fieldset-header trade-container__fieldset-header--inline']    Payout
    
Stake Min/Max
    ${getInteger}=    Get Value    ${amountField}
    Should Not Be Equal As Integers    ${getInteger}    1
    Should Not Be Equal As Integers    ${getInteger}    2000

Multiplier Values
    FOR  ${multiplierVal}  IN  ${actValues}
        Log    ${multiplierVal}
    END
    
Cancel Duration Values
    FOR  ${cancellation}  IN  ${multiplierVal}
        Log    ${cancellation}
    END

Plus Button
    ${getInteger2}=    Get Value    ${amountField} 
    Click Element    //button[@id='dt_amount_input_add']   
    ${addAmount}=    Evaluate    ${getInteger2}+1  
    ${newValue}=    Get Value    ${amountField} 
    Should Be Equal As Integers    ${newValue}    ${addAmount}   
Minus Button
    ${getInteger2}=    Get Value    ${amountField} 
    Click Element    //button[@id='dt_amount_input_sub']   
    ${minusAmount}=    Evaluate    ${getInteger2}-1  
    ${newValue}=    Get Value    ${amountField}
    Should Be Equal As Integers    ${newValue}    ${minusAmount}

Select Profit/Loss
    Click Element    //input[@id='dc_take_profit-checkbox_input']/../span
    Click Element    //input[@id='dc_stop_loss-checkbox_input']/../span

Cancellation Validation
    Checkbox Should Not Be Selected    dt_cancellation-checkbox_input
    
Profit/Loss Validation
    Click Element    //input[@id='dt_cancellation-checkbox_input']/../span
    Wait Until Page Contains Element    //div[@class='btn-purchase__info btn-purchase__info--left']
    Checkbox Should Not Be Selected    dc_stop_loss-checkbox_input
    Checkbox Should Not Be Selected    dc_take_profit-checkbox_input

*** Test Cases ***
Open Deriv Page
    Landing Page

Login into Deriv
    Login

Go to Virtual Account
    Virtual

Set Market and Trade Types
    Market Type
    Trade Types

Only stake is allowed.
    Validate Only Stake

Validate Min/Max Stake
    Stake Min/Max

Validate Multiplier value selection
    Multiplier Values

Validate Deal cancellation duration
    Cancel Duration Values

Validate Single click on plus (+)
    Plus Button

Validate Single click on minus (-)
    Minus Button
    
Only deal cancellation or take profit/stop loss is allowed
    Select Profit/Loss
    Cancellation Validation
    Select Profit/Loss
    Profit/Loss Validation