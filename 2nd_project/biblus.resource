#Привет!

#biblus.resource:29:1 [W] 0503 Keyword 'Book Author' has too many keywords inside (27/10)
# (too-many-calls-in-keyword) - Не понял как я одлжен это исправить 
#biblus.resource:33:5 [W] 0909 The assignment sign is not consistent within the file.
#  Expected '' but got '=' instead (inconsistent-assignment) - Здесь не понимаю почему это считается
#  ошибкой. @{books_list}=    Get WebElements    locator=${BOOKS} - формируется список из названия книг


#Слипы убрал, они здесь оказались не нужны.

#Я пытался сделать все в один тест, но Data Driven никак не хотел работать вместе со всем остальным
если подскажешь как это сделать буду благодарен

#Было бы неплохо сделать обратную связь там куда мы сдаем работы, чтобы не писать это тут


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
