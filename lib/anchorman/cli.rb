module Anchorman
  class CLI < Thor

    include Thor::Actions

    desc "generate", "Generates a draft release notes document"
    def generate
      commits = get_commits

      return unless commits.size

      say "#{commits.size} commit(s) found - building notes", :green

      empty_directory 'anchorman'

      header = "# Release Notes\n\n ## Summary\n\n ## Changes\n\n"
      notes =  commits.collect {|c| CommitFormatter.format(c) }.join("\n\n")

      create_file 'anchorman/release_notes.md' do
        header + notes
      end

    end

    no_tasks do

      def get_commits
        repo = Git.open('.')
        log = repo.log
        log.size # this is the line that will throw if no repo or no commits
        log
      rescue ArgumentError
        say 'No git repo found', :red
      rescue Git::GitExecuteError
        say 'No git log found', :red
      end

    end
  end
end