*** Settings ***
Documentation    Standard authorization with invalid data
Resource         ../web.resource
Resource         biblus.resource
Test Setup       web.Precondition: Open Browser And Maximize    site_url=https://biblus.in/  browser=ff
Test Teardown    web.Postcondition: Close Browser


*** Test Cases ***
Authorization
    [Documentation]    Standard authorization with invalid data
    [Template]    Invalid Data
    # 1. Валидный логин и невалидный пароль
    %{LOGIN_BIBLUS}    invalid_password
    # 2. Невалидный логин и валидный пароль
    invalid_login    %{PASSWORD_BIBLUS}
    # 3. Невалидный логи и не валидный пароль
    invalid_login    invalid_password
