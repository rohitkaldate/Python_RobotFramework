*** Settings ***
Documentation    This is for understanding of radio-buttons, popup,checkboxes and switching
Library    SeleniumLibrary
Test Setup    Open the browser with url
Test Teardown    Close Browser Used
Resource    resource.robot

*** Test Cases ***
TEST CASE: Select the form and navigate to Child Window
    Fill the login Details and select User option



















