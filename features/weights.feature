Feature: Weights feature
  User can add and delete a weight from her cat's account

  Scenario: User can add and delete a weight
    Given  A user with a cat
    And    the user signs in successfully
    Then   the user adds a weight in decimal to her cats account

#    Need to enable javascript for this to work
#    Then   the user adds a weight in pounds and ounces to her cats account

    Then   the user deletes a weight from her cats account
