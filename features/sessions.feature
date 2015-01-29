Feature: Sessions features
  Users can login and logout

  Scenario: User can login and logout
    Given Guest visits the landing_path
    And   they click on the signin link
    And   they fill out the signin form
    Then  they are logged into the site
    Then  they click the logout link
    Then  they are logged out of the site

