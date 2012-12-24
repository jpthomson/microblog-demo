Feature: Compose

    As a user
    When I am logged in
    I want to post a new bleat
    
    Scenario:
        Given I am authenticated
        When I compose a bleat with content "hey there!"
        Then the first bleat on my profile page should contain "hey there!"
