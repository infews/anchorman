require 'spec_helper'

describe Anchorman::CommitFormatter do

  describe ".format" do
    subject(:basic_note) do
      author = double(:author,
                      name: "Ron Burgundy",
                      email: "scotchyscotch@example.com")
      commit = double(:commit,
                      author: author,
                      message: "Stay Classy, San Diego",
                      sha: "abc123")
      Anchorman::CommitFormatter.format(commit)
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
end