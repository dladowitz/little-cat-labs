Feature: Cat Features
  User can add cats to his account

  Scenario: User can add a first cat to her account
    Given  A user without a cat
    And    the user signs in successfully
    Then   user adds a cat to her account
    Then   user sees cats stats on dashboard

  Scenario: User can edit and delete her cat
    Given  A user with a cat
    And    the user signs in successfully
    Then   the user updates the cats name
    Then   the user deletes the cat


