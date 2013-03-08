module Anchorman
  class CommitFormatter < Struct.new(:repo)

    def format(commit)
      note = "* SHA: #{commit.sha}"
      note << "    * #{commit.message}"
      note << "    * #{commit.author.name}, #{commit.author.email}"
      note
    end
  end
end