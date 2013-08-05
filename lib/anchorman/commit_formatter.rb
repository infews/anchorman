module Anchorman
  class CommitFormatter

    def format(commit)
      note =  "* #{format_message(commit.message)}\n"
      note << "    * SHA: #{commit.sha}\n"
      note << "    * #{commit.author.name}, #{commit.author.email}\n"
      note
    end

    private

    def format_message(msg)
      link_tracker_stories(msg)
    end

    def link_tracker_stories(msg)
      msg.gsub(/\[(.*)#(\d+)\]/) do
        "[#{$1}##{$2}](http://www.pivotaltracker.com/story/#{$2})"
      end
    end
  end
end