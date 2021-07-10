***Settings***
Documentation    A test suite with a single Gherkin style test.

Resource         resource-2.robot
Resource         login-2.robot
Test Teardown    Close Browser

***Test Cases***
Search of companies
    Given browser is opened to login page
    When user "tol890@ukr.net" logs in with password "Hit7244.;K"
    Then user inputs values in search fields
    Then hide distracting UI elements
    Then scrape 30 companies
    [Teardown]   Close Browser

***Keywords***
Browser is opened to login page
    Open browser to login page

User "${username}" logs in with password "${password}"
    Input username    ${username}
    Input password    ${password}
    Submit credentials

User inputs values in search fields
    Input Industry    ${industry}
    Input Location    ${location}
    Submit Credentials for Search