*** Settings ***
Documentation    To Validate the Login form
Library    SeleniumLibrary

*** Variables ***
${alert_locator}    css:.alert-danger    ##This variable is global variable

*** Test Cases ***
Validate Successful Login
    open the browser with the Mortgage payment url
    Fill the login Form
    wait until it check and display error message
    verify error message is correct

*** Keywords ***
open the browser with the Mortgage payment url
    Create Webdriver    Chrome
    Go To    https://rahulshettyacademy.com/loginpagePractise/

Fill the Login Form
    Input Text    id:username    rahulshettyacademy
    Input Password    id:password    1234567
    Click Button    id:signInBtn

wait until it check and display error message
    Wait Until Element Is Visible    ${alert_locator}

verify error message is correct
    ${result} =    Get Text    ${alert_locator}     ##${result} is the local variable
    Should Be Equal As Strings    ${result}    Incorrect username/password.
