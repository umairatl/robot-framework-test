*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${login_button}  //button[@id='dt_login_button']

*** Test Cases ***
# 1. define test case name
Login To Deriv 
    Open Browser    https://app.deriv.com/    chrome
    Maximize Browser Window
    Wait Until Page Contains Element    //div[@class='btn-purchase__text_wrapper' and contains(.,'Rise')]    30
    Click Element    dt_login_button
    Wait Until Page Contains Element    //input[@type='email']    10
    Input Text    //input[@type='email']    umairatul@besquare.com.my
    Input Text    //input[@type='password']    Umairatul2020# 
    Click Element    //button[@type='submit']
    Wait Until Page Contains Element     dt_core_account-info_acc-info    30

    # robot login.robot