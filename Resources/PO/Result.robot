*** Settings ***
Library     SeleniumLibrary
Library     ../Libraries/palindrome.py
Library     ../Libraries/strip_punctuation.py
Library     Collections
Library     String

*** Variables ***
#${CurrentWord} =    madam I'm Adam
#${PageText} =       []

*** Keywords ***
Verify page loads as expected
    wait until page contains element    css=#firstHeading
    page should contain                 ${SEARCH_TERM}

Check palindromes
    wait until page contains element    //*[@id="mw-content-text"]
    ${elements} =   Get Text            //*[@id="mw-content-text"]
    ${elements_list} =  Split String    ${elements}
    log     ${elements_list}
    FOR     ${element}   IN             @{elements_list}
            ${Pal_Result} =             is palindrome   ${element}
            Run Keyword If              ${Pal_Result} == True   Append To List      ${RESULTS_LIST}     ${element}
    END

    FOR     ${Result}   IN              @{RESULTS_LIST}
            ${Result} =                 strip punctuation    ${Result}
    END

    log    ${RESULTS_LIST}

