Feature: Compose

    As a user
    When I am logged in
    I want to post a new bleat
    
    Scenario:
        Given I am authenticated
        And I have 5 bleats
        When I compose a bleat with content "hey there!"
        And I visit my profile
        Then the first bleat should contain "hey there!"
