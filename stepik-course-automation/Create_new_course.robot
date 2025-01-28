*** Settings ***
Documentation    Creating new course
Resource    stepik.resource
Library    SeleniumLibrary
Test Setup    web.Precondition: Open Browser And Maximize    site_url=https://teach.stepik.org/ru    browser=gc
Test Teardown    web.Postcondition: Close Browser


*** Test Cases ***
Create course
    [Documentation]    Creating new course
    To Course Creating Landing
    To Free Course Create
    To Sing Form
