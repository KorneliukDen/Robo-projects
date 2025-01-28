*** Settings ***
Documentation    locators for biblus.in
Library    SeleniumLibrary


*** Variables ***
${MENU_BTN}                   //div[@id="header_menu"]
${MY_PROFILE_BTN}             //a[text()="Мой профиль"]
${TO_SING_IN_BTN}             //a[text()="Вход и регистрация"]
${SUBMIT_BTN}                 //button[@type="submit"]
${LOG_OUT}                    //a[text()="Выход из аккаунта"]
${ERROR}                      //div[@class="_79758c _d70541"]
${BOOKS}                      //a[@class="_3dc935"]
${OPENED_BOOK}                //div[@class="_c10a44"]
