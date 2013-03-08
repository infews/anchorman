module Anchorman
  class CommitFormatter

    def self.format(commit)
      note = "* SHA: #{commit.sha}"
      note << "    * #{commit.message}"
      note << "    * #{commit.author.name}, #{commit.author.email}"
      note
    end
  end
end