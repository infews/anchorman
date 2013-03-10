Feature: Notes command
  In order to build a draft of release notes
  As a Release Engineer
  I want to process the git log

  Scenario: Git repo not present
    Given A directory without a git repo
    When I run `anchorman notes`
    Then the output should contain "No git repo found"
    And a directory named "anchorman" should not exist

  Scenario: No commits in the repo
    Given A git repo with no commits
    When I run `anchorman notes`
    Then the output should contain "No git log found"
    And a directory named "anchorman" should not exist

  Scenario: All commits
    Given A git repo with commits
    When I run `anchorman notes`
    Then the output should contain "commit(s) found"
    And a directory named "anchorman" should exist
    And a file named "anchorman/release_notes.md" should exist
    And the file "anchorman/release_notes.md" should match /^# Release Notes/
    And the file "anchorman/release_notes.md" should match /## Summary/
    And the file "anchorman/release_notes.md" should match /## Changes\s+(.)+/

  Scenario: Asking for notes from a starting git ref
    Given A repo with plenty of refs
    When I run `anchorman notes --from=tagA`
    Then the output should contain "2 commit(s) found"
    And a directory named "anchorman" should exist
    And a file named "anchorman/release_notes.md" should exist
    And the file "anchorman/release_notes.md" should match /^# Release Notes/
    And the file "anchorman/release_notes.md" should match /## Summary/
    And the file "anchorman/release_notes.md" should match /## Changes\s+(.)+/

  Scenario: Asking for notes from a starting and ending git ref
    Given A repo with plenty of refs
    When I run `anchorman notes --from=tagA --to=tagB`
    Then the output should contain "1 commit(s) found"
    And a directory named "anchorman" should exist
    And a file named "anchorman/release_notes.md" should exist
    And the file "anchorman/release_notes.md" should match /^# Release Notes/
    And the file "anchorman/release_notes.md" should match /## Summary/
    And the file "anchorman/release_notes.md" should match /## Changes\s+(.)+/
