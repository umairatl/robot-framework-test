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
    Wait Until Page Contains Element    //div[@class='sc-mcd__filter__item sc-mcd__filter__item--selected']    50
    Click Element    //div[@class='sc-mcd__item sc-mcd__item--1HZ10V ']
    Wait Until Page Contains Element    ${rise_button}   30

Trade Condition
    Press Keys    //input[@type='tel']    BACKSPACE    BACKSPACE
    Input Text    //input[@type='tel']    10
    Click Element    //span[@data-testid='tick_step_1']
    Click Element    //span[@data-testid='tick_step_5']

Trade Rise
    Wait Until Page Contains Element    dt_purchase_call_button    30
    Click Element    dt_purchase_call_button

*** Test Cases ***
Task2
    Open Deriv page 
    Login To Deriv
    Virtual
    Choose Market
    Trade Condition
    Trade Rise