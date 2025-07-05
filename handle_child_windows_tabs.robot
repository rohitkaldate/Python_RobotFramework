*** Settings ***
Documentation    In this we are handling the child windows and the tabs
Library    SeleniumLibrary
Library    String
Library    Collections
Test Setup    Open the browser with url
Test Teardown    Close Browser Used
Resource    resource.robot

*** Test Cases ***
TEST CASE: Handling the child windows and tabs
    Select Child Link
    Verify Switched to Child Window
    Grab Email Id
    Switch Parent Window


*** Keywords ***
Select Child Link
    Click Element    css:.blinkingText

Verify Switched to Child Window
    Switch Window    NEW
    Get Text    css:.inner-box

Grab Email Id
    ${text}=    Get Text    css:.red
    @{words}=    Split String    ${text}    at
    ${text_split}=    Get From List    ${words}    1
    @{words1}=    Split String    ${text_split}
    ${email_id}=    Get From List    ${words1}    0

Switch Parent Window
    Switch Window    MAIN
    Title Should Be    LoginPage Practise | Rahul Shetty Academy
