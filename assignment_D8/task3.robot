*** Settings ***
Library  SeleniumLibrary

*** Variables ***

*** Keywords ***
Open Page 
    Set Selenium Speed    0.5
    Open Browser    https://app.deriv.com/account/api-token    chrome
    Maximize Browser Window

Login to Deriv 
    Wait Until Page Contains Element    //input[@type='email']    10
    Input Text    //input[@type='email']    umairatul@besquare.com.my
    Input Text    //input[@type='password']    Umairatul2020#
    Click Element    //button[@type='submit']

API Setting Validation 
    Wait Until Page Contains Element    //input[@name='token_name']    20
    Page Should Contain Element    //article[@class='da-article']
    Checkbox Should Not Be Selected    //input[@class='dc-checkbox__input']
    Element Should Be Disabled    //button[@class='dc-btn dc-btn__effect dc-btn--primary dc-btn__large dc-btn__button-group da-api-token__button']

Create First Token
    Click Element    //input[@name='read']/../span
    Click Element    //input[@name='admin']/../span
    Input Text    //input[@name='token_name']    Token1
    Click Element    //button[@class='dc-btn dc-btn__effect dc-btn--primary dc-btn__large dc-btn__button-group da-api-token__button']

Validate First Token
    Wait Until Page Contains Element    //td[@class='da-api-token__table-cell da-api-token__table-cell--name']    20
    Page Should Contain Element    //td[@class='da-api-token__table-cell da-api-token__table-cell--name' and contains(.,'Token1')]
    Page Should Contain Element    //div[@class='da-api-token__table-scope-cell' and contains(.,'Read')]
    Page Should Contain Element    //div[@class='da-api-token__table-scope-cell da-api-token__table-scope-cell-admin' and contains(.,'Admin')]

Copy First Token    
    Click Element    //*[@data-testid='dt_toggle_visibility_icon']
    Click Element    //*[@data-testid='dt_copy_token_icon']
    Click Element    //button[@class='dc-btn dc-btn__effect dc-btn--primary dc-btn__large dc-dialog__button']

Create Second Token
    Click Element    //input[@name='read']/../span
    Click Element    //input[@name='admin']/../span
    Input Text    //input[@name='token_name']    Token1
    Click Element    //button[@class='dc-btn dc-btn__effect dc-btn--primary dc-btn__large dc-btn__button-group da-api-token__button']


Validate First and Second Token Keys
    # Element Should Not Be 
    # Click Element    //*[@data-testid='dt_toggle_visibility_icon']
    # Get Text    //div[@class='da-api-token__clipboard-wrapper'] 
    # Should Not Be Equal As Strings   //div[@class='da-api-token__clipboard-wrapper']    //div[@class='da-api-token__clipboard-wrapper']
# //tr[@class='da-api-token__table-cell-row']
    
Delete Token
    Click Element    //*[@data-testid='dt_token_delete_icon']
    Click Element    //button[@class='dc-btn dc-btn__effect dc-btn--primary dc-btn__large dc-dialog__button']


*** Test Cases ***
Task 1    
    Open Page
    Login to Deriv
    API Setting Validation
    Create First Token
    Validate First Token
    Copy First Token    
    Create Second Token
    # Validate First and Second Token Keys
    # Delete Token