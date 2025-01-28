*** Settings ***
Documentation    common keywords
Library    SeleniumLibrary


*** Keywords ***
Precondition: Open Browser And Maximize
    [Documentation]    Open Browser And Maximize
    [Arguments]    ${site_url}    ${browser}
    Open Browser    url=${site_url}    browser=${browser}
    Maximize Browser Window

Postcondition: Close Browser
    [Documentation]    Close Browser
    Close Browser
