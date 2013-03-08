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

  Scenario: Commits, but no tags
    Given A git repo with commits
    When I run `anchorman generate`
    Then the output should contain "commit(s) found"
    And a directory named "anchorman" should exist
    And a file named "anchorman/release_notes" should exist
    And the file named "anchorman/release_notes" should contain: "# Release Notes"
