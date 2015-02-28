Feature: Users features
  Users can create accounts and log in

  Scenario: Users can create an account
    Given Guest visits the landing_path
    Then  they visit the new user page
    Then  they fill out the new user form
    And   they see the user homepage


  Scenario: Users can change account details
    Given  A user with a cat
    And    the user signs in successfully
    Then   the user visits his profile page
    Then   the user changes her name and password
    Then   they click the logout link
    Then   the user logs in with her new password



