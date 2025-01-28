*** Settings ***
Documentation    keywords for stepik.org
Resource    ../web.resource
Resource    ../locators/stepik_loc.resource


*** Keywords ***
To Course Creating Landing
    [Documentation]     Go to course landing

    Wait Until Element Is Visible    locator=${TO_COURSE_CREATING_BTN}    timeout=10s
    Click Element    locator=${TO_COURSE_CREATING_BTN}

To Free Course Create
    [Documentation]    go to course

    Wait Until Element Is Visible    ${TO_CREATE_FREE_COURSE_BTN}    timeout=10s
    Click Element    ${TO_CREATE_FREE_COURSE_BTN}

To Sing Form
    [Documentation]     waiting for sing in button
    Wait Until Element Is Visible    locator=${TO_SING_FORM_BTN}    timeout=10s
