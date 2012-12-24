Feature: Home page

    As a user
    When I visit the home page
    I should see the most recent bleats
    
    Scenario: Recent bleats
        Given 5 bleats exist
        And a bleat with the content "howdy!"
        When I visit the home page
        Then the first bleat should contain "howdy!"
        
    Scenario: Trending hashtags
        Given a bleat with the content "#winning"
        When I visit the home page
        Then "#winning" should be a trending hashtag

    Scenario: Welcome panel shown for unauthenticated users
        Given I am not authenticated
        When I visit the home page
        Then the "welcome" panel should be visible
        
    Scenario: Welcome panel hidden for authenticated users
        Given I am authenticated
        When I visit the home page
        Then the "welcome" panel should not be visible
