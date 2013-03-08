module Anchorman
  class CLI < Thor

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

    end
  end
end