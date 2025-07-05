*** Settings ***
Documentation    Adding the different set of parameter to login
Library    SeleniumLibrary
Library    DataDriver
Test Teardown    Close Browser Used
Test Template    Validate The Login With Different Parameters
Resource    resource.robot

*** Variables ***
${alert_locator}    css:.alert-danger


*** Test Cases ***    username    password
Invalid username     dsahed    learning
Invalid password    rohit123    pjfoshfs
Special characters    @#%!    learning

*** Keywords ***
Validate The Login With Different Parameters
    [Arguments]    ${username}    ${password}
    open the browser with the Mortgage payment url
    Fill the login Form    ${username}    ${password}
    wait until it check and display error message
    verify error message is correct


open the browser with the Mortgage payment url
    Create Webdriver    Chrome
    Go To    https://rahulshettyacademy.com/loginpagePractise/

Fill the Login Form
    [Arguments]    ${username}    ${password}
    Input Text    id:username    ${username}
    Input Password    id:password    ${password}
    Click Button    id:signInBtn

wait until it check and display error message
    Wait Until Element Is Visible    ${alert_locator}

verify error message is correct
    ${result} =    Get Text    ${alert_locator}     ##${result} is the local variable
    Should Be Equal As Strings    ${result}    Incorrect username/password.
