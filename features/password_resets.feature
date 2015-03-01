Feature: Password Reset
  Scenario: Users can reset a forgotten password
  Given  A user with a cat
  And    the user requests a new password
  And    the user resets the password
  Then   the user logs in with her new password


