Feature: tasks

  Scenario: Check for new trending sites
    Given download new list of top "1,000" trending sites from last 7 days
    Then compare new list with existing list of sites