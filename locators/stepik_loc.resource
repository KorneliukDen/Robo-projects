*** Settings ***
Documentation    locators for stepic.org
Library    SeleniumLibrary


*** Variables ***
${TO_COURSE_CREATING_BTN}        (//a[@class="tn-atom"])[1]
${TO_CREATE_FREE_COURSE_BTN}     //a[text()="Создать открытый курс"]
${TO_SING_FORM_BTN}              //button[@class="sign-form__btn button_with-loader "]
