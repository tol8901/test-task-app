*** Settings ***
Documentation     A resource file with reusable keywords and variables.
...
...               The system specific keywords created here form our own
...               domain specific language. They utilize keywords provided
...               by the imported SeleniumLibrary.
Library           RPA.FileSystem
Library           Collections
Library           RPA.Browser.Selenium
Library           RPA.RobotLogListener

*** Variables ***
${SERVER}         www.aihitdata.com
${BROWSER}        Firefox
${DELAY}          0
${industry}       mortgage 
${location}       USA
${SEARCH URL}     httpS://${SERVER}/
${LOGIN URL}      http://${SERVER}/login?next=https%3A//www.aihitdata.com/
${COMPANIES_DIRECTORY}=    ${CURDIR}${/}output${/}companies/
${COMPANIES_LOCATOR}=    div[class="panel-body"]
${number_of_companies}=    30


*** Keywords ***
Input Industry
    [Arguments]    ${industry}
    Input Text    industry    ${industry}

Input Location
    [Arguments]    ${location}
    Input Text    location    ${location}

Submit Credentials for Search
    Click Element       //*[contains(text(),'Search')]

Hide element
    [Arguments]    ${locator}
    Mute Run On Failure    Execute Javascript
    Run Keyword And Ignore Error
    ...    Execute Javascript
    ...    document.querySelector('${locator}').style.display = 'none'

Hide distracting UI elements
    @{locators}=    Create List
    ...    nav
    ...    ins[class="adsbygoogle"]
    ...    div[class="panel panel-default"]
    ...    p[class="text-muted"]
    ...    div[class="cc_banner cc_container cc_container--open"]
    ...    ins[class="adsbygoogle"]
    ...    ul[class="pagination pagination-sm"]
    ...    footer
    FOR    ${locator}    IN    @{locators}
        Hide element    ${locator}
    END

Scrape ${number_of_companies} companies
    Click Element    class:panel-body>div>a
    Sleep    2s
    Press Keys   none     \ue00c
    Sleep    2s