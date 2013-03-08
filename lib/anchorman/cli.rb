module Anchorman
  class CLI < Thor

    desc "generate", "Generates a draft release notes document"

    def generate
      commits = begin
        repo = Git.open('.')
        commits = repo.log
        say "#{commits.size} commit(s) found"
        commits
      rescue ArgumentError
        puts "No git repo found"
      rescue Git::GitExecuteError
        puts "No git log found"
      end

    end
  end
end