Feature: Generate
  In order to build a draft of release notes
  As a Release Engineer
  I want to process the git log

  Scenario: Git repo not present
    Given A directory without a git repo
    When I run `anchorman generate`
    Then the output should contain "No git repo found"

  Scenario: No commits in the repo
    Given A git repo with no commits
    When I run `anchorman generate`
    Then the output should contain "No git log found"
