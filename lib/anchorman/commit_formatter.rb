module Anchorman
  class CommitFormatter < Struct.new(:repo)

    def format(commit)
      note = "* SHA: #{repo.commit_url(commit.sha)}\n"
      note << "    * #{format_message(commit.message)}\n"
      note << "    * #{commit.author.name}, #{commit.author.email}\n"
      note
    end

    private

    def format_message(msg)
      link_tracker_stories(msg)
    end

    def link_tracker_stories(msg)
      msg.gsub(/\[(.*)#(\d+)/) do
        "[#{$1}##{$2}](http://www.pivotaltracker.com/story/#{$2}"
      end
    end
  end
end