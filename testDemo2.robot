*** Settings ***
Documentation    To Validate the Login form
Library    SeleniumLibrary
Test Setup    Open the browser with url
Test Teardown    Close Browser Used
Resource    resource.robot

*** Variables ***
${alert_locator}    css:.alert-danger
${pass}    css:.nav-link
${add}    css:.btn-info

*** Test Cases ***
Validate Successful Login
    Fill the login Form    ${user_name}    ${invalid_pass}
    wait until it check and display    ${alert_locator}
    verify error message is correct

Validate Cards Displayed
    Fill the login Form    ${user_name}    ${valid_pass}
    wait until it check and display   ${pass}
    Verify Card Names

*** Keywords ***
wait until it check and display
    [Arguments]    ${element}
    Wait Until Element Is Visible    ${element}

Verify Card Names
    @{expected_list} =    Create List    iphone X    Samsung Note 8    Nokia Edge    Blackberry
    ${elements} =    Get Webelements    css:.card-title
    FOR    ${element}    IN    @{elements}
        Log    ${element.text}
    END

verify error message is correct
    ${result} =    Get Text    ${alert_locator}     ##${result} is the local variable
    Should Be Equal As Strings    ${result}    Incorrect username/password.