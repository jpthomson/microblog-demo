Feature: Welcome panel

    As a new user
    When I visit the home page
    I should see a welcome panel
    
    Scenario: Welcome panel shown for unauthenticated users
        Given I am not authenticated
        When I visit the home page
        Then the "welcome" panel should be visible
        
    Scenario: Welcome panel hidden for authenticated users
        Given I am authenticated
        When I visit the home page
        Then the "welcome" panel should not be visible
