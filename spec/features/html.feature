Feature: html command
  In order to build an HTML version of release notes
  As a Release Engineer
  I want to process the Markdown files into HTML

  Scenario: No Release Notes present
    Given A directory without a release_notes directory
    When I run `anchorman html`
    Then the output should contain "No release_notes directory found"
    Then the output should contain "Run 'anchorman notes' to generate release notes"

  Scenario: Release Notes present
    Given A directory with a release_notes directory
    When I run `anchorman html`
    Then the output should contain "2 note(s) found, generating HTML..."
    And a directory named "release_notes/html" should exist
    And a file named "release_notes/html/a.html" should exist
    And the file "release_notes/html/a.html" should contain "<h1>Release Notes A</h1>"
    And a file named "release_notes/html/b.html" should exist
    And the file "release_notes/html/b.html" should contain "<p>This was a minor release</p>"
