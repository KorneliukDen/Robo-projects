** Settings ***
Documentation   keywords for biblus.in
Resource    ../web.resource
Resource    ../locators/biblus_loc.resource


*** Keywords ***
Authorization
    [Documentation]    authorization check
    Wait Until Element Is Visible    locator=${MENU_BTN}    timeout=10s
    Click Element    locator=${MENU_BTN}
    ${is_user_authorized}    Run Keyword And Return Status    Wait Until Element Is Visible
    ...    locator=${MY_PROFILE_BTN}    timeout=3s
    IF    not ${is_user_authorized}    Login

Login
    [Documentation]    Log in & Log out
    Click Element    locator=${TO_SING_IN_BTN}

    Input Text    locator=//input[@type="text"]    text=%{LOGIN_BIBLUS}
    Input Password    locator=//input[@type="password"]    password=%{PASSWORD_BIBLUS}

    Click Element    locator=${SUBMIT_BTN}

    Click Element    locator=${MENU_BTN}
    Wait Until Element Is Visible    locator=${MY_PROFILE_BTN}
    Click Element    locator=${LOG_OUT}

Book Author
    [Documentation]    checking that the correct book is opening
    Go To    url=https://biblus.in/authors/andrejj-krasnikov.html
    Wait Until Element Is Visible    locator=${BOOKS}
    @{books_list}=    Get WebElements    locator=${BOOKS}
    Execute JavaScript    window.scrollBy(0, window.innerHeight / 3)
    # Обработка первых 5 книг
    FOR    ${book}    IN    @{books_list}[0:5]
        Scroll Element Into View    locator=${book}
        ${name_book}=    Get Text    locator=${book}
        Click Link    locator=${book}    modifier=CONTROL
        Switch Window    locator=NEW
        Wait Until Element Is Visible    locator=${OPENED_BOOK}
        ${opened_name_book}    Get Text    locator=${OPENED_BOOK}
        Should Be Equal    first=${name_book}    second=${opened_name_book}
        Close Window
        Switch Window    locator=MAIN
    END
    # Скролл вниз для оставшихся книг
    Execute JavaScript    window.scrollBy(0, window.innerHeight / 1)

    # Обработка оставшихся книг
    FOR    ${book}    IN    @{books_list}[5:]
        Scroll Element Into View    locator=${book}
        ${name_book}=    Get Text    locator=${book}
        Click Link    locator=${book}    modifier=CONTROL
        Switch Window    locator=NEW
        Wait Until Element Is Visible    locator=${OPENED_BOOK}
        ${opened_name_book}    Get Text    locator=${OPENED_BOOK}
        Should Be Equal    first=${name_book}    second=${opened_name_book}
        Close Window
        Switch Window    locator=MAIN
    END

Invalid Data
    [Documentation]    authorization with invalid data
    [Arguments]    ${login}    ${password}

    Click Element    locator=${MENU_BTN}
    Wait Until Element Is Visible    locator=${TO_SING_IN_BTN}
    Click Element    locator=${TO_SING_IN_BTN}
    Input Text    locator=//input[@type="text"]    text=${login}
    Input Password    locator=//input[@type="password"]    password=${password}
    Click Element    locator=${SUBMIT_BTN}

    Wait Until Element Is Visible    ${ERROR}
