Feature: Weights feature
  User can add and delete a weight from her cat's account

  Scenario: User can add and delete a weight
    Given  A user with a cat
    And    the user signs in successfully
    Then   the user adds a weight to her cats account
    Then   the user deletes a weight from her cats account
