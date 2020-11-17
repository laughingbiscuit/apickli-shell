Feature:
  As a user
  I want to list files
  So that I can navigate the filesystem

  Scenario: I successfully list files
    Given I set variable MSG to "Hello World"
    When I successfully run echo $MSG
    Then result contains "Hello World"
