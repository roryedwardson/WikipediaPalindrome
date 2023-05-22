*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${LANDING_NAVIGATION_ELEMENT} =         //*[@id="www-wikipedia-org"]/div[1]/h1

*** Keywords ***
Navigate to
    go to                               ${URL}

Verify page loaded
    wait until page contains element    ${LANDING_NAVIGATION_ELEMENT}

Enter search term
    wait until page contains element    id=searchInput
    input text                          id=searchInput      ${SEARCH_TERM}

Click "search" button
    click button                        //*[@id="search-form"]/fieldset/button