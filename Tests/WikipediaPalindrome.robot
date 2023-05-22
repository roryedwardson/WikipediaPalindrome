*** Settings ***
Documentation       This test suite uses the custom Python function palindrome.py to iterate through
...                 all the text on a Wikipedia page, and returns a list of all the words that are palindromes.
Resource            ../Resources/Common.robot
Resource            ../Resources/WikipediaPalindromeApp.robot
Test Setup          Begin Web Test
Test Teardown       End Web Test

#Run script
#robot -d results tests/WikipediaPalindrome.robot


*** Variables ***
${BROWSER} =        chrome
${URL} =            https://www.wikipedia.org/
${SEARCH_TERM} =    palindrome
@{RESULTS_LIST} =
${EMAIL} =          something@testname.net

*** Test Cases ***
Should be able to access landing page
    [Documentation]     Verify that user can access landing page
    [Tags]              001     Landing
    WikipediaPalindromeApp.Go to landing page

Should be able to enter a search query
    [Documentation]     Verify that user can submit search
    [Tags]              002     Landing
    WikipediaPalindromeApp.Go to landing page
    WikipediaPalindromeApp.Submit search

Should be able to view result page
    [Documentation]     Verify that result page loads as expected
    [Tags]              003     Result
    WikipediaPalindromeApp.Go to landing page
    WikipediaPalindromeApp.Submit search
    WikipediaPalindromeApp.Validate result page

Should be able to return list of palindromes from page
    [Documentation]     Verify that list of palindromes is returned
    [Tags]              004     Result
    WikipediaPalindromeApp.Go to landing page
    WikipediaPalindromeApp.Submit search
    WikipediaPalindromeApp.Validate result page
    WikipediaPalindromeApp.Scan page for palindromes


# Commented out the below email notification work.
# Exploring whether this is more straightforward to accomplish in Jenkins.


#Should be able to send list of palindromes as email notification
#    [Documentation]     Verify that user receives email notification containing palindromes
#    [Tags]              005
#    WikipediaPalindromeApp.Go to landing page
#    WikipediaPalindromeApp.Submit search
#    WikipediaPalindromeApp.Validate result page
#    WikipediaPalindromeApp.Scan page for palindromes
#    WikipediaPalindromeApp.Send email notification

# As I'd suspected, the above does not work due to ReCaptcha.


# 10minutemail is down just now - but could write test steps to:
# Navigate to https://10minutemail.com/
# Verify page loaded
# Create temp email address
# Verify temp address created
# Enter ${EMAIL} into address field
# Enter @{RESULTS_LIST} into body field (with line breaks)
# For ${Result} in @{RESULTS_LIST}, enter text ${Result}\n
#
# Click send
#
# This may fail if there's a captcha involved - need to add in a user input stage in that case.