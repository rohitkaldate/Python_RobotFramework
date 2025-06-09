*** Settings ***
Documentation    A resource file is with reusable keywords and variables.
...    The system specific keywords created in this file from your own
...    to domain specific language. They utilize keywords provided by selenium library
Library    SeleniumLibrary


*** Variables ***
${user_name}    rahulshettyacademy
${invalid_pass}    1234567
${valid_pass}    learning
${url}    https://rahulshettyacademy.com/loginpagePractise/

*** Keywords ***
Open the browser with url
    Create Webdriver    Chrome
    Go To    ${url}

Fill the Login Form
    [Arguments]    ${username}    ${password}
    Input Text    id:username    ${username}
    Input Password    id:password    ${password}
    Click Button    id:signInBtn


Close Browser Used
    Close Browser