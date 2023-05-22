*** Settings ***
Resource    ../Resources/PO/Landing.robot
Resource    ../Resources/PO/Result.robot
Resource    ../Resources/PO/Email.robot

*** Variables ***

*** Keywords ***
Go to landing page
    Landing.Navigate to
    Landing.Verify page loaded

Submit search
    Landing.Enter search term
    Landing.Click "search" button

Validate result page
    Result.Verify page loads as expected

Scan page for palindromes
    Result.Check palindromes

Send email notification
    Email.Send results email