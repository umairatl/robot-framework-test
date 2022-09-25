*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${firstToken}=    Get Text    //div[@class='da-api-token__clipboard-wrapper'] 

*** Keywords ***
Open Page 
    Set Selenium Speed    0.5
    Open Browser    https://app.deriv.com/account/api-token    chrome
    Maximize Browser Window
Login
    Wait Until Page Contains Element    //input[@type='email']    10
    Input Text    //input[@type='email']    email
    Input Text    //input[@type='password']    password
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
Get First Token
    ${firstToken}=    Get Text    //div[@class='da-api-token__clipboard-wrapper'] 
Create Second Token
    Click Element    //input[@name='read']/../span
    Click Element    //input[@name='admin']/../span
    Input Text    //input[@name='token_name']    Token1
    Click Element    //button[@class='dc-btn dc-btn__effect dc-btn--primary dc-btn__large dc-btn__button-group da-api-token__button']
Validate First and Second Token Keys
    ${secondToken}=    Get Text    //div[@class='da-api-token__clipboard-wrapper'] 
    Should Not Be Equal As Strings   ${secondToken}    ${firstToken}
Delete Token
    Click Element    //*[@data-testid='dt_token_delete_icon']
    Click Element    //button[@class='dc-btn dc-btn__effect dc-btn--primary dc-btn__large dc-dialog__button']

*** Test Cases ***
Open API Token page  
    Open Page

Login to Deriv
    Login

Validate page    
    API Setting Validation

Create First Toke
    Create First Token

Validate First Token
    Validate First Token

Copy function validation 
    Copy First Token    

Create second token with same name and scope (validate keys are unique)
    Get First Token
    Create Second Token
    Validate First and Second Token Keys

Delete Token
    Delete Token
    