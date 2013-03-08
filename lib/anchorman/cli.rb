module Anchorman
  class CLI < Thor

    include Thor::Actions

    desc "generate", "Generates a draft release notes document"

    def generate
      commits = begin
        repo = Git.open('.')
        log = repo.log
        say "#{log.size} commit(s) found"
        log
      rescue ArgumentError
        puts "No git repo found"
      rescue Git::GitExecuteError
        puts "No git log found"
      end

      return unless commits.size

      empty_directory 'anchorman'

      create_file 'anchorman/release_notes.md' do

        "# Release Notes\n #{commits.first.sha}"
      end

    end

  end
end