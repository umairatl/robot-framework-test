*** Settings ***
Library  SeleniumLibrary

*** Variables ***

*** Keywords ***
Open Page 
    Set Selenium Speed    0.5
    Open Browser    https://app.deriv.com/account/closing-account    chrome
    Maximize Browser Window

Login to Deriv 
    Wait Until Page Contains Element    //input[@type='email']    10
    Input Text    //input[@type='email']    umairatul@besquare.com.my
    Input Text    //input[@type='password']    Umairatul2020#
    Click Element    //button[@type='submit']
    Wait Until Page Contains Element    //div[@class='notifications-toggle__icon-wrapper']    30

Information
    # Click Element    //a[@class='link']
    Click Element    //button[@class='dc-btn dc-btn--primary dc-btn__large closing-account__button--close-account']

Reason
    Checkbox Should Not Be Selected    //input[@class='dc-checkbox__input']
    Click Element    //input[@class='dc-checkbox__input']/../span
    Element Should Be Disabled   //button[@class='dc-btn dc-btn__effect dc-btn--primary dc-btn__large']
    # Input Text    //textarea[@name='other_trading_platforms']    Not interested anymore
    # Should Be True    //textarea[@name='other_trading_platforms'] < 110 
    # Click Element    //button[@class='dc-btn dc-btn__effect dc-btn--primary dc-btn__large']

Disable button

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
    Wait Until Page Contains Element    //span[@class='dc-text dc-btn__text' and contains(.,'Close account')]    20
    Click Element    //button[@class='dc-btn dc-btn__effect dc-btn--primary dc-btn__large' and contains(.,'Close account')]
    Wait Until Page Contains Element    //p[@class='dc-text account-closed']    20
    Page Should Contain Element    //p[@class='dc-text account-closed']

Bring user back to Homepage
    Wait Until Page Contains Element    //button[@class='button__Button-sc-st9s2a-0 right-section__StyledButton-sc-1a7ywrs-0 lojSBl jnaSfU']    20

*** Test Cases ***
Task 2    
    Open Page 
    Login to Deriv 
    Information
    Reason
    Input Validation
    # Confirm Delete