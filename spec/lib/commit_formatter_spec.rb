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
      Anchorman::CommitFormatter.new.format(commit)
    end

    it "includes the SHA" do
      basic_note.should match /\* SHA: abc123/
    end

    it "includes the commit message" do
      basic_note.should match /\* Stay Classy, San Diego/
    end

    it "includes the author and email address" do
      basic_note.should match /\* Ron Burgundy, scotchyscotch@example.com/
    end
  end

  describe "when formatting a commit message with a Tracker 'Fixes/Finishes' message" do
    subject(:tracker_note) do
      author = double(:author,
                      name: "Ron Burgundy",
                      email: "scotchyscotch@example.com")
      commit = double(:commit,
                      author: author,
                      message: "[Fix #1234]",
                      sha: "abc123")

      Anchorman::CommitFormatter.new.format(commit)
    end

    it "links to the page for that story" do
      tracker_note.should match /\[Fix #1234\]\(http:\/\/www.pivotaltracker\.com\/story\/1234\)/
    end

  end
end
