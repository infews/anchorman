require 'spec_helper'

describe Anchorman::CommitFormatter do

  describe "when formatting a basic commit message" do
    subject(:basic_note) do
      author = double(:author,
                      name: "Ron Burgundy",
                      email: "scotchyscotch@example.com")
      commit = double(:commit,
                      author: author,
                      message: "Stay Classy, San Diego",
                      sha: "abc123")
      Anchorman::CommitFormatter.new(double("repo")).format(commit)
    end

    it "includes the SHA" do
      basic_note.should match /^\* SHA: abc123/
    end

    it "includes the commit message" do
      basic_note.should match /\* Stay Classy, San Diego/
    end

    it "includes the author and email address" do
      basic_note.should match /\* Ron Burgundy, scotchyscotch@example.com/
    end
  end

  describe "when formatting a commit message that came from a github remote" do

    it "links the SHA back to the github commit" do
      pending "need to set up and get github URL"
      github_note.should match /^\* SHA: \[abc123\]\(http:\/\/github\.com\/foobar\/myrepo\/commits\/abc123\)/
    end

  end

  describe "when formatting a commit message with a github Issue 'Fixes' message" do

    it "links to the page for that issue" do
      pending "need to set up and get github URL"
      github_note_with_issue.should match /http:\/\/github\.com\/foobar\/myrepo\/issues\/12/
    end

  end

  describe "when formatting a commit message with a Tracker 'Fixes/Finishes' message" do

    it "links to the page for that story" do
      pending "need to set up"
      tracker_note.should match /http:\/\/www.pivotaltracker\.com\/story\/1234/
    end

  end
end
