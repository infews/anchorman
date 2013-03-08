module Anchorman
  class CLI < Thor

    include Thor::Actions

    desc "generate", "Generates a draft release notes document"

    def generate
      commits = get_commits

      return unless commits.size

      empty_directory 'anchorman'

      create_file 'anchorman/release_notes.md' do
        "# Release Notes\n #{commits.first.sha}"
      end

    end

    no_tasks do

      def get_commits
        repo = Git.open('.')
        log = repo.log
        say "#{log.size} commit(s) found", :green
        log
      rescue ArgumentError
        say 'No git repo found', :red
      rescue Git::GitExecuteError
        say 'No git log found', :red
      end

    end
  end
end