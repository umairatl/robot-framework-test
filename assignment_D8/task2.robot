*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${accountClosed}    //p[@class='dc-text account-closed']
${closeButton}    //button[@class='dc-btn dc-btn__effect dc-btn--primary dc-btn__large']

*** Keywords ***
Open Page 
    Set Selenium Speed    0.5
    Open Browser    https://app.deriv.com/account/closing-account    chrome
    Maximize Browser Window

Login
    Wait Until Page Contains Element    //input[@type='email']    10
    Input Text    //input[@type='email']    email
    Input Text    //input[@type='password']    password
    Click Element    //button[@type='submit']
    Wait Until Page Contains Element    //div[@class='notifications-toggle__icon-wrapper']    30

PDF link
    Click Element    //a[@class='link']

Closing button
    Click Element    //button[@class='dc-btn dc-btn--primary dc-btn__large closing-account__button--close-account']

Validate checkbox
    Checkbox Should Not Be Selected    //input[@class='dc-checkbox__input']

Disable button
    Element Should Be Disabled    ${closeButton}

Enable button 
    Click Element    //input[@class='dc-checkbox__input']/../span
    Element Should Be Enabled    ${closeButton}

Input Validation
    Input Text    //textarea[@name='other_trading_platforms']    Not interested anymore
    Input Text    //textarea[@name='do_to_improve']    Reason to improve
    ${descvalue}=    Get Text    //textarea[@name='other_trading_platforms'] 
    ${descvalue2}=    Get Text    //textarea[@name='do_to_improve'] 
    ${length1}=    Get Length    ${descvalue} 
    ${length2}=    Get Length    ${descvalue2} 
    ${totalLength}=    Evaluate    ${length1}+${length2}    
    Should Not Be Equal As Integers     ${totalLength}    110

Confirm Delete
    Click Element    ${closeButton}
    Wait Until Page Contains Element    //span[@class='dc-text dc-btn__text' and contains(.,'Close account')]    20
    Click Element    //button[@class='dc-btn dc-btn__effect dc-btn--primary dc-btn__large' and contains(.,'Close account')]
    Wait Until Page Contains Element    ${accountClosed}     20
    Page Should Contain Element    ${accountClosed} 

*** Test Cases ***
Open Deriv Setting Page  
    Open Page 

Login into Deriv
    Login 

"Security & Policy" hyperlink returns a pdf file
    PDF link
    
"Closing my account" button leads to next section
    Closing button

Disable "Continue" button if checkbox unselected
    Disable button

Checkboxes should be unselect 
    Validate checkbox
    
Enable "Continue" button if checkbox selected by 1
    Enable button
    
Validate Input Character field (max: 110)
    Input Validation

"Closing my account" validation
    Confirm Delete