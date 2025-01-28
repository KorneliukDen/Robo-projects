*** Settings ***
Documentation    Checking log in and opened books
Resource         ../web.resource
Resource         biblus.resource
Test Setup       web.Precondition: Open Browser And Maximize    site_url=https://biblus.in/  browser=ff
Test Teardown    web.Postcondition: Close Browser


*** Test Cases ***
Cheking log in & books
    [Documentation]    Checking log in and opened books
    Authorization
    Book Author
