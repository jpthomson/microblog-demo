Feature: Sign up with third party auth

    In order to sign up easiy
    As a user
    I want to sign up via third party authentication
    
    Scenario: User signs up using third party auth all details are provided
        When I sign up with developer authentication with user name: "Test" and email: "test@test.com"
        And I confirm my details
        Then a new user should be created with screen name "Test"
        And the content "Welcome" should be visible
    
    Scenario: User signs up using third party auth but no email is provided
        When I sign up with developer authentication with user name: "Test" and email: ""
        Then an "alert" should be visible
        And I should be able to enter a "user_email"
        
    Scenario: User signs up using third party auth but email is invalid
        When I sign up with developer authentication with user name: "Test" and email: "test"
        Then an "alert" should be visible
        And I should be able to enter a "user_email"
    
    Scenario: User signs up using third party auth but no email is provided
        When I sign up with developer authentication with user name: "" and email: "test@test.com"
        Then an "alert" should be visible
        And I should be able to enter a "user_screen_name"
    
    Scenario: User corrects missing or invalid details from third party auth and signs up
        When I sign up with developer authentication with user name: "" and email: ""
        And I enter user name: "Test" and email: "test@test.com"
        Then a new user should be created with screen name "Test"
        And the content "Welcome" should be visible
        