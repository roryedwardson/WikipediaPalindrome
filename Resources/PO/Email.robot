*** Settings ***
Library    SeleniumLibrary
Library    DateTime
Library    Dialogs

*** Variables ***
${timestamp} =  Get Current Date    result_format=%Y%m%d-%H%M

*** Keywords ***
#Burner email version only works if you pause execution to manually solve the captcha

Send results email
    go to               https://www.cs.email/compose
    input text          to              ${EMAIL}
    input text          subject         Palindrome Results ${timestamp}
    input text          body            ${RESULTS_LIST}
    click button        send

    wait until page contains element    //iframe[@title="reCAPTCHA"]
    pause execution

    sleep  3


#GMAIL VERSION requires you to log in again
#
#Send results email
#    go to               https://mail.google.com/mail/u/0/#inbox
#    click button        xpath=/html/body/div[7]/div[3]/div/div[2]/div[1]/div[1]/div/div
#
#    input text          :vw     ${EMAIL}
#    input text          :rd     Palindrome Results ${timestamp}
#    input text          :sm     ${RESULTS_LIST}
#    click element       :r3
#
#    sleep               3