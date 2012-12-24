Feature: Compose

    As a user
    When I am logged in
    I want to post a new bleat
    
    Scenario:
        Given I am authenticated
        When I compose a bleat with content "hey there!"
        And I visit the home page
        Then the first bleat should contain "hey there!"
