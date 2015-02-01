Feature: Users features
  Users can create accounts and log in

  Scenario: Users can create an account
    Given Guest visits the landing_path
# Uncomment when feature is live
#    And   they click on the 'register' link

# Remove when feature is live
    Then  they visit the new user page

    Then  they fill out the new user form
    And   they see the user homepage



